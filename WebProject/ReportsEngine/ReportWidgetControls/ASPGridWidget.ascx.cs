using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Collections;
using System.Data;
using System.Data.SqlClient;

namespace WebProject.ReportsEngine.ReportWidgetControls 
{
    public partial class ASPGridWidget : SimplePropertyMapperUCLabel, ILayoutLabelWidget, IReportWidget, IDataPresentator, IDrillDownableWidget //System.Web.UI.UserControl, IDataPresentator, IDrillDownableWidget
    {
        string ReportId, SortBy, Parameters;
        int PageIndex = 0;


        protected int _PageSize = 20;
        private Dictionary<string, GridColumnTemplate> GridColTemplates = new Dictionary<string, GridColumnTemplate>();

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

        protected string _WebMethod = "XmlHttpPanelWebService.asmx/GetASPGridHTML";
        // protected string _WebMethod = "XmlHttpPanelWebService.asmx/GetASPGridHTML";
        string _DrillDownWidgetId = "", _SearchPanelsToUpdate = "", _ExternalLinks = "", _DrillDownParamTemplate = "";
        string _ParentWidgetId = "", _ParentWidgetContainerClientId = "", _ChildWidgetContainerClientId;
        bool _IncludeSearchButton = true;
        private string _IconToolText = "Click here to customize",
         _SearchIconText, _UpIconText, _DownIconText;
        bool _ShowIconsText; //default

        bool AsyncallyCalled = false;

        StoredProcInvoker SPI;

        string _GridId, _ContainerId, GridUniqueId;
        int _RowNo, _ColNo, _WidgetWidth = 0, _WidgetHeight = 0;
        string _WidgetHeading = "";//@"<div style='text-align:center;vertical-align:middle;font-family:Verdana;font-size:9pt'>Test Grid  Heading - ::FromDate:: </div>";
        IReportPortalSettings PortalPage;// = (IReportPortalSettings)this.Page;

        public ASPGridWidget(string GridId, string ContainerId, int RowNo, int ColNo)
        {
            PortalPage = (IReportPortalSettings)this.Page;

            _SearchIconText = PortalPage.ReportHolder.SearchIconText;
            _UpIconText = PortalPage.ReportHolder.UpIconText;
            _DownIconText = PortalPage.ReportHolder.DownIconText;
            _ShowIconsText = PortalPage.ReportHolder.ShowIconsText;

            ReportId = PortalPage.NextReportId;
            _GridId = GridId;
            _RowNo = RowNo;
            _ContainerId = ContainerId;
            _ColNo = ColNo;
            GridUniqueId = GridId + "_" + _ContainerId + "_" + _RowNo.ToString() + _ColNo.ToString();
            LoadClassFields(WidgetId, WidgetId, "RPTChartEngineObjecProperty");
            LoadClassFields(ReportId, WidgetId, "RPTChartEngineObjecProperty");
            GridView1.PageSize = _PageSize;
        }
        public ASPGridWidget()
        {

        }
        public ASPGridWidget(string ReportId, string WidgetId, int PageIndex, string SortBy, string Parameters)
        {
            //PortalPage = (IReportPortalSettings)this.Page;

            this.ReportId = ReportId;
            _GridId = WidgetId;
            this.SortBy = SortBy;
            this.PageIndex = PageIndex;
            this.Parameters = Parameters;
            AsyncallyCalled = true;

            LoadClassFields(WidgetId, WidgetId, "RPTChartEngineObjecProperty");
            LoadClassFields(ReportId, WidgetId, "RPTChartEngineObjecProperty");
            GridView1.PageSize = _PageSize;
        }

        private void LoadClassFields(string widgetId1, string widgetId2, string v)
        {
            throw new NotImplementedException();
        }

        protected void Page_Init(object sender, EventArgs e)
        {

            txtSortBy.Attributes.Add("class", WidgetId + "__" + "txtSortBy");
            txtPageIndex.Attributes.Add("class", WidgetId + "__" + "txtPageIndex");
            if (AsyncallyCalled)
            {
                InitlizeGrid();
            }

        }
        void InitlizeGrid()
        {
            txtPageIndex.Value = PageIndex.ToString();
            txtSortBy.Value = SortBy;
            GridView1.ID = ReportId + "_" + WidgetId;
            GridView1.PageIndex = PageIndex;

            IndexedDictionary<string, IQueryParameter> SPParams = QueryParameter.GetQueryParameters(Parameters);
            _DrillDownParamTemplate = QueryParameter.InsertQueryParameters(_DrillDownParamTemplate, SPParams);
            ltlGridHeadingDiv.Text = _WidgetHeading != "" ? QueryParameter.InsertQueryParameters(_WidgetHeading, SPParams, true) : "";
            LoadTemplateColumns();
            QueryData(SPParams);
        }
        private void LoadTemplateColumns()
        {
            string SSQLTemplateCols = string.Format(@"
select GridID,ColumnID from RPTChartEngineGridTemplateColumns where GridID='{0}' and visible=1
order by orderid", WidgetId);
            DataTable dtTemplateCols;
            using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                dtTemplateCols = CUtilityWeb.getDataTable(SSQLTemplateCols, sqlConnection);
            }
            foreach (DataRow DR in dtTemplateCols.Rows)
            {
                TemplateField tf = new TemplateField();
                tf.HeaderTemplate = new GridColumnTemplate(DataControlRowType.Header, WidgetId, DR["ColumnID"].ToString(), _DataConnectionString, this, false);
                tf.ItemTemplate = new GridColumnTemplate(DataControlRowType.DataRow, WidgetId, DR["ColumnID"].ToString(), _DataConnectionString, this, false);
                GridView1.Columns.Add(tf);
            }
            if (dtTemplateCols.Rows.Count < 1)
            {
                // _GridVeiwControl.AutoGenerateColumns = true;
                GridView1.RowDataBound += new GridViewRowEventHandler(GridView1_RowDataBound_NonTemplated);
                GridView1.DataBound += new EventHandler(GridView1_DataBound_NonTemplated);
            }
            else
            {
                GridView1.AutoGenerateColumns = false;
            }
        }

        public void QueryData(IndexedDictionary<string, IQueryParameter> QueryParameters)
        {
            switch (SQLCommandType)
            {
                case SQLCommandType.StoredProc:
                    if (_DataConnectionString == null)
                    {
                        SPI = new StoredProcInvoker(_SQLCommand, QueryParameters);
                    }
                    else
                    {

                        SPI = new StoredProcInvoker(_SQLCommand, QueryParameters, _DataConnectionString);
                    }
                    SPI.ResultTable.DefaultView.Sort = SortBy;
                    GridView1.DataSource = SPI.ResultTable;

                    if (SPI.ResultTable.Columns.Contains("RowStyle"))  //if templated grid
                    {
                        GridView1.RowDataBound += new GridViewRowEventHandler(GridView1_RowDataBound_Templated);
                    }
                    GridView1.DataBind();
                    //if (GridView1.Rows.Count == 0) GridView1.Height = new Unit("90%");
                    break;
                case SQLCommandType.SQLText:
                    //return null;
                    break;
                default:
                    //return null;
                    break;
            }
            //return null;
        }

        protected void GridView1_PreRender(object sender, EventArgs e)
        {
            GridView GV = (GridView)sender;
            int iLoop = 0;
            Boolean ASC = true;
            LinkButton lnkButton;
            Literal ltlTemplated = null;
            SortBy = SortBy == null ? "" : SortBy;
            if (SortBy.Contains(" ASC"))
            {
                ASC = false;
            }
            if (GV.HeaderRow != null)
            {
                foreach (TableCell tblCell in GV.HeaderRow.Cells)
                {
                    if (tblCell.Controls.Count > 0)
                    {
                        lnkButton = tblCell.Controls[0] as LinkButton;
                        if (tblCell.Controls.Count > 1) ltlTemplated = tblCell.Controls[1] as Literal;
                        if (ltlTemplated != null) ltlTemplated.Visible = false;
                        if (lnkButton != null)
                        {
                            lnkButton.Visible = true;
                            lnkButton.Text = CUtilityWeb.BreakCamelCase(lnkButton.Text);
                            lnkButton.OnClientClick =
       string.Format(@"$('.{0}').val('{1}'); objWidgets.updateWidget('{2}');return false;",
       WidgetId + "__" + "txtSortBy", (ASC ? lnkButton.CommandArgument + " ASC" : lnkButton.CommandArgument + " DESC"), WidgetId);
                            ;
                        }


                    }
                }
            }
            if (PageIndex < 11)
                iLoop = 0;
            else
                iLoop = PageIndex - (PageIndex % 10) - 1;


            if (GV.BottomPagerRow != null)
            {
                Table PagerTable = GV.BottomPagerRow.Cells[0].Controls[0] as Table;
                if (PagerTable != null)
                {
                    foreach (TableCell tblCell in PagerTable.Rows[0].Cells)
                    {
                        lnkButton = tblCell.Controls[0] as LinkButton;
                        if (lnkButton != null)
                        {
                            lnkButton.OnClientClick =
    string.Format(@"$('.{0}').val('{1}'); objWidgets.updateWidget('{2}');return false;",
    WidgetId + "__" + "txtPageIndex", (iLoop), WidgetId);
                            ;
                        }
                        iLoop++;
                    }
                }
            }
        }

        void GridView1_DataBound_NonTemplated(object sender, EventArgs e)
        {
            if (GridView1.AutoGenerateColumns)
            {
                foreach (DataControlField DCF in GridView1.Columns)
                {
                    DCF.HeaderText = CUtilityWeb.BreakCamelCase(DCF.HeaderText);
                }
            }

        }
        void GridView1_RowDataBound_NonTemplated(object sender, GridViewRowEventArgs e)
        {
            //if (e.Row.RowType == DataControlRowType.Header)
            //{
            //    foreach (Control CTRL in e.Row.Controls)
            //    {
            //        ((DataControlFieldHeaderCell)CTRL).Text = CUtilityWeb.BreakCamelCase(((DataControlFieldHeaderCell)CTRL).Text);
            //    }

            //}
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                foreach (Control CTRL in e.Row.Controls)
                {
                    Control ct = CTRL;
                    try //if there is any error (different control type) ignore it.
                    {
                        ((System.Web.UI.WebControls.WebControl)(CTRL)).CssClass = "PWCLabel";
                    }
                    catch (Exception ex)
                    {

                    }
                }
            }
        }
        void GridView1_RowDataBound_Templated(object sender, GridViewRowEventArgs e)
        {
            string HighLightedRowStyle = null;
            string[] HighLightedStyles;

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                HighLightedRowStyle = SPI.ResultTable.Rows[(GridView1.PageSize * GridView1.PageIndex) + e.Row.RowIndex]["RowStyle"].ToString().Trim();
                if (HighLightedRowStyle != "")
                {

                    bool IsLinkedColumn = false, IsCssClass;
                    IsCssClass = !HighLightedRowStyle.Contains(":");
                    HighLightedStyles = HighLightedRowStyle.TrimEnd(new char[] { ';' }).Split(new char[] { ';' });

                    foreach (TableCell TC in e.Row.Cells)
                    {
                        IsLinkedColumn = ((GridColumnTemplate)((TemplateField)((DataControlFieldCell)TC).ContainingField).ItemTemplate).ColumnType == GridTemplateType.LinkTemplate;
                        foreach (WebControl CTRL in TC.Controls)
                        {
                            if (CTRL.GetType().Name != "HyperLink")
                            {
                                if (IsLinkedColumn)
                                {
                                    CTRL.CssClass = "PWCLinkColumnLabel";// "";
                                }
                                else
                                {
                                    if (IsCssClass)
                                        e.Row.CssClass = HighLightedRowStyle;
                                    else
                                    {
                                        for (int iLoop = 0; iLoop < HighLightedStyles.Length; iLoop++)
                                        {
                                            string[] CurrentStyle = HighLightedStyles[iLoop].Split(new char[] { ':' });
                                            e.Row.Style.Add(CurrentStyle[0], CurrentStyle[1]);
                                        }

                                    }
                                }

                            }
                        }
                    }

                }
            }
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
        public string WidgetId { get { return _GridId; } }
        public void SetParentWidgetId(string ParentWidgetId) //, string ParentWidgetContainerClientId)
        {
            _ParentWidgetId = ParentWidgetId;
            // _ParentWidgetContainerClientId = ParentWidgetContainerClientId;
            // IReportPortalSettings PortalPage = (IReportPortalSettings)this.Page;
            // IDrillDownableWidget _ParentWidgetId = (IDrillDownableWidget)PortalPage.WidgetLoader.ReportWidgets[_DrillDownWidgetId].WidgetInstance;
        }
        public string ParentWidgetId { get { return _ParentWidgetId; } }
        public string ContainerClientId { get { return GridUniqueId; } }
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
            DrillDownSrc = this.Page.ResolveUrl(PortalConfiguration.ImagesPath + "icons/DrillDownChart.gif"),
            DrillUpSrc = this.Page.ResolveUrl(PortalConfiguration.ImagesPath + "icons/DrillUpChart.gif"),
            SearchIconSrc = this.Page.ResolveUrl(PortalConfiguration.ImagesPath + "icons/btnSearch.png");

            //   <div  style='top: -20px;left:4px;position:absolute;' name='ChartButtonsABS'>
            ButtonsPanelHtml.Append(@"
        <div  style='position:relative;text-align:left;' name='ChartButtonsREL'>
            <div   name='ChartButtonsABS'>
                                ");


            if (_IncludeSearchButton)
            {
                ButtonsPanelHtml.Append(string.Format(@"<img src=""{0}"" id=""{1}_img"" class=""dummyImage"" style='margin:0 0 0 5px;cursor: hand;vertical-align:middle' border=""0"" 
                alt=""{2}""  name=""SearchButton""    />",
                 SearchIconSrc, SPanel.ContainerTable.ClientID, _IconToolText)
                 + (_ShowIconsText ? "<span style='margin-left:5px;font-family: verdana; font-size: 8.5pt;'>" + _SearchIconText + "</span>" : "")
                 );
                AddButtonsPanel = true;

            }
            if (_ParentWidgetId != "")
            {
                ButtonsPanelHtml.Append(string.Format(@"<img src=""{0}"" id=""{1}"" style='margin:0 0 0 5px;cursor:hand;display:none;vertical-align:middle' border=""0"" alt=""Previous Chart""  
            name=""DrillUpArrow""  onclick=""DrillUpArrow_Click('{2}','{3}')""  />",
                    DrillUpSrc, GridUniqueId + "_DrillUp", _ParentWidgetId, _GridId)
                    + (_ShowIconsText ? string.Format("<span style='margin-left:5px;display:none;font-family: verdana; font-size: 8.5pt;' relatedid='{0}'>{1}</span>", ContainerClientId + "_DrillUp_RelId", _UpIconText) : "")
                    );

                AddButtonsPanel = true;

            }
            if (!string.IsNullOrEmpty(_DrillDownWidgetId) && PortalPage.WidgetLoader.ReportWidgets.ContainsKey(_DrillDownWidgetId))
            {
                IDrillDownableWidget ChildWidget = (IDrillDownableWidget)PortalPage.WidgetLoader.ReportWidgets[_DrillDownWidgetId].WidgetInstance;
                ChildWidget.SetParentWidgetId(_GridId);

                ButtonsPanelHtml.Append(string.Format(@"<img src=""{0}"" id=""{1}"" style='margin:0 0 0 5px;cursor:hand;display:none;vertical-align:middle' border=""0"" alt=""Next Chart""  
               name=""DrillDownArrow""  onclick=""DrillDownArrow_Click('{2}','{3}')""  />",
                   DrillDownSrc, GridUniqueId + "_DrillDown", _GridId, DrillDownWidgetId)
                   + (_ShowIconsText ? string.Format("<span style='margin-left:5px;display:none;font-family: verdana; font-size: 8.5pt;' relatedid='{0}'>{1}</span>", ContainerClientId + "_DrillDown_RelId", _DownIconText) : "")

                   );
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
            //string.Format("' style='height:{0}px'>",)
            //ltlWidgetDiv is top first div is WidgetDiv and the second div is the div which contrains the grid only
            string WidgetWidthAttribute, WidgetHeightAttribute;

            WidgetWidthAttribute = _WidgetWidth !=
                0 ? string.Format(";Width:{0}px", _WidgetWidth)
                : "";

            WidgetHeightAttribute = _WidgetHeight !=
                0 ? string.Format(";Height:{0}px", _WidgetHeight)
                : string.Format(";Height:{0}px", (_PageSize * 23 + 23 + (_IncludeSearchButton ? 50 : 30)));
            WidgetHeightAttribute = "";
            ltlWidgetDiv.Text = "\t\n<div id='" + GridUniqueId + "' >" +
                            "\t\n<div id='" + GridUniqueId +
                            string.Format("_GridDiv' style='{0}'>", WidgetWidthAttribute + WidgetHeightAttribute);//style='height:{0}px'>"; 
            ltlButtonsPanel.Text = "\t\n</div>" + ltlButtonsPanel.Text +
             "\t\n</div>";
            CUtilityWeb.PlaceControlInThePage(this, this.Page, _ContainerId, _RowNo, _ColNo);
            return null;
        }

        #endregion
        ///////////////////////////---------------Grid Column Template Class---------------------//////////////////////////

        private class GridColumnTemplate : SimplePropertyMapper, ITemplate
        {
            // private static DataTable dtColTemplates;
            private DataControlRowType _templateType;
            private GridTemplateType _ColumnType;
            public GridTemplateType ColumnType
            {
                get { return _ColumnType; }
            }
            protected WebControl _TemplateControl = null;
            protected string _TextBindingColumn = null;
            protected string _LinkBindingColumn = null;
            protected Type _TextBindingColumnDataType = null;
            protected string _StyleSheet = null;
            protected string _ChildQuery = "";
            protected string _ColumnHeading = "";
            protected string _DataConnectionString = null;

            protected VerticalAlign _VerticalAlign = VerticalAlign.Top;
            protected HorizontalAlign _HorizontalAlign = HorizontalAlign.Left;
            protected bool _Wrap = false;
            protected int _ColumnWidth = -1;
            public bool _RenderForExport = false;

            protected string _WidgetId;
            protected string _DrillDownWidgetId = "";
            protected IndexedDictionary<string, string> ColumnDrillDownWidgetId;
            protected string _DrillDownParamTemplate = "";
            protected IndexedDictionary<string, string> ColumnDrillDownParamTemplate;
            protected string _SearchPanelsToUpdate = "";
            protected IndexedDictionary<string, string> ColumnSearchPanelsToUpdate;

            public WebControl TemplateControl
            {
                get { return _TemplateControl; }
            }
            public string TextBindingColumn
            {
                get { return _TextBindingColumn; }
            }
            public string LinkBindingColumn
            {
                get { return _LinkBindingColumn; }
            }
            public string StyleSheet
            {
                get { return _StyleSheet; }
            }
            public VerticalAlign VerticalAlign
            {
                get { return _VerticalAlign; }
            }
            public HorizontalAlign HorizontalAlign
            {
                get { return _HorizontalAlign; }
            }
            int _SmartTextLength = 0;

            XMLPropertyContainer _ChildGridColumnXML;
            IndexedDictionary<string, ChildGridColumns> _ChildGridColumn;

            public GridColumnTemplate(DataControlRowType templateType, string ObjectParentID, string ObjectID, string DataConnectionString, IDrillDownableWidget GridWidget, bool RenderForExport)
                : this(templateType, ObjectParentID, ObjectID, "RPTChartEngineObjecProperty")
            {
                _DrillDownParamTemplate = GridWidget.DrillDownParamTemplate;
                _DrillDownWidgetId = GridWidget.DrillDownWidgetId;
                _SearchPanelsToUpdate = GridWidget.SearchPanelsToUpdate;
                _WidgetId = GridWidget.WidgetId;
                _RenderForExport = RenderForExport;
                _DataConnectionString = DataConnectionString;
            }
            public GridColumnTemplate(DataControlRowType templateType, string ObjectParentID, string ObjectID, string DataConnectionString, bool RenderForExport)
                : this(templateType, ObjectParentID, ObjectID, "RPTChartEngineObjecProperty")
            {
                _RenderForExport = RenderForExport;
                _DataConnectionString = DataConnectionString;
            }
            public GridColumnTemplate(DataControlRowType templateType, string ObjectParentID, string ObjectID) :
                this(templateType, ObjectParentID, ObjectID, "RPTChartEngineObjecProperty")
            {
            }
            public GridColumnTemplate(DataControlRowType templateType, string ObjectParentID, string ObjectID, string PropertyTable)
            {
                LoadClassFields(ObjectParentID, ObjectID, PropertyTable);
                _templateType = templateType;
            }

            public void InstantiateIn(System.Web.UI.Control container)
            {

                DataControlFieldCell hc;
                hc = (DataControlFieldCell)container;


                Label lblColControl;
                switch (_templateType)
                {
                    case DataControlRowType.Header:
                        string StyleColWidth;
                        StyleColWidth = _ColumnWidth > 0 ? "width:" + _ColumnWidth.ToString() + "px" : "";
                        // build the header for this column
                        Literal lcColControl = new Literal();
                        LinkButton lnkButton;
                        lnkButton = new LinkButton();
                        lnkButton.ID = _TextBindingColumn;
                        lnkButton.Text = BreakCamelCase(_ColumnHeading);
                        lnkButton.CommandArgument = _TextBindingColumn;
                        lnkButton.Visible = false;
                        if (StyleColWidth != "") lnkButton.Style.Add("Width", StyleColWidth);
                        if (_ColumnHeading.Trim() != "")
                        {
                            lcColControl.Text = string.Format("<div style='{0}'><b>", StyleColWidth) + _ColumnHeading + "</b></div>";
                            lnkButton.Text = _ColumnHeading;
                        }
                        else
                        {
                            lcColControl.Text = string.Format("<div style='{0}'><b>", StyleColWidth) + BreakCamelCase(_TextBindingColumn) + "</b></div>";
                            lnkButton.Text = BreakCamelCase(_TextBindingColumn);
                        }
                        container.Controls.Add(lnkButton);
                        //lcColControl.Text = "<b>" + BreakCamelCase(_TextBindingColumn) + "</b>";

                        hc.Attributes.Add("style", "white-space:nowrap;");
                        //_TemplateControl = lblColControl;
                        container.Controls.Add(lcColControl);
                        break;
                    case DataControlRowType.DataRow:

                        HyperLink hlColControl;
                        switch (_ColumnType)
                        {
                            case GridTemplateType.LableTemplate:
                                hc.VerticalAlign = _VerticalAlign;
                                hc.HorizontalAlign = _HorizontalAlign;

                                lblColControl = new Label();
                                _TemplateControl = lblColControl;
                                lblColControl.CssClass = "PWCLabel";
                                if (!_Wrap) lblColControl.Style.Add("white-space", "nowrap");
                                lblColControl.DataBinding += new EventHandler(this.LableControl_DataBinding);
                                break;
                            case GridTemplateType.TextTemplate:
                                TextBox txtColControl = new TextBox();
                                _TemplateControl = txtColControl;
                                txtColControl.DataBinding += new EventHandler(this.TextBoxControl_DataBinding);
                                break;
                            case GridTemplateType.LinkTemplate:

                                hlColControl = new HyperLink();
                                _TemplateControl = hlColControl;
                                Label lblControl = new Label();

                                lblControl.CssClass = "PWCLinkColumnLabel";
                                lblControl.Visible = false;

                                hlColControl.CssClass = "GridLink";
                                hlColControl.ForeColor = System.Drawing.Color.Navy;
                                hlColControl.DataBinding += new EventHandler(this.HyperLinkControl_DataBinding);
                                lblControl.DataBinding += new EventHandler(this.HyperLinkLabelControl_DataBinding);
                                container.Controls.Add(lblControl);
                                break;
                            case GridTemplateType.ChildGridTemplate:
                                GridView grdColControl = new GridView();
                                HtmlImage imgBtn = new HtmlImage();
                                imgBtn.Src = imgBtn.ResolveUrl(PortalConfiguration.ImagesPath + "/plus.gif");

                                // imgBtn.Attributes("style", "cursor: hand;display:none");App_Themes/Blue/Images/


                                //_TemplateControl = gvColControl; 
                                //gvColControl.DataBinding += new EventHandler(this.GridViewControl_DataBinding);
                                lblColControl = new Label();
                                _TemplateControl = lblColControl;
                                lblColControl.DataBinding += new EventHandler(this.GridViewControl_DataBinding);
                                grdColControl.ID = "grd" + _TextBindingColumn;


                                if (!_RenderForExport)
                                {
                                    grdColControl.RowStyle.CssClass = "PWCOddRow";
                                    grdColControl.AlternatingRowStyle.CssClass = "PWCEvenRow";
                                    grdColControl.HeaderStyle.CssClass = "AgilitySubPanelHeader GridHead";
                                    imgBtn.ID = "img" + _TextBindingColumn;
                                    container.Controls.Add(imgBtn);
                                }
                                else
                                {
                                    grdColControl.RowStyle.BackColor = System.Drawing.Color.FromArgb(0x7FEEEEEE);
                                    grdColControl.RowStyle.Font.Name = "Verdana";
                                    grdColControl.RowStyle.Font.Size = new FontUnit(11, UnitType.Point);

                                    grdColControl.AlternatingRowStyle.BackColor = System.Drawing.Color.FromArgb(0x7FF5F5F5);
                                    //grdColControl.HeaderStyle.BackColor = ;

                                }
                                container.Controls.Add(grdColControl);
                                break;
                            case GridTemplateType.DrillDownTemplate:
                                if (_DrillDownParamTemplate.Trim() != "") //if this column is a drilldowncolumn
                                {

                                    //lblControl = new Label();

                                    //lblControl.CssClass = "PWCLinkColumnLabel";
                                    //lblControl.Visible = false;
                                    //lblControl.DataBinding += new EventHandler(this.HyperLinkLabelControl_DataBinding);
                                    //container.Controls.Add(lblControl);
                                    hlColControl = new HyperLink();
                                    _TemplateControl = hlColControl;
                                    hlColControl.CssClass = "GridLink";
                                    hlColControl.ForeColor = System.Drawing.Color.Navy;
                                    hlColControl.DataBinding += new EventHandler(this.DrillDownLink_DataBinding);


                                    //string DDLink = "";
                                    //if (_DrillDownWidgetId.ToString() != "")
                                    //{
                                    //    //   DDLink =
                                    //}
                                    //if (_SearchPanelsToUpdate.ToString() != "")
                                    //{
                                    //}
                                    hlColControl = new HyperLink();
                                    hlColControl.DataBinding += new EventHandler(DrillDownLink_DataBinding);
                                }
                                break;
                            default:
                                break;
                        }
                        break;
                    default:
                        break;

                }
                if (_TemplateControl != null)
                    container.Controls.Add(_TemplateControl);
            }

            private void DrillDownLink_DataBinding(Object sender, EventArgs e)
            {
                HyperLink HyperLinkControl = (HyperLink)sender;

                GridViewRow row = (GridViewRow)HyperLinkControl.NamingContainer;
                HyperLinkControl.Text = DataBinder.Eval(row.DataItem, _TextBindingColumn).ToString();
                HyperLinkControl.NavigateUrl = "#";
                string DrillDownParamTemplateResolved = _DrillDownParamTemplate;
                if (DrillDownParamTemplateResolved.Contains("%"))
                {
                    string[] arrTemplate = DrillDownParamTemplateResolved.Split(new string[] { "||" }, StringSplitOptions.None);

                    for (int iLoop = 0; iLoop < arrTemplate.Length; iLoop += 2)
                    {

                        if (arrTemplate[iLoop + 1].StartsWith("%"))
                        {
                            string FieldName = arrTemplate[iLoop + 1].TrimStart('%');
                            DrillDownParamTemplateResolved = DrillDownParamTemplateResolved.Replace(arrTemplate[iLoop + 1], DataBinder.Eval(row.DataItem, FieldName).ToString());
                        }
                    }
                }
                // _DrillDownParamTemplate = _WidgetId + "|||" + _DrillDownParamTemplate;

                HyperLinkControl.Attributes.Add("onclick", "DrillDownWidget('" + _WidgetId + "|||" + DrillDownParamTemplateResolved + "');return false;");
            }
            private void LableControl_DataBinding(Object sender, EventArgs e)
            {
                Label LableControl = (Label)sender;
                GridViewRow row = (GridViewRow)LableControl.NamingContainer;
                string CellValue =
                    DataBinder.Eval(row.DataItem, _TextBindingColumn).ToString();
                if (_SmartTextLength > 0 && _SmartTextLength < CellValue.Length)
                {
                    LableControl.Text = string.Format(@"<div class='ShowToolTip' SmartText='{0}'>{1}...</div>", CellValue, CellValue.Substring(0, _SmartTextLength - 1));
                }
                else
                {
                    LableControl.Text = CellValue;
                }
            }
            private void TextBoxControl_DataBinding(Object sender, EventArgs e)
            {


                TextBox TextBoxControl = (TextBox)sender;
                GridViewRow row = (GridViewRow)TextBoxControl.NamingContainer;
                TextBoxControl.Text = DataBinder.Eval(row.DataItem, _TextBindingColumn).ToString();
            }
            private void HyperLinkControl_DataBinding(Object sender, EventArgs e)
            {
                HyperLink HyperLinkControl = (HyperLink)sender;

                GridViewRow row = (GridViewRow)HyperLinkControl.NamingContainer;
                string NavLink = DataBinder.Eval(row.DataItem, _LinkBindingColumn).ToString();
                if (NavLink == "text")
                {
                    HyperLinkControl.Visible = false;

                }
                else
                {


                    HyperLinkControl.Text = DataBinder.Eval(row.DataItem, _TextBindingColumn).ToString();
                    // System.Web.HttpServerUtility HSU = new System.Web.HttpServerUtility();
                    // HyperLinkControl.NavigateUrl = HttpUtility.UrlEncode(DataBinder.Eval(row.DataItem, _LinkBindingColumn).ToString());
                    HyperLinkControl.NavigateUrl = DataBinder.Eval(row.DataItem, _LinkBindingColumn).ToString();
                }
                //if (HyperLinkControl.NavigateUrl == "#") HyperLinkControl.Visible = false;

            }
            private void HyperLinkLabelControl_DataBinding(Object sender, EventArgs e)
            {
                Label hlLabel = (Label)sender;
                GridViewRow row = (GridViewRow)hlLabel.NamingContainer;

                if (DataBinder.Eval(row.DataItem, _LinkBindingColumn).ToString() == "text")
                {
                    hlLabel.Visible = true;
                    hlLabel.Text = DataBinder.Eval(row.DataItem, _TextBindingColumn).ToString();
                }
            }
            private void GridViewControl_DataBinding(Object sender, EventArgs e)
            {
                DataTable dtChildTable;
                Label LableControl = (Label)sender;
                DataControlFieldCell hc = (DataControlFieldCell)LableControl.Parent;
                GridViewRow row = (GridViewRow)LableControl.NamingContainer;

                string ChildFK = DataBinder.Eval(row.DataItem, _TextBindingColumn).ToString();
                string ChildSQL;
                ChildSQL = _ChildQuery.Replace("::ChildID::", ChildFK);

                //   hc = (DataControlFieldCell)container;
                GridView grdChild = (GridView)hc.FindControl("grd" + _TextBindingColumn);
                grdChild.RowStyle.CssClass = "PWCOddRow PWCLabel";
                grdChild.AlternatingRowStyle.CssClass = "PWCEvenRow PWCLabel";
                grdChild.HeaderStyle.CssClass = "AgilitySubPanelHeader GridHead";
                if (_ChildGridColumn != null && _ChildGridColumn.Count > 0)
                {
                    grdChild.Columns.Clear();
                    grdChild.AutoGenerateColumns = false;
                    foreach (KeyValuePair<string, ChildGridColumns> ChildCol in _ChildGridColumn)
                    {
                        // ChildGridColumnTemplate
                        TemplateField tf = new TemplateField();
                        tf.HeaderTemplate = new ChildGridColumnTemplate(ChildCol.Value, DataControlRowType.Header, _RenderForExport);
                        tf.ItemTemplate = new ChildGridColumnTemplate(ChildCol.Value, DataControlRowType.DataRow, _RenderForExport);
                        grdChild.Columns.Add(tf);
                    }

                }
                else
                {
                    grdChild.AutoGenerateColumns = true;
                    grdChild.RowDataBound += new GridViewRowEventHandler(ChildGridVeiwControl_RowDataBound);
                    //   _GridVeiwControl.RowDataBound += new GridViewRowEventHandler(_GridVeiwControl_RowDataBound);
                }

                HtmlImage imgBtn = (HtmlImage)hc.FindControl("img" + _TextBindingColumn);

                if (grdChild != null)
                {
                    if (_DataConnectionString == null)
                    {
                        using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
                        {
                            grdChild.DataSource = dtChildTable = CUtilityWeb.getDataTable(ChildSQL, sqlConnection);
                        }
                    }
                    else
                    {
                        //SqlConnection sqlConneciton = null ;
                        try
                        {
                            using (SqlConnection sqlConneciton = new SqlConnection(_DataConnectionString))
                            {
                                sqlConneciton.Open();
                                grdChild.DataSource = dtChildTable = CUtilityWeb.getDataTable(ChildSQL, sqlConneciton);
                            }

                        }
                        catch (Exception ex)
                        {
                            throw new Exception(
                                string.Format(@"Unable to fectch child data for the grid
                        -------------------------SQL Query-------------------------
{0}
                        -----------------------------------------------------------
                        ", ChildSQL), ex);
                        }

                    }
                    if (imgBtn != null)
                    {
                        if (dtChildTable.Rows.Count < 1)
                        {
                            imgBtn.Attributes.Add("style", "cursor:hand;display:none");

                        }
                        else
                        {
                            imgBtn.Attributes.Add("style", "cursor:hand;");
                            imgBtn.Attributes.Add("onclick", string.Format("javascript:ShowHidSubCondition(this,'{0}')", grdChild.ClientID));
                            grdChild.Attributes.Add("style", "display:none;");
                        }
                    }
                    grdChild.DataBind();
                    //grdChild.HeaderRow.Attributes.Add("style", "white-space:nowrap");

                }
            }
            // helper method to convert CamelCaseString to Camel Case String
            // by inserting spaces
            private string BreakCamelCase(string CamelString)
            {
                string output = string.Empty;
                bool SpaceAdded = true;

                for (int i = 0; i < CamelString.Length; i++)
                {
                    if (CamelString.Substring(i, 1) ==
                        CamelString.Substring(i, 1).ToLower())
                    {
                        output += CamelString.Substring(i, 1);
                        SpaceAdded = false;
                    }
                    else
                    {
                        if (!SpaceAdded)
                        {
                            output += " ";
                            output += CamelString.Substring(i, 1);
                            SpaceAdded = true;
                        }
                        else
                            output += CamelString.Substring(i, 1);
                    }
                }

                return output;
            }
            void ChildGridVeiwControl_RowDataBound(object sender, GridViewRowEventArgs e)
            {
                //throw new Exception("The method or operation is not implemented.");
                if (e.Row.RowType == DataControlRowType.Header)
                {

                    foreach (Control CTRL in e.Row.Controls)
                    {
                        DataControlFieldHeaderCell ColumnHeader = (DataControlFieldHeaderCell)CTRL;
                        ColumnHeader.Text = CUtilityWeb.BreakCamelCase(ColumnHeader.Text);
                        ColumnHeader.Attributes.Add("style", "white-space:nowrap;");
                    }

                }
                else if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    foreach (Control CTRL in e.Row.Controls)
                    {
                        ((DataControlFieldCell)CTRL).Attributes.Add("style", "white-space:nowrap;FONT:  7.5pt/20px Verdana;");
                    }
                }

            }
        }
    }
}