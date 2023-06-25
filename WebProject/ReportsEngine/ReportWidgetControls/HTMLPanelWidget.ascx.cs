using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using DevExpress.Utils;

namespace WebProject.ReportsEngine.ReportWidgetControls
{
    public partial class HTMLPanelWidget : SimplePropertyMapperUC, ILayoutTableWidget, IReportWidget// System.Web.UI.UserControl
    {
        IndexedDictionary<string, System.Web.UI.HtmlControls.HtmlTable> _ContainerTables = new IndexedDictionary<string, System.Web.UI.HtmlControls.HtmlTable>();
        IndexedDictionary<string, Panel> _ContainerPanels = new IndexedDictionary<string, Panel>();
        string _WidgetMargin, _PanelHeading,
            _PanelBodyHeading, _PanelLongDetail, _PanelShortDetail,
            _WidgetPadding, _WidgetId, _NextReportId, _ContainerId;
        int _RowNo, _ColNo;

        public HTMLPanelWidget()
            : base()
        {
        }
        public HTMLPanelWidget(string WidgetId, string ContainerId, int RowNo, int ColNo)
            : base()
        {
            this.ID = WidgetId;
            this.Visible = true;
            InitializeControl();
            _WidgetId = WidgetId;
            string NextReportId = this.Page.Request.QueryString["NextReportId"];
            _NextReportId = NextReportId;
            LoadClassFields(NextReportId, _WidgetId, "RPTChartEngineObjecProperty");
            _ContainerTables.Add(_WidgetId, tblPanelBody);
            CUtilityWeb.PlaceControlInThePage(this, this.Page, ContainerId, RowNo, ColNo);
            _ContainerId = ContainerId;
            _RowNo = RowNo; _ColNo = ColNo;
            //  _ContainerTables.Add(_WidgetId, tblPanelBody);
        }
        private void InitializeControl()
        {
            _WidgetMargin = ""; _PanelHeading = "";
            _PanelBodyHeading = ""; _PanelLongDetail = ""; _PanelShortDetail = "";
            _WidgetPadding = ""; ;
        }

        //public string WidgetId { get { return _WidgetId; } set {_WidgetId=value  ;} }
        protected void Page_Init(object sender, EventArgs e)
        {

        }
        protected void Page_Load(object sender, EventArgs e)
        {


            tblRowDottedLine.Visible = false;
            if (_PanelLongDetail == "" && _PanelShortDetail == "")
            {
                tblRowDescription.Attributes.Add("style", "display:none");
            }
            else if (_PanelShortDetail == "")
            {
                tblRowDescriptionSpacer.Attributes.Add("style", "display:none");
                tblRowShortDetail.Attributes.Add("style", "display:none");
            }
            else if (_PanelLongDetail == "")
            {
                tblRowLongDetail.Attributes.Add("style", "display:none");
                //tblDescription.Rows[2].Attributes.Add("style", "display:none");
            }
            if (_PanelBodyHeading == "")
            {
                tblRowPanelBodyHeading.Attributes.Add("style", "display:none");
            }

            if (_PanelLongDetail != "" && _PanelShortDetail != "" && _PanelBodyHeading == "")
            {
                tblRowDottedLine.Visible = true;// .Attributes.Add("style", "display:none");

                //tblRowDottedLine.Attributes.Add("style", "display:none");
            }
            lblPanelBodyHeading.Text = _PanelBodyHeading;
            lblPanelLongDetail.Text = _PanelLongDetail;
            lblPanelShortDetail.Text = _PanelShortDetail;
            lblPanelHeading.Text = _PanelHeading;


            SetWidgetMargin();

        }

        void SetWidgetMargin()
        {
            string[] StyleProperties = { "top", "right", "left", "bottom" };
            if (!string.IsNullOrEmpty(_WidgetMargin))
            {
                pnlMain.Attributes.Add("Style", BuildStyle(StyleProperties, _WidgetMargin, "Margin"));
            }
        }
        string BuildStyle(string[] StyleProperties, string StyleNameValue, string PropertyPrefix)
        {
            if (!string.IsNullOrEmpty(StyleNameValue))
            {
                try
                {
                    System.Text.StringBuilder sbStyle = new System.Text.StringBuilder(1024);
                    IndexedDictionary<string, string> StyleNameValueCollection = new IndexedDictionary<string, string>();
                    string[] arrStyleNameValue = StyleNameValue.Split(';');

                    foreach (string StyleNameValueItem in arrStyleNameValue)
                    {
                        string[] StyleNameValueItemSplitted = StyleNameValueItem.Split(':');
                        StyleNameValueCollection.Add(StyleNameValueItemSplitted[0], StyleNameValueItemSplitted[1]);
                    }
                    foreach (string StyleProperty in StyleProperties)
                    {
                        if (StyleNameValueCollection.ContainsKey(StyleProperty))
                        {
                            if (!string.IsNullOrEmpty(PropertyPrefix))
                            {
                                sbStyle.Append(PropertyPrefix + "-" + StyleProperty + ":" + StyleNameValueCollection[StyleProperty] + ";");
                            }
                            else
                            {
                                sbStyle.Append(StyleProperty + ":" + StyleNameValueCollection[StyleProperty] + ";");
                            }
                        }
                    }
                    return sbStyle.ToString();
                }
                catch (Exception ex)
                {

                }
            }
            return "";
        }
        #region ILayoutTableWidget Members

        public IndexedDictionary<string, System.Web.UI.HtmlControls.HtmlTable> ContainerTables
        {
            get
            {
                return _ContainerTables;
            }
        }

        public IndexedDictionary<string, Panel> ContainerPanels
        {
            get
            {
                return _ContainerPanels;
            }
        }
        public string WidgetId { get { return _WidgetId; } }
        #endregion
    }
}
