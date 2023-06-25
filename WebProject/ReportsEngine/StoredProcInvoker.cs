using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections;
using System.Collections.Generic;
namespace WebProject.ReportsEngine {

public interface IQueryParameter
{
    string ParameterName{get;}
    string ParameterValue{get;}
    string ParameterText { get; }
    Type ParameterDataType{get;}
}
public class QueryParameter :IQueryParameter
{
    string _ParameterName, _ParameterValue, _ParameterText;
    Type _ParameterDataType;
    public QueryParameter(string ParameterName, string ParameterValue, string ParameterText)
        : this(ParameterName, ParameterValue, ParameterText, null)
{
    
}
    public QueryParameter(string ParameterName, string ParameterValue, string ParameterText, Type ParameterDataType)
{
    _ParameterName =ParameterName;
    _ParameterValue= ParameterValue;
    _ParameterText = ParameterText;
    _ParameterDataType=ParameterDataType;
}
    public static IndexedDictionary<string, IQueryParameter> GetQueryParameters(string Params)
    {
        IndexedDictionary<string, IQueryParameter> QueryParams = new IndexedDictionary<string, IQueryParameter>();
        string[] arrParams = Params.Split('|');
        int ParamLength = arrParams.Length;
        for (int iLoop = 0; iLoop < ParamLength; iLoop += 2)
        {
            string ParamName, ParamValue;
            ParamName = arrParams[iLoop];
            ParamValue = arrParams[iLoop + 1];


            //QueryParams.Add(arrParams[iLoop], new QueryParameter(arrParams[iLoop]));
            //if Next param Exists && The next param is The TextValue Of the Field
            if ((iLoop + 2 < ParamLength && (ParamName + "Text") == arrParams[iLoop + 2]))//Compare With Name Parameter
            {
                QueryParams.Add(ParamName, new QueryParameter(ParamName, ParamValue, arrParams[iLoop + 3]));
                iLoop += 2;

            }
            else
            {
                QueryParams.Add(ParamName, new QueryParameter(ParamName, ParamValue, ParamValue));
            }
        }
        return QueryParams;
    }
    public static string InsertQueryParameters(string SearchParams, IndexedDictionary<string, IQueryParameter> Parameters)
    {
        return QueryParameter.InsertQueryParameters(SearchParams, Parameters, false);
    }
    public static string FormatDate(string DateValue,string DateFormat)
    {
        DateTime DateToFormat ;
        if (DateTime.TryParse(DateValue, out DateToFormat))
        {
            return string.Format("{0:" + DateFormat + "}", DateToFormat);
        }
        else
            return " --- ";
    }
    public static string InsertQueryParameters(string SearchParams, IndexedDictionary<string, IQueryParameter> Parameters, bool InsertTextValues)
    {
        int fnStartIndex = SearchParams.IndexOf ("@@"),fnNextIndex=0;
        while ( fnStartIndex   > -1)
        {
            fnNextIndex=SearchParams.IndexOf("@@", fnStartIndex+2);
            if (fnNextIndex > -1)
            {
                
                string fnCall = SearchParams.Substring(fnStartIndex + 2, fnNextIndex - (fnStartIndex + 2));
                string SubStrToReplace = SearchParams.Substring(fnStartIndex , (fnNextIndex+2) - fnStartIndex) ;
                int FirstPipe=fnCall.IndexOf ("||");
                string fnName=fnCall.Substring (0, FirstPipe);
                string[] fnArray = fnCall.Substring(FirstPipe + 2).Split(new string[] { "||" }, StringSplitOptions.None);

                for (int iLoop=0; iLoop < fnArray.Length;iLoop++ )
                {
                    if (fnArray[iLoop].StartsWith("::"))
                    {
                        if(Parameters.ContainsKey(  fnArray[iLoop].Replace ("::", "")))
                        {
                        fnArray[iLoop] = InsertTextValues ?
                        Parameters[fnArray[iLoop].Replace("::", "")].ParameterText :
                        Parameters[fnArray[iLoop].Replace("::", "")].ParameterValue;
                        }
                    }
                }
                System.Reflection.MethodInfo theMethod = typeof(QueryParameter).GetMethod(fnName);
                SearchParams = SearchParams.Replace(SubStrToReplace,
                (string)theMethod.Invoke(null, fnArray)); 
            }
            fnStartIndex =SearchParams.IndexOf ("@@");
        }
        if (SearchParams.Contains("::"))
        {
            foreach (KeyValuePair<string, IQueryParameter> Param in Parameters)
            {
                if (SearchParams.Contains("::" + Param.Key + "::"))
                {
                    if (InsertTextValues)
                        if (Param.Value.ParameterText.ToUpper() == "---- Select Value ----".ToUpper() || Param.Value.ParameterText.ToUpper() == "DBNull".ToUpper())
                        {

                            SearchParams = SearchParams.Replace("::" + Param.Key + "::", " All " + CUtilityWeb.BreakCamelCase(Param.Value.ParameterName));

                        }
                        else
                            SearchParams = SearchParams.Replace("::" + Param.Key + "::", Param.Value.ParameterText);
                    else
                        SearchParams = SearchParams.Replace("::" + Param.Key + "::", Param.Value.ParameterValue);

                }
            }
            return SearchParams;
        }
        else
        {
            return SearchParams;
        }
    }
#region IQueryParameter Members

    public string  ParameterName
    {
        get { return _ParameterName; }
    }

    public string  ParameterValue
    {
        get { return _ParameterValue; }
    }
    public string ParameterText
    {
        get { return _ParameterText; }
    }

    public Type  ParameterDataType
    {
        get {return _ParameterDataType; }
    }

#endregion
}

/// <summary>
/// Helper class to fetch data from the database.
/// </summary>
/// 
public class StoredProcInvoker
{
    SearchPanel _SPanel;
    string _SPName;
    SqlConnection _Conn;
    private  DataTable _ResultTable = null;
    private ChartDataOrientation _DataOrientation =ChartDataOrientation.None;
    private string _URL = null;

    public ChartDataOrientation DataOrientation
    {
        get { return _DataOrientation; }
       // set { _DataOrientation = value; }
    }
    public string URL
    {
        get { return _URL; }
        // set { _DataOrientation = value; }
    }
    public DataTable  ResultTable
    {
        get { return _ResultTable; }
    }

    public StoredProcInvoker(string SPName, IndexedDictionary<string, IQueryParameter> QueryParameters):this(SPName, QueryParameters,CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB) )
    {
        //using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
        //{
        //    StoredProcInvoker(SPName, QueryParameters,Conn );
        //}
    }
    public StoredProcInvoker(string SPName, IndexedDictionary<string, IQueryParameter> QueryParameters,string ConnectionString):this(SPName, QueryParameters, new SqlConnection(ConnectionString))
    {
        //using (SqlConnection Conn = new SqlConnection(ConnectionString))
        //{
        //    StoredProcInvoker(SPName, QueryParameters, Conn);
        //}
    }
    public StoredProcInvoker(string SPName, IndexedDictionary<string, IQueryParameter> QueryParameters, SqlConnection sqlConnection)
    {

        _SPName = SPName;

        if (SPName == null || SPName == "") { throw new Exception(string.Format(@"Stored '{0}' procedure not found ",SPName )); }
        //-----------------------------------------------------//
        SqlParameter[] arrSqlParams = new SqlParameter[1];

        arrSqlParams[0] = AddParameter("@procedure_name", SqlDbType.VarChar, 390, SPName, ParameterDirection.Input);
        try
        {
            DataTable dtProcParams;
            dtProcParams = CUtilityWeb.getDataTable("sp_sproc_columns", sqlConnection, arrSqlParams);
            arrSqlParams = new SqlParameter[dtProcParams.Rows.Count - 1];
            int iRow = 0;
            foreach (DataRow DR in dtProcParams.Rows)
            {
                if (iRow == 0) { iRow++; continue; }
                string ParamValue;
                string ParamName = DR["Column_Name"].ToString();
                SqlDbType ParamDBType = GetSQLDataType(DR["Type_Name"].ToString());
                int ParamLen = Convert.ToInt32(DR["Length"]);
                ParameterDirection ParamDirection = (Convert.ToInt32(DR["COLUMN_TYPE"]) == 1 ? ParameterDirection.Input : ParameterDirection.InputOutput);
                if (QueryParameters.ContainsKey(ParamName.Substring(1)))
                {
                    ParamValue = QueryParameters[ParamName.Substring(1)].ParameterValue;//SPanel.SearchFields[ParamName.Substring(1)].FieldValueWithNull.ToString();

                    arrSqlParams[iRow - 1] = AddParameter(ParamName, ParamDBType, ParamLen, SetEmptyValues(ParamValue, ParamDBType), ParamDirection);
                }
                else
                {

                    if (iRow == (dtProcParams.Rows.Count - 1) && DR["Column_Name"].ToString() == "@DataOrientation")
                    {
                        _DataOrientation = ChartDataOrientation.None;
                        arrSqlParams[iRow - 1] = AddParameter(ParamName, ParamDBType, ParamLen, "", ParamDirection);

                        //  _DataOrientation = Enum.Parse(_DataOrientation.GetType(),DR["Type_Name"]
                    }
                    else //if parameter not found in the search panel and is not a DataOrientation param
                    {
                        ParamValue = "DBNull"; //then pass null to stored procedure

                        arrSqlParams[iRow - 1] = AddParameter(ParamName, ParamDBType, ParamLen, SetEmptyValues(ParamValue, ParamDBType), ParamDirection);

                    }
                }
                iRow++;
            }
            _ResultTable = CUtilityWeb.getDataTable(_SPName, sqlConnection, arrSqlParams);
        }
        catch (Exception ex)
        {
            string ErrorMsg,Params="";
           foreach (SqlParameter param in arrSqlParams )
           {
               Params += param.ParameterName+"='" + param.Value.ToString() + "',";
           }
            Params=Params.TrimEnd(new char[]{','});
            
            ErrorMsg = string.Format(@"ex Error occured while executing stored procedure.
                         Error Msg: {0}
                         DB Server: {1}
                         SP Name:   {2}
                         ParamInfo: {3}
                            
                        ", ex.Message, sqlConnection.DataSource, _SPName, Params);
            throw new Exception(ErrorMsg, ex);

        }
        finally
        {
            if (sqlConnection != null && sqlConnection.State != ConnectionState.Closed)
            {
                sqlConnection.Close();
                sqlConnection.Dispose();
                sqlConnection = null;
            }
        }
    }
    /// <summary>
    /// User this function to fetch data from default connection to be show in grid or chart
    /// </summary>
    /// <param name="SPName">Stored Procedure To Fech the data for Grid Or Graph</param>
    /// <param name="SPanel">Searcha Panel Object which Contains Fields</param>
    
    public StoredProcInvoker(string SPName, SearchPanel SPanel)
    {
        _SPName = SPName;
        _SPanel = SPanel;
        if (SPName == null || SPName == "") { throw new Exception(string.Format("Stored procedure not found for search panel {0}", SPanel.SearchPanelID)); } 
    //-----------------------------------------------------//
        SqlParameter[] arrSqlParams= new SqlParameter[1];

        arrSqlParams[0] = AddParameter("@procedure_name", SqlDbType.VarChar, 390, SPName , ParameterDirection.Input);

        DataTable dtProcParams;
        using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
        {
            dtProcParams = CUtilityWeb.getDataTable("sp_sproc_columns", sqlConnection, arrSqlParams);
        }
        
        arrSqlParams = new SqlParameter[dtProcParams.Rows.Count-1];
        int iRow = 0;
        foreach (DataRow DR in dtProcParams.Rows)
        {
            if (iRow == 0) { iRow++; continue; }
            string ParamValue;
            string ParamName =DR["Column_Name"].ToString();
            SqlDbType ParamDBType = GetSQLDataType(DR["Type_Name"].ToString());
            int ParamLen = Convert.ToInt32( DR["Length"]);
            ParameterDirection ParamDirection = (Convert.ToInt32(DR["COLUMN_TYPE"]) == 1 ? ParameterDirection.Input : ParameterDirection.InputOutput);
            if (SPanel.SearchFields.ContainsKey(ParamName.Substring(1)))
            {
                ParamValue = SPanel.SearchFields[ParamName.Substring(1)].FieldValueWithNull.ToString() ;

                arrSqlParams[iRow - 1] = AddParameter(ParamName, ParamDBType, ParamLen, SetEmptyValues(ParamValue,ParamDBType ), ParamDirection);
            }
            else
            {

                if (iRow == (dtProcParams.Rows.Count - 1) && DR["Column_Name"].ToString()=="@DataOrientation")
                {
                    _DataOrientation = ChartDataOrientation.None;
                    arrSqlParams[iRow -1] = AddParameter(ParamName, ParamDBType, ParamLen, "", ParamDirection);

                  //  _DataOrientation = Enum.Parse(_DataOrientation.GetType(),DR["Type_Name"]
                }
            }
            iRow++;
        }
        using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
        {
            _ResultTable = CUtilityWeb.getDataTable(_SPName, sqlConnection, arrSqlParams);
        }
        if (arrSqlParams[arrSqlParams.Length - 1].ParameterName == "@DataOrientation")
        {
            string DTOrientation=""; //=arrSqlParams[arrSqlParams.Length - 1].Value.ToString();
            string[] ReportProperties = arrSqlParams[arrSqlParams.Length - 1].Value.ToString().Split(new string[] { "||" },StringSplitOptions.None);

            if (Enum.IsDefined(_DataOrientation.GetType(), ReportProperties[0] ))
            {
                _DataOrientation = (ChartDataOrientation)Enum.Parse(_DataOrientation.GetType(), ReportProperties[0]);

            }
            if (ReportProperties.Length > 1)
            {
                _URL = ReportProperties[1];
            }
        }
    }
    public StoredProcInvoker(string SPName, SearchPanel SPanel, string ConnectionString)
    {
        SqlConnection sqlConneciton = null;
        _SPName = SPName;
        _SPanel = SPanel;
        if (SPName == null || SPName == "") { throw new Exception(string.Format("Stored procedure not found for search panel {0}", SPanel.SearchPanelID)); }
        //-----------------------------------------------------//
        SqlParameter[] arrSqlParams = new SqlParameter[1];

        arrSqlParams[0] = AddParameter("@procedure_name", SqlDbType.VarChar, 390, SPName, ParameterDirection.Input);
        try
        {
            //sqlConneciton = new SqlConnection(ConnectionString);
            //sqlConneciton.Open();
            //DataTable dtProcParams = CUtilityWeb.getDataTable("sp_sproc_columns", sqlConneciton, arrSqlParams);
            DataTable dtProcParams;
            SqlConnection sqlConnection;
            if (ConnectionString != "")
            {
                sqlConnection = new SqlConnection(ConnectionString);
                dtProcParams = CUtilityWeb.getDataTable("sp_sproc_columns", sqlConnection, arrSqlParams);
            }
            else
            {
                sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB);

                dtProcParams = CUtilityWeb.getDataTable("sp_sproc_columns", sqlConnection, arrSqlParams);

            }



            arrSqlParams = new SqlParameter[dtProcParams.Rows.Count - 1];
            int iRow = 0;
            foreach (DataRow DR in dtProcParams.Rows)
            {
                if (iRow == 0) { iRow++; continue; }
                string ParamValue;
                string ParamName = DR["Column_Name"].ToString();
                SqlDbType ParamDBType = GetSQLDataType(DR["Type_Name"].ToString());
                int ParamLen = Convert.ToInt32(DR["Length"]);
                ParameterDirection ParamDirection = (Convert.ToInt32(DR["COLUMN_TYPE"]) == 1 ? ParameterDirection.Input : ParameterDirection.InputOutput);
                if (SPanel.SearchFields.ContainsKey(ParamName.Substring(1)))
                {
                    ParamValue = SPanel.SearchFields[ParamName.Substring(1)].FieldValueWithNull.ToString();

                    arrSqlParams[iRow - 1] = AddParameter(ParamName, ParamDBType, ParamLen, SetEmptyValues(ParamValue, ParamDBType), ParamDirection);
                }
                else
                {

                    if (iRow == (dtProcParams.Rows.Count - 1) && DR["Column_Name"].ToString() == "@DataOrientation")
                    {
                        _DataOrientation = ChartDataOrientation.None;
                        arrSqlParams[iRow - 1] = AddParameter(ParamName, ParamDBType, ParamLen, "", ParamDirection);

                        //  _DataOrientation = Enum.Parse(_DataOrientation.GetType(),DR["Type_Name"]
                    }
                }
                iRow++;
            }
            _ResultTable = CUtilityWeb.getDataTable(_SPName, sqlConnection, arrSqlParams);


            if (arrSqlParams[arrSqlParams.Length - 1].ParameterName == "@DataOrientation")
            {
                string DTOrientation = ""; //=arrSqlParams[arrSqlParams.Length - 1].Value.ToString();
                string[] ReportProperties = arrSqlParams[arrSqlParams.Length - 1].Value.ToString().Split(new string[] { "||" }, StringSplitOptions.None);

                if (Enum.IsDefined(_DataOrientation.GetType(), ReportProperties[0]))
                {
                    _DataOrientation = (ChartDataOrientation)Enum.Parse(_DataOrientation.GetType(), ReportProperties[0]);

                }
                if (ReportProperties.Length > 1)
                {
                    _URL = ReportProperties[1];
                }
            }
        }
        catch (Exception ex)
        {
            throw new Exception("Error occured while executing stored procedure.", ex);
        }
        finally
        {
            if (sqlConneciton != null && sqlConneciton.State != ConnectionState.Closed)
            {
                sqlConneciton.Close();
                sqlConneciton.Dispose();
                sqlConneciton = null;
            }
        }
    }
    /// <summary>
    /// This Function Is To Just Fetch Column Names In The Returned Table.
    /// It's Essential For The Report Designer.
    /// </summary>
    /// <param name="SPName"></param>
    public StoredProcInvoker(string SPName)
    {
        try
        {
            _SPName = SPName;
            //_SPanel = SPanel;
            //if (SPName == null || SPName == "") { throw new Exception(string.Format("Stored procedure not found for search panel {0}", SPanel.SearchPanelID)); }
            //-----------------------------------------------------//
            SqlParameter[] arrSqlParams = new SqlParameter[1];

            arrSqlParams[0] = AddParameter("@procedure_name", SqlDbType.VarChar, 390, SPName, ParameterDirection.Input);
            DataTable dtProcParams;
            using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                dtProcParams = CUtilityWeb.getDataTable("sp_sproc_columns", sqlConnection, arrSqlParams);
            }

            arrSqlParams = new SqlParameter[dtProcParams.Rows.Count - 1];
            int iRow = 0;
            foreach (DataRow DR in dtProcParams.Rows)
            {
                if (iRow == 0) { iRow++; continue; }
                string ParamValue;
                string ParamName = DR["Column_Name"].ToString();
                SqlDbType ParamDBType = GetSQLDataType(DR["Type_Name"].ToString());
                int ParamLen = Convert.ToInt32(DR["Length"]);
                ParameterDirection ParamDirection = (Convert.ToInt32(DR["COLUMN_TYPE"]) == 1 ? ParameterDirection.Input : ParameterDirection.InputOutput);
                //if (SPanel.SearchFields.ContainsKey(ParamName.Substring(1)))
                //{
                // ParamValue = SPanel.SearchFields[ParamName.Substring(1)].FieldValueWithNull.ToString();

                arrSqlParams[iRow - 1] = AddParameter(ParamName, ParamDBType, ParamLen, Convert.DBNull, ParamDirection);
                //}
                //else
                //{
                //}
                iRow++;
            }
            using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                _ResultTable = CUtilityWeb.getDataTable(_SPName, sqlConnection, arrSqlParams);
            }
        }
        catch (Exception ex)
        {
        }
    }
    public DataSet getPara(string reportid)
    {
        SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB);
        SqlDataAdapter myad = new SqlDataAdapter("select a.SPParamName, a.ParamValue from RptParamMap a inner join RPTChartEngineReportMap b on a.ChildRptID = b.RptMapID where b.ReportId ='" + reportid + "'", sqlConnection);
        DataSet myDataset = new DataSet();
        myad.Fill(myDataset);
        return myDataset;
    }
    //Newly added for Drilldown Fusion Charts India
    public StoredProcInvoker(string SPName, string[] args, string connectionString, Hashtable HashSearch)
    {
        try
        {
            _SPName = SPName;
            DataSet mydata = getPara(args[3]);
            //_SPanel = SPanel;
            //if (SPName == null || SPName == "") { throw new Exception(string.Format("Stored procedure not found for search panel {0}", SPanel.SearchPanelID)); }
            //-----------------------------------------------------//
            SqlParameter[] arrSqlParams = new SqlParameter[1];

            arrSqlParams[0] = AddParameter("@procedure_name", SqlDbType.VarChar, 390, SPName, ParameterDirection.Input);
            DataTable dtProcParams;
            SqlConnection sqlConnection;
            if (connectionString != "")
            {
                sqlConnection = new SqlConnection(connectionString);
                dtProcParams = CUtilityWeb.getDataTable("sp_sproc_columns", sqlConnection, arrSqlParams);
            }
            else
            {
                sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB);

                dtProcParams = CUtilityWeb.getDataTable("sp_sproc_columns", sqlConnection, arrSqlParams);

            }



            arrSqlParams = new SqlParameter[dtProcParams.Rows.Count - 1];
            int iRow = 0;
            foreach (DataRow DR in dtProcParams.Rows)
            {
                if (iRow == 0) { iRow++; continue; }
                string ParamValue;
                string ParamName = DR["Column_Name"].ToString();
                SqlDbType ParamDBType = GetSQLDataType(DR["Type_Name"].ToString());
                int ParamLen = Convert.ToInt32(DR["Length"]);
                ParameterDirection ParamDirection = (Convert.ToInt32(DR["COLUMN_TYPE"]) == 1 ? ParameterDirection.Input : ParameterDirection.InputOutput);


                if (ParamName != "")
                {
                    for (int j = 4; j < args.Length + 1; j++)
                    {
                        for (int k = 0; k < mydata.Tables[0].Rows.Count; k++)
                        {
                            if (ParamName == mydata.Tables[0].Rows[k][0].ToString())
                            {
                                if (mydata.Tables[0].Rows[k][1].ToString().Trim() == "X")
                                {

                                    ParamValue = args[4].Substring(args[4].IndexOf("$") + 1, args[4].Length - 1 - args[4].IndexOf("$"));
                                    arrSqlParams[iRow - 1] = AddParameter(ParamName, ParamDBType, ParamLen, SetEmptyValues(ParamValue, ParamDBType), ParamDirection);

                                }
                                else if (mydata.Tables[0].Rows[k][1].ToString().Trim() == "Y")
                                {
                                    ParamValue = args[5].Substring(args[5].IndexOf("$") + 1, args[5].Length - 1 - args[5].IndexOf("$"));

                                    arrSqlParams[iRow - 1] = AddParameter(ParamName, ParamDBType, ParamLen, SetEmptyValues(ParamValue, ParamDBType), ParamDirection);

                                }

                                else if (mydata.Tables[0].Rows[k][1].ToString().Trim() == "Z")
                                {
                                    ParamValue = args[6].Substring(args[6].IndexOf("$") + 1, args[6].Length - 1 - args[6].IndexOf("$"));

                                    arrSqlParams[iRow - 1] = AddParameter(ParamName, ParamDBType, ParamLen, SetEmptyValues(ParamValue, ParamDBType), ParamDirection);
                                }

                                else if (mydata.Tables[0].Rows[k][1].ToString().Trim() != "X" && mydata.Tables[0].Rows[k][1].ToString().Trim() != "Y" && mydata.Tables[0].Rows[k][1].ToString().Trim() != "Z")
                                {
                                    if (HashSearch.ContainsKey(mydata.Tables[0].Rows[k][0].ToString().Trim().Substring(1)))
                                    {

                                        if (HashSearch[mydata.Tables[0].Rows[k][0].ToString().Trim().Substring(1)] != null)
                                        {
                                            ParamValue = HashSearch[mydata.Tables[0].Rows[k][0].ToString().Trim().Substring(1)].ToString();
                                            arrSqlParams[iRow - 1] = AddParameter(ParamName, ParamDBType, ParamLen, SetEmptyValues(ParamValue, ParamDBType), ParamDirection);
                                        }
                                        else
                                        {
                                            arrSqlParams[iRow - 1] = AddParameter(ParamName, ParamDBType, ParamLen, null, ParamDirection);
                                        }

                                    }
                                    else
                                    {

                                        arrSqlParams[iRow - 1] = AddParameter(ParamName, ParamDBType, ParamLen, null, ParamDirection);

                                    }





                                }




                            }

                        }

                    }
                }

                iRow++;
            }



            // SqlConnection sqlConnection1 = new SqlConnection(connectionString);
            _ResultTable = CUtilityWeb.getDataTable(_SPName, sqlConnection, arrSqlParams);

        }
        catch (Exception ex)
        {
        }
    }
    //Newly added for DashBoard Fusion Charts India
    public StoredProcInvoker(string SPName, string[] paramValues, string connectionstring)
    {
        try
        {
            int i = 0;
            _SPName = SPName;
            //_SPanel = SPanel;
            //if (SPName == null || SPName == "") { throw new Exception(string.Format("Stored procedure not found for search panel {0}", SPanel.SearchPanelID)); }
            //-----------------------------------------------------//
            SqlParameter[] arrSqlParams = new SqlParameter[1];

            arrSqlParams[0] = AddParameter("@procedure_name", SqlDbType.VarChar, 390, SPName, ParameterDirection.Input);
            DataTable dtProcParams;
            SqlConnection sqlConnection;
            if (connectionstring != "")
            {
                sqlConnection = new SqlConnection(connectionstring);
                dtProcParams = CUtilityWeb.getDataTable("sp_sproc_columns", sqlConnection, arrSqlParams);
            }
            else
            {
                sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB);

                dtProcParams = CUtilityWeb.getDataTable("sp_sproc_columns", sqlConnection, arrSqlParams);

            }
            // SqlConnection sqlConnection = new SqlConnection(connectionstring);
            ///dtProcParams = CUtilityWeb.getDataTable("sp_sproc_columns", sqlConnection, arrSqlParams);
            //using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            //{
            //    dtProcParams = CUtilityWeb.getDataTable("sp_sproc_columns", sqlConnection, arrSqlParams);
            //}

            arrSqlParams = new SqlParameter[dtProcParams.Rows.Count - 1];
            int iRow = 0;
            foreach (DataRow DR in dtProcParams.Rows)
            {
                if (iRow == 0) { iRow++; continue; }
                string ParamValue;
                string ParamName = DR["Column_Name"].ToString();
                SqlDbType ParamDBType = GetSQLDataType(DR["Type_Name"].ToString());
                int ParamLen = Convert.ToInt32(DR["Length"]);
                ParameterDirection ParamDirection = (Convert.ToInt32(DR["COLUMN_TYPE"]) == 1 ? ParameterDirection.Input : ParameterDirection.InputOutput);

                if (i < paramValues.Length)
                {

                    ParamValue = paramValues[paramValues.Length - paramValues.Length + i].ToString();
                    //if (ParamDBType == SqlDbType.DateTime)
                    //{
                    //string strDate="2002-10-03"; 
                    //string strDate="10/04/2002"; 
                    //string strDate = ParamValue;
                    //DateTime dt = (DateTime)(System.ComponentModel.TypeDescriptor.GetConverter(new DateTime(1990, 5, 6)).ConvertFrom(strDate));
                    //Response.Write("<hr>" + dt.DayOfWeek); 
                    //string st = ParamValue;
                    //string dt = Convert.ToString(st, System.Globalization.CultureInfo.InvariantCulture); //reult is: "05/19/2009 00:00:00"
                    //DateTime dt = Convert.ToDateTime(st2,System.Globalization.CultureInfo.InvariantCulture); //result is: {5/19/2009 12:00:00 MO}



                    //Dat dtValue =  Date.Parse(ParamValue);
                    //dtValue = Convert.ToDateTime(ParamValue);
                    //arrSqlParams[iRow - 1] = AddParameter(ParamName, ParamDBType, ParamLen, dt, ParamDirection);
                    //}
                    arrSqlParams[iRow - 1] = AddParameter(ParamName, ParamDBType, ParamLen, SetEmptyValues(ParamValue, ParamDBType), ParamDirection);
                    i++;
                }
                else
                {
                    arrSqlParams[iRow - 1] = AddParameter(ParamName, ParamDBType, ParamLen, Convert.DBNull, ParamDirection);
                }

                iRow++;
            }
            ///SqlConnection sqlConnection1 = new SqlConnection(connectionstring);
            _ResultTable = CUtilityWeb.getDataTable(_SPName, sqlConnection, arrSqlParams);

            //using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            //{
            //    _ResultTable = CUtilityWeb.getDataTable(_SPName, sqlConnection, arrSqlParams);
            //}
        }
        catch (Exception ex)
        {
        }
    }

    /// <summary>
    /// This Function Is To Just Fetch Column Names In The Returned Table.
    /// It's Essential For The Report Designer.
    /// </summary>
    /// <param name="SPName"></param>
    public StoredProcInvoker(string SPName,string ConnectionString)
    {
        SqlConnection sqlConneciton = null;
        try
        {
            _SPName = SPName;
            //_SPanel = SPanel;
            //if (SPName == null || SPName == "") { throw new Exception(string.Format("Stored procedure not found for search panel {0}", SPanel.SearchPanelID)); }


            sqlConneciton = new SqlConnection(ConnectionString);
            sqlConneciton.Open();

            SqlParameter[] arrSqlParams = new SqlParameter[1];
            arrSqlParams[0] = AddParameter("@procedure_name", SqlDbType.VarChar, 390, SPName, ParameterDirection.Input);
            DataTable dtProcParams;
            SqlConnection sqlConnection;
            if (ConnectionString != "")
            {
                sqlConnection = new SqlConnection(ConnectionString);
                dtProcParams = CUtilityWeb.getDataTable("sp_sproc_columns", sqlConnection, arrSqlParams);
            }
            else
            {
                sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB);

                dtProcParams = CUtilityWeb.getDataTable("sp_sproc_columns", sqlConnection, arrSqlParams);

            }
           /// DataTable dtProcParams = CUtilityWeb.getDataTable("sp_sproc_columns", sqlConneciton, arrSqlParams);

            //-----------------------------------------------------//
            

            //  DataTable dtProcParams = CUtilityWeb.getDataTable("sp_sproc_columns", CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB), arrSqlParams);

            arrSqlParams = new SqlParameter[dtProcParams.Rows.Count - 1];
            int iRow = 0;
            foreach (DataRow DR in dtProcParams.Rows)
            {
                if (iRow == 0) { iRow++; continue; }
                string ParamValue;
                string ParamName = DR["Column_Name"].ToString();
                SqlDbType ParamDBType = GetSQLDataType(DR["Type_Name"].ToString());
                int ParamLen = Convert.ToInt32(DR["Length"]);
                ParameterDirection ParamDirection = (Convert.ToInt32(DR["COLUMN_TYPE"]) == 1 ? ParameterDirection.Input : ParameterDirection.InputOutput);
                //if (SPanel.SearchFields.ContainsKey(ParamName.Substring(1)))
                //{
                // ParamValue = SPanel.SearchFields[ParamName.Substring(1)].FieldValueWithNull.ToString();

                arrSqlParams[iRow - 1] = AddParameter(ParamName, ParamDBType, ParamLen, Convert.DBNull, ParamDirection);
                //}
                //else
                //{
                //}
                iRow++;
            }
            _ResultTable = CUtilityWeb.getDataTable(_SPName, sqlConneciton, arrSqlParams);
        }
        catch (Exception ex)
        {
        }
    }
    object SetEmptyValues(string Value, SqlDbType ParamDBType)
    {
        if (Value == "DBNull" || Value == "-1" || (Value.Trim() == "" && ParamDBType == SqlDbType.DateTime))
        {
            return DBNull.Value;
        }

        else
            return Value;
    }
    SqlDbType GetSQLDataType(string DataType)
    {
        switch (DataType)
        {
            case "nvarchar":
                return SqlDbType.NVarChar;
                break;
            case "varchar":
                return SqlDbType.VarChar;
                break;
            case "text":
                return SqlDbType.Text;
                break;
            case "ntext":
                return SqlDbType.NText ;
                break;
            case "char":
                return SqlDbType.Char;
                break;
            case "nchar":
                return SqlDbType.NChar;
                break;
            case "datetime":
                return SqlDbType.DateTime;
                break;
            case "smalldatetime":
                return SqlDbType.SmallDateTime;
                break;
            case "decimal":
                return SqlDbType.Decimal;
                break;
            case "numeric":
                return SqlDbType.Decimal;
                break;
            case "float":
                return SqlDbType.Float;
                break;
            case "real":
                return SqlDbType.Real;
                break;
            case "bigint":
                return SqlDbType.BigInt;
                break;
            case "int":
                return SqlDbType.Int;
                break;
            case "smallint":
                return SqlDbType.SmallInt;
                break;
            case "tinyint":
                return SqlDbType.TinyInt;
                break;
            case "bit":
                return SqlDbType.Bit;
                break;
            //case "":
            //    break;
            default:
                return SqlDbType.VarChar;
                break;
        }
    }

    public SqlParameter AddParameter(string strParamName,
                                 SqlDbType strType,
                                 int nLen,
                                 object  strParamValue,
                                 ParameterDirection Direction)
    {
        try
        {
            SqlParameter oAddParameter;
            oAddParameter = new SqlParameter(strParamName, strType, nLen);
            oAddParameter.Direction = Direction;
            oAddParameter.Value = strParamValue;
            return oAddParameter;
        }
        catch (Exception errError)
        {
            throw errError;
        }
    }
   
}
}