using System;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Data;
using WebProject.AsyncWidgets.DAL;
using System.Reflection;
using System.Web.Security;
using System.Xml;

using Newtonsoft.Json;
namespace WebProject.AsyncWidgets.BAL
{


    /// <summary>
    /// Summary description for Authentication 
    /// </summary>
    public class Authentication : ActionExecuter
    {
        public string LogoutUser(string ServiceInfo)
        {
            Session.Abandon();
            return "true";
        }
        public string IsUserLogged(string ServiceInfo)
        {
            System.Web.HttpContext ctx = System.Web.HttpContext.Current;
            if (ctx.Session != null)
            {
                if (ctx.Session["UserId"] != null)
                {
                    return "true";
                }
                else
                {
                    return "false";
                }
            }
            return "false";

        }
        public string ChangePassword(string ServiceInfo)
        {
            string Status = "";
            System.Web.HttpContext ctx = System.Web.HttpContext.Current;
            ParamDictionary<string, AsyncWidgets.DAL.QueryParameter> PD = LoadForm(ServiceInfo).GetFirstFormParams();
            
            string hash = PD["password"].ParameterValue == "****" ? "@EV" :
                GetAuthHash(
               ctx.Session["UserId"].ToString(),
               PD["password"].ParameterValue
               , "enilno8qsrac"
                );
            AddQueryParam(PD,
               "AuthenticationHash", hash);

            Status = "'" + DBHelper.InvokeSP(PD["Command"].ParameterValue + "_SP", PD) + "'";
            return Status;
        }

        public string GetAuthHash(string UserEmail, string UserPassword, string UserRoles)
        {
            string PassHash = Hashing.ComputeHash(UserPassword, Hashing.HashType.SHA1, null);
            string passPhrase = "Pas5pr@se";        // can be any string
            string initVector = "@1B2c3D4e5F6g7H8"; // must be 16 bytes

            RijndaelEnhanced rijndaelKey =
                new RijndaelEnhanced(passPhrase, initVector);

            return rijndaelKey.Encrypt(UserEmail + "@|" + PassHash + "@|" + UserRoles);
        }
        public Authentication() { }
        public string GetUserMenu(string ServiceInfo)
        {
            ParamDictionary<string, AsyncWidgets.DAL.QueryParameter> PD = LoadForm(ServiceInfo).GetFirstFormParams();
            DataSet ds = DBHelper.GetDataTableProc(PD["Command"].ParameterValue + "_SP", PD);
            string ret="",Response = @"{{status:""{0}"" {1}}}";
            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["MenuData"] =  string.Format(Response, "OK", ",Response:" +string.Format("{{Rows:{0},Count:{1}}}", JsonConvert.SerializeObject(ds.Tables[0]), 0));
             ret=string.Format("{{Rows:{0},Count:{1}}}", JsonConvert.SerializeObject(ds.Tables[0]), 0);
               
            }
            else
            {
                Session["MenuData"] = string.Format(Response, "OK", ",Response:{{Rows:[],Count:0}}");
               ret= string.Format("{{Rows:{0},Count:{1}}}", "[]", 0);
            }
             
            return ret;
        }
        public  string AuthenticateUser(string ServiceInfo)
        {
            System.Web.HttpContext ctx = System.Web.HttpContext.Current;
            //return string.Format("{{Authenticated:{0},FirstName:'{1}',LastName:'{2}',Roles:'{3}'}}", "true", "Muhammed", "Qasim", "Admin");
            ParamDictionary<string, AsyncWidgets.DAL.QueryParameter> PD = LoadForm(ServiceInfo).GetFirstFormParams();
            string passPhrase = "Pas5pr@se";        // can be any string
            string initVector = "@1B2c3D4e5F6g7H8", strAutKey = ""; // must be 16 bytes
            bool bValid = false;
            string UserName = PD["UserName"].ParameterValue, Password = PD["UserPassword"].ParameterValue;
            DataSet dsUser = DAL.Authentication.GetUserData(UserName);
            if (dsUser != null && dsUser.Tables.Count > 0 && dsUser.Tables[0].Rows.Count > 0)
                strAutKey = dsUser.Tables[0].Rows[0]["Password"].ToString();


            RijndaelEnhanced rijndaelKey = new RijndaelEnhanced(passPhrase, initVector);
            string strDecryptedvalue = string.Empty;
            if (strAutKey.Trim() != string.Empty)
            {
                strDecryptedvalue = rijndaelKey.Decrypt(strAutKey);
                if (strDecryptedvalue.IndexOf("@|") > 0)
                {
                    string[] strTemp = strDecryptedvalue.Split('|');
                    if (Hashing.VerifyHash(Password, Hashing.HashType.SHA1, strTemp[1].TrimEnd(new char[] { '@' }).ToString()))
                        bValid = true;
                }


            }
            if (bValid)
            {
                ctx.Session["UserId"] = UserName;
                ctx.Session["Name"] = dsUser.Tables[0].Rows[0]["Name"].ToString();
                Session["Roles"] = dsUser.Tables[0].Rows[0]["Roles"].ToString();
                Session["UserConf"] = string.Format("{{OrgId:{0},UnitId:{1},ShowEmpInfo:{2},Roles:'{3}' }}", dsUser.Tables[0].Rows[0]["OrgId"].ToString(), dsUser.Tables[0].Rows[0]["UnitId"].ToString(), dsUser.Tables[0].Rows[0]["ShowEmpInfo"].ToString(), dsUser.Tables[0].Rows[0]["Roles"].ToString());
                return string.Format("{{Authenticated:{0},Name:'{1}',Roles:'{2}',Conf:{{OrgId:{3},UnitId:{4},ShowEmpInfo:{5},Roles:'{2}' }} }}", "true", dsUser.Tables[0].Rows[0]["Name"].ToString(), dsUser.Tables[0].Rows[0]["Roles"].ToString(), dsUser.Tables[0].Rows[0]["OrgId"].ToString(), dsUser.Tables[0].Rows[0]["UnitId"].ToString(), dsUser.Tables[0].Rows[0]["ShowEmpInfo"].ToString());
            }
            
            else
                return string.Format("{{Authenticated:{0},Name:'{1}',Roles:'{2}'}}", "false", "", "");
        }


//        public static bool IsUserNameAvailable(string UserName)
//        {
//            return VehiclesOnlineDAL.IsUserNameAvaiable.CheckUserNameAvaiable(UserName);
//        }
//        public object RegisterNewUser(string ServiceInfo)
//        {
//            string Status = "";
//            string EmailStatus = "";
//            try
//            {
//                ParamDictionary<string, QueryParameter> PD = LoadForm(ServiceInfo).GetFirstFormParams();
//                AddQueryParam(PD,
//                   "AuthenticationHash", GetAuthHash(
//                   PD["userid"].ParameterValue,
//                   PD["password"].ParameterValue
//                   , "enilno8qsrac"
//                    ));
//                Status = "'" + VehiclesOnlineDAL.DBHelper.InvokeSP(PD["Command"].ParameterValue + "_SP", PD) + "'";

//                EmailStatus = RegisterNewUserEmail(ServiceInfo);

//            }
//            catch (Exception ex)
//            {
//                //sSuccess = "0";
//                return "-1||Error||" + ex.Message;
//            }
//            return Status;
//        }

//        public string RegisterNewUserEmail(string ServiceInfo)
//        {
//            ParamDictionary<string, QueryParameter> PD = LoadForm(ServiceInfo).GetFirstFormParams();
//            string EmailHTML = @"<html xmlns:v='urn:schemas-microsoft-com:vml' xmlns:o='urn:schemas-microsoft-com:office:office'
//xmlns:w='urn:schemas-microsoft-com:office:word' xmlns:m='http://schemas.microsoft.com/office/2004/12/omml'
//xmlns='http://www.w3.org/TR/REC-html40'>
//<head>
//    <meta http-equiv='Content-Type' content='text/html; charset=us-ascii'>
//    <meta name='Generator' content='Microsoft Word 12 (filtered medium)'>
//    <style><!--
///* Font Definitions */
//@font-face
//	{{font-family:Calibri;
//	panose-1:2 15 5 2 2 2 4 3 2 4;}}
//@font-face
//	{{font-family:Tahoma; 
//	panose-1:2 11 6 4 3 5 4 4 2 4;}}
//@font-face
//	{{font-family:Verdana;
//	panose-1:2 11 6 4 3 5 4 4 2 4;}}
///* Style Definitions */
//p.MsoNormal, li.MsoNormal, div.MsoNormal
//	{{margin:0in;
//	margin-bottom:.0001pt;
//	font-size:12.0pt;
//	font-family:'Times New Roman','serif';}}
//a:link, span.MsoHyperlink
//	{{mso-style-priority:99;
//	color:blue;
//	text-decoration:underline;}}
//a:visited, span.MsoHyperlinkFollowed
//	{{mso-style-priority:99;
//	color:purple;
//	text-decoration:underline;}}
//p
//	{{mso-style-priority:99;
//	mso-margin-top-alt:auto;
//	margin-right:0in;
//	mso-margin-bottom-alt:auto;
//	margin-left:0in;
//	font-size:12.0pt;
//	font-family:'Times New Roman','serif';}}
//span.EmailStyle18
//	{{mso-style-type:personal-reply;
//	font-family:'Calibri','sans-serif';
//	color:#1F497D;}}
//.MsoChpDefault
//	{{mso-style-type:export-only;}}
//@page WordSection1
//	{{size:8.5in 11.0in;
//	margin:1.0in 1.0in 1.0in 1.0in;}}
//div.WordSection1
//	{{page:WordSection1;}}
//--></style>
//</head>
//<body lang='EN-US' link='blue' vlink='purple'>
//    <div class='WordSection1'>
//        <table class='MsoNormalTable' border='1' cellspacing='0' cellpadding='0' width='100%'
//            style='width: 100.0%; border: none; border-bottom: solid #E8731F 1.5pt'>
//            <tbody>
//                <tr>
//                    <td valign='top' style='border: none;'>
//                        <p class='MsoNormal' align='left' style='text-align: left'>
//                        </p>
//                    </td>
//                    <td width='100%' valign='top' style='width: 100.0%; border: none; padding: 0in 15.0pt 7.5pt 7.5pt'>
//                        <p class='MsoNormal'>
//                            &nbsp;
//                         </p>
//                    </td>
//                    <td valign='bottom' style='border: none; padding: 0in 15.0pt 7.5pt 7.5pt'>
//                        <p class='MsoNormal' align='right' style='text-align: right;white-space: nowrap'>
//<span style='font-size:10.0pt;font-family:Verdana,sans-serif;color: #3B5998;white-space: nowrap'><b>Follow Us:</b></span> 
//<a href='http://www.facebook.com/pages/Q8CricInfo/148143445280528' target='_blank' title='Q8CricInfo.com on Facebook' ><img src='cid:FB_Logo' width='26' height='26' border='0' /></a>  
//</p>
//                    </td>
//                </tr>
//            </tbody>
//        </table>
// <br />
//        <p>
//            <span style='font-size: 10.0pt; font-family: Verdana,sans-serif; color: dimgray'>[<b>Note:</b>
//                This is an auto alert generated by <b>Q8CricInfo.com</b> to notify the User.</span><span
//                    style='font-size: 10.0pt; font-family: Verdana,sans-serif; color: dimgray'>]
//                   </span></p>
//        <p>
//            <b><span style='font-size: 10.0pt; font-family: Verdana,sans-serif; color: dimgray'>
//                Dear </span></b><span style='font-size:10.0pt;font-family:Verdana,sans-serif;color:dimgray'> {0} {1},
//</span></p>
//        <table class='MsoNormalTable' border='0' cellpadding='0' cellspacing='0' width='100%'
//            style='width: 100.0%' id='tbl_1'>
//            <tbody>
//                <tr>
//                    <td width='100%'>
//                        <p>
//                            <span style='font-size: 10.0pt; font-family: Verdana,sans-serif; color: dimgray'>Thank you for your Q8CricInfo.com account registration. Kindly find below your login details:
//                              </span></p>
//                    </td>
//                </tr>
//            </tbody>
//        </table>
//        <p class='MsoNormal'>
//            <span style='font-size: 10.0pt; font-family:calibri,sans-serif;'>
//                </span></p>
//        <table class='MsoNormalTable' border='0' cellpadding='0' width='100%' style='width: 100.0%'
//            id='table_1'>
//            <tbody>
//                  <tr>
//            <td style='padding: 5px 0px 5px 0px'>
//                <p class='MsoNormal'>
//                    <b><span style='font-size: 10.0pt; font-family: Verdana,sans-serif; color: #BC481A;
//                        white-space: nowrap'>User ID:
//                        <br />
//                    </span><span style='font-size: 10.0pt; font-family: Verdana,sans-serif; color: #BC481A;
//                        white-space: nowrap'>Password:
//                        <br /><br />
//                    </span><span style='font-size: 10.0pt; font-family: Verdana,sans-serif; color: #BC481A;
//                        white-space: nowrap'>Registered Email: </span>
//                        </b>
//                </p>
//            </td>
//            <td width='100%' style='padding: 5px 5px 5px 20px' align='left'>
//                <p class='MsoNormal'>
//                    <span style='font-size: 10.0pt; font-family: Verdana,sans-serif; color: black; white-space: nowrap'>
//                        {2}
//                        <br />
//                    </span><span style='font-size: 10.0pt; font-family: Verdana,sans-serif; color: black;
//                        white-space: nowrap'>{3}
//                        <br /><br />
//                    </span><span style='font-size: 10.0pt; font-family: Verdana,sans-serif; color: black;
//                        white-space: nowrap'>{4}</span>
//                </p>
//            </td>
//        </tr>
//            </tbody>
//        </table>
//        <br />
//        <p>
//            <span style='font-size: 10.0pt; font-family: Verdana,sans-serif; color: dimgray'>
//                You may access Q8CricInfo.com using the link: <a href='http://{5}' target='_blank'><span style='color: #3B5998;
//                    text-decoration: none'><b><u>http://{5}</u></b></span></a>
//              </span></p>
//        <p>
//            <span style='font-size: 10.0pt; font-family: Verdana,sans-serif; color: dimgray'>If
//                you have any questions or need assistance, please contact us at: <a href='mailto:support@Q8CricInfo.com'>support@Q8CricInfo.com</a>
//              </span></p>
//        <p>
//            <span style='font-size: 10.0pt; font-family: Verdana,sans-serif; color: dimgray'>Thank you for choosing Q8CricInfo.com. We are committed to providing you with the services and support to help you succeed online.
//</span></p>
//        <br />
//        <p>
//            <span style='font-size: 10.0pt; font-family: Verdana,sans-serif; color: dimgray'><b>
//                Best Wishes,</b>
//                <br />
//                The Q8CricInfo.com Team
//                <br />
//                <br />
//                <a href='http://{5}' target='_blank'><span style='color: #3B5998;
//                    text-decoration: none'><b><u>http://{5}</u></b></span></a>
//            </span>
//        </p>
//    </div>
//</body>
//</html>
//";
//            string FromId = "Q8CricInfo.com<support@Q8CricInfo.com>";
//            string host = Context.Request.UrlReferrer.AbsoluteUri.Split(new char[] { '/' })[2];
//            EmailObject email = new EmailObject(FromId, PD["UserEmail"].ParameterValue, string.Empty, "support@Q8CricInfo.com", "Welcome to Q8CricInfo.com", string.Format(EmailHTML, PD["FirstName"].ParameterValue, PD["LastName"].ParameterValue, PD["userid"].ParameterValue, PD["Password"].ParameterValue, PD["UserEmail"].ParameterValue, host), true, true);
//            email.SendMail("smtp.Q8CricInfo.com", 2525, "support@Q8CricInfo.com", "fisa@143");
//            return "'1||OK||Mail Sent'";
//        }


//        public string UpdateUser(string ServiceInfo)
//        {

//            string Status = "";
//            ParamDictionary<string, QueryParameter> PD = LoadForm(ServiceInfo).GetFirstFormParams();

//            //System.Web.HttpContext ctx = System.Web.HttpContext.Current;
//            //if (PD.ContainsKey("SessionParams"))
//            //{
//            //    string[] qp = PD["SessionParams"].ParameterValue.Split(new char[] { ',' });
//            //    if (ctx.Session != null)
//            //    {
//            //        for (int i = 0; i < qp.Length; i++)
//            //        {
//            //            object param = ctx.Session[qp[i]];
//            //            if (param != null)
//            //                PD.AddQueryParam(qp[i], new QueryParameter(param.ToString()));
//            //        }
//            //    }
//            //}
//            string hash = PD["password"].ParameterValue == "****" ? "@EV" :
//                GetAuthHash(
//               PD["userid"].ParameterValue,
//               PD["password"].ParameterValue
//               , "enilno8qsrac"
//                );
//            AddQueryParam(PD,
//               "AuthenticationHash", hash);

//            Status = "'" + VehiclesOnlineDAL.DBHelper.InvokeSP(PD["Command"].ParameterValue + "_SP", PD) + "'";
//            return Status;

//        }
//        public string GetCurrentUser(string ServiceInfo)
//        {

//            ParamDictionary<string, QueryParameter> PD = LoadForm(ServiceInfo).GetFirstFormParams();
//            //System.Web.HttpContext ctx = System.Web.HttpContext.Current;
//            //if (PD.ContainsKey("SessionParams"))
//            //{
//            //    string[] qp = PD["SessionParams"].ParameterValue.Split(new char[] { ',' });
//            //    for (int i = 0; i < qp.Length; i++)
//            //    {
//            //        object param = ctx.Session[qp[i]];
//            //        if (param != null)
//            //            PD.AddQueryParam(qp[i], new QueryParameter(param.ToString()));
//            //    }
//            //}
//            DataSet ds = VehiclesOnlineDAL.DBHelper.GetDataTableProc(PD["Command"].ParameterValue + "_SP", PD);
//            if (ds.Tables[0].Rows.Count > 0)
//            {
//                return string.Format("{{Rows:{0},Count:{1}}}",
//                        JsonConvert.SerializeObject(ds.Tables[0]), ds.Tables[0].Rows.Count
//                       );
//            }
//            else
//            {
//                return string.Format("{{Rows:{0},Count:{1}}}", "[]", 0);
//            }


//        }
//        public string GetAuthHash(string UserEmail, string UserPassword, string UserRoles)
//        {
//            string PassHash = Hashing.ComputeHash(UserPassword, Hashing.HashType.SHA1, null);
//            string passPhrase = "Pas5pr@se";        // can be any string
//            string initVector = "@1B2c3D4e5F6g7H8"; // must be 16 bytes

//            RijndaelEnhanced rijndaelKey =
//                new RijndaelEnhanced(passPhrase, initVector);

//            return rijndaelKey.Encrypt(UserEmail + "@|" + PassHash + "@|" + UserRoles);


//        }

//        public string PasswordResetEmail(string ServiceInfo)
//        {
//            ParamDictionary<string, QueryParameter> PD = LoadForm(ServiceInfo).GetFirstFormParams();
//            DataTable dtAccounts = VehiclesOnlineDAL.DBHelper.GetDataTableProc("Select_User_Profile_Accounts_sp", PD).Tables[0];



//            StringBuilder sbEmailRows = new StringBuilder(8140), InsSql = new StringBuilder(1024);
//            string EmailHTML = @"<html xmlns:v='urn:schemas-microsoft-com:vml' xmlns:o='urn:schemas-microsoft-com:office:office'
//xmlns:w='urn:schemas-microsoft-com:office:word' xmlns:m='http://schemas.microsoft.com/office/2004/12/omml'
//xmlns='http://www.w3.org/TR/REC-html40'>
//<head>
//    <meta http-equiv='Content-Type' content='text/html; charset=us-ascii'>
//    <meta name='Generator' content='Microsoft Word 12 (filtered medium)'>
//    <style><!--
///* Font Definitions */
//@font-face
//	{{font-family:Calibri;
//	panose-1:2 15 5 2 2 2 4 3 2 4;}}
//@font-face
//	{{font-family:Tahoma;
//	panose-1:2 11 6 4 3 5 4 4 2 4;}}
//@font-face
//	{{font-family:Verdana;
//	panose-1:2 11 6 4 3 5 4 4 2 4;}}
///* Style Definitions */
//p.MsoNormal, li.MsoNormal, div.MsoNormal
//	{{margin:0in;
//	margin-bottom:.0001pt;
//	font-size:12.0pt;
//	font-family:'Times New Roman','serif';}}
//a:link, span.MsoHyperlink
//	{{mso-style-priority:99;
//	color:blue;
//	text-decoration:underline;}}
//a:visited, span.MsoHyperlinkFollowed
//	{{mso-style-priority:99;
//	color:purple;
//	text-decoration:underline;}}
//p
//	{{mso-style-priority:99;
//	mso-margin-top-alt:auto;
//	margin-right:0in;
//	mso-margin-bottom-alt:auto;
//	margin-left:0in;
//	font-size:12.0pt;
//	font-family:'Times New Roman','serif';}}
//span.EmailStyle18
//	{{mso-style-type:personal-reply;
//	font-family:'Calibri','sans-serif';
//	color:#1F497D;}}
//.MsoChpDefault
//	{{mso-style-type:export-only;}}
//@page WordSection1
//	{{size:8.5in 11.0in;
//	margin:1.0in 1.0in 1.0in 1.0in;}}
//div.WordSection1
//	{{page:WordSection1;}}
//--></style>
//</head>
//<body lang='EN-US' link='blue' vlink='purple'>
//    <div class='WordSection1'>
//        <table class='MsoNormalTable' border='1' cellspacing='0' cellpadding='0' width='100%'
//            style='width: 100.0%; border: none; border-bottom: solid #E8731F 1.5pt'>
//            <tbody>
//                <tr>
//                    <td valign='top' style='border: none;'>
//                        <p class='MsoNormal' align='left' style='text-align: left'>
//</p>
//                    </td>
//                    <td width='100%' valign='top' style='width: 100.0%; border: none; padding: 0in 15.0pt 7.5pt 7.5pt'>
//                        <p class='MsoNormal'>
//                            &nbsp;
//                         </p>
//                    </td>
//                    <td valign='bottom' style='border: none; padding: 0in 15.0pt 7.5pt 7.5pt'>
//                                                <p class='MsoNormal' align='right' style='text-align: right;white-space: nowrap'>
//<span style='font-size:10.0pt;font-family:Verdana,sans-serif;color: #3B5998;white-space: nowrap'><b>Follow Us:</b></span> 
//<a href='http://www.facebook.com/pages/Q8CricInfo/148143445280528' target='_blank' title='Q8CricInfo.com on Facebook' ><img src='cid:FB_Logo' width='26' height='26' border='0' /></a>
//</p>
//                    </td>
//                </tr>
//            </tbody>
//        </table>
// <br />
//        <p>
//            <span style='font-size: 10.0pt; font-family: Verdana,sans-serif; color: dimgray'>[<b>Note:</b>
//                This is an auto alert generated by <b>Q8CricInfo.com</b> to notify the User.</span><span
//                    style='font-size: 10.0pt; font-family: Verdana,sans-serif; color: dimgray'>]
//                   </span></p>
//        <p>
//            <b><span style='font-size: 10.0pt; font-family: Verdana,sans-serif; color: dimgray'>
//                Dear User,</span></b></p>
//        <table class='MsoNormalTable' border='0' cellpadding='0' cellspacing='0' width='100%'
//            style='width: 100.0%' id='tbl_1'>
//            <tbody>
//                <tr>
//                    <td width='100%'>
//                        <p>
//                            <span style='font-size: 10.0pt; font-family: Verdana,sans-serif; color: dimgray'>
//To reset your Q8CricInfo.com ID Password, simply click the Reset Password link below. That will take you to our web page where you can create a new password.
//                              </span></p>
//                        <p>
//                            <span style='font-size: 10.0pt; font-family: Verdana,sans-serif; color: dimgray'>
//                        Please note that the link will expire one day after this email was sent.
//                               </span></p>
//                    </td>
//                </tr>
//            </tbody>
//        </table>
//        <p class='MsoNormal'>
//            <span style='font-size: 10.0pt; font-family:calibri,sans-serif;'>
//                </span></p>
//        <table class='MsoNormalTable' border='0' cellpadding='0' width='100%' style='width: 100.0%'
//            id='table_1'>
//            <tbody>
//            {0}
//            </tbody>
//        </table>
//        <br />
//   <p>
//            <span style='font-size: 10.0pt; font-family: Verdana,sans-serif; color: dimgray'>
//If you were not trying to reset your password, do not worry, your account is still secure and no one has been given access to it. Most likely, someone just mistyped their email address while trying to reset their own password.
//              </span></p>
//        <p>
//            <span style='font-size: 10.0pt; font-family: Verdana,sans-serif; color: dimgray'>If
//                you have any questions or need assistance, please contact us at: <a href='mailto:support@Q8CricInfo.com'>support@Q8CricInfo.com</a>
//              </span></p>
//        <p>
//            <span style='font-size: 10.0pt; font-family: Verdana,sans-serif; color: dimgray'>Thank you for choosing Q8CricInfo.com. We are committed to providing you with the services and support to help you succeed online.
//</span></p>
//        <br />
//        <p>
//            <span style='font-size: 10.0pt; font-family: Verdana,sans-serif; color: dimgray'><b>
//                Best Wishes,</b>
//                <br />
//                The Q8CricInfo.com Team
//                <br />
//                <br />
//                <a href='http://{1}' target='_blank'><span style='color: #3B5998;
//                    text-decoration: none'><b><u>http://{1}</u></b></span></a>
//            </span>
//        </p>
//    </div>
//</body>
//</html>
//", EmailRT = @"
//        <tr>
//            <td style='padding: 5px 0px 5px 0px'>
//                <p class='MsoNormal'>
//                    <b><span style='font-size: 10.0pt; font-family: Verdana,sans-serif; color: #BC481A;
//                        white-space: nowrap'>User Name:
//                        <br />
//                    </span><span style='font-size: 10.0pt; font-family: Verdana,sans-serif; color: #BC481A;
//                        white-space: nowrap'>User ID:
//                        <br />
//                    </span><span style='font-size: 10.0pt; font-family: Verdana,sans-serif; color: #BC481A;
//                        white-space: nowrap'>Reset Password: </span>
//                        </b>
//                </p>
//            </td>
//            <td width='100%' style='padding: 5px 5px 5px 20px' align='left'>
//                <p class='MsoNormal'>
//                    <span style='font-size: 10.0pt; font-family: Verdana,sans-serif; color: black; white-space: nowrap'>
//                        {1}
//                        <br />
//                    </span><span style='font-size: 10.0pt; font-family: Verdana,sans-serif; color: black;
//                        white-space: nowrap'>{0}
//                        <br />
//                    </span><span style='font-size: 10.0pt; font-family: Verdana,sans-serif; color: black;
//                        white-space: nowrap'><a href='{2}' target='_blank'>Click Here</a></span>
//                </p>
//            </td>
//        </tr>
//", SQLTP = @"
//INSERT INTO User_Profile_Reset_Password
//                      (UserEmail, UserId, ResetToken, [$IP])
//VALUES     ('{0}',N'{1}','{2}','{3}')
//";

//            string host = Context.Request.UrlReferrer.AbsoluteUri.Split(new char[] { '/' })[2];
//            foreach (DataRow dr in dtAccounts.Rows)
//            {
//                string Token = Guid.NewGuid().ToString();



//                sbEmailRows.Append(string.Format(EmailRT, dr["UserId"].ToString(), dr["Name"].ToString(),
//                    @"http://" + host + "/default.aspx?showwidget= " + Context.Server.UrlEncode("WidgetId:'frmForgotPassword',params:{Reset:'" + Token + "'}")));
//                InsSql.AppendFormat(SQLTP, dr["UserEmail"].ToString(), dr["UserId"].ToString(), Token, Session["IP"].ToString());
//            }
//            try
//            {
//                VehiclesOnlineDAL.DBHelper.ExecScript(InsSql.ToString());
//            }
//            catch (Exception ex)
//            {

//            }
//            string FromId = "Q8CricInfo.com<support@Q8CricInfo.com>";
//            EmailObject email = new EmailObject(FromId, PD["UserEmail"].ParameterValue, string.Empty, "support@Q8CricInfo.com", "How to reset your Q8CricInfo.com ID Password", string.Format(EmailHTML, sbEmailRows.ToString(), host), true, true);
//            email.SendMail("smtp.Q8CricInfo.com", 2525, "support@Q8CricInfo.com", "fisa@143");
//            return "'1||OK||Mail Sent'";
//        }
//        public string ResetPassword(string ServiceInfo)
//        {

//            ParamDictionary<string, QueryParameter> PD = LoadForm(ServiceInfo).GetFirstFormParams();
//            if (PD.ContainsKey("VerifyToken"))
//            {
//                string SSQL = string.Format(@"
//                    SELECT count(ResetToken)     
//                    FROM         User_Profile_Reset_Password
//                    WHERE     (ResetToken = '{0}') AND ([$DateCreated] + 1 > GETDATE())
//                    ", PD["ResetToken"].ParameterValue);

//                object o = VehiclesOnlineDAL.DBHelper.ExecutScaler(SSQL);
//                return "'" + o.ToString() + "||OK||Mail Sent'";
//            }
//            else
//            {

//                DataTable dt = VehiclesOnlineDAL.DBHelper.GetDataSet("select UserId from User_Profile_Reset_Password where ResetToken = '" + PD["ResetToken"].ParameterValue.Replace("'", "''") + "'").Tables[0];
//                if (dt.Rows.Count > 0)
//                {
//                    AddQueryParam(PD,
//                 "AuthenticationHash", GetAuthHash(
//                 dt.Rows[0]["UserId"].ToString(),
//                 PD["password"].ParameterValue
//                 , "enilno8qsrac"
//                  ));



//                    return "'" + VehiclesOnlineDAL.DBHelper.InvokeSP("Update_User_Profile_Reset_Password_SP", PD) + "'";

//                }
//                else
//                {
//                    return "'0||Failed||Failed To Change Password'";
//                }
//            }

//        }
    }

 public class RijndaelEnhanced
{
    #region Private members
    // If hashing algorithm is not specified, use SHA-1.
    private static string  DEFAULT_HASH_ALGORITHM  = "SHA1";
 
    // If key size is not specified, use the longest 256-bit key.
    private static int     DEFAULT_KEY_SIZE        = 256;
 
    // Do not allow salt to be longer than 255 bytes, because we have only
    // 1 byte to store its length. 
    private static int     MAX_ALLOWED_SALT_LEN    = 255;
 
    // Do not allow salt to be smaller than 4 bytes, because we use the first
    // 4 bytes of salt to store its length. 
    private static int     MIN_ALLOWED_SALT_LEN    = 4;
 
    // Random salt value will be between 4 and 8 bytes long.
    private static int     DEFAULT_MIN_SALT_LEN    = MIN_ALLOWED_SALT_LEN;
    private static int     DEFAULT_MAX_SALT_LEN    = 8;
 
    // Use these members to save min and max salt lengths.
    private int     minSaltLen              = -1;
    private int     maxSaltLen              = -1;
 
    // These members will be used to perform encryption and decryption.
    private ICryptoTransform encryptor      = null;
    private ICryptoTransform decryptor      = null;
    #endregion
 
    #region Constructors
    /// <summary>
    /// Use this constructor if you are planning to perform encryption/
    /// decryption with 256-bit key, derived using 1 password iteration,
    /// hashing without salt, no initialization vector, electronic codebook
    /// (ECB) mode, SHA-1 hashing algorithm, and 4-to-8 byte long salt.
    /// </summary>
    /// <param name="passPhrase">
    /// Passphrase from which a pseudo-random password will be derived.
    /// The derived password will be used to generate the encryption key.
    /// Passphrase can be any string. In this example we assume that the
    /// passphrase is an ASCII string. Passphrase value must be kept in
    /// secret.
    /// </param>
    /// <remarks>
    /// This constructor is not recommended because it does not use
    /// initialization vector and uses the ECB cipher mode, which is less
    /// secure than the CBC mode.
    /// </remarks>
    public RijndaelEnhanced(string  passPhrase) : 
        this(passPhrase, null)
    {
    }
 
    /// <summary>
    /// Use this constructor if you are planning to perform encryption/
    /// decryption with 256-bit key, derived using 1 password iteration,
    /// hashing without salt, cipher block chaining (CBC) mode, SHA-1
    /// hashing algorithm, and 4-to-8 byte long salt.
    /// </summary>
    /// <param name="passPhrase">
    /// Passphrase from which a pseudo-random password will be derived.
    /// The derived password will be used to generate the encryption key.
    /// Passphrase can be any string. In this example we assume that the
    /// passphrase is an ASCII string. Passphrase value must be kept in
    /// secret.
    /// </param>
    /// <param name="initVector">
    /// Initialization vector (IV). This value is required to encrypt the
    /// first block of plaintext data. For RijndaelManaged class IV must be
    /// exactly 16 ASCII characters long. IV value does not have to be kept
    /// in secret.
    /// </param>
    public RijndaelEnhanced(string  passPhrase,
                            string  initVector) :
        this(passPhrase, initVector, -1)
    {
    }
 
    /// <summary>
    /// Use this constructor if you are planning to perform encryption/
    /// decryption with 256-bit key, derived using 1 password iteration,
    /// hashing without salt, cipher block chaining (CBC) mode, SHA-1 
    /// hashing algorithm, and 0-to-8 byte long salt.
    /// </summary>
    /// <param name="passPhrase">
    /// Passphrase from which a pseudo-random password will be derived.
    /// The derived password will be used to generate the encryption key
    /// Passphrase can be any string. In this example we assume that the
    /// passphrase is an ASCII string. Passphrase value must be kept in
    /// secret.
    /// </param>
    /// <param name="initVector">
    /// Initialization vector (IV). This value is required to encrypt the
    /// first block of plaintext data. For RijndaelManaged class IV must be
    /// exactly 16 ASCII characters long. IV value does not have to be kept
    /// in secret.
    /// </param>
    /// <param name="minSaltLen">
    /// Min size (in bytes) of randomly generated salt which will be added at
    /// the beginning of plain text before encryption is performed. When this
    /// value is less than 4, the default min value will be used (currently 4
    /// bytes).
    /// </param>
    public RijndaelEnhanced(string  passPhrase,
                            string  initVector,
                            int     minSaltLen) :
        this(passPhrase, initVector, minSaltLen, -1)
    {
    }
 
    /// <summary>
    /// Use this constructor if you are planning to perform encryption/
    /// decryption with 256-bit key, derived using 1 password iteration,
    /// hashing without salt, cipher block chaining (CBC) mode, SHA-1
    /// hashing algorithm. Use the minSaltLen and maxSaltLen parameters to
    /// specify the size of randomly generated salt.
    /// </summary>
    /// <param name="passPhrase">
    /// Passphrase from which a pseudo-random password will be derived.
    /// The derived password will be used to generate the encryption key.
    /// Passphrase can be any string. In this example we assume that the
    /// passphrase is an ASCII string. Passphrase value must be kept in
    /// secret.
    /// </param>
    /// <param name="initVector">
    /// Initialization vector (IV). This value is required to encrypt the
    /// first block of plaintext data. For RijndaelManaged class IV must be
    /// exactly 16 ASCII characters long. IV value does not have to be kept
    /// in secret.
    /// </param>
    /// <param name="minSaltLen">
    /// Min size (in bytes) of randomly generated salt which will be added at
    /// the beginning of plain text before encryption is performed. When this
    /// value is less than 4, the default min value will be used (currently 4
    /// bytes).
    /// </param>
    /// <param name="maxSaltLen">
    /// Max size (in bytes) of randomly generated salt which will be added at
    /// the beginning of plain text before encryption is performed. When this
    /// value is negative or greater than 255, the default max value will be
    /// used (currently 8 bytes). If max value is 0 (zero) or if it is smaller
    /// than the specified min value (which can be adjusted to default value),
    /// salt will not be used and plain text value will be encrypted as is.
    /// In this case, salt will not be processed during decryption either.
    /// </param>
    public RijndaelEnhanced(string  passPhrase,
                            string  initVector,
                            int     minSaltLen,
                            int     maxSaltLen) :
        this(passPhrase, initVector, minSaltLen, maxSaltLen, -1)
    {
    }
 
    /// <summary>
    /// Use this constructor if you are planning to perform encryption/
    /// decryption using the key derived from 1 password iteration,
    /// hashing without salt, cipher block chaining (CBC) mode, and
    /// SHA-1 hashing algorithm.
    /// </summary>
    /// <param name="passPhrase">
    /// Passphrase from which a pseudo-random password will be derived.
    /// The derived password will be used to generate the encryption key.
    /// Passphrase can be any string. In this example we assume that the
    /// passphrase is an ASCII string. Passphrase value must be kept in
    /// secret.
    /// </param>
    /// <param name="initVector">
    /// Initialization vector (IV). This value is required to encrypt the
    /// first block of plaintext data. For RijndaelManaged class IV must be
    /// exactly 16 ASCII characters long. IV value does not have to be kept
    /// in secret.
    /// </param>
    /// <param name="minSaltLen">
    /// Min size (in bytes) of randomly generated salt which will be added at
    /// the beginning of plain text before encryption is performed. When this
    /// value is less than 4, the default min value will be used (currently 4
    /// bytes).
    /// </param>
    /// <param name="maxSaltLen">
    /// Max size (in bytes) of randomly generated salt which will be added at
    /// the beginning of plain text before encryption is performed. When this
    /// value is negative or greater than 255, the default max value will be 
    /// used (currently 8 bytes). If max value is 0 (zero) or if it is smaller
    /// than the specified min value (which can be adjusted to default value),
    /// salt will not be used and plain text value will be encrypted as is.
    /// In this case, salt will not be processed during decryption either.
    /// </param>
    /// <param name="keySize">
    /// Size of symmetric key (in bits): 128, 192, or 256.
    /// </param>
    public RijndaelEnhanced(string  passPhrase,
                            string  initVector,
                            int     minSaltLen,
                            int     maxSaltLen,
                            int     keySize) :
        this(passPhrase, initVector, minSaltLen, maxSaltLen, keySize, null)
    {
    }
 
    /// <summary>
    /// Use this constructor if you are planning to perform encryption/
    /// decryption using the key derived from 1 password iteration, hashing 
    /// without salt, and cipher block chaining (CBC) mode.
    /// </summary>
    /// <param name="passPhrase">
    /// Passphrase from which a pseudo-random password will be derived.
    /// The derived password will be used to generate the encryption key.
    /// Passphrase can be any string. In this example we assume that the
    /// passphrase is an ASCII string. Passphrase value must be kept in
    /// secret.
    /// </param>
    /// <param name="initVector">
    /// Initialization vector (IV). This value is required to encrypt the
    /// first block of plaintext data. For RijndaelManaged class IV must be
    /// exactly 16 ASCII characters long. IV value does not have to be kept
    /// in secret.
    /// </param>
    /// <param name="minSaltLen">
    /// Min size (in bytes) of randomly generated salt which will be added at
    /// the beginning of plain text before encryption is performed. When this
    /// value is less than 4, the default min value will be used (currently 4
    /// bytes).
    /// </param>
    /// <param name="maxSaltLen">
    /// Max size (in bytes) of randomly generated salt which will be added at
    /// the beginning of plain text before encryption is performed. When this
    /// value is negative or greater than 255, the default max value will be
    /// used (currently 8 bytes). If max value is 0 (zero) or if it is smaller
    /// than the specified min value (which can be adjusted to default value),
    /// salt will not be used and plain text value will be encrypted as is.
    /// In this case, salt will not be processed during decryption either.
    /// </param>
    /// <param name="keySize">
    /// Size of symmetric key (in bits): 128, 192, or 256.
    /// </param>
    /// <param name="hashAlgorithm">
    /// Hashing algorithm: "MD5" or "SHA1". SHA1 is recommended.
    /// </param>
    public RijndaelEnhanced(string  passPhrase,
                            string  initVector,
                            int     minSaltLen,
                            int     maxSaltLen, 
                            int     keySize,
                            string  hashAlgorithm) : 
        this(passPhrase, initVector, minSaltLen, maxSaltLen, keySize, 
             hashAlgorithm, null)
    {
    }
 
    /// <summary>
    /// Use this constructor if you are planning to perform encryption/
    /// decryption using the key derived from 1 password iteration, and
    /// cipher block chaining (CBC) mode.
    /// </summary>
    /// <param name="passPhrase">
    /// Passphrase from which a pseudo-random password will be derived.
    /// The derived password will be used to generate the encryption key.
    /// Passphrase can be any string. In this example we assume that the
    /// passphrase is an ASCII string. Passphrase value must be kept in
    /// secret.
    /// </param>
    /// <param name="initVector">
    /// Initialization vector (IV). This value is required to encrypt the
    /// first block of plaintext data. For RijndaelManaged class IV must be
    /// exactly 16 ASCII characters long. IV value does not have to be kept
    /// in secret.
    /// </param>
    /// <param name="minSaltLen">
    /// Min size (in bytes) of randomly generated salt which will be added at
    /// the beginning of plain text before encryption is performed. When this
    /// value is less than 4, the default min value will be used (currently 4
    /// bytes).
    /// </param>
    /// <param name="maxSaltLen">
    /// Max size (in bytes) of randomly generated salt which will be added at
    /// the beginning of plain text before encryption is performed. When this
    /// value is negative or greater than 255, the default max value will be
    /// used (currently 8 bytes). If max value is 0 (zero) or if it is smaller
    /// than the specified min value (which can be adjusted to default value),
    /// salt will not be used and plain text value will be encrypted as is.
    /// In this case, salt will not be processed during decryption either.
    /// </param>
    /// <param name="keySize">
    /// Size of symmetric key (in bits): 128, 192, or 256.
    /// </param>
    /// <param name="hashAlgorithm">
    /// Hashing algorithm: "MD5" or "SHA1". SHA1 is recommended.
    /// </param>
    /// <param name="saltValue">
    /// Salt value used for password hashing during key generation. This is
    /// not the same as the salt we will use during encryption. This parameter
    /// can be any string.
    /// </param>
    public RijndaelEnhanced(string  passPhrase,
                            string  initVector,
                            int     minSaltLen,
                            int     maxSaltLen, 
                            int     keySize,
                            string  hashAlgorithm,
                            string  saltValue) : 
        this(passPhrase, initVector, minSaltLen, maxSaltLen, keySize, 
             hashAlgorithm, saltValue, 1)
    {
    }
 
    /// <summary>
    /// Use this constructor if you are planning to perform encryption/
    /// decryption with the key derived from the explicitly specified
    /// parameters.
    /// </summary>
    /// <param name="passPhrase">
    /// Passphrase from which a pseudo-random password will be derived.
    /// The derived password will be used to generate the encryption key
    /// Passphrase can be any string. In this example we assume that the
    /// passphrase is an ASCII string. Passphrase value must be kept in
    /// secret.
    /// </param>
    /// <param name="initVector">
    /// Initialization vector (IV). This value is required to encrypt the
    /// first block of plaintext data. For RijndaelManaged class IV must be
    /// exactly 16 ASCII characters long. IV value does not have to be kept
    /// in secret.
    /// </param>
    /// <param name="minSaltLen">
    /// Min size (in bytes) of randomly generated salt which will be added at
    /// the beginning of plain text before encryption is performed. When this
    /// value is less than 4, the default min value will be used (currently 4
    /// bytes).
    /// </param>
    /// <param name="maxSaltLen">
    /// Max size (in bytes) of randomly generated salt which will be added at
    /// the beginning of plain text before encryption is performed. When this
    /// value is negative or greater than 255, the default max value will be
    /// used (currently 8 bytes). If max value is 0 (zero) or if it is smaller
    /// than the specified min value (which can be adjusted to default value),
    /// salt will not be used and plain text value will be encrypted as is.
    /// In this case, salt will not be processed during decryption either.
    /// </param>
    /// <param name="keySize">
    /// Size of symmetric key (in bits): 128, 192, or 256.
    /// </param>
    /// <param name="hashAlgorithm">
    /// Hashing algorithm: "MD5" or "SHA1". SHA1 is recommended.
    /// </param>
    /// <param name="saltValue">
    /// Salt value used for password hashing during key generation. This is
    /// not the same as the salt we will use during encryption. This parameter
    /// can be any string.
    /// </param>
    /// <param name="passwordIterations">
    /// Number of iterations used to hash password. More iterations are
    /// considered more secure but may take longer.
    /// </param>
    public RijndaelEnhanced(string  passPhrase,
                            string  initVector,
                            int     minSaltLen,
                            int     maxSaltLen, 
                            int     keySize,
                            string  hashAlgorithm,
                            string  saltValue,
                            int     passwordIterations)
    {
        // Save min salt length; set it to default if invalid value is passed.
        if (minSaltLen < MIN_ALLOWED_SALT_LEN)
            this.minSaltLen = DEFAULT_MIN_SALT_LEN;
        else
            this.minSaltLen = minSaltLen;
 
        // Save max salt length; set it to default if invalid value is passed.
        if (maxSaltLen < 0 || maxSaltLen > MAX_ALLOWED_SALT_LEN)
            this.maxSaltLen = DEFAULT_MAX_SALT_LEN;
        else
            this.maxSaltLen = maxSaltLen;
 
        // Set the size of cryptographic key.
        if (keySize <= 0)
            keySize = DEFAULT_KEY_SIZE;
 
        // Set the name of algorithm. Make sure it is in UPPER CASE and does
        // not use dashes, e.g. change "sha-1" to "SHA1".
        if (hashAlgorithm == null)
            hashAlgorithm = DEFAULT_HASH_ALGORITHM;
        else
            hashAlgorithm = hashAlgorithm.ToUpper().Replace("-", "");
 
        // Initialization vector converted to a byte array.
        byte[] initVectorBytes = null;
 
        // Salt used for password hashing (to generate the key, not during
        // encryption) converted to a byte array.
        byte[] saltValueBytes  = null;
 
        // Get bytes of initialization vector.
        if (initVector == null)
            initVectorBytes = new byte[0];
        else
            initVectorBytes = Encoding.ASCII.GetBytes(initVector);
 
        // Get bytes of salt (used in hashing).
        if (saltValue == null)
            saltValueBytes = new byte[0];
        else
            saltValueBytes = Encoding.ASCII.GetBytes(saltValue);
 
        // Generate password, which will be used to derive the key.
        PasswordDeriveBytes password = new PasswordDeriveBytes(
                                                   passPhrase,
                                                   saltValueBytes,
                                                   hashAlgorithm,
                                                   passwordIterations);
 
        // Convert key to a byte array adjusting the size from bits to bytes.
        byte[] keyBytes = password.GetBytes(keySize / 8);
 
        // Initialize Rijndael key object.
        RijndaelManaged symmetricKey = new RijndaelManaged();
 
        // If we do not have initialization vector, we cannot use the CBC mode.
        // The only alternative is the ECB mode (which is not as good).
        if (initVectorBytes.Length == 0)
            symmetricKey.Mode = CipherMode.ECB;
        else
            symmetricKey.Mode = CipherMode.CBC;
 
        // Create encryptor and decryptor, which we will use for cryptographic
        // operations.
        encryptor = symmetricKey.CreateEncryptor(keyBytes, initVectorBytes);
        decryptor = symmetricKey.CreateDecryptor(keyBytes, initVectorBytes);
    }
    #endregion
 
    #region Encryption routines
    /// <summary>
    /// Encrypts a string value generating a base64-encoded string.
    /// </summary>
    /// <param name="plainText">
    /// Plain text string to be encrypted.
    /// </param>
    /// <returns>
    /// Cipher text formatted as a base64-encoded string.
    /// </returns>
    public string Encrypt(string plainText)
    {
        return Encrypt(Encoding.UTF8.GetBytes(plainText));
    }
 
    /// <summary>
    /// Encrypts a byte array generating a base64-encoded string.
    /// </summary>
    /// <param name="plainTextBytes">
    /// Plain text bytes to be encrypted.
    /// </param>
    /// <returns>
    /// Cipher text formatted as a base64-encoded string.
    /// </returns>
    public string Encrypt(byte[] plainTextBytes)
    {
        return Convert.ToBase64String(EncryptToBytes(plainTextBytes));
    }
 
    /// <summary>
    /// Encrypts a string value generating a byte array of cipher text.
    /// </summary>
    /// <param name="plainText">
    /// Plain text string to be encrypted.
    /// </param>
    /// <returns>
    /// Cipher text formatted as a byte array.
    /// </returns>
    public byte[] EncryptToBytes(string plainText)
    {
        return EncryptToBytes(Encoding.UTF8.GetBytes(plainText));
    }
 
    /// <summary>
    /// Encrypts a byte array generating a byte array of cipher text.
    /// </summary>
    /// <param name="plainTextBytes">
    /// Plain text bytes to be encrypted.
    /// </param>
    /// <returns>
    /// Cipher text formatted as a byte array.
    /// </returns>
    public byte[] EncryptToBytes(byte[] plainTextBytes)
    {
        // Add salt at the beginning of the plain text bytes (if needed).
        byte[] plainTextBytesWithSalt = AddSalt(plainTextBytes);
 
        // Encryption will be performed using memory stream.
        MemoryStream memoryStream = new MemoryStream();
        
        // Let's make cryptographic operations thread-safe.
        lock (this)
        {
            // To perform encryption, we must use the Write mode.
            CryptoStream cryptoStream = new CryptoStream(
                                               memoryStream, 
                                               encryptor,
                                                CryptoStreamMode.Write);
 
            // Start encrypting data.
            cryptoStream.Write( plainTextBytesWithSalt, 
                                0, 
                               plainTextBytesWithSalt.Length);
             
            // Finish the encryption operation.
            cryptoStream.FlushFinalBlock();
 
            // Move encrypted data from memory into a byte array.
            byte[] cipherTextBytes = memoryStream.ToArray();
               
            // Close memory streams.
            memoryStream.Close();
            cryptoStream.Close();
 
            // Return encrypted data.
            return cipherTextBytes;
        }
    }
    #endregion
 
    #region Decryption routines
    /// <summary>
    /// Decrypts a base64-encoded cipher text value generating a string result.
    /// </summary>
    /// <param name="cipherText">
    /// Base64-encoded cipher text string to be decrypted.
    /// </param>
    /// <returns>
    /// Decrypted string value.
    /// </returns>
    public string Decrypt(string cipherText)
    {
        return Decrypt(Convert.FromBase64String(cipherText));
    }
 
    /// <summary>
    /// Decrypts a byte array containing cipher text value and generates a
    /// string result.
    /// </summary>
    /// <param name="cipherTextBytes">
    /// Byte array containing encrypted data.
    /// </param>
    /// <returns>
    /// Decrypted string value.
    /// </returns>
    public string Decrypt(byte[] cipherTextBytes)
    {
        return Encoding.UTF8.GetString(DecryptToBytes(cipherTextBytes));
    }
 
    /// <summary>
    /// Decrypts a base64-encoded cipher text value and generates a byte array
    /// of plain text data.
    /// </summary>
    /// <param name="cipherText">
    /// Base64-encoded cipher text string to be decrypted.
    /// </param>
    /// <returns>
    /// Byte array containing decrypted value.
    /// </returns>
    public byte[] DecryptToBytes(string cipherText)
    {
        return DecryptToBytes(Convert.FromBase64String(cipherText));
    }
 
    /// <summary>
    /// Decrypts a base64-encoded cipher text value and generates a byte array
    /// of plain text data.
    /// </summary>
    /// <param name="cipherTextBytes">
    /// Byte array containing encrypted data.
    /// </param>
    /// <returns>
    /// Byte array containing decrypted value.
    /// </returns>
    public byte[] DecryptToBytes(byte[] cipherTextBytes)
    {
        byte[] decryptedBytes      = null;
        byte[] plainTextBytes      = null;
        int    decryptedByteCount  = 0;
        int    saltLen             = 0;
 
        MemoryStream memoryStream = new MemoryStream(cipherTextBytes);
 
        // Since we do not know how big decrypted value will be, use the same
        // size as cipher text. Cipher text is always longer than plain text
        // (in block cipher encryption), so we will just use the number of
        // decrypted data byte after we know how big it is.
        decryptedBytes = new byte[cipherTextBytes.Length];
 
        // Let's make cryptographic operations thread-safe.
        lock (this)
        {
            // To perform decryption, we must use the Read mode.
            CryptoStream  cryptoStream = new CryptoStream(
                                               memoryStream,
                                               decryptor,
                                               CryptoStreamMode.Read);
 
            // Decrypting data and get the count of plain text bytes.
            decryptedByteCount  = cryptoStream.Read(decryptedBytes,
                                                    0, 
                                                    decryptedBytes.Length);
            // Release memory.
            memoryStream.Close();
            cryptoStream.Close();
        }
 
        // If we are using salt, get its length from the first 4 bytes of plain
        // text data.
        if (maxSaltLen > 0 && maxSaltLen >= minSaltLen)
        {
            saltLen =   (decryptedBytes[0] & 0x03) |
                        (decryptedBytes[1] & 0x0c) |
                        (decryptedBytes[2] & 0x30) |
                        (decryptedBytes[3] & 0xc0);
        }
 
        // Allocate the byte array to hold the original plain text (without salt).
        plainTextBytes = new byte[decryptedByteCount - saltLen];
 
        // Copy original plain text discarding the salt value if needed.
        Array.Copy(decryptedBytes, saltLen, plainTextBytes, 
                    0, decryptedByteCount - saltLen);
 
        // Return original plain text value.
        return plainTextBytes;
    }
    #endregion
 
    #region Helper functions
    /// <summary>
    /// Adds an array of randomly generated bytes at the beginning of the
    /// array holding original plain text value.
    /// </summary>
    /// <param name="plainTextBytes">
    /// Byte array containing original plain text value.
    /// </param>
    /// <returns>
    /// Either original array of plain text bytes (if salt is not used) or a
    /// modified array containing a randomly generated salt added at the 
    /// beginning of the plain text bytes. 
    /// </returns>
    private byte[] AddSalt(byte[] plainTextBytes)
    {
        // The max salt value of 0 (zero) indicates that we should not use 
        // salt. Also do not use salt if the max salt value is smaller than
        // the min value.
        if (maxSaltLen == 0 || maxSaltLen < minSaltLen)
            return plainTextBytes;
 
        // Generate the salt.
        byte[] saltBytes = GenerateSalt();
 
        // Allocate array which will hold salt and plain text bytes.
        byte[] plainTextBytesWithSalt = new byte[plainTextBytes.Length +
                                                 saltBytes.Length];
        // First, copy salt bytes.
        Array.Copy(saltBytes, plainTextBytesWithSalt, saltBytes.Length);
 
        // Append plain text bytes to the salt value.
        Array.Copy( plainTextBytes, 0, 
                    plainTextBytesWithSalt, saltBytes.Length,
                    plainTextBytes.Length);
 
        return plainTextBytesWithSalt;
    }
 
    /// <summary>
    /// Generates an array holding cryptographically strong bytes.
    /// </summary>
    /// <returns>
    /// Array of randomly generated bytes.
    /// </returns>
    /// <remarks>
    /// Salt size will be defined at random or exactly as specified by the
    /// minSlatLen and maxSaltLen parameters passed to the object constructor.
    /// The first four bytes of the salt array will contain the salt length
    /// split into four two-bit pieces.
    /// </remarks>
    private byte[] GenerateSalt()
    {
        // We don't have the length, yet.
        int saltLen = 0;
 
        // If min and max salt values are the same, it should not be random.
        if (minSaltLen == maxSaltLen)
            saltLen = minSaltLen;
        // Use random number generator to calculate salt length.
        else
            saltLen = GenerateRandomNumber(minSaltLen, maxSaltLen);
 
        // Allocate byte array to hold our salt.
        byte[] salt = new byte[saltLen];
 
        // Populate salt with cryptographically strong bytes.
        RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
 
        rng.GetNonZeroBytes(salt);
 
        // Split salt length (always one byte) into four two-bit pieces and
        // store these pieces in the first four bytes of the salt array.
        salt[0] = (byte)((salt[0] & 0xfc) | (saltLen & 0x03));
        salt[1] = (byte)((salt[1] & 0xf3) | (saltLen & 0x0c));
        salt[2] = (byte)((salt[2] & 0xcf) | (saltLen & 0x30));
        salt[3] = (byte)((salt[3] & 0x3f) | (saltLen & 0xc0));
 
        return salt;
    }
 
    /// <summary>
    /// Generates random integer.
    /// </summary>
    /// <param name="minValue">
    /// Min value (inclusive).
    /// </param>
    /// <param name="maxValue">
    /// Max value (inclusive).
    /// </param>
    /// <returns>
    /// Random integer value between the min and max values (inclusive).
    /// </returns>
    /// <remarks>
    /// This methods overcomes the limitations of .NET Framework's Random
    /// class, which - when initialized multiple times within a very short
    /// period of time - can generate the same "random" number.
    /// </remarks>
    private int GenerateRandomNumber(int minValue, int maxValue)
    {
        // We will make up an integer seed from 4 bytes of this array.
        byte[] randomBytes = new byte[4];
 
        // Generate 4 random bytes.
        RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
        rng.GetBytes(randomBytes);
 
        // Convert four random bytes into a positive integer value.
        int seed = ((randomBytes[0] & 0x7f) << 24) |
                    (randomBytes[1]         << 16) |
                    (randomBytes[2]         << 8 ) |
                    (randomBytes[3]);
 
        // Now, this looks more like real randomization.
        Random  random  = new Random(seed);
 
        // Calculate a random number.
        return random.Next(minValue, maxValue+1);
    }
    #endregion
}
 public class Hashing
 {
     public enum HashType
     {
         MD5 = 0,
         SHA1 = 1,
         SHA256,
         SHA384,
         SHA512,
     }
     /// <summary>
     /// Generates a hash for the given plain text value and returns a
     /// base64-encoded result. Before the hash is computed, a random salt
     /// is generated and appended to the plain text. This salt is stored at
     /// the end of the hash value, so it can be used later for hash
     /// verification.
     /// </summary>
     /// <param name="plainText">
     /// Plaintext value to be hashed. The function does not check whether
     /// this parameter is null.
     /// </param>
     /// <param name="hashAlgorithm">
     /// Name of the hash algorithm. Allowed values are: "MD5", "SHA1",
     /// "SHA256", "SHA384", and "SHA512" (if any other value is specified
     /// MD5 hashing algorithm will be used). This value is case-insensitive.
     /// </param>
     /// <param name="saltBytes">
     /// Salt bytes. This parameter can be null, in which case a random salt
     /// value will be generated.
     /// </param>
     /// <returns>
     /// Hash value formatted as a base64-encoded string.
     /// </returns>
     public static string ComputeHash(string plainText,
                                      HashType hashAlgorithm,
                                      byte[] saltBytes)
     {

         // If salt is not specified, generate it on the fly.
         if (saltBytes == null)
         {
             // Define min and max salt sizes.
             int minSaltSize = 4;
             int maxSaltSize = 8;

             // Generate a random number for the size of the salt.
             Random random = new Random();
             int saltSize = random.Next(minSaltSize, maxSaltSize);

             // Allocate a byte array, which will hold the salt.
             saltBytes = new byte[saltSize];

             // Initialize a random number generator.
             RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();

             // Fill the salt with cryptographically strong byte values.
             rng.GetNonZeroBytes(saltBytes);
         }

         // Convert plain text into a byte array.
         byte[] plainTextBytes = Encoding.UTF8.GetBytes(plainText);

         // Allocate array, which will hold plain text and salt.
         byte[] plainTextWithSaltBytes =
                 new byte[plainTextBytes.Length + saltBytes.Length];

         // Copy plain text bytes into resulting array.
         for (int i = 0; i < plainTextBytes.Length; i++)
             plainTextWithSaltBytes[i] = plainTextBytes[i];

         // Append salt bytes to the resulting array.
         for (int i = 0; i < saltBytes.Length; i++)
             plainTextWithSaltBytes[plainTextBytes.Length + i] = saltBytes[i];

         // Because we support multiple hashing algorithms, we must define
         // hash object as a common (abstract) base class. We will specify the
         // actual hashing algorithm class later during object creation.
         HashAlgorithm hash;


         // Initialize appropriate hashing algorithm class.
         switch (hashAlgorithm)
         {
             case HashType.SHA1:
                 hash = new SHA1Managed();
                 break;

             case HashType.SHA256:
                 hash = new SHA256Managed();
                 break;

             case HashType.SHA384:
                 hash = new SHA384Managed();
                 break;

             case HashType.SHA512:
                 hash = new SHA512Managed();
                 break;

             default:
                 hash = new MD5CryptoServiceProvider();
                 break;
         }

         // Compute hash value of our plain text with appended salt.
         byte[] hashBytes = hash.ComputeHash(plainTextWithSaltBytes);

         // Create array which will hold hash and original salt bytes.
         byte[] hashWithSaltBytes = new byte[hashBytes.Length +
                                             saltBytes.Length];

         // Copy hash bytes into resulting array.
         for (int i = 0; i < hashBytes.Length; i++)
             hashWithSaltBytes[i] = hashBytes[i];

         // Append salt bytes to the result.
         for (int i = 0; i < saltBytes.Length; i++)
             hashWithSaltBytes[hashBytes.Length + i] = saltBytes[i];

         // Convert result into a base64-encoded string.
         string hashValue = Convert.ToBase64String(hashWithSaltBytes);

         // Return the result.
         return hashValue;
     }

     /// <summary>
     /// Compares a hash of the specified plain text value to a given hash
     /// value. Plain text is hashed with the same salt value as the original
     /// hash.
     /// </summary>
     /// <param name="plainText">
     /// Plain text to be verified against the specified hash. The function
     /// does not check whether this parameter is null.
     /// </param>
     /// <param name="hashAlgorithm">
     /// Name of the hash algorithm. Allowed values are: "MD5", "SHA1", 
     /// "SHA256", "SHA384", and "SHA512" (if any other value is specified,
     /// MD5 hashing algorithm will be used). This value is case-insensitive.
     /// </param>
     /// <param name="hashValue">
     /// Base64-encoded hash value produced by ComputeHash function. This value
     /// includes the original salt appended to it.
     /// </param>
     /// <returns>
     /// If computed hash mathes the specified hash the function the return
     /// value is true; otherwise, the function returns false.
     /// </returns>
     public static bool VerifyHash(string plainText,
                                   HashType hashAlgorithm,
                                   string hashValue)
     {
         // Convert base64-encoded hash value into a byte array.
         byte[] hashWithSaltBytes = Convert.FromBase64String(hashValue);

         // We must know size of hash (without salt).
         int hashSizeInBits, hashSizeInBytes;

         // Make sure that hashing algorithm name is specified.


         // Size of hash is based on the specified algorithm.
         switch (hashAlgorithm)
         {
             case HashType.SHA1:
                 hashSizeInBits = 160;
                 break;

             case HashType.SHA256:
                 hashSizeInBits = 256;
                 break;

             case HashType.SHA384:
                 hashSizeInBits = 384;
                 break;

             case HashType.SHA512:
                 hashSizeInBits = 512;
                 break;

             default: // Must be MD5
                 hashSizeInBits = 128;
                 break;
         }

         // Convert size of hash from bits to bytes.
         hashSizeInBytes = hashSizeInBits / 8;

         // Make sure that the specified hash value is long enough.
         if (hashWithSaltBytes.Length < hashSizeInBytes)
             return false;

         // Allocate array to hold original salt bytes retrieved from hash.
         byte[] saltBytes = new byte[hashWithSaltBytes.Length -
                                     hashSizeInBytes];

         // Copy salt from the end of the hash to the new array.
         for (int i = 0; i < saltBytes.Length; i++)
             saltBytes[i] = hashWithSaltBytes[hashSizeInBytes + i];

         // Compute a new hash string.
         string expectedHashString =
                     ComputeHash(plainText, hashAlgorithm, saltBytes);

         // If the computed hash matches the specified hash,
         // the plain text value must be correct.
         return (hashValue == expectedHashString);
     }
 }


} //end of namespace
