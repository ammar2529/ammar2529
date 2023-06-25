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
using System.Xml;
using System.IO;
using System.Text;
using System.Data.SqlClient;
namespace WebProject.ReportsEngine
{
    //using EO.Web;


    public interface IChartBuilder
    {

    }
    public class NoFieldsDataFoundException : Exception
    {
        public NoFieldsDataFoundException() : base() { }
        public NoFieldsDataFoundException(string s) : base(s) { }
        public NoFieldsDataFoundException(string s, Exception ex) : base(s, ex) { }

    }
    public class UIControlNotFoundException : Exception
    {
        public UIControlNotFoundException() : base() { }
        public UIControlNotFoundException(string s) : base(s) { }
        public UIControlNotFoundException(string s, Exception ex) : base(s, ex) { }

    }
    public class FieldPropertyNotFoundException : Exception
    {
        public FieldPropertyNotFoundException() : base() { }
        public FieldPropertyNotFoundException(string s) : base(s) { }
        public FieldPropertyNotFoundException(string s, Exception ex) : base(s, ex) { }

    }
    public class UnableToCreateUIControlException : Exception
    {
        public UnableToCreateUIControlException() : base() { }
        public UnableToCreateUIControlException(string s) : base(s) { }
        public UnableToCreateUIControlException(string s, Exception ex) : base(s, ex) { }

    }



    public class ChartBuilder
    {
        string _ChartID;
        Control _ChartContainer;
        public ChartBuilder(string ChartID, Control ChartContainer)
        {
        }
    }
    public interface ISearchField : IField
    {
        EqualityOperator Operator { get; set; }
        //ParameterType QueryParameterType { get;  }
        bool CriteriaIncluded { get; }
        RelationOperator RelationOperatorType { get; set; }
        ControlType UIControlType { get; set; }

        WebControl FieldControl { get; set; }

        string CssClass { get; set; }
        string CaptionCssClass { get; set; }
        string LookupQuery { get; set; }
        string ChartGroupID { get; set; }
        string Caption { get; set; }

        bool IsCrossPage { get; set; }
        bool Visible { get; set; }
        bool Enabled { get; set; }
        bool ReadOnly { get; set; }
        bool CaptionVisible { get; set; }

        int ContainerRow { get; set; }
        int ContainerCol { get; set; }
        int CaptionContainerRow { get; set; }
        int CaptionContainerCol { get; set; }


        int InitField(DataTable dtFields, int RowNum);
    }
    public class SearchField : Field, ISearchField
    {
        const string COMBONONSELECTEDTEXT = "---- Select Value ----";
        const string COMBONONSELECTEDVALUE = "-1";

        string _SearchPanelID;
        string _SearchButtonID;
        SearchPanel _SearchPanel;

        private string SearchFieldControlID
        {
            get
            {
                return _SearchPanelID + "_" + _ID;
            }
        }

        protected System.Web.UI.WebControls.Table _ContainerTable;
        protected System.Web.UI.Page _Page;

        protected ControlType _UIControlType;
        protected bool _CriteriaIncluded;
        protected RelationOperator _RelationOperatorType;
        protected EqualityOperator _Operator;
        protected FieldValueType _ValueType = FieldValueType.Value;



        protected string _Skin = "";
        protected string _ListValues;
        protected string _CasecadParentID = "";
        protected string _CasecadChildID = "";
        protected string _CssClass;
        protected string _CaptionCssClass;
        protected string _LookupQuery;
        protected string _ChartGroupID;
        protected string _Caption;
        protected string _EmptyValue;
        protected string _WhenEmptyValue;

        protected bool _IsCrossPage = false;
        protected bool _Visible = true;
        protected bool _Enabled = true;
        protected bool _ReadOnly = false;
        protected bool _CaptionVisible = false;

        protected int _ContainerRow;
        protected int _ContainerCol;
        protected int _CaptionContainerRow;
        protected int _CaptionContainerCol;
        protected int _Width = 190;
        public static string _ParentValue = ""; //By India Team
                                                //
        private WebControl _FieldControl = null;

        public WebControl FieldControl
        {
            get { return _FieldControl; }
            set { _FieldControl = value; }
        }

        public ControlType UIControlType
        {
            get { return _UIControlType; }
            set { _UIControlType = value; }
        }

        public RelationOperator RelationOperatorType
        {
            get { return _RelationOperatorType; }
            set { _RelationOperatorType = value; }
        }
        public EqualityOperator Operator
        {
            get { return _Operator; }
            set { _Operator = value; }
        }

        public string Skin
        {
            get { return _Skin; }
            set { _Skin = value; }
        } //for date picker control

        public string CasecadChildID
        {
            get { return _CasecadChildID; }
        }
        public string CasecadParentID
        {
            get { return _CasecadParentID; }
        }

        public string CssClass
        {
            get { return _CssClass; }
            set { _CssClass = value; }
        }
        public string CaptionCssClass
        {
            get { return _CaptionCssClass; }
            set { _CaptionCssClass = value; }
        }
        public string LookupQuery
        {
            get { return _LookupQuery; }
            set { _LookupQuery = value; }
        }
        public string ChartGroupID
        {
            get { return _ChartGroupID; }
            set { _ChartGroupID = value; }
        }
        public string Caption
        {
            get { return _Caption; }
            set { _Caption = value; }
        }
        public string EmptyValue
        {
            get { return _EmptyValue; }
        } //if control have this value in text property it will be considered empty.
        public FieldValueType GetFieldValueType
        {
            get { return _ValueType; }
        }

        public string FieldValue
        {
            get
            {
                switch (UIControlType)
                {
                    case ControlType.TextBox:
                        return ((TextBox)_FieldControl).Text;
                        break;
                    case ControlType.ComboBox:
                        if (_ValueType == FieldValueType.Value) return ((DropDownList)_FieldControl).SelectedValue;
                        else return ((DropDownList)_FieldControl).SelectedItem.Text;
                        break;
                    case ControlType.ComboBoxValues:
                        if (_ValueType == FieldValueType.Value) return ((DropDownList)_FieldControl).SelectedValue;
                        else return ((DropDownList)_FieldControl).SelectedItem.Text;
                        break;
                    case ControlType.LookUpComboBox:
                        if (_ValueType == FieldValueType.Value) return ((DropDownList)_FieldControl).SelectedValue;
                        else return ((DropDownList)_FieldControl).SelectedItem.Text;
                        break;
                    case ControlType.LookUpComboBoxCascade:
                        if (_ValueType == FieldValueType.Value) return ((DropDownList)_FieldControl).SelectedValue;
                        else return ((DropDownList)_FieldControl).SelectedItem.Text;
                        break;
                    case ControlType.DateControl:
                        return ((EO.Web.DatePicker)_FieldControl).SelectedDateString;
                        break;
                    case ControlType.CheckBoxList:
                        return null;
                        break;
                    case ControlType.OptionButtonList:
                        return null;

                        break;
                    default:
                        return null;

                        break;
                }
            }
        }
        public string FieldTextValue
        {
            get
            {
                switch (UIControlType)
                {
                    case ControlType.TextBox:
                        return ((TextBox)_FieldControl).Text;
                        break;
                    case ControlType.ComboBox:
                    case ControlType.ComboBoxValues:
                    case ControlType.LookUpComboBox:
                    case ControlType.LookUpComboBoxCascade:
                        return ((DropDownList)_FieldControl).SelectedItem.Text;
                        break;
                    case ControlType.DateControl:
                        return ((EO.Web.DatePicker)_FieldControl).SelectedDateString;
                        break;
                    case ControlType.CheckBoxList:
                        break;
                    case ControlType.OptionButtonList:
                        break;
                    default:

                        break;
                }
                return null;
            }
        }
        public string FieldBehindValue
        {
            get
            {
                switch (UIControlType)
                {
                    case ControlType.TextBox:
                        return ((TextBox)_FieldControl).Text;
                        break;
                    case ControlType.ComboBox:
                    case ControlType.ComboBoxValues:
                    case ControlType.LookUpComboBox:
                    case ControlType.LookUpComboBoxCascade:
                        return ((DropDownList)_FieldControl).SelectedItem.Value;
                        break;
                    case ControlType.DateControl:
                        return ((EO.Web.DatePicker)_FieldControl).SelectedDateString;
                        break;
                    case ControlType.CheckBoxList:
                        break;
                    case ControlType.OptionButtonList:
                        break;
                    default:

                        break;
                }
                return null;
            }
        }
        public string FieldValueWithNull
        {
            get
            {
                if (FieldValue.Trim() == _EmptyValue)
                {
                    return _WhenEmptyValue;
                }
                //else if(_UIControlType==ControlType.TextBox && _EmptyValue== null && _WhenEmptyValue!=null)
                //{
                //    return _WhenEmptyValue;
                //}
                else
                {
                    return FieldValue;
                }
            }
        }
        public string WhenEmptyValue
        {
            get
            {
                return _WhenEmptyValue;
            }
        }

        public bool IsFieldEmpty
        {
            get
            {
                if (FieldValue == EmptyValue)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
        }
        public bool CriteriaIncluded
        {
            get { return _CriteriaIncluded; }

        }
        public bool IsCrossPage
        {
            get { return _IsCrossPage; }
            set { _IsCrossPage = value; }
        }
        public bool Visible
        {
            get { return _Visible; }
            set { _Visible = value; }
        }
        public bool CaptionVisible
        {
            get { return _CaptionVisible; }
            set { _CaptionVisible = value; }
        }
        public bool Enabled
        {
            get { return _Enabled; }
            set { _Enabled = value; }
        }
        public bool ReadOnly
        {
            get { return _ReadOnly; }
            set { _ReadOnly = value; }
        }

        public int ContainerRow
        {
            get { return _ContainerRow; }
            set { _ContainerRow = value; }
        }
        public int ContainerCol
        {
            get { return _ContainerCol; }
            set { _ContainerCol = value; }
        }
        public int CaptionContainerRow
        {
            get { return _CaptionContainerRow; }
            set { _CaptionContainerRow = value; }
        }
        public int CaptionContainerCol
        {
            get { return _CaptionContainerCol; }
            set { _CaptionContainerCol = value; }
        }
        string _QueryParameter = null;

        private void SearchPanel_FieldsInitCompleted(object sender, EventArgs e)
        {
            if (UIControlType == ControlType.LookUpComboBoxCascade)
            {
            }
        }
        public SearchField()
        {
        }
        public SearchField(Page page, SearchPanel SearchPanel, System.Web.UI.WebControls.Table Container, string SearchButtonID)
        {
            _SearchPanel = SearchPanel;
            _SearchButtonID = SearchButtonID;
            _SearchPanelID = _SearchPanel.SearchPanelID;
            _ContainerTable = Container;
            _Page = page;
            SearchPanel.FieldsInitCompleted += new EventHandler(SearchPanel_FieldsInitCompleted);
        }
        public int InitField(DataTable dtFields, int RowNum, DataTable ReportProperties)
        {
            int iRow = RowNum;

            string FieldID = dtFields.Rows[iRow]["FieldID"].ToString();
            Type searchfieldType = this.GetType();
            while (dtFields.Rows.Count > iRow && dtFields.Rows[iRow]["FieldID"].ToString() == FieldID) //LoadWidget Level Field Properties
            {
                string FieldProperty = dtFields.Rows[iRow]["FieldProperty"].ToString();
                FieldInfo fieldInfo = searchfieldType.GetField(FieldProperty, BindingFlags.NonPublic | BindingFlags.Instance);
                if (fieldInfo == null) throw new FieldPropertyNotFoundException(string.Format("Class doesn't contain property {0}!", dtFields.Rows[iRow]["FieldProperty"].ToString()));
                fieldInfo.SetValue(this, BoxValue(dtFields.Rows[iRow]["PropertyValue"], fieldInfo));
                iRow++;
            }
            if (ReportProperties != null) // Load Report Level Field Properties
            {
                DataRow[] drReportProperties = ReportProperties.Select("trim(WidgetChildId)='" + _ID + "'");
                foreach (DataRow FieldPropRow in drReportProperties)
                {
                    string FieldProperty = FieldPropRow["WidgetChildPropertyName"].ToString();
                    FieldInfo fieldInfo = searchfieldType.GetField(FieldProperty, BindingFlags.NonPublic | BindingFlags.Instance);
                    if (fieldInfo == null) throw new FieldPropertyNotFoundException(string.Format("Class doesn't contain property {0}!", FieldPropRow["WidgetChildPropertyName"].ToString()));
                    fieldInfo.SetValue(this, BoxValue(FieldPropRow["WidgetChildPropertyValue"], fieldInfo));
                }
            }

            switch (this._UIControlType)
            {
                case ControlType.TextBox:
                    AddTextBoxToSearch();
                    break;
                case ControlType.ComboBox:
                    break;
                case ControlType.ComboBoxValues:
                    AddComboBoxValuesToSearch();
                    break;
                case ControlType.LookUpComboBox:
                    AddLookUpComboBoxToSearch();
                    break;
                case ControlType.LookUpComboBoxCascade:
                    AddCaseCadeComboBoxToSearch();
                    break;
                case ControlType.DateControl:
                    AddDateControlToSearch();
                    break;
                case ControlType.CheckBoxList:
                    break;
                case ControlType.OptionButtonList:
                    break;
                default:
                    break;
            }
            AddCaptionToSearch();
            return iRow;
        }
        public int InitField(DataTable dtFields, int RowNum)
        {
            return InitField(dtFields, RowNum, null);
        }

        object BoxValue(object PropertyValue, FieldInfo FI)
        {
            if (FI.FieldType.Name == "Object")
            {
                return PropertyValue;
            }
            else if (FI.FieldType.BaseType.Name == "Enum")
            {
                return Enum.Parse(FI.FieldType, PropertyValue.ToString());
            }
            else
            {
                return Convert.ChangeType(PropertyValue, FI.FieldType);
            }
        }
        void AddTextBoxToSearch()
        {
            TextBox txtBox = null;
            txtBox = new TextBox();
            SetCommonProperties(txtBox);

            txtBox.Text = this._Value.ToString();
            if (!this.Visible) txtBox.Attributes.Add("style", "display:none");
            ControlValueSetup();
        }
        void AddCaptionToSearch()
        {
            //if (_CaptionVisible)
            //{
            Label lblCaption = null;
            lblCaption = new Label();
            lblCaption.Text = _Caption;
            lblCaption.CssClass = CaptionCssClass;
            lblCaption.EnableViewState = false;
            PlaceControlInContainer(lblCaption, _ContainerTable, _CaptionContainerRow, _CaptionContainerCol);

            //}

        }
        void AddComboBoxValuesToSearch()
        {
            DropDownList DDL = new DropDownList();
            SetCommonProperties(DDL);
            try
            {
                StringReader sr = new StringReader(_ListValues);
                DataSet myDS = new DataSet("ComboValues");
                myDS.ReadXml(sr);
                DDL.DataSource = myDS.Tables[0];
            }
            catch (Exception ex) { throw new UnableToCreateUIControlException("Error occured while reading combobox values", ex); }


            DDL.DataTextField = "Text";
            DDL.DataValueField = "Value";
            DDL.DataBind();
            DDL.Items.Insert(0, new ListItem(COMBONONSELECTEDTEXT, COMBONONSELECTEDVALUE));
            ControlValueSetup();
        }
        void AddLookUpComboBoxToSearch()
        {
            DataTable tblLookup;
            DropDownList DDL = new DropDownList();
            SetCommonProperties(DDL);

            if (_LookupQuery == null || _LookupQuery == "") throw new UnableToCreateUIControlException(string.Format("Lookup query is required for dropdwonlists(Lookup Combos)\t\nField Name:{0}", _ID));

            if (_QueryParameter != null)
            {
                if (_QueryParameter.StartsWith(":@"))
                    if (_QueryParameter == ":@LoggedInUserId")
                        _LookupQuery = _LookupQuery.Replace(":@LoggedInUserId", CUtilityWeb.GetCurrentUserId());
                    else if (_QueryParameter == ":@CurrentYear")
                        _LookupQuery = _LookupQuery.Replace(":@CurrentYear", DateTime.Today.Year.ToString());

            }
            try
            {
                using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
                {
                    tblLookup = CUtilityWeb.getDataTable(_LookupQuery, sqlConnection);
                }
            }
            catch (Exception ex) { throw new UnableToCreateUIControlException(string.Format("Error occured while executing lookup query \t\n{0} \t\n Field Name:{1}", _LookupQuery, _ID), ex); }
            DDL.DataSource = tblLookup;
            DDL.DataTextField = tblLookup.Columns[0].ColumnName;
            DDL.DataValueField = tblLookup.Columns.Count == 1 ? tblLookup.Columns[0].ColumnName : tblLookup.Columns[1].ColumnName;

            DDL.DataBind();
            DDL.Items.Insert(0, new ListItem(COMBONONSELECTEDTEXT, COMBONONSELECTEDVALUE));
            if (_Value.ToString().Trim() != "")
            {
                ListItem LI = DDL.Items.FindByText(_Value.ToString().Trim());
                if (LI != null) LI.Selected = true;

            }
            //add for fusion charts - added by India team
            //else
            //{
            //    ListItem LI = DDL.Items.FindByText(DDL.Items[1].Value.Trim());
            //    if (LI != null)
            //    {
            //        LI.Selected = true;
            //    }
            //}
            ControlValueSetup();
        }
        void AddCaseCadeComboBoxToSearch()
        {
            DataTable tblLookup;
            DropDownList DDL = new DropDownList();
            DDL.EnableViewState = true;
            SetCommonProperties(DDL);
            //  if (_Page.IsPostBack) return;
            if (_LookupQuery == null || _LookupQuery == "")
                throw new UnableToCreateUIControlException("Lookup query is required for dropdwonlists(Lookup Combos)");

            if (_QueryParameter != null)
            {
                if (_QueryParameter.StartsWith(":@"))
                    if (_QueryParameter == ":@LoggedInUserId")
                        _LookupQuery = _LookupQuery.Replace(":@LoggedInUserId", CUtilityWeb.GetCurrentUserId());//_Page.Session["EmailID"].ToString()

            }


            if (_CasecadParentID == "")
            {


                try
                {
                    using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
                    {
                        tblLookup = CUtilityWeb.getDataTable(_LookupQuery, sqlConnection);
                    }
                }
                catch (Exception ex) { throw new UnableToCreateUIControlException("Error occured while executing lookup query", ex); }

                DDL.DataSource = tblLookup;
                DDL.DataTextField = tblLookup.Columns[0].ColumnName;
                //     DDL.DataValueField = tblLookup.Columns[1].ColumnName;
                DDL.DataValueField = tblLookup.Columns.Count == 1 ? tblLookup.Columns[0].ColumnName : tblLookup.Columns[1].ColumnName;
                DDL.DataBind();
                DDL.Items.Insert(0, new ListItem(COMBONONSELECTEDTEXT, COMBONONSELECTEDVALUE));

                if (!_Page.IsPostBack && _Value.ToString().Trim() != "")
                {
                    if (_ValueType == FieldValueType.Text)
                    {
                        ListItem LI = DDL.Items.FindByText(_Value.ToString().Trim());
                        if (LI != null) LI.Selected = true;
                    }
                    else
                    {
                        ListItem LI = DDL.Items.FindByValue(_Value.ToString().Trim());
                        if (LI != null) LI.Selected = true;
                    }
                }
            }

            if (_CasecadChildID != "")
            {
                if (_SearchPanel.ServerRequestType == WidgetServerRequestType.WebServiceCall)
                {
                    DDL.AutoPostBack = false;
                    DDL.Attributes.Add("onchange", "javascript:return OnClientSelectedIndexChanged('" + DDL.ClientID + "')");
                }
                else
                {
                    DDL.AutoPostBack = true;
                    DDL.TextChanged += (CaseCadeComobBox_TextChanged);
                }

                if (_CasecadParentID != "") DDL.Items.Insert(0, new ListItem(COMBONONSELECTEDTEXT, COMBONONSELECTEDVALUE));

            }
            else
            {
                DDL.TextChanged += (CaseCadeChildComobBox_TextChanged);

                DDL.Items.Insert(0, new ListItem(COMBONONSELECTEDTEXT, COMBONONSELECTEDVALUE));

            }
            //   DDL.EnableViewState = true;
            ControlValueSetup();
        }
        protected void CaseCadeChildComobBox_TextChanged(object sender, EventArgs e)
        {
            DropDownList CurrentDLL = (DropDownList)_FieldControl;
            //-----------------state load bug fix ---------------------//
            if (CurrentDLL.Items.Count == 1)
            {

                string SSQL;
                DropDownList ParentDDL = (DropDownList)_SearchPanel.SearchFields[_CasecadParentID].FieldControl;
                string ParentValue = "";
                if (_ValueType == FieldValueType.Text)
                {
                    ParentValue = ParentDDL.SelectedItem.Text;
                }
                else
                {
                    ParentValue = ParentDDL.SelectedItem.Value;
                }
                if (_DataType == FieldDataType.Varchar || _DataType == FieldDataType.DateTime)
                {
                    SSQL = _LookupQuery.Replace("::" + _CasecadParentID + "::", ParentValue);
                }
                else
                {
                    SSQL = _LookupQuery.Replace("::" + _CasecadParentID + "::", "\'" + ParentValue + "\'");
                }
                LoadCasecadQuery(SSQL);
                ListItem FoundLI;
                ListItem CurSelectedItem = CurrentDLL.SelectedItem;
                string ValueToSet = _Page.Request.Form[CurrentDLL.ID];
                switch (_ValueType)
                {
                    case FieldValueType.Value:
                        FoundLI = CurrentDLL.Items.FindByValue(ValueToSet);
                        if (FoundLI != null)
                        {
                            FoundLI.Selected = true;
                            CurSelectedItem.Selected = false;
                        }

                        break;
                    case FieldValueType.Text:
                        FoundLI = CurrentDLL.Items.FindByText(ValueToSet);
                        if (FoundLI != null)
                        {
                            FoundLI.Selected = true;
                            CurSelectedItem.Selected = false;
                        }
                        break;
                    default:
                        break;
                }
                // return;
            }
            //-----------------state loading bug fix ---------------------//
        }
        protected void CaseCadeComobBox_TextChanged(object sender, EventArgs e)
        {
            DropDownList CurrentDLL = (DropDownList)_FieldControl;
            //-----------------state load bug fix ---------------------//
            if (CurrentDLL.Items.Count == 1)
            {

                string SSQL;
                DropDownList ParentDDL = (DropDownList)_SearchPanel.SearchFields[_CasecadParentID].FieldControl;
                string ParentValue = "";
                if (_ValueType == FieldValueType.Text)
                {
                    ParentValue = ParentDDL.SelectedItem.Text;
                }
                else
                {
                    ParentValue = ParentDDL.SelectedItem.Value;
                }
                if (_DataType == FieldDataType.Varchar || _DataType == FieldDataType.DateTime)
                {
                    SSQL = _LookupQuery.Replace("::" + _CasecadParentID + "::", ParentValue);
                }
                else
                {
                    SSQL = _LookupQuery.Replace("::" + _CasecadParentID + "::", "\'" + ParentValue + "\'");
                }
                LoadCasecadQuery(SSQL);
                ListItem FoundLI;
                ListItem CurSelectedItem = CurrentDLL.SelectedItem;
                string ValueToSet = _Page.Request.Form[CurrentDLL.ID];
                switch (_ValueType)
                {
                    case FieldValueType.Value:
                        FoundLI = CurrentDLL.Items.FindByValue(ValueToSet);
                        if (FoundLI != null)
                        {
                            FoundLI.Selected = true;
                            CurSelectedItem.Selected = false;
                        }

                        break;
                    case FieldValueType.Text:
                        FoundLI = CurrentDLL.Items.FindByText(ValueToSet);
                        if (FoundLI != null)
                        {
                            FoundLI.Selected = true;
                            CurSelectedItem.Selected = false;
                        }
                        break;
                    default:
                        break;
                }
                return;
            }
            //-----------------state loading bug fix ---------------------//

            SearchField ChildSF = null;
            if (_CasecadChildID != "")
            {
                ChildSF = _SearchPanel.SearchFields[_CasecadChildID];
                if (ChildSF == null)
                    throw new UIControlNotFoundException("Child casecade field not found!");
                else
                {
                    if (_ValueType == FieldValueType.Text)
                    {
                        ChildSF.ParentComboChange(CurrentDLL.SelectedItem.Text);
                    }
                    else
                    {
                        ChildSF.ParentComboChange(CurrentDLL.SelectedItem.Value);
                    }
                }
            }
            //------------------------Start: Upgraded Code ---------------------//

            //////DropDownList CurrentDLL = ((DropDownList)sender);
            //////SearchField ChildSF = null;
            //////if (_CasecadChildID != "")
            //////{
            //////    ChildSF = _SearchPanel.SearchFields[_CasecadChildID];
            //////    if (ChildSF == null)
            //////        throw new UIControlNotFoundException("Child casecade field not found!");
            //////    else
            //////    {
            //////        DataTable tblLookup;
            //////        if (ChildSF.LookupQuery == null || ChildSF.LookupQuery == "") throw new UnableToCreateUIControlException("Lookup query is required for dropdwonlists(Lookup Combos)");
            //////        try
            //////        {
            //////            string SSQL = ChildSF.LookupQuery.Replace("::" + _ID + "::", CurrentDLL.SelectedValue.ToString());
            //////            tblLookup = CUtilityWeb.getDataTable(SSQL, CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB));
            //////        }
            //////        catch (Exception ex) { throw new UnableToCreateUIControlException("Error occured while executing lookup query", ex); }
            //////        DropDownList DDL = (DropDownList)ChildSF.FieldControl;
            //////        DDL.DataSource = tblLookup;
            //////        DDL.DataTextField = tblLookup.Columns[0].ColumnName;
            //////        DDL.DataValueField = tblLookup.Columns.Count == 1 ? tblLookup.Columns[0].ColumnName : tblLookup.Columns[1].ColumnName;
            //////        DDL.DataBind();
            //////        DDL.Items.Insert(0, new ListItem(COMBONONSELECTEDTEXT, COMBONONSELECTEDVALUE));
            //////    }
            //////}

            //------------------------End: Upgraded Code ---------------------//
        }

        public void ParentComboChange(string ParentValue)
        {
            string SSQL;
            if (DataType == FieldDataType.Varchar || DataType == FieldDataType.DateTime)
            {
                SSQL = _LookupQuery.Replace("::" + _CasecadParentID + "::", ParentValue);
            }
            else
            {
                SSQL = _LookupQuery.Replace("::" + _CasecadParentID + "::", "\'" + ParentValue + "\'");
            }
            LoadCasecadQuery(SSQL);
            //------------------------Notify Child About The Change------------------------//
            DropDownList CurrentDLL = (DropDownList)_FieldControl;
            SearchField ChildSF = null;
            if (_CasecadChildID != "")
            {
                ChildSF = _SearchPanel.SearchFields[_CasecadChildID];
                if (ChildSF == null)
                    throw new UIControlNotFoundException("Child casecade field not found!");
                else
                {
                    if (_ValueType == FieldValueType.Text)
                    {
                        ChildSF.ParentComboChange(CurrentDLL.SelectedItem.Text);
                    }
                    else
                    {
                        ChildSF.ParentComboChange(CurrentDLL.SelectedItem.Value);
                    }


                }
            }

        }
        void LoadCasecadQuery(string SSQL)
        {
            DataTable tblLookup;
            try
            {
                using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
                {
                    tblLookup = CUtilityWeb.getDataTable(SSQL, sqlConnection);
                }
            }
            catch (Exception ex)
            {
                throw new UnableToCreateUIControlException(string.Format(@"
            Error occured while executing lookup query
            ------------------------SQL Statement--------------------------------
            [{0}]
            ---------------------------------------------------------------------
            Field ID: {1}", SSQL, _ID), ex);
            }

            DropDownList DDL = (DropDownList)_FieldControl;
            DDL.DataSource = tblLookup;
            DDL.DataTextField = tblLookup.Columns[0].ColumnName;
            DDL.DataValueField = tblLookup.Columns.Count == 1 ? tblLookup.Columns[0].ColumnName : tblLookup.Columns[1].ColumnName;
            DDL.DataBind();
            DDL.Items.Insert(0, new ListItem(COMBONONSELECTEDTEXT, COMBONONSELECTEDVALUE));

        }
        void AddDateControlToSearch()
        {
            EO.Web.DatePicker dtPicker = new EO.Web.DatePicker();
            //  dtPicker.SelectedDayStyle = "dd/mm/yyyy";
            dtPicker.PickerFormat = "dd/MM/yyyy";
            dtPicker.PopupExpandDirection = EO.Web.ExpandDirection.Top;
            dtPicker.PopupExpandEffect.Type = EO.Web.EffectType.CheckerBoardUp;
            dtPicker.PopupCollapseEffect.Type = EO.Web.EffectType.CheckerBoardDown;
            SetCommonProperties(dtPicker);
            if (_Skin.Trim() == "")
            {
                //Load Default skin for datepicker control
                //EO.Web.DatePicker.LoadCalendarSkin("~/skins/Defalut.EO.Calendar.ascx", "DatePickeSkinID0");
                //Skins.Add("~/skins/Defalut.EO.Calendar.ascx".ToLower(), "DatePickeSkinID0");
                dtPicker.ControlSkinID = "DatePickeSkinID0";
            }
            else
            {
                if (_SearchPanel.Skins.ContainsKey(_Skin.ToLower()))
                {
                    dtPicker.ControlSkinID = _SearchPanel.Skins[_Skin.ToLower()];
                }
                else
                {

                    _Skin = _Skin.ToLower();
                    EO.Web.DatePicker.LoadCalendarSkin(_Skin, "DatePickeSkinID" + _SearchPanel.Skins.Count);
                    dtPicker.ControlSkinID = "DatePickeSkinID" + _SearchPanel.Skins.Count;
                    _SearchPanel.Skins.Add(_Skin.ToLower(), "DatePickeSkinID" + _SearchPanel.Skins.Count);
                }
            }
            ControlValueSetup();

        }
        void ControlValueSetup()
        {
            NameValueCollection QueryString = _Page.Request.QueryString;
            string ValueInQueryString = QueryString[_ID] != null ? QueryString[_ID].Replace("::amp", "&") : null;

            if (!_Page.IsPostBack && ValueInQueryString != null)
            {
                if (_IsCrossPage)
                {
                    _Value = ValueInQueryString;
                    setControlValue();
                    SaveControlValueToSession();
                }
                else
                {
                    _Value = ValueInQueryString;

                    setControlValue();
                }
            }
            else if (!_Page.IsPostBack && ValueInQueryString == null)
            {
                if (_IsCrossPage && IsControlValueSavedToSession()) LoadControlValueFromSession();
                else
                {
                    setControlValue();
                }

            }

            else if (!_Page.IsPostBack && ValueInQueryString == null)
            {
                if (_IsCrossPage && IsControlValueSavedToSession()) LoadControlValueFromSession();
                else
                {
                    setControlValue();
                }

            }
            else if (_Page.IsPostBack && ValueInQueryString == null)
            {
                if (_IsCrossPage && IsControlValueSavedToSession()) LoadControlValueFromSession();
                else
                {
                    setControlValue();
                }

            }

        }
        void SaveControlValueToSession()
        {
            Hashtable objHT;
            object SavedCollection = _Page.Session[this._ChartGroupID];
            if (SavedCollection == null)
            {
                objHT = new Hashtable();
                objHT.Add(_ID, _Value);
                _Page.Session.Add(_ChartGroupID, objHT);
            }
            else
            {
                objHT = (Hashtable)SavedCollection;
                if (objHT.Contains(_ID))
                {
                    objHT.Remove(_ID);
                }
                objHT.Add(_ID, _Value);

            }

        }
        void LoadControlValueFromSession()
        {
            Hashtable objHT;
            object SavedCollection = _Page.Session[this._ChartGroupID];
            if (SavedCollection != null)
            {
                objHT = (Hashtable)SavedCollection;
                if (objHT.Contains(_ID))
                {
                    _Value = objHT[_ID];
                }
            }
            setControlValue();

        }
        bool IsControlValueSavedToSession()
        {
            Hashtable objHT;
            object SavedCollection = _Page.Session[this._ChartGroupID];
            if (SavedCollection == null) return false;
            else objHT = (Hashtable)SavedCollection;
            if (objHT.Contains(_ID))
            {
                return true;
            }
            else return false;

        }
        void setControlValue()
        {
            /////Added By india team
            string Value = _Value.ToString();
            if (Value == "" || Value == null || Value.StartsWith(":@"))
            {
                if (HttpContext.Current.Session["SearchPanelvalues"] != null)
                {
                    Hashtable MyValuesHT = new Hashtable();
                    MyValuesHT = (Hashtable)HttpContext.Current.Session["SearchPanelvalues"];
                    if (MyValuesHT != null)
                    {
                        if (MyValuesHT.ContainsKey(_FieldControl.ID.Substring(_FieldControl.ID.IndexOf("_") + 1)))
                        {
                            Value = Convert.ToString(MyValuesHT[_FieldControl.ID.Substring(_FieldControl.ID.IndexOf("_") + 1)]);
                        }
                    }
                }
            }/////Added By india team
            switch (this._UIControlType)
            {
                case ControlType.TextBox:
                    TextBox txtbox = (TextBox)_FieldControl;
                    if (Value.StartsWith(":@"))
                        Value = Value == ":@LoggedInUserId" ? CUtilityWeb.GetCurrentUserId() : Value;

                    txtbox.Text = Value;

                    break;
                case ControlType.ComboBox:
                case ControlType.ComboBoxValues:
                case ControlType.LookUpComboBox:
                case ControlType.LookUpComboBoxCascade:
                    if (Value.StartsWith(":@"))
                        Value = Value == ":@CurrentYear" ? DateTime.Now.Year.ToString() :
                                Value == ":@CurrentMonth" ? DateTime.Now.Month.ToString("00") :
                                Value == ":@CurrentDay" ? DateTime.Now.Day.ToString() : Value;

                    SetDDLValue(Value);
                    break;
                case ControlType.DateControl:
                    EO.Web.DatePicker dtPicker = (EO.Web.DatePicker)FieldControl;
                    string[] DateInitValue = Value.ToLower().Trim().Split(new char[] { ',' });
                    DateTime InitDate = new DateTime();
                    string DateValue, Count = "", FormatType = "";

                    DateValue = DateInitValue[0];
                    Count = DateInitValue.Length > 1 ? DateInitValue[1] : "";
                    FormatType = DateInitValue.Length > 1 ? DateInitValue[2] : "";
                    InitDate = DateValue == ":@today" ? DateTime.Now.Date :
                                DateValue == ":@firstdayofmonth" ? DateTime.Now.Date.AddDays(-1 * DateTime.Now.Date.AddDays(-1.0).Day) :
                                DateValue == ":@firstdayofyear" ? new DateTime(DateTime.Now.Date.Year, 1, 1) : //DateTime.Now.Date.DayOfYear :
                                DateValue == ":@lastdayofmonth" ? DateTime.Now.Date.AddMonths(1).AddDays(-(DateTime.Now.Date.Day)) :
                                DateValue == ":@lastdayofyear" ? new DateTime(DateTime.Now.Date.Year, 12, 1) :
                                DateTime.TryParse(Value, out InitDate) ? InitDate : InitDate;


                    if (InitDate.Year != 1 && DateInitValue.Length > 1)
                    {
                        dtPicker.SelectedDate = CalculatedDate(InitDate, DateInitValue);
                    }
                    else if (InitDate.Year != 1)
                    {
                        dtPicker.SelectedDate = InitDate;
                    }


                    break;
                case ControlType.CheckBoxList:
                    break;
                case ControlType.OptionButtonList:
                    break;
                default:
                    break;
            }

        }
        DateTime CalculatedDate(DateTime InitDate, string[] DateFormat)
        {
            switch (DateFormat[2])
            {
                case "d":
                    return InitDate.AddDays(Convert.ToDouble(DateFormat[1]));

                    break;
                case "m":
                    return InitDate.AddMonths(Convert.ToInt32(DateFormat[1]));

                    break;
                case "y":
                    return InitDate.AddYears(Convert.ToInt32(DateFormat[1]));

                    break;
                default:
                    return InitDate;
            }
        }
        void SetDDLValue(string ValueToSet)
        {
            string SSQL, ParentValue;
            ParentValue = _Page.Request.QueryString[_CasecadParentID] != null ? _Page.Request.QueryString[_CasecadParentID].Replace("::amp", "&") : null;
            //* Add by India Team 
            if (ParentValue == null)
            {
                Hashtable MyValuesHT = new Hashtable();
                MyValuesHT = (Hashtable)HttpContext.Current.Session["SearchPanelvalues"];
                if (MyValuesHT != null)
                {
                    if (MyValuesHT.ContainsKey(_CasecadParentID.Substring(_CasecadParentID.IndexOf("_") + 1)))
                    {
                        ParentValue = Convert.ToString(MyValuesHT[_CasecadParentID.Substring(_CasecadParentID.IndexOf("_") + 1)]);
                    }
                }
                else
                {
                    ParentValue = _ParentValue;
                }
            }
            //***//
            if (ParentValue != null)
            {
                if (_CasecadParentID != "")
                {
                    if (DataType == FieldDataType.Varchar || DataType == FieldDataType.DateTime)
                    {
                        SSQL = _LookupQuery.Replace("::" + _CasecadParentID + "::", ParentValue);
                    }
                    else
                    {
                        SSQL = _LookupQuery.Replace("::" + _CasecadParentID + "::", "\'" + ParentValue + "\'");
                    }
                    LoadCasecadQuery(SSQL);
                }
            }
            DropDownList DDL = (DropDownList)FieldControl;
            ListItem FoundLI;
            switch (_ValueType)
            {
                case FieldValueType.Value:
                    FoundLI = DDL.Items.FindByValue(ValueToSet);
                    if (FoundLI != null)
                    {
                        DDL.SelectedIndex = -1;
                        FoundLI.Selected = true;
                    }
                    else
                    {
                        DDL.SelectedIndex = -1;
                        FoundLI = DDL.Items.FindByText(ValueToSet);
                        if (FoundLI != null) FoundLI.Selected = true;
                    }

                    break;
                case FieldValueType.Text:

                    FoundLI = DDL.Items.FindByText(ValueToSet);
                    if (FoundLI != null)
                    {
                        DDL.SelectedIndex = -1;
                        FoundLI.Selected = true;
                    }
                    else
                    {
                        DDL.SelectedIndex = -1;
                        FoundLI = DDL.Items.FindByValue(ValueToSet);
                        if (FoundLI != null) FoundLI.Selected = true;

                    }
                    break;
                default:
                    break;
            }
        }

        void SetCommonProperties(WebControl Ctrl)
        {
            Ctrl.ID = SearchFieldControlID;
            // Ctrl.Visible = this._Visible;
            Ctrl.CssClass = this._CssClass;
            Ctrl.Width = _Width;
            // Ctrl.EnableViewState = false;
            PlaceControlInContainer(Ctrl, _ContainerTable, _ContainerRow, _ContainerCol);
            _FieldControl = Ctrl;
            Ctrl.Init += new EventHandler(Ctrl_Init);
            Ctrl.Load += new EventHandler(Ctrl_Load);
        }
        protected void Ctrl_Init(object sender, EventArgs e)
        {

        }
        protected void Ctrl_Load(object sender, EventArgs e)
        {

        }
        void PlaceControlInContainer(Control Ctrl, Table table, int RowIndex, int ColIndex)
        {
            //if (_Visible == false) return;
            //if(_ContainerTable.Rows[ 
            if (table.Rows.Count <= RowIndex)
            {
                for (int iRow = table.Rows.Count; iRow <= RowIndex; iRow++)
                {
                    TableRow TR = new TableRow();
                    for (int iCol = 0; iCol <= ColIndex; iCol++)
                    {
                        TableCell TC = new TableCell();
                        TR.Cells.Add(TC);

                    }
                    table.Rows.Add(TR);
                }
            }
            else
            {
                TableRow TR = table.Rows[RowIndex];
                if (TR.Cells.Count <= ColIndex)
                {
                    for (int iCol = 0; iCol <= ColIndex; iCol++)
                    {
                        TableCell TC = new TableCell();
                        TR.Cells.Add(TC);
                    }
                }
                // table.Rows.Add(TR);
            }
            if (_Visible == false)
                table.Rows[RowIndex].Attributes.Add("style", "display:none");
            table.Rows[RowIndex].Cells[ColIndex].Controls.Add(Ctrl);
            table.Rows[RowIndex].Cells[ColIndex].Attributes.Add("style", "PADDING-LEFT: 6px;	PADDING-RIGHT: 10px;");
        }
        //Newly Added code for DashBoard Dynamic date parameters.
        public string[] DateParamvalues(string[] paramValues)
        {
            for (int i = 0; i < paramValues.Length; i++)
            {
                if (paramValues[i].StartsWith(":@"))
                {
                    DateTime InitDate = new DateTime();
                    string DateValue = "", Count = "", FormatType = "";
                    string[] DateInitValue = paramValues[i].ToLower().Trim().Split(new char[] { '$' });
                    DateValue = DateInitValue[0].ToString().ToLower();
                    Count = DateInitValue.Length > 1 ? DateInitValue[1] : "";
                    FormatType = DateInitValue.Length > 1 ? DateInitValue[2] : "";
                    InitDate = DateValue == ":@today" ? DateTime.Now.Date :
                                DateValue == ":@firstdayofmonth" ? DateTime.Now.Date.AddDays(-1 * DateTime.Now.Date.AddDays(-1.0).Day) :
                                DateValue == ":@firstdayofyear" ? new DateTime(DateTime.Now.Date.Year, 1, 1) : //DateTime.Now.Date.DayOfYear :
                                DateValue == ":@lastdayofmonth" ? DateTime.Now.Date.AddMonths(1).AddDays(-(DateTime.Now.Date.Day)) :
                                DateValue == ":@lastdayofyear" ? new DateTime(DateTime.Now.Date.Year, 12, 1) :
                                DateTime.TryParse(DateValue, out InitDate) ? InitDate : InitDate;

                    DateTime dtdatetime = new DateTime();
                    if (InitDate.Year != 1 && DateInitValue.Length > 1)
                    {
                        dtdatetime = CalculatedDate(InitDate, DateInitValue);
                    }
                    else if (InitDate.Year != 1)
                    {
                        dtdatetime = InitDate;
                    }
                    paramValues[i] = dtdatetime.ToString();
                }
            }
            return paramValues;
        }
    }

    public interface IField
    {
        string DBColName { get; }
        string DBTableName { get; }
        string ID { get; }
        //    object IntialValue { get; }
        bool IsRequired { get; }
        long MaxLen { get; }
        long MaxValue { get; }
        long MinLen { get; }
        long MinValue { get; }
        string RegularExpression { get; }
        object Value { get; }
        FieldDataType DataType { get; }
        KeyValuePair<string, IField> DependingUponFields { get; set; }

        void SetLengthRange(long MinLen, long MaxLen);
        void SetNumericRange(long MinValue, long MaxValue);
        bool IsFieldValid();
    }
    public class Field : IField
    {

        protected string _ID = null, _DBColName = null, _DBTableName = "", _RegularExpression = null;
        protected bool _IsRequired = false, _IsNumericallyRanged = false, _IsByLengthRanged = false;
        protected long _MaxValue;
        protected long _MinValue;
        protected long _MinLen, _MaxLen;
        protected object _Value = "", _IntialValue;
        protected KeyValuePair<string, IField> _DependingUponFields;
        protected FieldDataType _DataType;

        public KeyValuePair<string, IField> DependingUponFields
        {
            get { return _DependingUponFields; }
            set { _DependingUponFields = value; }
        }
        public string ID
        {
            get { return _ID; }

        }
        public string DBColName
        {
            get { return _DBColName; }

        }

        public string DBTableName
        {
            get { return _DBTableName; }

        }
        public bool IsRequired
        {
            get { return _IsRequired; }

        }
        public long MaxValue
        {
            get { return MaxValue; }

        }
        public long MinValue
        {
            get { return _MinValue; }

        }
        public long MaxLen
        {
            get { return _MaxLen; }

        }
        public long MinLen
        {
            get { return _MinLen; }

        }
        public string RegularExpression
        {
            get { return _RegularExpression; }

        }
        public object Value
        {
            get { return _Value; }

        }
        public FieldDataType DataType
        {
            get { return _DataType; }
        }



        public Field()
        {
        }
        public Field(string ID, string DBColName, object IntialValue, bool IsRequired)
        {
            ;
        }
        public Field(string ID, string DBColName, object IntialValue, bool IsRequired, string RegularExpression)
        {
            ;
        }

        public bool IsFieldValid()
        {
            return true;
        }
        public void SetNumericRange(long MinValue, long MaxValue)
        {
        }
        public void SetLengthRange(long MinLen, long MaxLen)
        {
        }
    }
}
