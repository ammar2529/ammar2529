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
using System.Text;
using System.Data.SqlClient;
using InfoSoftGlobal;
using System.Collections.Generic;

namespace WebProject.ReportsEngine
{
    public partial class ChartFacade : System.Web.UI.Page
    {
        static string[] strArrColor = new string[] { "DA3608", "015887", "78AE1C", "011187", "01ee87", "015587", "01ff87" };
        Dictionary<string, string> SeriesColors = new Dictionary<string, string>();
        Dictionary<string, Dictionary<string, string>> ColorPalette = new Dictionary<string, Dictionary<string, string>>();
        protected void Page_PreInit(object sender, EventArgs e)
        {
            SeriesColors.Add("Infrastructure", "FF8D45"); //Red
            SeriesColors.Add("DGS", "AFD8F8"); //Blue
            SeriesColors.Add("Corporate", "F6BD0E"); //Orange
            SeriesColors.Add("GIL", "8ABA00"); //Green

            ColorPalette.Add("CustomPalette", SeriesColors);
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            string strCallId;

            if (Request.QueryString["CallId"] == null)
                return;
            else
                strCallId = Request.QueryString["CallId"].ToString();

            if (strCallId == "Update_BG_Category_Chart_S_1")
                Update_BG_Category_Chart_S_1();

            if (strCallId == "Update_BG_Category_Chart_S_2")
                Update_BG_Category_Chart_S_2();

            if (strCallId == "Update_BG_Category_Chart_B_1")
                Update_BG_Category_Chart_B_1();

            if (strCallId == "LoadUserAnalysis_Chart_S_2")
                LoadUserAnalysis_Chart_S_2();

            if (strCallId == "LoadUserAnalysis_Chart_S_3")
                LoadUserAnalysis_Chart_S_3();

            if (strCallId == "EmployeeDetails")
                EmployeeDetails();

            if (strCallId == "EmployeeDetailsPlannedTasksOnly")
                EmployeeDetailsPlannedTasksOnly();


            //Start Process Usage Functions BAM

            if (strCallId == "LiveProcessDrillDown_Level1")
                LiveProcessDrillDown_Level1();

            if (strCallId == "LiveProcessDrillDown_Level2")
                LiveProcessDrillDown_Level2();

            if (strCallId == "LiveFunctionDrillDown_ProcessUsage")
                LiveFunctionDrillDown_ProcessUsage();

            if (strCallId == "ProcessUsageDrillDown_YearlyTrend")
                ProcessUsageDrillDown_YearlyTrend();

            if (strCallId == "ProcessUsageDrillDown_MonthlyTrend")
                ProcessUsageDrillDown_MonthlyTrend();

            if (strCallId == "ProcessUsageDrillDown_CurrentMonth")
                ProcessUsageDrillDown_CurrentMonth();

            if (strCallId == "ProcessUsageDrillDown_CurrentDay")
                ProcessUsageDrillDown_CurrentDay();

            //End Process Usage Functions BAM

            if (strCallId == "ProjectsInProgressDrillDown")
                ProjectsInProgressDrillDown();

            if (strCallId == "LiveProjectsMonthlyDrillDown")
                LiveProjectsMonthlyDrillDown();

            if (strCallId == "ProjectsInProgressDrillDownDelay")
                ProjectsInProgressDrillDownDelay();

            if (strCallId == "ProjectsInProgressDrillDownDelayStates")
                ProjectsInProgressDrillDownDelayStates();

            if (strCallId == "ProjectsInProgressDrillDownDelayStatesPerson")
                ProjectsInProgressDrillDownDelayStatesPerson();


            if (strCallId == "ManagementProjectDuration")
                ManagementProjectDuration();

            if (strCallId == "ManagementProject_TeamMembers")
                ManagementProject_TeamMembers();

            if (strCallId == "ManagementProject_Cost")
                ManagementProject_Cost();

            if (strCallId == "ManagementProject_Expenses")
                ManagementProject_Expenses();

            if (strCallId == "ManagementProject_Issues")
                ManagementProject_Issues();

            if (strCallId == "ManagementProject_TeamMembers_Details")
                ManagementProject_TeamMembers_Details();

            if (strCallId == "ManagementProject_Issue_Details")
                ManagementProject_Issue_Details();

            if (strCallId == "ManagementProject_Weekly_Details")
                ManagementProject_Weekly_Details();


        }
        string GetSereisColor(string PaletteName, string SeriesName)
        {
            if (ColorPalette.ContainsKey(PaletteName))
            {
                Dictionary<string, string> SRColors = ColorPalette[PaletteName];
                if (SRColors.ContainsKey(SeriesName))
                {
                    return SRColors[SeriesName];
                }
                else
                {
                    return "eeefff";

                }
            }
            else
            {

                return "eeefff";
            }
        }
        int TasksCheckedNo(bool FirstValue, bool SecondValue, bool ThirdValue)
        {
            if (FirstValue && SecondValue && ThirdValue)
            {
                return 3;
            }
            else if ((FirstValue && SecondValue) || (SecondValue && ThirdValue) || (FirstValue && ThirdValue))
            {
                return 2;
            }
            else if (FirstValue || SecondValue || ThirdValue)
            {
                return 1;
            }
            else
            {
                return 0;
            }
        }
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

        private void Update_BG_Category_Chart_S_1()
        {

            string Category = "", BG = "";

            if (Request.QueryString["Category"] != null)
                Category = Request.QueryString["Category"].ToString();

            if (Request.QueryString["BG"] != null)
                BG = Request.QueryString["BG"].ToString();

            SqlParameter[] sqlParams = null;
            DataTable dtResult;
            string strCaption, strChartSWF, strChartMetricsUsed, strChartDescription, strXMLDATA, strNumberSuffix;
            int SYaxisSeriesNo = 0;

            if (BG == "" && Category == "")
            {
                //sqlParams = new SqlParameter[];
                strCaption = "Requests In Progress : All Business Groups";
            }
            else
            {
                if (BG == "All")
                {
                    strCaption = "Requests In Progress : All Business Groups";

                    if (Category != "Both")
                    {
                        sqlParams = new SqlParameter[1];
                        sqlParams[0] = CUtilityWeb.AddParameter("ProjectType", SqlDbType.VarChar, 100, Category, ParameterDirection.Input);
                    }
                }
                else
                {
                    strCaption = "Requests In Progress : " + BG;

                    if (Category == "Both")
                    {
                        sqlParams = new SqlParameter[1];
                        sqlParams[0] = CUtilityWeb.AddParameter("BusinessGroup", SqlDbType.VarChar, 100, BG, ParameterDirection.Input);
                    }
                    else
                    {
                        sqlParams = new SqlParameter[2];
                        sqlParams[0] = CUtilityWeb.AddParameter("ProjectType", SqlDbType.VarChar, 100, Category, ParameterDirection.Input);
                        sqlParams[1] = CUtilityWeb.AddParameter("BusinessGroup", SqlDbType.VarChar, 100, BG, ParameterDirection.Input);
                    }
                }
            }


            using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                //dtResult = ExecuteDataTable("RPT_ITSSDProjects_SP", Conn, sqlParams);
                dtResult = ExecuteDataTable("RPT_ECRProjects_sp", Conn, sqlParams);
            }

            //SYaxisSeriesNo = 3;
            strChartSWF = "StackedColumn3D.swf";  //"StackedColumn2D.swf";// 
            strChartMetricsUsed = "Total Usage, IPT Usage, Actual Monthly Cost, Non IPT Cost";
            strChartDescription = @"This will illustrate the potential savings of IPT implementation against the usage trends 
                                        <br/>This would allow us to track the usage and potential savings of IPT implementation";
            // strXMLDATA = GenerateXMLforStack(dtResult, SYaxisSeriesNo, strCaption, null, null, "", 0, 0);//, "P-detailsPopUp,width=800,height=585,toolbar=no,location=no,menubar=no,directories=0,resizable=no-gridviewer.aspx?NextReportID=ITSSDProjectsDetails&ProjectType=Business Process Automation&RequestType=%SeriesName&ProjectStatus=%XAxisValue");

            strXMLDATA = GenerateXMLforStack(dtResult, SYaxisSeriesNo, strCaption, null, null, "", 0, 0, "javaScript:ProjectsInProgressDrillDown(\"" + "%SeriesName" + "\",\"" + "%XAxisValue" + "\");", null, new string[] { "New Request", "Change Request", "Implementation", "Report" });

            //strXMLDATA = GenerateXMLforStack(dtResult, SYaxisSeriesNo, strCaption, null, null, "", 0, 0, "P-detailsPopUp,width=800,height=585,toolbar=no,location=no,menubar=no,directories=0,resizable=no-gridviewer.aspx?NextReportID=ITSSDProjectsDetails&ProjectType=" + Category + "&RequestType=%SeriesName&BusinessGroup=" + (BG == "All" ? "" : BG) + "&ProjectStatus=%XAxisValue", null, new string[] { "New Request", "Change Request", "Implementation", "Report" });
            //strXMLDATA = GenerateXMLforStack(dtResult, SYaxisSeriesNo, strCaption, null, null, "", 0, 0, "P-detailsPopUp,width=800,height=585,toolbar=no,location=no,menubar=no,directories=0,resizable=no-gridviewer.aspx?NextReportID=ITSSDProjectsDetails&ProjectType=" + Category + "&RequestType=%SeriesName&ProjectStatus=%XAxisValue");

            //strXMLDATA = GenerateXMLforStack(dtResult, SYaxisSeriesNo, strCaption, null, null, "", 0, 0);

            Functions functionForWriter = new Functions();
            functionForWriter.Write(strXMLDATA.ToString());
        }

        private void Update_BG_Category_Chart_S_2()
        {

            string Category = "", BG = "";

            if (Request.QueryString["Category"] != null)
                Category = Request.QueryString["Category"].ToString();

            if (Request.QueryString["BG"] != null)
                BG = Request.QueryString["BG"].ToString();

            SqlParameter[] sqlParams = null;
            DataTable dtResult;
            string strCaption, strChartSWF, strChartMetricsUsed, strChartDescription, strXMLDATA, strNumberSuffix, strSubCaption;
            int SYaxisSeriesNo = 0;

            if (BG == "" && Category == "")
            {
                //sqlParams = new SqlParameter[];
                strCaption = "Live Projects : All Business Groups";
            }
            else
            {
                if (BG == "All")
                {
                    sqlParams = new SqlParameter[1];
                    sqlParams[0] = CUtilityWeb.AddParameter("ProjectType", SqlDbType.VarChar, 100, Category, ParameterDirection.Input);
                    strCaption = "Live Projects : All Business Groups";
                }
                else
                {
                    sqlParams = new SqlParameter[2];
                    sqlParams[0] = CUtilityWeb.AddParameter("ProjectType", SqlDbType.VarChar, 100, Category, ParameterDirection.Input);
                    sqlParams[1] = CUtilityWeb.AddParameter("BusinessGroup", SqlDbType.VarChar, 100, BG, ParameterDirection.Input);
                    strCaption = "Live Projects : " + BG;
                }
            }


            using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                dtResult = ExecuteDataTable("RPT_ITSSDProjectsProcessLive_sp", Conn, sqlParams);
            }

            strChartSWF = "Pie3D.swf";
            strSubCaption = "(Click to slice out or right click to choose rotation mode)";
            strChartMetricsUsed = "Total Usage, IPT Usage, Actual Monthly Cost, Non IPT Cost";
            strChartDescription = @"This will illustrate the potential savings of IPT implementation against the usage trends 
                                            <br/>This would allow us to track the usage and potential savings of IPT implementation";

            strXMLDATA = GenerateXMlforPieChart(dtResult, SYaxisSeriesNo, strCaption, strSubCaption, null, "", 0, 0, null, null);

            Functions functionForWriter = new Functions();
            functionForWriter.Write(strXMLDATA.ToString());
        }

        private void Update_BG_Category_Chart_B_1()
        {

            string Category = "", BG = "";

            if (Request.QueryString["Category"] != null)
                Category = Request.QueryString["Category"].ToString();

            if (Request.QueryString["BG"] != null)
                BG = Request.QueryString["BG"].ToString();

            SqlParameter[] sqlParams = null;//new SqlParameter[] ;
            DataTable dtResult;
            string strCaption, strChartSWF, strChartMetricsUsed, strChartDescription, strXMLDATA, strNumberSuffix, strSubCaption;
            int SYaxisSeriesNo = 0;

            if (BG == "" && Category == "")
            {
                //sqlParams = new SqlParameter[];
                strCaption = "Live Requests Monthly Trend : All Business Groups";
            }
            else
            {
                if (BG == "All")
                {

                    strCaption = "Live Requests Monthly Trend : All Business Groups";

                    if (Category != "Both")
                    {
                        sqlParams = new SqlParameter[1];
                        sqlParams[0] = CUtilityWeb.AddParameter("ProjectType", SqlDbType.VarChar, 100, Category, ParameterDirection.Input);
                    }

                }
                else
                {

                    strCaption = "Live Requests Monthly Trend : " + BG;

                    if (Category == "Both")
                    {
                        sqlParams = new SqlParameter[1];
                        sqlParams[0] = CUtilityWeb.AddParameter("BusinessGroup", SqlDbType.VarChar, 100, BG, ParameterDirection.Input);
                    }
                    else
                    {
                        sqlParams = new SqlParameter[2];
                        sqlParams[0] = CUtilityWeb.AddParameter("ProjectType", SqlDbType.VarChar, 100, Category, ParameterDirection.Input);
                        sqlParams[1] = CUtilityWeb.AddParameter("BusinessGroup", SqlDbType.VarChar, 100, BG, ParameterDirection.Input);
                    }

                }
            }


            using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                dtResult = ExecuteDataTable("RPT_ITSSDProjectsMonthlyTrend_sp", Conn, sqlParams);
            }
            strChartSWF = "MSColumn3D.swf";
            //strChartHeight = "350";
            strChartMetricsUsed = "Total Usage, IPT Usage, Actual Monthly Cost, Non IPT Cost";
            strChartDescription = @"This will illustrate the potential savings of IPT implementation against the usage trends 
                                            <br/>This would allow us to track the usage and potential savings of IPT implementation";

            //strXMLDATA = GenerateXMLForMultiSeries(dtResult, SYaxisSeriesNo, strCaption, "", null, "", 0, 0, null, null, new string[] { "New Request (BPA)", "Change Request (BPA)", "New Request (SSD)", "Change Request (SSD)", "Implementation", "Report" });
            strXMLDATA = GenerateXMLForMultiSeries(dtResult, SYaxisSeriesNo, strCaption, "", null, "", 0, 0, "javaScript:LiveProjectsMonthlyDrillDown(\"" + "%XAxisValue" + "\",\"" + "%SeriesName" + "\");", null, new string[] { "New Request (BPA)", "Change Request (BPA)", "New Request (SSD)", "Change Request (SSD)", "Implementation", "Report" });

            Functions functionForWriter = new Functions();
            functionForWriter.Write(strXMLDATA.ToString());
        }

        private void LoadUserAnalysis_Chart_S_2()
        {
            string BusinessGroup = "";

            if (Request.QueryString["BusinessGroup"] != null)
                BusinessGroup = Request.QueryString["BusinessGroup"].ToString();

            SqlParameter[] sqlParams = null;
            //sqlParams = new SqlParameter[1];
            //sqlParams[0] = CUtilityWeb.AddParameter("BusinessGroup", SqlDbType.VarChar, 100, BusinessGroup, ParameterDirection.Input);

            DataTable dtResult;
            string strCaption, strChartSWF, strChartMetricsUsed, strChartDescription, strXMLDATA, strNumberSuffix, strSubCaption;
            int SYaxisSeriesNo = 0;
            using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                // dtResult = ExecuteDataTable("RPT_ITSSDProjectsByBU_SP", Conn, sqlParams);
                dtResult = ExecuteDataTable("RPT_ITSSDeFormsUser_sp", Conn, sqlParams);
            }

            strCaption = "eForms User";
            strChartSWF = "Pie3D.swf";
            strSubCaption = "(Click to slice out or right click to choose rotation mode)";
            strChartMetricsUsed = "Total Usage, IPT Usage, Actual Monthly Cost, Non IPT Cost";
            strChartDescription = @"This will illustrate the potential savings of IPT implementation against the usage trends 
                                            <br/>This would allow us to track the usage and potential savings of IPT implementation";

            strXMLDATA = GenerateXMlforPieChart(dtResult, SYaxisSeriesNo, strCaption, strSubCaption, null, "", 0, 0, "javaScript:LiveProcessDrillDown(\"" + "%PieValue" + "\");", null);

            Functions functionForWriter = new Functions();
            functionForWriter.Write(strXMLDATA.ToString());


        }

        private void LoadUserAnalysis_Chart_S_3()
        {
            string BusinessGroup = "";

            if (Request.QueryString["BusinessGroup"] != null)
                BusinessGroup = Request.QueryString["BusinessGroup"].ToString();

            SqlParameter[] sqlParams = null;
            //sqlParams = new SqlParameter[1];
            //sqlParams[0] = CUtilityWeb.AddParameter("BusinessGroup", SqlDbType.VarChar, 100, BusinessGroup, ParameterDirection.Input);

            DataTable dtResult;
            string strCaption, strChartSWF, strChartMetricsUsed, strChartDescription, strXMLDATA, strNumberSuffix, strSubCaption;
            int SYaxisSeriesNo = 0;
            using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                // dtResult = ExecuteDataTable("RPT_ITSSDProjectsByBU_SP", Conn, sqlParams);
                dtResult = ExecuteDataTable("RPT_ITSSDeFormsUserNewOld_sp", Conn, sqlParams);
            }

            strCaption = "eForms User";
            strChartSWF = "Pie3D.swf";
            strSubCaption = "(Click to slice out or right click to choose rotation mode)";
            strChartMetricsUsed = "Total Usage, IPT Usage, Actual Monthly Cost, Non IPT Cost";
            strChartDescription = @"This will illustrate the potential savings of IPT implementation against the usage trends 
                                            <br/>This would allow us to track the usage and potential savings of IPT implementation";

            strXMLDATA = GenerateXMlforPieChart(dtResult, SYaxisSeriesNo, strCaption, strSubCaption, null, "", 0, 0, "javaScript:LiveProcessDrillDown(\"" + "%PieValue" + "\");", null);

            Functions functionForWriter = new Functions();
            functionForWriter.Write(strXMLDATA.ToString());

        }


        private void EmployeeDetails()
        {

            int SelectedMonthNo, CurrentYear;

            if (Request.QueryString["Month"] == null)
                SelectedMonthNo = DateTime.Now.Month;
            else
                SelectedMonthNo = Convert.ToInt32(Request.QueryString["Month"]);

            CurrentYear = DateTime.Now.Year;
            //SelectedMonthNo = ddlMonth.SelectedIndex + 1;

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
                //    strXML.Append("<task color='453269' height='15' topPadding='10" + HttpUtility.UrlEncode("%") + "' processId='" + DR["RequestFor"].ToString() + "' id='" + DR["FormId"].ToString() + "' start='" + DR["TaskStartDate"].ToString() + "' end='" + DR["TaskDueDate"].ToString() + "' label='" + HttpUtility.UrlEncode(DR["ProjectName"].ToString()) + ", " + HttpUtility.UrlEncode(DR["Title"].ToString()) + "' />");
                //}
                //else
                //{
                strXML.Append("<task color='FF654F' height='15' topPadding='43" + HttpUtility.UrlEncode("%") + "' processId='" + DR["RequestFor"].ToString() + "' id='" + DR["FormId"].ToString() + "' start='" + DR["TaskStartDate"].ToString() + "' end='" + DR["TaskDueDate"].ToString() + "' label='" + HttpUtility.UrlEncode(DR["ProjectName"].ToString()) + ", " + HttpUtility.UrlEncode(DR["Title"].ToString()) + "' />");
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

            Functions functionForWriter = new Functions();
            functionForWriter.Write(strXML.ToString());
            functionForWriter.Write("</chart>");


        }

        private void EmployeeDetailsPlannedTasksOnly()
        {

            int SelectedMonthNo, CurrentYear;

            if (Request.QueryString["Month"] == null)
                SelectedMonthNo = DateTime.Now.Month;
            else
                SelectedMonthNo = Convert.ToInt32(Request.QueryString["Month"]);

            CurrentYear = DateTime.Now.Year;
            //SelectedMonthNo = ddlMonth.SelectedIndex + 1;

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

            //using (SqlConnection sqlConnection = CUtilityW eb.getConnection(CUtilityWeb.ConnType.eFormsDB))
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
            //    strXML.Append("<task height='10' processId='" + DR["RequestFor"].ToString() + "' id='" + DR["FormId"].ToString() + "' start='" + DR["TaskStartDate"].ToString() + "' end='" + DR["TaskDueDate"].ToString() + "' label='" + HttpUtility.UrlEncode(DR["ProjectName"].ToString()) + ", " + HttpUtility.UrlEncode(DR["Title"].ToString()) + "' />");
            //    //    }
            //    //    else
            //    //    {
            //    //        strXML.Append("<task color='FF654F' height='15' topPadding='45" + HttpUtility.UrlEncode("%") + "' processId='" + DR["RequestFor"].ToString() + "' id='" + DR["FormId"].ToString() + "' start='" + DR["TaskStartDate"].ToString() + "' end='" + DR["TaskDueDate"].ToString() + "' label='" + HttpUtility.UrlEncode(DR["ProjectName"].ToString()) + ", " + HttpUtility.UrlEncode(DR["Title"].ToString()) + "' />");
            //    //    }
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

            Functions functionForWriter = new Functions();
            functionForWriter.Write(strXML.ToString());
            functionForWriter.Write("</chart>");
        }


        //Start Process Usage Functions BAM

        private void LiveProcessDrillDown_Level1()
        {

            string BusinessGroup = "";

            if (Request.QueryString["BusinessGroup"] != null)
                BusinessGroup = Request.QueryString["BusinessGroup"].ToString();

            SqlParameter[] sqlParams = null;
            sqlParams = new SqlParameter[1];
            sqlParams[0] = CUtilityWeb.AddParameter("BusinessGroup", SqlDbType.VarChar, 100, BusinessGroup, ParameterDirection.Input);

            DataTable dtResult;
            string strCaption, strChartSWF, strChartMetricsUsed, strChartDescription, strXMLDATA, strNumberSuffix, strSubCaption;
            int SYaxisSeriesNo = 0;
            using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                dtResult = ExecuteDataTable("RPT_ITSSDFunctionLive_sp", Conn, sqlParams);
            }

            strCaption = "Function wise Breakdown for " + BusinessGroup;
            strSubCaption = "(Click to see process usage on the below chart)";

            strXMLDATA = GenerateXMlforPieChart(dtResult, SYaxisSeriesNo, strCaption, strSubCaption, null, "", 0, 0, "javaScript:LiveFunctionDrillDown(\"" + "%PieValue" + "\",\"" + BusinessGroup + "\");", null);

            Functions functionForWriter = new Functions();
            functionForWriter.Write(strXMLDATA.ToString());

        }

        private void LiveProcessDrillDown_Level2()
        {

            string BusinessGroup = "";

            if (Request.QueryString["BusinessGroup"] != null)
                BusinessGroup = Request.QueryString["BusinessGroup"].ToString();

            SqlParameter[] sqlParams = null;

            DataTable dtResult;
            string strCaption, strChartSWF, strChartMetricsUsed, strChartDescription, strXMLDATA, strNumberSuffix, strSubCaption;
            int SYaxisSeriesNo = 0;
            using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                dtResult = ExecuteDataTable("RPT_ITSSDInfrastructureLive_sp", Conn, sqlParams);
            }

            strCaption = "Process Usage Breakdown for Infrastructure";
            strSubCaption = "(Click to see function wise breakdown)";

            strXMLDATA = GenerateXMlforPieChart(dtResult, SYaxisSeriesNo, strCaption, strSubCaption, null, "", 0, 0, "javaScript:LiveProcessDrillDown(\"" + "%PieValue" + "\");", null);

            Functions functionForWriter = new Functions();
            functionForWriter.Write(strXMLDATA.ToString());

        }

        private void LiveFunctionDrillDown_ProcessUsage()
        {
            string BusinessGroup = "";
            string Function = "";

            if (Request.QueryString["BusinessGroup"] != null)
                BusinessGroup = Request.QueryString["BusinessGroup"].ToString();


            if (Request.QueryString["Function"] != null)
                Function = Request.QueryString["Function"].ToString();


            SqlParameter[] sqlParams = new SqlParameter[2];
            sqlParams[0] = CUtilityWeb.AddParameter("BusinessGroup", SqlDbType.VarChar, 100, (BusinessGroup == "" ? (object)DBNull.Value : (object)BusinessGroup), ParameterDirection.Input);
            sqlParams[1] = CUtilityWeb.AddParameter("ProjectFunction", SqlDbType.VarChar, 100, Function, ParameterDirection.Input);


            DataTable dtResult;
            string strCaption, strChartSWF, strChartMetricsUsed, strChartDescription, strXMLDATA, strNumberSuffix, strSubCaption;
            int SYaxisSeriesNo = 3;
            using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                dtResult = ExecuteDataTable("RPT_ITSSDProcessUsage_sp", Conn, sqlParams);
            }

            strCaption = "Process Usage for " + BusinessGroup + " (" + Function + ")";
            strSubCaption = "(Click to see yearly trend on the below chart)";

            //strXMLDATA = GenerateXMLForMultiDualAxis(dtResult, SYaxisSeriesNo, strCaption, strSubCaption, null, "", 0, 0, "javaScript:ProcessUsageDrillDown(\"" + "%XAxisValue" + "\",\"" + BusinessGroup + "\");");

            strXMLDATA = "<chart palette='4' showLegend='0' labelDisplay='Rotate' slantLabels='1' bgcolor='#FFFFFF' border='0'  caption='" + strCaption + "' subcaption='" + strSubCaption + "'   numberPrefix='' SnumberSuffix='' formatNumberScale='0' showValues='0' decimals='0' useRoundEdges='1' >";

            strXMLDATA += GetSimpleData(dtResult, SYaxisSeriesNo, null, "javaScript:ProcessUsageDrillDown(\"" + "%XAxisValue" + "\",\"" + BusinessGroup + "\");");

            strXMLDATA += "</chart>";

            Functions functionForWriter = new Functions();
            functionForWriter.Write(strXMLDATA.ToString());
        }

        private void ProcessUsageDrillDown_YearlyTrend()
        {
            string BusinessGroup = "";
            string ProcessName = "";

            if (Request.QueryString["BusinessGroup"] != null)
                BusinessGroup = Request.QueryString["BusinessGroup"].ToString();

            if (Request.QueryString["ProcessName"] != null)
                ProcessName = Request.QueryString["ProcessName"].ToString();

            SqlParameter[] sqlParams = new SqlParameter[2];
            sqlParams[0] = CUtilityWeb.AddParameter("BusinessGroup", SqlDbType.VarChar, 100, (BusinessGroup == "" ? (object)DBNull.Value : (object)BusinessGroup), ParameterDirection.Input);
            sqlParams[1] = CUtilityWeb.AddParameter("ProcessName", SqlDbType.VarChar, 100, ProcessName, ParameterDirection.Input);

            DataTable dtResult;
            string strCaption, strChartSWF, strChartMetricsUsed, strChartDescription, strXMLDATA, strNumberSuffix, strSubCaption;
            int SYaxisSeriesNo = -1;

            strCaption = "Yearly Trend for " + BusinessGroup + " (" + ProcessName + ")";
            strSubCaption = "(Click to see monthly trend)";

            using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsReportsDB))
            {
                dtResult = ExecuteDataTable("RPT_YearlyUsageReport_SP", Conn, sqlParams);
            }
            strXMLDATA = GenerateXMLForMultiDualAxis(dtResult, SYaxisSeriesNo, strCaption, strSubCaption, null, "", 0, 0, "javaScript:ProcessUsageDrillDown_MonthlyTrend(\"" + "%XAxisValue" + "\",\"" + BusinessGroup + "\",\"" + ProcessName + "\");");

            Functions functionForWriter = new Functions();
            functionForWriter.Write(strXMLDATA.ToString());
        }

        private void ProcessUsageDrillDown_MonthlyTrend()
        {
            string BusinessGroup = "";
            string ProcessName = "";
            string Year = "";

            if (Request.QueryString["BusinessGroup"] != null)
                BusinessGroup = Request.QueryString["BusinessGroup"].ToString();

            if (Request.QueryString["ProcessName"] != null)
                ProcessName = Request.QueryString["ProcessName"].ToString();

            if (Request.QueryString["Year"] != null)
                Year = Request.QueryString["Year"].ToString();

            SqlParameter[] sqlParams = new SqlParameter[3];
            sqlParams[0] = CUtilityWeb.AddParameter("BusinessGroup", SqlDbType.VarChar, 100, (BusinessGroup == "" ? (object)DBNull.Value : (object)BusinessGroup), ParameterDirection.Input);
            sqlParams[1] = CUtilityWeb.AddParameter("ProcessName", SqlDbType.VarChar, 100, ProcessName, ParameterDirection.Input);
            sqlParams[2] = CUtilityWeb.AddParameter("Year", SqlDbType.VarChar, 100, Year, ParameterDirection.Input);

            DataTable dtResult;
            string strCaption, strChartSWF, strChartMetricsUsed, strChartDescription, strXMLDATA, strNumberSuffix, strSubCaption;
            int SYaxisSeriesNo = -1;

            strCaption = "Monthly Trend for " + BusinessGroup + " (" + ProcessName + ")";

            using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsReportsDB))
            {
                dtResult = ExecuteDataTable("RPT_MonthlyUsageReport_SP", Conn, sqlParams);
            }
            strXMLDATA = GenerateXMLForMultiDualAxis(dtResult, SYaxisSeriesNo, strCaption, "", null, "", 0, 0, "");

            Functions functionForWriter = new Functions();
            functionForWriter.Write(strXMLDATA.ToString());

        }

        private void ProcessUsageDrillDown_CurrentMonth()
        {

            string BusinessGroup = "";
            string ProcessName = "";

            if (Request.QueryString["BusinessGroup"] != null)
                BusinessGroup = Request.QueryString["BusinessGroup"].ToString();

            if (Request.QueryString["ProcessName"] != null)
                ProcessName = Request.QueryString["ProcessName"].ToString();

            SqlParameter[] sqlParams = new SqlParameter[2];
            sqlParams[0] = CUtilityWeb.AddParameter("BusinessGroup", SqlDbType.VarChar, 100, (BusinessGroup == "" ? (object)DBNull.Value : (object)BusinessGroup), ParameterDirection.Input);
            sqlParams[1] = CUtilityWeb.AddParameter("ProcessName", SqlDbType.VarChar, 100, ProcessName, ParameterDirection.Input);

            DataTable dtResult;
            string strCaption, strChartSWF, strChartMetricsUsed, strChartDescription, strXMLDATA, strNumberSuffix, strSubCaption;
            int SYaxisSeriesNo = -1;

            strCaption = "Current Month";

            using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsReportsDB))
            {
                dtResult = ExecuteDataTable("RPT_CurrentMonthUsageReport_SP", Conn, sqlParams);
            }
            strXMLDATA = GenerateXMLForMultiDualAxis(dtResult, SYaxisSeriesNo, strCaption, "", null, "", 0, 0, "");

            Functions functionForWriter = new Functions();
            functionForWriter.Write(strXMLDATA.ToString());


        }

        private void ProcessUsageDrillDown_CurrentDay()
        {
            string BusinessGroup = "";
            string ProcessName = "";

            if (Request.QueryString["BusinessGroup"] != null)
                BusinessGroup = Request.QueryString["BusinessGroup"].ToString();

            if (Request.QueryString["ProcessName"] != null)
                ProcessName = Request.QueryString["ProcessName"].ToString();

            SqlParameter[] sqlParams = new SqlParameter[2];
            sqlParams[0] = CUtilityWeb.AddParameter("BusinessGroup", SqlDbType.VarChar, 100, (BusinessGroup == "" ? (object)DBNull.Value : (object)BusinessGroup), ParameterDirection.Input);
            sqlParams[1] = CUtilityWeb.AddParameter("ProcessName", SqlDbType.VarChar, 100, ProcessName, ParameterDirection.Input);

            DataTable dtResult;
            string strCaption, strChartSWF, strChartMetricsUsed, strChartDescription, strXMLDATA, strNumberSuffix, strSubCaption;
            int SYaxisSeriesNo = -1;

            strCaption = "Current Day";

            using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                dtResult = ExecuteDataTable("RPT_DailyUsageReport_SP", Conn, sqlParams);
            }
            strXMLDATA = GenerateXMLForMultiDualAxis(dtResult, SYaxisSeriesNo, strCaption, "", null, "", 0, 0, "");

            Functions functionForWriter = new Functions();
            functionForWriter.Write(strXMLDATA.ToString());

        }

        //End Process Usage Functions BAM

        private void ProjectsInProgressDrillDown()
        {
            string Category = "", BG = "", RequestType = "", ProjectStatus = ""; ;

            if (Request.QueryString["Category"] != null)
                Category = Request.QueryString["Category"].ToString();

            if (Request.QueryString["BG"] != null)
                BG = Request.QueryString["BG"].ToString();

            if (Request.QueryString["RequestType"] != null)
                RequestType = Request.QueryString["RequestType"].ToString();

            if (Request.QueryString["ProjectStatus"] != null)
                ProjectStatus = Request.QueryString["ProjectStatus"].ToString();

            SqlParameter[] sqlParams = new SqlParameter[5];
            sqlParams[0] = CUtilityWeb.AddParameter("ProjectType", SqlDbType.VarChar, 100, (Category == "Both" ? (object)DBNull.Value : (object)Category), ParameterDirection.Input);
            sqlParams[1] = CUtilityWeb.AddParameter("RequestType", SqlDbType.VarChar, 100, RequestType, ParameterDirection.Input);
            sqlParams[2] = CUtilityWeb.AddParameter("BusinessGroup", SqlDbType.VarChar, 100, (BG == "All" ? (object)DBNull.Value : (object)BG), ParameterDirection.Input);
            sqlParams[3] = CUtilityWeb.AddParameter("BusinessSubGroup", SqlDbType.VarChar, 100, DBNull.Value, ParameterDirection.Input);
            sqlParams[4] = CUtilityWeb.AddParameter("ProjectStatus", SqlDbType.VarChar, 100, ProjectStatus, ParameterDirection.Input);

            DataTable dtResult;
            using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                //dtResult = ExecuteDataTable("RPT_ITSSDProjectsDetails_SP", Conn, sqlParams);
                dtResult = ExecuteDataTable("RPT_RPT_ECRProjectsDetails_sp", Conn, sqlParams);

            }

            StringBuilder strXML = new StringBuilder();

            strXML.Append("<chart caption='Project Timelines (September)' >");

            foreach (DataRow DR in dtResult.Rows)
            {
                //strXML.Append("<set label='" + HttpUtility.HtmlEncode(DR["ProcessName"].ToString()) + ", " + HttpUtility.HtmlEncode(DR["Title"].ToString()) + ", UAT Date: " + DR["ReadyForUAT"].ToString() + "' Value='" + DR["ReadyForUAT"].ToString() + "'/>");

                strXML.Append("<set label='" + HttpUtility.HtmlEncode(DR["BusinessGroup"].ToString()) + " >>> " + DR["FormCode"].ToString() + ": " + HttpUtility.HtmlEncode(DR["ProcessName"].ToString()) + ", " + HttpUtility.HtmlEncode(DR["Title"].ToString()) + "' Value='" + DR["SinceRequestedDays"].ToString() + "'/>");

            }

            strXML.Append("</chart>");

            Functions functionForWriter = new Functions();
            functionForWriter.Write(strXML.ToString());
        }

        private void LiveProjectsMonthlyDrillDown()
        {

            string Category = "", BG = "", RequestType = "", ProjectStatus = "", Month = "";

            if (Request.QueryString["Category"] != null)
                Category = Request.QueryString["Category"].ToString();

            if (Request.QueryString["BG"] != null)
                BG = Request.QueryString["BG"].ToString();

            if (Request.QueryString["RequestType"] != null)
                RequestType = Request.QueryString["RequestType"].ToString();

            if (RequestType.IndexOf("(") > 0)
                RequestType = RequestType.Substring(0, RequestType.IndexOf("(") - 1);

            if (Request.QueryString["Month"] != null)
                Month = Request.QueryString["Month"].ToString();

            ProjectStatus = "Live";

            SqlParameter[] sqlParams = new SqlParameter[6];
            sqlParams[0] = CUtilityWeb.AddParameter("ProjectType", SqlDbType.VarChar, 100, (Category == "Both" ? (object)DBNull.Value : (object)Category), ParameterDirection.Input);
            sqlParams[1] = CUtilityWeb.AddParameter("RequestType", SqlDbType.VarChar, 100, RequestType, ParameterDirection.Input);
            sqlParams[2] = CUtilityWeb.AddParameter("BusinessGroup", SqlDbType.VarChar, 100, (BG == "All" ? (object)DBNull.Value : (object)BG), ParameterDirection.Input);
            sqlParams[3] = CUtilityWeb.AddParameter("BusinessSubGroup", SqlDbType.VarChar, 100, DBNull.Value, ParameterDirection.Input);
            sqlParams[4] = CUtilityWeb.AddParameter("ProjectStatus", SqlDbType.VarChar, 100, ProjectStatus, ParameterDirection.Input);
            sqlParams[5] = CUtilityWeb.AddParameter("MonthName", SqlDbType.VarChar, 100, Month, ParameterDirection.Input);

            DataTable dtResult;
            using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                dtResult = ExecuteDataTable("RPT_ITSSDProjectsDetails_SP", Conn, sqlParams);
            }

            StringBuilder strXML = new StringBuilder();

            strXML.Append("<chart caption='Project Timelines (September)' >");

            foreach (DataRow DR in dtResult.Rows)
            {
                strXML.Append("<set label='" + HttpUtility.HtmlEncode(DR["BusinessGroup"].ToString()) + " >>> " + HttpUtility.HtmlEncode(DR["ProcessName"].ToString()) + ", " + HttpUtility.HtmlEncode(DR["Title"].ToString()) + ", Live Date: " + DR["ActualLiveDate"].ToString() + "' Value='" + DR["ActualLiveDate"].ToString() + "'/>");
            }

            strXML.Append("</chart>");

            Functions functionForWriter = new Functions();
            functionForWriter.Write(strXML.ToString());

        }

        private void ProjectsInProgressDrillDownDelay()
        {
            string Category = "", BG = "", RequestType = "", ProjectStatus = ""; ;

            if (Request.QueryString["Category"] != null)
                Category = Request.QueryString["Category"].ToString();

            if (Request.QueryString["BG"] != null)
                BG = Request.QueryString["BG"].ToString();

            if (Request.QueryString["RequestType"] != null)
                RequestType = Request.QueryString["RequestType"].ToString();

            if (Request.QueryString["ProjectStatus"] != null)
                ProjectStatus = Request.QueryString["ProjectStatus"].ToString();

            SqlParameter[] sqlParams = new SqlParameter[5];
            sqlParams[0] = CUtilityWeb.AddParameter("ProjectType", SqlDbType.VarChar, 100, (Category == "Both" ? (object)DBNull.Value : (object)Category), ParameterDirection.Input);
            sqlParams[1] = CUtilityWeb.AddParameter("RequestType", SqlDbType.VarChar, 100, RequestType, ParameterDirection.Input);
            sqlParams[2] = CUtilityWeb.AddParameter("BusinessGroup", SqlDbType.VarChar, 100, (BG == "All" ? (object)DBNull.Value : (object)BG), ParameterDirection.Input);
            sqlParams[3] = CUtilityWeb.AddParameter("BusinessSubGroup", SqlDbType.VarChar, 100, DBNull.Value, ParameterDirection.Input);
            sqlParams[4] = CUtilityWeb.AddParameter("ProjectStatus", SqlDbType.VarChar, 100, ProjectStatus, ParameterDirection.Input);

            DataTable dtResult;
            string strCaption, strChartSWF, strChartMetricsUsed, strChartDescription, strXMLDATA, strNumberSuffix, strSubCaption;
            int SYaxisSeriesNo = 0;
            using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                dtResult = ExecuteDataTable("RPT_ECRProjectsDetailsGraph_sp", Conn, sqlParams);
            }

            strCaption = "Request Duration";
            strSubCaption = "(Click to see by User)";

            strXMLDATA = "<chart palette='4' showLegend='0' labelDisplay='Rotate' slantLabels='1' bgcolor='#FFFFFF' border='0'  caption='Request Duration: " + ProjectStatus + "' subcaption=''   numberPrefix='' SnumberSuffix='' formatNumberScale='0' showValues='0' decimals='0' useRoundEdges='1' >";

            strXMLDATA += GetSimpleData(dtResult, SYaxisSeriesNo, null, "javaScript:ProjectsInProgressDrillDownDelayStates(\"" + "%XAxisValue" + "\");");

            strXMLDATA += "</chart>";

            Functions functionForWriter = new Functions();
            functionForWriter.Write(strXMLDATA.ToString());
        }

        private void ProjectsInProgressDrillDownDelayStates()
        {
            string SSDRequest = "";

            if (Request.QueryString["SSDRequest"] != null)
                SSDRequest = Request.QueryString["SSDRequest"].ToString();

            SqlParameter[] sqlParams = new SqlParameter[2];
            sqlParams[0] = CUtilityWeb.AddParameter("Process", SqlDbType.VarChar, 100, "EformsChangeRequestProcess", ParameterDirection.Input);
            sqlParams[1] = CUtilityWeb.AddParameter("FormCode", SqlDbType.VarChar, 100, SSDRequest, ParameterDirection.Input);

            DataTable dtResult;
            string strCaption, strChartSWF, strChartMetricsUsed, strChartDescription, strXMLDATA, strNumberSuffix, strSubCaption;
            int SYaxisSeriesNo = 0;
            using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                dtResult = ExecuteDataTable("RPT_StateDuration_SP", Conn, sqlParams);
            }

            strCaption = "Request Duration State Wise";
            strSubCaption = "(Click to see by User)";

            strXMLDATA = "<chart palette='4' showLegend='0' labelDisplay='Rotate' slantLabels='1' bgcolor='#FFFFFF' border='0'  caption='Request Duration Statewise: " + SSDRequest + "' subcaption=''   numberPrefix='' SnumberSuffix='' formatNumberScale='0' showValues='0' decimals='0' useRoundEdges='1' >";

            strXMLDATA += GetSimpleData(dtResult, SYaxisSeriesNo, null, "javaScript:ProjectsInProgressDrillDownDelayStatesPerson(\"" + "%XAxisValue" + "\",\"" + SSDRequest + "\");");

            strXMLDATA += "</chart>";

            Functions functionForWriter = new Functions();
            functionForWriter.Write(strXMLDATA.ToString());
        }

        private void ProjectsInProgressDrillDownDelayStatesPerson()
        {
            string SSDRequest = "";
            string StateName = "";

            if (Request.QueryString["SSDRequest"] != null)
                SSDRequest = Request.QueryString["SSDRequest"].ToString();

            if (Request.QueryString["StateName"] != null)
                StateName = Request.QueryString["StateName"].ToString();

            SqlParameter[] sqlParams = new SqlParameter[3];
            sqlParams[0] = CUtilityWeb.AddParameter("Process", SqlDbType.VarChar, 100, "EformsChangeRequestProcess", ParameterDirection.Input);
            sqlParams[1] = CUtilityWeb.AddParameter("FormCode", SqlDbType.VarChar, 100, SSDRequest, ParameterDirection.Input);
            sqlParams[2] = CUtilityWeb.AddParameter("StateName", SqlDbType.VarChar, 100, StateName, ParameterDirection.Input);

            DataTable dtResult;
            string strCaption, strChartSWF, strChartMetricsUsed, strChartDescription, strXMLDATA, strNumberSuffix, strSubCaption;
            int SYaxisSeriesNo = 0;
            using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                dtResult = ExecuteDataTable("RPT_StateDurationDetails_SP", Conn, sqlParams);
            }

            strCaption = "Request Duration User Based:";
            strSubCaption = "(Click to see by User)";

            strXMLDATA = "<chart palette='4' showLegend='0' labelDisplay='Rotate' slantLabels='1' bgcolor='#FFFFFF' border='0'  caption='Request Duration User Based: " + SSDRequest + ", " + StateName + " ' subcaption=''   numberPrefix='' SnumberSuffix='' formatNumberScale='0' showValues='0' decimals='0' useRoundEdges='1' >";

            strXMLDATA += GetSimpleData(dtResult, SYaxisSeriesNo, null, "javaScript:ProjectsInProgressDrillDownDelayStatesPerson(\"" + "%XAxisValue" + "\",\"" + SSDRequest + "\");");

            strXMLDATA += "</chart>";

            Functions functionForWriter = new Functions();
            functionForWriter.Write(strXMLDATA.ToString());
        }

        //Management Projects

        private void ManagementProjectDuration()
        {
            string BG = "";

            if (Request.QueryString["BG"] != null)
                BG = Request.QueryString["BG"].ToString();

            SqlParameter[] sqlParams = new SqlParameter[2];
            sqlParams[0] = CUtilityWeb.AddParameter("Year", SqlDbType.VarChar, 100, "2009", ParameterDirection.Input);
            sqlParams[1] = CUtilityWeb.AddParameter("BusinessUnit", SqlDbType.VarChar, 100, BG, ParameterDirection.Input);


            DataTable dtResult;
            string strCaption, strChartSWF, strChartMetricsUsed, strChartDescription, strXMLDATA, strNumberSuffix, strSubCaption;
            int SYaxisSeriesNo = 0;
            using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                dtResult = ExecuteDataTable("RPT_ChairmanProjectsStatusDuration_SP", Conn, sqlParams);
            }

            strCaption = "Project Duration";
            strSubCaption = "(Click to see by User)";
            strXMLDATA = GenerateXMLforStack(dtResult, SYaxisSeriesNo, strCaption, null, null, "", 0, 0, "javaScript:ManagementProjectDetails(\"" + "%SeriesName" + "\",\"" + "%XAxisValue" + "\");", null, null);

            //strXMLDATA = "<chart palette='4' showLegend='0' labelDisplay='Rotate' slantLabels='1' bgcolor='#FFFFFF' border='0'  caption='" + strCaption + "' subcaption=''   numberPrefix='' SnumberSuffix='' formatNumberScale='0' showValues='0' decimals='0' useRoundEdges='1' >";

            //strXMLDATA += GetSimpleData(dtResult, SYaxisSeriesNo, null, "javaScript:ProjectsInProgressDrillDownDelayStates(\"" + "%XAxisValue" + "\");");

            //strXMLDATA += "</chart>";

            Functions functionForWriter = new Functions();
            functionForWriter.Write(strXMLDATA.ToString());

        }


        private void ManagementProject_TeamMembers()
        {

            string ProjectName = "";

            if (Request.QueryString["ProjectName"] != null)
                ProjectName = Request.QueryString["ProjectName"].ToString();

            SqlParameter[] sqlParams = new SqlParameter[3];
            sqlParams[0] = CUtilityWeb.AddParameter("Year", SqlDbType.VarChar, 100, "2009", ParameterDirection.Input);
            sqlParams[1] = CUtilityWeb.AddParameter("ProjectName", SqlDbType.VarChar, 100, ProjectName, ParameterDirection.Input);
            sqlParams[2] = CUtilityWeb.AddParameter("BusinessUnit", SqlDbType.VarChar, 100, DBNull.Value, ParameterDirection.Input);

            DataTable dtResult;
            string strCaption, strChartSWF, strChartMetricsUsed, strChartDescription, strXMLDATA, strNumberSuffix, strSubCaption;
            int SYaxisSeriesNo = 0;
            using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                dtResult = ExecuteDataTable("RPT_ChairmanProjectNumberOfMembers_SP", Conn, sqlParams);
            }

            strCaption = "Project Team Members";
            strSubCaption = "(Click to see by User)";

            strXMLDATA = "<chart palette='4' showLegend='0' labelDisplay='Rotate' slantLabels='1' bgcolor='#FFFFFF' border='0'  caption='" + strCaption + "' subcaption=''   numberPrefix='' SnumberSuffix='' formatNumberScale='0' showValues='0' decimals='0' useRoundEdges='1' >";

            strXMLDATA += GetSimpleData(dtResult, SYaxisSeriesNo, null, "javaScript:ManagementProject_TeamMembers_Details(\"" + ProjectName + "\");");

            strXMLDATA += "</chart>";

            Functions functionForWriter = new Functions();
            functionForWriter.Write(strXMLDATA.ToString());

        }

        private void ManagementProject_Cost()
        {
            string ProjectName = "";

            if (Request.QueryString["ProjectName"] != null)
                ProjectName = Request.QueryString["ProjectName"].ToString();

            SqlParameter[] sqlParams = new SqlParameter[3];
            sqlParams[0] = CUtilityWeb.AddParameter("Year", SqlDbType.VarChar, 100, "2009", ParameterDirection.Input);
            sqlParams[1] = CUtilityWeb.AddParameter("ProjectName", SqlDbType.VarChar, 100, ProjectName, ParameterDirection.Input);
            sqlParams[2] = CUtilityWeb.AddParameter("BusinessUnit", SqlDbType.VarChar, 100, DBNull.Value, ParameterDirection.Input);

            DataTable dtResult;
            string strCaption, strChartSWF, strChartMetricsUsed, strChartDescription, strXMLDATA, strNumberSuffix, strSubCaption;
            int SYaxisSeriesNo = 0;
            using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                dtResult = ExecuteDataTable("RPT_ChairmanProjectTotalCost_SP", Conn, sqlParams);
            }

            strCaption = "Project Cost";
            strSubCaption = "(Click to see by User)";

            strXMLDATA = "<chart palette='4' showLegend='0' labelDisplay='Rotate' slantLabels='1' bgcolor='#FFFFFF' border='0'  caption='" + strCaption + "' subcaption=''   numberPrefix='' SnumberSuffix='' formatNumberScale='0' showValues='0' decimals='0' useRoundEdges='1' >";

            strXMLDATA += GetSimpleData(dtResult, SYaxisSeriesNo, null, null);

            strXMLDATA += "</chart>";

            Functions functionForWriter = new Functions();
            functionForWriter.Write(strXMLDATA.ToString());
        }

        private void ManagementProject_Expenses()
        {
            string ProjectName = "";

            if (Request.QueryString["ProjectName"] != null)
                ProjectName = Request.QueryString["ProjectName"].ToString();

            SqlParameter[] sqlParams = new SqlParameter[3];
            sqlParams[0] = CUtilityWeb.AddParameter("Year", SqlDbType.VarChar, 100, "2009", ParameterDirection.Input);
            sqlParams[1] = CUtilityWeb.AddParameter("ProjectName", SqlDbType.VarChar, 100, ProjectName, ParameterDirection.Input);
            sqlParams[2] = CUtilityWeb.AddParameter("BusinessUnit", SqlDbType.VarChar, 100, DBNull.Value, ParameterDirection.Input);

            DataTable dtResult;
            string strCaption, strChartSWF, strChartMetricsUsed, strChartDescription, strXMLDATA, strNumberSuffix, strSubCaption;
            int SYaxisSeriesNo = 0;
            using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                dtResult = ExecuteDataTable("RPT_ChairmanProjectTotalExpences_SP", Conn, sqlParams);
            }

            strCaption = "Project Expenses";
            strSubCaption = "(Click to see by User)";

            strXMLDATA = "<chart palette='4' showLegend='0' labelDisplay='Rotate' slantLabels='1' bgcolor='#FFFFFF' border='0'  caption='" + strCaption + "' subcaption=''   numberPrefix='' SnumberSuffix='' formatNumberScale='0' showValues='0' decimals='0' useRoundEdges='1' >";

            strXMLDATA += GetSimpleData(dtResult, SYaxisSeriesNo, null, null);

            strXMLDATA += "</chart>";

            Functions functionForWriter = new Functions();
            functionForWriter.Write(strXMLDATA.ToString());
        }

        private void ManagementProject_Issues()
        {
            string ProjectName = "";

            if (Request.QueryString["ProjectName"] != null)
                ProjectName = Request.QueryString["ProjectName"].ToString();

            SqlParameter[] sqlParams = new SqlParameter[3];
            sqlParams[0] = CUtilityWeb.AddParameter("Year", SqlDbType.VarChar, 100, "2009", ParameterDirection.Input);
            sqlParams[1] = CUtilityWeb.AddParameter("ProjectName", SqlDbType.VarChar, 100, ProjectName, ParameterDirection.Input);
            sqlParams[2] = CUtilityWeb.AddParameter("BusinessUnit", SqlDbType.VarChar, 100, DBNull.Value, ParameterDirection.Input);

            DataTable dtResult;
            string strCaption, strChartSWF, strChartMetricsUsed, strChartDescription, strXMLDATA, strNumberSuffix, strSubCaption;
            int SYaxisSeriesNo = 0;
            using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                dtResult = ExecuteDataTable("RPT_ChairmanProjectNumberOfIssues_SP", Conn, sqlParams);
            }

            strCaption = "Project Issues";
            strSubCaption = "(Click to see by User)";

            strXMLDATA = "<chart palette='4' showLegend='0' labelDisplay='Rotate' slantLabels='1' bgcolor='#FFFFFF' border='0'  caption='" + strCaption + "' subcaption=''   numberPrefix='' SnumberSuffix='' formatNumberScale='0' showValues='0' decimals='0' useRoundEdges='1' >";

            strXMLDATA += GetSimpleData(dtResult, SYaxisSeriesNo, null, "javaScript:ManagementProject_Issue_Details(\"" + ProjectName + "\");");

            strXMLDATA += "</chart>";

            Functions functionForWriter = new Functions();
            functionForWriter.Write(strXMLDATA.ToString());
        }

        private void ManagementProject_TeamMembers_Details()
        {
            string ProjectName = "";

            if (Request.QueryString["ProjectName"] != null)
                ProjectName = Request.QueryString["ProjectName"].ToString();

            SqlParameter[] sqlParams = new SqlParameter[3];
            sqlParams[0] = CUtilityWeb.AddParameter("Year", SqlDbType.VarChar, 100, "2009", ParameterDirection.Input);
            sqlParams[1] = CUtilityWeb.AddParameter("ProjectName", SqlDbType.VarChar, 100, ProjectName, ParameterDirection.Input);
            sqlParams[2] = CUtilityWeb.AddParameter("BusinessUnit", SqlDbType.VarChar, 100, DBNull.Value, ParameterDirection.Input);

            DataTable dtResult;
            string strCaption, strChartSWF, strChartMetricsUsed, strChartDescription, strXMLDATA, strNumberSuffix, strSubCaption;
            int SYaxisSeriesNo = 0;
            using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                dtResult = ExecuteDataTable("RPT_ChairmanProjectTeamMemberNames_SP", Conn, sqlParams);
            }

            StringBuilder strXML = new StringBuilder();

            strXML.Append("<chart caption='Team Members' >");

            foreach (DataRow DR in dtResult.Rows)
            {
                strXML.Append("<set label='" + HttpUtility.HtmlEncode(ProjectName) + " >>> " + DR["Name"].ToString() + ": " + HttpUtility.HtmlEncode(DR["Role"].ToString()) + "' Value='" + DR["Role"].ToString() + "'/>");
            }

            strXML.Append("</chart>");

            Functions functionForWriter = new Functions();
            functionForWriter.Write(strXML.ToString());
        }

        private void ManagementProject_Issue_Details()
        {
            string ProjectName = "";

            if (Request.QueryString["ProjectName"] != null)
                ProjectName = Request.QueryString["ProjectName"].ToString();

            SqlParameter[] sqlParams = new SqlParameter[3];
            sqlParams[0] = CUtilityWeb.AddParameter("Year", SqlDbType.VarChar, 100, "2009", ParameterDirection.Input);
            sqlParams[1] = CUtilityWeb.AddParameter("ProjectName", SqlDbType.VarChar, 100, ProjectName, ParameterDirection.Input);
            sqlParams[2] = CUtilityWeb.AddParameter("BusinessUnit", SqlDbType.VarChar, 100, DBNull.Value, ParameterDirection.Input);

            DataTable dtResult;
            string strCaption, strChartSWF, strChartMetricsUsed, strChartDescription, strXMLDATA, strNumberSuffix, strSubCaption;
            int SYaxisSeriesNo = 0;
            using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                dtResult = ExecuteDataTable("RPT_ChairmanProjectIssueDetails_SP", Conn, sqlParams);
            }

            StringBuilder strXML = new StringBuilder();

            strXML.Append("<chart caption='Issue Details' >");

            foreach (DataRow DR in dtResult.Rows)
            {
                strXML.Append("<set label='" + HttpUtility.HtmlEncode(ProjectName) + " >>> " + DR["DEscription"].ToString() + ": " + HttpUtility.HtmlEncode(DR["AssignedTo"].ToString()) + "' Value='" + DR["AssignedTo"].ToString() + "'/>");
            }

            strXML.Append("</chart>");

            Functions functionForWriter = new Functions();
            functionForWriter.Write(strXML.ToString());
        }

        private void ManagementProject_Weekly_Details()
        {
            string ProjectName = "";

            if (Request.QueryString["ProjectName"] != null)
                ProjectName = Request.QueryString["ProjectName"].ToString();

            SqlParameter[] sqlParams = new SqlParameter[3];
            sqlParams[0] = CUtilityWeb.AddParameter("BusinessUnit", SqlDbType.VarChar, 100, DBNull.Value, ParameterDirection.Input);
            sqlParams[1] = CUtilityWeb.AddParameter("ProjectManagerName", SqlDbType.VarChar, 100, DBNull.Value, ParameterDirection.Input);
            sqlParams[2] = CUtilityWeb.AddParameter("ProjectName", SqlDbType.VarChar, 100, ProjectName, ParameterDirection.Input);

            DataTable dtResult;
            string strCaption, strChartSWF, strChartMetricsUsed, strChartDescription, strXMLDATA, strNumberSuffix, strSubCaption;
            int SYaxisSeriesNo = 0;
            using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                dtResult = ExecuteDataTable("RPT_ChairmanSpecialProjectStatus_SP", Conn, sqlParams);
            }

            StringBuilder strXML = new StringBuilder();

            strXML.Append("<chart caption='Weekly DEtails' numberItemsPerPage='1'>");

            foreach (DataRow DR in dtResult.Rows)
            {
                strXML.Append("<set label='Week " + HttpUtility.HtmlEncode(DR["WeekXOfY"].ToString()) + " >>> " + HttpUtility.HtmlEncode(DR["StatusNotes"].ToString()) + "' Value='" + DR["WeekXOfY"].ToString() + "'/>");
            }

            strXML.Append("</chart>");

            Functions functionForWriter = new Functions();
            functionForWriter.Write(strXML.ToString());
        }


        public String GenerateXMlforPieChart(DataTable DataToTransform,
        int SYAxisSeriesNo, string strCaption, string strSubCaption,
        string numberPrefix, string strSNumberSuffix,
        int showValues, int animation, string DrillDownLink, string ColorPalette)
        {
            StringBuilder sbXMLData = new StringBuilder();
            StringBuilder sbXAxis = new StringBuilder();
            StringBuilder sbCategories = new StringBuilder();

            StringBuilder sbSeries = new StringBuilder();

            string[] SeriesColNames = new string[DataToTransform.Columns.Count - 1];
            string XAxisColName = DataToTransform.Columns[0].ColumnName;
            int index;
            for (index = 1; index < DataToTransform.Columns.Count; index++)
            {
                SeriesColNames[index - 1] = DataToTransform.Columns[index].ColumnName;
            }

            sbXMLData.AppendFormat("<chart caption='{2}' subcaption='{3}'  formatNumberScale='0' numberSuffix='' showValues='1' showPercentInToolTip='1' >",
                SeriesColNames[0], SeriesColNames[SeriesColNames.Length - 1],
                strCaption, strSubCaption,
            numberPrefix, strSNumberSuffix,
            showValues, animation);


            foreach (DataRow drSeriesRow in DataToTransform.Rows)
            {
                string DrillDownlLinkResolved = "";

                if (DrillDownLink != null)
                {
                    DrillDownlLinkResolved = " link='" +
                    HttpUtility.UrlEncode(DrillDownLink.Replace("%PieValue", drSeriesRow[0].ToString())) + "' ";
                }
                string SeriesColor;
                if (ColorPalette != null && ColorPalette != "")
                {
                    SeriesColor = "color='" + GetSereisColor(ColorPalette, drSeriesRow[0].ToString()) + "'";
                }
                else
                {
                    SeriesColor = "";
                }


                sbSeries.AppendFormat("<set label='{0}' value='{1}' {2} {3} />", drSeriesRow[0].ToString(), drSeriesRow[1].ToString(), DrillDownlLinkResolved, SeriesColor);

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
                string YAxisValue, XAxisValue, SeriesName, DrillDownlLinkResolved;
                XAxisValue = DrillDownlLinkResolved = SeriesName = "";
                //arrData[index, 0] = drSeriesCategory[0].ToString();
                XAxisValue = drSeriesCategory[0].ToString();
                sbCategories.AppendFormat("<category label='{0}' />", drSeriesCategory[0].ToString());
                index++; seriesIndex = 0;
                foreach (DataRow drSeriesname in dtSeriesNames.Rows)
                {
                    DataRow[] dr = DataToTransform.Select(SeriesColNames[0].ToString() + " ='" + drSeriesCategory[0].ToString() + "' and " + SeriesColNames[2].ToString() + " = '" + drSeriesname[0].ToString() + "'");



                    SeriesName = drSeriesname[0].ToString();



                    if (dr.Length != 0)
                    {
                        YAxisValue = dr[0][1].ToString();
                        if (DrillDownLink != null && DrillDownLink != "" && DrillDownLink.Contains("%"))
                        {
                            DrillDownlLinkResolved = " link='" +
                                 HttpUtility.UrlEncode(DrillDownLink.Replace("%SeriesName", SeriesName).Replace("%XAxisValue", XAxisValue).Replace("%YAxisValue", YAxisValue)) + "' ";
                        }
                        sbSeries[seriesIndex].AppendFormat("<set value='{0}' {1} />", dr[0][1].ToString(), DrillDownlLinkResolved);
                    }
                    else
                    {
                        YAxisValue = "";
                        sbSeries[seriesIndex].AppendFormat("<set value='' {0} />", DrillDownlLinkResolved);
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

        public String GetSimpleData(DataTable DataToTransform,
    int SYAxisSeriesNo,
    string ToolTip, string DrillDownLink
    )
        {
            string YSeriesRenderType = "";
            int DYSeriesIndex = 0;
            IndexedDictionary<string, string> SeriesRenderType = new IndexedDictionary<string, string>();

            string[] arrSeriesRenderType; //= YSeriesRenderType.Split(new char[] { '|' });
            if (YSeriesRenderType != "")
            {
                arrSeriesRenderType = YSeriesRenderType.Split(new char[] { '|' });
                for (int iLoop = 0; iLoop < arrSeriesRenderType.Length; iLoop++)
                {
                    string[] arrSRT = arrSeriesRenderType[iLoop].Split(new char[] { ',' });
                    SeriesRenderType.Add(arrSRT[0].ToString(), arrSRT[1]);
                }
            }
            StringBuilder sbXMLData = new StringBuilder();
            StringBuilder sbXAxis = new StringBuilder();
            StringBuilder sbCategories = new StringBuilder();

            StringBuilder[] sbSeries = new StringBuilder[DataToTransform.Columns.Count - 1];

            string[] SeriesColNames = new string[DataToTransform.Columns.Count - 1];
            string XAxisColName = DataToTransform.Columns[0].ColumnName;
            int index;
            for (index = 1; index < DataToTransform.Columns.Count; index++)
            {
                SeriesColNames[index - 1] = DataToTransform.Columns[index].ColumnName;
            }

            //Initialize <categories> element - necessary to generate a multi-series chart
            sbCategories.Append("<categories>");

            //Initiate <dataset> elements
            index = 0;

            foreach (string SeriesColName in SeriesColNames)
            {

                string RenderAs, parentYAxis;
                RenderAs = "";
                if (SeriesRenderType.ContainsKey((index + 2).ToString()))
                {
                    RenderAs = string.Format("renderAs='{0}'", SeriesRenderType[(index + 2).ToString()]);
                }
                //parentYAxis = "";
                //if ((DYSeriesIndex - 2) <= index)
                //{
                //    parentYAxis = "parentYAxis='S'";
                //}
                sbSeries[index] = new StringBuilder(String.Format("<dataset seriesName='{0}' {1}>", CUtilityWeb.BreakCamelCase(SeriesColName), RenderAs));

                index++;
            }
            ToolTip = ToolTip == null ? "" : ToolTip;
            DrillDownLink = DrillDownLink == null ? "" : DrillDownLink;

            foreach (DataRow drSeriesRow in DataToTransform.Rows)
            {
                sbCategories.AppendFormat("<category label='{0}' />", drSeriesRow[XAxisColName].ToString());
                //Add <set value='...' /> to both the datasets

                for (index = 0; index < SeriesColNames.Length; index++)
                {
                    string SeriesName = SeriesColNames[index];
                    string YAxisValue = (drSeriesRow[SeriesColNames[index]].ToString() == "") ? "" : drSeriesRow[SeriesColNames[index]].ToString();
                    string XAxisValue = drSeriesRow[XAxisColName].ToString();
                    string ToolText = "";
                    string DrillDownlLinkResolved = "";

                    if (ToolTip != "")
                    {

                        if (ToolTip.Contains("%"))
                        {
                            ToolText = " toolText=\'" + ToolTip.Replace("%SeriesName", SeriesName).Replace("%YAxisValue", YAxisValue).Replace("%XAxisValue", XAxisValue) + "'";
                        }
                        else
                        {
                            ToolText = " toolText=\'" + ToolTip + "'";
                        }

                    }
                    if (DrillDownLink != "")
                    {
                        if (DrillDownLink.Contains("%"))
                        {
                            DrillDownlLinkResolved = " link='" + HttpUtility.UrlEncode(DrillDownLink.Replace("%SeriesName", SeriesName).Replace("%XAxisValue", XAxisValue).Replace("%YAxisValue", YAxisValue)) + "' ";
                        }
                        else
                        {
                            DrillDownlLinkResolved = " link=\'" + DrillDownLink + "\'";
                        }
                    }
                    sbSeries[index].AppendFormat("<set value='{0}' {1} {2} />", YAxisValue, ToolText, DrillDownlLinkResolved);

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

            return sbXMLData.ToString();
        }

        public String GenerateXMLforStack(DataTable DataToTransform,
            int SYAxisSeriesNo, string strCaption, string strSubCaption,
            string numberPrefix, string strSNumberSuffix,
            int showValues, int animation, string DrillDownLink, string ColorPalette, string[] OrderedSeriesNames
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

            DataTable dtSeriesName = new DataTable();
            dtSeriesName = DataToTransform.DefaultView.ToTable(true, SeriesColNames[2].ToString());


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
                dtSeriesName = dtOrderedSeries;
            }
            //dtSeriesName.Rows.Add((dtSeriesName.NewRow()));
            //dtSeriesName.Rows[0][0] = "Report";
            //dtSeriesName.Rows.Add((dtSeriesName.NewRow()));
            //dtSeriesName.Rows[1][0] = "New Request";
            //dtSeriesName.Rows.Add((dtSeriesName.NewRow()));
            //dtSeriesName.Rows[2][0] = "Implementation";
            //dtSeriesName.Rows.Add((dtSeriesName.NewRow()));
            //dtSeriesName.Rows[3][0] = "Change Request";

            StringBuilder[] sbSeries = new StringBuilder[dtSeriesName.Rows.Count];

            //Initialize <chart> element //bgcolor='#F7F0D6'  labeldisplay='ROTATE'
            sbXMLData.AppendFormat("<chart palette='2' bgcolor='#FFFFFF' border='0'  caption='{2}' subcaption='{3}' setAdaptiveYMin = '1'  yAxisValuesStep='1'   yAxisName='{0}' SyAxisName='{1}' numberPrefix='{4}' SnumberSuffix='{5}' formatNumberScale='0' showValues='{6}' decimals='0' useRoundEdges='1' exportEnabled='1' exportShowMenuItem='1' exportHandler='/ExportHandler/ASP_Net/FCExporter.aspx' exportAtClient='0' exportAction='download'>",
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
                // sbSeries[index] = new StringBuilder(String.Format("<dataset seriesName='{0}' color='{1}'>", drSeriesname[0].ToString(), strArrColor[index]));
                sbSeries[index] = new StringBuilder(String.Format("<dataset seriesName='{0}' >", drSeriesname[0].ToString()));

                index++;
            }


            Dictionary<string, string> AddedXAxisValue = new Dictionary<string, string>();
            foreach (DataRow drSeriesRow in DataToTransform.Rows)
            {
                string XAxisValue = drSeriesRow[XAxisColName].ToString();

                if (!AddedXAxisValue.ContainsKey(XAxisValue))
                {
                    AddedXAxisValue.Add(XAxisValue, XAxisValue);
                    sbCategories.AppendFormat("<category label='{0}' />", HttpUtility.HtmlEncode(XAxisValue));
                    //Add <set value='...' /> to both the datasets

                    index = 0;
                    foreach (DataRow drSeriesname in dtSeriesName.Rows)
                    {
                        //DataRow[] dr = DataToTransform.Select(@"ProjectStatus ='" + drSeriesRow[XAxisColName].ToString() + "' and RequestType = '" + drSeriesname[0].ToString() + "'");
                        string SeriesName = "", YAxisValue = "";
                        SeriesName = drSeriesname[0].ToString();

                        DataRow[] dr = DataToTransform.Select(SeriesColNames[0].ToString() + " ='" + XAxisValue + "' and " + SeriesColNames[2].ToString() + " = '" + SeriesName + "'");
                        string DrillDownlLinkResolved = "";
                        string SeriesColor;
                        if (ColorPalette != null && ColorPalette != "")
                        {
                            SeriesColor = "color='" + GetSereisColor(ColorPalette, SeriesName) + "'";
                        }
                        else
                        {
                            SeriesColor = "";
                        }
                        if (dr.Length != 0)
                        {
                            YAxisValue = dr[0][1].ToString();
                            if (DrillDownLink != null && DrillDownLink != "")
                            {
                                if (DrillDownLink != "" && DrillDownLink.Contains("%"))
                                {
                                    DrillDownlLinkResolved = " link='" +
                                         HttpUtility.UrlEncode(DrillDownLink.Replace("%SeriesName", SeriesName).Replace("%XAxisValue", XAxisValue).Replace("%YAxisValue", YAxisValue)) + "' ";
                                }
                            }
                            sbSeries[index].AppendFormat("<set value='{0}' {1} {2} />", YAxisValue, DrillDownlLinkResolved, SeriesColor);
                        }

                        else
                        {
                            YAxisValue = "";
                            if (DrillDownLink != null && DrillDownLink != "")
                            {
                                if (DrillDownLink != "" && DrillDownLink.Contains("%"))
                                {
                                    DrillDownlLinkResolved = " link='" +
                                        HttpUtility.UrlEncode(DrillDownLink.Replace("%SeriesName", SeriesName).Replace("%XAxisValue", XAxisValue).Replace("%YAxisValue", YAxisValue)) + "' ";
                                }
                            }

                            sbSeries[index].AppendFormat("<set value='{0}' {1} {2} />", YAxisValue, DrillDownlLinkResolved, SeriesColor);
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

        public static String GenerateXMLForMultiDualAxis(DataTable DataToTransform,
                    int SYAxisSeriesNo, string strCaption, string strSubCaption,
                    string numberPrefix, string strSNumberSuffix,
                    int showValues, int animation, string DrillDownLink
                    )
        {
            StringBuilder sbXMLData = new StringBuilder();
            StringBuilder sbXAxis = new StringBuilder();
            StringBuilder sbCategories = new StringBuilder();

            StringBuilder[] sbSeries = new StringBuilder[DataToTransform.Columns.Count - 1];

            string[] SeriesColNames = new string[DataToTransform.Columns.Count - 1];
            string XAxisColName = DataToTransform.Columns[0].ColumnName;
            int index;
            for (index = 1; index < DataToTransform.Columns.Count; index++)
            {
                SeriesColNames[index - 1] = DataToTransform.Columns[index].ColumnName;
            }

            //Initialize <chart> element //bgcolor='#F7F0D6'  labeldisplay='ROTATE'
            if (SYAxisSeriesNo > -1)
            {

                sbXMLData.AppendFormat("<chart palette='4' bgcolor='#FFFFFF' border='0' caption='{3}' subcaption='{4}'  PYAxisName='{0}/{1}' SYAxisName='Yearly Count' numberPrefix='{5}' SnumberSuffix='{6}' formatNumberScale='0' showValues='{7}' decimals='0' useRoundEdges='1' exportEnabled='1' exportShowMenuItem='1' exportHandler='/ExportHandler/ASP_Net/FCExporter.aspx' exportAtClient='0' exportAction='download'>",
        SeriesColNames[0], SeriesColNames[1], SeriesColNames[SeriesColNames.Length - 1],
        strCaption, strSubCaption,
    numberPrefix, strSNumberSuffix,
    showValues, animation);
            }
            else
            {
                sbXMLData.AppendFormat("<chart palette='4' bgcolor='#FFFFFF' border='0' caption='{3}' subcaption='{4}'  YAxisName='{0}/{1}' numberPrefix='{5}' SnumberSuffix='{6}' formatNumberScale='0' showValues='{7}' decimals='0' useRoundEdges='1' exportEnabled='1' exportShowMenuItem='1' exportHandler='/ExportHandler/ASP_Net/FCExporter.aspx' exportAtClient='0' exportAction='download'>",
    SeriesColNames[0], SeriesColNames[1], SeriesColNames[SeriesColNames.Length - 1],
    strCaption, strSubCaption,
    numberPrefix, strSNumberSuffix,
    showValues, animation);
            }

            //Initialize <categories> element - necessary to generate a multi-series chart
            sbCategories.Append("<categories>");

            //Initiate <dataset> elements
            index = 0;

            foreach (string SeriesColName in SeriesColNames)
            {
                if (index >= SYAxisSeriesNo - 1 && SYAxisSeriesNo > 0)
                {
                    sbSeries[index] = new StringBuilder(String.Format("<dataset seriesName='{0}' parentYAxis='S'>", SeriesColName));
                }
                else
                {
                    sbSeries[index] = new StringBuilder(String.Format("<dataset seriesName='{0}'>", SeriesColName));
                }
                index++;
            }
            foreach (DataRow drSeriesRow in DataToTransform.Rows)
            {
                sbCategories.AppendFormat("<category name='{0}' />", drSeriesRow[XAxisColName].ToString());
                //Add <set value='...' /> to both the datasets
                string SeriesName = "", YAxisValue = "", XAxisValue = "";
                string DrillDownlLinkResolved = "";


                for (index = 0; index < SeriesColNames.Length; index++)
                {
                    YAxisValue = drSeriesRow[SeriesColNames[index]].ToString();
                    XAxisValue = drSeriesRow[XAxisColName].ToString();
                    SeriesName = SeriesColNames[index].ToString();
                    if (DrillDownLink != "" && DrillDownLink.Contains("%"))
                    {
                        DrillDownlLinkResolved = " link='" +
                             HttpUtility.UrlEncode(DrillDownLink.Replace("%SeriesName", SeriesName).Replace("%XAxisValue", XAxisValue).Replace("%YAxisValue", YAxisValue)) + "' ";
                    }
                    sbSeries[index].AppendFormat("<set value='{0}'  {1} />", drSeriesRow[SeriesColNames[index]].ToString(), DrillDownlLinkResolved);
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