using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using WebProject.eForms.Web.UI.Page;
//using PWC.PresentationServices.Web.UI.WebControls;
//using PWC.PresentationServices.Web.UI.Common;

namespace WebProject.ReportsEngine
{
    public partial class MultipleGraph : System.Web.UI.Page
    {
        //string SearchPanelID = "";

        ReportHolder RPTHolder = null;
        ReportsSecurity RPTSEC;
        ReportWidgetLoader WidgetLoader;
        protected void Page_PreInit(object sender, EventArgs e)
        {
            if (Session["EmailID"] != null && Session["IsCleaned"] == null)
            {
                CleanXMLDataFolder();
            }
            if (Request.QueryString["NextReportID"] != null)
            {
                //return;
                RPTHolder = new ReportHolder(Request.QueryString["NextReportID"]);
                if (Session["EmailID"] != null)
                {
                    WidgetLoader = new ReportWidgetLoader(this, Request.QueryString["NextReportID"]);
                }



            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //---------------------Report Appreance-------------------------
            if (RPTHolder != null)
            {

                lblReportHead.Text = RPTHolder.Heading;
                lblReportShortDetail.Text = RPTHolder.ShortDetail;
                lblReportLongDetail.Text = RPTHolder.LongDetail;
            }
            //Literal ltrl = new Literal();
            //ltrl.Text = " <link href='../../StyleSheets/StyleSheet_eng.css' rel='stylesheet' type='text/css' />";
            //@"<script language=""JavaScript"" src=""/eFormsMIS/DotNetPages/ReportsEngine/FusionCharts/FusionCharts.js""></script>";
            //Header.Controls.Add(ltrl);


            AddStyleSheetsToPage();
            if (WidgetLoader != null)
            {
                WidgetLoader.QueryData();
            }
            lblErrorDetail.Visible = false;
            RPTSEC = (new ReportsSecurity(this, SlideMenu1));
            RPTSEC.AuthenticateUser();
            if (!RPTSEC.IsUserAuthorized())
            {

                if (Request.QueryString["NextReportID"] == null)
                {

                    pnlUnAuthrized.Visible = false;
                }
                else
                {
                    pnlUnAuthrized.Visible = true;


                }
                Panel1.Visible = false;
                pnlLowerBody.Visible = false;
            }
            RPTSEC.BuildTreeMenu();

        }
        protected void Page_LoadComplete(object sender, EventArgs e)
        {
            if (RPTHolder != null)
            {
                Literal ltlChartSideLabel = new Literal();
                Literal ltlChartBottomLabel = new Literal();

                if (RPTHolder.ReportDepth != null)
                    lblReportDepth.Text = WidgetLoader.ReplaceParamValues(RPTHolder.ReportDepth); //SPanel.InsertParamValues(RPTHolder.ReportDepth, FieldValueType.Text);
                DataTable dtDynamicComments;
                string SQLDynamicComments = string.Format(@"
SELECT     Comments, CommentGroupId, CommentId, Condition
FROM         RPTChartEngineComments
WHERE     (CommentGroupId = '{0}') ", Request.QueryString["NextReportID"]);// -- AND (CommentId = '{1}') AND (Condition = '{2}')";
                using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
                {
                    dtDynamicComments = CUtilityWeb.getDataTable(SQLDynamicComments, Conn);
                }

                if (!string.IsNullOrEmpty(RPTHolder.SideLabelConditionTemplate) || !string.IsNullOrEmpty(RPTHolder.ChartSideLabel))
                {
                    //ltlChartSideLabel.Text = RPTHolder.ChartSideLabel;

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
                    if (!string.IsNullOrEmpty(RPTHolder.SideLabelConditionTemplate))
                    {
                        string strCondition = WidgetLoader.ReplaceParamValues(RPTHolder.SideLabelConditionTemplate);
                        DataRow[] SelectedCondition = dtDynamicComments.Select(string.Format(@"(CommentId = 'ChartSideLabel') AND (Condition = '{0}')", strCondition));
                        if (SelectedCondition.Length > 0)
                        {
                            ltlChartSideLabel.Text = SelectedCondition[0]["Comments"].ToString();
                            ltlChartSideLabel.Visible = true;
                        }
                        else { ltlChartSideLabel.Visible = false; }
                    }
                    else
                    {
                        ltlChartSideLabel.Text = RPTHolder.ChartSideLabel;
                    }

                }
                if (!string.IsNullOrEmpty(RPTHolder.BottomLabelConditionTemplate) || !string.IsNullOrEmpty(RPTHolder.ChartBottomLabel))
                {

                    if (Table5.Rows[0].Cells.Count > 0)
                    {
                        Table5.Rows[0].Cells[0].Controls.Add(ltlChartBottomLabel);
                    }
                    ltlChartBottomLabel.Text = RPTHolder.ChartBottomLabel;
                    if (!string.IsNullOrEmpty(RPTHolder.BottomLabelConditionTemplate))
                    {
                        string strCondition = WidgetLoader.ReplaceParamValues(RPTHolder.BottomLabelConditionTemplate);
                        DataRow[] SelectedCondition = dtDynamicComments.Select(string.Format(@"(CommentId = 'ChartBottomLabel') AND (Condition = '{0}')", strCondition));
                        if (SelectedCondition.Length > 0)
                        {
                            ltlChartBottomLabel.Text = SelectedCondition[0]["Comments"].ToString();
                            ltlChartBottomLabel.Visible = true;

                        }
                        else { ltlChartBottomLabel.Visible = false; }
                    }
                    else
                    {
                        ltlChartBottomLabel.Text = RPTHolder.ChartBottomLabel;

                    }


                    //Table5.Rows[0].Cells[1].Width = new Unit(200);
                    //Table5.Rows[0].Cells[1].Wrap = false;

                    //}

                }
            }


        }
        protected void Page_Unload(object sender, EventArgs e)
        {
            if (WidgetLoader != null)
            {
                WidgetLoader.Dispose();
            }
        }
        protected void CleanXMLDataFolder()
        {

            string XMLDataFolder = Server.MapPath("~/Temp/FusionChartXMLData/");
            string[] XMLDataFileList = Directory.GetFiles(XMLDataFolder, Session["EmailID"].ToString() + "*.xml");
            foreach (string XMLDataFileName in XMLDataFileList)
            {
                FileInfo XMLDataFile = new FileInfo(XMLDataFileName);
                XMLDataFile.Delete();
            }
            Session["IsCleaned"] = 1;

        }
        void AddStyleSheetsToPage()
        {
            string StyleSheets = @"
         <style type='text/css'>
                .GridHead
                {{
                    color: Navy;
                    text-decoration: none;
                    font-family: Verdana;
                    font-size: 11px;
                    padding-left: 3px;
                }}
                .GridLink
                {{
                    color: blue;
                    text-decoration: none;
                    font-family: Verdana;
                    font-size: 11px;
                    padding-left: 3px;
                }}
                .GridLink:active
                {{
                    color: blue;
                    text-decoration: none;
                    font-family: Verdana;
                    font-size: 11px;
                    padding-left: 3px;
                }}
                .GridLink:visited
                {{
                    color: Navy;
                    text-decoration: none;
                    font-family: Verdana;
                    font-size: 11px;
                    padding-left: 3px;
                }}
                .GridLink:hover
                {{
                    color: #blue;
                    text-decoration: underline;
                    font-family: Verdana;
                    font-size: 11px;
                    padding-left: 3px;
                }}
            </style>
            <style type='text/css'>
                .GridHeader a:hover
                {{
                    color: #ff6355;
                    text-decoration: underline;
                    font-family: Verdana;
                    font-size: 11px;
                }}
                .GridHeader a
                {{
                    color: Navy;
                    text-decoration: none;
                    font-family: Verdana;
                    font-size: 11px;
                }}
                .GridHeader a:visited
                {{
                    color: Navy;
                    text-decoration: none;
                    font-family: Verdana;
                    font-size: 11px;
                }}
                .GridHeader a:active
                {{
                    color: Navy;
                    text-decoration: none;
                    font-family: Verdana;
                    font-size: 11px;
                }}
                .GridHeader th
                {{
                    padding-left: 1px;
                    padding-right: 10px;
                    vertical-align: middle;
                    text-align: left;
                    white-space: nowrap;
                }}
                .pagelink a
                {{
                    font: bold 8pt/20px Tahoma;
                    color: blue;
                    text-decoration: none;
                }}
                .pagelink a:hover
                {{
                    font: bold 8pt/20px Tahoma;
                    color: blue;
                    text-decoration: underline;
                }}
                .pagelink a:visited
                {{
                    font: bold 8pt/20px Tahoma;
                    color: navy;
                    text-decoration: none;
                }}
                .pagelink span
                {{
                    font: bold 8pt/20px Tahoma;
                    color: navy;
                    text-decoration: underline;
                }}
                .ColumnStyle td
                {{
                    padding-right: 10px;
                    white-space: nowrap;
                }}
            </style>
        ";
            Literal ltl = new Literal();
            ltl.Text = StyleSheets;
            Header.Controls.Add(ltl);
        }

        public string ImageDirection(string posNeg)
        {
            if (posNeg == "positive")
            {
                if (Session[Constants.SessionVariableNames.DIRECTION].ToString().ToLower() == "rtl") return "rtl";
                else return "ltr";
            }
            else if (Session[Constants.SessionVariableNames.DIRECTION].ToString().ToLower() == "rtl") return "ltr";
            else return "rtl";
            //return "rtl";
        }
    }

}
