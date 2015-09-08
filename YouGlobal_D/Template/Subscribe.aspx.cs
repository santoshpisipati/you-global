using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Net.Mail;

using YG_Business;

namespace YG_MVC.Template
{
    public partial class Subscribe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["aD"] != null)
            {
                int alertid = Convert.ToInt32(Request.QueryString["aD"]);
                string candidateguid = Request.QueryString["CID"] == null ? string.Empty : Request.QueryString["CID"].ToString();
                JobAlert obj = new JobAlert();
                obj.AlertConfirmation(alertid);
                divNotExist.Visible = true;
                edit.HRef = ConfigurationManager.AppSettings["baseURL"].ToString() + "Jobs/JobAlertEdit.shtml?alertId=" + alertid + "&CID=" + candidateguid;
                JobAlert alert = new JobAlert();
                DataSet ds = alert.getJobAlert(alertid, candidateguid);
                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        divConfirm.Visible = true;
                        divNotExist.Visible = false;
                        string body = System.IO.File.ReadAllText(Server.MapPath("~/Template") + "/alertConfirmedmail.htm");
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
                        body = string.Format(body, name, sector, location, worktype, frequney, ConfigurationManager.AppSettings["baseURL"].ToString() + "Jobs/JobAlertEdit.shtml" + "?alertId=" + alertid + "&CID=" + candidateguid, ConfigurationManager.AppSettings["logoURL"].ToString());

                        string address = ConfigurationManager.AppSettings.Get("emailAddress");
                        string displayName = ConfigurationManager.AppSettings.Get("emailName");

                        MailMessage message = new MailMessage
                        {
                            From = new MailAddress(address, displayName),
                            Subject = "Your YOU Global Job Alert subscription is confirmed",
                            Body = body,
                            IsBodyHtml = true
                        };
                        message.To.Add(ds.Tables[0].Rows[0]["email"].ToString());
                        SmtpClient sc = new SmtpClient();
                        sc.Host = ConfigurationManager.AppSettings["smtpHost"].ToString();
                        string smtpUser = ConfigurationManager.AppSettings["smtpUserName"].ToString();
                        string smtpPwd = ConfigurationManager.AppSettings["smtpPassword"].ToString();
                        sc.Credentials = new System.Net.NetworkCredential(smtpUser, smtpPwd);
                        sc.Send(message);
                    }

                }

            }
        }
    }
}