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

namespace WebProject.ReportsEngine
{
    public partial class Layout_SS_B_B : System.Web.UI.Page
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
        static string[] strArrColor = new string[] { "DA3608", "015887", "78AE1C", "011187", "01ee87", "015587", "01ff87" };
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


               "\t\n myFrm.rblBusinessCategory_0=document.forms[0]." + rblBusinessCategory.ClientID + "_0;" +
               "\t\n myFrm.rblBusinessCategory_1=document.forms[0]." + rblBusinessCategory.ClientID + "_1;" +

               "\t\n myFrm.rblBusinessGroup_0=document.forms[0]." + rblBusinessGroup.ClientID + "_0;" +
               "\t\n myFrm.rblBusinessGroup_1=document.forms[0]." + rblBusinessGroup.ClientID + "_1;" +
               "\t\n myFrm.rblBusinessGroup_2=document.forms[0]." + rblBusinessGroup.ClientID + "_2;" +
               "\t\n myFrm.rblBusinessGroup_3=document.forms[0]." + rblBusinessGroup.ClientID + "_3;" +
               "\t\n myFrm.rblBusinessGroup_4=document.forms[0]." + rblBusinessGroup.ClientID + "_4;" +


               //"\t\n myFrm.chkPlannedTasks=document.forms[0]." + rblSelectedSeries.ClientID + "_0;" +
               //"\t\n myFrm.chkUnplannedTasks=document.forms[0]." + rblSelectedSeries.ClientID + "_1;" +
               //"\t\n myFrm.chkAttendance=document.forms[0]." + rblSelectedSeries.ClientID + "_2;" +

               "\t\n myFrm.rblBusinessCategory_0.onclick=Update_BG_Category;" +
               "\t\n myFrm.rblBusinessCategory_1.onclick=Update_BG_Category;" +

               "\t\n myFrm.rblBusinessGroup_0.onclick=Update_BG_Category;" +
               "\t\n myFrm.rblBusinessGroup_1.onclick=Update_BG_Category;" +
               "\t\n myFrm.rblBusinessGroup_2.onclick=Update_BG_Category;" +
               "\t\n myFrm.rblBusinessGroup_3.onclick=Update_BG_Category;" +
               "\t\n myFrm.rblBusinessGroup_4.onclick=Update_BG_Category;" +

               "\t\n myFrm.rblSelectedGraph_0.onclick = ShowProjectGrid;" +
               "\t\n myFrm.rblSelectedGraph_1.onclick = ShowProjectGrid;" +

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
            document.getElementById(""rowEmployeeDetailOptions"").style.display= 'none';
        }
        else //if(myFrm.rblSelectedGraph_1.checked)
        {
            document.getElementById(""divrblSelectedGraph_0"").style.display= 'none';
            document.getElementById(""divrblSelectedGraph_1"").style.display= '';

            document.getElementById(""rowEmployeeDetailOptions"").style.display= 'none';

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
        }
        protected void Page_InitComplete(object sender, EventArgs e)
        {

            //pnlWelcome.Visible = false;
            //pnlUnAuthrized.Visible = false;
            //Panel1.Visible = false;
            //pnlLowerBody.Visible = true;
            //dotnetCHARTING.Chart schart;
            //pnlMenuSearch.Visible = false;
            //schart.url
            // InitMenuIDs();
            ReportID = Request.QueryString["NextReportID"];
            if (Request.QueryString["NextReportID"] != null && Request.QueryString["NextReportID"] == "UnderConstruction")
            {

                //lblReportHead.Text = "Under Construction";
                //lblReportShortDetail.Text = "Report is under construction and will be available soon!";
                // lblReportLongDetail.Text = "";
            }
            else if (Request.QueryString["NextReportID"] != null)
            {
                RPTHolder = new ReportHolder(Request.QueryString["NextReportID"]);
                GraphID = RPTHolder.ChartID;
                GridID = RPTHolder.GridID;
                SearchPanelID = RPTHolder.SearchPanelID;
                //---------------------Report Appreance-------------------------

                //lblReportHead.Text = RPTHolder.Heading;
                //lblReportShortDetail.Text = RPTHolder.ShortDetail;
                //            lblReportLongDetail.Text = RPTHolder.LongDetail;

            }
            else
            {
                GraphID = Request.QueryString["NextGraphID"];
                GridID = Request.QueryString["NextGridID"];
                SearchPanelID = Request.QueryString["NextSearchPanelID"];
                //pnlLowerBody.Visible = false;
                //pnlWelcome.Visible = true;
            }

            //if (SearchPanelID != null)
            //{
            //    SearchPanelID = SearchPanelID.Trim();
            //    if (SearchPanelID != "")
            //    {
            //        SPanel = new SearchPanel(SearchPanelID, this, tblSearchPanel);
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

            //Session["AuthorisedRoles"] = @"('SysRecipient','SysHistorySender','PWC_EformsTask_Team','PWC_EformsTask_Requestor','Pwc_IT_EFormsTechnicalTeam','PWC_EformsTask_Team','RPT_MobileBill','RPT_Admin')";

            //lblErrorDetail.Visible = false;
            //RPTSEC = (new ReportsSecurity(this, SlideMenu1));
            //RPTSEC.AuthenticateUser();
            //if (!RPTSEC.IsUserAuthorized())
            //{

            //    if (Request.QueryString["NextReportID"] == null)
            //    {
            //        pnlWelcome.Visible = true;
            //        pnlUnAuthrized.Visible = false;
            //    }
            //    else
            //    {
            //        pnlUnAuthrized.Visible = true;
            //        pnlWelcome.Visible = false;

            //    }
            //    Panel1.Visible = false;
            //    pnlLowerBody.Visible = false;
            //}
            //RPTSEC.BuildTreeMenu();

            LoadMap_S_1();
            Literal ltrl = new Literal();
            ltrl.Text = InitScript;
            Header.Controls.Add(ltrl);
            ddlMonth.SelectedIndex = DateTime.Now.Month - 1;
        }
        void Page_LoadComplete(object sender, EventArgs e)
        {
            //    if (!RPTSEC.IsUserAuthorized()) return;

            //    Page.RegisterClientScriptBlock("ExportScript", OnClickScript);
            //    bool IsMenuInit = false;
            //    if (SPanel != null && GRPHolder != null)
            //    {
            //        try
            //        {
            //            GRPHolder.QueryData(SPanel);
            //        }
            //        catch (Exception ex)
            //        {
            //            lblErrorDetail.Visible = true;
            //            lblErrorDetail.Text = ex.Message + "\r\n" + ex.Source + "\r\n" + ex.StackTrace;
            //            if (ex.InnerException != null)
            //            {
            //                lblErrorDetail.Text += "\r\n\r\n\r\n--------------- Inner Exception -------------------\r\n\r\n\r\n";
            //                lblErrorDetail.Text += ex.InnerException.Message + "\r\n" + ex.InnerException.Source + "\r\n" + ex.InnerException.StackTrace;
            //            }
            //        }
            //    }
            //    else tblGraph.Attributes.Add("style", "display:none");
            //    if (SPanel != null && GRDHolder != null)
            //    {
            //        try
            //        {
            //            GRDHolder.QueryData(SPanel);
            //        }
            //        catch (Exception ex)
            //        {
            //            lblErrorDetail.Visible = true;
            //            lblErrorDetail.Text = ex.Message + "\r\n" + ex.Source + "\r\n" + ex.StackTrace;
            //            if (ex.InnerException != null)
            //            {
            //                lblErrorDetail.Text += "\r\n\r\n\r\n--------------- Inner Exception -------------------\r\n\r\n\r\n";
            //                lblErrorDetail.Text += ex.InnerException.Message + "\r\n" + ex.InnerException.Source + "\r\n" + ex.InnerException.StackTrace;
            //            }
            //        }
            //    }
            //    else tblGrid.Attributes.Add("style", "display:none");
            //    if (RPTHolder != null && SPanel != null && RPTHolder.ReportDepth != null)
            //        lblReportDepth.Text = SPanel.InsertParamValues(RPTHolder.ReportDepth, FieldValueType.Text);
        }
        void Page_Unload(object sender, EventArgs e)
        {
            //  throw new Exception("The method or operation is not implemented.");
            CUtilityWeb.CloseAllConnections();
        }

        public string LoadChart1()
        {
            //We create the dataURL in noCache format.
            string strChart1URL;
            strChart1URL = FusionCharts.EncodeDataURL("Chart1.aspx?NextReportID=" + Request.QueryString["NextReportID"], true);
            return FusionCharts.RenderChart("FusionCharts/MSColumn3D.swf", strChart1URL, "", "Chart1", "875", "350", false, true);
        }


        public string LoadMap_S_1()
        {

            //// Define dataArray Two dimension string Array element. 1st column take 
            //// map internal id and 2nd column take Value.
            //string[,] dataArray = new string[8, 2];

            //// Array data assigned from Context object Items
            //// In this example, we're directly showing this data back on Map.
            //// In your apps, you can do the required processing and then show the 
            //// relevant data only.

            ////string SSQLTemplateCols = "SELECT dbo.RPT_RegionCountries.RegionName AS Region, SUM(dbo.VW_InternationalCalls.Amount) AS Amount FROM dbo.VW_InternationalCalls INNER JOIN dbo.RPT_RegionCountries ON dbo.VW_InternationalCalls.Country = dbo.RPT_RegionCountries.CountryName GROUP BY dbo.RPT_RegionCountries.RegionName";

            //string SSQLTemplateCols = "SELECT     Region, SUM(CostValue) AS Amount FROM TelecommuncationCostsReporting GROUP BY Region";

            //DataTable dtTemplateCols;

            //using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsAuditDB))
            //{
            //    dtTemplateCols = CUtilityWeb.getDataTable(SSQLTemplateCols, sqlConnection);
            //}

            //dataArray[0, 0] = "01"; dataArray[0, 1] = "0";
            //dataArray[1, 0] = "02"; dataArray[1, 1] = "0";
            //dataArray[2, 0] = "03"; dataArray[2, 1] = "0";
            //dataArray[3, 0] = "04"; dataArray[3, 1] = "0";
            //dataArray[4, 0] = "05"; dataArray[4, 1] = "0";
            //dataArray[5, 0] = "06"; dataArray[5, 1] = "0";
            //dataArray[6, 0] = "07"; dataArray[6, 1] = "0";
            //dataArray[7, 0] = "08"; dataArray[7, 1] = "0";


            ////Iterate through each record
            //foreach (DataRow DR in dtTemplateCols.Rows)
            //{
            //    if (DR[0].ToString() == "APAC") //"AS")
            //        dataArray[0, 1] = DR[1].ToString();

            //    if (DR[0].ToString() == "EU")
            //        dataArray[1, 1] = DR[1].ToString();

            //    if (DR[0].ToString() == "AF")
            //        dataArray[2, 1] = DR[1].ToString();

            //    if (DR[0].ToString() == "NA")
            //        dataArray[3, 1] = DR[1].ToString();

            //    if (DR[0].ToString() == "SA")
            //        dataArray[4, 1] = DR[1].ToString();

            //    if (DR[0].ToString() == "CA")
            //        dataArray[5, 1] = DR[1].ToString();

            //    if (DR[0].ToString() == "OC")
            //        dataArray[6, 1] = DR[1].ToString();

            //    if (DR[0].ToString() == "ME")
            //        dataArray[7, 1] = DR[1].ToString();

            //}


            ///*
            //Now that we've the data in variables, we need to convert this into XML.
            //The simplest method to convert data into XML is using string concatenation.	
            //*/
            //StringBuilder strXML = new StringBuilder();

            ////Initialize <map> element
            //strXML.Append("<map borderColor='Black' showLabels='0' legendPosition='Bottom' numberSuffix=' USD' connectorColor='000000' fillAlpha='60' hoverColor='FFFFFF' showBevel='0'>");

            ////  
            //strXML.Append("<colorRange>");
            ////strXML.Append("<color minValue='1' maxValue='500' displayValue='1 to 100,000 USD' color='ABF456' />");
            //strXML.Append("<color minValue='1' maxValue='100000' displayValue='1 to 100,000 USD' color='069F06' />");
            //strXML.Append("<color minValue='100000' maxValue='500000' displayValue='100,000 to 500,000 USD' color='FFD33A' />");
            //strXML.Append("<color minValue='500000' maxValue='10000000' displayValue='500,000 USD or above' color='CC0001' />");
            //strXML.Append("</colorRange><data>");

            //string strLink;

            //// Fetch Data from array 
            //for (int i = 0; i < dataArray.GetLength(0); i++)
            //{
            //    // Set each map <entity> id and value
            //    strXML.AppendFormat("<entity id='{0}' value='{1}' link='" + HttpUtility.UrlEncode("javaScript:UpdateChart0(\"" + dataArray[i, 0].ToString() + "\");") + "' />", dataArray[i, 0], dataArray[i, 1]);

            //}

            //// Close  <data> element
            //strXML.Append("</data>");

            //// Add Style on map
            //strXML.Append("<styles><definition><style type='animation' name='animX' param='_xscale' start='0' duration='1' /><style type='animation' name='animY' param='_yscale' start='0' duration='1' />");
            //strXML.Append("</definition><application><apply toObject='PLOT' styles='animX,animY' /></application></styles>");

            //// Close <map> element
            //strXML.Append("</map>");

            //// Create Map embedding HTML with data contained in strXML 
            //// We use FusionMaps class of InfoSoftGlobal namespace (FusionMaps.dll in BIN folder)
            //// RenderMap() generates the necessary HTML needed to render the map
            //string mapHTML = FusionMaps.RenderMap("FusionMaps/FCMap_World8.swf", "", strXML.ToString(), "mapid", "500", "400", false, true);

            ////embed the chart rendered as HTML into Literal -  FusionMapsContainer
            //MapContainer_S_1.Text = mapHTML;

            return "OK";

        }

        public string LoadMap_S_2()
        {
            return "";
        }

        public string LoadMap_B_1()
        {
            return "";
        }

        public string LoadMap_B_2()
        {
            return "";
        }

        public string LoadChart_S_1()
        {
            //StringBuilder strXML = new StringBuilder();
            //StringBuilder strCategories = new StringBuilder();
            //StringBuilder strDataRev = new StringBuilder();
            //StringBuilder strDataQty = new StringBuilder();

            //string labelFormatting;
            ////'If number of items to show on chart is less than 10, we wrap them
            ////'else we show as rotated
            ////if (int.Parse(count) > 10)
            //labelFormatting = " labelDisplay='ROTATE' slantLabels='1' ";
            /////else
            ////  labelFormatting = " labelDisplay='WRAP' ";

            ////Initialize <chart> element
            //strXML.Append("<chart palette='4' caption='Organization Payments Statewise' PYAxisName='Requests' SYAxisName='Amount' formatNumberScale='0' showValues='0' decimals='3'" + labelFormatting + ">");

            ////Initialize <categories> element - necessary to generate a multi-series chart
            //strCategories.Append("<categories>");

            ////Initiate <dataset> elements
            //strDataRev.Append("<dataset seriesName='No. of Requests'>");
            //strDataQty.Append("<dataset seriesName='Amount' parentYAxis='S'>");

            //string SSQLTemplateCols = "SELECT DataProfileClassWFStates.StateName AS StatusName, COUNT(*) AS RecordCount, sum(InvoiceAmount) FROM PwcPaymentRequestForm INNER JOIN DataProfileClassWFStates ON PwcPaymentRequestForm.StateId = DataProfileClassWFStates.StateId GROUP BY DataProfileClassWFStates.StateName";
            //DataTable dtTemplateCols;

            //using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            //{
            //    dtTemplateCols = CUtilityWeb.getDataTable(SSQLTemplateCols, sqlConnection);
            //}
            //string strLink;

            ////Iterate through each record
            //foreach (DataRow DR in dtTemplateCols.Rows)
            //{
            //    //Append <category name='...' /> to strCategories
            //    strCategories.AppendFormat("<category name='{0}' />", DR[0].ToString());
            //    strLink = HttpUtility.UrlEncode("javaScript:UpdateChart2(\"" + DR[0].ToString() + "\");");
            //    //Add <set value='...' /> to both the datasets
            //    strDataRev.Append("<set value='" + DR[1].ToString() + "' link='" + strLink + "'/>");
            //    strDataQty.AppendFormat("<set value='{0}' />", DR[2].ToString());
            //}

            ////Close <categories> element
            //strCategories.Append("</categories>");

            ////Close <dataset> elements
            //strDataRev.Append("</dataset>");
            //strDataQty.Append("</dataset>");

            ////Assemble the entire XML now
            //strXML.Append(strCategories.ToString());
            //strXML.Append(strDataRev.ToString());
            //strXML.Append(strDataQty.ToString());
            //strXML.Append("</chart>");

            ////Create the chart - MS Column 3D Line Combination Chart with data contained in strXML
            //return FusionCharts.RenderChart("FusionCharts/MSColumn3DLineDY.swf", "", strXML.ToString(), "Chart_S_1", "600", "400", false, true);
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

            strCaption = "Live Projects : All Business Groups";
            strChartSWF = "Pie3D.swf";
            strSubCaption = "(Click to slice out or right click to choose rotation mode)";
            strChartMetricsUsed = "Total Usage, IPT Usage, Actual Monthly Cost, Non IPT Cost";
            strChartDescription = @"This will illustrate the potential savings of IPT implementation against the usage trends 
                                            <br/>This would allow us to track the usage and potential savings of IPT implementation";

            strXMLDATA = GenerateXMlforPieChart(dtResult, SYaxisSeriesNo, strCaption, strSubCaption, null, "", 0, 0);

            return FusionCharts.RenderChart("FusionCharts/Pie3D.swf", "", strXMLDATA.ToString(), "Chart_S_2", "500", "300", false, true);
        }

        //public string LoadChart_B_1()
        //{
        //    StringBuilder strXML = new StringBuilder();
        //    StringBuilder strCategories = new StringBuilder();
        //    StringBuilder strDataRev = new StringBuilder();
        //    StringBuilder strDataQty = new StringBuilder();

        //    string labelFormatting;
        //    //'If number of items to show on chart is less than 10, we wrap them
        //    //'else we show as rotated
        //    //if (int.Parse(count) > 10)
        //    labelFormatting = " labelDisplay='ROTATE' slantLabels='1' ";
        //    ///else
        //    //  labelFormatting = " labelDisplay='WRAP' ";

        //    //Initialize <chart> element
        //    strXML.Append("<chart palette='4' caption='Organization Payments Statewise' PYAxisName='Requests' SYAxisName='Amount' formatNumberScale='0' showValues='0' decimals='3'" + labelFormatting + ">");

        //    //Initialize <categories> element - necessary to generate a multi-series chart
        //    strCategories.Append("<categories>");

        //    //Initiate <dataset> elements
        //    strDataRev.Append("<dataset seriesName='No. of Requests'>");
        //    strDataQty.Append("<dataset seriesName='Amount' parentYAxis='S'>");

        //    string SSQLTemplateCols = "SELECT DataProfileClassWFStates.StateName AS StatusName, COUNT(*) AS RecordCount, sum(InvoiceAmount) FROM PwcPaymentRequestForm INNER JOIN DataProfileClassWFStates ON PwcPaymentRequestForm.StateId = DataProfileClassWFStates.StateId GROUP BY DataProfileClassWFStates.StateName";
        //    DataTable dtTemplateCols;

        //    using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
        //    {
        //        dtTemplateCols = CUtilityWeb.getDataTable(SSQLTemplateCols, sqlConnection);
        //    }
        //    string strLink;

        //    //Iterate through each record
        //    foreach (DataRow DR in dtTemplateCols.Rows)
        //    {
        //        //Append <category name='...' /> to strCategories
        //        strCategories.AppendFormat("<category name='{0}' />", DR[0].ToString());
        //        strLink = HttpUtility.UrlEncode("javaScript:UpdateChart2(\"" + DR[0].ToString() + "\");");
        //        //Add <set value='...' /> to both the datasets
        //        strDataRev.Append("<set value='" + DR[1].ToString() + "' link='" + strLink + "'/>");
        //        strDataQty.AppendFormat("<set value='{0}' />", DR[2].ToString());
        //    }

        //    //Close <categories> element
        //    strCategories.Append("</categories>");

        //    //Close <dataset> elements
        //    strDataRev.Append("</dataset>");
        //    strDataQty.Append("</dataset>");

        //    //Assemble the entire XML now
        //    strXML.Append(strCategories.ToString());
        //    strXML.Append(strDataRev.ToString());
        //    strXML.Append(strDataQty.ToString());
        //    strXML.Append("</chart>");

        //    //Create the chart - MS Column 3D Line Combination Chart with data contained in strXML
        //    return FusionCharts.RenderChart("FusionCharts/MSColumn3DLineDY.swf", "", strXML.ToString(), "Chart_B_1", "950", "500", false, true);
        //}

        public string LoadChart_B_1()
        {
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

            strXMLDATA = GenerateXMLForMultiSeries(dtResult, SYaxisSeriesNo, strCaption, "", null, "", 0, 0);

            return FusionCharts.RenderChart("FusionCharts/MSColumn3D.swf", "", strXMLDATA.ToString(), "Chart_B_1", "600", "300", false, true);

        }

        public string LoadChart_B_3()
        {

            return "";
            //StringBuilder strXML = new StringBuilder();
            //StringBuilder strCategories = new StringBuilder();
            //StringBuilder strDataRev = new StringBuilder();
            //StringBuilder strDataQty = new StringBuilder();

            //string labelFormatting;
            ////'If number of items to show on chart is less than 10, we wrap them
            ////'else we show as rotated
            ////if (int.Parse(count) > 10)
            //labelFormatting = " labelDisplay='ROTATE' slantLabels='1' ";
            /////else
            ////  labelFormatting = " labelDisplay='WRAP' ";

            ////Initialize <chart> element
            //strXML.Append("<chart palette='4' caption='Organization Payments Statewise' PYAxisName='Requests' SYAxisName='Amount' formatNumberScale='0' showValues='0' decimals='3'" + labelFormatting + ">");

            ////Initialize <categories> element - necessary to generate a multi-series chart
            //strCategories.Append("<categories>");

            ////Initiate <dataset> elements
            //strDataRev.Append("<dataset seriesName='No. of Requests'>");
            //strDataQty.Append("<dataset seriesName='Amount' parentYAxis='S'>");

            //string SSQLTemplateCols = "SELECT OrganizationName, COUNT(*) AS RecordCount, sum(InvoiceAmount) FROM PwcPaymentRequestForm INNER JOIN DataProfileClassWFStates ON PwcPaymentRequestForm.StateId = DataProfileClassWFStates.StateId where DataProfileClassWFStates.StateName = 'Request Completed' GROUP BY OrganizationName";
            //DataTable dtTemplateCols;

            //using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            //{
            //    dtTemplateCols = CUtilityWeb.getDataTable(SSQLTemplateCols, sqlConnection);
            //}
            //string strLink;

            ////Iterate through each record
            //foreach (DataRow DR in dtTemplateCols.Rows)
            //{
            //    //Append <category name='...' /> to strCategories
            //    strCategories.AppendFormat("<category name='{0}' />", DR[0].ToString());
            //    //Add <set value='...' /> to both the datasets
            //    strDataRev.AppendFormat("<set value='{0}' />", DR[1].ToString());
            //    strDataQty.AppendFormat("<set value='{0}' />", DR[2].ToString());
            //}

            ////Close <categories> element
            //strCategories.Append("</categories>");

            ////Close <dataset> elements
            //strDataRev.Append("</dataset>");
            //strDataQty.Append("</dataset>");

            ////Assemble the entire XML now
            //strXML.Append(strCategories.ToString());
            //strXML.Append(strDataRev.ToString());
            //strXML.Append(strDataQty.ToString());
            //strXML.Append("</chart>");

            ////Create the chart - MS Column 3D Line Combination Chart with data contained in strXML
            //return FusionCharts.RenderChart("FusionCharts/MSColumn3DLineDY.swf", "", strXML.ToString(), "Chart_B_2", "950", "500", false, true);
            int SelectedMonthNo, CurrentYear;

            CurrentYear = DateTime.Now.Year;
            SelectedMonthNo = ddlMonth.SelectedIndex + 1;

            string FirstDayOfMonth, LastDayOfMonth;

            FirstDayOfMonth = CurrentYear.ToString() + "/" + SelectedMonthNo.ToString() + "/01";
            LastDayOfMonth = CurrentYear.ToString() + "/" + SelectedMonthNo.ToString() + "/" + DateTime.DaysInMonth(CurrentYear, SelectedMonthNo);

            string SSQLTemplateCols = "SELECT FormId, ProcessName, Title, CONVERT(varchar(10), RequestedDate, 103) AS RequestedDate, CONVERT(varchar(10), BRAnalysisStartDate, 103) AS BRAnalysisStartDate, CONVERT(varchar(10), BRSubmitted, 103) AS BRSubmitted, CONVERT(varchar(10), BRSignedOff, 103) AS BRSignedOff, CONVERT(varchar(10), PlannedDevStartDate, 103) AS PlannedDevStartDate, CONVERT(varchar(10), PlannedDevEndDate, 103) AS PlannedDevEndDate, LeadDeveloper,ISNULL(PercentageCompleted, 0) AS PercentageCompleted FROM ITSSDProjectsDetails WHERE PlannedDevStartDate >= '" + FirstDayOfMonth + "'";
            DataTable dtTemplateCols;

            using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                dtTemplateCols = CUtilityWeb.getDataTable(SSQLTemplateCols, sqlConnection);
            }

            StringBuilder strXML = new StringBuilder();

            strXML.Append("<chart palette='2' caption='Project Timelines' dateFormat='dd/mm/yyyy' outputDateFormat='ddds mns' >");
            strXML.Append("<categories>");
            strXML.Append("<category start='1/7/2009' end='30/9/2009' label='Months' />");
            strXML.Append("</categories>");
            strXML.Append("<categories>");

            strXML.Append("<category start='1/7/2009' end='31/7/2009' label='Jul' />");
            strXML.Append("<category start='1/8/2009' end='31/8/2009' label='Aug' />");
            strXML.Append("<category start='1/9/2009' end='30/9/2009' label='Sep' />");

            strXML.Append("</categories>");
            strXML.Append("<processes headerText='Projects' headerFontSize='14' fontSize='12' headerVAlign='bottom' align='left' headerAlign='left'>");

            foreach (DataRow DR in dtTemplateCols.Rows)
            {
                strXML.Append("<process label='" + HttpUtility.UrlEncode(DR["ProcessName"].ToString()) + "' id='" + DR["FormId"].ToString() + "'/>");
            }

            //strXML.Append("<process label='Terrace' id='TRC' />");
            //strXML.Append("<process label='Inspection' id='INS' />");
            //strXML.Append("<process label='Wood Work' id='WDW' />");
            //strXML.Append("<process label='Interiors' id='INT' />");
            strXML.Append("</processes>");

            strXML.Append("<datatable headerVAlign='bottom'>");
            strXML.Append("<datacolumn headerText='Developer' headerFontSize='14' fontSize='12' headerVAlign='bottom' align='left' headerAlign='left'>");

            foreach (DataRow DR in dtTemplateCols.Rows)
            {
                strXML.Append("<text label='" + DR["LeadDeveloper"].ToString() + "' />");
            }
            //<text label="Graphics" /> 
            //<text label="ASP.NET" /> 
            //<text label="PHP" /> 
            //<text label="Flash" /> 
            //<text label="Documentation" /> 
            strXML.Append("</datacolumn>");
            strXML.Append("</datatable>");

            strXML.Append("<tasks showEndDate='0' showLabels='0'>");

            System.Globalization.DateTimeFormatInfo dateInfo = new System.Globalization.DateTimeFormatInfo();
            dateInfo.ShortDatePattern = "dd/MM/yyyy";

            DateTime dtDate = new DateTime();
            //dtDate = Convert.ToDateTime(strInvIssueDate, dateInfo);


            foreach (DataRow DR in dtTemplateCols.Rows)
            {
                if (DR["RequestedDate"].ToString() != "" && DR["RequestedDate"].ToString() != null)
                {
                    dtDate = Convert.ToDateTime(DR["RequestedDate"].ToString(), dateInfo);

                    if (dtDate >= Convert.ToDateTime("07/01/2009"))
                        strXML.Append("<task processId='" + DR["FormId"].ToString() + "' id='" + DR["FormId"].ToString() + "' start='" + DR["RequestedDate"].ToString() + "' end='" + DR["RequestedDate"].ToString() + "' label='Requested by Customer' percentComplete='100'/>");
                }


                if (DR["BRAnalysisStartDate"].ToString() != "" && DR["BRAnalysisStartDate"].ToString() != null)
                {
                    if (DR["BRSubmitted"].ToString() != "" && DR["BRSubmitted"].ToString() != null)
                    {
                        dtDate = Convert.ToDateTime(DR["BRAnalysisStartDate"].ToString(), dateInfo);

                        if (dtDate >= Convert.ToDateTime("07/01/2009"))
                            strXML.Append("<task processId='" + DR["FormId"].ToString() + "' id='" + DR["FormId"].ToString() + "' start='" + DR["BRAnalysisStartDate"].ToString() + "' end='" + DR["BRSubmitted"].ToString() + "' label='Requirement Analysis Phase' percentComplete='100'/>");
                    }
                }

                if (DR["BRSignedOff"].ToString() != "" && DR["BRSignedOff"].ToString() != null)
                {
                    dtDate = Convert.ToDateTime(DR["BRSignedOff"].ToString(), dateInfo);

                    if (dtDate >= Convert.ToDateTime("07/01/2009"))
                        strXML.Append("<task processId='" + DR["FormId"].ToString() + "' id='" + DR["FormId"].ToString() + "' start='" + DR["BRSignedOff"].ToString() + "' end='" + DR["BRSignedOff"].ToString() + "' label='Requirement Signed Off by Customer' percentComplete='100'/>");
                }

                if (DR["PlannedDevStartDate"].ToString() != "" && DR["PlannedDevStartDate"].ToString() != null)
                {
                    if (DR["PlannedDevEndDate"].ToString() != "" && DR["PlannedDevEndDate"].ToString() != null)
                    {
                        dtDate = Convert.ToDateTime(DR["PlannedDevStartDate"].ToString(), dateInfo);

                        if (dtDate >= Convert.ToDateTime("07/01/2009"))
                            strXML.Append("<task processId='" + DR["FormId"].ToString() + "' id='" + DR["FormId"].ToString() + "' start='" + DR["PlannedDevStartDate"].ToString() + "' end='" + DR["PlannedDevEndDate"].ToString() + "' label='Development Phase' percentComplete='" + DR["PercentageCompleted"].ToString() + "'/>");
                    }
                }

            }

            //strXML.Append("<task processId='TRC' start='5/8/2008' end='2/9/2008' id='5' color='4567aa' />");
            strXML.Append("</tasks>");
            //strXML.Append("<legend>");
            //   strXML.Append("<item label='Planned' color='4567aa' />");
            //   strXML.Append("<item label='Actual' color='999999' />");
            //strXML.Append("</legend>");
            strXML.Append("<styles>");
            strXML.Append("<definition>");
            strXML.Append("<style type='font' name='legendFont' size='13' />");
            strXML.Append("</definition>");
            strXML.Append("<application>");
            strXML.Append("<apply toObject='Legend' styles='legendFont' />");
            strXML.Append("</application>");
            strXML.Append("</styles>");
            //strXML.Append("<milestones>");
            //  strXML.Append("<milestone date='15/8/2009' taskId='2' radius='10' color='333333' shape='Star' numSides='5' borderThickness='1' /> ");
            //  strXML.Append("</milestones>");
            strXML.Append("</chart>");

            return FusionCharts.RenderChart("FusionWidgets/Gantt.swf", "", strXML.ToString(), "Chart_B_3", "1124", "1200", false, false);
            return "";
        }


        public string LoadChart_B_2()
        {
            return "";

            int SelectedMonthNo, CurrentYear;

            CurrentYear = DateTime.Now.Year;
            SelectedMonthNo = ddlMonth.SelectedIndex + 1;

            string FirstDayOfMonth, LastDayOfMonth;

            FirstDayOfMonth = CurrentYear.ToString() + "/" + SelectedMonthNo.ToString() + "/01";
            LastDayOfMonth = CurrentYear.ToString() + "/" + SelectedMonthNo.ToString() + "/" + DateTime.DaysInMonth(CurrentYear, SelectedMonthNo);

            string SSQLTemplateCols = "SELECT PwcTaskTracking.FormId, ISNULL(PwcTaskTracking.ProjectName, 'N/A') AS ProjectName, PwcTaskTracking.Title, PwcTaskTracking.Priority, CONVERT(varchar(10), PwcTaskTracking.TaskStartDate, 103) AS TaskStartDate, CONVERT(varchar(10), PwcTaskTracking.TaskDueDate, 103) AS TaskDueDate, ISNULL(PwcTaskTracking.PercentageCompleted, 0) AS PercentageCompleted, PwcTaskTracking.RequestFor, PwcTaskTracking.PlannedUnplanned, Users.Name FROM PwcTaskTracking LEFT OUTER JOIN Users ON PwcTaskTracking.RequestFor = Users.UserId WHERE (PwcTaskTracking.TaskStartDate >= '" + FirstDayOfMonth + "')";
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
            strXML.Append("<chart slackFillColor='EEEEEE' dateInToolTip='0' scrollColor='99CCCC' scrollPadding='3' scrollHeight='20' scrollBtnWidth='28' scrollBtnPadding='3' dateFormat='dd/mm/yyyy' caption='Employee Schedule' subCaption='From 1st August 2009 - 31st August 2009' ganttPaneDuration='57' ganttPaneDurationUnit='d' palette='2'>");

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
            strXML.Append("<process label='Asif Mirza' id='aahmedmirza'/>");
            strXML.Append("<process label='Abdullah Noor Ahmed' id='anoorahmed'/>");
            strXML.Append("<process label='Abdel Razag Abbas Ali' id='ababbasali'/>");
            strXML.Append("<process label='Maha Al-Kamsheh' id='mal-kamsheh'/>");
            strXML.Append("<process label='Muhammad Qasim Asghar Ali' id='muhaali'/>");
            strXML.Append("<process label='Aqsa Jamal' id='ajamal'/>");
            strXML.Append("<process label='Shams Yassin' id='syassin'/>");
            strXML.Append("<process label='Juny Avarachen' id='javarachen'/>");
            strXML.Append("<process label='Zeeshan Rehmat' id='zrehmat'/>");
            strXML.Append("<process label='Ali Nasir' id='anasir'/>");
            strXML.Append("<process label='Farina Rasheed' id='frasheed'/>");

            //India Team
            strXML.Append("<process label='Sharath Kumar Padinela' id='spadinela'/>");
            strXML.Append("<process label='Sreekanth Gunti' id='sgunti'/>");
            strXML.Append("<process label='Vikram Kamalapur' id='vkamalapur'/>");
            strXML.Append("<process label='Ajay Kumar Neela' id='aneela'/>");
            strXML.Append("<process label='Taduri Sreedhar' id='tsreedhar'/>");
            strXML.Append("<process label='Nagamani Ummareddy' id='nummareddy'/>");
            strXML.Append("<process label='Phani Kiran Iruku' id='piruku'/>");
            strXML.Append("<process label='Gopi Chitluri' id='gchitluri'/>");
            strXML.Append("<process label='Adigopula Avani' id='aavani'/>");


            strXML.Append("</processes>");
            // End Processes

            // Add Tasks
            strXML.Append("<tasks>");

            foreach (DataRow DR in dtTemplateCols.Rows)
            {
                //strXML.Append("<task color='453269' height='40" + HttpUtility.UrlEncode("%") + "' topPadding='20" + HttpUtility.UrlEncode("%") + "' processId='" + DR["RequestFor"].ToString() + "' id='" + DR["FormId"].ToString() + "' start='" + DR["TaskStartDate"].ToString() + "' end='" + DR["TaskDueDate"].ToString() + "' label='" + HttpUtility.UrlEncode(DR["ProjectName"].ToString()) + ", " + HttpUtility.UrlEncode(DR["Title"].ToString()) + "' percentComplete='" + DR["PercentageCompleted"].ToString() + "'/>");
                if (DR["PlannedUnplanned"].ToString() == "P")
                {
                    strXML.Append("<task color='453269' height='15' topPadding='10" + HttpUtility.UrlEncode("%") + "' processId='" + DR["RequestFor"].ToString() + "' id='" + DR["FormId"].ToString() + "' start='" + DR["TaskStartDate"].ToString() + "' end='" + DR["TaskDueDate"].ToString() + "' label='" + HttpUtility.UrlEncode(DR["ProjectName"].ToString()) + ", " + HttpUtility.UrlEncode(DR["Title"].ToString()) + "' />");
                }
                else
                {
                    strXML.Append("<task color='FF654F' height='15' topPadding='43" + HttpUtility.UrlEncode("%") + "' processId='" + DR["RequestFor"].ToString() + "' id='" + DR["FormId"].ToString() + "' start='" + DR["TaskStartDate"].ToString() + "' end='" + DR["TaskDueDate"].ToString() + "' label='" + HttpUtility.UrlEncode(DR["ProjectName"].ToString()) + ", " + HttpUtility.UrlEncode(DR["Title"].ToString()) + "' />");
                }
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
            return FusionCharts.RenderChart("FusionWidgets/Gantt.swf", "", strXML.ToString(), "Chart_B_2", "1124", "1500", false, true);

        }

        //public string LoadChart_B_2()
        //{
        //    //StringBuilder strXML = new StringBuilder();
        //    //StringBuilder strCategories = new StringBuilder();
        //    //StringBuilder strDataRev = new StringBuilder();
        //    //StringBuilder strDataQty = new StringBuilder();

        //    //string labelFormatting;
        //    ////'If number of items to show on chart is less than 10, we wrap them
        //    ////'else we show as rotated
        //    ////if (int.Parse(count) > 10)
        //    //labelFormatting = " labelDisplay='ROTATE' slantLabels='1' ";
        //    /////else
        //    ////  labelFormatting = " labelDisplay='WRAP' ";

        //    ////Initialize <chart> element
        //    //strXML.Append("<chart palette='4' caption='Organization Payments Statewise' PYAxisName='Requests' SYAxisName='Amount' formatNumberScale='0' showValues='0' decimals='3'" + labelFormatting + ">");

        //    ////Initialize <categories> element - necessary to generate a multi-series chart
        //    //strCategories.Append("<categories>");

        //    ////Initiate <dataset> elements
        //    //strDataRev.Append("<dataset seriesName='No. of Requests'>");
        //    //strDataQty.Append("<dataset seriesName='Amount' parentYAxis='S'>");

        //    //string SSQLTemplateCols = "SELECT OrganizationName, COUNT(*) AS RecordCount, sum(InvoiceAmount) FROM PwcPaymentRequestForm INNER JOIN DataProfileClassWFStates ON PwcPaymentRequestForm.StateId = DataProfileClassWFStates.StateId where DataProfileClassWFStates.StateName = 'Request Completed' GROUP BY OrganizationName";
        //    //DataTable dtTemplateCols;

        //    //using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
        //    //{
        //    //    dtTemplateCols = CUtilityWeb.getDataTable(SSQLTemplateCols, sqlConnection);
        //    //}
        //    //string strLink;

        //    ////Iterate through each record
        //    //foreach (DataRow DR in dtTemplateCols.Rows)
        //    //{
        //    //    //Append <category name='...' /> to strCategories
        //    //    strCategories.AppendFormat("<category name='{0}' />", DR[0].ToString());
        //    //    //Add <set value='...' /> to both the datasets
        //    //    strDataRev.AppendFormat("<set value='{0}' />", DR[1].ToString());
        //    //    strDataQty.AppendFormat("<set value='{0}' />", DR[2].ToString());
        //    //}

        //    ////Close <categories> element
        //    //strCategories.Append("</categories>");

        //    ////Close <dataset> elements
        //    //strDataRev.Append("</dataset>");
        //    //strDataQty.Append("</dataset>");

        //    ////Assemble the entire XML now
        //    //strXML.Append(strCategories.ToString());
        //    //strXML.Append(strDataRev.ToString());
        //    //strXML.Append(strDataQty.ToString());
        //    //strXML.Append("</chart>");

        //    ////Create the chart - MS Column 3D Line Combination Chart with data contained in strXML
        //    //return FusionCharts.RenderChart("FusionCharts/MSColumn3DLineDY.swf", "", strXML.ToString(), "Chart_B_2", "950", "500", false, true);

        //    int SelectedMonthNo = ddlMonth.SelectedIndex + 1;
        //    string SSQLTemplateCols = "SELECT PwcTaskTracking.FormId, ISNULL(PwcTaskTracking.ProjectName, 'N/A') AS ProjectName, PwcTaskTracking.Title, PwcTaskTracking.Priority, CONVERT(varchar(10), PwcTaskTracking.TaskStartDate, 103) AS TaskStartDate, CONVERT(varchar(10), PwcTaskTracking.TaskDueDate, 103) AS TaskDueDate, ISNULL(PwcTaskTracking.PercentageCompleted, 0) AS PercentageCompleted, PwcTaskTracking.RequestFor, Users.Name FROM PwcTaskTracking LEFT OUTER JOIN Users ON PwcTaskTracking.RequestFor = Users.UserId WHERE (PwcTaskTracking.TaskStartDate >= '2009-08-01')";
        //    DataTable dtTemplateCols;

        //    using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsAuditDB))
        //    {
        //        dtTemplateCols = CUtilityWeb.getDataTable(SSQLTemplateCols, sqlConnection);
        //    }

        //    StringBuilder strXML = new StringBuilder();
        //    strXML.Append("<chart scrollColor='99CCCC' scrollPadding='3' scrollHeight='20' scrollBtnWidth='28' scrollBtnPadding='3' dateFormat='dd/mm/yyyy' caption='Employee Schedule' subCaption='From 1st August 2009 - 31st August 2009' ganttPaneDuration='57' ganttPaneDurationUnit='d' palette='2'>");
        //    //strXML.Append("<categories>");
        //    //   strXML.Append("<category start='02/08/2009' end='08/08/2009' label='Week 1' />");
        //    //   strXML.Append("<category start='08/08/2009' end='15/08/2009' label='Week 2' />");
        //    //strXML.Append("</categories>");
        //    strXML.Append("<categories>");

        //    string strTotalDaysInMonth = System.DateTime.DaysInMonth(2009, SelectedMonthNo).ToString();

        //    for (int i = 1; i <= System.DateTime.DaysInMonth(2009, SelectedMonthNo); i++)
        //    {
        //        strXML.Append("<category start='" + i.ToString() + "/" + SelectedMonthNo.ToString() + "/2009' end='" + i + "/" + SelectedMonthNo.ToString() + "/2009' label='" + i.ToString() + "' />");
        //    }
        //    strXML.Append("<category start='01/" + (SelectedMonthNo + 1).ToString() + "/2009' end='01/" + (SelectedMonthNo + 1).ToString() + "/2009' label='Sat' />");

        //    strXML.Append("</categories>");
        //    strXML.Append("<processes fontSize='12' isBold='1' align='left' headerText='Team Members' headerFontSize='14' headerVAlign='bottom' headerAlign='left'>");

        //    strXML.Append("<process label='Travel Request Changes' id='TRF'/>");
        //    strXML.Append("<process label='Mobile Phone Bills' id='MPB'/>");
        //    strXML.Append("<process label='HelpDesk Escalations' id='HDE'/>");
        //    //strXML.Append("<process label='FTD Reports' id='FTD'/>");

        //    strXML.Append("<process label='Employee Schedule' id='ES'/>");

        //    DataTable dtDistinctEmployees = dtTemplateCols.DefaultView.ToTable(true, new string[] { "Name", "RequestFor" });
        //    foreach (DataRow DR in dtDistinctEmployees.Rows)
        //    {
        //        strXML.Append("<process label='" + DR["Name"].ToString() + "' id='" + DR["RequestFor"].ToString() + "'/>");
        //    }

        //    //  strXML.Append("<process label='John.S' id='EMP121'/>");
        //    strXML.Append("</processes>");

        //    strXML.Append("<tasks>");

        //    strXML.Append("<task processId='TRF' id='TRF-1' start='2/08/2009' end='14/08/2009' label='' percentComplete='75'/>");
        //    strXML.Append("<task processId='MPB' id='MPB-1' start='9/08/2009' end='14/08/2009' label='' percentComplete='10'/>");
        //    strXML.Append("<task processId='HDE' id='HDE-1' start='16/08/2009' end='1/09/2009' label='' percentComplete='0'/>");
        //    strXML.Append("<task processId='ES' id='ES-1' start='01/08/2009' end='01/09/2009' showAsGroup='1' label='Employee Schedule'/>");


        //    foreach (DataRow DR in dtTemplateCols.Rows)
        //    {
        //        strXML.Append("<task processId='" + DR["RequestFor"].ToString() + "' id='" + DR["FormId"].ToString() + "' start='" + DR["TaskStartDate"].ToString() + "' end='" + DR["TaskDueDate"].ToString() + "' label='"
        //            + HttpUtility.HtmlEncode(DR["ProjectName"].ToString().Replace("&", "")) + ", "
        //            + HttpUtility.HtmlEncode(DR["Title"].ToString().Replace("&", "")) + "' percentComplete='" + DR["PercentageCompleted"].ToString() + "'/>");
        //    }

        //    //strXML.Append("<task processId='EMP122' id='TSK1393-1' start='16/08/2009' end='22/08/2009' label='C# Wrapper development' percentComplete='78'/>");
        //    strXML.Append("</tasks>");

        //    strXML.Append("<connectors color='99cc00' thickness='2'>");
        //    //strXML.Append("<connector fromTaskId="Cpt1" toTaskId="Cpt2" fromTaskConnectStart="1" />");
        //    //strXML.Append("<connector fromTaskId="PD1" toTaskId="PD2" fromTaskConnectStart="1" />"); 
        //    strXML.Append("<connector fromTaskId='TRF-1' toTaskId='1293' fromTaskConnectStart='1'/>");
        //    strXML.Append("<connector fromTaskId='MPB-1' toTaskId='1291' fromTaskConnectStart='1'/>");
        //    strXML.Append("<connector fromTaskId='HDE-1' toTaskId='1298' fromTaskConnectStart='1'/>");
        //    strXML.Append("</connectors>");

        //    strXML.Append("<trendlines>");
        //    DateTime dt = DateTime.Today;

        //    //       
        //    List<string> Holidays = GetHolidays(SelectedMonthNo, 2009);
        //    foreach (string Holiday in Holidays)
        //    {
        //        strXML.Append("<line  " + Holiday + " displayValue='' isTrendZone='1' alpha='20' color='FF5904'/>");

        //    }
        //    //for (int iLoop = 0; iLoop < Holidays.Count; iLoop++)
        //    //{
        //    //    if ((iLoop+1 ) < Holidays.Count)
        //    //    {
        //    //        strXML.Append("<line start='" + Holidays[iLoop] + "' end='" + Holidays[iLoop + 1] + "' displayValue='Vacation' isTrendZone='1' alpha='20' color='FF5904'/>");
        //    //        iLoop++;

        //    //    }
        //    //    else
        //    //    {
        //    //        strXML.Append("<line start='" + Holidays[iLoop] + "' end='" + Holidays[iLoop] + "' displayValue='Vacation' isTrendZone='1' alpha='20' color='FF5904'/>");

        //    //    }
        //    //}
        //    //strXML.Append("<line start='1/08/2009' end='2/08/2009' displayValue='' isTrendZone='1' alpha='20' color='FF5904'/>");
        //    //strXML.Append("<line start='7/08/2009' end='8/08/2009' displayValue='' isTrendZone='1' alpha='20' color='FF5904'/>");
        //    //strXML.Append("<line start='8/08/2009' end='9/08/2009' displayValue='' isTrendZone='1' alpha='20' color='FF5904'/>");
        //    //strXML.Append("<line start='14/08/2009' end='16/08/2009' displayValue='' isTrendZone='1' alpha='20' color='FF5904'/>");
        //    //strXML.Append("<line start='21/08/2009' end='23/08/2009' displayValue='' isTrendZone='1' alpha='20' color='FF5904'/>");
        //    //strXML.Append("<line start='28/08/2009' end='30/08/2009' displayValue='' isTrendZone='1' alpha='20' color='FF5904'/>");
        //    strXML.Append("</trendlines>");
        //    strXML.Append("</chart>");

        //    return FusionCharts.RenderChart("FusionWidgets/Gantt.swf", "", strXML.ToString(), "Chart_B_2", "1124", "400", false, false);

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
            sbXMLData.AppendFormat("<chart caption='{2}' subcaption='{3}'  formatNumberScale='0' numberSuffix='' showValues='0' showPercentInToolTip='0' >",
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

        public static String GenerateXMLForMultiSeries(DataTable DataToTransform,
                int SYAxisSeriesNo, string strCaption, string strSubCaption,
                string numberPrefix, string strSNumberSuffix,
                int showValues, int animation
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
            StringBuilder[] sbSeries = new StringBuilder[dtSeriesNames.Rows.Count];

            index = 0;
            foreach (DataRow drSeriesname in dtSeriesNames.Rows)
            {
                //color='DA3608'
                sbSeries[index] = new StringBuilder(String.Format("<dataset seriesName='{0}' color='{1}'>", drSeriesname[0].ToString(), strArrColor[index]));
                index++;
            }


            DataTable dtSeriesCategory;
            dtSeriesCategory = DataToTransform.DefaultView.ToTable(true, SeriesColNames[0].ToString());

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