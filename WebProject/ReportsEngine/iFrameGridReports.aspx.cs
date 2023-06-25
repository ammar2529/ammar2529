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
using InfoSoftGlobal;
using System.IO;

namespace WebProject.ReportsEngine
{
    public partial class iFrameGridReports : System.Web.UI.Page 
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

		        function ShowNewExportDataPopup(type)
                {{
                    //debugger;
                  var PDFOptions;
                if(type=='pdf')
                {{
                  var PDFSize=  $('input[@name=rdoPDFSize]:checked').val();
                  var SinglePagePDF = $('#chkSinglePagePDF')[0].checked?'true':false;
                PDFOptions = '&PDFSize='+PDFSize+'&SinglePagePDF='+SinglePagePDF;
                }}  
                  //  window.open(Link,null,'left=300, top=150, height=400, width= 600, status=n o, resizable= no, scrollbars= no, toolbar= no,location= no, menubar= no'); return false;
                     window.open(""./ExportData.aspx?{0}&type=""+type+PDFOptions,null,''); return false;

                }}
    </script>

", QueryURL.ToString());
            }

        }
        protected void Page_PreInit(object sender, EventArgs e)
        {
         
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
                lblReportGroup.Text = "";
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
                    Panel1.Visible = RPTHolder.IsSearchPanelVisible;

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


        public string ImageDirection(string posNeg)
        {
            return "rtl";
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
        string GetCss()
        {
            return @"
    <style type=""text/css"">
        .GridHead
        {
            color: Navy;
            text-decoration: none;
            font-family: Verdana;
            font-size: 11px;
            padding-left: 3px;
        }
        .GridLink
        {
            color: blue;
            text-decoration: none;
            font-family: Verdana;
            font-size: 11px;
            padding-left: 3px;
        }
        .GridLink:active
        {
            color: blue;
            text-decoration: none;
            font-family: Verdana;
            font-size: 11px;
            padding-left: 3px;
        }
        .GridLink:visited
        {
            color: Navy;
            text-decoration: none;
            font-family: Verdana;
            font-size: 11px;
            padding-left: 3px;
        }
        .GridLink:hover
        {
            color: #blue;
            text-decoration: underline;
            font-family: Verdana;
            font-size: 11px;
            padding-left: 3px;
        }

        .GridHeader a:hover
        {
            color: #ff6355;
            text-decoration: underline;
            font-family: Verdana;
            font-size: 11px;
        }
        .GridHeader a
        {
            color: Navy;
            text-decoration: none;
            font-family: Verdana;
            font-size: 11px;
        }
        .GridHeader a:visited
        {
            color: Navy;
            text-decoration: none;
            font-family: Verdana;
            font-size: 11px;
        }
        .GridHeader a:active
        {
            color: Navy;
            text-decoration: none;
            font-family: Verdana;
            font-size: 11px;
        }
        .GridHeader th
        {
            padding-left: 1px;
            padding-right: 10px;
            vertical-align: middle;
            text-align: left;
            white-space: nowrap;
        }
        .pagelink a
        {
            font: bold 8pt/20px Tahoma;
            color: blue;
            text-decoration: none;
        }
        .pagelink a:hover
        {
            font: bold 8pt/20px Tahoma;
            color: blue;
            text-decoration: underline;
        }
        .pagelink a:visited
        {
            font: bold 8pt/20px Tahoma;
            color: navy;
            text-decoration: none;
        }
        .pagelink span
        {
            font: bold 8pt/20px Tahoma;
            color: navy;
            text-decoration: underline;
        }
        .ColumnStyle td
        {
            padding-right: 10px;
            white-space: nowrap;
        }
    </style>
";
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Header.Controls.Add(new LiteralControl(@"<link href='../../JQuery/AutoComplete/jquery.autocomplete.css' 
                    rel='stylesheet' type='text/css' />" + GetCss()));

            Session["AuthorisedRoles"] = @"('SysRecipient','SysHistorySender','RPT_Admin')";

            lblErrorDetail.Visible = false;
            RPTSEC = (new ReportsSecurity(this, SlideMenu1));
            RPTSEC.AuthenticateUser();
            //if (Session["AuthorisedRoles"] == null || Session["AuthorisedRoles"] == "" || strEmailID != strEForms4UserId)
            //{
            //    FetchRoles(Session["EForms4UserId"].ToString());
            //}
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
            RPTSEC.BuildTreeMenu();

        }

        void Page_LoadComplete(object sender, EventArgs e)
        {
            //if (!RPTSEC.IsUserAuthorized()) return;

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

            if (RPTHolder != null)
            {

                if (RPTHolder.ChartSideLabel != null)
                {
                    Literal ltlChartSideLabel = new Literal();
                    ltlChartSideLabel.Text = RPTHolder.ChartSideLabel;

                    if (Table5.Rows[0].Cells.Count >= 1)
                    {
                        if (Table5.Rows[0].Cells.Count == 1)
                        {
                            TableCell TC = new TableCell();
                            TC.Controls.Add(ltlChartSideLabel);
                            Table5.Rows[0].Cells.Add(TC);
                        }
                        else if (Table5.Rows[0].Cells.Count > 1)
                        {

                            Table5.Rows[0].Cells[1].Controls.Add(ltlChartSideLabel);

                        }
                        Table5.Rows[0].Cells[1].VerticalAlign = VerticalAlign.Top;
                        Table5.Rows[0].Cells[1].Style.Add("Text-Align", "Left");
                    }

                }
                if (RPTHolder.ChartBottomLabel != null)
                {
                    Literal ltlChartBottomLabel = new Literal();
                    ltlChartBottomLabel.Text = RPTHolder.ChartBottomLabel;

                    //if (Table5.Rows[0].Cells.Count >= 1)
                    //{
                    //if (Table5.Rows[0].Cells.Count == 1)
                    //{
                    //    TableCell TC = new TableCell();
                    //    TC.Controls.Add(ltlChartBottomLabel);
                    //    Table5.Rows[0].Cells.Add(TC);
                    //}
                    //else 
                    if (Table5.Rows[0].Cells.Count > 0)
                    {

                        Table5.Rows[0].Cells[0].Controls.Add(ltlChartBottomLabel);

                    }
                    //Table5.Rows[0].Cells[1].Width = new Unit(200);
                    //Table5.Rows[0].Cells[1].Wrap = false;

                    //}

                }
            }
        }
        void Page_Unload(object sender, EventArgs e)
        {
            //  throw new Exception("The method or operation is not implemented.");
            //CUtilityWeb.CloseAllConnections();
        }

    }

}
