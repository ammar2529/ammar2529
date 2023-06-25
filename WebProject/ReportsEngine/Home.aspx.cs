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
////using PWC.PresentationServices.Web.UI.WebControls;
////using PWC.PresentationServices.Web.UI.Common;
using InfoSoftGlobal;

namespace WebProject.ReportsEngine
{
    public partial class Home : System.Web.UI.Page
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
        public Dictionary<string, string> objHT = new Dictionary<string, string>();
        static string[] strArrColor = new string[] { "DA3608", "015887", "78AE1C", "011187", "011287", "011187", "019f87", "081187", "01ee77", "015687", "01f487", "011587", "01e387", "015487", "01f287", "01ee77", "015687", "01f487", "011587", "01e387", "015487", "01f287" };
        Dictionary<string, string> SeriesColors = new Dictionary<string, string>();
        Dictionary<string, Dictionary<string, string>> ColorPalette = new Dictionary<string, Dictionary<string, string>>();


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
                  //  debugger;
                  //  window.open(Link,null,'left=300, top=150, height=400, width= 600, status=n o, resizable= no, scrollbars= no, toolbar= no,location= no, menubar= no'); return false;
                     window.open(""./ExportData.aspx?{0}"",null,''); return false;

                }}
    </script>

", QueryURL.ToString());
            }

        }
        protected void Page_PreInit(object sender, EventArgs e)
        {
            //pnlWelcome.Visible = false;
            //pnlUnAuthrized.Visible = false;
            //Panel1.Visible = false;
            //pnlLowerBody.Visible = true;
            //dotnetCHARTING.Chart schart;
            ////schart.url
            //// InitMenuIDs();
            //ReportID = Request.QueryString["NextReportID"];
            //if (Request.QueryString["NextReportID"] != null && Request.QueryString["NextReportID"] == "UnderConstruction")
            //{

            //    lblReportGroup.Text = "";
            //    lblReportHead.Text = "Under Construction";
            //    lblReportShortDetail.Text = "Report is under construction and will be available soon!";
            //    lblReportLongDetail.Text = "";
            //}
            //else if (Request.QueryString["NextReportID"] != null)
            //{
            //    RPTHolder = new ReportHolder(Request.QueryString["NextReportID"]);
            //    GraphID = RPTHolder.ChartID;
            //    GridID = RPTHolder.GridID;
            //    SearchPanelID = RPTHolder.SearchPanelID;
            //    //---------------------Report Appreance-------------------------
            //    lblReportGroup.Text = RPTHolder.GroupHeading;
            //    lblReportHead.Text = RPTHolder.Heading;
            //    lblReportShortDetail.Text = RPTHolder.ShortDetail;
            //    lblReportLongDetail.Text = RPTHolder.LongDetail;

            //}
            //else
            //{
            //    GraphID = Request.QueryString["NextGraphID"];
            //    GridID = Request.QueryString["NextGridID"];
            //    SearchPanelID = Request.QueryString["NextSearchPanelID"];
            //    pnlLowerBody.Visible = false;
            //    pnlWelcome.Visible = true;
            //}

            //if (SearchPanelID != null)
            //{
            //    SearchPanelID = SearchPanelID.Trim();
            //    if (SearchPanelID != "")
            //    {
            //        SPanel = new SearchPanel(SearchPanelID, this);
            //        if (RPTHolder.IsSearchPanelVisible)
            //            Panel1.Visible = true;
            //        else
            //            Panel1.Visible = false;

            //    }
            //}
            //if (GraphID != null)
            //{
            //    GraphID = GraphID.Trim();
            //    if (GraphID != "")
            //    {
            //        GRPHolder = new GraphHolder(GraphID.ToString(), panelGraph);
            //    }
            //}

            //if (GridID != null)
            //{
            //    GridID = GridID.Trim();
            //    if (GridID.ToString() != "")
            //    {
            //        GRDHolder = new GridHolder(GridID.ToString(), PanelDGVMain, gvMain);
            //    }
            //}

            SeriesColors.Add("Infrastructure", "FF8D45"); //Red
            SeriesColors.Add("DGS", "AFD8F8"); //Blue
            SeriesColors.Add("Corporate", "F6BD0E"); //Orange
            SeriesColors.Add("GIL", "8ABA00"); //Green

            ColorPalette.Add("CustomPalette", SeriesColors);
        }
        protected void Page_InitComplete(object sender, EventArgs e)
        {

            pnlWelcome.Visible = false;
            pnlUnAuthrized.Visible = false;
            Panel1.Visible = false;
            pnlLowerBody.Visible = true;
            dotnetCHARTING.Chart schart;
            //schart.url
            // InitMenuIDs();
            ReportID = Request.QueryString["NextReportID"];
            if (Request.QueryString["NextReportID"] != null && Request.QueryString["NextReportID"] == "UnderConstruction")
            {

                lblReportHead.Text = "Under Construction";
                lblReportShortDetail.Text = "Report is under construction and will be available soon!";
                lblReportLongDetail.Text = "";
            }
            else if (Request.QueryString["NextReportID"] != null)
            {
                RPTHolder = new ReportHolder(Request.QueryString["NextReportID"]);
                GraphID = RPTHolder.ChartID;
                GridID = RPTHolder.GridID;
                SearchPanelID = RPTHolder.SearchPanelID;
                //---------------------Report Appreance-------------------------

                lblReportHead.Text = RPTHolder.Heading;
                lblReportShortDetail.Text = RPTHolder.ShortDetail;
                lblReportLongDetail.Text = RPTHolder.LongDetail;

            }
            else
            {
                GraphID = Request.QueryString["NextGraphID"];
                GridID = Request.QueryString["NextGridID"];
                SearchPanelID = Request.QueryString["NextSearchPanelID"];
                pnlLowerBody.Visible = false;
                pnlWelcome.Visible = true;
            }

            if (SearchPanelID != null)
            {
                SearchPanelID = SearchPanelID.Trim();
                if (SearchPanelID != "")
                {
                    SPanel = new SearchPanel(SearchPanelID, this);//,tblSearchPanel
                    if (RPTHolder.IsSearchPanelVisible)
                        Panel1.Visible = true;
                    else
                        Panel1.Visible = false;

                }
            }
            if (GraphID != null)
            {
                GraphID = GraphID.Trim();
                if (GraphID != "")
                {
                    GRPHolder = new GraphHolder(GraphID.ToString(), panelGraph);
                }
            }

            if (GridID != null)
            {
                GridID = GridID.Trim();
                if (GridID.ToString() != "")
                {
                    GRDHolder = new GridHolder(GridID.ToString(), PanelDGVMain, gvMain);
                }
            }

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


        public string ImageDirection(string posNeg)
        {
            //if (posNeg == "positive")
            //{
            //    if (Session[FWConstants.SessionVariableNames.DIRECTION].ToString().ToLower() == "rtl") return "rtl";
            //    else return "ltr";
            //}
            //else if (Session[FWConstants.SessionVariableNames.DIRECTION].ToString().ToLower() == "rtl") return "ltr";
            //else 

            return "ltr";
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
                //  FetchRoles(Session["EForms4UserId"].ToString());
            }

            Session["AuthorisedRoles"] = @"('SysRecipient','SysHistorySender','PWC_EformsTask_Team','PWC_EformsTask_Requestor','Pwc_IT_EFormsTechnicalTeam','PWC_EformsTask_Team','RPT_MobileBill','RPT_Admin')";

            lblErrorDetail.Visible = false;
            RPTSEC = (new ReportsSecurity(this, SlideMenu1));
            RPTSEC.AuthenticateUser();
            if (!RPTSEC.IsUserAuthorized())
            {

                if (Request.QueryString["NextReportID"] == null)
                {
                    pnlWelcome.Visible = true;
                    pnlUnAuthrized.Visible = false;
                }
                else
                {
                    pnlUnAuthrized.Visible = true;
                    pnlWelcome.Visible = false;

                }
                Panel1.Visible = false;
                pnlLowerBody.Visible = false;
            }
            RPTSEC.BuildTreeMenu();

        }

        void Page_LoadComplete(object sender, EventArgs e)
        {
            if (!RPTSEC.IsUserAuthorized()) return;

            Page.RegisterClientScriptBlock("ExportScript", OnClickScript);
            bool IsMenuInit = false;
            if (SPanel != null && GRPHolder != null)
            {
                try
                {
                    GRPHolder.QueryData(SPanel);
                }
                catch (Exception ex)
                {
                    lblErrorDetail.Visible = true;
                    lblErrorDetail.Text = ex.Message + "\r\n" + ex.Source + "\r\n" + ex.StackTrace;
                    if (ex.InnerException != null)
                    {
                        lblErrorDetail.Text += "\r\n\r\n\r\n--------------- Inner Exception -------------------\r\n\r\n\r\n";
                        lblErrorDetail.Text += ex.InnerException.Message + "\r\n" + ex.InnerException.Source + "\r\n" + ex.InnerException.StackTrace;
                    }
                }
            }
            else tblGraph.Attributes.Add("style", "display:none");
            if (SPanel != null && GRDHolder != null)
            {
                try
                {
                    GRDHolder.QueryData(SPanel);
                }
                catch (Exception ex)
                {
                    lblErrorDetail.Visible = true;
                    lblErrorDetail.Text = ex.Message + "\r\n" + ex.Source + "\r\n" + ex.StackTrace;
                    if (ex.InnerException != null)
                    {
                        lblErrorDetail.Text += "\r\n\r\n\r\n--------------- Inner Exception -------------------\r\n\r\n\r\n";
                        lblErrorDetail.Text += ex.InnerException.Message + "\r\n" + ex.InnerException.Source + "\r\n" + ex.InnerException.StackTrace;
                    }
                }
            }
            else tblGrid.Attributes.Add("style", "display:none");
            if (RPTHolder != null && SPanel != null && RPTHolder.ReportDepth != null)
                lblReportDepth.Text = SPanel.InsertParamValues(RPTHolder.ReportDepth, FieldValueType.Text);
        }
        void Page_Unload(object sender, EventArgs e)
        {
            //  throw new Exception("The method or operation is not implemented.");
            CUtilityWeb.CloseAllConnections();
        }


        public string LoadChart_S_1()
        {

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

            strCaption = "Process Usage Breakdown for Business Groups";
            strChartSWF = "Pie3D.swf";
            strSubCaption = "";// "(Click to see function wise breakdown on the next chart)";
            strChartMetricsUsed = "Total Usage, IPT Usage, Actual Monthly Cost, Non IPT Cost";
            strChartDescription = @"This will illustrate the potential savings of IPT implementation against the usage trends 
                                            <br/>This would allow us to track the usage and potential savings of IPT implementation";

            //strXMLDATA = GenerateXMlforPieChart(dtResult, SYaxisSeriesNo, strCaption, strSubCaption, null, "", 0, 0, "javaScript:LiveProcessDrillDown(\"" + "%PieValue" + "\");", "CustomPalette");

            strXMLDATA = GenerateXMlforPieChart(dtResult, SYaxisSeriesNo, strCaption, strSubCaption, null, "", 0, 0, "", "CustomPalette");

            return FusionCharts.RenderChart("FusionCharts/Pie3D.swf", "", strXMLDATA.ToString(), "Chart_S_1", "425", "300", false, false);

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

            sbXMLData.AppendFormat("<chart caption='{2}' bgAlpha='0,0' canvasBgAlpha='0' subcaption='{3}'  formatNumberScale='0' numberSuffix='' showValues='1' showPercentInToolTip='1' >",
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