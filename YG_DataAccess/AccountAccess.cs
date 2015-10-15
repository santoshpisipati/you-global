using MySql.Data.MySqlClient;
using System;
using System.Data;

namespace YG_DataAccess
{
    public class AccountAccess
    {
        public static MySqlDataReader AddMember(string firstName, string lastName, string password, string phnNumber, DateTime date, string emailId)
        {
            string sql = "insert into `globalpanda`.`members`(`firstname`,`lastname`,`email`,`password`,`phonenumber`,`isactive`,`createdon`)" +
                         "values (?firstname, ?lastname, ?email,  ?password,  ?phonenumber,?isactive,?createdon)";

            return DataAccess.ExecuteReader(sql, new MySqlParameter("firstName", firstName)
                                               , new MySqlParameter("lastName", lastName)
                                               , new MySqlParameter("email", emailId)
                                               , new MySqlParameter("password", password)
                                               , new MySqlParameter("phonenumber", phnNumber)
                                               , new MySqlParameter("isactive", true)
                                               , new MySqlParameter("createdon", DateTime.Now));
        }

        public static DataTable GetLoginDetails(string emailId, string password)
        {
            string sql = string.Format("select * from members where email='{0}' and password='{1}'", emailId, password);
            MySqlDataReader reader = DataAccess.ExecuteReader(sql);
            DataTable dt = new DataTable();
            dt.Load(reader);
            reader.Close();
            reader.Dispose();

            return dt;
        }

        public static Int32 GetMemberId(string emailId, string password)
        {
            Int32 id = 0;
            if (string.IsNullOrEmpty(password))
            {
                string sql = string.Format("select memberId from members where email='{0}'", emailId);
                MySqlDataReader reader = DataAccess.ExecuteReader(sql);
                id = Convert.ToInt32(DataAccess.ExecuteScalar(sql));
            }
            else
            {
                string sql = string.Format("select memberId from members where email='{0}' and password= '{1}'", emailId, password);
                MySqlDataReader reader = DataAccess.ExecuteReader(sql);
                id = Convert.ToInt32(DataAccess.ExecuteScalar(sql));
            }
            return id;
        }

        public static Int32 ResetPassword(string password, Int32 memberId)
        {
            string sql = "update members set password=?password where memberId=?memberId";
            Int32 id = 0;
            id = Convert.ToInt32(DataAccess.ExecuteNonQuery(sql, new MySqlParameter("password", password), new MySqlParameter("memberId", memberId)));
            return id;
        }
    }
}