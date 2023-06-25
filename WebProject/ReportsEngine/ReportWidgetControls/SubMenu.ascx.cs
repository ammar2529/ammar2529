using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Reflection;
using System.Text;
using System.Collections;
using System.Web.UI.HtmlControls;
using WebProject.ReportsEngine;

namespace WebProject.ReportsEngine.ReportWidgetControls
{
    public partial class SubMenu : SimplePropertyMapperUC, IReportWidget// System.Web.UI.UserControl
    {
       
        IndexedDictionary<string, System.Web.UI.HtmlControls.HtmlTable> _ContainerTables = new IndexedDictionary<string, System.Web.UI.HtmlControls.HtmlTable>();
        IndexedDictionary<string, Panel> _ContainerPanels = new IndexedDictionary<string, Panel>();

        public bool AddSytleSheet = false;

        string _WidgetMargin = "", _IconPath = "",
            _IconLink = "", _IconCaption = "", _Orientation = "vertical", _AuthorisedRoles,
            _WidgetPadding = "", _WidgetId = "", _NextReportId = "", _ContainerId = "", _ActiveTabColor = "";
        int _RowNo = 0, _ColNo = 0;


        public SubMenu()
            : base()
        {
        }

        private void InitializeControl()
        {

        }


        public SubMenu(string WidgetId, string ContainerId, int RowNo, int ColNo)
            : base()
        {
            this.ID = WidgetId;
            this.Visible = true;
            InitializeControl();
            _WidgetId = WidgetId;
            string NextReportId = this.Page.Request.QueryString["NextReportId"];
            _NextReportId = NextReportId;
            LoadClassFields(NextReportId, _WidgetId, "RPTChartEngineObjecProperty");

            CUtilityWeb.PlaceControlInThePage(this, this.Page, ContainerId, RowNo, ColNo);
            _ContainerId = ContainerId;
            _RowNo = RowNo; _ColNo = ColNo;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            BuildSubMenu();
        }

        void BuildSubMenu()
        {


            //if(AddSytleSheet==false)
            //    ApplyStyleSheetsToPage();

            string strIconCaptions = _IconCaption;

            if (_IconPath.Length > 0 && _IconLink.Length > 0)
            {
                string[] strIconUrls = _IconPath.Split('|');

                HtmlTable htmltbl = new HtmlTable();
                HtmlTableRow htmltr = new HtmlTableRow();
                for (int i = 0; i < strIconUrls.Length; i++)
                {

                    HtmlTableCell htmlcell = new HtmlTableCell();
                    htmlcell.ID = "cell" + i.ToString() + _ContainerId;
                    htmlcell.Attributes.Add("class", "SubMenuLink");
                    htmlcell.Attributes.Add("nowrap", "nowrap");
                    HyperLink hyperlink = new HyperLink();
                    hyperlink.ID = "lnk" + i.ToString() + _ContainerId;
                    hyperlink.CssClass = "SubMenuText";
                    htmlcell.Controls.Add(hyperlink);
                    htmltr.Controls.Add(htmlcell);
                    //HtmlAnchor htmlatag = new HtmlAnchor();

                    //htmlatag.ID = "a" + i.ToString() + _ContainerId;
                    //htmlatag.HRef = "#";
                    //htmlatag.Attributes.Add("class", "dock-item");

                    //Label lblcaption = new Label();
                    //lblcaption.ID = "lbl" + i.ToString() + _ContainerId;

                    //HtmlImage imgTag=new HtmlImage();
                    //imgTag.ID = "img" + i.ToString() + _ContainerId;
                    //imgTag.Src=strIconUrls[i];

                    //htmlatag.Controls.Add(lblcaption);
                    //htmlatag.Controls.Add(imgTag);



                }
                htmltbl.Controls.Add(htmltr);
                pnlMain.Controls.Add(htmltbl);
                AddData(pnlMain, "NavigateUrl", _IconLink);
                AddData(pnlMain, "ToopTip", _IconCaption);


            }


        }


        void AddData(Panel Dockpanel, string propertyname, string values)
        {
            string[] strSeparator = values.Split('|');

            for (int i = 0; i < strSeparator.Length; i++)
            {
                foreach (Control hyControls in Dockpanel.Controls)
                {
                    HyperLink hyperlink = (HyperLink)hyControls.FindControl("lnk" + i.ToString() + _ContainerId);
                    if (propertyname == "NavigateUrl")
                    {
                        hyperlink.NavigateUrl = strSeparator[i].ToString();

                        if (_ActiveTabColor.Length > 0 && _ActiveTabColor.Length > 0)
                        {
                            HtmlTableCell htmlcell = (HtmlTableCell)hyperlink.Parent;
                            string strActiveTabColor = _ActiveTabColor;
                            String currentPage = Request.Url.ToString().ToLower();
                            hyperlink.NavigateUrl = strSeparator[i].ToString();

                            if (currentPage.Contains(strSeparator[i].Substring(2).ToLower()))
                            {
                                htmlcell.Attributes.Add("class", "SubBlankMenuLink");
                                htmlcell.Style["background-color"] = strActiveTabColor;
                                htmlcell.Style["color"] = "ThreeDDarkShadow";
                            }
                            else
                            {
                                hyperlink.Style["color"] = "Black";
                            }
                        }
                    }
                    else if (propertyname == "ToopTip")
                    {
                        hyperlink.Text = strSeparator[i].ToString();
                        hyperlink.ToolTip = strSeparator[i].ToString();
                        //Label lblcaption = (Label)hyControls.FindControl("lbl" + i.ToString() + _ContainerId);
                        //lblcaption.Text = strSeparator[i].ToString();
                        //lblcaption.Style.Add("display", "none");

                        //HtmlImage imgTag = (HtmlImage)hyControls.FindControl("img" + i.ToString() + _ContainerId);
                        //imgTag.Alt = strSeparator[i].ToString();
                    }

                }

            }

        }

        void ApplyStyleSheetsToPage()
        {
            string StyleSheets = @"

    <style type='text/css'>
        .SubMenuLink
        {
            margin:0 5px 0 0; 
            background: #EBE3CD url(/eforms/App_Themes/Blue/Images/ImageButton.gif) repeat;
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
        .SubMenuText a:active {
            color: #FF99CC;
            text-decoration: overline underline;
        }
       .SubBlankMenuLink
        {
            margin:0 5px 0 0; 
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
    </style>

";
            Literal ltl = new Literal();
            ltl.Text = StyleSheets;
            this.Page.Header.Controls.Add(ltl);

            AddSytleSheet = true;


        }
    }
}