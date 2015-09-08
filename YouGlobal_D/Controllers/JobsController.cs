using AjaxControlToolkit;
using GlobalPanda.BusinessInfo;
using GlobalPanda.DataProviders;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Web.Mvc;
using YG_Business;
using YG_MVC.Models;

namespace YG_MVC.Controllers
{
    [HandleError]
    public class JobsController : BaseController
    {
        public override ActionResult Index()
        {
            return base.RedirectToRoute(new { controller = "Work", action = "LookingForWork" });
        }

        public ActionResult JobListing()
        {
            return this.List();
        }

        public ActionResult Search()
        {
            return this.Index();
        }

        //[AcceptVerbs(HttpVerbs.Post)]
        [HttpPost]
        public ActionResult Search(SearchCriteria searchCriteria)
        {
            Job objJob = new Job();
            base.Session["LastSearchCriteria"] = null;
            base.Session.Remove("LastSearchCriteria");
            base.Session["LastSearchCriteria"] = searchCriteria;
            return View("Index", objJob.SearchJobs(searchCriteria.Industry, searchCriteria.Role, searchCriteria.Location, searchCriteria.WorkArrangement, searchCriteria.Keywords, ""));
            //return base.View("Index");
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult List()
        {
            Job objJob = new Job();
            base.Session["LastSearchCriteria"] = null;
            base.Session.Remove("LastSearchCriteria");
            base.Session["LastSearchCriteria"] = new SearchCriteria();
            return base.View("Index", objJob.ListJobs());
        }

        public ActionResult JobDescription(string id)
        {
            Job objJob = new Job();
            return base.View("JobDescription", objJob.GetJobInfoByReferenceNo(id));
        }

        public ActionResult BackToSearch()
        {
            Job objJob = new Job();
            SearchCriteria searchCriteria = base.Session["LastSearchCriteria"] as SearchCriteria;
            if (searchCriteria != null)
            {
                return base.View("Index", objJob.SearchJobs(searchCriteria.Industry, searchCriteria.Role, searchCriteria.Location, searchCriteria.WorkArrangement, searchCriteria.Keywords, ""));
            }

            return this.Index();
        }

        public ActionResult ShowHotJobs()
        {
            Job objJob = new Job();
            int limit = Convert.ToInt32(ConfigurationManager.AppSettings["NumberOfHotJobsToDisplayInModule"].ToString());
            return base.View("HotJobsModule", objJob.HotJobs(limit));
        }

        public ActionResult SearchCountryCode(string term)
        {
            Common obj = new Common();

            return Json(obj.SearchCountryCode(term).AsEnumerable(), JsonRequestBehavior.AllowGet);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult JobAlert(JobAlertModel model)
        {
            if (ModelState.IsValid)
            {
                YG_Business.JobAlertInfo info = new YG_Business.JobAlertInfo();
                info.JobAlertId = model.JobAlertId;
                info.CadidateId = model.CandidateId;
                info.FirstName = model.Name;
                info.SurName = model.SurName;
                info.Email = model.Email;
                info.PhoneCode = model.PhoneCode;
                info.PhoneNo = model.ContactNumber;
                info.CreatedDate = DateTime.Now;
                info.FrequencyId = model.MailFrequency;
                info.WorkTypeList = new List<YG_Business.JobAlertWorkType>();
                info.LocationList = new List<YG_Business.JobAlertLocation>();
                info.IndustryList = new List<YG_Business.JobAlertIndustry>();
                YG_Business.JobAlertIndustry industryInfo;
                foreach (int indsurty in model.IndustrySelect)
                {
                    industryInfo = new YG_Business.JobAlertIndustry();
                    industryInfo.SubIndustryId = indsurty;
                    info.IndustryList.Add(industryInfo);
                }

                YG_Business.JobAlertLocation locationInfo;
                foreach (int location in model.LocationSelect)
                {
                    locationInfo = new YG_Business.JobAlertLocation();
                    locationInfo.LocationId = location;
                    info.LocationList.Add(locationInfo);
                }
                YG_Business.JobAlertWorkType workTypeInfo;
                foreach (int workType in model.WorkTypeSelect)
                {
                    workTypeInfo = new YG_Business.JobAlertWorkType();
                    workTypeInfo.WorkTypeId = workType;
                    info.WorkTypeList.Add(workTypeInfo);
                }
                string candidateguid = model.CandidateGUID;

                MailMessage message = new MailMessage();
                string address = ConfigurationManager.AppSettings.Get("emailAddress");
                string displayName = ConfigurationManager.AppSettings.Get("emailName");
                string body;
                JobAlert alert = new JobAlert();
                int alertId = 0;
                bool alertExist = false;
                if (model.JobAlertId == 0)
                {
                    alertId = alert.getJobAlertId(info.Email, ref candidateguid);
                }

                if (alertId > 0)
                {
                    body = System.IO.File.ReadAllText(Server.MapPath("~/Template") + "/alertExist.htm");
                    message = new MailMessage
                    {
                        From = new MailAddress(address, displayName),
                        Subject = "Please edit your YOU Global Job Alert subscription",
                        Body = string.Format(body, model.Name, "<a href='" + ConfigurationManager.AppSettings["baseURL"].ToString() + "Jobs/JobAlertEdit.shtml" + "?alertId=" + alertId + "&CID=" + candidateguid + "' > click here</a>", "<img src='" + ConfigurationManager.AppSettings["logoURL"].ToString() + "' />"),
                        IsBodyHtml = true
                    };
                    message.To.Add(model.Email);
                    alertExist = true;
                }
                else
                {
                    alertId = alert.InsertJobAlert(info, ref candidateguid);

                    body = System.IO.File.ReadAllText(Server.MapPath("~/Template") + "/alertemail.html");
                    body = string.Format(body, model.Name, "<a href='" + ConfigurationManager.AppSettings["subscribeConfirm"].ToString() + "?aD=" + alertId + "&CID=" + candidateguid + "' > click here</a>", "<img src='" + ConfigurationManager.AppSettings["logoURL"].ToString() + "' />");

                    if (model.JobAlertId == 0)
                    {
                        message = new MailMessage
                        {
                            From = new MailAddress(address, displayName),
                            Subject = "Please activate your YOU Global Job Alert subscription",
                            Body = body,
                            IsBodyHtml = true
                        };
                        message.To.Add(model.Email);
                    }
                    else
                    {
                        DataSet ds = alert.getJobAlert(alertId, candidateguid);
                        if (ds.Tables.Count > 0)
                        {
                            body = System.IO.File.ReadAllText(Server.MapPath("~/Template") + "/alertConfirmedmail.htm");
                            string name = ds.Tables[0].Rows[0]["first"].ToString();
                            string sector = "<table>";
                            string location = "<table>";
                            string worktype = "<table>";
                            foreach (DataRow drSector in ds.Tables[3].Rows)
                            {
                                sector += "<tr><td>" + drSector["subclassification"].ToString() + "</td></tr>";
                            }
                            sector += "</table>";
                            foreach (DataRow drLocation in ds.Tables[1].Rows)
                            {
                                location += "<tr><td>" + drLocation["name"].ToString() + "</td></tr>";
                            }
                            location += "</table>";

                            foreach (DataRow drWorkType in ds.Tables[2].Rows)
                            {
                                worktype += "<tr><td>" + drWorkType["type"].ToString() + "</td></tr>";
                            }
                            worktype += "</table>";

                            string frequney = ds.Tables[0].Rows[0]["frequency"].ToString();
                            body = string.Format(body, name, sector, location, worktype, frequney, ConfigurationManager.AppSettings["baseURL"].ToString() + "Jobs/JobAlertEdit.shtml" + "?alertId=" + alertId + "&CID=" + candidateguid, ConfigurationManager.AppSettings["logoURL"].ToString());
                        }
                        message = new MailMessage
                        {
                            From = new MailAddress(address, displayName),
                            Subject = "Your YOU Global Job Alert subscription is confirmed",
                            Body = body,
                            IsBodyHtml = true
                        };
                        message.To.Add(model.Email);
                    }
                }
                SmtpClient sc = new SmtpClient();
                sc.Host = ConfigurationManager.AppSettings["smtpHost"].ToString();
                string smtpUser = ConfigurationManager.AppSettings["smtpUserName"].ToString();
                string smtpPwd = ConfigurationManager.AppSettings["smtpPassword"].ToString();
                sc.Credentials = new System.Net.NetworkCredential(smtpUser, smtpPwd);
                sc.Send(message);

                if (alertExist)
                    return base.View("JobAlertExist");
                else
                {
                    if (model.JobAlertId == 0)
                    {
                        return base.View("JobAlertSuccess", alertId);
                    }
                    else
                    {
                        model.JobAlertId = alertId;
                        model.CandidateGUID = candidateguid;
                        return base.View("JobAlertEditSuccess", model);
                    }
                }
            }
            return base.View("JobAlertSuccess");
        }

        public ActionResult JobAlertEdit(int alertId, string CID)
        {
            JobAlertModel model = new JobAlertModel();
            JobAlert alert = new JobAlert();
            if (string.IsNullOrEmpty(CID))
            {
                DataTable dt = new DataTable();
                dt = alert.getJobAlert(alertId);
                if (dt.Rows.Count == 0)
                    return View("JobAlertNotExist");
                else
                {
                    if (string.IsNullOrEmpty(dt.Rows[0]["candidateguid"].ToString()))
                    {
                        CID = alert.updateCandidateGUID(Convert.ToInt32(dt.Rows[0]["candidateid"].ToString()));
                        string body = System.IO.File.ReadAllText(Server.MapPath("~/Template") + "/alertupgradesecurity.htm");
                        string address = ConfigurationManager.AppSettings.Get("emailAddress");
                        string displayName = ConfigurationManager.AppSettings.Get("emailName");
                        MailMessage message = new MailMessage
                        {
                            From = new MailAddress(address, displayName),
                            Subject = "Please use the new link to manage your subscription",
                            Body = string.Format(body, dt.Rows[0]["first"].ToString(), "<a href='" + ConfigurationManager.AppSettings["baseURL"].ToString() + "Jobs/JobAlertEdit.shtml" + "?alertId=" + alertId + "&CID=" + CID + "' > click here</a>", "<img src='" + ConfigurationManager.AppSettings["logoURL"].ToString() + "' />"),
                            IsBodyHtml = true
                        };
                        message.To.Add(dt.Rows[0]["email"].ToString());
                        SmtpClient sc = new SmtpClient();
                        sc.Host = ConfigurationManager.AppSettings["smtpHost"].ToString();
                        string smtpUser = ConfigurationManager.AppSettings["smtpUserName"].ToString();
                        string smtpPwd = ConfigurationManager.AppSettings["smtpPassword"].ToString();
                        sc.Credentials = new System.Net.NetworkCredential(smtpUser, smtpPwd);
                        sc.Send(message);

                        return View("JobAlertSecurityUpgrade");
                    }
                    else
                        return View("JobAlertNotExist");
                }
            }

            DataSet ds = alert.getJobAlert(alertId, CID);
            if (ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    model.JobAlertId = Convert.ToInt32(ds.Tables[0].Rows[0]["job_alertId"].ToString());
                    model.CandidateId = Convert.ToInt32(ds.Tables[0].Rows[0]["candidateId"].ToString());
                    model.CandidateGUID = CID;
                    model.Name = ds.Tables[0].Rows[0]["first"].ToString();
                    model.SurName = ds.Tables[0].Rows[0]["last"].ToString();
                    model.Email = ds.Tables[0].Rows[0]["email"].ToString();
                    model.PhoneCode = ds.Tables[0].Rows[0]["phonecode"].ToString();
                    model.ContactNumber = ds.Tables[0].Rows[0]["phonenumber"].ToString();
                    model.MailFrequency = Convert.ToInt32(ds.Tables[0].Rows[0]["frequencyId"].ToString());

                    model.IndustrySelect = new List<int>();
                    foreach (DataRow drSector in ds.Tables[3].Rows)
                    {
                        model.IndustrySelect.Add(Convert.ToInt32(drSector["jobindustrysubid"].ToString()));
                    }

                    model.LocationSelect = new List<int>();
                    foreach (DataRow drLocation in ds.Tables[1].Rows)
                    {
                        model.LocationSelect.Add(Convert.ToInt32(drLocation["locationid"].ToString()));
                    }

                    model.WorkTypeSelect = new List<int>();
                    foreach (DataRow drWorktype in ds.Tables[2].Rows)
                    {
                        model.WorkTypeSelect.Add(Convert.ToInt32(drWorktype["job_typeid"].ToString()));
                    }

                    Common obj = new Common();
                    if (Session["ClassificationList"] == null)
                    {
                        Session.Add("ClassificationList", obj.JobClassificationList());
                    }

                    if (Session["LocationList"] == null)
                    {
                        Session.Add("LocationList", obj.LocationList());
                    }

                    if (Session["WorkTypeList"] == null)
                    {
                        Session.Add("WorkTypeList", obj.WorkTypeList());
                    }

                    if (Session["FrequencyList"] == null)
                    {
                        Session.Add("FrequencyList", obj.AlertFrequnecyList());
                    }

                    if (Session["JobIndustryList"] == null)
                    {
                        DataTable dt = obj.JobIndustryList();
                        DataRow dr = dt.NewRow();
                        dr[0] = "";
                        dr[1] = "-- Any --";
                        dr[2] = 0;
                        dt.Rows.InsertAt(dr, 0);
                        Session.Add("JobIndustryList", dt);
                    }

                    if (Session["JobIndustryResumeList"] == null)
                    {
                        DataTable dt = ((DataTable)Session["JobIndustryList"]).Copy();
                        dt.Rows.RemoveAt(0);
                        DataRow dr = dt.NewRow();
                        dr[0] = "";
                        dr[1] = "- Please Select -";
                        dr[2] = -1;
                        dt.Rows.InsertAt(dr, 0);
                        dr = dt.NewRow();
                        dr[0] = "Other";
                        dr[1] = "Other";
                        dr[2] = 0;
                        dt.Rows.InsertAt(dr, 1);
                        Session.Add("JobIndustryResumeList", dt);
                    }

                    if (Session["JobIndustySub"] == null)
                    {
                        DataTable dt = obj.JobIndustrySubList();
                        DataRow dr = dt.NewRow();
                        dr[0] = 0;
                        dr[1] = "-- Any --";
                        dr[2] = "";
                        dt.Rows.InsertAt(dr, 0);
                        Session.Add("JobIndustySub", dt);
                    }

                    if (Session["SearchLocationList"] == null)
                    {
                        DataTable dt = obj.LocationList();
                        DataRow dr = dt.NewRow();
                        dr[0] = "";
                        dr[1] = "-- Any --";
                        dr[2] = 0;
                        dt.Rows.InsertAt(dr, 0);
                        Session.Add("SearchLocationList", dt);
                    }

                    if (Session["SearchWorkTypeList"] == null)
                    {
                        DataTable dt = obj.WorkTypeList();
                        DataRow dr = dt.NewRow();
                        dr[0] = 0;
                        dr[1] = "-- Any --";
                        dr[2] = "";
                        dt.Rows.InsertAt(dr, 0);
                        Session.Add("SearchWorkTypeList", dt);
                    }
                    return View("JobAlertUpdate", model);
                }
            }
            return View("JobAlertNotExist");
        }

        public ActionResult JobAlertDelete(int alertId)
        {
            JobAlert obj = new JobAlert();
            obj.AlertDelete(alertId, 0, "", "", "");

            return View("JobAlertDelete");
        }

        public string GetRole(string classification)
        {
            if (Session["JobIndustySub"] == null)
            {
                Common obj = new Common();
                DataTable dt = obj.JobIndustrySubList();
                DataRow dr = dt.NewRow();
                dr[0] = 0;
                dr[1] = "-- Any --";
                dr[2] = "";
                dt.Rows.InsertAt(dr, 0);
                Session.Add("JobIndustySub", dt);
            }
            DataTable dtIndustrySub = (DataTable)Session["JobIndustySub"];
            string str = "<option value=''>-- Any --</option>";
            if (!string.IsNullOrEmpty(classification))
            {
                DataRow[] drSeq = dtIndustrySub.Select("Classification='" + classification + "'");
                foreach (DataRow item in drSeq)
                {
                    str += "<option class='" + item["Classification"].ToString() + "' value='" + item["SubClassification"].ToString() + "'>" + item["SubClassification"].ToString() + "</option>";
                }
            }
            return str;
        }

        public string GetClassification(string classification)
        {
            Common obj = new Common();
            DataTable dtIndustry = string.IsNullOrEmpty(classification) ? obj.JobClassificationList() : obj.SearchClassification(classification);
            string str = string.Empty;

            foreach (DataRow item in dtIndustry.Rows)
            {
                str += "<option value='" + item["JobIndustrySubId"].ToString() + "'>" + item["classification"].ToString() + "</option>";
            }

            return str;
        }

        public override string DefaultViewName
        {
            get
            {
                return "Index";
            }
        }

        public ActionResult JobAlert()
        {
            return View("JobAlert");
        }

        public ActionResult PostJob()
        {
            string jobRefeCode = "SJK" + DateTime.UtcNow.Year + JobDetailDataProvider.jobReferenceCode("SJK" + DateTime.UtcNow.Year);
            Session["ReferenceNo"] = jobRefeCode.ToUpper();
            WorkTypeList(); listJobType();
            listCurrencies(); listFrequency();
            return View("PostJob");
        }

        public DataTable WorkTypeList()
        {
            DataTable dt = new DataTable();
            MySqlDataReader reader = JobDetailDataProvider.listJobType();
            dt.Load(reader);
            reader.Close();
            reader.Dispose();
            DataRow dr = dt.NewRow();
            dr[0] = 0;
            dr[1] = "-- Any --";
            dt.Rows.InsertAt(dr, 0);
            Session.Add("JobType", dt);
            return dt;
        }

        public DataTable listJobType()
        {
            DataTable dt = new DataTable();
            MySqlDataReader reader = ClientDataProvider.listActiveClient();
            dt.Load(reader);
            reader.Close();
            reader.Dispose();
            DataRow dr = dt.NewRow();
            dr[0] = 0;
            dr[1] = "-- Any --";
            dt.Rows.InsertAt(dr, 0);
            Session.Add("ActiveClients", dt);
            return dt;
        }

        public DataTable listCurrencies()
        {
            DataTable dt = new DataTable();
            MySqlDataReader reader = CommonDataProvider.listCurrencies();
            dt.Load(reader);
            reader.Close();
            reader.Dispose();
            Session.Add("Currencies", dt);
            return dt;
        }

        public DataTable listFrequency()
        {
            DataTable dt = new DataTable();
            MySqlDataReader reader = CommonDataProvider.listFrequency();
            dt.Load(reader);
            reader.Close();
            reader.Dispose();
            Session.Add("Frequency", dt);
            return dt;
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult PostJob(JobDetailInfo model, string returnUrl)
        {
            if (model != null)
            {
                if (!string.IsNullOrEmpty(model.ReferenceNo))
                {
                    int jobId = Save(model);
                    if (jobId > 0)
                    {
                        JobDetailDataProvider.updateJobApprove(jobId);
                        string referenceNo = model.ReferenceNo;
                        HistoryDataProvider history = new HistoryDataProvider();
                        HistoryInfo historyInfo = new HistoryInfo();
                        historyInfo.UserId = (Session["userID"] != null ? Convert.ToUInt32(Session["userID"]) : 0);
                        historyInfo.ModuleId = (int)HistoryInfo.Module.Job;
                        historyInfo.TypeId = (int)HistoryInfo.ActionType.Edit;
                        historyInfo.RecordId = Convert.ToUInt32(jobId);
                        historyInfo.Details = new List<HistoryDetailInfo>();
                        historyInfo.Details.Add(new HistoryDetailInfo { ColumnName = "approve", NewValue = referenceNo });
                        history.insertHistory(historyInfo);
                        return View("PostJob");
                    }
                }
                else
                {
                    return View("PostJob");
                }
            }
            return View("PostJob");
        }

        private int Save(JobDetailInfo model)
        {
            int jobId = 0;

            if (!JobDetailDataProvider.jobReferenceExist(model.ReferenceNo.Trim(), 0))
            {
                JobDetailInfo jobInfo = new JobDetailInfo();
                jobInfo.TypeId = Convert.ToInt32(model.TypeId);
                jobInfo.SalaryMin = model.SalaryMin;
                jobInfo.SalaryMax = model.SalaryMax;
                jobInfo.ReferenceNo = model.ReferenceNo.Trim().ToUpper();
                jobInfo.Title = !string.IsNullOrEmpty(model.Title) ? model.Title.ToUpper() : "";
                jobInfo.Bullet1 = !string.IsNullOrEmpty(model.Bullet1) ? model.Bullet1.ToUpper() : "";
                jobInfo.Bullet2 = !string.IsNullOrEmpty(model.Bullet2) ? model.Bullet2.ToUpper() : "";
                jobInfo.Bullet3 = !string.IsNullOrEmpty(model.Bullet3) ? model.Bullet3.ToUpper() : "";
                jobInfo.Summary = !string.IsNullOrEmpty(model.Summary) ? model.Summary.ToUpper() : "";
                jobInfo.JobContent = !string.IsNullOrEmpty(model.JobContent) ? model.JobContent.ToUpper() : "";
                jobInfo.AdFooter = !string.IsNullOrEmpty(model.AdFooter) ? model.AdFooter.ToUpper() : "";
                jobInfo.Status = 1;
                jobInfo.IsApprove = false;
                jobInfo.WebsiteURL = !string.IsNullOrEmpty(model.WebsiteURL) ? model.WebsiteURL.ToUpper() : "";
                jobInfo.ClientId = Convert.ToInt32(model.ClientId);
                jobInfo.CreatedDate = DateTime.UtcNow;
                jobInfo.HotJob = model.HotJob;
                jobInfo.SalaryCurrency = !string.IsNullOrEmpty(model.SalaryCurrency) ? model.SalaryCurrency.ToUpper() : "";
                //jobInfo.ISCO08Id = Convert.ToInt32(string.IsNullOrEmpty(hdfOccupationId.Value) ? "-1" : hdfOccupationId.Value);
                //jobInfo.ISICRev4Id = Convert.ToInt32(string.IsNullOrEmpty(hdfIndustryId.Value) ? "-1" : hdfIndustryId.Value);
                if (model.SalaryFrequency.HasValue && model.SalaryFrequency.Value > 0)
                    jobInfo.SalaryFrequency = Convert.ToInt32(model.SalaryFrequency.Value);

                List<EssentialCriteriaInfo> lst = new List<EssentialCriteriaInfo>();
                List<DesirableCriteriaInfo> lstDesi = new List<DesirableCriteriaInfo>();
                List<JobConsultantInfo> lstConsultant = new List<JobConsultantInfo>();
                List<JobLocation> locationlist = new List<JobLocation>();

                jobInfo.EssentialCriteriaList = lst;
                jobInfo.DesirableCriteriaList = lstDesi;
                jobInfo.ConsultantList = lstConsultant;
                jobInfo.LocationList = locationlist;

                jobInfo.JobId = Convert.ToInt32(JobDetailDataProvider.insertJobDetail(jobInfo));
                jobInfo.Version = 1;
                jobId = jobInfo.JobId;
                JobDetailEditDataProvider.insertJobDetailEdit(jobInfo, true);
            }
            else
            {
            }

            return jobId;
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult Reset(JobDetailInfo model, string returnUrl)
        {
            if (model != null)
            {
                model.TypeId = 0;
                model.SalaryMin = "";
                model.SalaryMax = "";
                model.ReferenceNo = "";
                model.Title = "";
                model.Bullet1 = "";
                model.Bullet2 = "";
                model.Bullet3 = "";
                model.Summary = "";
                model.JobContent = "";
                model.AdFooter = "";
                model.Status = 1;
                model.IsApprove = false;
                model.WebsiteURL = "";
                model.ClientId = 0;
                model.CreatedDate = DateTime.UtcNow;
                model.HotJob = false;
                model.SalaryCurrency = "";
                //model.ISCO08Id = Convert.ToInt32(string.IsNullOrEmpty(hdfOccupationId.Value) ? "-1" : hdfOccupationId.Value);
                //model.ISICRev4Id = Convert.ToInt32(string.IsNullOrEmpty(hdfIndustryId.Value) ? "-1" : hdfIndustryId.Value);
                model.SalaryFrequency = 0;
            }
            return View("postjob", model);
        }

        public ActionResult getOccupation(string term)
        {
            List<string> result = new List<string>();
            MySqlDataReader dr = ISCODataProvider.searchgroup(term, 4);
            while (dr.Read())
            {
                if (!result.Contains("<span style='color:#9AC435'>>" + dr["c1"].ToString() + " " + dr["d1"].ToString() + "</span>"))
                    result.Add("<span style='color:#9AC435'>>" + dr["c1"].ToString() + " " + dr["d1"].ToString() + "</span>");
                if (!result.Contains("<span style='color:#124812'>>>" + dr["c2"].ToString() + " " + dr["d2"].ToString() + "</span>"))
                    result.Add("<span style='color:#124812'>>>" + dr["c2"].ToString() + " " + dr["d2"].ToString() + "</span>");
                if (!result.Contains("<span style='color:#51C0EE'>>>>" + dr["c3"].ToString() + " " + dr["d3"].ToString() + "</span>"))
                    result.Add("<span style='color:#51C0EE'>>>>" + dr["c3"].ToString() + " " + dr["d3"].ToString() + "</span>");
                result.Add(AutoCompleteExtender.CreateAutoCompleteItem("<span style='color:#0000FF'>UNIT " + dr["c4"].ToString() + " " + dr["d4"].ToString() + "</span>", dr["id4"].ToString()));
            }
            dr.Close();
            dr.Dispose();
            result.Insert(0, AutoCompleteExtender.CreateAutoCompleteItem("Anywhere", "0,0,0,0"));
            var result3 = result.Where(s => s.ToLower().Contains(term.ToLower())).Select(w => w).ToList();
            return Json(result3, JsonRequestBehavior.AllowGet);
        }

        public ActionResult getIndustry(string term)
        {
            List<string> result = new List<string>();
            DataTable dt = new DataTable();
            MySqlDataReader dr = ISICRevDataProvider.searchISICRev4withHierarchy(term);
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    if (!result.Contains("<span style='color:#9AC435'>>" + dr["c1"].ToString() + " " + dr["d1"].ToString() + "</span>"))
                        result.Add("<span style='color:#9AC435'>>" + dr["c1"].ToString() + " " + dr["d1"].ToString() + "</span>");
                    if (!result.Contains("<span style='color:#124812'>>>" + dr["c2"].ToString() + " " + dr["d2"].ToString() + "</span>"))
                        result.Add("<span style='color:#124812'>>>" + dr["c2"].ToString() + " " + dr["d2"].ToString() + "</span>");
                    if (!result.Contains("<span style='color:#51C0EE'>>>>" + dr["c3"].ToString() + " " + dr["d3"].ToString() + "</span>"))
                        result.Add("<span style='color:#51C0EE'>>>>" + dr["c3"].ToString() + " " + dr["d3"].ToString() + "</span>");
                    result.Add(AutoCompleteExtender.CreateAutoCompleteItem("<span style='color:#0000FF'>CLASS " + dr["c4"].ToString() + " " + dr["d4"].ToString() + "</span>", dr["id4"].ToString()));
                }
            }
            else
            {
                // result.Add(prefixText + " didn't match any item.");
            }
            dr.Close();
            dr.Dispose();
            result.Insert(0, AutoCompleteExtender.CreateAutoCompleteItem("Anywhere", "0,0,0,0"));
            var result3 = result.Where(s => s.ToLower().Contains(term.ToLower())).Select(w => w).ToList();
            return Json(result3, JsonRequestBehavior.AllowGet);
        }

        public ActionResult getLocation(string term)
        {
            List<string> result = new List<string>();
            MySqlDataReader drLocation = LocationDataProvider.getLocationswithGroupName(term);
            while (drLocation.Read())
            {
                string item = drLocation["name"].ToString();
                if (!string.IsNullOrEmpty(drLocation["name"].ToString().Trim()))
                {
                    if (!result.Contains(AutoCompleteExtender.CreateAutoCompleteItem("<span style='color:#9AC435'>" + drLocation["name"].ToString() + "</span>", drLocation["countryid"].ToString())))
                        result.Add(AutoCompleteExtender.CreateAutoCompleteItem("<span style='color:#9AC435'>" + drLocation["name"].ToString() + "</span>", drLocation["countryid"].ToString()));
                    if (!string.IsNullOrEmpty(drLocation["locationname"].ToString().Trim()))
                    {
                        item = item + " > " + drLocation["locationname"].ToString();
                        if (!result.Contains(AutoCompleteExtender.CreateAutoCompleteItem("<span style='color:#124812'>" + item + "</span>", drLocation["countryid"].ToString() + "," + drLocation["locationid"].ToString())))
                            result.Add(AutoCompleteExtender.CreateAutoCompleteItem("<span style='color:#124812'>" + item + "</span>", drLocation["countryid"].ToString() + "," + drLocation["locationid"].ToString()));
                        if (!string.IsNullOrEmpty(drLocation["sublocation"].ToString().Trim()))
                        {
                            item = item + " > " + drLocation["sublocation"].ToString();
                            if (!result.Contains(AutoCompleteExtender.CreateAutoCompleteItem("<span style='color:#51C0EE'>" + item + "</span>", drLocation["countryid"].ToString() + "," + drLocation["locationid"].ToString() + "," + drLocation["sublocationid"].ToString())))
                                result.Add(AutoCompleteExtender.CreateAutoCompleteItem("<span style='color:#51C0EE'>" + item + "</span>", drLocation["countryid"].ToString() + "," + drLocation["locationid"].ToString() + "," + drLocation["sublocationid"].ToString()));
                            if (!string.IsNullOrEmpty(drLocation["subsublocation"].ToString().Trim()))
                            {
                                item = item + " > " + drLocation["subsublocation"].ToString();
                                result.Add(AutoCompleteExtender.CreateAutoCompleteItem("<span style='color:#0000FF'>" + item + "</span>", drLocation["countryid"].ToString() + "," + drLocation["locationid"].ToString() + "," + drLocation["sublocationid"].ToString() + "," + drLocation["subsublocationid"].ToString()));
                            }
                        }
                    }
                }

                if (!string.IsNullOrEmpty(drLocation["groupname"].ToString().Trim()))
                {
                    result.Add(AutoCompleteExtender.CreateAutoCompleteItem("<span style='color:#0000FF'>" + drLocation["groupname"].ToString() + "</span>", drLocation["countryid"].ToString() + "," + drLocation["locationid"].ToString() + "," + drLocation["sublocationid"].ToString() + "," + drLocation["subsublocationid"].ToString() + "," + drLocation["location_groupid"].ToString()));
                }
            }
            drLocation.Close();
            drLocation.Dispose();
            result.Insert(0, AutoCompleteExtender.CreateAutoCompleteItem("Anywhere", "0,0,0,0"));
            var result3 = result.Where(s => s.ToLower().Contains(term.ToLower())).Select(w => w).ToList();
            return Json(result3, JsonRequestBehavior.AllowGet);
        }
    }
}