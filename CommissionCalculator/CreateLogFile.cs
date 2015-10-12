using System;
using System.IO;

namespace CommissionCalculator
{
    public class CreateLogFile
    {
        private string sLogFormat;
        private string sErrorTime;

        public void CreateLogFiles()
        {
            //sLogFormat used to create log files format :
            // dd/mm/yyyy hh:mm:ss AM/PM ==> Log Message
            sLogFormat = DateTime.Now.ToShortDateString().ToString() + " " + DateTime.Now.ToLongTimeString().ToString() + " ==> ";
            //this variable used to create log filename format "
            //for example filename : ErrorLogYYYYMMDD
            string sYear = DateTime.Now.Year.ToString();
            string sMonth = DateTime.Now.Month.ToString();
            string sDay = DateTime.Now.Day.ToString();
            sErrorTime = sYear + sMonth + sDay;
        }

        public void ErrorLog(string sPathName, string sErrMsg, string stkTrace)
        {
            CreateLogFiles();
            if (File.Exists(sPathName))
            {
                StreamWriter sw = new StreamWriter(sPathName, true);
                sw.WriteLine("Message :" + sErrMsg + "<br/>" + Environment.NewLine + "StackTrace :" + stkTrace + "" + Environment.NewLine + "Date :" + sErrMsg);
                sw.Flush();
                sw.Close();
            }
            else
            {
                StreamWriter sw = new StreamWriter(sPathName, true);
                sw.WriteLine("Message :" + sErrMsg + "<br/>" + Environment.NewLine + "StackTrace :" + stkTrace + "" + Environment.NewLine + "Date :" + sErrMsg);
                sw.Flush();
                sw.Close();
            }
        }
    }
}