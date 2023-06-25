using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Reflection;
using System.Web.Security;
using System.Xml;

using System.IO;

using Newtonsoft.Json;
using WebProject.AsyncWidgets.Utility;
using WebProject.AsyncWidgets.DAL;

namespace WebProject.AsyncWidgets.BAL
{

    public class DataHelper : ActionExecuter
    {
        private static DataHelper _O;
        public static DataHelper O
        {
            get {
                if (_O == null)
                {
                    _O = new DataHelper();
                }
                return _O;
            }
        
        }
        public object RecordExists(string ServiceInfo)
        {
            ParamDictionary<string, AsyncWidgets.DAL.QueryParameter> PD = LoadForm(ServiceInfo).GetFirstFormParams();
            // PD.FormName
            //string TableName = PD["StoreName"].ParameterValue
            return DBHelper.RecordExists(PD, PD.FormName, PD.UniqueKeys).ToString().ToLower();

        }
        public string DataAction(string ServiceInfo)
        {
            ServiceInfo = ServiceInfo.Replace("&nbsp;", "");
            ParamDictionary<string, AsyncWidgets.DAL.QueryParameter> PD = LoadForm(ServiceInfo).GetFirstFormParams();
            return "'"+ DBHelper.InvokeSP(PD["Command"].ParameterValue + "_SP", PD).ToString() +"'";
        }
        public string GetData(string ServiceInfo)
        {
            ParamDictionary<string, AsyncWidgets.DAL.QueryParameter> PD = LoadForm(ServiceInfo).GetFirstFormParams();
            DataSet ds = DBHelper.GetDataTableProc(PD["Command"].ParameterValue + "_SP", PD);
            if (ds.Tables[0].Rows.Count > 0)
            {
               return string.Format("{{Rows:{0},Count:{1}}}", JsonConvert.SerializeObject(ds.Tables[0], new Newtonsoft.Json.Converters.JavaScriptDateTimeConverter()), 0);
            }
            else
            {
                return string.Format("{{Rows:{0},Count:{1}}}", "[]",  0);
            }
        }
        public string DeleteRows(string ServiceInfo)
        {
            ParamDictionary<string, AsyncWidgets.DAL.QueryParameter> PD = LoadForm(ServiceInfo).GetFirstFormParams();
          //  DataSet ds = DBHelper.GetDataTableProc(PD["Command"].ParameterValue + "_SP", PD);
            return "'" + DBHelper.InvokeSP(PD["Command"].ParameterValue + "_SP", PD).ToString() + "'";
        }
        public string Search(string ServiceInfo)
        {

            ServiceInfo = ServiceInfo.Replace("&nbsp;","");
            ParamDictionary<string, AsyncWidgets.DAL.QueryParameter> PD = LoadForm(ServiceInfo).GetFirstFormParams();
            string SPName = PD.ContainsKey("Command") ? PD["Command"].ParameterValue + "_SP" : PD["DALInfo"].ParameterValue + "_SP";
            DataSet ds = DBHelper.GetDataTableProc(SPName , PD);
            if (ds.Tables[0].Rows.Count > 0)
            {
                //if (PD.ContainsKey("SortBy"))
                //{

                //    ds.Tables[0].DefaultView.Sort = PD["SortBy"].ToString();
                //}

                int PageNo = PD.ContainsKey("PageNo") ? Convert.ToInt32(PD["PageNo"].ParameterValue) : 1,
                    PageSize = PD.ContainsKey("PageSize") ? Convert.ToInt32(PD["PageSize"].ParameterValue) : 20;
                PageNo = PageNo < 0 ? 1 : PageNo;
                int
                    LastRec = PageNo * PageSize,
                    FirstRec = LastRec - PageSize + 1;
                decimal Pages = ((decimal)ds.Tables[0].Rows.Count) / PageSize;
                if (PageSize > -1)
                {
                    return string.Format("{{Rows:{0},Count:{1},Pages:{2}}}",
                                            JsonConvert.SerializeObject(DataRows(ds.Tables[0], FirstRec, LastRec), new Newtonsoft.Json.Converters.JavaScriptDateTimeConverter()),
                                            ds.Tables[0].Rows.Count,
                                            Math.Ceiling(Pages));
                }
                else
                {
                    return string.Format("{{Rows:{0},Count:{1},Pages:{2}}}",
                            JsonConvert.SerializeObject(ds.Tables[0], new Newtonsoft.Json.Converters.JavaScriptDateTimeConverter()),
                            ds.Tables[0].Rows.Count,
                            Math.Ceiling(Pages));
                }

            }
            else
            {
                return string.Format("{{Rows:{0},Count:{1},Pages:{2}}}", "[]", 0, 0);
            }
        }
        public DataTable DataRows(DataTable table, int StartIndex, int EndIndex)
        {
            DataTable dtNew = table.Clone();
            int PageSize = EndIndex - StartIndex + 1;
            DataRow[] DRs = new DataRow[PageSize];
            for (int i = StartIndex - 1; i < EndIndex && i < table.Rows.Count; i++)
            {
                //    DRs[i % PageSize] = table.Rows[i];
                //DataRow dr = table.Rows[i];
                //table.Rows.Remove(dr);
                dtNew.ImportRow(table.Rows[i]);
            }
            return dtNew;

        }
        public string AutoComplete(string ServiceInfo)
        {
            try
            {
                ParamDictionary<string, AsyncWidgets.DAL.QueryParameter> PD = LoadForm(ServiceInfo).GetFirstFormParams();
                DataTable dtAutoComplete = DBHelper.GetDataTableProc(PD["StoreId"].ParameterValue+"_SP",  PD).Tables[0];
                StringBuilder snResult = new StringBuilder(1024);

                foreach (DataRow objRow in dtAutoComplete.Rows)
                {
                    if (objRow[0].ToString().Contains("'"))
                    {
                        string t;
                        t = objRow[0].ToString();
                    }
                  //  snResult.Append(objRow[0].ToString().Replace("\r\n", "").Replace("\'", "\\\'") + @"\r\n");//Environment.NewLine);// + ", " + objRow["TeamName"].ToString());
                    snResult.Append(objRow[0].ToString().Replace("\r\n", "").Replace("\n","") + @"\r\n");//Environment.NewLine);// + ", " + objRow["TeamName"].ToString());
  
                }

                return "'" + snResult.ToString() + "'";
            }
            catch(Exception ex)
            {
                return "'" + ex.Message.Replace("\'","\\\'") + "'";
            }
           // return "'" + DBHelper.InvokeSP(PD["Command"].ParameterValue + "_SP", PD).ToString() + "'";
        }
        public string ChildComboRows(string ServiceInfo)
        {

            ParamDictionary<string, AsyncWidgets.DAL.QueryParameter> PD = LoadForm(ServiceInfo).GetFirstFormParams();
  

            if (PD.ContainsKey("Command"))
            {
                string Command = PD["Command"].ParameterValue + "_SP";

                return string.Format("{{Rows:{0}}}", JsonConvert.SerializeObject(AsyncWidgets.DAL.DBHelper.GetDataTableProc(Command, PD).Tables[0]));
            }
            else
            {
                string Cols = "", SSQL = "",
                    TextCol = PD["TextCol"].ParameterValue.Replace("-", "").Replace("'", ""), //replace is to prevent SQL injection
                    StoreId = "",
                    ValCol = PD["ValCol"].ParameterValue.Replace("-", "").Replace("'", ""),
                    ParentCol = PD.ContainsKey("ParentCol") ? PD["ParentCol"].ParameterValue.Replace("-", "").Replace("'", "''") : "",
                    Parentkey = PD.ContainsKey("Parentkey") ? PD["Parentkey"].ParameterValue : "";

                StoreId = PD["StoreId"].ParameterValue.Replace("-", "").Replace("'", "");


                if (Parentkey != "" && PD.ContainsKey("IsParentSTR"))
                {
                    if (PD["IsParentSTR"].ParameterValue == "false")
                    {
                        long iRes = 0; double dRes = 0; bool Con;

                        Con = Parentkey.Contains(".") ? 
                            double.TryParse(Parentkey, out dRes) : 
                            long.TryParse(Parentkey, out iRes);

                        if (Con) { 
                            Parentkey = iRes != 0 ? iRes.ToString() : dRes.ToString(); 
                        } 
                        else 
                        { 
                            Parentkey = "0"; 
                        }
                    }
                    else
                    {
                        Parentkey = "'" + Parentkey.Replace("'", "''") + "'";
                    }
                }
                //if (Convert.ToBoolean(PD["MultiLang"].ParameterValue))
                //{
                //    Cols = ValCol + ",isnull(" + TextCol + "_EN,'') " + TextCol + "_EN,isnull(" + TextCol + "_AR,'') " + TextCol + "_AR";

                //}
                //else
                //{
                    Cols = ValCol + ",isnull(" + TextCol + ",'') " + TextCol;
                //}
                ParentCol = ParentCol == "" ? "" : " and " + ParentCol;
                Parentkey = Parentkey == "" ? "" : " = " + Parentkey;
                SSQL = string.Format("select {0} from {1} where 1=1  {2}  {3}", Cols, StoreId, ParentCol, Parentkey);
                DataSet DSQuery = AsyncWidgets.DAL.DBHelper.GetDataSet(SSQL);
                return string.Format("{{Rows:{0}}}", JsonConvert.SerializeObject(DSQuery.Tables[0]));
            }
        }
        public DataTable GetDataSet()
        {
            if (Context.Request.QueryString["ServiceInfo"] != null)
            {
                return GetDataSet(Context.Server.UrlDecode ( Context.Request.QueryString["ServiceInfo"]));
            }
            else
            {
                return null;
            }
        }
        public DataTable GetDataSet(string ServiceInfo)
        {
            ParamDictionary<string, AsyncWidgets.DAL.QueryParameter> PD = LoadForm(ServiceInfo).GetFirstFormParams();
            string SPName = PD.ContainsKey("Command") ? PD["Command"].ParameterValue + "_SP" : PD["DALInfo"].ParameterValue + "_SP";
            DataSet ds = DBHelper.GetDataTableProc(SPName, PD);
            if (ds.Tables.Count > 0)
            {
                return ds.Tables[0];
            }
            else
                return null;
			}    
		}
    //public class Authentication : ActionExecuter
    //{
    //    public Authentication() { }
    //    public static bool AuthenticateUser(string UserName, string Password)
    //    {

    //        string passPhrase = "Pas5pr@se";        // can be any string
    //        string initVector = "@1B2c3D4e5F6g7H8"; // must be 16 bytes
    //        bool bValid = false;

    //        string strAutKey = DAL.Authentication.GetUserData(UserName);
    //        RijndaelEnhanced rijndaelKey = new RijndaelEnhanced(passPhrase, initVector);
    //        string strDecryptedvalue = string.Empty;
    //        if (strAutKey.Trim() != string.Empty)
    //        {
    //            strDecryptedvalue = rijndaelKey.Decrypt(strAutKey);
    //            if (strDecryptedvalue.IndexOf("@|") > 0)
    //            {
    //                string[] strTemp = strDecryptedvalue.Split('|');
    //                if (Hashing.VerifyHash(Password, Hashing.HashType.SHA1, strTemp[1].TrimEnd(new char[] { '@' }).ToString()))
    //                    bValid = true;
    //            }


    //        }
    //        return bValid;
    //    }

    //    public static bool IsUserNameAvailable(string UserName)
    //    {
    //        return IsUserNameAvaiable.CheckUserNameAvaiable(UserName);
    //    }
    //    public object RegisterNewUser(string ServiceInfo)
    //    {
    //        string Status = "";
    //        try
    //        {
    //            ParamDictionary<string, AsyncWidgets.DAL.QueryParameter> PD = LoadForm(ServiceInfo).GetFirstFormParams();
    //            AddQueryParam(PD,
    //               "AuthenticationHash", GetAuthHash(
    //               PD["userid"].ParameterValue,
    //               PD["password"].ParameterValue
    //               , "enilno8qsrac"
    //                ));
    //            //  VehiclesOnlineDAL.RegisterNewUser.RegisterUser(PD);
    //            Status = DBHelper.InvokeSP(PD["DALInfo"].ParameterValue + "_SP", PD);

    //        }
    //        catch (Exception ex)
    //        {
    //            //sSuccess = "0";
    //            throw ex;
    //        }
    //        return Status;
    //    }
    //    public string GetAuthHash(string UserEmail, string UserPassword, string UserRoles)
    //    {
    //        string PassHash = Hashing.ComputeHash(UserPassword, Hashing.HashType.SHA1, null);
    //        string passPhrase = "Pas5pr@se";        // can be any string
    //        string initVector = "@1B2c3D4e5F6g7H8"; // must be 16 bytes

    //        RijndaelEnhanced rijndaelKey =
    //            new RijndaelEnhanced(passPhrase, initVector);

    //        return rijndaelKey.Encrypt(UserEmail + "@|" + PassHash + "@|" + UserRoles);


    //    }
    //    //public string  RegisterNewUser(string EmailId,string FirstName,string LastName,string BirthDate,
    //    //    string Phone,string CellPhone,string City,string ResidenceCountry)
    //    //{

    //    //}
    //}
    public class ActorFacade
    {
        public static object ExecuteAction(string ActorId, string ActionId, string ServiceInfo)
        {
            IActionExecuter AE = null;
            try
            {
                AE = (IActionExecuter)Activator.CreateInstance(System.Type.GetType("WebProject.AsyncWidgets.BAL." + ActorId));  //(IActionExecuter)Assembly.GetExecutingAssembly().CreateInstance(ActorId);
            }
            catch (Exception ex)
            {
                throw new Exception(@"Actor 'WebProject.AsyncWidgets.BAL." + ActorId + " not found!", ex);
            }
            try
            {
                return AE.InvokeAction(ActionId, ServiceInfo);
            }
            catch (Exception ex)
            {
                if (ex.InnerException != null)
                    throw new Exception(ex.InnerException.Message + "\r\n" + ex.InnerException.Source, ex.InnerException);
                else
                    throw new Exception(ex.Message + "\r\n" + ex.Source  , ex);
            }
        }
    }
    public interface IActionExecuter
    {

        object InvokeAction(string ActionId, string ServiceInfo);

    }
    public class ActionExecuter : XMLFormReader, IActionExecuter
    {

        #region IActionExecuter Members

        public object InvokeAction(string ActionId, string ServiceInfo)
        {
            Type type = this.GetType();

            //  return ((string) type.GetMethod(ActionId).Invoke(this,new object[] {ServiceInfo} ));
            return type.GetMethod(ActionId).Invoke(this, new object[] { ServiceInfo });
        }

        #endregion
    }
    public class XMLFormReader
    {
        XmlDocument _ParamDoc;
        string _FormName = null;
        public System.Web.SessionState.HttpSessionState Session {
            get {

                return System.Web.HttpContext.Current.Session;
            } 
        }
        public System.Web.HttpContext Context
        {
            get
            {
              return  System.Web.HttpContext.Current;
            }
        }

        public XMLFormReader LoadForm(string xmlDoc)
        {
            _ParamDoc = new XmlDocument();
            try
            {
                _ParamDoc.LoadXml(xmlDoc);
            }
            catch (Exception ex)
            {

            }
            return this;
        }
        public string GetValue(string FormName, string FieldName)
        {
            _FormName = FormName;
            return _ParamDoc.DocumentElement.SelectSingleNode(FormName).Attributes[FieldName].Value;
        }
        public string GetValue(string FieldName)
        {
            if (string.IsNullOrEmpty(_FormName)) _FormName = _ParamDoc.DocumentElement.ChildNodes[0].Name;
            return _ParamDoc.DocumentElement.SelectSingleNode(_FormName).Attributes[FieldName].Value;
        }
        public ParamDictionary<string, AsyncWidgets.DAL.QueryParameter> GetFirstFormParams()
        {
            string FormName;
            if (_ParamDoc.DocumentElement.ChildNodes.Count > 0)
            {
                FormName = _ParamDoc.DocumentElement.ChildNodes[0].Name;
                return this.GetFormParams(FormName);
            }
            else
                return null;
            //XmlNode FormNode = _ParamDoc.DocumentElement.SelectSingleNode(FormName);
            //string UniqueKeys = FormNode.Attributes["uniquekeys"].Value == null ? "" : FormNode.Attributes["uniquekeys"].Value;
            //if (UniqueKeys != null) FormNode.Attributes.Remove(FormNode.Attributes["uniquekeys"]);

            //ParamDictionary<string, AsyncWidgets.DAL.QueryParameter> ParamDic = new ParamDictionary<string, AsyncWidgets.DAL.QueryParameter>(FormName, UniqueKeys);
            //foreach (XmlAttribute attr in FormNode.Attributes)
            //{
            //    ParamDic.Add(attr.Name, new AsyncWidgets.DAL.QueryParameter(attr.Value));
            //}
            //return ParamDic;
        }
        public ParamDictionary<string, AsyncWidgets.DAL.QueryParameter> GetFormParams(string FormName)
        {
            XmlNode FormNode = _ParamDoc.DocumentElement.SelectSingleNode(FormName);
            string UniqueKeys = FormNode.Attributes["uniquekeys"] == null ? "" : FormNode.Attributes["uniquekeys"].Value;
            // if( UniqueKeys!=null) FormNode.Attributes.Remove(FormNode.Attributes["uniquekeys"]);

            ParamDictionary<string, AsyncWidgets.DAL.QueryParameter> ParamDic = new ParamDictionary<string, AsyncWidgets.DAL.QueryParameter>(FormName, UniqueKeys);
            foreach (XmlAttribute attr in FormNode.Attributes)
            {
                if (attr.Name == "uniquekeys") continue;
                ParamDic.Add(attr.Name, new AsyncWidgets.DAL.QueryParameter(attr.Value));
            }
            if (!ParamDic.ContainsKey("__IP")) ParamDic.AddQueryParam("__IP", new AsyncWidgets.DAL.QueryParameter(Context.Request.ServerVariables["REMOTE_ADDR"]));
            if (ParamDic.ContainsKey("__UserId")) ParamDic.Remove("__UserId");
            if (Session == null )
            {
                ParamDic.AddQueryParam("__UserId", new AsyncWidgets.DAL.QueryParameter("Anonymous"));
               
            }
            else if (Session["UserId"] != null) {
                ParamDic.AddQueryParam("__UserId", new AsyncWidgets.DAL.QueryParameter(Session["UserId"].ToString()));
            }
            else if (Session["EForms4UserId"] == null)

                ParamDic.AddQueryParam("__UserId", new AsyncWidgets.DAL.QueryParameter("Anonymous"));
            else
                ParamDic.AddQueryParam("__UserId", new AsyncWidgets.DAL.QueryParameter(Session["EForms4UserId"].ToString()));

            return ParamDic;
        }
        public Dictionary<string, ParamDictionary<string, AsyncWidgets.DAL.QueryParameter>> GetAllFormParams()
        {
            Dictionary<string, ParamDictionary<string, AsyncWidgets.DAL.QueryParameter>> Params = new Dictionary<string, ParamDictionary<string, AsyncWidgets.DAL.QueryParameter>>();
            foreach (XmlNode FormNode in _ParamDoc.DocumentElement.ChildNodes)
            {
                //formNode.Name 
                Params.Add(FormNode.Name, GetFormParams(FormNode.Name));
            }
            return Params;
        }
        public ParamDictionary<string, AsyncWidgets.DAL.QueryParameter> AddQueryParam(ParamDictionary<string, AsyncWidgets.DAL.QueryParameter> ParamDic, string ParamName, string ParamValue, bool IncludeInUpdate)
        {
            ParamDic.Add(ParamName, new AsyncWidgets.DAL.QueryParameter(ParamValue, IncludeInUpdate));
            return ParamDic;
        }
        public ParamDictionary<string, AsyncWidgets.DAL.QueryParameter> AddQueryParam(ParamDictionary<string, AsyncWidgets.DAL.QueryParameter> ParamDic, string ParamName, string ParamValue)
        {
            ParamDic.Add(ParamName, new AsyncWidgets.DAL.QueryParameter(ParamValue));
            return ParamDic;
        }
    }

}

