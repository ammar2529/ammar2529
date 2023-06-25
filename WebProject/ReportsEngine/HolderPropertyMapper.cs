using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Reflection;
using System.Data.SqlClient;
using System.Drawing;
using System.Text;
using System.Xml;
namespace WebProject.ReportsEngine {

/// <summary>
/// Summary description for HolderPropertyMapper
/// </summary>




public class ChildGridColumnTemplate : ITemplate
{
    private DataControlRowType _TemplateType;
    ChildGridColumns _ChildGridColumnsProperties;
    bool _RenderForExport = false;
    public ChildGridColumnTemplate(ChildGridColumns ChildGridColumnsProperties, DataControlRowType TemplateType, bool RenderForExport)
    {
        _ChildGridColumnsProperties = ChildGridColumnsProperties;
        _RenderForExport = RenderForExport;
        _TemplateType = TemplateType;

    }


    #region ITemplate Members

    public void InstantiateIn(Control container)
    {
        DataControlFieldCell hc = (DataControlFieldCell)container;
        Control _TemplateControl;
        switch (_TemplateType)
        {
            case DataControlRowType.Header:
                Literal lcColControl = new Literal();
                //lcColControl.Text = "Hello";

                //container.Controls.Add(lcColControl);
                //return;
                string StyleColWidth;
                StyleColWidth = _ChildGridColumnsProperties.ColumnWidth > 0 ? "width:" +
                    _ChildGridColumnsProperties.ColumnWidth.ToString() + "px" : "";
                // build the header for this column

                LinkButton lnkButton;
                lnkButton = new LinkButton();
                lnkButton.ID = _ChildGridColumnsProperties.TextBindingColumn;
                lnkButton.Text = CUtilityWeb.BreakCamelCase(_ChildGridColumnsProperties.ColumnHeading);
                lnkButton.CommandArgument = _ChildGridColumnsProperties.TextBindingColumn;
                lnkButton.Visible = false;

                lnkButton.Style.Add("WidthStyle", StyleColWidth);

                if (_ChildGridColumnsProperties.ColumnHeading.Trim() != "")
                {
                    lcColControl.Text = string.Format("<div style='{0}'><b>", StyleColWidth) + _ChildGridColumnsProperties.ColumnHeading + "</b></div>";
                    lnkButton.Text = _ChildGridColumnsProperties.ColumnHeading;
                }
                else
                {
                    lcColControl.Text = string.Format("<div style='{0}'><b>", StyleColWidth) + CUtilityWeb.BreakCamelCase(_ChildGridColumnsProperties.TextBindingColumn) + "</b></div>";
                    lnkButton.Text = CUtilityWeb.BreakCamelCase(_ChildGridColumnsProperties.TextBindingColumn);
                }
                container.Controls.Add(lnkButton);
                // lnkButton.vis
                //lcColControl.Text = "<b>" + BreakCamelCase(_TextBindingColumn) + "</b>";

                hc.Attributes.Add("style", "white-space:nowrap;");

                //_TemplateControl = lblColControl;
                container.Controls.Add(lcColControl);
                break;
            case DataControlRowType.DataRow:
                switch (_ChildGridColumnsProperties.ColumnType)
                {
                    case GridTemplateType.LableTemplate:
                        hc.VerticalAlign = _ChildGridColumnsProperties.VerticalAlign;
                        hc.HorizontalAlign = _ChildGridColumnsProperties.HorizontalAlign;
                        Label lblColControl;
                        lblColControl = new Label();
                        _TemplateControl = lblColControl;
                        lblColControl.CssClass = "PWCLabel";
                        if (!_ChildGridColumnsProperties.Wrap)
                            lblColControl.Style.Add("white-space", "nowrap");


                        lblColControl.DataBinding += new EventHandler(this.LableControl_DataBinding);
                        container.Controls.Add(lblColControl);
                        break;
                    case GridTemplateType.LinkTemplate:

                        HyperLink hlColControl = new HyperLink();
                        _TemplateControl = hlColControl;
                        Label lblControl = new Label();

                        lblControl.CssClass = "PWCLinkColumnLabel";
                        lblControl.Visible = false;

                        hlColControl.CssClass = "GridLink";
                        hlColControl.ForeColor = System.Drawing.Color.Navy;
                        hlColControl.DataBinding += new EventHandler(this.HyperLinkControl_DataBinding);
                        lblControl.DataBinding += new EventHandler(this.HyperLinkLabelControl_DataBinding);
                        container.Controls.Add(lblControl);
                        container.Controls.Add(hlColControl);
                        break;
                    default:
                        break;
                }
                break;




            default:
                break;
        }
    }

    private void LableControl_DataBinding(Object sender, EventArgs e)
    {

        Label LableControl = (Label)sender;
        GridViewRow row = (GridViewRow)LableControl.NamingContainer;
        string CellValue =
            DataBinder.Eval(row.DataItem, _ChildGridColumnsProperties.TextBindingColumn).ToString();


        if (_ChildGridColumnsProperties.SmartTextLength > 0 && _ChildGridColumnsProperties.SmartTextLength < CellValue.Length)
        {
            // LableControl.CssClass = LableControl.CssClass + " ShowToolTip";

            // LableControl.Attributes.Add("SmartText",CellValue);
            LableControl.Text = string.Format(@"<div class='ShowToolTip' SmartText='{0}'>{1}...</div>", CellValue, CellValue.Substring(0, _ChildGridColumnsProperties.SmartTextLength - 1));

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
        TextBoxControl.Text = DataBinder.Eval(row.DataItem, _ChildGridColumnsProperties.TextBindingColumn).ToString();
    }
    private void HyperLinkControl_DataBinding(Object sender, EventArgs e)
    {
        HyperLink HyperLinkControl = (HyperLink)sender;

        GridViewRow row = (GridViewRow)HyperLinkControl.NamingContainer;
        string NavLink = DataBinder.Eval(row.DataItem, _ChildGridColumnsProperties.LinkBindingColumn).ToString();
        if (NavLink == "text")
        {
            HyperLinkControl.Visible = false;

        }
        else
        {


            HyperLinkControl.Text = DataBinder.Eval(row.DataItem, _ChildGridColumnsProperties.TextBindingColumn).ToString();
            // System.Web.HttpServerUtility HSU = new System.Web.HttpServerUtility();
            // HyperLinkControl.NavigateUrl = HttpUtility.UrlEncode(DataBinder.Eval(row.DataItem, _LinkBindingColumn).ToString());
            HyperLinkControl.NavigateUrl = DataBinder.Eval(row.DataItem, _ChildGridColumnsProperties.LinkBindingColumn).ToString();
        }
        //if (HyperLinkControl.NavigateUrl == "#") HyperLinkControl.Visible = false;

    }
    private void HyperLinkLabelControl_DataBinding(Object sender, EventArgs e)
    {
        Label hlLabel = (Label)sender;
        GridViewRow row = (GridViewRow)hlLabel.NamingContainer;

        if (DataBinder.Eval(row.DataItem, _ChildGridColumnsProperties.LinkBindingColumn).ToString() == "text")
        {
            hlLabel.Visible = true;
            hlLabel.Text = DataBinder.Eval(row.DataItem, _ChildGridColumnsProperties.TextBindingColumn).ToString();
        }
    }
    #endregion
}
public class ChildGridColumns
{
    private string _TextBindingColumn = null;
    private string _LinkBindingColumn = null;
    private Type _TextBindingColumnDataType = null;
    private GridTemplateType _ColumnType;
    private VerticalAlign _VerticalAlign = VerticalAlign.Top;
    private HorizontalAlign _HorizontalAlign = HorizontalAlign.Left;
    private bool _Wrap = false;
    private int _ColumnWidth = -1;
    private string _ColumnHeading = "";
    private int _SmartTextLength = 0;

    public string TextBindingColumn { get { return _TextBindingColumn; } }
    public string LinkBindingColumn { get { return _LinkBindingColumn; } }
    public Type TextBindingColumnDataType { get { return _TextBindingColumnDataType; } }
    public GridTemplateType ColumnType { get { return _ColumnType; } }
    public VerticalAlign VerticalAlign { get { return _VerticalAlign; } }
    public HorizontalAlign HorizontalAlign { get { return _HorizontalAlign; } }
    public bool Wrap { get { return _Wrap; } }
    public int ColumnWidth { get { return _ColumnWidth; } }
    public string ColumnHeading { get { return _ColumnHeading; } }
    public int SmartTextLength { get { return _SmartTextLength; } }
}
public class GridColumnTemplate : SimplePropertyMapper, ITemplate
{
    // private static DataTable dtColTemplates;
    IndexedDictionary<string, string> ChildernHeaderList = new IndexedDictionary<string, string>();
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
    protected bool _IsVisible= true;

    protected ControlType _EditorType = ControlType.None;
    public bool IsEditable { get { return _EditorType != ControlType.None ; } }
    protected string _EditorWidth = "150px",_EditorStyle = "";
    protected string _UpdateKeyName=null;
    protected bool _IsEditable = true;
    int _EditorRows=1;
    protected string _FillOnAutoComp = null;
    protected bool _AutoComplete = false;
    

    protected VerticalAlign _VerticalAlign = VerticalAlign.Top;
    protected HorizontalAlign _HorizontalAlign = HorizontalAlign.Left;
    protected bool _Wrap = false;
    protected int _ColumnWidth = -1;
    public bool _RenderForExport = false;

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
    string _ToolTipTemplate = null;
    XMLPropertyContainer _ChildGridColumnXML;
    IndexedDictionary<string, ChildGridColumns> _ChildGridColumn;

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

        DataControlFieldCell hc = null;
        hc = (DataControlFieldCell)container;
        if (!_IsVisible)
            hc.Style.Add("display", "none");

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
                lnkButton.CommandName = "Sort";
                // lnkButton.Visible = false;
                lcColControl.Visible = false;
              //  lnkButton.Style.Add("WidthStyle", StyleColWidth);
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

                hc.Style.Add("style", "white-space:nowrap;");
                hc.Attributes.Add("ColumnId", _TextBindingColumn);
                
                if(_UpdateKeyName!=null)
                    hc.Attributes.Add("UpdateKeyName", _UpdateKeyName );

                if (_FillOnAutoComp != null)
                    hc.Attributes.Add("FillOnAutoComp", _FillOnAutoComp);

                if (_ToolTipTemplate != null)
                    hc.Attributes.Add("ToolTipTemplate", _ToolTipTemplate);


                //_TemplateControl = lblColControl;
                container.Controls.Add(lcColControl);
                break;
            case DataControlRowType.DataRow:


                switch (_ColumnType)
                {
                    case GridTemplateType.LableTemplate:
                        hc.VerticalAlign = _VerticalAlign;
                        hc.HorizontalAlign = _HorizontalAlign;

                        lblColControl = new Label();
                        _TemplateControl = lblColControl;
                        lblColControl.CssClass = "PWCLabel";
                        if (!_Wrap) lblColControl.Style.Add("white-space", "nowrap");
                        if (!_RenderForExport && _EditorType != ControlType.None) AddColumEditor(container );
                        lblColControl.DataBinding += new EventHandler(this.LableControl_DataBinding);

                        break;
                    case GridTemplateType.TextTemplate:
                        TextBox txtColControl = new TextBox();
                        _TemplateControl = txtColControl;
                        txtColControl.DataBinding += new EventHandler(this.TextBoxControl_DataBinding);
                        break;
                    case GridTemplateType.LinkTemplate:

                        HyperLink hlColControl = new HyperLink();
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
                        imgBtn.Src = "../../App_Themes/Blue/Images/plus.gif";

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
                    default:
                        break;
                }
                break;
            case DataControlRowType.Footer:
                int tmp = 0;
                break;
            default:
                break;

        }
        if (_TemplateControl != null)
            container.Controls.Add(_TemplateControl);
    }
    private void AddColumEditor(Control container)
    {
        //Control EditorContro
       
      //  _TemplateControl.CssClass = "PWCLabel Editable";
        switch (_EditorType)
        {
            case ControlType.TextBox:
                TextBox txtBox = new TextBox();
                if (_EditorRows > 1)
                {
                    txtBox.TextMode = TextBoxMode.MultiLine;
                    txtBox.Rows = _EditorRows;
                }
                txtBox.Text = "";
                txtBox.Width = new Unit(_EditorWidth);

                txtBox.Attributes.Add("style", "display:none;"+_EditorStyle);
                txtBox.Attributes.Add("ColumnName",  _TextBindingColumn);
                if (!_IsEditable)
                    txtBox.Attributes.Add("readonly", "readonly");
                if (_AutoComplete)
                    txtBox.Attributes.Add("AutoComplete", "true");
                txtBox.CssClass = "PWCTextBox ColumnEditor";
                container.Controls.Add(txtBox);
               
                break;
            case ControlType.ComboBox:
                break;
            case ControlType.ComboBoxValues:
                break;
            case ControlType.LookUpComboBox:
                break;
            case ControlType.LookUpComboBoxCascade:
                break;
            case ControlType.DateControl:
                break;
            default:
                break;
        }
    }
    private void LableControl_DataBinding(Object sender, EventArgs e)
    {
        Label LableControl = (Label)sender;
        GridViewRow row = (GridViewRow)LableControl.NamingContainer;
        string CellValue =
            DataBinder.Eval(row.DataItem, _TextBindingColumn).ToString();
        DataControlFieldCell FieldCell = (DataControlFieldCell)LableControl.Parent ;
        if (_SmartTextLength > 0 && _SmartTextLength < CellValue.Length)
        {
          //  LableControl.Text = string.Format(@"<div class='ShowToolTip' SmartText='{0}'>{1}...</div>", CellValue, CellValue.Substring(0, _SmartTextLength - 1));
            LableControl.Text = CellValue.Substring(0, _SmartTextLength - 1)+"..." ;// string.Format(@"<span >{0}...</span>",  CellValue.Substring(0, _SmartTextLength - 1));
              FieldCell.CssClass += " ShowToolTip";
              FieldCell.Attributes.Add("SmartText", CellValue);
        }
        else
        {
            LableControl.Text = CellValue;
        }
        if(!string.IsNullOrEmpty( _ToolTipTemplate))
        {
            FieldCell.CssClass += " ShowToolTip";
            //LableControl.CssClass = LableControl.CssClass + " ShowToolTip";
           // LableControl.Attributes.Add("ToolTipTemplate", _ToolTipTemplate); 
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
                ColumnHeader.Style.Add("white-space", "nowrap");
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

public class GridHolder : SimplePropertyMapper, IDataPresentator
{
    const int GRIDPAGESIZE = 20;
    private Dictionary<string, GridColumnTemplate> GridColTemplates = new Dictionary<string, GridColumnTemplate>();
    Control _ContainerControl = null;
    protected string _SumColumns;

    public Control ContainerControl
    {
        get { return _ContainerControl; }
    }
    GridView _GridVeiwControl = new GridView();
    public GridView GridViewControl
    {
        get { return _GridVeiwControl; }

    }
    protected DataTable _GridDataTable;
    protected string _NextGraphID;
    protected string _NextGridID;
    protected string _NextSearPanelID;

    protected string _GraphGroupID;
    protected string _NextPage;

    protected string _DataConnectionString = null;
    public string DataConnectionString
    {
        get { return _DataConnectionString; }
    }
    /// <summary>
    /// For Fusion Chart Connection String
    /// </summary>

    protected string _ObjectID;
    string ReportId = "";
    protected SQLCommandType _SQLCommandType;
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

    public bool _RenderForExport = false;

    protected Page _page = null;
    StoredProcInvoker SPI;

    protected bool _IsEditable = false;
    protected string _UpdateSP = "";
  //  public bool IsEditable{get { return _IsEditable; }}

    public void InitProperties(string ObjectParentID, string ObjectID, string PropertyTable, Control ContainerControl)
    {
        _ObjectID = ObjectID;
        _ContainerControl = ContainerControl;
        _GridVeiwControl.AutoGenerateColumns = false;
        LoadClassFields(ObjectParentID, ObjectID, PropertyTable);
        LoadTemplateColumns();
        if (_IsEditable)
        {
            _GridVeiwControl.Attributes.Add("GridId",ObjectParentID);
           
            Panel pnlGridActions = new Panel();
            pnlGridActions.Attributes.Add("PanelId","ToolBarPanel_" + ObjectParentID);
           // pnlGridActions.Attributes.Add("style", ";border:solid 1px black");

            HtmlInputButton btnEditGrid = new HtmlInputButton();
            HtmlInputButton btnCancelEdit = new HtmlInputButton();

            btnEditGrid.Value  = " Edit ";
            btnCancelEdit.Value = " Cancel ";

            btnEditGrid.Attributes.Add("class", "PWCButton");
            btnCancelEdit.Attributes.Add("class", "PWCButton");

            btnEditGrid.Attributes.Add("ButtonAction", "EditGrid");
            btnEditGrid.Attributes.Add("GridId", ObjectParentID);

            btnCancelEdit.Attributes.Add("GridId", ObjectParentID);
            btnCancelEdit.Attributes.Add("ButtonAction", "CancelEdit");
            btnCancelEdit.Style.Add("display", "none");

            pnlGridActions.Controls.Add(btnEditGrid);
            pnlGridActions.Controls.Add(btnCancelEdit);
            ContainerControl.Page.Controls.Add(pnlGridActions);
            string JavaScript = string.Format(@"
            $(document).ready(function(){{setupEditableGrid('{0}');}});
            ", ObjectParentID);
          ContainerControl.Page.ClientScript.RegisterStartupScript(this.GetType(), "EditToolBar", JavaScript, true);
 
           
        }
    }
    public GridHolder(string GridID, Page page, string ContainerId, int RowNo, int ColNo)
    {

        //_page = page;

        //Telerik.Web.UI.RadXmlHttpPanel _panel;


        //ContentPlaceHolder cnp = (ContentPlaceHolder)_page.Master.FindControl(((IReportPortalSettings)_page).ContentHolderName);

        //_panel = (Telerik.Web.UI.RadXmlHttpPanel)cnp.FindControl("XmlHttpPanelCB");




        //_GridVeiwControl = (GridView)cnp.FindControl("gvMain");
        //_GridVeiwControl.AllowSorting = true;
        //_GridVeiwControl.AllowPaging = true;

        //_GridVeiwControl.PageSize = 10;
        //_GridVeiwControl.PageIndexChanging += new GridViewPageEventHandler(_GridVeiwControl_PageIndexChanging);
        //_GridVeiwControl.DataBound += new EventHandler(_GridVeiwControl_DataBound);


        //UpdatePanel _UpdatePanel = new UpdatePanel();
        //_UpdatePanel.ID = "_UpdatePanel" + _GridVeiwControl.ID;
        //_UpdatePanel.UpdateMode = UpdatePanelUpdateMode.Conditional;
        //_UpdatePanel.ContentTemplateContainer.Controls.Add(_panel);
        //Control ContainerControl = (Control)CUtilityWeb.PlaceControlInThePage(_UpdatePanel, page, ContainerId, RowNo, ColNo);
        ////_GridVeiwControl.PreRender += new EventHandler(_GridVeiwControl_PreRender);
        //InitGridHolder(GridID, ContainerControl);
    }

    void _GridVeiwControl_PreRender(object sender, EventArgs e)
    {
        _GridVeiwControl.BottomPagerRow.Cells.Clear();
        DataTable mytabe = (DataTable)_GridVeiwControl.DataSource;
        for (int i = 0; i < mytabe.Rows.Count / _GridVeiwControl.PageSize; i++)
        {
            LinkButton _pagerlink = new LinkButton();
            _pagerlink.ID = "_pagerlink" + i + 1;
            _pagerlink.Text = (i + 1).ToString();
            TableCell _cell = new TableCell();
            _GridVeiwControl.BottomPagerRow.Cells.Add(_cell);

            _GridVeiwControl.BottomPagerRow.Cells[i].Controls.Add(_pagerlink);
            string _pagerlinkClientID = _GridVeiwControl.BottomPagerRow.Cells[i].Controls[0].ClientID.ToString();
            _pagerlink.Attributes.Add("onclick", "javascript:setPageIndex('" + _pagerlinkClientID.ToString() + "'); return false;");


        }
        //this line template line
        //_GridVeiwControl.BottomPagerRow.Cells[0].Controls[0].Controls[0].Controls[0].Controls[i].Controls.Add(_pagerlink);
    }
    public GridHolder(string GridID, Control ContainerControl)
    {

        InitGridHolder(GridID, ContainerControl);
    }
    /// <summary>
    /// Currently Being Used.
    /// </summary>
    /// <param name="GridID"></param>
    /// <param name="ContainerControl"></param>
    /// <param name="GV"></param>
    public GridHolder(string GridID, WebControl ContainerControl, GridView GV)
    {

        _GridVeiwControl = GV;
        _GridVeiwControl.PageIndexChanging += new GridViewPageEventHandler(_GridVeiwControl_PageIndexChanging);
        _GridVeiwControl.Sorting += new GridViewSortEventHandler(_GridVeiwControl_Sorting);
         _GridVeiwControl.DataBound += new EventHandler(_GridVeiwControl_DataBound);
        //        _GridVeiwControl.PageIndexChanged += new EventHandler(_GridVeiwControl_PageIndexChanged);
        InitGridHolder(GridID, ContainerControl);
        if (!(_page is IReportPortalSettings))
        {

            _ContainerControl.Controls.Add(_GridVeiwControl);

        }
        //else
        //{
        //    //_ContainerControl.Controls.Add(_GridVeiwControl);
        //}
    }
    public GridHolder(string GridID, Control ContainerControl, GridView GV, bool RenderForExport)
    {
        _RenderForExport = RenderForExport;
        _GridVeiwControl = GV;
        _GridVeiwControl.PageIndexChanging += new GridViewPageEventHandler(_GridVeiwControl_PageIndexChanging);
        _GridVeiwControl.DataBound += new EventHandler(_GridVeiwControl_Export_DataBound);
        InitGridHolder(GridID, ContainerControl);
        if (!(_page is IReportPortalSettings))
        {

            _ContainerControl.Controls.Add(_GridVeiwControl);

        }
        //else
        //{
        //    //_ContainerControl.Controls.Add(_GridVeiwControl);
        //}

    }
    void _GridVeiwControl_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        if (SPI != null)
        {
            DataView dv = SPI.ResultTable.DefaultView;
            dv.Sort = _GridVeiwControl.ToolTip;
            _GridVeiwControl.PageIndex = e.NewPageIndex;
            _GridVeiwControl.DataBind();
        }
        else
        {
            _GridVeiwControl.PageIndex = e.NewPageIndex;

        }
    }


    void _GridVeiwControl_Sorting(object sender, GridViewSortEventArgs e)
    {
        if (_GridVeiwControl.ToolTip.Trim() == "")
        {
            _GridVeiwControl.ToolTip = e.SortExpression + " ASC";
        }
        else if (_GridVeiwControl.ToolTip.IndexOf(" ASC") > -1)
        {
            _GridVeiwControl.ToolTip = e.SortExpression + " DESC";
        }
        else if (_GridVeiwControl.ToolTip.IndexOf(" DESC") > -1)
        {
            _GridVeiwControl.ToolTip = e.SortExpression + " ASC";
        }
        if (SPI != null)
        {
            DataView dv = SPI.ResultTable.DefaultView;

            //    _GridVeiwControl.ToolTip = dv.Sort = e.SortExpression + (e.SortDirection == SortDirection.Ascending ? " ASC" : " DESC");


            dv.Sort = _GridVeiwControl.ToolTip;
            _GridVeiwControl.DataSource = dv;
            _GridVeiwControl.DataBind();
        }
        

    }

    //void _GridVeiwControl_Sorting(object sender, GridViewSortEventArgs e)
    //{
    //    // _GridVeiwControl.Sort(e.SortExpression, e.SortDirection);
    //    if (SPI != null)
    //    {
    //        DataView dv = SPI.ResultTable.DefaultView;
    //        _GridVeiwControl.ToolTip = dv.Sort = e.SortExpression + (e.SortDirection == SortDirection.Ascending ? " ASC" : " DESC");

    //        _GridVeiwControl.DataSource = dv;
    //        _GridVeiwControl.DataBind();
    //    }
    //    else
    //    {
            
    //        _GridVeiwControl.ToolTip = e.SortExpression + (e.SortDirection == SortDirection.Ascending ? " ASC" : " DESC");
    //    }

    //}


    private void InitGridHolder(string GridID, Control ContainerControl)
    {
        _GridVeiwControl.AllowSorting = true;
        string ObjectParentID = GridID;
        string PropertyTable = "RPTChartEngineObjecProperty";
        InitProperties(ObjectParentID, GridID, PropertyTable, ContainerControl);
    }

    public DataTable QueryData(SearchPanel SPanel)
    {

        switch (SQLCommandType)
        {

            case SQLCommandType.StoredProc:

                if (_DataConnectionString == null)
                {
                    SPI = new StoredProcInvoker(_SQLCommand, SPanel);
                }
                else
                {

                    SPI = new StoredProcInvoker(_SQLCommand, SPanel, _DataConnectionString);
                }

                SPI.ResultTable.DefaultView.Sort = _GridVeiwControl.ToolTip;
                _GridVeiwControl.DataSource = SPI.ResultTable;
                _GridDataTable = SPI.ResultTable;
                if (_GridDataTable.Columns.Contains("RowStyle"))  //if templated grid
                {
                    _GridVeiwControl.RowDataBound += new GridViewRowEventHandler(_GridVeiwTemplatedControl_RowDataBound);

                }

                _GridVeiwControl.DataBind();
                if (!string.IsNullOrWhiteSpace(_SumColumns) && _GridDataTable.Rows.Count > 0)
                {
                    string sumcols = "";
                    foreach (string col in _SumColumns.Split(new string[] { "||" }, StringSplitOptions.None))
                    {
                        object sum = _GridDataTable.Compute("Sum(" + col + ")", "1=1");
                        sumcols += col + "||" + sum + "||";
                        // _GridVeiwControl.Columns. .Attributes.Add("colname", col);
                    }

                    _GridVeiwControl.Attributes.Add("sumcols", sumcols);
                }

                break;
            case SQLCommandType.SQLText:
                return null;
                break;
            default:
                return null;
                break;
        }
        return null;
    }


    private void LoadTemplateColumns() 
    {
        _GridVeiwControl.Columns.Clear();
        string SSQLTemplateCols = string.Format(@"
select GridID,ColumnID from RPTChartEngineGridTemplateColumns where GridID='{0}' and visible=1
order by orderid", _ObjectID);
        DataTable dtTemplateCols;
        using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
        {
            dtTemplateCols = CUtilityWeb.getDataTable(SSQLTemplateCols, sqlConnection);
        }
        foreach (DataRow DR in dtTemplateCols.Rows)
        {
            TemplateField tf = new TemplateField();
            tf.HeaderTemplate = new GridColumnTemplate(DataControlRowType.Header, _ObjectID, DR["ColumnID"].ToString(), _DataConnectionString, _RenderForExport);
            tf.ItemTemplate = new GridColumnTemplate(DataControlRowType.DataRow, _ObjectID, DR["ColumnID"].ToString(), _DataConnectionString, _RenderForExport);
            _GridVeiwControl.Columns.Add(tf);
            //Determine if the grid is editable or not and save it for later use
            if (!_IsEditable) _IsEditable=((GridColumnTemplate)tf.ItemTemplate).IsEditable;
        }
        if (dtTemplateCols.Rows.Count < 1)
        {
            _GridVeiwControl.AutoGenerateColumns = true;
            _GridVeiwControl.RowDataBound += new GridViewRowEventHandler(_GridVeiwControl_RowDataBound);
        }
    }

    void _GridVeiwTemplatedControl_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        string HighLightedRowStyle = null;
        string[] HighLightedStyles;

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HighLightedRowStyle = _GridDataTable.Rows[(_GridVeiwControl.PageSize * _GridVeiwControl.PageIndex) + e.Row.RowIndex]["RowStyle"].ToString().Trim();
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
    void _GridVeiwControl_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header && _GridVeiwControl.AutoGenerateColumns == true)
        {
            foreach (Control CTRL in e.Row.Controls)
            {
                DataControlFieldHeaderCell DCFHC = (DataControlFieldHeaderCell)CTRL;
                if (DCFHC.Text == "")
                {
                    ((System.Web.UI.WebControls.LinkButton)(CTRL.Controls[0])).Text =
                        CUtilityWeb.BreakCamelCase(((AutoGeneratedField)DCFHC.ContainingField).HeaderText);
                }
                else
                {
                    ((DataControlFieldHeaderCell)CTRL).Text = CUtilityWeb.BreakCamelCase(((DataControlFieldHeaderCell)CTRL).Text);

                }
            }

        }
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

    void _GridVeiwControl_Export_DataBound(object sender, EventArgs e)
    {
        if (_GridVeiwControl.AutoGenerateColumns)
        {
            GridViewRow hr = _GridVeiwControl.HeaderRow;
            for (int i = 0; i < hr.Cells.Count; i++)
            {
                hr.Cells[i].Attributes.Add("columnid", _GridDataTable.Columns[i].ColumnName);
            }
        }
    }

    void _GridVeiwControl_DataBound(object sender, EventArgs e)
    {
        //if (_GridVeiwControl.AutoGenerateColumns)
        //{
        //    foreach (DataControlField DCF in _GridVeiwControl.Columns)
        //    {
        //        DCF.HeaderText = CUtilityWeb.BreakCamelCase(DCF.HeaderText);
        //    }
        //}
        string PagerHTML = @"
<span style='text-decoration: none; color: #0000FF'>
<span style='color: #997917;
text-decoration: none;'>|</span> <span style='font-family: verdana; font-size: 8.5pt;
color: #0000FF; text-decoration: none'>&nbsp; Page </span><span style='font-family: verdana;
font-size: 8.5pt; text-decoration: none; color: #138221'>{0}</span><span style='font-family: verdana;
font-size: 8.5pt; color: #0000FF; text-decoration: none'> of </span>
<span style='font-family: verdana; font-size: 8.5pt; text-decoration: none; color: #138221'>
{1}</span><span style='font-family: verdana; font-size: 8.5pt; color: #0000FF; text-decoration: none'>
(Total Rows: </span><span style='font-family: verdana; font-size: 8.5pt; text-decoration: none;
color: #FF0000;'>{2}</span><span style='font-family: verdana; font-size: 8.5pt; color: #0000FF;
text-decoration: none'>)</span> </span>
";
            if (_GridVeiwControl.Rows.Count > 0)
            {
                GridViewRow PagerRow = _GridVeiwControl != null ? _GridVeiwControl.BottomPagerRow : null;
                if (_GridVeiwControl.AutoGenerateColumns)
                {
                    GridViewRow hr = _GridVeiwControl.HeaderRow;
                    for (int i = 0; i < hr.Cells.Count; i++)
                    {
                        hr.Cells[i].Attributes.Add("columnid", _GridDataTable.Columns[i].ColumnName);
                    }
                }
                if (PagerRow != null)
                {
                    TableCell TotalsCell = new TableCell();
                    TotalsCell.Text = string.Format(PagerHTML, _GridVeiwControl.PageIndex + 1, _GridVeiwControl.PageCount, SPI.ResultTable.Rows.Count);
                    Table PagerTable = PagerRow.Cells[0].Controls[0] as Table;
                    if (PagerTable != null)
                    {
                        PagerTable.Rows[0].Cells.Add(TotalsCell);
                    }
                }
            }
    }


    /// <summary>
    /// NEw Code for the updating the grid on search panel selecction using XMlHttpPanel Call back
    /// </summary>
    public GridHolder(IndexedDictionary<string, IQueryParameter> Parameters, string chartId, GridView gvMain)
    {

        LoadClassFields(chartId, chartId, "RPTChartEngineObjecProperty");
        StoredProcInvoker spi = _DataConnectionString == "" ? new StoredProcInvoker(_SQLCommand, Parameters) : new StoredProcInvoker(_SQLCommand, Parameters, _DataConnectionString);
        gvMain.PageIndex = 0;
        gvMain.DataSource = spi.ResultTable;
        gvMain.DataBind();


    }
}


public class SimplePropertyMapper
{
    protected void LoadClassFields(string ObjectParentID, string ObjectID, string PropertyTable)
    {
        LoadClassFields(ObjectParentID, ObjectID, PropertyTable,"");
    }
    protected void LoadClassFields(string ObjectParentID, string ObjectID, string PropertyTable, string ExtraConditions)
    {
        string ExtraPropsCond = ExtraConditions=="" ?  "and left(PropertyName,2) <> '__'":"";
        // string PropertyTable = "RPTChartEngineObjecProperty";
        string SQLProperties = string.Format(@"select  ObjectParentID, ObjectID, '_' + PropertyName AS PropertyName, PropertyPath, PropertyValue from {0} where objectparentid='{1}' and objectid='{2}'  {3} {4}
                                                 order by propertypath         ",
                                                                    PropertyTable, ObjectParentID, ObjectID, ExtraConditions, ExtraPropsCond);
        DataTable dtFields;
        using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
        {
            dtFields = CUtilityWeb.getDataTable(SQLProperties, sqlConnection);
        }
        int iRow = 0;
        Type searchfieldType = this.GetType();
        Type ObjectType = this.GetType();
        while (dtFields.Rows.Count > iRow)
        {
            string FieldProperty = dtFields.Rows[iRow]["PropertyName"].ToString();
            FieldInfo fieldInfo = ObjectType.GetField(FieldProperty, BindingFlags.NonPublic | BindingFlags.Instance);
            if (fieldInfo == null) throw new FieldPropertyNotFoundException(string.Format("Class doesn't contain property {0}!", dtFields.Rows[iRow]["PropertyName"].ToString()));
            fieldInfo.SetValue(this, BoxValue(dtFields.Rows[iRow]["PropertyValue"], fieldInfo));
            iRow++;
        }
    }
    protected void LoadClassFields(DataTable dtFields)
    {
        int iRow = 0;
        Type searchfieldType = this.GetType();
        Type ObjectType = this.GetType();
        while (dtFields.Rows.Count > iRow)
        {
            string FieldProperty = dtFields.Rows[iRow]["PropertyName"].ToString();
            FieldInfo fieldInfo = ObjectType.GetField(FieldProperty, BindingFlags.NonPublic | BindingFlags.Instance);
            if (fieldInfo == null) throw new FieldPropertyNotFoundException(string.Format("Class doesn't contain property {0}!", dtFields.Rows[iRow]["PropertyName"].ToString()));
            fieldInfo.SetValue(this, BoxValue(dtFields.Rows[iRow]["PropertyValue"], fieldInfo));
            iRow++;
        }
    }
    protected void LoadClassFields(DataRow[] drFields)
    {
        int iRow = 0;
        Type searchfieldType = this.GetType();
        Type ObjectType = this.GetType();
        while (drFields.Length > iRow)
        {
            string FieldProperty = drFields[iRow]["PropertyName"].ToString();
            FieldInfo fieldInfo = ObjectType.GetField(FieldProperty, BindingFlags.NonPublic | BindingFlags.Instance);
            if (fieldInfo == null) throw new FieldPropertyNotFoundException(string.Format("Class doesn't contain property {0}!", drFields[iRow]["PropertyName"].ToString()));
            fieldInfo.SetValue(this, BoxValue(drFields[iRow]["PropertyValue"], fieldInfo));
            iRow++;
        }
    }
    protected void LoadClassFields( string SQLProperties)
    {
        // string PropertyTable = "RPTChartEngineObjecProperty";
//        string SQLProperties = string.Format(@"select  ObjectParentID, ObjectID, '_' + PropertyName AS PropertyName, PropertyPath, PropertyValue from {0} where objectparentid='{1}' and objectid='{2}' {3}
//                                                 order by propertypath         ",
//                                                                    PropertyTable, ObjectParentID, ObjectID, ExtraConditions);
        DataTable dtFields;
        using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
        {
            dtFields = CUtilityWeb.getDataTable(SQLProperties, sqlConnection);
        }
        int iRow = 0;
        Type searchfieldType = this.GetType();
        Type ObjectType = this.GetType();
        while (dtFields.Rows.Count > iRow)
        {
            string FieldProperty = dtFields.Rows[iRow]["PropertyName"].ToString();
            FieldInfo fieldInfo = ObjectType.GetField(FieldProperty, BindingFlags.NonPublic | BindingFlags.Instance);
            if (fieldInfo == null) throw new FieldPropertyNotFoundException(string.Format("Class doesn't contain property {0}!", dtFields.Rows[iRow]["PropertyName"].ToString()));
            fieldInfo.SetValue(this, BoxValue(dtFields.Rows[iRow]["PropertyValue"], fieldInfo));
            iRow++;
        }
    }
    protected object BoxValue(object PropertyValue, FieldInfo FI)
    {
        if (FI.FieldType.Name == "Object")
        {
            return PropertyValue;
        }
        else if (FI.FieldType.BaseType.Name == "Enum")
        {
            return Enum.Parse(FI.FieldType, PropertyValue.ToString());
        }
        else if (FI.FieldType.Name == "Color")
        {
            int ColorNum = 0;
            if (Enum.IsDefined(typeof(KnownColor), PropertyValue))
            {

                KnownColor knownColor = (KnownColor)Enum.Parse(typeof(KnownColor), PropertyValue.ToString());
                return Color.FromKnownColor(knownColor);
            }
            if (PropertyValue.ToString().Contains("#"))
            {
                return ColorTranslator.FromHtml(PropertyValue.ToString());
            }
            else if (Int32.TryParse(PropertyValue.ToString(), out ColorNum))
            {
                return Color.FromArgb(ColorNum);
            }
            else
            {
                return Color.Black;
            }
        }
        else if (FI.FieldType.Name == "XMLPropertyContainer")
        {
            XmlDocument XmlDoc = new XmlDocument();
            XmlDoc.LoadXml(PropertyValue.ToString());
            XmlNodeList ObjectNodes = XmlDoc.SelectNodes("/"); //select Root Node Which is document object
            foreach (XmlNode ObjectNode in ObjectNodes[0]) // iterate throug all the document childern
            {
                ReflectNodeToObject(this, ObjectNode); //process single document(root level child)
            }
            return new XMLPropertyContainer(PropertyValue.ToString());
        }
        else
        {
            Type targetType = FI.FieldType;
            try
            {
                PropertyValue = Convert.ChangeType(PropertyValue, targetType);
            }
            catch (System.InvalidCastException e)
            {
                MethodInfo[] methods = targetType.GetMethods();
                for (int i = 0; i < methods.Length; i++)
                {
                    if (methods[i].Name == "op_Implicit")
                    {
                        ParameterInfo[] parameters = methods[i].GetParameters();
                        if (parameters.Length == 1 && parameters[0].ParameterType == PropertyValue.GetType())
                        {
                            PropertyValue = methods[i].Invoke(null, new object[] { PropertyValue });
                            break;
                        }
                    }
                }
            }
            catch (System.Exception e)
            {
                throw e;
            }
            return PropertyValue;
        } // end of datatype else part
    }// end of boxvalue
    void ReflectNodeToObject(object ParentObject, XmlNode ObjectXMLNode)
    {
        string ObjectNameToReflect = ObjectXMLNode.Name;
        Type ObjectType = ParentObject.GetType().Name.EndsWith("_ascx", StringComparison.CurrentCultureIgnoreCase) ?
            ParentObject.GetType().BaseType : ParentObject.GetType();// ParentObject.GetType().BaseType;
        FieldInfo fieldInfo = ObjectType.GetField("_" + ObjectNameToReflect, BindingFlags.NonPublic | BindingFlags.Public | BindingFlags.Instance);
        //if(fieldInfo==null)
        //fieldInfo = fieldInfo==null?ObjectType.BaseType .GetField(ObjectNameToReflect, BindingFlags.NonPublic | BindingFlags.Public | BindingFlags.Instance);
        XmlNodeList CurrentNodeChildern = ObjectXMLNode.SelectNodes("./" + ObjectXMLNode.FirstChild.Name);
        if (CurrentNodeChildern[0].Name == "List-Item") //it means it's a collection, not a single object
        {
            if (fieldInfo.FieldType.IsGenericType)
            {
                Type[] TypeArugments = fieldInfo.FieldType.GetGenericArguments();
                if (TypeArugments.Length > 1) //dictionary 
                {
                    Type ListItemType = fieldInfo.FieldType;
                    object DictionaryObject = Activator.CreateInstance(ListItemType);
                    fieldInfo.SetValue(ParentObject, DictionaryObject);
                    foreach (XmlNode ListItem in CurrentNodeChildern)
                    {
                        object ValueObject = Activator.CreateInstance(TypeArugments[1]);
                        string KeyObject = ListItem.FirstChild.InnerText;
                        foreach (XmlNode ListItemProperty in ListItem.ChildNodes)
                        {
                            if (ListItemProperty.FirstChild.NodeType == XmlNodeType.Element) //is complex type then make recursive call
                            {
                                ReflectNodeToObject(ValueObject, ListItemProperty);
                            }
                            else //Simple type then set it to the field
                            {
                                FieldInfo ListItemTypefieldInfo = TypeArugments[1].GetField("_" + ListItemProperty.Name, BindingFlags.NonPublic | BindingFlags.Instance);
                                ListItemTypefieldInfo.SetValue(ValueObject, BoxValue(ListItemProperty.InnerText, ListItemTypefieldInfo));
                            }
                        }
                        DictionaryObject.GetType()
                        .GetMethod("Add", TypeArugments)
                        .Invoke(DictionaryObject, new object[] { KeyObject, ValueObject });
                    }
                }
                else //list
                {
                    object DictionaryObject = Activator.CreateInstance(TypeArugments[0].GetType());
                }


            }
        }
        else //if it's not a Dictionary or list object
        {
            if (fieldInfo.FieldType.IsGenericType)
            {
            }
            else
            {
                Type ComplexObjectType = fieldInfo.FieldType;
                object ComplexObject = Activator.CreateInstance(ComplexObjectType);
                //Type ComplexObjectType= ComplexObject.GetType();
                foreach (XmlNode ComplexItemProperty in ObjectXMLNode.ChildNodes)
                {
                    if (ComplexItemProperty.FirstChild.NodeType == XmlNodeType.Element) //is complex type then make recursive call
                    {
                        ReflectNodeToObject(ComplexObject, ComplexItemProperty);
                    }
                    else //Simple type then set it to the field
                    {

                        FieldInfo SimpleTypeInfo = ComplexObjectType.GetField("_" + ComplexItemProperty.Name, BindingFlags.NonPublic | BindingFlags.Instance);
                        SimpleTypeInfo.SetValue(ComplexObject, ComplexItemProperty.InnerText);
                    }
                }
                fieldInfo.SetValue(ParentObject, ComplexObject);
            }
        }

    }
    //protected object BoxValue(object PropertyValue, FieldInfo FI)
    //{
    //    if (FI.FieldType.Name == "Object")
    //    {
    //        return PropertyValue;
    //    }
    //    else if (FI.FieldType.BaseType.Name == "Enum")
    //    {
    //        return Enum.Parse(FI.FieldType, PropertyValue.ToString());
    //    }
    //    else if (FI.FieldType.Name == "Color")
    //    {
    //        return Color.FromArgb(Convert.ToInt32(PropertyValue));
    //    }
    //    else
    //    {
    //        Type targetType = FI.FieldType;
    //        try
    //        {
    //            PropertyValue = Convert.ChangeType(PropertyValue, targetType);
    //        }
    //        catch (System.InvalidCastException e)
    //        {
    //            MethodInfo[] methods = targetType.GetMethods();
    //            for (int i = 0; i < methods.Length; i++)
    //            {
    //                if (methods[i].Name == "op_Implicit")
    //                {
    //                    ParameterInfo[] parameters = methods[i].GetParameters();
    //                    if (parameters.Length == 1 && parameters[0].ParameterType == PropertyValue.GetType())
    //                    {
    //                        PropertyValue = methods[i].Invoke(null, new object[] { PropertyValue });
    //                        break;
    //                    }
    //                }
    //            }
    //        }
    //        catch (System.Exception e)
    //        {
    //            throw e;
    //        }
    //        return PropertyValue;
    //    } // end of datatype else part
    //}// end of boxvalue
}
public class SimplePropertyMapperUC : System.Web.UI.UserControl
{
    public SimplePropertyMapperUC()
        : base()
    {
    }
    protected void LoadClassFields(string ObjectParentID, string ObjectID, string PropertyTable)
    {
        LoadClassFields(ObjectParentID, ObjectID, PropertyTable, "");
    }
    protected void LoadClassFields(string ObjectParentID, string ObjectID, string PropertyTable, string ExtraConditions)
    {
        string ExtraPropsCond = ExtraConditions == "" ? "and left(PropertyName,2) <> '__'" : "";
        // string PropertyTable = "RPTChartEngineObjecProperty";
        string SQLProperties = string.Format(@"select  ObjectParentID, ObjectID, '_' + PropertyName AS PropertyName, PropertyPath, PropertyValue from {0} where objectparentid='{1}' and objectid='{2}' {3}  {4}
                                                 order by propertypath         ",
                                                                    PropertyTable, ObjectParentID, ObjectID, ExtraConditions, ExtraPropsCond);
        DataTable dtFields;
        using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
        {
            dtFields = CUtilityWeb.getDataTable(SQLProperties, sqlConnection);
        }
        int iRow = 0;
        Type ObjectType = this.GetType().BaseType;
        while (dtFields.Rows.Count > iRow)
        {
            string FieldProperty = dtFields.Rows[iRow]["PropertyName"].ToString();
            FieldInfo fieldInfo = ObjectType.GetField(FieldProperty, BindingFlags.NonPublic | BindingFlags.Instance);
            if (fieldInfo == null) throw new FieldPropertyNotFoundException(string.Format("Class doesn't contain property {0}!", dtFields.Rows[iRow]["PropertyName"].ToString()));
            fieldInfo.SetValue(this, BoxValue(dtFields.Rows[iRow]["PropertyValue"], fieldInfo));
            iRow++;
        }
    }
    protected void LoadClassFields(DataTable dtFields)
    {
        int iRow = 0;
        Type ObjectType = this.GetType().BaseType;
        while (dtFields.Rows.Count > iRow)
        {
            string FieldProperty = dtFields.Rows[iRow]["PropertyName"].ToString();
            FieldInfo fieldInfo = ObjectType.GetField(FieldProperty, BindingFlags.NonPublic | BindingFlags.Instance);
            if (fieldInfo == null) throw new FieldPropertyNotFoundException(string.Format("Class doesn't contain property {0}!", dtFields.Rows[iRow]["PropertyName"].ToString()));
            fieldInfo.SetValue(this, BoxValue(dtFields.Rows[iRow]["PropertyValue"], fieldInfo));
            iRow++;
        }
    }
    protected void LoadClassFields(DataRow[] drFields)
    {
        int iRow = 0;
        Type ObjectType = this.GetType().BaseType;
        while (drFields.Length > iRow)
        {
            string FieldProperty = drFields[iRow]["PropertyName"].ToString();
            FieldInfo fieldInfo = ObjectType.GetField(FieldProperty, BindingFlags.NonPublic | BindingFlags.Instance);
            if (fieldInfo == null) throw new FieldPropertyNotFoundException(string.Format("Class doesn't contain property {0}!", drFields[iRow]["PropertyName"].ToString()));
            fieldInfo.SetValue(this, BoxValue(drFields[iRow]["PropertyValue"], fieldInfo));
            iRow++;
        }
    }
    protected void LoadClassFields(string SQLProperties)
    {
        // string PropertyTable = "RPTChartEngineObjecProperty";
        //        string SQLProperties = string.Format(@"select  ObjectParentID, ObjectID, '_' + PropertyName AS PropertyName, PropertyPath, PropertyValue from {0} where objectparentid='{1}' and objectid='{2}' {3}
        //                                                 order by propertypath         ",
        //                                                                    PropertyTable, ObjectParentID, ObjectID, ExtraConditions);
        DataTable dtFields;
        using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
        {
            dtFields = CUtilityWeb.getDataTable(SQLProperties, sqlConnection);
        }
        int iRow = 0;
        Type ObjectType = this.GetType().BaseType;
        while (dtFields.Rows.Count > iRow)
        {
            string FieldProperty = dtFields.Rows[iRow]["PropertyName"].ToString();
            FieldInfo fieldInfo = ObjectType.GetField(FieldProperty, BindingFlags.NonPublic | BindingFlags.Instance);
            if (fieldInfo == null) throw new FieldPropertyNotFoundException(string.Format("Class doesn't contain property {0}!", dtFields.Rows[iRow]["PropertyName"].ToString()));
            fieldInfo.SetValue(this, BoxValue(dtFields.Rows[iRow]["PropertyValue"], fieldInfo));
            iRow++;
        }
    }
    protected object BoxValue(object PropertyValue, FieldInfo FI)
    {
        if (FI.FieldType.Name == "Object")
        {
            return PropertyValue;
        }
        else if (FI.FieldType.BaseType.Name == "Enum")
        {
            return Enum.Parse(FI.FieldType, PropertyValue.ToString());
        }
        else if (FI.FieldType.Name == "Color")
        {
            int ColorNum = 0;
            if (Enum.IsDefined(typeof(KnownColor), PropertyValue))
            {

                KnownColor knownColor = (KnownColor)Enum.Parse(typeof(KnownColor), PropertyValue.ToString());
                return Color.FromKnownColor(knownColor);
            }
            if (PropertyValue.ToString().Contains("#"))
            {
                return ColorTranslator.FromHtml(PropertyValue.ToString());
            }
            else if (Int32.TryParse(PropertyValue.ToString(), out ColorNum))
            {
                return Color.FromArgb(ColorNum);
            }
            else
            {
                return Color.Black;
            }
        }
        else if (FI.FieldType.Name == "XMLPropertyContainer")
        {
            XmlDocument XmlDoc = new XmlDocument();
            XmlDoc.LoadXml(PropertyValue.ToString());
            XmlNodeList ObjectNodes = XmlDoc.SelectNodes("/"); //select Root Node Which is document object
            foreach (XmlNode ObjectNode in ObjectNodes[0]) // iterate throug all the document childern
            {
                ReflectNodeToObject(this, ObjectNode); //process single document(root level child)
            }
            return new XMLPropertyContainer(PropertyValue.ToString());
        }
        else
        {
            Type targetType = FI.FieldType;
            try
            {
                PropertyValue = Convert.ChangeType(PropertyValue, targetType);
            }
            catch (System.InvalidCastException e)
            {
                MethodInfo[] methods = targetType.GetMethods();
                for (int i = 0; i < methods.Length; i++)
                {
                    if (methods[i].Name == "op_Implicit")
                    {
                        ParameterInfo[] parameters = methods[i].GetParameters();
                        if (parameters.Length == 1 && parameters[0].ParameterType == PropertyValue.GetType())
                        {
                            PropertyValue = methods[i].Invoke(null, new object[] { PropertyValue });
                            break;
                        }
                    }
                }
            }
            catch (System.Exception e)
            {
                throw e;
            }
            return PropertyValue;
        } // end of datatype else part
    }// end of boxvalue
    void ReflectNodeToObject(object ParentObject, XmlNode ObjectXMLNode)
    {
        string ObjectNameToReflect =ObjectXMLNode.Name;
        Type ObjectType = ParentObject.GetType().Name.EndsWith("_ascx", StringComparison.CurrentCultureIgnoreCase) ?
            ParentObject.GetType().BaseType : ParentObject.GetType();// ParentObject.GetType().BaseType;
        FieldInfo fieldInfo = ObjectType.GetField("_" + ObjectNameToReflect, BindingFlags.NonPublic | BindingFlags.Public | BindingFlags.Instance);
        //if(fieldInfo==null)
        //fieldInfo = fieldInfo==null?ObjectType.BaseType .GetField(ObjectNameToReflect, BindingFlags.NonPublic | BindingFlags.Public | BindingFlags.Instance);
        XmlNodeList CurrentNodeChildern = ObjectXMLNode.SelectNodes("./" + ObjectXMLNode.FirstChild.Name);
        if (CurrentNodeChildern[0].Name == "List-Item") //it means it's a collection, not a single object
        {
            if (fieldInfo.FieldType.IsGenericType)
            {
                Type[] TypeArugments = fieldInfo.FieldType.GetGenericArguments();
                if (TypeArugments.Length > 1) //dictionary 
                {
                    Type ListItemType = fieldInfo.FieldType;
                    object DictionaryObject = Activator.CreateInstance(ListItemType);
                    fieldInfo.SetValue(ParentObject, DictionaryObject);
                    foreach (XmlNode ListItem in CurrentNodeChildern)
                    {
                        object ValueObject = Activator.CreateInstance(TypeArugments[1]);
                        string KeyObject = ListItem.FirstChild.InnerText;
                        foreach (XmlNode ListItemProperty in ListItem.ChildNodes)
                        {
                            if (ListItemProperty.FirstChild.NodeType == XmlNodeType.Element) //is complex type then make recursive call
                            {
                                ReflectNodeToObject(ValueObject, ListItemProperty);
                            }
                            else //Simple type then set it to the field
                            {
                                FieldInfo ListItemTypefieldInfo = TypeArugments[1].GetField("_" + ListItemProperty.Name, BindingFlags.NonPublic | BindingFlags.Instance);
                                ListItemTypefieldInfo.SetValue(ValueObject, BoxValue(ListItemProperty.InnerText, ListItemTypefieldInfo));
                            }
                        }
                        DictionaryObject.GetType()
                        .GetMethod("Add", TypeArugments)
                        .Invoke(DictionaryObject, new object[] { KeyObject, ValueObject });
                    }
                }
                else //list
                {
                    object DictionaryObject = Activator.CreateInstance(TypeArugments[0].GetType());
                }


            }
        }
        else //if it's not a Dictionary or list object
        {
            if (fieldInfo.FieldType.IsGenericType)
            {
            }
            else
            {
                Type ComplexObjectType = fieldInfo.FieldType;
                object ComplexObject = Activator.CreateInstance(ComplexObjectType);
                //Type ComplexObjectType= ComplexObject.GetType();
                foreach (XmlNode ComplexItemProperty in ObjectXMLNode.ChildNodes)
                {
                    if (ComplexItemProperty.FirstChild.NodeType == XmlNodeType.Element) //is complex type then make recursive call
                    {
                        ReflectNodeToObject(ComplexObject, ComplexItemProperty);
                    }
                    else //Simple type then set it to the field
                    {

                        FieldInfo SimpleTypeInfo = ComplexObjectType.GetField("_" + ComplexItemProperty.Name, BindingFlags.NonPublic | BindingFlags.Instance);
                        SimpleTypeInfo.SetValue(ComplexObject, ComplexItemProperty.InnerText);
                    }
                }
                fieldInfo.SetValue(ParentObject, ComplexObject);
            }
        }

    }
}
public class XMLPropertyContainer
{
    string _XMLString;
    public XMLPropertyContainer(string XMLString)
    {
        _XMLString = XMLString;
    }
    public static implicit operator XMLPropertyContainer(string XMLString)
    {
        return  new XMLPropertyContainer(XMLString);

        
    }
    public static explicit operator string(XMLPropertyContainer argRightSide)
    {
        return argRightSide._XMLString;
    }
}
public class GraphHolder : SimplePropertyMapper, IDataPresentator
{
    Page _page = null;
    WebControl _ContainerControl = null;

    public WebControl ContainerControl
    {
        get { return _ContainerControl; }
    }
    dotnetCHARTING.Chart _ChartControl = new dotnetCHARTING.Chart();

    public dotnetCHARTING.Chart ChartControl
    {
        get { return _ChartControl; }

    }

    protected string _SkinID;
    public string SkinID
    {
        get { return _SkinID; }
    }


    protected string _ChartID;

    protected string _NextGraphID;
    protected string _NextGridID;
    protected string _NextSearPanelID;

    protected string _GraphGroupID;
    protected string _NextPage;

    protected string _SQLCommand;
    public string SQLCommand
    {
        get { return _SQLCommand; }
        set { _SQLCommand = value; }
    }

    protected string _DefaultProperties="";
    protected string _ColorPaletteName = "";

    protected SQLCommandType _SQLCommandType=SQLCommandType.StoredProc;
    public SQLCommandType SQLCommandType
    {
        get { return _SQLCommandType; }
    }
    protected ChartDataOrientation  _DataOrientation = ChartDataOrientation.SimpleData;
    public ChartDataOrientation _chartOrientation = ChartDataOrientation.SimpleData;
    protected DrillDownType _ChartDrillDownType = DrillDownType.SimpleMultiLevel;
    protected GraphColorPalette _ColorPaletteType = GraphColorPalette.AutomaticPalette;
    protected GraphBuilderType _GraphBuilderType = GraphBuilderType.ReportEngine;
    protected string _DataConnectionString = null;

    public string DataConnectionString
    {
        get { return _DataConnectionString; }
    }

   // protected string _DrillDownURL = "";

    protected SearchPanel _SearchPanel;
    protected bool _ShowSeriesValueWhenZero=false;
    protected bool _ShowSeriesSum = false;

    protected int _SumSeriesFontSize=8;
    protected string _SumSeriesFontName = "Arial Black";
    protected FontStyle _SumSeriesFontStyle = FontStyle.Bold;
    protected Color _SumSeriesFontColor = Color.Black;
    protected string _SumSeriesFormatString = "<%Value,0,0>";
    StoredProcInvoker SPI;

    public GraphHolder(string ChartID, WebControl ContainerControl)
    {
        _ChartID = ChartID;
        _ContainerControl = ContainerControl;
        string ObjectParentID = ChartID;
        string PropertyTable = "RPTChartEngineObjecProperty";
        LoadClassFields(ObjectParentID, ChartID, PropertyTable);
        _ChartControl.TempDirectory  = "~/temp";
        PropertyMapper PM = new PropertyMapper();
        _DefaultProperties = (_DefaultProperties.Trim() == "" ? (_DataOrientation == ChartDataOrientation.SimpleData ? "_DefaultProperties" : "_DefaultPivot") : _DefaultProperties);

        PM.LoadProperties(_ChartControl, _DefaultProperties);
        PM = new PropertyMapper();
        PM.LoadProperties(_ChartControl , ChartID );
        _ChartControl.Visible = true;
        _ContainerControl.Controls.Add(_ChartControl);
    }
    public GraphHolder(string ChartID, Page page, string ContainerId, int RowNo, int ColNo)
    {
        _ChartID = ChartID;
        _page = page;
        _ContainerControl = ContainerControl;
        string ObjectParentID = ChartID;
        string PropertyTable = "RPTChartEngineObjecProperty";
        LoadClassFields(ObjectParentID, ChartID, PropertyTable);
        _ChartControl.TempDirectory = "~/temp";
        PropertyMapper PM = new PropertyMapper();
        _DefaultProperties = (_DefaultProperties.Trim() == "" ? (_DataOrientation == ChartDataOrientation.SimpleData ? "_DefaultProperties" : "_DefaultPivot") : _DefaultProperties);

        PM.LoadProperties(_ChartControl, _DefaultProperties);
        PM = new PropertyMapper();
        PM.LoadProperties(_ChartControl, ChartID);

        _ChartControl.Visible = true;
        CUtilityWeb.PlaceControlInThePage(_ChartControl, _page, ContainerId, RowNo, ColNo);
        //_ContainerControl.Controls.Add(_ChartControl);
    }
    public DataTable QueryData(SearchPanel SPanel)
    {
        //_ChartControl.DefaultSeries.Type = dotnetCHARTING.SeriesType.Line 
        _SearchPanel = SPanel;
        switch (SQLCommandType)
        {
            case SQLCommandType.StoredProc:
                //SPI = new StoredProcInvoker(_SQLCommand, SPanel);
                if (_DataConnectionString == null)
                {
                    SPI = new StoredProcInvoker(_SQLCommand, SPanel);
                }
                else
                {

                    SPI = new StoredProcInvoker(_SQLCommand, SPanel, _DataConnectionString);
                }
                if (_GraphBuilderType == GraphBuilderType.Custom)
                {
                    CustomChart _CustomChart = new CustomChart(_ChartID, SPI.ResultTable);
                    _CustomChart.BuildChart(_ChartControl,_SearchPanel);
                    _ChartControl.Visible = true;
                    _ContainerControl.Controls.Add(_ChartControl);
                    return null;
                }
                if(SPI.DataOrientation != ChartDataOrientation.None )
                {
                    _DataOrientation =  SPI.DataOrientation ;
                    if (SPI.URL != null)
                    {
                        _ChartControl.DefaultElement.URL = SPI.URL;
                    }
                }
                
                if (SPI.ResultTable.Rows.Count < 1) 
                    return null;
                _ChartControl.DefaultElement.URL=_ChartControl.DefaultElement.URL.Trim();
                if(_ChartControl.DefaultElement.URL!="")
                {
                    _ChartControl.DefaultElement.URL = _SearchPanel.InsertParamValues(_ChartControl.DefaultElement.URL,true );
                }
                if (_ChartControl.DefaultLegendBox.DefaultEntry.URL != "")
                {
                    _ChartControl.DefaultLegendBox.DefaultEntry.URL = _SearchPanel.InsertParamValues(_ChartControl.DefaultLegendBox.DefaultEntry.URL, true);
                }
                string ColumnOrientation = "";
                int iLoop = 1;
                DataColumn DC;
                if (_DataOrientation == ChartDataOrientation.SimpleData)
                {
                    //if (SPI.ResultTable.Columns.Count == 3 && SPI.ResultTable.Columns[0].DataType = T
                    ColumnOrientation = "xAxis=" + SPI.ResultTable.Columns[0].ColumnName.ToString();// +"=" + CUtilityWeb.BreakCamelCase(SPI.ResultTable.Columns[0].ColumnName.ToString());
                    while (SPI.ResultTable.Columns.Count > iLoop)
                    {

                        DC = SPI.ResultTable.Columns[iLoop];
                        ColumnOrientation += ",yAxis=" + DC.ColumnName.ToString();// +"=" + CUtilityWeb.BreakCamelCase(DC.ColumnName.ToString());
                        iLoop++;
                    }
                    _ChartControl.Series.DataFields = ColumnOrientation;
                }
                if (_DataOrientation == ChartDataOrientation.PiesData)
                {
                    _ChartControl.Type = dotnetCHARTING.ChartType.Pies;
                }

                //else if (_DataOrientation == ChartDataOrientation.HouresComparison)
                //{
                //}
                //_ChartControl.YAxis.Scale = dotnetCHARTING.Scale.Stacked;
                _ChartControl.Series.Data = SPI.ResultTable;
                
                _ChartControl.SeriesCollection.Add();
                _ChartControl.Visible = true;
                _ContainerControl.Controls.Add(_ChartControl);

                _ChartControl.PostDataProcessing += new dotnetCHARTING.PostDataProcessingEventHandler(OnPostDataProcessing);  
                break;
            case SQLCommandType.SQLText:
                return null;
                break;
            default:
                return null;
                break;
        }
        return null;
    }

    void OnPostDataProcessing(Object sender)
    {
        Boolean IsTooltipSet = false;
        //dotnetCHARTING.Series SumSeries= new dotnetCHARTING.Series("Total",dotnetCHARTING.SeriesType.Marker);
        if (_ShowSeriesSum)
        {
            foreach (dotnetCHARTING.Series ser in _ChartControl.SeriesCollection)
            {
                ser.DefaultElement.SmartLabel.AlignmentSecondary.Clear();
                foreach (dotnetCHARTING.Element el in ser.Elements)
                {
                    el.SmartLabel.AlignmentSecondary.Clear();
                }
            }

            dotnetCHARTING.Series SumSeries = _ChartControl.SeriesCollection.Calculate("Sum Series", dotnetCHARTING.Calculation.Sum);
            SumSeries.Type = dotnetCHARTING.SeriesType.Marker;
            SumSeries.DefaultElement.Marker.Type = dotnetCHARTING.ElementMarkerType.None;
            SumSeries.DefaultElement.SmartLabel.Alignment = dotnetCHARTING.LabelAlignment.Top;
            SumSeries.DefaultElement.SmartLabel.Font = new Font(_SumSeriesFontName, _SumSeriesFontSize, FontStyle.Bold);
            SumSeries.DefaultElement.SmartLabel.Color = _SumSeriesFontColor;
            SumSeries.DefaultElement.SmartLabel.Text = _SumSeriesFormatString;// "<%Value,0,0>";
            _ChartControl.SeriesCollection.Add(SumSeries);
        }


        string RegPat = @"(\.*)(&*)(_*)(-*)( *)(\\*)(/*)('*)(""*)";
        if (_DataOrientation == ChartDataOrientation.SimpleData)
        {
            int iLoop = 1;
            string DDLURL = _ChartControl.DefaultElement.URL;
            foreach (dotnetCHARTING.Series ser in _ChartControl.SeriesCollection)
            {

                if (_ChartDrillDownType == DrillDownType.MultiLevelMultiBranch) //if chart drilldowns to multiple reports for each series
                {
                    foreach (dotnetCHARTING.Element el in ser.Elements)
                    {
                        string elName = el.Name;
                        //Regex.IsMatch(txtRegExp.Text,txtInputToMatch.Text)
                        elName = System.Text.RegularExpressions.Regex.Replace(elName, RegPat, "");
                        el.URL = DDLURL.Replace("::NextReportID::", elName).Replace("::SeriesName::", ser.Name);
                        if (Double.IsNaN(el.YValue) || el.YValue == 0)
                        {
                            el.YValue = 0;
                            el.ShowValue = _ShowSeriesValueWhenZero;
                        }
                    }
                }
                else
                {
                    ser.DefaultElement.URL = DDLURL.Replace("::SeriesName::", ser.Name);
                    foreach (dotnetCHARTING.Element el in ser.Elements)
                    {
                        if (el.YValue == 0)
                        {

                            el.ShowValue = _ShowSeriesValueWhenZero;
                        }
                        el.URL = ser.DefaultElement.URL.Replace("::ElementName::", el.Name).Replace("::xElementNamex::", System.Text.RegularExpressions.Regex.Replace(el.Name, RegPat, ""));
                        //el.URL = ser.DefaultElement.URL.Replace("::xElementNamex::", System.Text.RegularExpressions.Regex.Replace(el.Name, RegPat, ""));
                    }

                }
                if (!(_ShowSeriesSum && SPI.ResultTable.Columns.Count == iLoop))
                {
                    //if it's sum series don't get the series name from the table column name
                    string SerName = CUtilityWeb.BreakCamelCase(SPI.ResultTable.Columns[iLoop].ToString());
                    ser.Name = SerName;
                    ser.DefaultElement.ToolTip = SerName + " - %YValue";
                    IsTooltipSet = true;
                }
                iLoop++;
            }

        }
        else if (_DataOrientation == ChartDataOrientation.PivotData)
        {
            foreach (dotnetCHARTING.Series ser in _ChartControl.SeriesCollection)
            {
                string DDLURL = "";
                //  DDLURL= _DrillDownURL==""? _ChartControl.DefaultElement.URL.Replace("::SeriesName::",ser.Name ) :_DrillDownURL.Replace("::SeriesName::",ser.Name );
                DDLURL = _ChartControl.DefaultElement.URL.Replace("::SeriesName::", ser.Name);

                DDLURL = _SearchPanel.InsertParamValues(DDLURL);
                ser.DefaultElement.URL = DDLURL;
                ser.DefaultElement.ToolTip = ser.Name + " - %YValue";
                IsTooltipSet = true;
                foreach (dotnetCHARTING.Element el in ser.Elements)
                {
                    if (el.YValue == 0)
                    {


                        el.ShowValue = _ShowSeriesValueWhenZero;

                    }
                }
            }
        }
        else if (_DataOrientation == ChartDataOrientation.PiesData)
        {
            //_ChartControl.LegendBox.DefaultEntry.Value = "";
            foreach (dotnetCHARTING.Series ser in _ChartControl.SeriesCollection)
            {
                foreach (dotnetCHARTING.Element el in ser.Elements)
                {
                    string DDLURL = _ChartControl.DefaultElement.URL.Replace("::ElementName::", el.Name);
                    DDLURL = DDLURL.Replace("::SeriesName::", ser.Name);
                    el.URL = DDLURL;
                    el.ToolTip = el.Name + " - %YValue";
                    IsTooltipSet = true;
                    if (el.YValue == 0)
                    {

                        el.ShowValue = _ShowSeriesValueWhenZero;
                    }
                }
            }
        }
        //    _ChartControl.SeriesCollection.Add(dotnetCHARTING.Calculation.Sum);
        //   _ChartControl.SeriesCollection.Add(SumSeries);
        if (_ColorPaletteName != "") //if the colors palette will be assigned to  Elements
        {
            string SSQL = string.Format("SELECT ColorKey, Color FROM RPTChartEngineColorPalette WHERE (PaletteName = '{0}')", _ColorPaletteName);
            DataTable dtColorPalette;
            using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                dtColorPalette = CUtilityWeb.getDataTable(SSQL, sqlConnection);
            }
            if (_ColorPaletteType == GraphColorPalette.ManualElementPalette || _DataOrientation == ChartDataOrientation.PiesData)
            {
                foreach (dotnetCHARTING.Series ser in _ChartControl.SeriesCollection)
                {
                    foreach (dotnetCHARTING.Element el in ser.Elements)
                    {
                        DataRow[] FilteredRows = dtColorPalette.Select("ColorKey = '" + el.Name + "'");
                        if (FilteredRows.Length > 0)
                        {
                            el.Color = ColorTranslator.FromHtml(FilteredRows[0]["Color"].ToString());// Color.FromArgb( ;
                        }
                    }
                }
            }
            else if (_ColorPaletteType == GraphColorPalette.ManualSeriesPalette) //if the colors palette will be assigned to  Series
            {
                foreach (dotnetCHARTING.Series ser in _ChartControl.SeriesCollection)
                {
                    if (!IsTooltipSet)
                        ser.DefaultElement.ToolTip = ser.Name + " - %YValue";

                    DataRow[] FilteredRows = dtColorPalette.Select("ColorKey = '" + ser.Name + "'");
                    if (FilteredRows.Length > 0)
                    {
                        ser.DefaultElement.Color = ColorTranslator.FromHtml(FilteredRows[0]["Color"].ToString());// Color.FromArgb( ;
                    }
                    //dtColorPalette.DefaultView.RowFilter = "ColorKey = '" + ser.Name + "'";
                    //if (dtColorPalette.Rows.Count > 0)
                    //{
                    //    ser.DefaultElement.Color = ColorTranslator.FromHtml(dtColorPalette.Rows[0]["Color"].ToString());
                    //}
                }
            }

        }
        if (_GraphBuilderType == GraphBuilderType.CustomURL)
        {

            CustomChart CustomURL = new CustomChart(_ChartID);
            CustomURL.BuildCustomURL(ref _ChartControl);
            CustomURL = null;
        }
    } //end if postDataProcessing


}

public class ReportHolder : SimplePropertyMapper
{
    protected string _ChartID = null;
    protected string _GridID = null;
    protected string _GroupHeading = null;
    protected string _Heading = null;
    protected string _LongDetail = null;
    protected string _SearchPanelID = null;
    protected bool _IsSearchPanelVisible= true;
    protected string _ShortDetail = null;
    protected string _ReportDepth = null;
    protected Label  lblReportDepth = null;

    protected string _ChartSideLabel = null;
    protected string _SideLabelConditionTemplate = "";
    
    protected string _ChartBottomLabel = null;
    protected string _BottomLabelConditionTemplate = "";

    protected string _ReportLayoutControl = "./ReportLayouts/TestLayout.ascx";

    protected string _SearchIconText = "Click here to customize search criteria",
     _UpIconText = "Click here to return to the main page",
     _DownIconText = "Click here to return to the next page";
    bool _ShowIconsText = false;
    

    public string ChartID
    {
        get { return _ChartID; }
    }
    public string BottomLabelConditionTemplate
    {
        get { return _BottomLabelConditionTemplate; }
    }
    public string ChartBottomLabel
    {
        get { return _ChartBottomLabel; }
    }
    public string SideLabelConditionTemplate
    {
        get { return _SideLabelConditionTemplate; }
    }
    public string ChartSideLabel
    {
        get { return _ChartSideLabel; }
    }
    public string GridID
    {
        get { return _GridID; }
    }
    public string GroupHeading
    {
        get { return _GroupHeading; }
    }
    public string Heading
    {
        get { return _Heading; }
    }
    public string LongDetail
    {
        get { return _LongDetail; }
    }
    public string SearchPanelID
    {
        get { return _SearchPanelID; }
    }
    public bool IsSearchPanelVisible
    {
        get { return _IsSearchPanelVisible; }
    }
    public string ShortDetail
    {
        get { return _ShortDetail; }
    }
    public string ReportDepth
    {
        get { return _ReportDepth; }
    }
    public string ReportLayoutControl
    {
        get { return _ReportLayoutControl; }
    }

    public string UpIconText { get { return _UpIconText; } }
    public string DownIconText { get { return _DownIconText; } }
    public string SearchIconText { get { return _SearchIconText; } }
    public bool ShowIconsText { get { return _ShowIconsText; } }
   
//_SearchIconText = "Click here to customize search criteria",
//_UpIconText = "Click here to return to the main page",
//_DownIconText = "Click here to return to the next page";
//    protected int _ShowIconsText = -1; //default

    public ReportHolder(string ReportID)
    {
        string PropertyTable = "RPTChartEngineObjecProperty";
        string SQLProperties = string.Format(@"select  ReportID, '_' + PropertyName AS PropertyName,  PropertyValue from RPTChartEngineReport where ReportID='{0}'
                                              ",ReportID);
        LoadClassFields(SQLProperties);
    }

}

public class ReportWidgetLoader : IDisposable
{
    Page _Page;
    string _ReportId;
    private bool disposed = false;
    public string ReportId { get { return _ReportId; } }
    public IndexedDictionary<string, ReportWidget> ReportWidgets = new IndexedDictionary<string, ReportWidget>();
    
    private StringBuilder _WidgetsJS = new StringBuilder(1024);
    public  ReportWidgetLoader(Page page,string ReportId)
    {
        IndexedDictionary<string, ReportWidget> tst = new IndexedDictionary<string, ReportWidget>();
        
        //tst[
        _Page = page;
        _ReportId = ReportId;

        string SQLWidgets = string.Format (@"
SELECT     ReportWidgetId, ContainerID, RowNo, ColNo, ReportWidgetType,SearchPanelId
FROM         RPTChartEngineReportWidgets
WHERE     (ReportId = '{0}') and RenderWidget =1
order by orderid
",ReportId);
        using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
        {
            DataTable dtReportWidgets = CUtilityWeb.getDataTable(SQLWidgets, Conn);
            foreach (DataRow drReportWidget in dtReportWidgets.Rows)
            {
                ReportWidget reportWidget = 
                    new ReportWidget(drReportWidget["ReportWidgetId"].ToString(),drReportWidget["ContainerID"].ToString(),
                    Convert.ToInt32( drReportWidget["RowNo"]),Convert.ToInt32( drReportWidget["ColNo"]),
                    (WidgetType)Enum.Parse(typeof(WidgetType), drReportWidget["ReportWidgetType"].ToString()), 
                    drReportWidget["SearchPanelId"].ToString(),this,_Page );

                ReportWidgets.Add(drReportWidget["ReportWidgetId"].ToString(), reportWidget);


                    //new KeyValuePair<string, ReportWidget>
                    //(drReportWidget["ReportWidgetId"].ToString(), reportWidget));
            }
        }
    }
    public void UnloadWidgets()
    {
       
    }
    public void QueryData()
    {

        foreach (ReportWidget RW in ReportWidgets.Values)
        {
            if (RW.WidgetInstance is IDataPresentator)
            {
                RW.QueryData();
            }

        }


        if (_Page is IReportPortalSettings)
        {

            if (((IReportPortalSettings)_Page).PageRequestType != WidgetServerRequestType.CallBack)
            {
                foreach (ReportWidget RW in ReportWidgets.Values)
                {
                    if (RW.WidgetInstance is IDataPresentator)
                    {
                        _WidgetsJS.Append(RW.WidgetJS);
                    }
                }
                _Page.ClientScript.RegisterStartupScript(this.GetType(), "ClientSideWidgetDefinationJS",
                string.Format(@"<script language=""javascript"" type=""text/javascript"">
    {0}

</script>        
", _WidgetsJS.ToString()));
            }
        }
    }
    public string ReplaceParamValues(string ParamString)
    {
       // string paramString = ParamString;
        if (ParamString.Contains("::"))
            foreach (ReportWidget RW in ReportWidgets.Values)
        {
            if (RW.WidgetType == WidgetType.SearchPanel)
            {
                if(ParamString.Contains("::" +RW.WidgetId +"."))
                {
                    ParamString=ParamString.Replace("::" + RW.WidgetId + ".", "::");
                    ParamString=((SearchPanel)RW.WidgetInstance).InsertParamValues(ParamString, FieldValueType.Text);
                }
            }
        }
    return ParamString;
    }

    #region IDisposable Members

    public void Dispose()
    {
        Dispose(true);
        GC.SuppressFinalize(this);
    }
    private void Dispose(bool disposing)
    {

        if (!this.disposed)
        {

            if (disposing)
            {
                foreach (ReportWidget RW in ReportWidgets.Values)
                {
                    RW.Dispose();
                    
                }
                ReportWidgets.Clear();
            }
        }
        disposed = true;
    }
    #endregion
    ~ReportWidgetLoader()
    {
        Dispose(false);
    }
}
public interface IReportWidget
{

}
public class ReportWidget :  IReportWidget,IDisposable
{
    public  ReportWidgetLoader _ReportWidgetLoader;
    private bool disposed = false;
    private string _ReportId;
    public string ReportId
    {
        get { return _ReportId; }
    }

    private  string _WidgetId;
    public string WidgetId
    {
        get { return _WidgetId; }
    }
	
    private string _ContainerId;
    private int _RowNo = -1;
    private int _ColNo = -1;
    private WidgetType _WidgetType;
    public WidgetType  WidgetType
    {
        get { return _WidgetType; }
    }
	
    private object _WidgetInstance = null;

    private Page _Page;
    private bool _IsVisible=true;

    private string _SearchPanelId="";
    public object WidgetInstance
    {
        get { return _WidgetInstance; }

    }

    public ReportWidget(string WidgetId, string ContainerId, int RowNo, int ColNo, WidgetType widgetType, string SearchPanelId, ReportWidgetLoader reportWidgetLoader, Page page)
    {
        _WidgetId=WidgetId;
        _ContainerId=ContainerId;
        _RowNo=RowNo;
        _ColNo=ColNo;
        _WidgetType = widgetType;
        _Page = page;
        _SearchPanelId = SearchPanelId;
        _ReportWidgetLoader = reportWidgetLoader;
        _ReportId = reportWidgetLoader.ReportId;
        switch (widgetType)
        {
            case WidgetType.SearchPanel:
                _WidgetInstance=LoadSearchPanel();
                break;
            case WidgetType.dotNetChart:
                _WidgetInstance=LoadDotNetChart();
                break;
            case WidgetType.ASPGrid:
                _WidgetInstance=LoadASPGrid();
                break;
            case WidgetType.FusionChart:
                _WidgetInstance=LoadFusionChart();
                break;
            case WidgetType.HTMLPanel:
                _WidgetInstance = LoadHTMLPanel();
                break;
            case WidgetType.HTMLLabel:
                _WidgetInstance = LoadHTMLLabel();
                break;
            case WidgetType.SubMenu:
                _WidgetInstance = LoadSubMenu();
                break;
            case WidgetType.WorldMap:
                _WidgetInstance = LoadWorldMap();
                break;
            default:
                break;
        }
    }
    object  LoadSearchPanel()
    {
        return new SearchPanel(_WidgetId, _Page, _ContainerId,_RowNo,_ColNo );
    }
    object LoadDotNetChart()
    {
        return new GraphHolder(_WidgetId, _Page, _ContainerId, _RowNo, _ColNo);

    }
    object LoadASPGrid()
    {
        if(_Page is IReportPortalSettings) 

            return LoadControl(PortalConfiguration.WidgetsPath +"ASPGridWidget.ascx",
                _WidgetId, _ContainerId, _RowNo, _ColNo);
        else
        return new GridHolder(_WidgetId, _Page, _ContainerId, _RowNo, _ColNo);

    }
    object LoadFusionChart()
    {
        return new FusionChartWidget(_WidgetId, _Page, _ContainerId, _RowNo, _ColNo);
    }
    object LoadHTMLPanel()
    {
        Control ctrl = LoadControl(PortalConfiguration.WidgetsPath + "HTMLPanelWidget.ascx",
            _WidgetId, _ContainerId, _RowNo, _ColNo);
        return  ctrl;
    }
    object LoadHTMLLabel()
    {
        Control ctrl = LoadControl(PortalConfiguration.WidgetsPath + "HTMLLabelWidget.ascx",
            _WidgetId, _ContainerId, _RowNo, _ColNo);
        return ctrl;
    }
    object LoadSubMenu()
    {
        Control ctrl = LoadControl(PortalConfiguration.WidgetsPath + "SubMenu.ascx",
            _WidgetId, _ContainerId, _RowNo, _ColNo);
        return ctrl;
    }
    
    object LoadWorldMap()
    {
        Control ctrl = LoadControl(PortalConfiguration.WidgetsPath + "WoldMAPWidget.ascx",
            _WidgetId, _ContainerId, _RowNo, _ColNo);
        return ctrl;
    }
    public void QueryData()
    {
        if (string.IsNullOrEmpty(_SearchPanelId))
        {
            ((IDataPresentator)_WidgetInstance).QueryData(null);
        }
        else
        {
            ((IDataPresentator)_WidgetInstance).QueryData((SearchPanel)_ReportWidgetLoader.ReportWidgets[_SearchPanelId]._WidgetInstance);
        }
    }

    public string WidgetJS
    {
        get
        {
            IDrillDownableWidget Widget;
             string WidgetUniqueId = _WidgetId + "_" + _ContainerId + "_" + _RowNo.ToString() + _ColNo.ToString();

            if (_WidgetType == WidgetType.FusionChart)
            {
                WidgetUniqueId = _WidgetId + "_" + _ContainerId + "_" + _RowNo.ToString() + _ColNo.ToString();
                Widget = (IDrillDownableWidget)WidgetInstance;
                return DrillDownWidgetJS(Widget, "m" + WidgetUniqueId.Replace("_", ""));

            }
            else if (WidgetType == WidgetType.ASPGrid)
            {
                // WidgetUniqueId.Substring(3).Replace("_", "")
                Widget = (IDrillDownableWidget)WidgetInstance;
                WidgetUniqueId = _WidgetId + "_" + _ContainerId + "_" + _RowNo.ToString() + _ColNo.ToString();
                return DrillDownWidgetJS(Widget ,WidgetUniqueId);
            }
            else if (_WidgetType == WidgetType.WorldMap )
            {
                WidgetUniqueId = _WidgetId + "_" + _ContainerId + "_" + _RowNo.ToString() + _ColNo.ToString();
                Widget = (IDrillDownableWidget)WidgetInstance;
                return DrillDownWidgetJS(Widget,  WidgetUniqueId);

            }
            else return "";
        }
    }
    string DrillDownWidgetJS(IDrillDownableWidget Widget,string WidgetUniqueId)
    {

        return (_SearchPanelId !="" ? string.Format(@"
        objSearchPanels.addWidgetToSearchPanel('{0}','{1}',{2},'{3}');
                ", _WidgetId, _WidgetType.ToString(), WidgetUniqueId, _SearchPanelId): string.Format(@"
        //objWidgets.addWidget({0},'{1}');
        objWidgets.addWidget(new UpdateableWidget('{0}','{1}',{2},'{3}'),'{0}');
        ",  _WidgetId,_WidgetType.ToString(),WidgetUniqueId,""))
          +

        string.Format(@" 
        objWidgets.getWidgetById('{0}').ContainerClientId='{1}';",
                              _WidgetId, Widget.ContainerClientId)
          +
        (Widget.ParentWidgetId != "" ?
        string.Format(@" 
        objWidgets.getWidgetById('{0}').ParentWidgetId='{1}';",
                              _WidgetId, Widget.ParentWidgetId) : "")
          +
        (Widget.DrillDownWidgetId != "" ?
        string.Format(@" 
        objWidgets.getWidgetById('{0}').DrillDownWidgetId='{1}';",
                              _WidgetId, Widget.DrillDownWidgetId) : "")
          +
         (Widget.SearchPanelsToUpdate != "" ?
        string.Format(@" 
        objWidgets.getWidgetById('{0}').SearchPanelsToUpdate='{1}';",
                              _WidgetId, Widget.SearchPanelsToUpdate) : "");
    }

    private UserControl LoadControl(string UserControlPath, params object[] constructorParameters)
    {
        List<Type> constParamTypes = new List<Type>();
        foreach (object constParam in constructorParameters)
        {
            constParamTypes.Add(constParam.GetType());
        }

        UserControl ctl = _Page.LoadControl(UserControlPath) as UserControl;

        // Find the relevant constructor
        ConstructorInfo constructor = ctl.GetType().BaseType.GetConstructor(constParamTypes.ToArray());

        //And then call the relevant constructor
        if (constructor == null)
        {
            throw new MemberAccessException("The requested constructor was not found on : " + ctl.GetType().BaseType.ToString());
        }
        else
        {
            constructor.Invoke(ctl, constructorParameters);
        }

        // Finally return the fully initialized UC
        return ctl;
    }

    #region IDisposable Members

    public void Dispose()
    {
        Dispose(true);
        GC.SuppressFinalize(this);
    }
    private void Dispose(bool disposing)
    {

        if (!this.disposed)
        {

            if (disposing)
            {
                if (_WidgetInstance is IDisposable) ((IDisposable)_WidgetInstance).Dispose();
                _WidgetInstance = null;
                _ReportWidgetLoader = null;
            }
        }
        disposed = true;
    }
    ~ReportWidget()
    {
        Dispose(false);
    }
    #endregion
}
}