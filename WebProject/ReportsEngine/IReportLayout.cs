using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
namespace WebProject.ReportsEngine
{

    public enum SQLCommandType
    {
        StoredProc = 0,
        SQLText = 1
    }
    public enum GridTemplateType
    {
        LableTemplate = 0,
        TextTemplate = 1,
        LinkTemplate = 2,
        ChildGridTemplate = 3,
        DrillDownTemplate = 4
    }
    public enum ChartDataOrientation
    {
        SimpleData = 0,
        PivotData = 1,
        HouresComparison = 2,
        PiesData = 3,
        //Below is For Fusion Charts
        Pie2D = 4,
        Column3D = 5,
        Column2D = 6,
        Bubble = 7,           // No Data
        Area2D = 8,
        MSCombi2D = 9,        // No Data
        Bar2D = 10,
        Scatter = 11,          // No Data
        StackedColumn2D = 12, // working with proper data
        Line = 13,
        MSBar2D = 14,  // No Data
        SSGrid = 15,
        Doughnut2D = 16,
        FCExporter = 17, // Waiting Button disp
        None = 128

    }
    public enum DrillDownType
    {
        SimpleMultiLevel = 0,
        MultiLevelMultiBranch = 1
    }
    public enum GraphColorPalette
    {
        AutomaticPalette = 0,
        ManualElementPalette = 1,
        ManualSeriesPalette = 2
    }
    public enum GraphBuilderType
    {
        ReportEngine = 0,
        Custom = 1,
        CustomURL = 2
    }
    public enum WidgetType
    {
        SearchPanel = 0,
        dotNetChart = 1,
        ASPGrid = 2,
        FusionChart = 3,
        HTMLPanel = 4,
        HTMLLabel = 5,
        SubMenu = 7,
        WorldMap = 8
    }
    public enum FusionChartStyle
    {
        Column3D = 0,
        StackedColumn2D = 1,
        MSColumn3D = 2,
        MSColumn3DLineDY = 3,
        MSCombiDY2D = 4,
        Pie3D = 5,
        Pie2D = 6,
        StackedColumn3D = 7,
        Bar2D = 8,
        MSBar2D = 9,
        MSColumn2D = 10,
        MSLine = 11,
        ScrollStackedColumn2D = 12,
        StackedColumn2DLine = 13
    }
    public enum WidgetServerRequestType
    {
        Postback = 0,
        CallBack = 1,
        WebServiceCall = 2

    }

    public enum ControlType
    {
        TextBox = 0,
        ComboBox = 1,
        ComboBoxValues = 2,
        LookUpComboBox = 3,
        LookUpComboBoxCascade = 4,
        DateControl = 5,
        CheckBoxList = 6,
        OptionButtonList = 7,
        None = 256
    }
    public enum ParameterType
    {
        Embeded = 0,
        Criteria = 1
    }

    public enum FieldDataType
    {
        Varchar = 0,
        Integer = 1,
        Float = 2,
        DateTime = 3
    }
    public enum FieldValueType
    {
        Value = 0,
        Text = 1

    }

    public enum RelationOperator
    {
        AND = 0,
        OR = 1
    }
    public enum EqualityOperator
    {
        Equal = 0,
        NotEqueal = 1,
        Greater = 2,
        Less = 3,
        GreaterEqual = 4,
        LessEqual = 5
    }

    public interface IReportLayout
    {
        Control AddControlToHTMLLayout(Control control, string ContainerId, int RowNo, int ColNo);
        void AddContainerControlToLayout(ILayoutTableWidget LayoutWidget);

        IndexedDictionary<string, Table> LayoutTables
        {
            get;
        }
        IndexedDictionary<string, HtmlTable> HTMLLayoutTables
        {
            get;
        }
        void InitializeLayout();
        void InitializeHTMLLayout();

        //IndexedDictionary LayoutTables<string,Table>();
    }
    public interface IReportPortalSettings
    {
        WidgetServerRequestType SearchPanelRequestType { get; }
        WidgetServerRequestType FusionChartWidgetRequestType { get; }
        WidgetServerRequestType PageRequestType { get; }
        bool IsUsingWidgetFramework { get; }
        string ContentHolderName { get; }
        string NextReportId { get; }
        ReportWidgetLoader WidgetLoader { get; }
        ReportHolder ReportHolder { get; }
    }
    public interface ILayoutTableWidget : ILayoutWidget
    {
        IndexedDictionary<string, HtmlTable> ContainerTables { get; }
        IndexedDictionary<string, Panel> ContainerPanels { get; }

    }
    public interface ILayoutLabelWidget : ILayoutWidget
    {


    }
    public interface ILayoutWidget
    {
        string WidgetId { get; }

    }
    public interface IDrillDownableWidget : ILayoutWidget
    {
        string WidgetId { get; }
        string DrillDownWidgetId { get; }
        string SearchPanelsToUpdate { get; }
        string DrillDownParamTemplate { get; }
        string ExternalLinks { get; }
        void SetParentWidgetId(string ParentWidgetId);
        string ContainerClientId { get; }
        string ParentWidgetId { get; }
    }
    public interface IDataPresentator
    {
        DataTable QueryData(SearchPanel SPanel);

    }
    public interface IWidgetDesigner
    {

    }
}