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
using System.Collections.Specialized;
using System.Reflection;
using System.Xml;
using System.IO;
using System.Text;
using System.Data.SqlClient;
namespace WebProject.ReportsEngine
{


    public interface IQueryClient
    {
        SQLCommandType SQLCommandType { get; }
        string SQLCommand { get; set; }
    }
    /// <summary>
    /// Summary description for SearchPanel
    /// </summary>
    /// 
    public class SearchPanel
    {
        WidgetServerRequestType _ServerRequestType = WidgetServerRequestType.CallBack;
        public WidgetServerRequestType ServerRequestType
        {
            get
            {
                if (_page is IReportPortalSettings)
                {
                    return ((IReportPortalSettings)_page).SearchPanelRequestType;
                }
                else
                {
                    return _ServerRequestType;
                }
            }
        }

        public event EventHandler FieldsInitCompleted;
        private void RaisEvent(EventHandler EH)
        {
            foreach (EventHandler caster in EH.GetInvocationList())
            {
                System.ComponentModel.ISynchronizeInvoke SyncInvoker = caster.Target as System.ComponentModel.ISynchronizeInvoke;
                if (SyncInvoker != null) //if target impletments ISynchronizeInvoke
                {
                    SyncInvoker.Invoke(caster, new object[] { this, null });
                }
                else
                {
                    caster(this, null);
                }
            }
        }
        //  protected KeyValuePair<string, ISearchField> SearchFields= new KeyValuePair<string, ISearchField> ();
        public Dictionary<string, SearchField> SearchFields = new Dictionary<string, SearchField>();
        public Dictionary<string, string> Skins = new Dictionary<string, string>();
        StringBuilder sbSearchFieldsScript = new StringBuilder();
        //protected KeyValuePair<string, string> SearchFields = new KeyValuePair<string, ISearchField>();
        protected string _SearchButtonID = "", _SearchPanelID;

        public string SearchPanelID { get { return _SearchPanelID; } }
        private DataTable dtSearchPanelFields;
        private Page _page;

        protected Table _ContainerTable = null;
        public Table ContainerTable { get { return _ContainerTable; } }
        private string SearchPanelSQL = @"
SELECT     RPTChartEngineSearchPanel.SearchPanelID, LTRIM(RTRIM(RPTChartEngineSearchPanel.ContainerTableID)) AS ContainerTableID, 
                      LTRIM(RTRIM(RPTChartEngineSearchPanel.SearchButtonID)) AS SearchButtonID, LTRIM(RTRIM(RPTChartEngineFieldProperty.FieldID)) AS FieldID, 
                       '_' +LTRIM(RTRIM(RPTChartEngineFieldProperty.FieldProperty)) AS FieldProperty, 
                      LTRIM(RTRIM(RPTChartEngineFieldProperty.PropertyValue)) AS PropertyValue

FROM         RPTChartEngineFieldProperty INNER JOIN

                      RPTChartEngineSearchField ON RPTChartEngineFieldProperty.FieldID = RPTChartEngineSearchField.FieldID AND 
                      RPTChartEngineFieldProperty.SearchPanelID = RPTChartEngineSearchField.SearchPanelID INNER JOIN
                      RPTChartEngineSearchPanel ON RPTChartEngineSearchField.SearchPanelID = RPTChartEngineSearchPanel.SearchPanelID

WHERE     (RPTChartEngineSearchField.SearchPanelID = '{0}')
ORDER BY RPTChartEngineSearchField.OrderID,PTChartEngineFieldProperty.FieldID
";
        public SearchPanel(string SearchPanelID, Page page )
        {
            string ContainterTableID;
            _page = page;
            _SearchPanelID = SearchPanelID;

            //Load Default skin for datepicker control
            EO.Web.DatePicker.LoadCalendarSkin("~/skins/Defalut.EO.Calendar.ascx", "DatePickeSkinID0");
            Skins.Add("~/skins/Defalut.EO.Calendar.ascx".ToLower(), "DatePickeSkinID0");

            SearchPanelSQL = string.Format(SearchPanelSQL, SearchPanelID);
            try
            {
                using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
                {
                    dtSearchPanelFields = CUtilityWeb.getDataTable(SearchPanelSQL, sqlConnection);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error occured while fetching fields data from database.", ex);
            }
            if (dtSearchPanelFields.Rows.Count < 1) throw new NoFieldsDataFoundException(string.Format("No search fileds found in the database for the searpanel {0}!", SearchPanelID));
            ContainterTableID = dtSearchPanelFields.Rows[0]["ContainerTableID"].ToString();

            // _ContainerTable = (Table)_page.FindControl(ContainterTableID);
            _ContainerTable = (Table)CUtilityWeb.PageContentPlaceHolder(page).FindControl(ContainterTableID);
            if (dtSearchPanelFields.Rows.Count < 1) throw new UIControlNotFoundException(string.Format("Search panel table {0} not found!", ContainterTableID));
            _SearchButtonID = _SearchPanelID + "_" + dtSearchPanelFields.Rows[0]["SearchButtonID"].ToString();
            InitSearchFields(dtSearchPanelFields);
            RaisEvent(FieldsInitCompleted);
            AddSearchButton();
            //RegistarSearchPanelScript();
        }

        public SearchPanel(string SearchPanelID, Page page, string ContainerId, int RowNo, int ColNo)
        {
            string ContainterTableID;
            _page = page;
            _SearchPanelID = SearchPanelID;

            //Load Default skin for datepicker control
            EO.Web.DatePicker.LoadCalendarSkin("~/skins/Defalut.EO.Calendar.ascx", "DatePickeSkinID0");
            Skins.Add("~/skins/Defalut.EO.Calendar.ascx".ToLower(), "DatePickeSkinID0");

            SearchPanelSQL = string.Format(SearchPanelSQL, SearchPanelID);
            try
            {
                using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
                {
                    dtSearchPanelFields = CUtilityWeb.getDataTable(SearchPanelSQL, sqlConnection);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error occured while fetching fields data from database.", ex);
            }
            if (dtSearchPanelFields.Rows.Count < 1) throw new NoFieldsDataFoundException(string.Format("No search fileds found in the database for the searpanel {0}!", SearchPanelID));
            ContainterTableID = dtSearchPanelFields.Rows[0]["ContainerTableID"].ToString();
            //if SearchTable ID is provided then try to find the table
            //if (ContainterTableID.Trim() != "")
            //{
            //    _ContainerTable = (Table)_page.Master.FindControl("ContentPlaceHolder2").FindControl(ContainterTableID);
            //}
            ////if Search Table is not found then create one dynamically
            //if (_ContainerTable == null)
            //{
            //Search the SearchTable Container

            _ContainerTable = new Table();
            _ContainerTable.ID = "SearchTable_" + SearchPanelID;
            _SearchButtonID = _SearchPanelID + "_" + dtSearchPanelFields.Rows[0]["SearchButtonID"].ToString();

            if (ServerRequestType == WidgetServerRequestType.WebServiceCall)
            {
                Panel tPanel = new Panel();

                tPanel.Controls.Add(_ContainerTable);
                tPanel.Attributes.Add("class", "spPanel");
                tPanel.Style.Add("display", "none");
                tPanel.ID = _ContainerTable.ID + "_Panel";
                _ContainerTable.CssClass = "spTable";
                CUtilityWeb.PlaceControlInThePage(tPanel, _page, ContainerId, RowNo, ColNo);
            }
            else
            {
                CUtilityWeb.PlaceControlInThePage(_ContainerTable, _page, ContainterTableID, RowNo, ColNo);
            }
            InitSearchFields(dtSearchPanelFields);
            RaisEvent(FieldsInitCompleted);
            AddSearchButton();
            if (ServerRequestType == WidgetServerRequestType.WebServiceCall)
            {
                RegistarSearchPanelScript();
            }
        }

        public SearchPanel(string SearchPanelID, Page page, Table tblSearchPanel) : this(SearchPanelID, page)
        {
        }

        void RegistarSearchPanelScript()
        {
            if (!_page.ClientScript.IsStartupScriptRegistered("SearchPanelScript"))
            {


                ;


                _page.ClientScript.RegisterStartupScript(this.GetType(), "SearchPanelScript",

            string.Format
            (@"
		<script language=""javascript"" type=""text/javascript"">
		var strNextReportId='{0}';
		var QueryWidgetsDataWebService='{1}';
		</script>
		", _page.Request.QueryString["NextReportId"],
                (ConfigurationManager.AppSettings["QueryWidgetsDataWebService"] == null ?
                    "WebServices/QueryWidgetsData.asmx" : ConfigurationManager.AppSettings["QueryWidgetsDataWebService"]
                )
            )

    );
            }
            /*
             * 0 - SearchPanelId
             * 1 - SearchFieldsScript
             */
            string GeneratedScript = string.Format(@"
        <script language=""javascript"" type=""text/javascript"">


        var {0} = new SearchPanel('{0}');
        {1}
        objSearchPanels.addSearchPanel('{0}',{0});
        </script>", _SearchPanelID, sbSearchFieldsScript.ToString());
            _page.ClientScript.RegisterStartupScript(this.GetType(), "AddSearchPanleJS_" + _SearchPanelID, GeneratedScript);

        }
        void InitSearchFields(DataTable dtFields)
        {
            DataTable dtReportFieldProperties = null;
            string SQLReportFieldProperties = @"
SELECT     WidgetId, WidgetChildId, '_'+WidgetChildPropertyName as WidgetChildPropertyName, WidgetChildPropertyValue
FROM         RPTChartEngineReportObjectProperties
WHERE     (ReportId = '{0}') AND (WidgetId = '{1}')
";
            IReportPortalSettings ReportPortalSettings;
            if (_page is IReportPortalSettings)
            {
                ReportPortalSettings = ((IReportPortalSettings)_page);
                dtReportFieldProperties = CUtilityWeb.getDataTable(string.Format(SQLReportFieldProperties, ReportPortalSettings.NextReportId, _SearchPanelID), CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB));
            }

            int iRow = 0;
            SearchField searchfield = null;

            while (dtFields.Rows.Count > iRow)
            {
                searchfield = new SearchField(_page, this, _ContainerTable, _SearchButtonID);

                if (dtReportFieldProperties != null)
                {

                    iRow = searchfield.InitField(dtFields, iRow,
                        dtReportFieldProperties);
                }
                else
                {
                    iRow = searchfield.InitField(dtFields, iRow);

                }

                string CasecadChildID = searchfield.CasecadChildID;

                if (CasecadChildID != "")
                {
                    SearchField SF;
                    if (SearchFields.ContainsKey(CasecadChildID))
                    {
                        SF = SearchFields[CasecadChildID];
                        SearchFields.Remove(SF.ID);
                        SearchFields.Add(searchfield.ID, searchfield);
                        SearchFields.Add(SF.ID, SF);
                    }
                    else
                    {
                        SearchFields.Add(searchfield.ID, searchfield);
                    }
                }
                else
                {
                    SearchFields.Add(searchfield.ID, searchfield);
                }

                if (ServerRequestType == WidgetServerRequestType.WebServiceCall)
                {

                    AddFieldClientScript(searchfield);
                }
            }
            //if (searchfield != null)
            //{
            //   ;
            //}

        }
        void AddFieldClientScript(SearchField searchField)
        {
            /*
             * 0 - SearchPanelId
             * 1 - SearchFieldClientId
             * 2 - Search Field UI Control Type
             * 3 - Search Field UI Control Type ID
             * 4 - CasecadParentID
             * 5 - CasecadChildID
             * 6 - FieldValueType
             * 7 - EmptyValue
             * 8 - WhenEmptyValue
             */
            if (searchField.UIControlType == ControlType.DateControl)
            {
                sbSearchFieldsScript.Append(string.Format(@"
{0}.addField('{1}' ,eo_GetObject('{2}'),'{3}','{4}','{5}','{6}','{7}','{8}');
", _SearchPanelID, searchField.FieldControl.ID, searchField.FieldControl.ClientID, searchField.UIControlType.ToString(),
                     searchField.CasecadParentID.ToString(), searchField.CasecadChildID.ToString(), searchField.GetFieldValueType.ToString(),
                     searchField.EmptyValue, searchField.WhenEmptyValue));
            }
            else
            {
                sbSearchFieldsScript.Append(string.Format(@"
{0}.addField('{1}' ,$get('{2}'),'{3}','{4}','{5}','{6}','{7}','{8}');
", _SearchPanelID, searchField.FieldControl.ID, searchField.FieldControl.ClientID, searchField.UIControlType.ToString(),
          searchField.CasecadParentID.ToString(), searchField.CasecadChildID.ToString(), searchField.GetFieldValueType.ToString(),
          searchField.EmptyValue, searchField.WhenEmptyValue));
            }

        }
        void AddSearchButton()
        {
            Button btnSearch = new Button();
            btnSearch.ID = _SearchButtonID;
            btnSearch.Text = "Search";
            btnSearch.CssClass = "PWCButton";
            TableRow TR = new TableRow();
            TableCell TC1 = new TableCell();
            TableCell TC2 = new TableCell();
            TC2.Controls.Add(btnSearch);
            TC2.Attributes.Add("Style", "padding-left: 5px;");
            TR.Cells.Add(TC1);
            TR.Cells.Add(TC2);
            _ContainerTable.Rows.Add(TR);
            if (ServerRequestType == WidgetServerRequestType.WebServiceCall)
            {
                btnSearch.Attributes.Add("onclick", string.Format("objSearchPanels.updateSearchPanleWidgets('{0}');return false;", _SearchPanelID));
            }
        }
        void FillQueryParameters(string SSQL)
        {
            int ParamStartIndex = -1;
            int ParamEndIndex = -1;
            int LastIndex = 0;
            string ParamFieldID = "";
            string LastRaltionalOperator = "";
            StringBuilder SQLConditions = new StringBuilder(2048);
            while (true)
            {
                LastIndex = ParamStartIndex = SSQL.IndexOf("::", LastIndex);

                if (ParamStartIndex < 0) break;
                LastIndex = ParamEndIndex = SSQL.IndexOf("::", (LastIndex + 2));
                LastIndex += 2;
                ParamFieldID = SSQL.Substring(ParamStartIndex + 2, ParamEndIndex - ParamStartIndex - 2);

                if (!SearchFields.ContainsKey(ParamFieldID)) throw new NoFieldsDataFoundException("Query parameter not found!");

                if (SearchFields[ParamFieldID].DataType == FieldDataType.Varchar ||
                    SearchFields[ParamFieldID].DataType == FieldDataType.DateTime)
                    SSQL = SSQL.Replace("::" + ParamFieldID + "::", "'" + SearchFields[ParamFieldID].FieldValue + "'");
                else
                    SSQL = SSQL.Replace("::" + ParamFieldID + "::", SearchFields[ParamFieldID].FieldValue);

            }

            foreach (KeyValuePair<string, SearchField> KVP in SearchFields)
            {
                SearchField sf = KVP.Value;

                if (sf.CriteriaIncluded)
                {
                    if (SearchFields[ParamFieldID].DataType == FieldDataType.Varchar ||
                        SearchFields[ParamFieldID].DataType == FieldDataType.DateTime)
                        SQLConditions.Append(" " + sf.DBColName + sf.Operator.ToString() + "'" + sf.FieldValue + "'");
                    else
                        SQLConditions.Append(" " + sf.DBColName + sf.Operator.ToString() + sf.FieldValue);

                    //LastRaltionalOperator = sf.RelationOperatorType.ToString();

                }
            }
        }

        public T NumToEnum<T>(int number)
        {
            return (T)Enum.ToObject(typeof(T), number);
        }
        public string InsertParamValues(string ParamString)
        {
            // _SearchPanel = searchPanel;
            //-------------Setup Search Values-------------------//
            string NewParamString = ParamString;
            foreach (KeyValuePair<string, SearchField> KVP in SearchFields)
            {
                NewParamString = NewParamString.Replace("::" + KVP.Key + "::", KVP.Value.FieldValue);
            }
            return NewParamString;
        }
        public string InsertParamValues(string ParamString, bool URLEncoded)
        {
            // _SearchPanel = searchPanel;
            //-------------Setup Search Values-------------------//
            string NewParamString = ParamString;
            foreach (KeyValuePair<string, SearchField> KVP in SearchFields)
            {
                if (KVP.Value.DataType == FieldDataType.Varchar)
                {
                    //System.Text.Encoder ed = new System.Text.Encoder();
                    NewParamString = NewParamString.Replace("::" + KVP.Key + "::", KVP.Value.FieldValue.Replace("&", "::amp"));
                }
                else
                {
                    NewParamString = NewParamString.Replace("::" + KVP.Key + "::", KVP.Value.FieldValue);

                }
            }
            return NewParamString;
        }
        public string InsertParamValues(string ParamString, FieldValueType ValueType)
        {
            // _SearchPanel = searchPanel;
            //-------------Setup Search Values-------------------//
            string NewParamString = ParamString;
            foreach (KeyValuePair<string, SearchField> KVP in SearchFields)
            {
                if (ValueType == FieldValueType.Value)
                    NewParamString = NewParamString.Replace("::" + KVP.Key + "::", KVP.Value.FieldBehindValue);
                else
                    if (KVP.Value.FieldTextValue == "---- Select Value ----")
                {
                    NewParamString = NewParamString.Replace("::" + KVP.Key + "::", "All " + KVP.Value.Caption);

                }
                else
                {
                    NewParamString = NewParamString.Replace("::" + KVP.Key + "::", KVP.Value.FieldTextValue);
                }

            }
            return NewParamString;
        }

        void PlaceControlInTable(Control Ctrl, Table table, int RowIndex, int ColIndex)
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
            //if (_Visible == false)
            //    table.Rows[RowIndex].Attributes.Add("style", "display:none");
            table.Rows[RowIndex].Cells[ColIndex].Controls.Add(Ctrl);
            //table.Rows[RowIndex].Cells[ColIndex].Attributes.Add("style", "PADDING-LEFT: 6px;	PADDING-RIGHT: 10px;");
        }

        //public static IndexedDictionary<string, IQueryParameter> GetQueryParameters(string Params)
        //{
        //    IndexedDictionary<string, IQueryParameter> QueryParams = new IndexedDictionary<string, IQueryParameter>();
        //    string[] arrParams = Params.Split('|');
        //    for (int iLoop = 0; iLoop < arrParams.Length; iLoop += 2)
        //    {
        //        QueryParams.Add(arrParams[iLoop], new QueryParameter(arrParams[iLoop], arrParams[iLoop + 1]));
        //    }
        //    return QueryParams;
        //}
    }
}
