using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using PWC.PresentationServices.Web.UI.WebControls;
using InfoSoftGlobal;
using WebProject.eForms.Web.UI.Page;

namespace WebProject.ReportsEngine
{
    public partial class Dashboard_SSDTeamDetails1 : System.Web.UI.Page
    {
        string GraphID = "";
        string GridID = "";
        string SearchPanelID = "";
        string ReportID = "";
        SearchPanel SPanel = null;
        GraphHolder GRPHolder = null;
        GridHolder GRDHolder = null;
        ReportHolder RPTHolder = null;
        ReportsSecurity RPTSEC;
        //Hashtable objHT = new Hashtable();
        static string[] strArrColor = new string[] { "DA3608", "015887", "78AE1C", "011187", "011287", "011187", "019f87", "081187", "01ee77", "015687", "01f487", "011587", "01e387", "015487", "01f287", "01ee77", "015687", "01f487", "011587", "01e387", "015487", "01f287" };
        public Dictionary<string, string> objHT = new Dictionary<string, string>();

        public string OnClickScript
        {
            get
            {
                StringBuilder QueryURL = new StringBuilder(512);
                QueryURL.Append("NextReportID=" + ReportID);


                if (SPanel != null)
                {
                    foreach (KeyValuePair<string, SearchField> KVP in SPanel.SearchFields)
                    {
                        SearchField sf = KVP.Value;

                        QueryURL.Append("&" + sf.ID + "=" + sf.FieldValue);

                    }

                }

                return String.Format(@"
    <script language=""javascript"" type=""text/javascript"">

		        function ShowNewExportDataPopup()
                {{
                  //  window.open(Link,null,'left=300, top=150, height=400, width= 600, status=n o, resizable= no, scrollbars= no, toolbar= no,location= no, menubar= no'); return false;
                     window.open(""./ExportData.aspx?{0}"",null,''); return false;

                }}
    </script>

", QueryURL.ToString());
            }

        }
        public string InitScript
        {
            get
            {
                //cblEmployeeDetailsOptions
                btnRenderGraph.Attributes.Add("onclick", "return UpdateEmployeeChart(" + ddlMonth.ClientID + ")");
                StringBuilder SBInitScript = new StringBuilder(4096);
                SBInitScript.Append(
               "\t\nvar myFrm= new Object();" +
               "\t\nfunction initScript(){" +
               "\t\n myFrm.rblSelectedGraph_0=document.forms[0]." + rblSelectedGraph.ClientID + "_0;" +
               "\t\n myFrm.rblSelectedGraph_1=document.forms[0]." + rblSelectedGraph.ClientID + "_1;" +
               "\t\n myFrm.rblSelectedGraph_2=document.forms[0]." + rblSelectedGraph.ClientID + "_2;" +


               //"\t\n myFrm.rblBusinessCategory_0=document.forms[0]." + rblBusinessCategory.ClientID + "_0;" +
               //"\t\n myFrm.rblBusinessCategory_1=document.forms[0]." + rblBusinessCategory.ClientID + "_1;" +

               //"\t\n myFrm.rblBusinessGroup_0=document.forms[0]." + rblBusinessGroup.ClientID + "_0;" +
               //"\t\n myFrm.rblBusinessGroup_1=document.forms[0]." + rblBusinessGroup.ClientID + "_1;" +
               //"\t\n myFrm.rblBusinessGroup_2=document.forms[0]." + rblBusinessGroup.ClientID + "_2;" +
               //"\t\n myFrm.rblBusinessGroup_3=document.forms[0]." + rblBusinessGroup.ClientID + "_3;" +
               //"\t\n myFrm.rblBusinessGroup_4=document.forms[0]." + rblBusinessGroup.ClientID + "_4;" +
               //"\t\n myFrm.ddlInfrastructure=document.forms[0]." + ddlInfrastructure.ClientID + ";" +

               //"\t\n myFrm.chkPlannedTasks=document.forms[0]." + rblSelectedSeries.ClientID + "_0;" +
               //"\t\n myFrm.chkUnplannedTasks=document.forms[0]." + rblSelectedSeries.ClientID + "_1;" +
               //"\t\n myFrm.chkAttendance=document.forms[0]." + rblSelectedSeries.ClientID + "_2;" +

               //"\t\n myFrm.rblBusinessCategory_0.onclick=Update_BG_Category;"  +
               //"\t\n myFrm.rblBusinessCategory_1.onclick=Update_BG_Category;" +

               //"\t\n myFrm.rblBusinessGroup_0.onclick=Update_BG_Category;" +
               //"\t\n myFrm.rblBusinessGroup_1.onclick=Update_BG_Category;" +
               //"\t\n myFrm.rblBusinessGroup_2.onclick=Update_BG_Category;" +
               //"\t\n myFrm.rblBusinessGroup_3.onclick=Update_BG_Category;" +
               //"\t\n myFrm.rblBusinessGroup_4.onclick=Update_BG_Category;" +

               "\t\n myFrm.rblSelectedGraph_0.onclick = ShowProjectGrid;" +
               "\t\n myFrm.rblSelectedGraph_1.onclick = ShowProjectGrid;" +
               "\t\n myFrm.rblSelectedGraph_2.onclick = ShowProjectGrid;" +

               ";\t\n" +
               "ShowProjectGrid();" +
               @"
        }

"

               );
                SBInitScript.Append(
        @"   function ShowProjectGrid()
     {
        if(myFrm.rblSelectedGraph_0.checked)
        {
            document.getElementById(""divrblSelectedGraph_0"").style.display= '';
            document.getElementById(""divrblSelectedGraph_1"").style.display= 'none';
            document.getElementById(""divrblSelectedGraph_2"").style.display= 'none';
        }
        else if(myFrm.rblSelectedGraph_1.checked)
        {
            document.getElementById(""divrblSelectedGraph_0"").style.display= 'none';
            document.getElementById(""divrblSelectedGraph_1"").style.display= '';
            document.getElementById(""divrblSelectedGraph_2"").style.display= 'none';
        }
        else //if(myFrm.rblSelectedGraph_1.checked)
        {
            document.getElementById(""divrblSelectedGraph_0"").style.display= 'none';
            document.getElementById(""divrblSelectedGraph_1"").style.display= 'none';
            document.getElementById(""divrblSelectedGraph_2"").style.display= '';
        }

      }
");
                return string.Format(@"
<script language=""javascript"" type=""text/javascript"">
    {0}                
</script>", SBInitScript.ToString());

            }
        }
        protected void Page_PreInit(object sender, EventArgs e)
        {
        }
        protected void Page_InitComplete(object sender, EventArgs e)
        {

            ReportID = Request.QueryString["NextReportID"];
            if (Request.QueryString["NextReportID"] != null && Request.QueryString["NextReportID"] == "UnderConstruction")
            {
                //
            }
            else if (Request.QueryString["NextReportID"] != null)
            {
                RPTHolder = new ReportHolder(Request.QueryString["NextReportID"]);
                GraphID = RPTHolder.ChartID;
                GridID = RPTHolder.GridID;
                SearchPanelID = RPTHolder.SearchPanelID;
            }
            else
            {
                GraphID = Request.QueryString["NextGraphID"];
                GridID = Request.QueryString["NextGridID"];
                SearchPanelID = Request.QueryString["NextSearchPanelID"];
            }


        }
        void FetchRoles(string EmailID)
        {
            //Authorised Roles are storedd as a session variable.........
            SqlConnection myConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB);//ConfigurationSettings.AppSettings["ReportConnectionString"];
            string CommandText = "";
            string strAuthorisedRoles = "";

            //CommandText = "select RoleName from Admin_UserRole_RoleName_V where EmailID ='" +EmailID+ "'";
            CommandText = "EXECUTE sp_GetUserInfo '" + EmailID + "'";

            //SqlConnection myConnection = new SqlConnection(ConnectionString);
            SqlDataAdapter myCommand = new SqlDataAdapter(CommandText, myConnection);
            DataSet ds = new DataSet();
            try
            {
                myCommand.Fill(ds);
            }
            catch (Exception ex)
            {
                //txtError.Text = ex.Message;
            }

            if (ds.Tables[0].Rows.Count >= 3)
            {
                //Session["OrganizationIDs"] = ds.Tables[0].Rows[0][0].ToString();
                //Session["DepartmentIDs"] = ds.Tables[0].Rows[1][0].ToString();
                Session["AuthorisedRoles"] = ds.Tables[0].Rows[2][0].ToString();
                //Session["BranchIDs"] = ds.Tables[0].Rows[3][0].ToString();
                //Session["AuthorisedID"] = Session.SessionID;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["EForms4UserId"].ToString();
            //Session["EmailID"] = "af.mirza";
            //Session["OrganizationIDs"] = "(202)";
            //Session["DepartmentIDs"] = "(289)";

            string strEmailID = "";
            string strEForms4UserId = "";

            if (Session["EmailID"] != null && Session["EmailID"] != "")
                strEmailID = Session["EmailID"].ToString();

            if (Session["EForms4UserId"] != null && Session["EForms4UserId"] != "")
                strEForms4UserId = Session["EForms4UserId"].ToString();

            Session["EmailID"] = Session["EForms4UserId"];

            if (Session["AuthorisedRoles"] == null || Session["AuthorisedRoles"] == "" || strEmailID != strEForms4UserId)
            {
                FetchRoles(Session["EForms4UserId"].ToString());
            }

            Literal ltrl = new Literal();
            ltrl.Text = InitScript;
            Header.Controls.Add(ltrl);
            ddlMonth.SelectedIndex = DateTime.Now.Month - 1;

        }
        void Page_LoadComplete(object sender, EventArgs e)
        {
        }
        void Page_Unload(object sender, EventArgs e)
        {
            //  throw new Exception("The method or operation is not implemented.");
            CUtilityWeb.CloseAllConnections();
        }



        public string LoadChart_S_1()
        {
            return "";
            SqlParameter[] sqlParams = new SqlParameter[1];
            sqlParams[0] = CUtilityWeb.AddParameter("ProjectType", SqlDbType.VarChar, 100, "Business Process Automation", ParameterDirection.Input);

            DataTable dtResult;
            string strCaption, strChartSWF, strChartMetricsUsed, strChartDescription, strXMLDATA, strNumberSuffix;
            int SYaxisSeriesNo = 0;

            using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                dtResult = ExecuteDataTable("RPT_ITSSDProjects_SP", Conn, sqlParams);
            }

            strCaption = "Projects In Progress : All Business Groups";
            //SYaxisSeriesNo = 3;
            strChartSWF = "StackedColumn3D.swf";  //"StackedColumn2D.swf";// 
            strChartMetricsUsed = "Total Usage, IPT Usage, Actual Monthly Cost, Non IPT Cost";
            strChartDescription = @"This will illustrate the potential savings of IPT implementation against the usage trends 
                                        <br/>This would allow us to track the usage and potential savings of IPT implementation";
            strXMLDATA = GenerateXMLforStack(dtResult, SYaxisSeriesNo, strCaption, null, null, "", 0, 0, "P-detailsPopUp,width=800,height=585,toolbar=no,location=no,menubar=no,directories=0,resizable=no-gridviewer.aspx?NextReportID=ITSSDProjectsDetails&ProjectType=Business Process Automation&RequestType=%SeriesName&ProjectStatus=%XAxisValue");
            return FusionCharts.RenderChart("FusionCharts/StackedColumn3D.swf", "", strXMLDATA.ToString(), "Chart_S_1", "600", "400", false, true);

        }

        public string LoadChart_S_2()
        {

            return "";
            SqlParameter[] sqlParams = null;
            //sqlParams[0] = CUtilityWeb.AddParameter("ProjectType", SqlDbType.VarChar, 100, "Business Process Automation", ParameterDirection.Input);

            DataTable dtResult;
            string strCaption, strChartSWF, strChartMetricsUsed, strChartDescription, strXMLDATA, strNumberSuffix, strSubCaption;
            int SYaxisSeriesNo = 0;
            using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                // dtResult = ExecuteDataTable("RPT_ITSSDProjectsByBU_SP", Conn, sqlParams);
                dtResult = ExecuteDataTable("RPT_ITSSDProjectsProcessLive_sp", Conn, sqlParams);
            }

            strCaption = "Live Implemented Processes";
            strChartSWF = "Pie3D.swf";
            strSubCaption = "(Click to see function wise breakdown on the next chart)";
            strChartMetricsUsed = "Total Usage, IPT Usage, Actual Monthly Cost, Non IPT Cost";
            strChartDescription = @"This will illustrate the potential savings of IPT implementation against the usage trends 
                                            <br/>This would allow us to track the usage and potential savings of IPT implementation";

            strXMLDATA = GenerateXMlforPieChart(dtResult, SYaxisSeriesNo, strCaption, strSubCaption, null, "", 0, 0, "javaScript:LiveProcessDrillDown(\"" + "%PieValue" + "\");");

            return FusionCharts.RenderChart("FusionCharts/Pie3D.swf", "", strXMLDATA.ToString(), "Chart_S_2", "500", "250", false, true);
        }


        public string LoadChart_B_1()
        {
            return "";

            SqlParameter[] sqlParams = new SqlParameter[1];
            sqlParams[0] = CUtilityWeb.AddParameter("ProjectType", SqlDbType.VarChar, 100, "Business Process Automation", ParameterDirection.Input);

            DataTable dtResult;
            string strCaption, strChartSWF, strChartMetricsUsed, strChartDescription, strXMLDATA, strNumberSuffix, strSubCaption;
            int SYaxisSeriesNo = 0;
            using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                dtResult = ExecuteDataTable("RPT_ITSSDProjectsMonthlyTrend_sp", Conn, sqlParams);
            }

            strCaption = "Live Projects Monthly Trend : All Business Groups";
            strChartSWF = "MSColumn3D.swf";
            //strChartHeight = "350";
            strChartMetricsUsed = "Total Usage, IPT Usage, Actual Monthly Cost, Non IPT Cost";
            strChartDescription = @"This will illustrate the potential savings of IPT implementation against the usage trends 
                                            <br/>This would allow us to track the usage and potential savings of IPT implementation";

            strXMLDATA = GenerateXMLForMultiSeries(dtResult, SYaxisSeriesNo, strCaption, "", null, "", 0, 0, null, null, null);

            return FusionCharts.RenderChart("FusionCharts/MSColumn3D.swf", "", strXMLDATA.ToString(), "Chart_B_1", "525", "300", false, true);

        }


        public string LoadChart_B_2()
        {
            int SelectedMonthNo, CurrentYear;

            CurrentYear = DateTime.Now.Year;
            SelectedMonthNo = ddlMonth.SelectedIndex + 1;

            string FirstDayOfMonth, LastDayOfMonth;

            FirstDayOfMonth = CurrentYear.ToString() + "/" + SelectedMonthNo.ToString() + "/01";
            LastDayOfMonth = CurrentYear.ToString() + "/" + SelectedMonthNo.ToString() + "/" + DateTime.DaysInMonth(CurrentYear, SelectedMonthNo);

            string SSQLProjectsCols = "SELECT FormId, ISNULL(ProjectName, 'N/A') AS ProjectName, ChangeSummary, RequestPriority, CONVERT(varchar(10), PlannedDevStartDate, 103) AS PlannedDevStartDate, CONVERT(varchar(10), PlannedDevEndDate, 103) AS PlannedDevEndDate, LeadDeveloper FROM EformsChangeRequestProcess WHERE (PlannedDevStartDate >= '" + FirstDayOfMonth + "') and (PlannedDevStartDate <= '" + LastDayOfMonth + "') and len(LeadDeveloper) > 0";
            DataTable dtProjectsCols;

            using (SqlConnection sqlProjectsConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                dtProjectsCols = CUtilityWeb.getDataTable(SSQLProjectsCols, sqlProjectsConnection);
            }

            string SSQLTemplateCols = "SELECT PwcTaskTracking.FormId, ISNULL(PwcTaskTracking.ProjectName, 'N/A') AS ProjectName, PwcTaskTracking.Title, PwcTaskTracking.Priority, CONVERT(varchar(10), PwcTaskTracking.TaskStartDate, 103) AS TaskStartDate, CONVERT(varchar(10), PwcTaskTracking.TaskDueDate, 103) AS TaskDueDate, ISNULL(PwcTaskTracking.PercentageCompleted, 0) AS PercentageCompleted, PwcTaskTracking.RequestFor, PwcTaskTracking.PlannedUnplanned, Users.Name FROM PwcTaskTracking LEFT OUTER JOIN Users ON PwcTaskTracking.RequestFor = Users.UserId WHERE (PwcTaskTracking.TaskStartDate >= '" + FirstDayOfMonth + "') and (PwcTaskTracking.TaskStartDate <= '" + LastDayOfMonth + "')";
            DataTable dtTemplateCols;

            using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                dtTemplateCols = CUtilityWeb.getDataTable(SSQLTemplateCols, sqlConnection);
            }

            //string SSQLAttendanceCols = "SELECT PwcTaskTracking.FormId, ISNULL(PwcTaskTracking.ProjectName, 'N/A') AS ProjectName, PwcTaskTracking.Title, PwcTaskTracking.Priority, CONVERT(varchar(10), PwcTaskTracking.TaskStartDate, 103) AS TaskStartDate, CONVERT(varchar(10), PwcTaskTracking.TaskDueDate, 103) AS TaskDueDate, ISNULL(PwcTaskTracking.PercentageCompleted, 0) AS PercentageCompleted, PwcTaskTracking.RequestFor, Users.Name FROM PwcTaskTracking LEFT OUTER JOIN Users ON PwcTaskTracking.RequestFor = Users.UserId WHERE (PwcTaskTracking.TaskStartDate >= '2009-08-01')";
            string SSQLAttendanceCols = "RPT_AttendenceBasedOnLogin_SP";
            DataTable dtAttendanceCols;

            using (SqlConnection sqlAttendanceConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsReportsDB))
            {
                SqlParameter[] Params = new SqlParameter[3];
                Params[0] = CUtilityWeb.AddParameter("@UserId", SqlDbType.VarChar, 50, "aahmedmirza", ParameterDirection.Input);
                Params[1] = CUtilityWeb.AddParameter("@FromDate", SqlDbType.DateTime, 50, FirstDayOfMonth, ParameterDirection.Input);
                Params[2] = CUtilityWeb.AddParameter("@ToDate", SqlDbType.DateTime, 50, LastDayOfMonth, ParameterDirection.Input);

                dtAttendanceCols = CUtilityWeb.getDataTable(SSQLAttendanceCols, sqlAttendanceConnection, Params);
            }

            StringBuilder strXML = new StringBuilder();
            strXML.Append("<chart slackFillColor='EEEEEE' dateInToolTip='0' scrollColor='99CCCC' scrollPadding='3' scrollHeight='20' scrollBtnWidth='28' scrollBtnPadding='3' dateFormat='dd/mm/yyyy' caption='SSD Team Schedule' subCaption='From " + FirstDayOfMonth + " - " + LastDayOfMonth + "' ganttPaneDuration='57' ganttPaneDurationUnit='d' palette='2'>");

            // Add Categories
            strXML.Append("<categories>");

            for (int i = 1; i <= System.DateTime.DaysInMonth(CurrentYear, SelectedMonthNo); i++)
            {
                strXML.Append("<category start='" + i.ToString() + "/" + SelectedMonthNo.ToString() + "/" + CurrentYear.ToString() + "' end='" + i + "/" + SelectedMonthNo.ToString() + "/" + CurrentYear.ToString() + "' label='" + i.ToString() + "' />");
            }
            strXML.Append("<category start='01/" + (SelectedMonthNo + 1).ToString() + "/" + CurrentYear.ToString() + "' end='01/" + (SelectedMonthNo + 1).ToString() + "/" + CurrentYear.ToString() + "' label='Sat' />");

            strXML.Append("</categories>");
            // End Categories


            // Add Processes
            strXML.Append("<processes fontSize='12' isBold='1' align='left' headerText='Team Members' headerFontSize='14' headerVAlign='bottom' headerAlign='left'>");

            //DataTable dtDistinctEmployees = dtTemplateCols.DefaultView.ToTable(true, new string[] { "Name", "RequestFor" });
            //foreach (DataRow DR in dtDistinctEmployees.Rows)
            //{
            //    strXML.Append("<process label='" + DR["Name"].ToString() + "' id='" + DR["RequestFor"].ToString() + "'/>");
            //}

            //Kuwait Team
            strXML.Append("<process label='Asif' id='aahmedmirza'/>");
            strXML.Append("<process label='Abdullah' id='anoorahmed'/>");
            strXML.Append("<process label='Abdel Razag' id='ababbasali'/>");
            strXML.Append("<process label='Maha' id='mal-kamsheh'/>");
            strXML.Append("<process label='Qasim' id='muhaali'/>");
            strXML.Append("<process label='Aqsa' id='ajamal'/>");
            strXML.Append("<process label='Shams' id='syassin'/>");
            strXML.Append("<process label='Juny' id='javarachen'/>");
            strXML.Append("<process label='Zeeshan' id='zrehmat'/>");

            //India Team
            strXML.Append("<process label='Sharath' id='spadinela'/>");
            strXML.Append("<process label='Sreekanth' id='sgunti'/>");
            strXML.Append("<process label='Vikram' id='vkamalapur'/>");
            strXML.Append("<process label='Ajay' id='aneela'/>");
            strXML.Append("<process label='Sreedhar' id='tsreedhar'/>");
            strXML.Append("<process label='Nagamani' id='nummareddy'/>");
            strXML.Append("<process label='Phani' id='piruku'/>");
            strXML.Append("<process label='Gopi' id='gchitluri'/>");
            strXML.Append("<process label='Avani' id='aavani'/>");


            strXML.Append("</processes>");
            // End Processes

            // Add Tasks
            strXML.Append("<tasks>");

            foreach (DataRow DR in dtProjectsCols.Rows)
            {
                strXML.Append("<task color='453269' height='15' topPadding='15" + HttpUtility.UrlEncode("%") + "' processId='" + DR["LeadDeveloper"].ToString() + "' id='" + DR["FormId"].ToString() + "' start='" + DR["PlannedDevStartDate"].ToString() + "' end='" + DR["PlannedDevEndDate"].ToString() + "' label='" + HttpUtility.UrlEncode(DR["ProjectName"].ToString()) + ", " + HttpUtility.UrlEncode(DR["ChangeSummary"].ToString()) + "' />");
            }

            foreach (DataRow DR in dtTemplateCols.Rows)
            {
                ////strXML.Append("<task color='453269' height='40" + HttpUtility.UrlEncode("%") + "' topPadding='20" + HttpUtility.UrlEncode("%") + "' processId='" + DR["RequestFor"].ToString() + "' id='" + DR["FormId"].ToString() + "' start='" + DR["TaskStartDate"].ToString() + "' end='" + DR["TaskDueDate"].ToString() + "' label='" + HttpUtility.UrlEncode(DR["ProjectName"].ToString()) + ", " + HttpUtility.UrlEncode(DR["Title"].ToString()) + "' percentComplete='" + DR["PercentageCompleted"].ToString() + "'/>");
                //if (DR["PlannedUnplanned"].ToString() == "P")
                //{
                //    strXML.Append("<task color='453269' height='15' topPadding='15" + HttpUtility.UrlEncode("%") + "' processId='" + DR["RequestFor"].ToString() + "' id='" + DR["FormId"].ToString() + "' start='" + DR["TaskStartDate"].ToString() + "' end='" + DR["TaskDueDate"].ToString() + "' label='" + HttpUtility.UrlEncode(DR["ProjectName"].ToString()) + ", " + HttpUtility.UrlEncode(DR["Title"].ToString()) + "' />");
                //}
                //else
                //{
                strXML.Append("<task color='FF654F' height='15' topPadding='45" + HttpUtility.UrlEncode("%") + "' processId='" + DR["RequestFor"].ToString() + "' id='" + DR["FormId"].ToString() + "' start='" + DR["TaskStartDate"].ToString() + "' end='" + DR["TaskDueDate"].ToString() + "' label='" + HttpUtility.UrlEncode(DR["ProjectName"].ToString()) + ", " + HttpUtility.UrlEncode(DR["Title"].ToString()) + "' />");
                //}
            }

            foreach (DataRow DR in dtAttendanceCols.Rows)
            {
                //strXML.Append("<task height='40" + HttpUtility.UrlEncode("%") + "' topPadding='20" + HttpUtility.UrlEncode("%") + "' processId='" + DR["RequestFor"].ToString() + "' id='" + DR["FormId"].ToString() + "' start='" + DR["TaskStartDate"].ToString() + "' end='" + DR["TaskDueDate"].ToString() + "' label='" + DR["ProjectName"].ToString() + ", " + DR["Title"].ToString() + "' percentComplete='" + DR["PercentageCompleted"].ToString() + "'/>");

                string strColor = "";
                string strDuration = DR["Duration"].ToString().Contains(":") ? DR["Duration"].ToString().Split(new char[] { ':' })[0] : DR["Duration"].ToString();

                if (DR["status"].ToString() == "Annual Leave")
                    strColor = "FF654F";

                if (DR["status"].ToString() == "Present")
                {
                    if (Convert.ToInt32(strDuration) < 8)
                        strColor = "F6BD0F";

                    if (Convert.ToInt32(strDuration) >= 8)
                        strColor = "8BBA00";
                }

                if (DR["status"].ToString() == "Annual Leave" || DR["status"].ToString() == "Present")
                    strXML.Append("<task height='10' topPadding='75" + HttpUtility.UrlEncode("%") + "' processId='" + DR["UserId"].ToString() + "' id='" + DR["UserId"].ToString() + ", " + DR["CalendarDate"].ToString() + "' start='" + DR["CalendarDate"].ToString() + "' end='" + DR["EndDate"].ToString() + "' label='" + DR["status"].ToString() + ", Time In:" + DR["TimeIn"].ToString() + ", Time Out:" + DR["TimeOut"].ToString() + ", Duration: " + DR["Duration"].ToString() + "' color='" + strColor + "'/>");

                //strXML.Append("<task height='15" + HttpUtility.UrlEncode("%") + "' topPadding='75" + HttpUtility.UrlEncode("%") + "' processId='" + DR["UserId"].ToString() + "' id='" + DR["UserId"].ToString() + ", " + DR["CalendarDate"].ToString() + "' start='" + DR["CalendarDate"].ToString() + "' end='" + DR["EndDate"].ToString() + "' label='" + DR["status"].ToString() + ", Time In:" + DR["TimeIn"].ToString() + ", Time Out:" + DR["TimeOut"].ToString() + ", Duration: " + DR["Duration"].ToString() + "' color='" + strColor + "'/>");
            }

            strXML.Append("</tasks>");
            // End Tasks

            strXML.Append("<milestones>");
            foreach (DataRow DR in dtAttendanceCols.Rows)
            {
                string strDuration = DR["Duration"].ToString().Contains(":") ? DR["Duration"].ToString().Split(new char[] { ':' })[0] : DR["Duration"].ToString();

                if (Convert.ToInt32(strDuration) >= 10)
                    strXML.Append("<milestone date='" + DR["EndDate"].ToString() + "' taskId='" + DR["UserId"].ToString() + ", " + DR["CalendarDate"].ToString() + "' radius='4' color='333333' shape='Star' numSides='5' borderThickness='1' />");
            }
            strXML.Append("</milestones>");

            // Add Trendlines
            strXML.Append("<trendlines>");

            List<string> Holidays = GetHolidays(SelectedMonthNo, CurrentYear);
            foreach (string Holiday in Holidays)
            {
                strXML.Append("<line  " + Holiday + " displayValue='' isTrendZone='1' alpha='20' color='FF5904'/>");

            }
            //strXML.Append("<line start='1/08/2009' end='2/08/2009' displayValue='Vacation' isTrendZone='1' alpha='20' color='FF5904'/>");
            //strXML.Append("<line start='7/08/2009' end='9/08/2009' displayValue='Vacation' isTrendZone='1' alpha='20' color='FF5904'/>");
            //strXML.Append("<line start='14/08/2009' end='16/08/2009' displayValue='Vacation' isTrendZone='1' alpha='20' color='FF5904'/>");
            //strXML.Append("<line start='21/08/2009' end='23/08/2009' displayValue='Vacation' isTrendZone='1' alpha='20' color='FF5904'/>");
            //strXML.Append("<line start='28/08/2009' end='30/08/2009' displayValue='Vacation' isTrendZone='1' alpha='20' color='FF5904'/>");
            strXML.Append("</trendlines>");
            // End Trendlines

            strXML.Append("<legend>");
            strXML.Append("<item label='Annual Leave' color='FF654F' />");
            strXML.Append("<item label='Less than 8 Hours' color='F6BD0F' />");
            strXML.Append("<item label='More than 8 Hours' color='8BBA00' />");
            strXML.Append("<item label='Star: More than 10 Hours' color='333333' />");
            strXML.Append("<item label='Task Completed' color='453269' />");
            strXML.Append("<item label='Task Planned or Remaining' color='EEEEEE' />");

            strXML.Append("</legend>");

            strXML.Append("</chart>");
            return FusionCharts.RenderChart("FusionWidgets/Gantt.swf", "", strXML.ToString(), "Chart_B_2", "950", "1500", false, true);

        }

        public string LoadChart_B_3()
        {
            int SelectedMonthNo, CurrentYear;

            CurrentYear = DateTime.Now.Year;
            SelectedMonthNo = ddlMonth.SelectedIndex + 1;

            string FirstDayOfMonth, LastDayOfMonth;

            FirstDayOfMonth = CurrentYear.ToString() + "/" + SelectedMonthNo.ToString() + "/01";
            LastDayOfMonth = CurrentYear.ToString() + "/" + SelectedMonthNo.ToString() + "/" + DateTime.DaysInMonth(CurrentYear, SelectedMonthNo);

            string SSQLProjectsCols = "SELECT FormId, ISNULL(ProjectName, 'N/A') AS ProjectName, ChangeSummary, RequestPriority, CONVERT(varchar(10), PlannedDevStartDate, 103) AS PlannedDevStartDate, CONVERT(varchar(10), PlannedDevEndDate, 103) AS PlannedDevEndDate, LeadDeveloper FROM EformsChangeRequestProcess WHERE (PlannedDevStartDate >= '" + FirstDayOfMonth + "') and (PlannedDevStartDate <= '" + LastDayOfMonth + "') and len(LeadDeveloper) > 0";
            DataTable dtProjectsCols;

            using (SqlConnection sqlProjectsConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                dtProjectsCols = CUtilityWeb.getDataTable(SSQLProjectsCols, sqlProjectsConnection);
            }

            //string SSQLTemplateCols = "SELECT PwcTaskTracking.FormId, ISNULL(PwcTaskTracking.ProjectName, 'N/A') AS ProjectName, PwcTaskTracking.Title, PwcTaskTracking.Priority, CONVERT(varchar(10), PwcTaskTracking.TaskStartDate, 103) AS TaskStartDate, CONVERT(varchar(10), PwcTaskTracking.TaskDueDate, 103) AS TaskDueDate, ISNULL(PwcTaskTracking.PercentageCompleted, 0) AS PercentageCompleted, PwcTaskTracking.RequestFor, PwcTaskTracking.PlannedUnplanned, Users.Name FROM PwcTaskTracking LEFT OUTER JOIN Users ON PwcTaskTracking.RequestFor = Users.UserId WHERE (PwcTaskTracking.TaskStartDate >= '" + FirstDayOfMonth + "') and (PwcTaskTracking.TaskStartDate <= '" + LastDayOfMonth + "')";
            //DataTable dtTemplateCols;

            //using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            //{
            //    dtTemplateCols = CUtilityWeb.getDataTable(SSQLTemplateCols, sqlConnection);
            //}

            //string SSQLAttendanceCols = "SELECT PwcTaskTracking.FormId, ISNULL(PwcTaskTracking.ProjectName, 'N/A') AS ProjectName, PwcTaskTracking.Title, PwcTaskTracking.Priority, CONVERT(varchar(10), PwcTaskTracking.TaskStartDate, 103) AS TaskStartDate, CONVERT(varchar(10), PwcTaskTracking.TaskDueDate, 103) AS TaskDueDate, ISNULL(PwcTaskTracking.PercentageCompleted, 0) AS PercentageCompleted, PwcTaskTracking.RequestFor, Users.Name FROM PwcTaskTracking LEFT OUTER JOIN Users ON PwcTaskTracking.RequestFor = Users.UserId WHERE (PwcTaskTracking.TaskStartDate >= '2009-08-01')";
            //string SSQLAttendanceCols = "RPT_AttendenceBasedOnLogin_SP";
            //DataTable dtAttendanceCols;

            //using (SqlConnection sqlAttendanceConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsReportsDB))
            //{
            //    SqlParameter[] Params = new SqlParameter[3];
            //    Params[0] = CUtilityWeb.AddParameter("@UserId", SqlDbType.VarChar, 50, "aahmedmirza", ParameterDirection.Input);
            //    Params[1] = CUtilityWeb.AddParameter("@FromDate", SqlDbType.DateTime, 50, FirstDayOfMonth, ParameterDirection.Input);
            //    Params[2] = CUtilityWeb.AddParameter("@ToDate", SqlDbType.DateTime, 50, LastDayOfMonth, ParameterDirection.Input); 

            //    dtAttendanceCols = CUtilityWeb.getDataTable(SSQLAttendanceCols, sqlAttendanceConnection, Params);
            //}

            StringBuilder strXML = new StringBuilder();
            strXML.Append("<chart slackFillColor='EEEEEE' dateInToolTip='0' scrollColor='99CCCC' scrollPadding='3' scrollHeight='20' scrollBtnWidth='28' scrollBtnPadding='3' dateFormat='dd/mm/yyyy' caption='SSD Team Schedule' subCaption='From " + FirstDayOfMonth + " - " + LastDayOfMonth + "' ganttPaneDuration='57' ganttPaneDurationUnit='d' palette='2'>");

            // Add Categories
            strXML.Append("<categories>");

            for (int i = 1; i <= System.DateTime.DaysInMonth(CurrentYear, SelectedMonthNo); i++)
            {
                strXML.Append("<category start='" + i.ToString() + "/" + SelectedMonthNo.ToString() + "/" + CurrentYear.ToString() + "' end='" + i + "/" + SelectedMonthNo.ToString() + "/" + CurrentYear.ToString() + "' label='" + i.ToString() + "' />");
            }
            strXML.Append("<category start='01/" + (SelectedMonthNo + 1).ToString() + "/" + CurrentYear.ToString() + "' end='01/" + (SelectedMonthNo + 1).ToString() + "/" + CurrentYear.ToString() + "' label='Sat' />");

            strXML.Append("</categories>");
            // End Categories


            // Add Processes
            strXML.Append("<processes fontSize='12' isBold='1' align='left' headerText='Team Members' headerFontSize='14' headerVAlign='bottom' headerAlign='left'>");

            //DataTable dtDistinctEmployees = dtTemplateCols.DefaultView.ToTable(true, new string[] { "Name", "RequestFor" });
            //foreach (DataRow DR in dtDistinctEmployees.Rows)
            //{
            //    strXML.Append("<process label='" + DR["Name"].ToString() + "' id='" + DR["RequestFor"].ToString() + "'/>");
            //}

            //Kuwait Team
            strXML.Append("<process label='Asif' id='aahmedmirza'/>");
            strXML.Append("<process label='Abdullah' id='anoorahmed'/>");
            strXML.Append("<process label='Abdel Razag' id='ababbasali'/>");
            strXML.Append("<process label='Maha' id='mal-kamsheh'/>");
            strXML.Append("<process label='Qasim' id='muhaali'/>");
            strXML.Append("<process label='Aqsa' id='ajamal'/>");
            strXML.Append("<process label='Shams' id='syassin'/>");
            strXML.Append("<process label='Juny' id='javarachen'/>");
            strXML.Append("<process label='Zeeshan' id='zrehmat'/>");

            //India Team
            strXML.Append("<process label='Sharath' id='spadinela'/>");
            strXML.Append("<process label='Sreekanth' id='sgunti'/>");
            strXML.Append("<process label='Vikram' id='vkamalapur'/>");
            strXML.Append("<process label='Ajay' id='aneela'/>");
            strXML.Append("<process label='Sreedhar' id='tsreedhar'/>");
            strXML.Append("<process label='Nagamani' id='nummareddy'/>");
            strXML.Append("<process label='Phani' id='piruku'/>");
            strXML.Append("<process label='Gopi' id='gchitluri'/>");
            strXML.Append("<process label='Avani' id='aavani'/>");


            strXML.Append("</processes>");
            // End Processes

            // Add Tasks
            strXML.Append("<tasks>");

            foreach (DataRow DR in dtProjectsCols.Rows)
            {
                strXML.Append("<task height='10' processId='" + DR["LeadDeveloper"].ToString() + "' id='" + DR["FormId"].ToString() + "' start='" + DR["PlannedDevStartDate"].ToString() + "' end='" + DR["PlannedDevEndDate"].ToString() + "' label='" + HttpUtility.UrlEncode(DR["ProjectName"].ToString()) + ", " + HttpUtility.UrlEncode(DR["ChangeSummary"].ToString()) + "' />");
            }

            //foreach (DataRow DR in dtTemplateCols.Rows)
            //{
            //    //strXML.Append("<task color='453269' height='40" + HttpUtility.UrlEncode("%") + "' topPadding='20" + HttpUtility.UrlEncode("%") + "' processId='" + DR["RequestFor"].ToString() + "' id='" + DR["FormId"].ToString() + "' start='" + DR["TaskStartDate"].ToString() + "' end='" + DR["TaskDueDate"].ToString() + "' label='" + HttpUtility.UrlEncode(DR["ProjectName"].ToString()) + ", " + HttpUtility.UrlEncode(DR["Title"].ToString()) + "' percentComplete='" + DR["PercentageCompleted"].ToString() + "'/>");
            //    //if (DR["PlannedUnplanned"].ToString() == "P")
            //    //{
            //        strXML.Append("<task height='10' processId='" + DR["RequestFor"].ToString() + "' id='" + DR["FormId"].ToString() + "' start='" + DR["TaskStartDate"].ToString() + "' end='" + DR["TaskDueDate"].ToString() + "' label='" + HttpUtility.UrlEncode(DR["ProjectName"].ToString()) + ", " + HttpUtility.UrlEncode(DR["Title"].ToString()) + "' />");
            ////    }
            ////    else
            ////    {
            ////        strXML.Append("<task color='FF654F' height='15' topPadding='45" + HttpUtility.UrlEncode("%") + "' processId='" + DR["RequestFor"].ToString() + "' id='" + DR["FormId"].ToString() + "' start='" + DR["TaskStartDate"].ToString() + "' end='" + DR["TaskDueDate"].ToString() + "' label='" + HttpUtility.UrlEncode(DR["ProjectName"].ToString()) + ", " + HttpUtility.UrlEncode(DR["Title"].ToString()) + "' />");
            ////    }
            //}

            //foreach (DataRow DR in dtAttendanceCols.Rows)
            //{
            //    //strXML.Append("<task height='40" + HttpUtility.UrlEncode("%") + "' topPadding='20" + HttpUtility.UrlEncode("%") + "' processId='" + DR["RequestFor"].ToString() + "' id='" + DR["FormId"].ToString() + "' start='" + DR["TaskStartDate"].ToString() + "' end='" + DR["TaskDueDate"].ToString() + "' label='" + DR["ProjectName"].ToString() + ", " + DR["Title"].ToString() + "' percentComplete='" + DR["PercentageCompleted"].ToString() + "'/>");

            //    string strColor = "";
            //    string strDuration = DR["Duration"].ToString().Contains(":") ? DR["Duration"].ToString().Split(new char[] { ':' })[0] : DR["Duration"].ToString();

            //    if (DR["status"].ToString() == "Annual Leave")
            //        strColor = "FF654F";

            //    if (DR["status"].ToString() == "Present")
            //    {
            //        if (Convert.ToInt32(strDuration) < 8)
            //            strColor = "F6BD0F";

            //        if (Convert.ToInt32(strDuration) >= 8)
            //            strColor = "8BBA00";
            //    }

            //    if (DR["status"].ToString() == "Annual Leave" || DR["status"].ToString() == "Present")
            //        strXML.Append("<task height='10' topPadding='75" + HttpUtility.UrlEncode("%") + "' processId='" + DR["UserId"].ToString() + "' id='" + DR["UserId"].ToString() + ", " + DR["CalendarDate"].ToString() + "' start='" + DR["CalendarDate"].ToString() + "' end='" + DR["EndDate"].ToString() + "' label='" + DR["status"].ToString() + ", Time In:" + DR["TimeIn"].ToString() + ", Time Out:" + DR["TimeOut"].ToString() + ", Duration: " + DR["Duration"].ToString() + "' color='" + strColor + "'/>");

            //    //strXML.Append("<task height='15" + HttpUtility.UrlEncode("%") + "' topPadding='75" + HttpUtility.UrlEncode("%") + "' processId='" + DR["UserId"].ToString() + "' id='" + DR["UserId"].ToString() + ", " + DR["CalendarDate"].ToString() + "' start='" + DR["CalendarDate"].ToString() + "' end='" + DR["EndDate"].ToString() + "' label='" + DR["status"].ToString() + ", Time In:" + DR["TimeIn"].ToString() + ", Time Out:" + DR["TimeOut"].ToString() + ", Duration: " + DR["Duration"].ToString() + "' color='" + strColor + "'/>");
            //}

            strXML.Append("</tasks>");
            // End Tasks

            //strXML.Append("<milestones>");
            //foreach (DataRow DR in dtAttendanceCols.Rows)
            //{
            //    string strDuration = DR["Duration"].ToString().Contains(":") ? DR["Duration"].ToString().Split(new char[] { ':' })[0] : DR["Duration"].ToString();

            //    if (Convert.ToInt32(strDuration) >= 10)
            //        strXML.Append("<milestone date='" + DR["EndDate"].ToString() + "' taskId='" + DR["UserId"].ToString() + ", " + DR["CalendarDate"].ToString() + "' radius='4' color='333333' shape='Star' numSides='5' borderThickness='1' />");
            //}
            //strXML.Append("</milestones>");

            // Add Trendlines
            strXML.Append("<trendlines>");

            List<string> Holidays = GetHolidays(SelectedMonthNo, CurrentYear);
            foreach (string Holiday in Holidays)
            {
                strXML.Append("<line  " + Holiday + " displayValue='' isTrendZone='1' alpha='20' color='FF5904'/>");

            }
            strXML.Append("</trendlines>");
            // End Trendlines

            //strXML.Append("<legend>");
            //strXML.Append("<item label='Annual Leave' color='FF654F' />");
            //strXML.Append("<item label='Less than 8 Hours' color='F6BD0F' />");
            //strXML.Append("<item label='More than 8 Hours' color='8BBA00' />");
            //strXML.Append("<item label='Star: More than 10 Hours' color='333333' />");
            //strXML.Append("<item label='Task Completed' color='453269' />");
            //strXML.Append("<item label='Task Planned or Remaining' color='EEEEEE' />");

            //strXML.Append("</legend>");

            strXML.Append("</chart>");
            return FusionCharts.RenderChart("FusionWidgets/Gantt.swf", "", strXML.ToString(), "Chart_B_3", "950", "600", false, true);

        }

        public string LoadChart_B_4()
        {
            //return "";

            SqlParameter[] sqlParams = null;
            //sqlParams[0] = CUtilityWeb.AddParameter("ProjectType", SqlDbType.VarChar, 100, "Business Process Automation", ParameterDirection.Input);

            DataTable dtResult;
            string strCaption, strChartMetricsUsed, strChartDescription, strXMLDATA, strNumberSuffix, strSubCaption;
            int SYaxisSeriesNo = 0;
            using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                dtResult = ExecuteDataTable("RPT_ITSSDProjectsByTeamMember_sp", Conn, sqlParams);
            }

            strCaption = "Completed Requests";

            strXMLDATA = GenerateXMLForMultiSeries(dtResult, SYaxisSeriesNo, strCaption, "", null, "", 0, 0, null, null, new string[] { "New Request (BPA)", "Change Request (BPA)", "New Request (SSD)", "Change Request (SSD)", "Implementation", "Report" });

            return FusionCharts.RenderChart("FusionCharts/MSColumn3D.swf", "", strXMLDATA.ToString(), "Chart_B_4", "900", "350", false, true);

        }



        //public string LoadChart_B_3()
        //{
        //    return "";
        //    int SelectedMonthNo, CurrentYear;

        //    CurrentYear = DateTime.Now.Year;
        //    SelectedMonthNo = ddlMonth.SelectedIndex + 1;

        //    string FirstDayOfMonth, LastDayOfMonth;

        //    FirstDayOfMonth = CurrentYear.ToString() + "/" + SelectedMonthNo.ToString() + "/01";
        //    LastDayOfMonth = CurrentYear.ToString() + "/" + SelectedMonthNo.ToString() + "/" + DateTime.DaysInMonth(CurrentYear, SelectedMonthNo);

        //    string SSQLTemplateCols = "SELECT FormId, ProcessName, Title, CONVERT(varchar(10), RequestedDate, 103) AS RequestedDate, CONVERT(varchar(10), BRAnalysisStartDate, 103) AS BRAnalysisStartDate, CONVERT(varchar(10), BRSubmitted, 103) AS BRSubmitted, CONVERT(varchar(10), BRSignedOff, 103) AS BRSignedOff, CONVERT(varchar(10), PlannedDevStartDate, 103) AS PlannedDevStartDate, CONVERT(varchar(10), PlannedDevEndDate, 103) AS PlannedDevEndDate, LeadDeveloper,ISNULL(PercentageCompleted, 0) AS PercentageCompleted FROM ITSSDProjectsDetails WHERE PlannedDevStartDate >= '" + FirstDayOfMonth + "'";
        //    DataTable dtTemplateCols;

        //    using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
        //    {
        //        dtTemplateCols = CUtilityWeb.getDataTable(SSQLTemplateCols, sqlConnection);
        //    }

        //    StringBuilder strXML = new StringBuilder();

        //    strXML.Append("<chart palette='2' caption='Project Timelines' dateFormat='dd/mm/yyyy' outputDateFormat='ddds mns' >");
        //    strXML.Append("<categories>");
        //    strXML.Append("<category start='1/7/2009' end='30/9/2009' label='Months' />");
        //    strXML.Append("</categories>");
        //    strXML.Append("<categories>");

        //    strXML.Append("<category start='1/7/2009' end='31/7/2009' label='Jul' />");
        //    strXML.Append("<category start='1/8/2009' end='31/8/2009' label='Aug' />");
        //    strXML.Append("<category start='1/9/2009' end='30/9/2009' label='Sep' />");

        //    strXML.Append("</categories>");
        //    strXML.Append("<processes headerText='Projects' headerFontSize='14' fontSize='12' headerVAlign='bottom' align='left' headerAlign='left'>");

        //    foreach (DataRow DR in dtTemplateCols.Rows)
        //    {
        //        strXML.Append("<process label='" + HttpUtility.UrlEncode(DR["ProcessName"].ToString()) + "' id='" + DR["FormId"].ToString() + "'/>");
        //    }

        //    //strXML.Append("<process label='Terrace' id='TRC' />");
        //    //strXML.Append("<process label='Inspection' id='INS' />");
        //    //strXML.Append("<process label='Wood Work' id='WDW' />");
        //    //strXML.Append("<process label='Interiors' id='INT' />");
        //    strXML.Append("</processes>");

        //    strXML.Append("<datatable headerVAlign='bottom'>");
        //    strXML.Append("<datacolumn headerText='Developer' headerFontSize='14' fontSize='12' headerVAlign='bottom' align='left' headerAlign='left'>");

        //    foreach (DataRow DR in dtTemplateCols.Rows)
        //    {
        //        strXML.Append("<text label='" + DR["LeadDeveloper"].ToString() + "' />");
        //    }
        //    //<text label="Graphics" /> 
        //    //<text label="ASP.NET" /> 
        //    //<text label="PHP" /> 
        //    //<text label="Flash" /> 
        //    //<text label="Documentation" /> 
        //    strXML.Append("</datacolumn>");
        //    strXML.Append("</datatable>");

        //    strXML.Append("<tasks showEndDate='0' showLabels='0'>");

        //    System.Globalization.DateTimeFormatInfo dateInfo = new System.Globalization.DateTimeFormatInfo();
        //    dateInfo.ShortDatePattern = "dd/MM/yyyy";

        //    DateTime dtDate = new DateTime();
        //    //dtDate = Convert.ToDateTime(strInvIssueDate, dateInfo);


        //    foreach (DataRow DR in dtTemplateCols.Rows)
        //    {
        //        if (DR["RequestedDate"].ToString() != "" && DR["RequestedDate"].ToString() != null)
        //        {
        //            dtDate = Convert.ToDateTime(DR["RequestedDate"].ToString(), dateInfo);

        //            if (dtDate >= Convert.ToDateTime("07/01/2009"))
        //                strXML.Append("<task processId='" + DR["FormId"].ToString() + "' id='" + DR["FormId"].ToString() + "' start='" + DR["RequestedDate"].ToString() + "' end='" + DR["RequestedDate"].ToString() + "' label='Requested by Customer' percentComplete='100'/>");
        //        }


        //        if (DR["BRAnalysisStartDate"].ToString() != "" && DR["BRAnalysisStartDate"].ToString() != null)
        //        {
        //            if (DR["BRSubmitted"].ToString() != "" && DR["BRSubmitted"].ToString() != null)
        //            {
        //                dtDate = Convert.ToDateTime(DR["BRAnalysisStartDate"].ToString(), dateInfo);

        //                if (dtDate >= Convert.ToDateTime("07/01/2009"))
        //                    strXML.Append("<task processId='" + DR["FormId"].ToString() + "' id='" + DR["FormId"].ToString() + "' start='" + DR["BRAnalysisStartDate"].ToString() + "' end='" + DR["BRSubmitted"].ToString() + "' label='Requirement Analysis Phase' percentComplete='100'/>");
        //            }
        //        }

        //        if (DR["BRSignedOff"].ToString() != "" && DR["BRSignedOff"].ToString() != null)
        //        {
        //            dtDate = Convert.ToDateTime(DR["BRSignedOff"].ToString(), dateInfo);

        //            if (dtDate >= Convert.ToDateTime("07/01/2009"))
        //                strXML.Append("<task processId='" + DR["FormId"].ToString() + "' id='" + DR["FormId"].ToString() + "' start='" + DR["BRSignedOff"].ToString() + "' end='" + DR["BRSignedOff"].ToString() + "' label='Requirement Signed Off by Customer' percentComplete='100'/>");
        //        }

        //        if (DR["PlannedDevStartDate"].ToString() != "" && DR["PlannedDevStartDate"].ToString() != null)
        //        {
        //            if (DR["PlannedDevEndDate"].ToString() != "" && DR["PlannedDevEndDate"].ToString() != null)
        //            {
        //                dtDate = Convert.ToDateTime(DR["PlannedDevStartDate"].ToString(), dateInfo);

        //                if (dtDate >= Convert.ToDateTime("07/01/2009"))
        //                    strXML.Append("<task processId='" + DR["FormId"].ToString() + "' id='" + DR["FormId"].ToString() + "' start='" + DR["PlannedDevStartDate"].ToString() + "' end='" + DR["PlannedDevEndDate"].ToString() + "' label='Development Phase' percentComplete='" + DR["PercentageCompleted"].ToString() + "'/>");
        //            }
        //        }

        //    }

        //    //strXML.Append("<task processId='TRC' start='5/8/2008' end='2/9/2008' id='5' color='4567aa' />");
        //    strXML.Append("</tasks>");
        //    //strXML.Append("<legend>");
        //    //   strXML.Append("<item label='Planned' color='4567aa' />");
        //    //   strXML.Append("<item label='Actual' color='999999' />");
        //    //strXML.Append("</legend>");
        //    strXML.Append("<styles>");
        //    strXML.Append("<definition>");
        //    strXML.Append("<style type='font' name='legendFont' size='13' />");
        //    strXML.Append("</definition>");
        //    strXML.Append("<application>");
        //    strXML.Append("<apply toObject='Legend' styles='legendFont' />");
        //    strXML.Append("</application>");
        //    strXML.Append("</styles>");
        //    //strXML.Append("<milestones>");
        //    //  strXML.Append("<milestone date='15/8/2009' taskId='2' radius='10' color='333333' shape='Star' numSides='5' borderThickness='1' /> ");
        //    //  strXML.Append("</milestones>");
        //    strXML.Append("</chart>");

        //    return FusionCharts.RenderChart("FusionWidgets/Gantt.swf", "", strXML.ToString(), "Chart_B_3", "1124", "1200", false, false);
        //    return "";
        //}


        List<string> GetHolidays(int Month, int Year)
        {
            List<string> ResultList = new List<string>();

            DateTime FirstDayOfMonth = DateTime.Parse(Year.ToString() + "/" + Month.ToString() + "/01");
            DateTime LastDayOfMonth = DateTime.Parse(Year.ToString() + "/" + Month.ToString() + "/" + DateTime.DaysInMonth(Year, Month));
            DateTime NextFridayOfMonth;
            int NextDayOfMonth;

            int FridayDifference = (int)DayOfWeek.Friday - (int)FirstDayOfMonth.DayOfWeek;
            if (FridayDifference == 0) //first day is friday
            {
                NextDayOfMonth = 1;
                NextFridayOfMonth = FirstDayOfMonth;
                ResultList.Add(string.Format(@" start='01/{0}/{1}' end='03/{0}/{1}' ", Month.ToString(), Year.ToString()));
            }
            else if (FridayDifference == -1) //first day is saturday
            {
                NextDayOfMonth = 0;
                NextFridayOfMonth = FirstDayOfMonth.AddDays(-1);
                ResultList.Add(string.Format(@" start='01/{0}/{1}' end='02/{0}/{1}' ", Month.ToString(), Year.ToString()));

            }
            else
            {
                NextFridayOfMonth = FirstDayOfMonth.AddDays(FridayDifference);
                NextDayOfMonth = NextFridayOfMonth.Day;
                DateTime NextSaturedayOfMonth = NextFridayOfMonth.AddDays(1);

                ResultList.Add(string.Format(@" start='{0}/{1}/{2}' end='{3}/{4}/{5}' ",
                    NextFridayOfMonth.Day, NextFridayOfMonth.Month, NextFridayOfMonth.Year,
                    NextSaturedayOfMonth.Day, NextSaturedayOfMonth.Month, NextSaturedayOfMonth.Year));
            }

            while (DateTime.DaysInMonth(Year, Month) >= (NextDayOfMonth + 7))
            {
                DateTime tmpDate = new DateTime(Year, Month, (NextDayOfMonth + 7));
                DateTime tmpNextDate = tmpDate.AddDays(2);

                ResultList.Add(string.Format(@" start='{0}/{1}/{2}' end='{3}/{4}/{5}' ",
                    tmpDate.Day, tmpDate.Month, tmpDate.Year,
                    tmpNextDate.Day, tmpNextDate.Month, tmpNextDate.Year));


                NextDayOfMonth += 7;
                NextFridayOfMonth = NextFridayOfMonth.AddDays(7);
            }
            return ResultList;
            //int FirstFridayHoliday = FirstDayOfMonth.AddDays((int)DayOfWeek.Friday - (int)FirstDayOfMonth.DayOfWeek);

        }

        public String GenerateXMlforPieChart(DataTable DataToTransform,
                int SYAxisSeriesNo, string strCaption, string strSubCaption,
                string numberPrefix, string strSNumberSuffix,
                int showValues, int animation)
        {
            StringBuilder sbXMLData = new StringBuilder();
            StringBuilder sbXAxis = new StringBuilder();
            StringBuilder sbCategories = new StringBuilder();

            StringBuilder sbSeries = new StringBuilder();//[DataToTransform.Columns.Count - 1];

            string[] SeriesColNames = new string[DataToTransform.Columns.Count - 1];
            string XAxisColName = DataToTransform.Columns[0].ColumnName;
            int index;
            for (index = 1; index < DataToTransform.Columns.Count; index++)
            {
                SeriesColNames[index - 1] = DataToTransform.Columns[index].ColumnName;
            }

            //Initialize <chart> element //bgcolor='#F7F0D6'  labeldisplay='ROTATE'
            sbXMLData.AppendFormat("<chart caption='{2}' subcaption='{3}'  formatNumberScale='0' numberSuffix='' showValues='1' showPercentInToolTip='1' >",
                SeriesColNames[0], SeriesColNames[SeriesColNames.Length - 1],
                strCaption, strSubCaption,
            numberPrefix, strSNumberSuffix,
            showValues, animation);


            foreach (DataRow drSeriesRow in DataToTransform.Rows)
            {
                sbSeries.AppendFormat("<set label='{0}' value='{1}' />", drSeriesRow[0].ToString(), drSeriesRow[1].ToString());

            }

            sbXMLData.Append(sbSeries.ToString());
            sbXMLData.Append("<styles>");
            sbXMLData.Append("<definition><style type='font' name='CaptionFont' color='666666' size='12' />");
            sbXMLData.Append("<style type='font' name='SubCaptionFont' bold='0' />");
            sbXMLData.Append("</definition>");
            sbXMLData.Append("<application>");
            sbXMLData.Append("<apply toObject='caption' styles='CaptionFont' />");
            sbXMLData.Append("<apply toObject='SubCaption' styles='SubCaptionFont' />");
            sbXMLData.Append("</application>");
            sbXMLData.Append("</styles>");
            sbXMLData.Append("</chart>");
            return sbXMLData.ToString();

        }

        public String GenerateXMlforPieChart(DataTable DataToTransform,
            int SYAxisSeriesNo, string strCaption, string strSubCaption,
            string numberPrefix, string strSNumberSuffix,
            int showValues, int animation, string DrillDownLink)
        {
            StringBuilder sbXMLData = new StringBuilder();
            StringBuilder sbXAxis = new StringBuilder();
            StringBuilder sbCategories = new StringBuilder();

            StringBuilder sbSeries = new StringBuilder();//[DataToTransform.Columns.Count - 1];

            string[] SeriesColNames = new string[DataToTransform.Columns.Count - 1];
            string XAxisColName = DataToTransform.Columns[0].ColumnName;
            int index;
            for (index = 1; index < DataToTransform.Columns.Count; index++)
            {
                SeriesColNames[index - 1] = DataToTransform.Columns[index].ColumnName;
            }

            //Initialize <chart> element //bgcolor='#F7F0D6'  labeldisplay='ROTATE'
            sbXMLData.AppendFormat("<chart caption='{2}' subcaption='{3}'  formatNumberScale='0' numberSuffix='' showValues='1' showPercentInToolTip='1' >",
                SeriesColNames[0], SeriesColNames[SeriesColNames.Length - 1],
                strCaption, strSubCaption,
            numberPrefix, strSNumberSuffix,
            showValues, animation);


            foreach (DataRow drSeriesRow in DataToTransform.Rows)
            {
                //sbSeries.AppendFormat("<set label='{0}' value='{1}' />", drSeriesRow[0].ToString(), drSeriesRow[1].ToString());

                string DrillDownlLinkResolved = "";

                DrillDownlLinkResolved = " link='" +
                HttpUtility.UrlEncode(DrillDownLink.Replace("%PieValue", drSeriesRow[0].ToString())) + "' ";

                sbSeries.AppendFormat("<set label='{0}' value='{1}' {2} />", drSeriesRow[0].ToString(), drSeriesRow[1].ToString(), DrillDownlLinkResolved);
            }

            sbXMLData.Append(sbSeries.ToString());
            sbXMLData.Append("<styles>");
            sbXMLData.Append("<definition><style type='font' name='CaptionFont' color='666666' size='12' />");
            sbXMLData.Append("<style type='font' name='SubCaptionFont' bold='0' />");
            sbXMLData.Append("</definition>");
            sbXMLData.Append("<application>");
            sbXMLData.Append("<apply toObject='caption' styles='CaptionFont' />");
            sbXMLData.Append("<apply toObject='SubCaption' styles='SubCaptionFont' />");
            sbXMLData.Append("</application>");
            sbXMLData.Append("</styles>");
            sbXMLData.Append("</chart>");
            return sbXMLData.ToString();

        }

        public static String GenerateXMLForMultiSeries(DataTable DataToTransform,
                int SYAxisSeriesNo, string strCaption, string strSubCaption,
                string numberPrefix, string strSNumberSuffix,
                int showValues, int animation, string DrillDownLink, string ColorPalette, string[] OrderedSeriesNames
                )
        {
            StringBuilder sbXMLData = new StringBuilder();
            StringBuilder sbXAxis = new StringBuilder();
            StringBuilder sbCategories = new StringBuilder();



            string[] SeriesColNames = new string[DataToTransform.Columns.Count];
            string XAxisColName = DataToTransform.Columns[0].ColumnName;

            int index;
            for (index = 0; index < DataToTransform.Columns.Count; index++)
            {
                SeriesColNames[index] = DataToTransform.Columns[index].ColumnName;
            }

            //Initialize <chart> element //bgcolor='#F7F0D6'  labeldisplay='ROTATE'
            sbXMLData.AppendFormat("<chart palette='4' bgcolor='#FFFFFF' border='0'  caption='{2}' subcaption='{3}'  PYAxisName='{0}' SYAxisName='{1}' numberPrefix='{4}' SnumberSuffix='{5}' formatNumberScale='0' showValues='{6}' decimals='0' useRoundEdges='1' exportEnabled='1' exportShowMenuItem='1' exportHandler='/ExportHandler/ASP_Net/FCExporter.aspx' exportAtClient='0' exportAction='download'>",
                SeriesColNames[0], SeriesColNames[SeriesColNames.Length - 1],
                strCaption, strSubCaption,
            numberPrefix, strSNumberSuffix,
            showValues, animation);


            //Initialize <categories> element - necessary to generate a multi-series chart
            sbCategories.Append("<categories>");

            DataTable dtSeriesNames;

            dtSeriesNames = DataToTransform.DefaultView.ToTable(true, SeriesColNames[2].ToString());
            DataTable dtSeriesName = dtSeriesNames;
            if (OrderedSeriesNames != null)
            {
                DataTable dtOrderedSeries = new DataTable();
                dtOrderedSeries.Columns.Add(dtSeriesName.Columns[0].ColumnName, typeof(string));
                string OrderedCommaSepratedValues = "";
                for (int iLoop = 0; iLoop < OrderedSeriesNames.Length; iLoop++)
                {
                    DataRow[] arrTmpRows = dtSeriesName.Select(dtSeriesName.Columns[0].ColumnName + " = '" + OrderedSeriesNames[iLoop] + "'");
                    if (arrTmpRows.Length > 0)
                    {
                        DataRow NewRow = dtOrderedSeries.NewRow();
                        NewRow[0] = OrderedSeriesNames[iLoop];
                        dtOrderedSeries.Rows.Add(NewRow);
                        OrderedCommaSepratedValues += "'" + OrderedSeriesNames[iLoop] + "',";
                    }
                }
                OrderedCommaSepratedValues = OrderedCommaSepratedValues.TrimEnd(new char[] { ',' });
                DataRow[] SeriesNotOrdered = dtSeriesName.Select(dtSeriesName.Columns[0].ColumnName + " not in (" + OrderedCommaSepratedValues + ")");
                foreach (DataRow dr in SeriesNotOrdered)
                {
                    DataRow NewRow = dtOrderedSeries.NewRow();
                    NewRow[0] = dr[0];
                    dtOrderedSeries.Rows.Add(NewRow);
                }
                dtSeriesNames = dtOrderedSeries;
            }


            StringBuilder[] sbSeries = new StringBuilder[dtSeriesNames.Rows.Count];

            index = 0;
            foreach (DataRow drSeriesname in dtSeriesNames.Rows)
            {
                //color='DA3608'
                //  sbSeries[index] = new StringBuilder(String.Format("<dataset seriesName='{0}' color='{1}'>", drSeriesname[0].ToString(), strArrColor[index]));
                sbSeries[index] = new StringBuilder(String.Format("<dataset seriesName='{0}' >", drSeriesname[0].ToString()));
                index++;
            }


            DataTable dtSeriesCategory;
            dtSeriesCategory = DataToTransform.DefaultView.ToTable(true, SeriesColNames[0].ToString());
            //dtSeriesCategory = new DataTable();
            //dtSeriesCategory.Rows.Add(
            //dtSeriesCategory

            index = 0;
            int seriesIndex = 0;
            foreach (DataRow drSeriesCategory in dtSeriesCategory.Rows)
            {
                //arrData[index, 0] = drSeriesCategory[0].ToString();
                sbCategories.AppendFormat("<category label='{0}' />", drSeriesCategory[0].ToString());
                index++; seriesIndex = 0;
                foreach (DataRow drSeriesname in dtSeriesNames.Rows)
                {
                    DataRow[] dr = DataToTransform.Select(SeriesColNames[0].ToString() + " ='" + drSeriesCategory[0].ToString() + "' and " + SeriesColNames[2].ToString() + " = '" + drSeriesname[0].ToString() + "'");

                    if (dr.Length != 0)
                    {
                        sbSeries[seriesIndex].AppendFormat("<set value='{0}' />", dr[0][1].ToString());
                    }
                    else
                    {
                        sbSeries[seriesIndex].AppendFormat("<set value='{0}' />", "");
                    }
                    seriesIndex++;
                }
            }



            //Close <categories> element
            sbCategories.Append("</categories>");

            //Assemble the entire XML now
            sbXMLData.Append(sbCategories.ToString());
            index = 0;
            for (index = 0; index < sbSeries.Length; index++)
            {
                //Close <dataset> elements
                sbSeries[index].Append("</dataset>");
                sbXMLData.Append(sbSeries[index].ToString());
            }
            sbXMLData.Append("<styles>");
            sbXMLData.Append("<definition><style type='font' name='CaptionFont' color='666666' size='12' />");
            sbXMLData.Append("<style type='font' name='SubCaptionFont' bold='0' />");
            sbXMLData.Append("<style name='myLegendFont' type='font' size='10' bold='1' />");
            sbXMLData.Append("</definition>");
            sbXMLData.Append("<application>");
            sbXMLData.Append("<apply toObject='caption' styles='CaptionFont' />");
            sbXMLData.Append("<apply toObject='SubCaption' styles='SubCaptionFont' />");
            sbXMLData.Append("<apply toObject='Legend' styles='myLegendFont' />");
            sbXMLData.Append("</application>");
            sbXMLData.Append("</styles>");
            sbXMLData.Append("</chart>");

            return sbXMLData.ToString();
        }


        public String GenerateXMLforStack(DataTable DataToTransform,
                int SYAxisSeriesNo, string strCaption, string strSubCaption,
                string numberPrefix, string strSNumberSuffix,
                int showValues, int animation
                )
        {
            StringBuilder sbXMLData = new StringBuilder();
            StringBuilder sbXAxis = new StringBuilder();
            StringBuilder sbCategories = new StringBuilder();

            //StringBuilder[] sbSeries = new StringBuilder[DataToTransform.Columns.Count - 1];

            string[] SeriesColNames = new string[DataToTransform.Columns.Count];
            string XAxisColName = DataToTransform.Columns[0].ColumnName;
            int index;
            for (index = 0; index < DataToTransform.Columns.Count; index++)
            {
                SeriesColNames[index] = DataToTransform.Columns[index].ColumnName;
            }

            DataTable dtSeriesName;
            dtSeriesName = DataToTransform.DefaultView.ToTable(true, SeriesColNames[2].ToString());

            StringBuilder[] sbSeries = new StringBuilder[dtSeriesName.Rows.Count];

            //Initialize <chart> element //bgcolor='#F7F0D6'  labeldisplay='ROTATE'
            sbXMLData.AppendFormat("<chart palette='4' bgcolor='#FFFFFF' border='0'  caption='{2}' subcaption='{3}' labeldisplay='ROTATE' slantLabels='1' setAdaptiveYMin = '1'  yAxisValuesStep='1'   yAxisName='{0}' SyAxisName='{1}' numberPrefix='{4}' SnumberSuffix='{5}' formatNumberScale='0' showValues='{6}' decimals='0' useRoundEdges='1' exportEnabled='1' exportShowMenuItem='1' exportHandler='/ExportHandler/ASP_Net/FCExporter.aspx' exportAtClient='0' exportAction='download'>",
                SeriesColNames[1], SeriesColNames[SeriesColNames.Length - 1],
                strCaption, strSubCaption,
            numberPrefix, strSNumberSuffix,
            showValues, animation);


            //Initialize <categories> element - necessary to generate a multi-series chart
            sbCategories.Append("<categories>");

            //Initiate <dataset> elements
            index = 0;
            foreach (DataRow drSeriesname in dtSeriesName.Rows)
            {
                //color='DA3608'
                sbSeries[index] = new StringBuilder(String.Format("<dataset seriesName='{0}' color='{1}'>", drSeriesname[0].ToString(), strArrColor[index]));
                index++;
            }



            Dictionary<string, string> AddedXAxisValue = new Dictionary<string, string>();
            foreach (DataRow drSeriesRow in DataToTransform.Rows)
            {
                string XAxisValue = drSeriesRow[XAxisColName].ToString();

                if (!AddedXAxisValue.ContainsKey(XAxisValue))
                {
                    AddedXAxisValue.Add(XAxisValue, XAxisValue);
                    sbCategories.AppendFormat("<category label='{0}' />", XAxisValue);

                    index = 0;
                    foreach (DataRow drSeriesname in dtSeriesName.Rows)
                    {
                        //DataRow[] dr = DataToTransform.Select(@"ProjectStatus ='" + drSeriesRow[XAxisColName].ToString() + "' and RequestType = '" + drSeriesname[0].ToString() + "'");

                        string SeriesName = "", YAxisValue = "";
                        SeriesName = drSeriesname[0].ToString();

                        DataRow[] dr = DataToTransform.Select(SeriesColNames[0].ToString() + " ='" + XAxisValue + "' and " + SeriesColNames[2].ToString() + " = '" + SeriesName + "'");

                        if (dr.Length != 0)
                        {
                            sbSeries[index].AppendFormat("<set value='{0}' />", dr[0][1].ToString());
                        }
                        else
                        {
                            sbSeries[index].AppendFormat("<set value='{0}' />", "");
                        }
                        index++;
                    }
                }
            }

            //Close <categories> element
            sbCategories.Append("</categories>");

            //Assemble the entire XML now
            sbXMLData.Append(sbCategories.ToString());
            index = 0;
            for (index = 0; index < sbSeries.Length; index++)
            {
                //Close <dataset> elements
                sbSeries[index].Append("</dataset>");
                sbXMLData.Append(sbSeries[index].ToString());
            }
            sbXMLData.Append("<styles>");
            sbXMLData.Append("<definition><style type='font' name='CaptionFont' color='666666' size='12' />");
            sbXMLData.Append("<style type='font' name='SubCaptionFont' bold='0' />");
            sbXMLData.Append("</definition>");
            sbXMLData.Append("<application>");
            sbXMLData.Append("<apply toObject='caption' styles='CaptionFont' />");
            sbXMLData.Append("<apply toObject='SubCaption' styles='SubCaptionFont' />");
            sbXMLData.Append("</application>");
            sbXMLData.Append("</styles>");
            sbXMLData.Append("</chart>");
            return sbXMLData.ToString();
        }

        public String GenerateXMLforStack(DataTable DataToTransform,
            int SYAxisSeriesNo, string strCaption, string strSubCaption,
            string numberPrefix, string strSNumberSuffix,
            int showValues, int animation, string DrillDownLink
            )
        {
            StringBuilder sbXMLData = new StringBuilder();
            StringBuilder sbXAxis = new StringBuilder();
            StringBuilder sbCategories = new StringBuilder();

            //StringBuilder[] sbSeries = new StringBuilder[DataToTransform.Columns.Count - 1];

            string[] SeriesColNames = new string[DataToTransform.Columns.Count];
            string XAxisColName = DataToTransform.Columns[0].ColumnName;
            int index;
            for (index = 0; index < DataToTransform.Columns.Count; index++)
            {
                SeriesColNames[index] = DataToTransform.Columns[index].ColumnName;
            }

            DataTable dtSeriesName;
            dtSeriesName = DataToTransform.DefaultView.ToTable(true, SeriesColNames[2].ToString());

            StringBuilder[] sbSeries = new StringBuilder[dtSeriesName.Rows.Count];

            //Initialize <chart> element //bgcolor='#F7F0D6'  labeldisplay='ROTATE'
            sbXMLData.AppendFormat("<chart palette='4' bgcolor='#FFFFFF' border='0'  caption='{2}' subcaption='{3}' labeldisplay='ROTATE' slantLabels='1' setAdaptiveYMin = '1'  yAxisValuesStep='1'   yAxisName='{0}' SyAxisName='{1}' numberPrefix='{4}' SnumberSuffix='{5}' formatNumberScale='0' showValues='{6}' decimals='0' useRoundEdges='1' exportEnabled='1' exportShowMenuItem='1' exportHandler='/ExportHandler/ASP_Net/FCExporter.aspx' exportAtClient='0' exportAction='download'>",
                SeriesColNames[1], SeriesColNames[SeriesColNames.Length - 1],
                strCaption, strSubCaption,
            numberPrefix, strSNumberSuffix,
            showValues, animation);


            //Initialize <categories> element - necessary to generate a multi-series chart
            sbCategories.Append("<categories>");

            //Initiate <dataset> elements
            index = 0;
            foreach (DataRow drSeriesname in dtSeriesName.Rows)
            {
                //color='DA3608'
                sbSeries[index] = new StringBuilder(String.Format("<dataset seriesName='{0}' color='{1}'>", drSeriesname[0].ToString(), strArrColor[index]));
                index++;
            }


            Dictionary<string, string> AddedXAxisValue = new Dictionary<string, string>();
            foreach (DataRow drSeriesRow in DataToTransform.Rows)
            {
                string XAxisValue = drSeriesRow[XAxisColName].ToString();

                if (!AddedXAxisValue.ContainsKey(XAxisValue))
                {
                    AddedXAxisValue.Add(XAxisValue, XAxisValue);
                    sbCategories.AppendFormat("<category label='{0}' />", XAxisValue);
                    //Add <set value='...' /> to both the datasets

                    index = 0;
                    foreach (DataRow drSeriesname in dtSeriesName.Rows)
                    {
                        //DataRow[] dr = DataToTransform.Select(@"ProjectStatus ='" + drSeriesRow[XAxisColName].ToString() + "' and RequestType = '" + drSeriesname[0].ToString() + "'");
                        string SeriesName = "", YAxisValue = "";
                        SeriesName = drSeriesname[0].ToString();

                        DataRow[] dr = DataToTransform.Select(SeriesColNames[0].ToString() + " ='" + XAxisValue + "' and " + SeriesColNames[2].ToString() + " = '" + SeriesName + "'");
                        string DrillDownlLinkResolved = "";
                        if (dr.Length != 0)
                        {
                            YAxisValue = dr[0][1].ToString();
                            if (DrillDownLink != "" && DrillDownLink.Contains("%"))
                            {
                                DrillDownlLinkResolved = " link='" +
                                     HttpUtility.UrlEncode(DrillDownLink.Replace("%SeriesName", SeriesName).Replace("%XAxisValue", XAxisValue).Replace("%YAxisValue", YAxisValue)) + "' ";
                            }
                            sbSeries[index].AppendFormat("<set value='{0}' {1} />", YAxisValue, DrillDownlLinkResolved);
                        }
                        else
                        {
                            YAxisValue = "";
                            if (DrillDownLink != "" && DrillDownLink.Contains("%"))
                            {
                                DrillDownlLinkResolved = " link='" +
                                    HttpUtility.UrlEncode(DrillDownLink.Replace("%SeriesName", SeriesName).Replace("%XAxisValue", XAxisValue).Replace("%YAxisValue", YAxisValue)) + "' ";
                            }
                            sbSeries[index].AppendFormat("<set value='{0}' {1} />", YAxisValue, DrillDownlLinkResolved);
                        }
                        index++;
                    }
                }
            }

            //Close <categories> element
            sbCategories.Append("</categories>");

            //Assemble the entire XML now
            sbXMLData.Append(sbCategories.ToString());
            index = 0;
            for (index = 0; index < sbSeries.Length; index++)
            {
                //Close <dataset> elements
                sbSeries[index].Append("</dataset>");
                sbXMLData.Append(sbSeries[index].ToString());
            }
            sbXMLData.Append("<styles>");
            sbXMLData.Append("<definition><style type='font' name='CaptionFont' color='666666' size='12' />");
            sbXMLData.Append("<style type='font' name='SubCaptionFont' bold='0' />");
            sbXMLData.Append("</definition>");
            sbXMLData.Append("<application>");
            sbXMLData.Append("<apply toObject='caption' styles='CaptionFont' />");
            sbXMLData.Append("<apply toObject='SubCaption' styles='SubCaptionFont' />");
            sbXMLData.Append("</application>");
            sbXMLData.Append("</styles>");
            sbXMLData.Append("</chart>");
            return sbXMLData.ToString();
        }

        public static DataTable ExecuteDataTable(string storedProcedureName, SqlConnection cnn,
                                params SqlParameter[] arrParam)
        {
            DataTable dt = new DataTable();

            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.Connection = cnn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = storedProcedureName;

                // Handle the parameters 
                if (arrParam != null)
                {
                    foreach (SqlParameter param in arrParam)
                        cmd.Parameters.Add(param);
                }

                // Define the data adapter and fill the dataset 
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                }
            }

            return dt;
        }

    }
}
