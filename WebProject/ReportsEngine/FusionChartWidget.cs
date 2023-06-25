using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using InfoSoftGlobal;
using System.Data.SqlClient;
using Newtonsoft.Json;
namespace WebProject.ReportsEngine
{

    /// <summary>
    /// Summary description for FusionChartWidget
    /// </summary>
    public class FusionChartWidget : SimplePropertyMapper, IDataPresentator, IDrillDownableWidget
    {
        string SQLFusionChart = @"
SELECT     ChartId, ChartTag, ChartWidth,ChartHeight
FROM         RPTChartEngineFusionChartWidget
WHERE     (ChartId = '{0}')
";

        /// <summary>
        /// 0 - JS Variable Name,Chart Id,Chart Div Name
        /// 1 - Chart Flash File Name
        /// 2 - Data XML File Name
        /// 3 - ChartWidth
        /// 4 - Chart Height
        /// </summary>
        string ChartLoaderJS = @"
	 <script type=""text/javascript"">
        var m{0} = new FusionCharts(""{1}"", ""{0}"", ""{3}"", ""{4}"", ""0"", ""0"");
        m{0}.setDataURL(""{2}"");
        m{0}.addParam(""WMode"", ""transparent"");
       // m{0}.addParam(""scale"", ""exactfit"");
        m{0}.render(""{0}_div"");
    </script>
";
        string ChartLoaderJSDefered = @"
	 <script type=""text/javascript"">
            var m{0} = new FusionCharts(""{1}"", ""{0}"", ""{2}"", ""{3}"" , ""0"", ""1"", """", ""noScale"", ""EN"");
            m{0}.setDataXML(""<chart></chart>"");
            m{0}.addParam(""WMode"", ""transparent"");
            m{0}.render(""{4}_div"");
    </script>
";
        string _ChartId, _ContainerId, _ReportId;
        int _RowNo, _ColNo;
        Page _page;

        string _ChartTag, _ChartStyleTag = "", _ChartWidth, _ChartHeight, _WidgetWidth = "600", _WidgetHeight = "400"
                , _WidgetHeading = "";
        bool _IncludeSearchButton = true;
        protected string _ColorPaletteName = "", _ChartUniqueId;

        string _DrillDownWidgetId = "", _SearchPanelsToUpdate = "", _ExternalLinks = "", _DrillDownParamTemplate = "";
        string _ParentWidgetId = "", _ParentWidgetContainerClientId = "", _ChildWidgetContainerClientId;
        // public string DrillDownWidgetId { get { return _DrillDownWidgetId; } }
        protected string _ToolTipTemplate = "";
        bool _isSliced = false;
        string _SQLCommand = "";
        SQLCommandType _SQLCommandType = SQLCommandType.StoredProc;
        FusionChartStyle _ChartStyle = FusionChartStyle.MSColumn3D;
        ChartDataOrientation _DataOrientation = ChartDataOrientation.SimpleData;
        string _DataConnectionString = "", _ChartNoDataText = "Wait while chart gets loaded!";
        string _YSeriesRenderType = "";
        int _DYSeriesIndex = -1;
        string _ToolTipFormat = "";
        Literal WidgetContainer = new Literal();

        private string _IconToolText = "Click here to customize",
         _SearchIconText,
         _UpIconText,
         _DownIconText;
        bool _ShowIconsText;

        string _XMLDataFilePath;
        /*---- Start Report Properties --- */
        bool _DeferredDataLoading = false;

        /*---- End Report Properties --- */
        WidgetServerRequestType ServerRequestType = WidgetServerRequestType.Postback;
        IReportPortalSettings PortalPage;


        public FusionChartWidget(string ChartId, Page page, string ContainerId, int RowNo, int ColNo)
        {

            _ChartId = ChartId;
            _ContainerId = ContainerId;
            _RowNo = RowNo;
            _ColNo = ColNo;
            _page = page;
            _ReportId = _page.Request.QueryString["NextReportId"];
            WidgetContainer.ID = ChartId + "_ltrl";
            DateTime now = DateTime.Now;
            string xmlFileName = now.Day.ToString() + now.Hour.ToString() + now.Minute.ToString() + now.Millisecond.ToString();
            CUtilityWeb.PlaceControlInThePage(WidgetContainer, _page, ContainerId, RowNo, ColNo);

            _XMLDataFilePath = string.Format("~/Temp/FusionChartXMLData/{0}_{1}_{2}_{3}{4}_{5}.xml",
               CUtilityWeb.GetCurrentUserId(), ChartId, ContainerId, RowNo.ToString(), ColNo.ToString(), xmlFileName);

        }
        public FusionChartWidget(string ChartId, Page page)
        {
            _ChartId = ChartId;
            _page = page;

            if (_page is IReportPortalSettings)
            {
                PortalPage = _page as IReportPortalSettings;
                // ServerRequestType = PortalPage.FusionChartWidgetRequestType;
                _ReportId = PortalPage.NextReportId;
            }
        }
        public FusionChartWidget(string NextReportId, string ChartId)
        {
            _ChartId = ChartId;
            _ReportId = NextReportId;
        }
        public string GetChartXML(IndexedDictionary<string, IQueryParameter> Parameters)
        {
            DataTable dtReportWidget = null;
            XMLDataAdapter xmlDataAdapter;


            using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                dtReportWidget = CUtilityWeb.getDataTable(string.Format(SQLFusionChart, _ChartId), Conn);
            }
            LoadWidgetValues(dtReportWidget);
            LoadClassFields(_ChartId, _ChartId, "RPTChartEngineObjecProperty");
            LoadClassFields(_ReportId, _ChartId, "RPTChartEngineObjecProperty");
            xmlDataAdapter = new XMLDataAdapter(_SQLCommand, _DataOrientation, _DataConnectionString);
            xmlDataAdapter.ColorPalleteName = _ColorPaletteName;
            xmlDataAdapter.ToolTip = _ToolTipTemplate;
            xmlDataAdapter.YSeriesRenderType = _YSeriesRenderType;
            xmlDataAdapter.DYSeriesIndex = _DYSeriesIndex;
            xmlDataAdapter.WidgetId = _ChartId;
            xmlDataAdapter.isSliced = _isSliced;
            xmlDataAdapter.ToolTipFormat = _ToolTipFormat;
            xmlDataAdapter.DrillDownParamTemplate = QueryParameter.InsertQueryParameters(_DrillDownParamTemplate, Parameters);
            if (_ChartTag.Contains("::")) _ChartTag = QueryParameter.InsertQueryParameters(_ChartTag, Parameters, true);

            return _ChartTag + xmlDataAdapter.GetChartXML(Parameters) + _ChartStyleTag + "</chart>";

        }

        void LoadWidgetValues(DataTable dtReportWidget)
        {
            _ChartTag = dtReportWidget.Rows[0]["ChartTag"].ToString();
            _ChartWidth = dtReportWidget.Rows[0]["ChartWidth"].ToString();
            _ChartHeight = dtReportWidget.Rows[0]["ChartHeight"].ToString();
        }
        #region IDataPresentator Members
        WidgetHeadingInfo objWidgetHeading;
        public struct WidgetHeadingInfo
        {
            public string top, left, right, bottom;
        }

        public void InitJSONObjects()
        {
            if (!string.IsNullOrEmpty(_WidgetHeading))
            {
                try
                {
                    objWidgetHeading = JsonConvert.DeserializeObject<WidgetHeadingInfo>(_WidgetHeading);
                }
                catch (Exception ex) { }
            }
        }
        public DataTable QueryData(SearchPanel SPanel)
        {

            PortalPage = _page as IReportPortalSettings;

            if (PortalPage != null)
            {
                _SearchIconText = PortalPage.ReportHolder.SearchIconText;
                _UpIconText = PortalPage.ReportHolder.UpIconText;
                _DownIconText = PortalPage.ReportHolder.DownIconText;
                _ShowIconsText = PortalPage.ReportHolder.ShowIconsText;
                ServerRequestType = PortalPage.FusionChartWidgetRequestType;
            }
            DataTable dtReportWidget;
            XMLDataAdapter xmlDataAdapter;
            string ChartUniqueId, XMLData, FlashFilesPath, ChartSWF;

            _ChartUniqueId = ChartUniqueId = _ChartId + "_" + _ContainerId + "_" + _RowNo.ToString() + _ColNo.ToString();

            FlashFilesPath = PortalConfiguration.FusionChartsPath;

            using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                dtReportWidget = CUtilityWeb.getDataTable(string.Format(SQLFusionChart, _ChartId), Conn);
            }
            LoadWidgetValues(dtReportWidget);
            LoadClassFields(_ChartId, _ChartId, "RPTChartEngineObjecProperty");


            if (ServerRequestType == WidgetServerRequestType.Postback)
            {
                WidgetContainer.Text = "<div id='" + ChartUniqueId + "_div'>" + _ChartNoDataText + "</div>";

                if (dtReportWidget.Rows.Count < 1) throw new Exception(string.Format("Fusion Chart Widget({0}) Not Found", _ChartId));


                xmlDataAdapter = new XMLDataAdapter(_SQLCommand, SPanel, _DataOrientation, _DataConnectionString);

                xmlDataAdapter.ColorPalleteName = _ColorPaletteName;
                xmlDataAdapter.ToolTip = _ToolTipTemplate;

                xmlDataAdapter.YSeriesRenderType = _YSeriesRenderType;
                xmlDataAdapter.DYSeriesIndex = _DYSeriesIndex;
                XMLData = _ChartTag + xmlDataAdapter.GetChartXML() + "</chart>";
                System.IO.File.WriteAllText(_page.Server.MapPath(_XMLDataFilePath), XMLData);
                FlashFilesPath = CUtilityWeb.FixupUrl(FlashFilesPath + _ChartStyle.ToString() + ".swf");
                /// <summary>
                /// 0 - JS Variable Name,Chart Id,Chart Div Name
                /// 1 - Chart Flash File Name
                /// 2 - Data XML File Name
                /// 3 - ChartWidth
                /// 4 - Chart Height
                /// </summary>

                ChartLoaderJS = string.Format(ChartLoaderJS, ChartUniqueId, FlashFilesPath
                    , CUtilityWeb.FixupUrl(_XMLDataFilePath), _ChartWidth, _ChartHeight);

                _page.ClientScript.RegisterStartupScript(_page.GetType(), ChartUniqueId + "_Script", ChartLoaderJS);
                return null;
            }
            else
            {
                LoadClassFields(_ReportId, _ChartId, "RPTChartEngineObjecProperty");
                WidgetContainer.Text = "<div id='" + ChartUniqueId + "_ChartDiv' >" +
                    "<div id='" + ChartUniqueId + @"_div' >
Chart.
</div>
<div  style='position:relative;text-align:left;' name=""ChartButtonsREL"">
    <div  style='top: -20px;left:4px;position:absolute;' name=""ChartButtonsABS"">
";
                string DrillingArrows = "", SearchButtonHTML = "";
                if (!string.IsNullOrEmpty(_DrillDownWidgetId))
                {

                    IDrillDownableWidget ChildWidget = (IDrillDownableWidget)PortalPage.WidgetLoader.ReportWidgets[_DrillDownWidgetId].WidgetInstance;
                    ChildWidget.SetParentWidgetId(_ChartId);
                    //                DrillingArrows=string.Format(@"
                    //&nbsp;&nbsp;&nbsp;
                    //<img src=""{0}"" id=""{1}""  style='cursor:hand;display:none' border=""0"" alt=""Next Chart""  name=""DrillDownArrow"" onclick=""$('#' +objWidgets.getWidgetById('{2}').ContainerClientId).css({{ display: 'none' }});$('#' +objWidgets.getWidgetById('{3}').ContainerClientId).css({{ display: '' }});"" />
                    //", _page.ResolveUrl("~/App_Themes/Blue/Images/icons/DrillDownChart.png"),ChartUniqueId + "_DrillDown",_ChartId ,DrillDownWidgetId );
                    DrillingArrows = string.Format(@"<img src=""{0}"" id=""{1}""  style='margin:0 0 0 5px;cursor:hand;display:none;vertical-align:middle' border=""0"" alt=""Next Chart""  name=""DrillDownArrow"" onclick=""DrillDownArrow_Click('{2}','{3}')"" />",
                        _page.ResolveUrl(PortalConfiguration.ImagesPath + "icons/DrillDownChart.gif"), ContainerClientId + "_DrillDown", _ChartId, DrillDownWidgetId)
                        + (_ShowIconsText ? string.Format("<span style='margin-left:5px;display:none;font-family: verdana; font-size: 8.5pt;' relatedid='{0}'>{1}</span>", ContainerClientId + "_DrillDown_RelId", _DownIconText) : "");

                }
                if (_ParentWidgetId != "")
                {
                    DrillingArrows += string.Format(@"<img src=""{0}"" id=""{1}""  style='margin:0 0 0 5px;cursor:hand;display:none;vertical-align:middle' border=""0"" alt=""Previous Chart""  name=""DrillUpArrow"" onclick=""DrillUpArrow_Click('{2}','{3}');"" />",
                        _page.ResolveUrl(PortalConfiguration.ImagesPath + "icons/DrillUpChart.gif"), ContainerClientId + "_DrillUp", ParentWidgetId, _ChartId)
                        + (_ShowIconsText ? string.Format("<span style='margin-left:5px;display:none;font-family: verdana; font-size: 8.5pt;' relatedid='{0}'>{1}</span>", ContainerClientId + "_DrillUp_RelId", _UpIconText) : "");
                }
                if (_IncludeSearchButton)
                {
                    // WidgetContainer.Text = "<div id='" + ChartUniqueId + "_ChartDiv'  >" + WidgetContainer.Text;
                    SearchButtonHTML = string.Format(@"<img src=""{0}"" id=""{1}"" class=""dummyImage"" style='margin:0 0 0 5px;cursor: hand;vertical-align:middle' border=""0"" alt=""{2}""  name=""SearchButton""  />",
                        _page.ResolveUrl(PortalConfiguration.ImagesPath + "icons/btnSearch.png"), SPanel.ContainerTable.ClientID + "_img", _IconToolText)
                        + (_ShowIconsText ? "<span style='margin-left:5px;font-family: verdana; font-size: 8.5pt;'>" + _SearchIconText + "</span>" : "");
                    //SPanel.ContainerTable.Attributes.Add("style", "position:absolute");

                    // WidgetContainer.Text += SearchButtonHTML ;
                }
                WidgetContainer.Text += SearchButtonHTML + DrillingArrows + "</div></div></div>";
                FlashFilesPath = CUtilityWeb.FixupUrl(FlashFilesPath + _ChartStyle.ToString() + ".swf");

                ChartLoaderJSDefered = string.Format(ChartLoaderJSDefered, ChartUniqueId.Replace("_", ""), FlashFilesPath
                    , _WidgetWidth, _WidgetHeight, ChartUniqueId);

                _page.ClientScript.RegisterStartupScript(this.GetType(), ChartUniqueId, ChartLoaderJSDefered);

                if (!_page.ClientScript.IsStartupScriptRegistered("FusionChartDataUpdateJS"))
                {


                }
                return null;
            }
        }
        #endregion

        #region IDrillDownableWidget Members

        public string DrillDownWidgetId
        {
            get { return _DrillDownWidgetId; }
        }

        public string SearchPanelsToUpdate
        {
            get { return _SearchPanelsToUpdate; }
        }

        public string ExternalLinks
        {
            get { return _ExternalLinks; }
        }
        public string WidgetId { get { return _ChartId; } }
        public string DrillDownParamTemplate { get { return _DrillDownParamTemplate; } }
        public void SetParentWidgetId(string ParentWidgetId) //, string ParentWidgetContainerClientId)
        {
            _ParentWidgetId = ParentWidgetId;
            // _ParentWidgetContainerClientId = ParentWidgetContainerClientId;
            // IReportPortalSettings PortalPage = (IReportPortalSettings)_page;
            // IDrillDownableWidget _ParentWidgetId = (IDrillDownableWidget)PortalPage.WidgetLoader.ReportWidgets[_DrillDownWidgetId].WidgetInstance;
        }
        public string ParentWidgetId { get { return _ParentWidgetId; } }
        public string ContainerClientId { get { return _ChartUniqueId + "_ChartDiv"; } }
        #endregion
    }
}
