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
    public partial class iFrameDashboard : System.Web.UI.Page
    {
        ReportHolder RPTHolder = null;
        ReportsSecurity RPTSEC;
        ReportWidgetLoader _WidgetLoader;

        protected void Page_Unload(object sender, EventArgs e)
        {
            if (_WidgetLoader != null)
            {
                _WidgetLoader.Dispose();
            }

        }
        protected void Page_Init(object sender, EventArgs e)
        {
            Control LayoutControl;
            // Control ContentPlaceHolder2;
            object obj = CUtilityWeb.PortalEnvironment();
            if (Request.QueryString["NextReportID"] != null)
            {
                //return;
                RPTHolder = new ReportHolder(Request.QueryString["NextReportID"]);

                LayoutControl = LoadControl(RPTHolder.ReportLayoutControl);
                //ContentPlaceHolder2 = this.Master.FindControl("ContentPlaceHolder2");
                //ContentPlaceHolder2.Controls.Add(LayoutControl);
                pnlReportBody.Controls.Add(LayoutControl);
                LayoutControl.ID = "ReportLayoutControl";
                LayoutControl.Visible = true;

                ((IReportLayout)LayoutControl).InitializeHTMLLayout();
                if (CUtilityWeb.GetCurrentUserId() != "")
                {
                    _WidgetLoader = new ReportWidgetLoader(this, Request.QueryString["NextReportID"]);
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            //Literal ltrl = new Literal();
            //ltrl.Text = " <link href='../../StyleSheets/StyleSheet_eng.css' rel='stylesheet' type='text/css' />";
            //@"<script language=""JavaScript"" src=""/eFormsMIS/DotNetPages/ReportsEngine/FusionCharts/FusionCharts.js""></script>";
            //Header.Controls.Add(ltrl);

            AddStyleSheetsToPage();
            if (_WidgetLoader != null)
            {
                _WidgetLoader.QueryData();
            }
            //lblErrorDetail.Visible = false;

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
                //if (RPTHolder.ReportDepth != null)
                //    lblReportDepth.Text = _WidgetLoader.ReplaceParamValues(RPTHolder.ReportDepth); //SPanel.InsertParamValues(RPTHolder.ReportDepth, FieldValueType.Text);
                //if (RPTHolder.ChartSideLabel != null)
                //{
                //    Literal ltlChartSideLabel = new Literal();
                //    ltlChartSideLabel.Text = RPTHolder.ChartSideLabel;

                //    if (Table5.Rows[0].Cells.Count >= 1)
                //    {
                //        if (Table5.Rows[0].Cells.Count == 1)
                //        {
                //            TableCell TC = new TableCell();
                //            TC.Controls.Add(ltlChartSideLabel);
                //            Table5.Rows[0].Cells.Add(TC);
                //        }
                //        else if (Table5.Rows[0].Cells.Count > 1)
                //        {

                //            Table5.Rows[0].Cells[1].Controls.Add(ltlChartSideLabel);

                //        }
                //        Table5.Rows[0].Cells[1].VerticalAlign = VerticalAlign.Top;
                //        Table5.Rows[0].Cells[1].Style.Add("Text-Align", "Left");
                //    }

                //}
                //if (RPTHolder.ChartBottomLabel != null)
                //{
                //    Literal ltlChartBottomLabel = new Literal();
                //    ltlChartBottomLabel.Text = RPTHolder.ChartBottomLabel;

                //    //if (Table5.Rows[0].Cells.Count >= 1)
                //    //{
                //    //if (Table5.Rows[0].Cells.Count == 1)
                //    //{
                //    //    TableCell TC = new TableCell();
                //    //    TC.Controls.Add(ltlChartBottomLabel);
                //    //    Table5.Rows[0].Cells.Add(TC);
                //    //}
                //    //else 
                //    if (Table5.Rows[0].Cells.Count > 0)
                //    {

                //        Table5.Rows[0].Cells[0].Controls.Add(ltlChartBottomLabel);

                //    }
                //    //Table5.Rows[0].Cells[1].Width = new Unit(200);
                //    //Table5.Rows[0].Cells[1].Wrap = false;

                //    //}

                //}
            }
            SlideMenu1.Visible = false;

        }


        protected void Page_PreRender(object sender, EventArgs e)
        {
            return;
            foreach (Control ctrl in pnlReportBody.Controls)
            {
                IReportLayout LayoutControl = ctrl as IReportLayout;
                if (LayoutControl != null)
                {
                    foreach (HtmlTable table in LayoutControl.HTMLLayoutTables.Values)
                    {
                        AddEditButton(table);
                    }
                }
            }
        }
        void AddEditButton(HtmlTable table)
        {
            int RowNo = 0, CellNo = 0;
            foreach (HtmlTableRow row in table.Rows)
            {
                foreach (HtmlTableCell cell in row.Cells)
                {
                    //foreach (Control ctrl in cell.Controls)
                    //{
                    //    HtmlTable ChildTable = ctrl as HtmlTable;
                    //    if (ChildTable != null)
                    //    {
                    //        AddEditButton(ChildTable);
                    //    }
                    //}
                    Literal ltl = new Literal();
                    //javascript:void window.open('','_Self')
                    ltl.Text = string.Format(@"
<div  style='text-align:center;vertical-align:top' >
    <a href='#' onclick=""javascript: window.open('ReportDesigner/SelectCellWidget.aspx?ReportId={0}&ContainerId={1}&ColNo={2}&RowNo={3}','_Self');""> |Click To Edit|</a>
</div>", NextReportId, table.ID, CellNo.ToString(), RowNo.ToString());

                    if (cell.Controls.Count == 1) if (cell.Controls[0] is LiteralControl) if (((LiteralControl)(cell.Controls[0])).Text.Trim() == "")
                            {
                                //((LiteralControl)(cell.Controls[0])).Text = "";
                                //cell.Height = "100";
                                //cell.Width = "100";
                                ltl.Text = string.Format(@"
                   <div  style='width:100%;height:100%;vertical-align:top' >
                    {0}
                </div>", ltl.Text);


                            }
                    cell.Controls.AddAt(0, ltl);
                    CellNo += 1;
                }
                RowNo += 1;
                CellNo = 0;
            }
        }
        protected void CleanXMLDataFolder()
        {
            if (CUtilityWeb.GetCurrentUserId() == null) { return; }
            string XMLDataFolder = Server.MapPath("~/Temp/FusionChartXMLData/");
            string[] XMLDataFileList = Directory.GetFiles(XMLDataFolder, CUtilityWeb.GetCurrentUserId() + "*.xml");
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
    </style>
    <style type='text/css'>
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
        .MainPanel
        { 
            position: relative;
            color: Navy;
            Height:100%;
            Width:100%
        }
       body   
        {   
           /*overflow:hidden;
           height: 100%;   */
           margin: 0;   
           padding:0;   
        } 
        .spPanel
        {
	        position:absolute;
            border:solid 1px gray;
        }
    </style>

 <style type='text/css'>
        .SubMenuLink
        {
            margin:0 5px 0 0; 
            background: #EBE3CD url(/App_Themes/Blue/Images/ImageButton.gif) repeat;
            line-height: 14px;
            padding: 0px 0 0 0;
            font: bold 7.5pt verdana, arial, sans-serif;
            color:ThreeDDarkShadow;
            height: 20px;
            BORDER-RIGHT: silver 1px solid;
            BORDER-LEFT: silver 1px solid; 
            BORDER-TOP: silver 1px solid;
            BORDER-BOTTOM: silver 1px solid; 
            text-decoration:none;
        }
        .SubMenuText
        {
            font: bold 7.5pt verdana, arial, sans-serif;
            text-decoration:none;
             padding-left:10px;
    padding-right:10px;
        }
/*----------- loading mask CSS --------------------------*/
    .loadmask {
        z-index: 100;
        position: absolute;
        top:0;
        left:0;
        -moz-opacity: 0.5;
        opacity: .50;
        filter: alpha(opacity=50);
        background-color: #CCC;
        width: 100%;
        height: 100%;
        zoom: 1;
    }
    .loadmask-msg {
        z-index: 20001;
        position: absolute;
        top: 0;
        left: 0;
        border:1px solid #6593cf;
        background: #c3daf9;
        padding:2px;
    }
    .loadmask-msg div {
        padding:5px 10px 5px 25px;
        background: #fbfbfb url('../../JQuery/AutoComplete/loading.gif') no-repeat 5px 5px;
        line-height: 16px;
	    border:1px solid #a3bad9;
        color:#222;
        font:normal 11px tahoma, arial, helvetica, sans-serif;
        cursor:wait;
    }
    .masked {
        overflow: hidden !important;
    }
    .masked-relative {
        position: relative !important;
    }
    .masked-hidden {
        visibility: hidden !important;
    }
/*----------------------logger CSS-----------------------------*/
    * HTML #Logger
    {
        position: absolute;
    }
    body{                           
      background-image:url(about:blank); 
      background-attachment:fixed;
    }
    </style>
";
            Literal ltl = new Literal();
            ltl.Text = StyleSheets;
            Header.Controls.Add(ltl);

        }
        public WidgetServerRequestType SearchPanelRequestType
        {
            get { return WidgetServerRequestType.WebServiceCall; }
        }
        public WidgetServerRequestType FusionChartWidgetRequestType
        {
            get { return WidgetServerRequestType.WebServiceCall; }
        }
        public WidgetServerRequestType PageRequestType
        {
            get { return WidgetServerRequestType.WebServiceCall; }
        }
        public string ContentHolderName
        {
            get { return "ContentPlaceHolder2"; }
        }
        public bool IsUsingWidgetFramework { get { return true; } }
        public string NextReportId { get { return Request.QueryString["NextReportId"]; } }
        public ReportWidgetLoader WidgetLoader { get { return _WidgetLoader; } }
        public ReportHolder ReportHolder { get { return RPTHolder; } }
    }
}
