using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using WebProject.AsyncWidgets.DAL;
using WebProject.AsyncWidgets.Utility;
/// <summary>
/// Summary description for Authentication
/// </summary>
///
namespace WebProject.AsyncWidgets.DAL
{
    public class Authentication
    {
        public static string GetPasswordHash(string UserName)
        {
            string snQuery = "select AuthenticationHash From dbo.RegisteredUser Where UserId='" + UserName.Replace("'", "''") + "'";
            string strAutKey = string.Empty;
            DataSet dsUser = new DataSet();
            dsUser = DBHelper.GetDataSet(snQuery.ToString());
            if (dsUser != null && dsUser.Tables.Count > 0 && dsUser.Tables[0].Rows.Count > 0)
                strAutKey = dsUser.Tables[0].Rows[0]["AuthenticationHash"].ToString();
            return strAutKey;
        }
        public static DataSet GetUserData(string UserName)
        {
            string snQuery = "select Password,Name,Roles,isnull(OrgId,0) as OrgId,isnull(UnitId,0) as UnitId,isnull(ShowEmpInfo,0) as ShowEmpInfo  From dbo.FX_Users Where UserId='" + UserName.Replace("'", "''") + "'";
            DataSet dsUser = new DataSet();
            dsUser = DBHelper.GetDataSet(snQuery.ToString());
            return dsUser;
        }
        public static bool CheckUserNameAvaiable(string UserName)
        {
            string snQuery = "Select UserId From dbo.RegisteredUser Where UserId='" + UserName.Replace("'", "''") + "'";
            bool bExists = false;
            DataSet dsRegUser = new DataSet();
            dsRegUser = DBHelper.GetDataSet(snQuery.ToString());
            if (dsRegUser != null && dsRegUser.Tables.Count > 0 && dsRegUser.Tables[0].Rows.Count > 0)
                bExists = true;

            return bExists;
        }
    }
    //public class RegisterNewUser
    //{
    //    public static string RegisterUser(ParamDictionary<string, QueryParameter> param)
    //    {
    //        string sSuccess = "1";
    //        try
    //        {
    //            string ColumnNames = string.Empty;
    //            string ColumnValues = string.Empty;
    //            string ColumnValue = string.Empty;
    //            string strBirthDate = string.Empty;
    //            string strSmallDate = string.Empty;
    //            foreach (KeyValuePair<string, QueryParameter> pair in param)
    //            {
    //                if (pair.Key.ToString() != "Password")
    //                {
    //                    ColumnNames = ColumnNames + pair.Key.ToString() + ",";
    //                    if (pair.Key.ToString() != "BirthDate")
    //                        ColumnValue = pair.Value.ParameterValue.Trim() != "@EV" ? "'" + pair.Value.ParameterValue.Trim() + "'" : "null";
    //                    else
    //                    {
    //                        strBirthDate = pair.Value.ParameterValue.Trim() != "@EV" ? pair.Value.ParameterValue.Trim() : "null";
    //                        if (strBirthDate != "null" && strBirthDate.IndexOf("/") > 0)
    //                        {
    //                            string strTemp = strBirthDate;
    //                            strSmallDate = strTemp.Substring(6, 4) + strTemp.Substring(3, 2) + strTemp.Substring(0, 2);
    //                            strBirthDate = "Cast('" + strSmallDate + "' As smallDatetime)";
    //                        }
    //                        ColumnValue = strBirthDate;
    //                    }
    //                    ColumnValues = ColumnValues + ColumnValue + ",";
    //                }
    //            }
    //            ColumnNames = "(" + ColumnNames.TrimEnd(new char[] { ',' }) + ") Values";
    //            ColumnValues = " (" + ColumnValues.TrimEnd(new char[] { ',' }) + ")";
    //            string snQuery = " Insert Into RegisteredUser " + ColumnNames + ColumnValues;
    //            DBHelper.ExecutScaler(snQuery.ToString());
    //        }
    //        catch (Exception ex)
    //        {
    //            //sSuccess = "0";
    //            throw ex;
    //        }
    //        return sSuccess;
    //    }

    //}

}