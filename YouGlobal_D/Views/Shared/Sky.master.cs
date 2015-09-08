using System;
using System.Data;
using System.Web.UI.WebControls;
using YG_Business;

namespace YG_MVC.Views.Shared
{
    public partial class Sky : System.Web.UI.MasterPage
    {
        private static string[] months = { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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

                if (Session["title"] == null)
                {
                    Session.Add("title", obj.TitleList());
                }

                if (Session["gender"] == null)
                {
                    Session.Add("gender", obj.GenderList());
                }

                if (Session["marital"] == null)
                {
                    Session.Add("marital", obj.MaritalList());
                }

                if (Session["phonetype"] == null)
                {
                    Session.Add("phonetype", obj.PhoneTypeList());
                }

                if (Session["currency"] == null)
                {
                    Session.Add("currency", obj.CurrencyList());
                }

                if (Session["frequency"] == null)
                {
                    Session.Add("frequency", obj.FrequencyList());
                }

                if (Session["emailtype"] == null)
                {
                    Session.Add("emailtype", obj.EmailTypeList());
                }

                ListItemCollection y = new ListItemCollection();
                y.Add("");
                ListItemCollection y1 = new ListItemCollection();
                y1.Add("");
                y1.Add("Present");
                for (int i = DateTime.Today.Year; i > (DateTime.Today.Year - 100); i--)
                {
                    y.Add(new ListItem(i.ToString()));
                    y1.Add(new ListItem(i.ToString()));
                }
                Session.Add("year", y);
                Session.Add("Toyear", y1);

                ListItemCollection m = new ListItemCollection();
                m.Add("");
                foreach (string month in months)
                {
                    m.Add(new ListItem(month));
                }
                Session.Add("month", m);

                ListItemCollection d = new ListItemCollection();
                d.Add("");
                for (int i = 1; i <= 31; i++)
                {
                    d.Add(new ListItem(i.ToString()));
                }
                Session.Add("day", d);

                if (Session["OccupationList"] == null)
                {
                    DataTable dt = obj.OccupationList();
                    //DataRow dr = dt.NewRow();
                    //dr[0] = "";
                    //dr[1] = "-- Any --";

                    //dt.Rows.InsertAt(dr, 0);
                    Session.Add("OccupationList", dt);
                }

                if (Session["JobIndustryList"] == null)
                {
                    DataTable dt = obj.JobIndustryList();
                    DataRow dr = dt.NewRow();
                    dr[0] = 0;
                    dr[1] = "-- Any --";
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

                    dt.Rows.InsertAt(dr, 0);
                    Session.Add("SearchWorkTypeList", dt);
                }
            }
        }
    }
}