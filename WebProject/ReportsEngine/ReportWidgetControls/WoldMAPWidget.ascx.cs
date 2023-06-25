using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Collections;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace WebProject.ReportsEngine.ReportWidgetControls 
{
    public partial class WoldMAPWidget : System.Web.UI.UserControl, IDataPresentator, IDrillDownableWidget
    {
        string ReportId, Parameters;
        DataTable MapIds;
        string _WorldMapType = "8-Continents"; //"6-Continents"

        protected string _DataConnectionString = null;
        public string DataConnectionString
        {
            get { return _DataConnectionString; }
        }
        protected SQLCommandType _SQLCommandType = SQLCommandType.StoredProc;
        public SQLCommandType SQLCommandType
        {
            get { return _SQLCommandType; }
        }
        protected string _SQLCommand;
        public string SQLCommand
        {
            get { return _SQLCommand; }
            set { _SQLCommand = value; }
        }
        string _DrillDownWidgetId = "", _SearchPanelsToUpdate = "", _ExternalLinks = "", _DrillDownParamTemplate = "";
        string _ContinentDrillDownWidgetId = "", _ContinentSearchPanelsToUpdate = "", _ContinentExternalLinks = "", _ContinentDrillDownParamTemplate = "";

        string _ParentWidgetId = "";
        bool _IncludeSearchButton = true;
        bool AsyncallyCalled = false;
        StoredProcInvoker SPI;
        string _WidgetId, _ContainerId, WidgetUniqueId;
        int _RowNo, _ColNo, _WidgetWidth = 600, _WidgetHeight = 600,
            _WorldMapWidth = 300, _WorldMapHeight = 300, _ContinentMapWidth = 400, _ContinentMapHeight = 400;
        string _WidgetHeading = "", _InitialContinent = "ME";//@"<div style='text-align:center;vertical-align:middle;font-family:Verdana;font-size:9pt'>Test Grid  Heading - ::FromDate:: </div>";

        string MAPLoaderJS = @"
//debugger;
            var m{0} = new FusionMaps(""{1}"", ""{0}"", ""{2}"", ""{3}"" , ""0"", ""1"", """", ""noScale"", ""EN"");
            m{0}.setDataXML(""<map showCanvasBorder='1' canvasBorderColor='f1f1f1' canvasBorderThickness='2' borderColor='00324A' fillColor='F0FAFF' hoverColor='C0D2F8'>{5}</map>"");
            m{0}.addParam(""WMode"", ""transparent"");
            m{0}.render($(""div[TargetMapId='{4}']"").get(0).id);
";

        public WoldMAPWidget(string GridId, string ContainerId, int RowNo, int ColNo)
        {
            ReportId = ((IReportPortalSettings)this.Page).NextReportId;
            _WidgetId = GridId;
            _RowNo = RowNo;
            _ContainerId = ContainerId;
            _ColNo = ColNo;
            WidgetUniqueId = GridId + "_" + _ContainerId + "_" + _RowNo.ToString() + _ColNo.ToString();
            LoadClassFields(WidgetId, WidgetId, "RPTChartEngineObjecProperty");
            LoadClassFields(ReportId, WidgetId, "RPTChartEngineObjecProperty");
            // GridView1.PageSize = _PageSize;
        }

        private void LoadClassFields(string widgetId1, string widgetId2, string v)
        {
            throw new NotImplementedException();
        }

        public WoldMAPWidget()
        {

        }
        public WoldMAPWidget(string ReportId, string WidgetId, int PageIndex, string SortBy, string Parameters)
        {
            this.ReportId = ReportId;
            _WidgetId = WidgetId;
            //this.SortBy = SortBy;
            //this.PageIndex = PageIndex;
            this.Parameters = Parameters;
            AsyncallyCalled = true;
            LoadClassFields(WidgetId, WidgetId, "RPTChartEngineObjecProperty");
            LoadClassFields(ReportId, WidgetId, "RPTChartEngineObjecProperty");

        }
        protected void Page_Init(object sender, EventArgs e)
        {
            if (AsyncallyCalled)
            {
                //InitlizeGrid();
            }

        }

        //void InitlizeGrid()
        //{
        //    txtPageIndex.Value = PageIndex.ToString();
        //    txtSortBy.Value = SortBy;
        //    GridView1.ID = ReportId + "_" + WidgetId;
        //    GridView1.PageIndex = PageIndex;

        //    IndexedDictionary<string, IQueryParameter> SPParams = QueryParameter.GetQueryParameters(Parameters);
        //    _DrillDownParamTemplate = QueryParameter.InsertQueryParameters(_DrillDownParamTemplate, SPParams);
        //    ltlGridHeadingDiv.Text = _WidgetHeading != "" ? QueryParameter.InsertQueryParameters(_WidgetHeading, SPParams,true ) : "";

        //    QueryData(SPParams);
        //}



        public void QueryData(IndexedDictionary<string, IQueryParameter> QueryParameters)
        {
            //switch (SQLCommandType)
            //{
            //    case SQLCommandType.StoredProc:
            //        if (_DataConnectionString == null)
            //        {
            //            SPI = new StoredProcInvoker(_SQLCommand, QueryParameters);
            //        }
            //        else
            //        {

            //            SPI = new StoredProcInvoker(_SQLCommand, QueryParameters, _DataConnectionString);
            //        }
            //        SPI.ResultTable.DefaultView.Sort = SortBy;
            //        GridView1.DataSource = SPI.ResultTable;

            //        if (SPI.ResultTable.Columns.Contains("RowStyle"))  //if templated grid
            //        {
            //            GridView1.RowDataBound += new GridViewRowEventHandler(GridView1_RowDataBound_Templated);
            //        }
            //        GridView1.DataBind();
            //        //if (GridView1.Rows.Count == 0) GridView1.Height = new Unit("90%");
            //        break;
            //    case SQLCommandType.SQLText:
            //        //return null;
            //        break;
            //    default:
            //        //return null;
            //        break;
            //}
            //return null;
        }

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
        public string DrillDownParamTemplate { get { return _DrillDownParamTemplate; } }
        public string WidgetId { get { return _WidgetId; } }
        public void SetParentWidgetId(string ParentWidgetId) //, string ParentWidgetContainerClientId)
        {
            _ParentWidgetId = ParentWidgetId;
        }
        public string ParentWidgetId { get { return _ParentWidgetId; } }
        public string ContainerClientId { get { return WidgetUniqueId; } }
        #endregion

        #region ILayoutWidget Members

        string ILayoutWidget.WidgetId
        {
            get { throw new NotImplementedException(); }
        }

        #endregion
        #region IDataPresentator Members

        public DataTable QueryData(SearchPanel SPanel)
        {

            System.Text.StringBuilder ButtonsPanelHtml = new System.Text.StringBuilder(512);

            bool AddButtonsPanel = false;
            string
            DrillDownSrc = this.Page.ResolveUrl("~/App_Themes/Blue/Images/icons/DrillDownChart.gif"),
            DrillUpSrc = this.Page.ResolveUrl("~/App_Themes/Blue/Images/icons/DrillUpChart.gif"),
            SearchIconSrc = this.Page.ResolveUrl("~/App_Themes/Blue/Images/icons/btnSearch.png");

            //   <div  style='top: -20px;left:4px;position:absolute;' name='ChartButtonsABS'>
            ButtonsPanelHtml.Append(@"
        <div  style='position:relative;text-align:left;' name='ChartButtonsREL'>
            <div   name='ChartButtonsABS'>
                                ");
            IReportPortalSettings PortalPage = (IReportPortalSettings)this.Page;

            //        if (_IncludeSearchButton)
            //        {
            //            ButtonsPanelHtml.AppendFormat(@"<img src=""{0}"" id=""{1}_img"" class=""dummyImage"" style='margin:0 0 0 5px;cursor: hand' border=""0"" 
            //                alt=""Search Panel""  name=""SearchButton""    />",
            //             SearchIconSrc, SPanel.ContainerTable.ClientID);
            //            AddButtonsPanel = true;

            //        }
            if (_ParentWidgetId != "")
            {
                ButtonsPanelHtml.AppendFormat(@"<img src=""{0}"" id=""{1}"" style='margin:0 0 0 5px;cursor:hand;display:none' border=""0"" alt=""Previous Chart""  
            name=""DrillUpArrow""  onclick=""DrillUpArrow_Click('{2}','{3}')""  />",
                    DrillUpSrc, WidgetUniqueId + "_DrillUp", _ParentWidgetId, _WidgetId);

                AddButtonsPanel = true;

            }
            if (!string.IsNullOrEmpty(_DrillDownWidgetId))
            {
                IDrillDownableWidget ChildWidget = (IDrillDownableWidget)PortalPage.WidgetLoader.ReportWidgets[_DrillDownWidgetId].WidgetInstance;
                ChildWidget.SetParentWidgetId(_WidgetId);

                ButtonsPanelHtml.AppendFormat(@"<img src=""{0}"" id=""{1}"" style='margin:0 0 0 5px;cursor:hand;display:none' border=""0"" alt=""Next Chart""  
                name=""DrillDownArrow""  onclick=""DrillDownArrow_Click('{2}','{3}')""  />",
                   DrillDownSrc, WidgetUniqueId + "_DrillDown", _WidgetId, DrillDownWidgetId);
                AddButtonsPanel = true;
            }


            ButtonsPanelHtml.Append(@"
            </div>
        </div>
                                ");
            if (AddButtonsPanel)
            {
                ltlButtonsPanel.Text = ButtonsPanelHtml.ToString();

            }
            //FCMap_NorthAmerica.swf
            // CentralAmerica = MapsPath + "FCMap_CentralAmerica.swf",
            // MiddleEast = MapsPath + "FCMap_MiddleEast.swf",
            string WorldMapSWF = _WorldMapType == "8-Continents" ? "FCMap_World8.swf" : "FCMap_World.swf";

            string MapsPath = CUtilityWeb.FixupUrl(PortalConfiguration.FusionMapsPath),
                CountriesMapPath = MapsPath + WorldMapSWF,
                NorthAmericaPath = MapsPath + "FCMap_NorthAmerica.swf",
                SouthAmericaPath = MapsPath + "FCMap_SouthAmerica.swf",
                CentralAmericaPath = MapsPath + "FCMap_CentralAmerica.swf",
                EuropePath = MapsPath + "FCMap_Europe.swf",
                AfricaPath = MapsPath + "FCMap_Africa.swf",
                MiddleEeastPath = MapsPath + "FCMap_MiddleEast.swf",
                AsiaPath = MapsPath + "FCMap_Asia.swf",
                OceaniaPath = MapsPath + "FCMap_Oceania.swf";


            WorldContinentsMap.Attributes.Add("TargetMapId", _WidgetId + "_" + WorldContinentsMap.ID);
            Continent_NA.Attributes.Add("TargetMapId", _WidgetId + "_" + Continent_NA.ID);
            Continent_SA.Attributes.Add("TargetMapId", _WidgetId + "_" + Continent_SA.ID);
            Continent_CA.Attributes.Add("TargetMapId", _WidgetId + "_" + Continent_CA.ID);
            Continent_EU.Attributes.Add("TargetMapId", _WidgetId + "_" + Continent_EU.ID);
            Continent_AF.Attributes.Add("TargetMapId", _WidgetId + "_" + Continent_AF.ID);
            Continent_ME.Attributes.Add("TargetMapId", _WidgetId + "_" + Continent_ME.ID); //string.Format(@"$('[TargetMapId]').not('[TargetMapId=&quot;{0}&quot;]').css('display','none').('[TargetMapId=&quot;{1}&quot;]').css('display','');", _WidgetId + "_" + WorldContinentsMap.ID)
            Continent_AS.Attributes.Add("TargetMapId", _WidgetId + "_" + Continent_AS.ID);
            Continent_OC.Attributes.Add("TargetMapId", _WidgetId + "_" + Continent_OC.ID); //string.Format(@"$('[TargetMapId]').not('[TargetMapId=&quot;{0}&quot;]').css('display','none').('[TargetMapId=&quot;{1}&quot;]').css('display','');", _WidgetId + "_" + WorldContinentsMap.ID)


            string DDLParamTemp = "", DDLContinentParamTemp = "", WorldLinkTemplate = "", ContinentLinkTemplate = "", WMapData = "";
            //if(DrillDownParamTemplate!="" )
            DDLParamTemp = _WidgetId + "|||" + _DrillDownParamTemplate.Replace("%Continent", "::Continent::").Replace("%ContryName", "::CountryName::").Replace("%CountryCode", "::ShortName::");

            if (_ContinentDrillDownParamTemplate != "")
            {
                DDLContinentParamTemp = _WidgetId + "|||" + _ContinentDrillDownParamTemplate.Replace("%Continent", "::Continent::").Replace("%ContryName", "::CountryName::").Replace("%CountryCode", "::ShortName::");
                ContinentLinkTemplate = string.Format("javascript:DrillDownWidget('{0}','{1}');", DDLContinentParamTemp, _ContinentSearchPanelsToUpdate);
            }

            if (_ContinentMapWidth == 0 || _ContinentMapHeight == 0)
            {
                WorldLinkTemplate = string.Format("javascript:DrillDownWidget('{0}');", DDLParamTemp);
                Continent_NA.Visible = Continent_CA.Visible = Continent_SA.Visible = Continent_EU.Visible = Continent_AF.Visible = Continent_ME.Visible = Continent_AS.Visible = Continent_OC.Visible = false;
            }
            else
            {
                WorldLinkTemplate = string.Format("javascript:ShowContinent('{0}','{1}::ShortName::');UpdateSearchPanels('{2}');",
                    _WidgetId + "_" + WorldContinentsMap.ID, _WidgetId + "_Continent_", DDLParamTemp);
            }


            WMapData = BuildMapEntityData("WorldContinentsMap",
                WorldLinkTemplate, false);

            StringBuilder sbMapsJS = new StringBuilder(1048);
            sbMapsJS.AppendFormat(@"
var LoadCharts_{1} = function(){{
$('[TargetMapId=\""\{0}\""]').css({{display:''}});
", _WidgetId + "_Continent_" + _InitialContinent, _WidgetId);
            sbMapsJS.AppendFormat(
           MAPLoaderJS, _WidgetId + "_" + WorldContinentsMap.ID, CountriesMapPath
               , _WorldMapWidth, _WorldMapHeight, _WidgetId + "_" + WorldContinentsMap.ID, WMapData);
            if (!(_ContinentMapWidth == 0 || _ContinentMapHeight == 0))
            {
                sbMapsJS.AppendFormat(
                MAPLoaderJS, _WidgetId + "_" + Continent_NA.ID, NorthAmericaPath
                    , _ContinentMapWidth, _ContinentMapHeight, _WidgetId + "_" + Continent_NA.ID
                    , BuildMapEntityData(Continent_NA.ID, ContinentLinkTemplate, false));

                sbMapsJS.AppendFormat(
                MAPLoaderJS, _WidgetId + "_" + Continent_SA.ID, SouthAmericaPath
                    , _ContinentMapWidth, _ContinentMapHeight, _WidgetId + "_" + Continent_SA.ID,
                    BuildMapEntityData(Continent_SA.ID, ContinentLinkTemplate, false));

                sbMapsJS.AppendFormat(
                MAPLoaderJS, _WidgetId + "_" + Continent_CA.ID, CentralAmericaPath
                    , _ContinentMapWidth, _ContinentMapHeight, _WidgetId + "_" + Continent_CA.ID,
                    BuildMapEntityData(Continent_CA.ID, ContinentLinkTemplate, false));

                sbMapsJS.AppendFormat(
                MAPLoaderJS, _WidgetId + "_" + Continent_EU.ID, EuropePath
                    , _ContinentMapWidth, _ContinentMapHeight, _WidgetId + "_" + Continent_EU.ID,
                    BuildMapEntityData(Continent_EU.ID, ContinentLinkTemplate, false));

                sbMapsJS.AppendFormat(
                MAPLoaderJS, _WidgetId + "_" + Continent_AF.ID, AfricaPath
                    , _ContinentMapWidth, _ContinentMapHeight, _WidgetId + "_" + Continent_AF.ID,
                    BuildMapEntityData(Continent_AF.ID, ContinentLinkTemplate, false));

                sbMapsJS.AppendFormat(
                MAPLoaderJS, _WidgetId + "_" + Continent_ME.ID, MiddleEeastPath
                    , _ContinentMapWidth, _ContinentMapHeight, _WidgetId + "_" + Continent_ME.ID,
                    BuildMapEntityData(Continent_ME.ID, ContinentLinkTemplate, false));

                sbMapsJS.AppendFormat(
                MAPLoaderJS, _WidgetId + "_" + Continent_AS.ID, AsiaPath
                    , _ContinentMapWidth, _ContinentMapHeight, _WidgetId + "_" + Continent_AS.ID,
                    BuildMapEntityData(Continent_AS.ID, ContinentLinkTemplate, false));

                sbMapsJS.AppendFormat(
                MAPLoaderJS, _WidgetId + "_" + Continent_OC.ID, OceaniaPath
                    , _ContinentMapWidth, _ContinentMapHeight, _WidgetId + "_" + Continent_OC.ID,
                    BuildMapEntityData(Continent_OC.ID, ContinentLinkTemplate, false));
            }
            sbMapsJS.AppendFormat(@"
}}
setTimeout(LoadCharts_{0},6000);", _WidgetId);

            this.Page.ClientScript.RegisterStartupScript(this.GetType(), WidgetUniqueId + "_JS", sbMapsJS.ToString(), true);

            string WidgetWidthAttribute = string.Format(";Width:{0}px", _WorldMapWidth + _ContinentMapWidth),
                   WidgetHeightAttribute = string.Format(";Height:{0}px", _WorldMapHeight + _ContinentMapHeight);

            ltlWidgetStartHTML.Text = string.Format("\t\n<div id='{0}' style='{1}' >", WidgetUniqueId, WidgetWidthAttribute + WidgetHeightAttribute);
            ltlWidgetEndHTML.Text = "\t\n</div>";
            this.ID = WidgetId;

            CUtilityWeb.PlaceControlInThePage(this, this.Page, _ContainerId, _RowNo, _ColNo);
            CUtilityWeb.AddScriptReference(PortalConfiguration.FusionMapsPath + "/FusionMaps.js", this.Page);
            return null;
        }
        string BuildMapEntityData(string MapId, string LinkTemplate, bool UseShortName)
        {
            //Dictionary<string, string> ColPlaceHolders = new Dictionary<string, string>();
            List<string> ColPlaceHolders = new List<string>();

            int StartIndex = 0, EndIndex = -1;
            string ColumnName = "";
            while (true)
            {
                StartIndex = LinkTemplate.IndexOf("::", StartIndex);
                if (StartIndex > -1)
                {
                    EndIndex = LinkTemplate.IndexOf("::", StartIndex + 2);
                    if (EndIndex > -1)
                    {
                        ColumnName = LinkTemplate.Substring(StartIndex + 2, (EndIndex - StartIndex) - 2);
                        ColPlaceHolders.Add(ColumnName);
                        StartIndex = EndIndex + 2;
                    }
                }
                if (EndIndex == -1 || StartIndex == -1) break;
            }

            StringBuilder EntityDataXML = new StringBuilder(1024);
            DataTable dtMapIds = GetMapIdsTable();
            DataRow[] drsMapIds = dtMapIds.Select(string.Format("MapId='{0}'", MapId));
            EntityDataXML.Append(@"<data> \");
            foreach (DataRow dr in drsMapIds)
            {
                string DDL = LinkTemplate;
                foreach (string ColName in ColPlaceHolders)
                {
                    DDL = DDL.Replace("::" + ColName + "::", dr[ColName].ToString());
                    //string.Format(LinkTemplate, _WidgetId, "Continent_" + dr[ColName].ToString());
                }

                EntityDataXML.AppendFormat(@"
<entity id='{0}'  link=\""{1}\"" /> \",
                   (UseShortName ? dr["ShortName"].ToString() : dr["InternalId"].ToString()),
                    DDL
                    );
            }
            EntityDataXML.Append(@"
</data> \");
            return EntityDataXML.ToString();
        }
        DataTable GetMapIdsTable()
        {
            if (MapIds == null)
            {
                if (Session["MapIds"] != null)
                {
                    MapIds = (DataTable)Session["MapIds"];
                }
                else
                {
                    DataSet ds = new DataSet();
                    //ds.ReadXml("./MapIds.xml");
                    ds.ReadXml(Server.MapPath(PortalConfiguration.WidgetsPath + "MapIds.xml"));
                    MapIds = ds.Tables[0];
                    Session["MapIds"] = MapIds;
                }
            }
            return MapIds;
        }
        #endregion
    }
}