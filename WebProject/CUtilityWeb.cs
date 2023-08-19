using System;
using System.Data;
//using System.Data.OracleClient ;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Collections;
using System.Text;
using System.Data.OleDb ;
using WebProject.ReportsEngine;

/// <summary>
/// Summary description for CUtilityWeb
/// </summary>
public class CUtilityWeb
{
    public enum ConnType // test git commit
    {
        eFormsDB,
        eFormsDevDB,
        eFormsAuditDB,
        eFormsReportsDB,
    }
    public enum PortalEnvironmentType
    {
        StandAloneApp=0,
        InsideeForms=1
    }
    private static SqlConnection CNeFormsDB = null;
    private static SqlConnection CNeFormsAuditDB = null;
   // private static OracleConnection CNOracleConnection = null;
    private static System.IO.StreamWriter  LogFileSW;
    public static SqlDataReader getReader(string SSQL, ConnType connType)
    {
        try
        {
            SqlCommand sCmd = new SqlCommand(SSQL, getConnection(connType));
            sCmd.CommandTimeout = 180;
            return sCmd.ExecuteReader();
        }
        catch (Exception ex)
        {
            throw ex;
        }

    }
    public static SqlDataReader getReader(string SSQL, ConnType connType, CommandBehavior CmdBehavior)
    {
        try
        {
            SqlCommand sCmd = new SqlCommand(SSQL, getConnection(connType));
            sCmd.CommandTimeout = 180;
            return sCmd.ExecuteReader(CmdBehavior);
        }
        catch (Exception ex)
        {
            throw ex;
        }

    }
    public static DataTable getDataTable(string SSQL, OleDbConnection OLEConn)
    {
        DataSet dsFrom = new DataSet();
        try
        {
            OleDbDataAdapter daFrom = new OleDbDataAdapter(SSQL, OLEConn);
            daFrom.Fill(dsFrom, "tTable");

            return dsFrom.Tables[0];
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            dsFrom.Dispose();
            dsFrom = null;
        }
    }
    public static DataTable getDataTable(string SSQL, SqlConnection SQLConn)
    {
        DataSet dsFrom = new DataSet();
        try
        {
            SqlDataAdapter daFrom = new SqlDataAdapter(SSQL, SQLConn);
            daFrom.Fill(dsFrom, "tTable");

            return dsFrom.Tables[0];
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            dsFrom.Dispose();
            dsFrom = null;
        }
    }
    public static DataTable getDataTable(string SSQL, SqlConnection SQLConn, SqlTransaction transaction)
    {
        DataSet dsFrom = new DataSet();
        SqlCommand cmd = SQLConn.CreateCommand();
        cmd.Connection = SQLConn;
        cmd.Transaction = transaction;
        cmd.CommandText = SSQL;
        cmd.CommandTimeout = 180;

        SqlDataAdapter daFrom = new SqlDataAdapter(cmd);
        daFrom.Fill(dsFrom, "tTable");
        return dsFrom.Tables[0];
    }
    public static DataTable getDataTable(string SSQL, SqlConnection SQLConn, SqlParameter[] oParameterList)
    {
            IEnumerator oEnumerator = oParameterList.GetEnumerator();

            DataSet dsFrom = new DataSet();
            SqlCommand cmd = SQLConn.CreateCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = SQLConn;
            cmd.CommandTimeout = 3000;
            cmd.CommandText = SSQL;
            while (oEnumerator.MoveNext())
            {
                if (oEnumerator.Current != null)
                    cmd.Parameters.Add(oEnumerator.Current);
            }
            SqlDataAdapter daFrom = new SqlDataAdapter(cmd);
            daFrom.Fill(dsFrom, "tTable");
            return dsFrom.Tables[0];
    }
    public static void ExecScript(string SQLScript, SqlConnection connection)
    {
        string sql = SQLScript;
        //        SqlConnection connection = CUtility.Getconnection(CUtility.eFormsConn.eFormsConnToAuditing);
        Regex regex = new Regex("^GO", RegexOptions.IgnoreCase | RegexOptions.Multiline);
        string[] lines = regex.Split(sql);


        using (SqlCommand cmd = connection.CreateCommand())
        {
            cmd.Connection = connection;


            foreach (string line in lines)
            {
                if (line.Length > 0)
                {
                    cmd.CommandText = line;
                    cmd.CommandType = CommandType.Text;

                    try
                    {
                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {

                        throw ex;
                    }
                }
            }
        }


    }//end of function
    public static void ExecScript(string SQLScript, SqlConnection connection, SqlTransaction transaction)
    {
        string sql = SQLScript;        
        //        SqlConnection connection = CUtility.Getconnection(CUtility.eFormsConn.eFormsConnToAuditing);
        Regex regex = new Regex("^GO", RegexOptions.IgnoreCase | RegexOptions.Multiline);
        string[] lines = regex.Split(sql);


        using (SqlCommand cmd = connection.CreateCommand())
        {
            cmd.Connection = connection;
            if (transaction != null) cmd.Transaction = transaction;

            foreach (string line in lines)
            {
                if (line.Length > 0)
                {
                    cmd.CommandText = line;
                    cmd.CommandType = CommandType.Text;

                    try
                    {
                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {

                        throw ex;
                    }
                }
            }
        }


    }//end of function

    public static SqlConnection getConnection(ConnType conntype)
    {
        SqlConnection RetConn = null;
        string strConn = "";
        switch (conntype)
        {
            case ConnType.eFormsDB:
                strConn = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString();
                break;
            case ConnType.eFormsAuditDB:
                strConn = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString();
                break;

            case ConnType.eFormsReportsDB:
                strConn = System.Configuration.ConfigurationManager.ConnectionStrings["DefaultConnection"].ToString();
                break;
        }
        RetConn = new SqlConnection(strConn);
        RetConn.Open();
        return RetConn;
    }
    public static void CloseConnection(ConnType conntype)
    {
        switch (conntype)
        {
            case ConnType.eFormsDB:
                if (CNeFormsDB != null)
                {
                    //MakeLogEntry("Before Closing");
                    if (CNeFormsDB.State != ConnectionState.Closed)
                    {
                        MakeLogEntry(string.Format("{0}: Closing Connection, State: {1}", CNeFormsDB.GetHashCode(), CNeFormsDB.State.ToString()));

                        CNeFormsDB.Close();
                        CNeFormsDB.Dispose();
                        CNeFormsDB = null;

                       // MakeLogEntry("Connection Closed & Disposed");
                    }
                }
                
                break;
            case ConnType.eFormsAuditDB:
                if (CNeFormsAuditDB != null)
                    if (CNeFormsAuditDB.State != ConnectionState.Closed)
                    {
                        MakeLogEntry(string.Format("{0}: Closing Connection, State: {1}", CNeFormsAuditDB.GetHashCode(), CNeFormsAuditDB.State.ToString()));

                        CNeFormsAuditDB.Close();
                        CNeFormsAuditDB.Dispose();
                        CNeFormsAuditDB = null;
                       // MakeLogEntry("Connection Closed & Disposed");
                    }
                
                break;
        }
    }
    public static void CloseAllConnections()
    {

        CloseConnection(ConnType.eFormsDB);
        CloseConnection(ConnType.eFormsAuditDB);
       // MakeLogEntry("Page Unloaded \t\n\t\n\t\n");
        //LogFileSW.Flush();
        //LogFileSW.Close();
        //LogFileSW.Dispose();
        //LogFileSW = null;

    }
    static void CreateErrorTable()
    {
        string TableSQL =
            @"
                if not exists (select * from dbo.sysobjects where id = object_id(N'[Error_Log]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
                begin
                declare @TableDDL varchar(2000)
                set @tableddl= '
                    CREATE TABLE [Error_Log] (
	                    [Error_ID] [bigint] IDENTITY (1, 1) NOT NULL ,
	                    [Error_Description] [varchar] (7984) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_Error_Log_Error_Description] DEFAULT (''''),
	                    [Error_Time] [datetime] NOT NULL CONSTRAINT [DF_Error_Log_Error_Time] DEFAULT (getdate()),
	                    CONSTRAINT [PK_Error_Log] PRIMARY KEY  CLUSTERED 
	                    (
		                    [Error_ID]
	                    )  ON [PRIMARY] 
                    ) ON [PRIMARY]
                '
                exec(@tableddl)
                end
        ";
        ExecScript(TableSQL, getConnection(ConnType.eFormsDB));
    }
    static public void AddError(Exception ex, string ErrDescription, string SQLString, string ErrorArguments)
    {

        string StackTrace = ex!=null ? ex.StackTrace:"------";
        string ErrorMessage = ex != null ? ex.Message : "------"; 
        CreateErrorTable();
        string SSQL =
            @"
                insert into Error_Log (Error_Description)
                    values('";

        SSQL += "SQL:\t\n\t\n{0}\t\n\t\nStack Trace\t\n\t\n{1}\t\n\t\nError Message\t\n\t\n{2}\t\n\t\nError Description\t\n\t\n{3}Error Arguments{4}\')";
        ExecScript(String.Format(SSQL, StackTrace.Replace("'", "''"), ErrorMessage.Replace("'", "''"), ErrDescription.Replace("'", "''"), SQLString.Replace("'", "''"), ErrorArguments.Replace("'", "''")), getConnection(ConnType.eFormsDB));
    }

    static public Int64 getMaxID(ConnType conntype, string TableName, string FieldName, string WhereClause)
    {
        Int64 NewCounter;
        object o;

        string SQLMax = "SELECT max(" + FieldName + ")+1 FROM " + TableName + " " + WhereClause;
        SqlCommand SQLCMD = new SqlCommand(SQLMax, getConnection(ConnType.eFormsDB));
        //ValList=(string)(((int) SQLCMD.ExecuteScalar. )+1) + ",";
        o = SQLCMD.ExecuteScalar();
        if (o == DBNull.Value)
        {
            NewCounter = 1;
        }
        else
        {
            NewCounter = Convert.ToInt64(o);
        }
        return NewCounter;
    }
    //static public Int64 getMaxID(ConnType conntype, string TableName, string FieldName)
    //{
    //    Int64 NewCounter;
    //    object o;

    //    string SQLMax = "SELECT max(" + FieldName + ")+1 FROM " + TableName;
    //    SqlCommand SQLCMD = new SqlCommand(SQLMax, getConnection(ConnType.eFormsDB));
    //    //ValList=(string)(((int) SQLCMD.ExecuteScalar. )+1) + ",";
    //    o = SQLCMD.ExecuteScalar();
    //    if (o == DBNull.Value)
    //    {
    //        NewCounter = 1;
    //    }
    //    else
    //    {
    //        NewCounter = Convert.ToInt64(o);
    //    }
    //    return NewCounter;
    //}
    static public Boolean RecordExists(ConnType conntype, string tableName, string CondField, string CondValue, bool IsString)
    {
        Int32 NewCounter;
        object o;
        CondValue = IsString ? "\'" + CondValue + "\'" : CondValue;
        string strSQL = "select count(*) NoOfRecs from " + tableName + " where FirstName=" + CondValue;
        SqlCommand SQLCMD = new SqlCommand(strSQL, getConnection(conntype));
        o = SQLCMD.ExecuteScalar();
        if (Convert.ToInt32(o) > 0)
        {
            return true;
        }
        else
        {
            return false;
        }
    }
    //static public OracleConnection   getOracleConnection()
    //{
    //   // OracleConnection RetConn = null;
    //    if (CNOracleConnection==null )
    //    {
    //        CNOracleConnection.ConnectionString = "Data Source=Production.WORLD;User ID=pwcoffsuser;Unicode=True;Password=ofinterface";
    //    }
    //    if (CNOracleConnection.State == ConnectionState.Closed)
    //    {
    //        CNOracleConnection.Open();
    //    }
    //    return CNOracleConnection;
    //}
   public static  StringBuilder  ItrateControls(ControlCollection CC)
    {
        Hashtable ht = new Hashtable();
       string ctrlID;
        StringBuilder sb = new StringBuilder(20480);
        foreach (Control ctrl in CC)
        {
            if (ctrl.UniqueID != null)
            {
                ctrlID = ctrl.UniqueID + "\t\n";
                sb.Append(ctrlID);
                if (ht.ContainsKey(ctrl.UniqueID)) continue ;
                    ht.Add(ctrl.UniqueID, ctrl.UniqueID);
                if (ctrl.Controls.Count > 0)
                {
                    ItrateControls(CC, ctrlID, sb,ht );
                }
                //else
                //    return sb; 
            }
           
        }
        return sb;
    }
    private  static void ItrateControls(ControlCollection CC, string strParent,StringBuilder sb,Hashtable ht)
    {
        string ctrlID;
       // StringBuilder sb = new StringBuilder(20480);
        foreach (Control ctrl in CC)
        {
            if (ctrl.UniqueID != null)
            {
                if (ht.ContainsKey(ctrl.UniqueID)) 
                    continue  ;
                ht.Add(ctrl.UniqueID, ctrl.UniqueID);

                ctrlID = strParent + "\t-\t" + ctrl.UniqueID + "\t\n";
                sb.Append(ctrlID);
                if (ctrl.Controls.Count > 0)
                {
                    ItrateControls(CC, ctrlID, sb,ht );
                }
                else return;
                
            }

        }
    }
    public static string BreakCamelCase(string CamelString)
    {
        string output = string.Empty;
        bool SpaceAdded = true;

        for (int i = 0; i < CamelString.Length; i++)
        {
            if (CamelString.Substring(i, 1) ==
                CamelString.Substring(i, 1).ToLower())
            {
                output += CamelString.Substring(i, 1);
                SpaceAdded = false;
            }
            else
            {
                if (!SpaceAdded)
                {
                    output += " ";
                    output += CamelString.Substring(i, 1);
                    SpaceAdded = true;
                }
                else
                    output += CamelString.Substring(i, 1);
            }
        }

        return output;
    }
    public static void MakeLogEntry(string LogText)
    {
        //if (LogFileSW == null)
        //{
            LogFileSW = System.IO.File.AppendText("c:\\temp\\ConnectionsLogFile.txt");
        //}
        //else
        {
         
            LogFileSW.WriteLine(DateTime.Now + "\t-----\t" + LogText);
            LogFileSW.Flush();
            LogFileSW.Close();
            LogFileSW = null;
        }

    }
    public static void PlaceControlInTable(Control Ctrl, Table table, int RowIndex, int ColIndex)
    { 
        //if (_Visible == false) return;
        //if(_ContainerTable.Rows[ 
        if (table.Rows.Count <= RowIndex)
        {
            for (int iRow = table.Rows.Count; iRow <= RowIndex; iRow++)
            {
                TableRow TR = new TableRow();
                for (int iCol = 0; iCol <= ColIndex; iCol++)
                {
                    TableCell TC = new TableCell();
                    TR.Cells.Add(TC);

                }
                table.Rows.Add(TR);
            }
        }
        else
        {
            TableRow TR = table.Rows[RowIndex];
            if (TR.Cells.Count <= ColIndex)
            {
                for (int iCol = 0; iCol <= ColIndex; iCol++)
                {
                    TableCell TC = new TableCell();
                    TR.Cells.Add(TC);
                }
            }
            // table.Rows.Add(TR);
        }
        //if (_Visible == false)
        //    table.Rows[RowIndex].Attributes.Add("style", "display:none");
        table.Rows[RowIndex].Cells[ColIndex].Controls.Add(Ctrl);
        //table.Rows[RowIndex].Cells[ColIndex].Attributes.Add("style", "PADDING-LEFT: 6px;	PADDING-RIGHT: 10px;");
    }
    public static void PlaceControlInTable(Control Ctrl, HtmlTable table, int RowIndex, int ColIndex)
    {
        //if (_Visible == false) return;
        //if(_ContainerTable.Rows[ 
        if (table.Rows.Count <= RowIndex)
        {
            for (int iRow = table.Rows.Count; iRow <= RowIndex; iRow++)
            {
                HtmlTableRow TR = new HtmlTableRow();
                for (int iCol = 0; iCol <= ColIndex; iCol++)
                {
                    HtmlTableCell TC = new HtmlTableCell();
                    TR.Cells.Add(TC);

                }
                table.Rows.Add(TR);
            }
        }
        else
        {
            HtmlTableRow TR = table.Rows[RowIndex];
            if (TR.Cells.Count <= ColIndex)
            {
                for (int iCol = 0; iCol <= ColIndex; iCol++)
                {
                    HtmlTableCell TC = new HtmlTableCell();
                    TR.Cells.Add(TC);
                }
            }
            // table.Rows.Add(TR);
        }
        //if (_Visible == false)
        //    table.Rows[RowIndex].Attributes.Add("style", "display:none");
        table.Rows[RowIndex].Cells[ColIndex].Controls.Add(Ctrl);
        //table.Rows[RowIndex].Cells[ColIndex].Attributes.Add("style", "PADDING-LEFT: 6px;	PADDING-RIGHT: 10px;");
    }
    public  static Control  PageContentPlaceHolder(Page page)
    {
        string ContentHolderName = page is IReportPortalSettings ? ((IReportPortalSettings)page).ContentHolderName : "ContentPlaceHolder2";
        if (page.Master != null)
        {
            return page.Master.FindControl(ContentHolderName);
        }
        else
        {
            return page;
        }
    }
    public static Control  PlaceControlInThePage(Control ControlToPlace, Page page, string ContainerId, int RowNo, int ColNo)
    {
        Control ContainerControl = PageContentPlaceHolder(page).FindControl(ContainerId);
        if (ContainerControl == null && page is IReportPortalSettings)
        {
            Control ReportLayoutControl = PageContentPlaceHolder(page).FindControl("ReportLayoutControl");
            IReportLayout ReportLayout = (IReportLayout)ReportLayoutControl;

            if (ReportLayout.HTMLLayoutTables.ContainsKey(ContainerId))
            {
                ContainerControl = ReportLayout.HTMLLayoutTables[ContainerId];
            }
            else
            {
                ContainerControl = ReportLayout.AddControlToHTMLLayout(ControlToPlace, ContainerId, RowNo, ColNo);
            }
            if (ControlToPlace is ILayoutTableWidget)
            {
                ReportLayout.AddContainerControlToLayout((ILayoutTableWidget)ControlToPlace);
            }
        }
        else if(ContainerControl == null)
        {
            //Table tblContainer = new Table();
            //TableRow tblRow = new TableRow();
            //TableCell tblCell = new TableCell();
            //tblRow.Cells.Add(tblCell);
            //tblContainer.Rows.Add(tblRow);
            //tblContainer.BorderStyle = BorderStyle.None;
            //tblContainer.CellPadding = 0;
            //tblContainer.CellSpacing = 0;
            //tblContainer.Width = new Unit("100%");
            //page.Controls.Add(tblContainer);
                ContainerControl = PageContentPlaceHolder(page).FindControl("Table5");
        }

        if (ColNo < 0 || RowNo < 0) //if container is not a table
        {
            ContainerControl.Controls.Add(ControlToPlace);
            //_ContainerTable.Visible = true;
        }
        else //if container is a table
        {
            if (ContainerControl is Table)
            {
                CUtilityWeb.PlaceControlInTable(ControlToPlace, (Table)ContainerControl, RowNo, ColNo);
            }
            else
            {
                CUtilityWeb.PlaceControlInTable(ControlToPlace, (HtmlTable)ContainerControl, RowNo, ColNo);

            }
        }
        return ContainerControl;
    }

    //Initially created to excute procedure - Proc_CounterValue in PwcTravelRequestExpense.
    //Can be Re-used by any process.
    static public void getScalar(string ProcName, SqlParameter[] oParameterList, SqlConnection Conn)
    {
        IEnumerator oEnumerator = oParameterList.GetEnumerator();
        SqlCommand cmd = Conn.CreateCommand();
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = Conn;
        cmd.CommandText = ProcName;
        while (oEnumerator.MoveNext())
        {
            cmd.Parameters.Add(oEnumerator.Current);
        }
        cmd.ExecuteNonQuery();
    }
    static public SqlParameter AddParameter(string strParamName,
                     SqlDbType strType,
                     int nLen,
                     object strParamValue,
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
    public static string FixupUrl(string Url)
    {

        if (Url.StartsWith("~"))

            return (HttpContext.Current.Request.ApplicationPath +
                    Url.Substring(1)).Replace("//", "/");

        return Url;

    }
    public static string GetCurrentUserId()
    {
       
        //if(PortalEnvironment()== PortalEnvironmentType.StandAloneApp)
        //{
        //    return (HttpContext.Current.Session["UserId"] == null ? "" : HttpContext.Current.Session["UserId"].ToString());
        //}
        //else
        //{
            return (HttpContext.Current.Session["UserId"] == null ? "" : HttpContext.Current.Session["UserId"].ToString().Trim());
        //}

    }
    public static PortalEnvironmentType  PortalEnvironment()
    {
       // if( ConfigurationManager.AppSettings
        string ReportsPortalAppType = "";
        try
        {
            ReportsPortalAppType = ConfigurationManager.AppSettings["ReportsPortalAppType"];
        }
        catch(Exception )
        {
            return PortalEnvironmentType.InsideeForms;
        }
        if(ReportsPortalAppType!=null)
            return (PortalEnvironmentType)Enum.Parse(typeof(PortalEnvironmentType), ConfigurationManager.AppSettings["ReportsPortalAppType"], true);
        else
            return PortalEnvironmentType.InsideeForms;
    }
    public static void AddScriptReference(string ScriptPath, Page page)
    {
        ScriptManager Smgr = ScriptManager.GetCurrent(page);
        if (Smgr != null)
        {
            ScriptReference SRef = new ScriptReference();
            SRef.Path = ScriptPath;
            Smgr.Scripts.Add(SRef);
        }
    }
}

