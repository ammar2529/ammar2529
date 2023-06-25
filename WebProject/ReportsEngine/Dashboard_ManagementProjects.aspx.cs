using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using PWC.PresentationServices.Web.UI.WebControls;
using InfoSoftGlobal;
using System.Drawing;
using WebProject.eForms.Web.UI.Page;
using System;
using System.Data;
using System.Web.UI.WebControls;
using System.Web;

namespace WebProject.ReportsEngine
{
    public partial class Dashboard_ManagementProjects : System.Web.UI.Page
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
        Dictionary<string, string> SeriesColors = new Dictionary<string, string>();
        Dictionary<string, Dictionary<string, string>> ColorPalette = new Dictionary<string, Dictionary<string, string>>();

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
                //btnRenderGraph.Attributes.Add("onclick", "return UpdateEmployeeChart(" + ddlMonth.ClientID  + ")");
                StringBuilder SBInitScript = new StringBuilder(4096);
                SBInitScript.Append(
               "\t\nvar myFrm= new Object();" +
               "\t\nfunction initScript(){" +
               //"\t\n myFrm.rblSelectedGraph_0=document.forms[0]." + rblSelectedGraph.ClientID + "_0;" +
               //"\t\n myFrm.rblSelectedGraph_1=document.forms[0]." + rblSelectedGraph.ClientID + "_1;" +


               "\t\n myFrm.rblBusinessCategory_0=document.forms[0]." + rblBusinessCategory.ClientID + "_0;" +
               "\t\n myFrm.rblBusinessCategory_1=document.forms[0]." + rblBusinessCategory.ClientID + "_1;" +
               "\t\n myFrm.rblBusinessCategory_2=document.forms[0]." + rblBusinessCategory.ClientID + "_2;" +

               "\t\n myFrm.rblBusinessGroup_0=document.forms[0]." + rblBusinessGroup.ClientID + "_0;" +
               "\t\n myFrm.rblBusinessGroup_1=document.forms[0]." + rblBusinessGroup.ClientID + "_1;" +
               "\t\n myFrm.rblBusinessGroup_2=document.forms[0]." + rblBusinessGroup.ClientID + "_2;" +
               "\t\n myFrm.rblBusinessGroup_3=document.forms[0]." + rblBusinessGroup.ClientID + "_3;" +
               "\t\n myFrm.rblBusinessGroup_4=document.forms[0]." + rblBusinessGroup.ClientID + "_4;" +
               "\t\n myFrm.ddlInfrastructure=document.forms[0]." + ddlInfrastructure.ClientID + ";" +

               //"\t\n myFrm.chkPlannedTasks=document.forms[0]." + rblSelectedSeries.ClientID + "_0;" +
               //"\t\n myFrm.chkUnplannedTasks=document.forms[0]." + rblSelectedSeries.ClientID + "_1;" +
               //"\t\n myFrm.chkAttendance=document.forms[0]." + rblSelectedSeries.ClientID + "_2;" +

               "\t\n myFrm.rblBusinessCategory_0.onclick=Update_BG_Category;" +
               "\t\n myFrm.rblBusinessCategory_1.onclick=Update_BG_Category;" +
               "\t\n myFrm.rblBusinessCategory_2.onclick=Update_BG_Category;" +

               "\t\n myFrm.rblBusinessGroup_0.onclick=Update_BG_Category;" +
               "\t\n myFrm.rblBusinessGroup_1.onclick=Update_BG_Category;" +
               "\t\n myFrm.rblBusinessGroup_2.onclick=Update_BG_Category;" +
               "\t\n myFrm.rblBusinessGroup_3.onclick=Update_BG_Category;" +
               "\t\n myFrm.rblBusinessGroup_4.onclick=Update_BG_Category;" +

               //"\t\n myFrm.rblSelectedGraph_0.onclick = ShowProjectGrid;" +
               //"\t\n myFrm.rblSelectedGraph_1.onclick = ShowProjectGrid;" +

               ";\t\n" +
               //"ShowProjectGrid();" +
               @"
        }

"

               );
                //            SBInitScript.Append(
                //    @"   function ShowProjectGrid()
                //     {
                //        if(myFrm.rblSelectedGraph_0.checked)
                //        {
                //            document.getElementById(""divrblSelectedGraph_0"").style.display= '';
                //            document.getElementById(""divrblSelectedGraph_1"").style.display= 'none';
                //            document.getElementById(""rowEmployeeDetailOptions"").style.display= 'none';
                //        }
                //        else //if(myFrm.rblSelectedGraph_1.checked)
                //        {
                //            document.getElementById(""divrblSelectedGraph_0"").style.display= 'none';
                //            document.getElementById(""divrblSelectedGraph_1"").style.display= '';
                //
                //            document.getElementById(""rowEmployeeDetailOptions"").style.display= 'none';
                //
                //        }
                //
                //      }
                //");
                return string.Format(@"
<script language=""javascript"" type=""text/javascript"">
    {0}                
</script>", SBInitScript.ToString());

            }
        }
        protected void Page_PreInit(object sender, EventArgs e)
        {

            SeriesColors.Add("Infrastructure", "FF8D45"); //Red
            SeriesColors.Add("DGS", "AFD8F8"); //Blue
            SeriesColors.Add("Corporate", "F6BD0E"); //Orange
            SeriesColors.Add("GIL", "8ABA00"); //Green

            ColorPalette.Add("CustomPalette", SeriesColors);

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
            //ddlMonth.SelectedIndex  = DateTime.Now.Month - 1;

            string SQLInfraStructureList = @"
select 'First Value' as DataColumn union
select 'Second Value' as DataColumn union
select 'Third Value' as DataColumn union
select 'Fourth Value' as DataColumn 
";
            using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                DataTable dtInfrastructureList = CUtilityWeb.getDataTable(SQLInfraStructureList, Conn);
                ddlInfrastructure.DataTextField = dtInfrastructureList.Columns[0].ColumnName;
                ddlInfrastructure.DataValueField = dtInfrastructureList.Columns[0].ColumnName;
                ddlInfrastructure.DataSource = dtInfrastructureList;
                ddlInfrastructure.DataBind();
                ddlInfrastructure.Attributes.Add("style", "display:none");
                ddlInfrastructure.CssClass = "PWCDropDownList";
            }
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
            //return FusionCharts.RenderChart("FusionCharts/SSGrid.swf?ChartNoDataText=Project Member Details", "", "<chart></chart>", "Chart_S_1", "600", "200", false, true);
        }

        public string LoadChart_S_2()
        {
            SqlParameter[] sqlParams = null;// new SqlParameter[1];
                                            //sqlParams[0] = CUtilityWeb.AddParameter("ProjectType", SqlDbType.VarChar, 100, "Business Process Automation", ParameterDirection.Input);

            DataTable dtResult;
            string strCaption, strChartSWF, strChartMetricsUsed, strChartDescription, strXMLDATA, strNumberSuffix;
            int SYaxisSeriesNo = 0;

            using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                // dtResult = ExecuteDataTable("RPT_ITSSDProjects_SP", Conn, sqlParams);
                dtResult = ExecuteDataTable("RPT_ChairmanNumberOfProjects_SP", Conn, sqlParams);
            }

            strCaption = "Number of Projects";
            strChartSWF = "StackedColumn3D.swf";
            //strXMLDATA = GenerateXMLforStack(dtResult, SYaxisSeriesNo, strCaption, null, null, "", 0, 0, "P-detailsPopUp,width=800,height=585,toolbar=no,location=no,menubar=no,directories=0,resizable=no-gridviewer.aspx?NextReportID=ITSSDProjectsDetails&ProjectType=Business Process Automation&RequestType=%SeriesName&ProjectStatus=%XAxisValue", null, new string[] { "New Request", "Change Request", "Implementation", "Report" });
            //strXMLDATA = GenerateXMLforStack(dtResult, SYaxisSeriesNo, strCaption, null, null, "", 0, 0, "javaScript:ProjectsInProgressDrillDown(\"" + "%SeriesName" + "\",\"" + "%XAxisValue" + "\");", null, new string[] { "New Request", "Change Request", "Implementation", "Report" });
            //strXMLDATA = GenerateXMlforPieChart(dtResult, SYaxisSeriesNo, strCaption, strSubCaption, null, "", 0, 0, "javaScript:LiveFunctionDrillDown(\"" + "%PieValue" + "\",\"" + BusinessGroup + "\");", null);

            strXMLDATA = "<chart palette='4' showLegend='0' labelDisplay='Rotate' slantLabels='1' bgcolor='#FFFFFF' border='0'  caption='" + strCaption + "' subcaption=''   numberPrefix='' SnumberSuffix='' formatNumberScale='0' showValues='0' decimals='0' useRoundEdges='1' >";

            strXMLDATA += GetSimpleData(dtResult, SYaxisSeriesNo, null, "javaScript:ManagementProjectDuration(\"" + "%XAxisValue" + "\");");

            strXMLDATA += "</chart>";

            return FusionCharts.RenderChart("FusionCharts/MSColumn3D.swf", "", strXMLDATA.ToString(), "Chart_S_2", "400", "300", false, true);
        }

        public string LoadChart_S_3()
        {
            return FusionCharts.RenderChart("FusionCharts/StackedBar2D.swf?ChartNoDataText=Select an option to show project details", "", "<chart></chart>", "Chart_S_3", "400", "300", false, true);
        }

        public string LoadChart_S_4()
        {
            return FusionCharts.RenderChart("FusionCharts/MSColumn3D.swf?ChartNoDataText=Project Members", "", "<chart></chart>", "Chart_S_4", "400", "300", false, true);
        }

        public string LoadChart_S_5()
        {
            return "";
            //return FusionCharts.RenderChart("FusionCharts/MSColumn3D.swf?ChartNoDataText=Project Cost", "", "<chart></chart>", "Chart_S_5", "150", "250", false, true);
        }
        public string LoadChart_S_6()
        {
            return "";
            //return FusionCharts.RenderChart("FusionCharts/MSColumn3D.swf?ChartNoDataText=Project Expenses", "", "<chart></chart>", "Chart_S_6", "150", "250", false, true);
        }
        public string LoadChart_S_7()
        {
            return "";
            //return FusionCharts.RenderChart("FusionCharts/MSColumn3D.swf?ChartNoDataText=Project Issues", "", "<chart></chart>", "Chart_S_7", "150", "250", false, true);
        }

        public string LoadChart_S_8()
        {
            return FusionCharts.RenderChart("FusionCharts/SSGrid.swf?ChartNoDataText=Project Weekly Status", "", "<chart></chart>", "Chart_S_8", "400", "250", false, true);
        }

        //public string LoadChart_B_1()
        //{
        //    SqlParameter[] sqlParams = null;//new SqlParameter[1];
        //    //sqlParams[0] = CUtilityWeb.AddParameter("ProjectType", SqlDbType.VarChar, 100, "Business Process Automation", ParameterDirection.Input);

        //    DataTable dtResult;
        //    string strCaption, strChartSWF, strChartMetricsUsed, strChartDescription, strXMLDATA, strNumberSuffix, strSubCaption;
        //    int SYaxisSeriesNo = -1;
        //    using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
        //    {
        //        dtResult = ExecuteDataTable("RPT_ITSSDProjectsMonthlyTrend_sp", Conn, sqlParams);
        //    }

        //    strCaption = "Live Requests Monthly Trend : All Business Groups";
        //    strChartSWF = "MSColumn3D.swf";

        //    strXMLDATA = GenerateXMLForMultiSeries(dtResult, SYaxisSeriesNo, strCaption, "", null, "", 0, 0, "javaScript:LiveProjectsMonthlyDrillDown(\"" + "%XAxisValue" + "\",\"" + "%SeriesName" + "\");", null, new string[] { "New Request (BPA)", "Change Request (BPA)", "New Request (SSD)", "Change Request (SSD)", "Implementation", "Report" });

        //    return FusionCharts.RenderChart("FusionCharts/MSColumn3DLineDY.swf", "", strXMLDATA.ToString(), "Chart_B_1", "600", "350", false, true);
        //}

        //public string LoadChart_B_2()
        //{
        //    SqlParameter[] sqlParams = null;//new SqlParameter[1];
        //    //sqlParams[0] = CUtilityWeb.AddParameter("ProjectType", SqlDbType.VarChar, 100, "Business Process Automation", ParameterDirection.Input);

        //    DataTable dtResult;
        //    string strCaption, strChartSWF, strChartMetricsUsed, strChartDescription, strXMLDATA, strNumberSuffix, strSubCaption;
        //    int SYaxisSeriesNo = 0;
        //    using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
        //    {
        //        dtResult = ExecuteDataTable("RPT_ITSSDProjectsNextMonthsTrend_sp", Conn, sqlParams);
        //    }

        //    strCaption = "Planned Projects";
        //    strChartSWF = "MSColumn3D.swf";
        //    strXMLDATA = GenerateXMLForMultiSeries(dtResult, SYaxisSeriesNo, strCaption, "", null, "", 0, 0, null, null, new string[] { "New Request (BPA)", "Change Request (BPA)", "New Request (SSD)", "Change Request (SSD)", "Implementation", "Report" });

        //    return FusionCharts.RenderChart("FusionCharts/MSColumn3D.swf", "", strXMLDATA.ToString(), "Chart_B_2", "300", "350", false, true);

        //}

        //public string LoadChart_B_3()
        //{
        //    return "";

        //    int SelectedMonthNo, CurrentYear;

        //    CurrentYear = DateTime.Now.Year;
        //    SelectedMonthNo = 9;//ddlMonth.SelectedIndex + 1;

        //    string FirstDayOfMonth, LastDayOfMonth;

        //    FirstDayOfMonth = CurrentYear.ToString() + "/" + SelectedMonthNo.ToString() + "/01";
        //    LastDayOfMonth = CurrentYear.ToString() + "/" + SelectedMonthNo.ToString() + "/" + DateTime.DaysInMonth(CurrentYear, SelectedMonthNo);

        //    string SSQLTemplateCols = "SELECT FormId, ProcessName, Title, CONVERT(varchar(10), RequestedDate, 103) AS RequestedDate, CONVERT(varchar(10), BRAnalysisStartDate, 103) AS BRAnalysisStartDate, CONVERT(varchar(10), BRSubmitted, 103) AS BRSubmitted, CONVERT(varchar(10), BRSignedOff, 103) AS BRSignedOff, CONVERT(varchar(10), PlannedDevStartDate, 103) AS PlannedDevStartDate, CONVERT(varchar(10), PlannedDevEndDate, 103) AS PlannedDevEndDate, CONVERT(varchar(10), ReadyForUAT, 103) AS ReadyForUATStart, CONVERT(varchar(10), DATEADD(day, 1, ReadyForUAT), 103) AS ReadyForUATEnd,  LeadDeveloper, ISNULL(PercentageCompleted, 0) AS PercentageCompleted FROM ITSSDProjectsDetails WHERE (ReadyForUAT >= '" + FirstDayOfMonth + "') and (ReadyForUAT <= '" + LastDayOfMonth + "') and (ProjectStatus != 'Live')  order by ProcessName";
        //    DataTable dtTemplateCols;

        //    using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
        //    {
        //        dtTemplateCols = CUtilityWeb.getDataTable(SSQLTemplateCols, sqlConnection);
        //    }

        //    StringBuilder strXML = new StringBuilder();

        //    strXML.Append("<chart ganttWidthPercent='0' palette='2' caption='Project Timelines (September)' dateFormat='dd/mm/yyyy' outputDateFormat='ddds mns' >");

        //    strXML.Append("<categories>");

        //    for (int i = 1; i <= System.DateTime.DaysInMonth(CurrentYear, SelectedMonthNo); i++)
        //    {
        //        strXML.Append("<category start='" + i.ToString() + "/" + SelectedMonthNo.ToString() + "/" + CurrentYear.ToString() + "' end='" + i + "/" + SelectedMonthNo.ToString() + "/" + CurrentYear.ToString() + "' label='" + i.ToString() + "' />");
        //    }
        //    strXML.Append("<category start='01/" + (SelectedMonthNo + 1).ToString() + "/" + CurrentYear.ToString() + "' end='01/" + (SelectedMonthNo + 1).ToString() + "/" + CurrentYear.ToString() + "' label='Sat' />");

        //    strXML.Append("</categories>");

        //    strXML.Append("<processes headerText='Project Name, Title' headerFontSize='14' fontSize='12' headerVAlign='bottom' align='left' headerAlign='left'>");

        //    foreach (DataRow DR in dtTemplateCols.Rows)
        //    {
        //        strXML.Append("<process label='" + HttpUtility.UrlEncode(DR["ProcessName"].ToString()) + ", " + HttpUtility.UrlEncode(DR["Title"].ToString()) + "' id='" + DR["FormId"].ToString() + "'/>");
        //    }

        //    //strXML.Append("<process label='Terrace' id='TRC' />");
        //    //strXML.Append("<process label='Inspection' id='INS' />");
        //    //strXML.Append("<process label='Wood Work' id='WDW' />");
        //    //strXML.Append("<process label='Interiors' id='INT' />");
        //    strXML.Append("</processes>");

        //    //strXML.Append("<datatable headerVAlign='bottom'>");
        //    //strXML.Append("<datacolumn headerText='Title' headerFontSize='14' fontSize='12' headerVAlign='bottom' align='left' headerAlign='left'>");

        //    //foreach (DataRow DR in dtTemplateCols.Rows)
        //    //{
        //    //    strXML.Append("<text label='" + DR["LeadDeveloper"].ToString() + "' />");
        //    //}
        //    //strXML.Append("</datacolumn>");
        //    //strXML.Append("</datatable>");

        //    strXML.Append("<tasks showEndDate='0' showLabels='0'>");

        //    System.Globalization.DateTimeFormatInfo dateInfo = new System.Globalization.DateTimeFormatInfo();
        //    dateInfo.ShortDatePattern = "dd/MM/yyyy";

        //    DateTime dtDate = new DateTime();
        //    //dtDate = Convert.ToDateTime(strInvIssueDate, dateInfo);

        //    foreach (DataRow DR in dtTemplateCols.Rows)
        //    {
        //        //if (DR["RequestedDate"].ToString() != "" && DR["RequestedDate"].ToString() != null)
        //        //{
        //        //    dtDate = Convert.ToDateTime(DR["RequestedDate"].ToString(), dateInfo);

        //        //    //if (dtDate >= Convert.ToDateTime("07/01/2009"))
        //        //        strXML.Append("<task processId='" + DR["FormId"].ToString() + "' id='" + DR["FormId"].ToString() + "' start='" + DR["RequestedDate"].ToString() + "' end='" + DR["RequestedDate"].ToString() + "' label='Requested by Customer' percentComplete='100'/>");
        //        //}


        //        //if (DR["BRAnalysisStartDate"].ToString() != "" && DR["BRAnalysisStartDate"].ToString() != null)
        //        //{
        //        //    if (DR["BRSubmitted"].ToString() != "" && DR["BRSubmitted"].ToString() != null)
        //        //    {
        //        //        dtDate = Convert.ToDateTime(DR["BRAnalysisStartDate"].ToString(), dateInfo);

        //        //        //if (dtDate >= Convert.ToDateTime("07/01/2009"))
        //        //            strXML.Append("<task processId='" + DR["FormId"].ToString() + "' id='" + DR["FormId"].ToString() + "' start='" + DR["BRAnalysisStartDate"].ToString() + "' end='" + DR["BRSubmitted"].ToString() + "' label='Requirement Analysis Phase' percentComplete='100'/>");
        //        //    }
        //        //}

        //        //if (DR["BRSignedOff"].ToString() != "" && DR["BRSignedOff"].ToString() != null)
        //        //{
        //        //    dtDate = Convert.ToDateTime(DR["BRSignedOff"].ToString(), dateInfo);

        //        //    //if (dtDate >= Convert.ToDateTime("07/01/2009"))
        //        //        strXML.Append("<task processId='" + DR["FormId"].ToString() + "' id='" + DR["FormId"].ToString() + "' start='" + DR["BRSignedOff"].ToString() + "' end='" + DR["BRSignedOff"].ToString() + "' label='Requirement Signed Off by Customer' percentComplete='100'/>");
        //        //}

        //        //if (DR["PlannedDevStartDate"].ToString() != "" && DR["PlannedDevStartDate"].ToString() != null)
        //        //{
        //        //    if (DR["PlannedDevEndDate"].ToString() != "" && DR["PlannedDevEndDate"].ToString() != null)
        //        //    {
        //        //        dtDate = Convert.ToDateTime(DR["PlannedDevStartDate"].ToString(), dateInfo);

        //        //        //if (dtDate >= Convert.ToDateTime("07/01/2009"))
        //        //            strXML.Append("<task processId='" + DR["FormId"].ToString() + "' id='" + DR["FormId"].ToString() + "' start='" + DR["PlannedDevStartDate"].ToString() + "' end='" + DR["PlannedDevEndDate"].ToString() + "' label='Development Phase' percentComplete='" + DR["PercentageCompleted"].ToString() + "'/>");
        //        //    }
        //        //}

        //        if (DR["ReadyForUATStart"].ToString() != "" && DR["ReadyForUATStart"].ToString() != null)
        //        {
        //            dtDate = Convert.ToDateTime(DR["ReadyForUATStart"].ToString(), dateInfo);

        //            //if (dtDate >= Convert.ToDateTime("07/01/2009"))
        //            strXML.Append("<task height='15' processId='" + DR["FormId"].ToString() + "' id='" + DR["FormId"].ToString() + "' start='" + DR["ReadyForUATStart"].ToString() + "' end='" + DR["ReadyForUATEnd"].ToString() + "' label='Ready For UAT' percentComplete='100'/>");
        //        }

        //    }

        //    //strXML.Append("<task processId='TRC' start='5/8/2008' end='2/9/2008' id='5' color='4567aa' />");
        //    strXML.Append("</tasks>");

        //    strXML.Append("<trendlines>");

        //    List<string> Holidays = GetHolidays(SelectedMonthNo, CurrentYear);
        //    foreach (string Holiday in Holidays)
        //    {
        //        strXML.Append("<line  " + Holiday + " displayValue='' isTrendZone='1' alpha='20' color='FF5904'/>");

        //    }
        //    strXML.Append("</trendlines>");

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

        //    return FusionCharts.RenderChart("FusionWidgets/Gantt.swf", "", strXML.ToString(), "Chart_B_3", "1124", "400", false, false);
        //    return "";
        //}

        //public string LoadChart_B_4()
        //{
        //    int SelectedMonthNo, CurrentYear;

        //    CurrentYear = DateTime.Now.Year;
        //    SelectedMonthNo = 9;

        //    string FirstDayOfMonth, LastDayOfMonth;

        //    FirstDayOfMonth = CurrentYear.ToString() + "/" + SelectedMonthNo.ToString() + "/01";
        //    LastDayOfMonth = CurrentYear.ToString() + "/" + SelectedMonthNo.ToString() + "/" + DateTime.DaysInMonth(CurrentYear, SelectedMonthNo);

        //    string SSQLTemplateCols = "SELECT FormId, ProjectName, ChangeSummary,  CONVERT(varchar(10), DATEADD(day, 1, PlannedUATDate), 103) AS PlannedUATDate FROM EformsChangeRequestProcess WHERE (PlannedUATDate >= '" + FirstDayOfMonth + "') and (PlannedUATDate <= '" + LastDayOfMonth + "') and (StateId != 'ECRRequestCompleted')  order by ProjectName";
        //    DataTable dtTemplateCols;

        //    using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
        //    {
        //        dtTemplateCols = CUtilityWeb.getDataTable(SSQLTemplateCols, sqlConnection);
        //    }

        //    StringBuilder strXML = new StringBuilder();

        //    strXML.Append("<chart palette='2' caption='Project Timelines (September)' >");

        //    foreach (DataRow DR in dtTemplateCols.Rows)
        //    {
        //        strXML.Append("<set label='" + HttpUtility.UrlEncode(DR["ProjectName"].ToString()) + ", " + HttpUtility.UrlEncode(DR["ChangeSummary"].ToString()) + ", UAT Date: " + HttpUtility.UrlEncode(DR["PlannedUATDate"].ToString()) + "' Value='" + DR["PlannedUATDate"].ToString() + "'/>");
        //    }

        //    strXML.Append("</chart>");

        //    return FusionCharts.RenderChart("FusionCharts/SSGrid.swf", "", strXML.ToString(), "Chart_B_4", "300", "350", false, false);

        //}

        //public string LoadChart_B_5()
        //{
        //    return FusionCharts.RenderChart("FusionCharts/SSGrid.swf?ChartNoDataText=Select an option to show project details", "", "<chart></chart>", "Chart_B_5", "600", "350", false, true);
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
                    sbCategories.AppendFormat("<category label='{0}' />", HttpUtility.UrlEncode(XAxisValue));
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
            sbXMLData.AppendFormat("<chart palette='4' bgcolor='#FFFFFF' border='0'  caption='{3}' subcaption='{4}'  PYAxisName='{0}/{1}' SYAxisName='Yearly Count' numberPrefix='{5}' SnumberSuffix='{6}' formatNumberScale='0' showValues='{7}' decimals='0' useRoundEdges='1' exportEnabled='1' exportShowMenuItem='1' exportHandler='/ExportHandler/ASP_Net/FCExporter.aspx' exportAtClient='0' exportAction='download'>",
                SeriesColNames[0], SeriesColNames[1], SeriesColNames[SeriesColNames.Length - 1],
                strCaption, strSubCaption,
            numberPrefix, strSNumberSuffix,
            showValues, animation);


            //Initialize <categories> element - necessary to generate a multi-series chart
            sbCategories.Append("<categories>");

            //Initiate <dataset> elements
            index = 0;

            foreach (string SeriesColName in SeriesColNames)
            {
                if (index >= SYAxisSeriesNo - 1)
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
