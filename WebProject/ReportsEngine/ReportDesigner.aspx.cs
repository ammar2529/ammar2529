using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.OleDb;
using System.Text;

namespace WebProject.ReportsEngine
{
    public partial class ReportDesigner : System.Web.UI.Page
    {
        enum QueryType
        {
            InsertQuery = 0,
            UpdateQuery = 1
        }
        //Dictionary<string, string> FieldProperties = new Dictionary<string, string>();
        //Dictionary<string, string> FieldLookupProperties = new Dictionary<string, string>();
        //Dictionary<string, string> FieldCasecadProperties = new Dictionary<string, string>();
        //Dictionary<string, string> FieldDatePickerProperties = new Dictionary<string, string>();
        List<string> FieldProperties = new List<string>();
        List<string> FieldLookupProperties = new List<string>();
        List<string> FieldLOVProperties = new List<string>();

        List<string> FieldCasecadProperties = new List<string>();
        List<string> FieldDatePickerProperties = new List<string>();

        protected void Page_Load(object sender, EventArgs e)
        {

            InitFieldDictionaries();
            ddlFields.Attributes.Add("onchange", @"UpdateColID(this)");

        }
        protected void gvReport_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //  return;
            string SSQL = "";
            int RowNo = Convert.ToInt32(e.CommandArgument);
            GridView GV = (GridView)sender;

            switch (e.CommandName)
            {
                case "EditReport":
                    SSQL = string.Format(@"
SELECT RPTChartEngineReport.*
FROM RPTChartEngineReport
WHERE (((RPTChartEngineReport.ReportID)='{0}'))

", GV.Rows[RowNo].Cells[0].Text);
                    ClearControls(pnlReport);
                    LoadProperties("txt", GetDataTable(SSQL));
                    ClearControls(pnlGridHolder);
                    if (txtGridID.Text.Trim() != "")
                    {
                        ClearControls(pnlGridHolder);
                        SSQL = string.Format(@"
SELECT     *
FROM         RPTChartEngineObjecProperty
WHERE     (ObjectID = '{0}') AND (ObjectParentID = '{0}') ", txtGridID.Text)
                            ;
                        LoadProperties("txtgrdh", GetDataTable(SSQL));
                        txtgrdGridID.Text = txtGridID.Text;
                        SSQL = string.Format(@"

", txtGridID.Text);
                        // gvGridColumns.DataBind();
                    }
                    break;
                default:
                    break;
            }
        }
        void LoadProperties(string ControlPrefix, DataTable PropertyTable)
        {
            string PropertyName, PropertyValue;
            TextBox tb;

            foreach (DataRow dr in PropertyTable.Rows)
            {
                PropertyName = ControlPrefix + dr["PropertyName"].ToString();
                PropertyValue = dr["PropertyValue"].ToString();
                tb = (TextBox)FindControl(PropertyName);
                if (tb != null)
                {
                    tb.Text = PropertyValue;
                }

            }

        }
        void ClearControls(Control Container)
        {
            foreach (Control ctrl in Container.Controls)
            {
                if (ctrl.GetType().Name == "TextBox")
                {
                    TextBox tb = (TextBox)ctrl;
                    tb.Text = "";
                }
            }
        }
        DataTable GetDataTable(string SSQL)
        {
            //   OleDbConnection SQLConn = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=""C:\Documents and Settings\mh.ali\Desktop\Temp-Prod-Data.mdb""");
            //   DataSet dsFrom = new DataSet();
            //   OleDbCommand  cmd = SQLConn.CreateCommand();
            //   cmd.Connection = SQLConn;
            ////   cmd.Transaction = transaction;
            //   cmd.CommandText = SSQL;

            //   OleDbDataAdapter daFrom = new OleDbDataAdapter(cmd);
            //   daFrom.Fill(dsFrom, "tTable");
            //   SQLConn.Close();
            //   SQLConn = null;
            return CUtilityWeb.getDataTable(SSQL, CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB));

        }

        protected void gvField_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string SSQL = "";
            int RowNo = Convert.ToInt32(e.CommandArgument);
            GridView GV = (GridView)sender;

            switch (e.CommandName)
            {
                case "EditField":
                    SSQL = string.Format(@"
SELECT     FieldProperty AS PropertyName, PropertyValue, FieldID, SearchPanelID
FROM         RPTChartEngineFieldProperty
WHERE     (FieldID = '{0}') AND (SearchPanelID = '{1}')

", GV.Rows[RowNo].Cells[0].Text, GV.Rows[RowNo].Cells[1].Text);
                    lblfldFieldID.Text = GV.Rows[RowNo].Cells[0].Text;
                    lblfldSearchPanelID.Text = GV.Rows[RowNo].Cells[1].Text;
                    ClearControls(pnlField);
                    LoadProperties("txtfld", GetDataTable(SSQL));

                    break;
                default:
                    break;
            }
        }
        void InitFieldDictionaries()
        {
            //------------- Properties Common In All Fields-----------------------------//
            FieldProperties.Add("Caption");
            FieldProperties.Add("CaptionContainerCol");
            FieldProperties.Add("CaptionContainerRow");
            FieldProperties.Add("CaptionCssClass");
            FieldProperties.Add("CaptionVisible");

            FieldProperties.Add("ContainerCol");
            FieldProperties.Add("ContainerRow");

            FieldProperties.Add("UIControlType");
            FieldProperties.Add("ID");
            FieldProperties.Add("DBColName");
            FieldProperties.Add("DataType");
            FieldProperties.Add("CssClass");

            FieldProperties.Add("Visible");
            FieldProperties.Add("Enabled");
            FieldProperties.Add("ReadOnly");

            FieldProperties.Add("Value");
            FieldProperties.Add("EmptyValue");
            FieldProperties.Add("WhenEmptyValue");

            FieldProperties.Add("IsCrossPage");
            FieldProperties.Add("ChartGroupID");

            FieldProperties.Add("MaxValue");
            FieldProperties.Add("MinValue");

            FieldProperties.Add("MaxLen");
            FieldProperties.Add("MinLen");

            FieldProperties.Add("IsRequired");
            FieldProperties.Add("CriteriaIncluded");
            FieldProperties.Add("Operator");
            FieldProperties.Add("RegularExpression");
            FieldProperties.Add("RelationOperatorType");

            //------------- Properties for LOV Fields-----------------------------//

            FieldLOVProperties.Add("ListValues");
            FieldLOVProperties.Add("ValueType");

            //------------- Properties for Lookup Fields-----------------------------//

            FieldLookupProperties.Add("LookupQuery");
            FieldLookupProperties.Add("ValueType");

            //------------- Properties for casecade Fields-----------------------------//

            FieldCasecadProperties.Add("LookupQuery");
            FieldCasecadProperties.Add("ValueType");
            FieldCasecadProperties.Add("CasecadParentID");
            FieldCasecadProperties.Add("CasecadChildID");

            //------------- Properties for Date Fields-----------------------------//

            FieldDatePickerProperties.Add("Skin");

        }

        protected void gvGridColumns_SelectedIndexChanged(object sender, EventArgs e)
        {
            //return;
            //sdsGridColumns.datasour
            string SSQL = "";
            //       int RowNo = Convert.ToInt32(e.NewSelectedIndex);
            GridView GV = (GridView)sender;
            int RowNo = Convert.ToInt32(GV.SelectedIndex);


            //switch (e.CommandName)
            //{
            //    case "EditField":
            SSQL = string.Format(@"
SELECT     ObjectParentID, ObjectID, PropertyName, PropertyValue
FROM         RPTChartEngineObjecProperty
WHERE     (ObjectParentID = '{0}') AND (ObjectID = '{1}')

", GV.Rows[RowNo].Cells[0].Text, GV.Rows[RowNo].Cells[1].Text);


            ClearControls(pnlGridColumnTemplate);
            txtggctGridID.Text = GV.Rows[RowNo].Cells[0].Text;
            txtggctColumnID.Text = GV.Rows[RowNo].Cells[1].Text;

            LoadProperties("txtgct", GetDataTable(SSQL));
            if (txtgctColumnType.Text.Trim() == "")
            {
                txtgctColumnType.Text = "0";
            }
            if (txtgctColumnHeading.Text.Trim() == "") txtgctColumnHeading.Text = txtggctColumnID.Text.Replace("GCT", "");
            if (txtgctTextBindingColumn.Text.Trim() == "") txtgctTextBindingColumn.Text = txtgctColumnHeading.Text;
            // txtgctgColumnID.Text =

            //        break;
            //    default:
            //        break;
            //} 
        }
        protected void gvReport_SelectedIndexChanged(object sender, EventArgs e)
        {

            string SSQL = "";
            ClearControls(pnlReport);
            ClearControls(pnlGridHolder);
            ClearControls(pnlField);
            ClearControls(pnlGridColumn);
            ClearControls(pnlNew);
            ClearControls(pnlNewGridColumn);
            txtNewFieldID.Text = "";
            lblfldFieldID.Text = "";
            lblfldSearchPanelID.Text = "";
            //ClearControls(pnl

            GridView GV = (GridView)sender;
            int RowNo = GV.SelectedIndex;
            //switch (e.CommandName)
            //{
            //    case "EditReport":
            SSQL = string.Format(@"
SELECT RPTChartEngineReport.*
FROM RPTChartEngineReport
WHERE (((RPTChartEngineReport.ReportID)='{0}'))

", GV.Rows[RowNo].Cells[0].Text);

            LoadProperties("txt", GetDataTable(SSQL));

            txtNewReportID.Text = "";
            if (txtGridID.Text.Trim() != "")
            {
                // ClearControls(pnlGridHolder);

                SSQL = string.Format(@"
SELECT     *
FROM         RPTChartEngineObjecProperty
WHERE     (ObjectID = '{0}') AND (ObjectParentID = '{0}') ", txtGridID.Text)
                    ;
                LoadProperties("txtgrdh", GetDataTable(SSQL));
                txtgrdGridID.Text = txtGridID.Text;
                SSQL = string.Format(@"

", txtGridID.Text);
                // gvGridColumns.DataBind();
            }
            //        break;
            //    default:
            //        break;
            //}
        }
        protected void btnNewReport_Click(object sender, EventArgs e)
        {
            gvReport.SelectedIndex = -1;
            ClearControls(pnlReport);
            ClearControls(pnlGridHolder);
            txtGridID.Text = "grd" + txtNewReportID.Text;
            txtChartID.Text = "gph" + txtNewReportID.Text;
            txtSearchPanelID.Text = txtNewReportID.Text;
            txtGroupHeading.Text = CUtilityWeb.BreakCamelCase(txtNewReportID.Text);
            txtHeading.Text = txtGroupHeading.Text;
            txtgrdGridID.Text = "grd" + txtNewReportID.Text;
            txtgrdhSQLCommandType.Text = "0";
            txtgrdhSQLCommand.Text = string.Format("RPT_{0}_SP", txtNewReportID.Text);

            //lblNewReportID.Visible = true;
            //txtNewReportID.Visible = true;

        }
        protected void btnUpdateReport_Click(object sender, EventArgs e)
        {
            SaveReport();


        }
        void SaveReport()
        {
            string CTRLPrefix = "txt";
            StringBuilder ReportScript = new StringBuilder();
            string SingleScript = "", ReportID = "";

            ReportScript.Append("declare @PropertyValue varchar(4000)");

            if (txtNewReportID.Text.Trim() != "")
            {
                //  SaveObjectProperties();
                ReportID = txtNewReportID.Text.Trim();
            }
            else
            {
                ReportID = gvReport.Rows[gvReport.SelectedIndex].Cells[0].Text; // txtNewReportID.Text.Trim();

            }
            ReportScript.Append(string.Format(@"
if not exists(SELECT SearchPanelID FROM RPTChartEngineSearchPanel WHERE (SearchPanelID = '{0}')) 
BEGIN
    INSERT INTO RPTChartEngineSearchPanel
                          (SearchPanelID, ContainerTableID, SearchButtonID)
    VALUES     ('{0}','tblSearchPanel','btnSearch')
END
", ReportID));
            foreach (Control ctrl in pnlReport.Controls)
            {
                if (ctrl.GetType().Name == "TextBox")
                {

                    TextBox tb = (TextBox)ctrl;
                    if (tb.ID.Contains(CTRLPrefix))
                    {
                        string PropertyName = "", PropertyValue = "";
                        PropertyName = tb.ID.Replace(CTRLPrefix, "");
                        PropertyValue = tb.Text.Trim().Replace("'", "''");

                        SingleScript = string.Format(@"
set @PropertyValue ='{2}'
if  not exists(SELECT ReportID FROM RPTChartEngineReport WHERE (ReportID= '{0}' and PropertyName = '{1}' ) ) and @PropertyValue <> ''
begin
    print 'Inserting'
	INSERT INTO RPTChartEngineReport (ReportID, PropertyName, PropertyValue) VALUES ('{0}','{1}','{2}')
end
else
begin
	

	if(@PropertyValue='')
	begin
    print 'Deleting'
		Delete from RPTChartEngineReport WHERE(ReportID='{0}' and PropertyName = '{1}')
	end
	else
	begin
        print 'Updating'
		UPDATE RPTChartEngineReport SET PropertyValue = '{2}' WHERE(ReportID='{0}' and PropertyName = '{1}')
	end
end

", ReportID, PropertyName, PropertyValue);
                        ReportScript.Append(SingleScript);
                        //if (chkCreateGraph.Checked && txtChartID.Text.Trim() != "")
                        //{

                        //}
                        //if (chkCreateGrid.Checked && txtGridID.Text.Trim() != "")
                        //{
                        //}



                    }
                }
            }
            CUtilityWeb.ExecScript(ReportScript.ToString(), CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB));
            gvReport.DataBind();
        }
        //    string  SaveProperties(Panel Contrainer,string CTRLPrefix, QueryType SaveType,string TableName ,string FixKeysWithValue,string PropertyPathName,string PropertyPathValue)
        //    {
        //        string QueryTemplateInsert="", QueryTemplateUpdate="";
        //        string[] arrKeys= FixKeysWithValue.Split('|');
        //        string Keys = "", Values = "",KeysUpdate="";
        //        string PropertyNameCol="", PropertyValueCol="";
        //        StringBuilder SQLScript;
        //        string SingleQueryScript = "";

        //        PropertyPathValue = PropertyPathValue.Trim();
        //        PropertyPathValue = PropertyPathValue != "" ? "'" + PropertyPathValue + "'" : PropertyPathValue;
        //      //  QueryType.
        //        //if (SaveType = QueryType.InsertQuery)
        //        //{

        //            for (int iLoop=0; iLoop < arrKeys.Length; iLoop+=2)
        //            {
        //                Keys += arrKeys[iLoop ] + ",";
        //                Values += "'" + arrKeys[iLoop + 1] +"',";

        //            }
        //            //Keys = Keys.TrimEnd(new char[] { ',' });
        //            //Values = Values.TrimEnd(new char[] { ',' });


        //        //}
        //        //else
        //        //{
        //            for (int iLoop=0; iLoop < arrKeys.Length; iLoop += 2)
        //            {
        //                //Keys += arrKeys[1] + ",";
        //                //Values += "'" + arrKeys[iLoop + 1] + "',";
        //                KeysUpdate += arrKeys[iLoop] + "='" + arrKeys[iLoop + 1] + "',";
        //            }

        //        //}

        //        foreach (Control ctrl in Container.Controls)
        //        {

        //            //QueryTemplateInsert = string.Format(@"Inser into {0} ({1}{3}{5}) values({2}'{4}',{6}) ", 
        //            //    TableName,       Keys, Values, PropertyNameCol, PropertyValueCol, PropertyPathName, PropertyPathValue);
        //            //QueryTemplateUpdate = string.Format(@"UPDATE {0} SET {1} {2}='{3}', {4}={5}",
        //            //    TableName, KeysUpdate, PropertyNameCol, PropertyValueCol, PropertyPathName, PropertyPathValue);

        //            if (ctrl.GetType().Name == "TextBox")
        //            {

        //                TextBox tb = (TextBox)ctrl;
        //                if (tb.ID.Contains(CTRLPrefix))
        //                {
        //                    string PropertyName="",PropertyValue="";
        //                    PropertyName = tb.ID.Replace(CTRLPrefix,"");
        //                    PropertyValue = tb.Text ;

        //                    QueryTemplateInsert = string.Format(@"Insert into {0} ({1}{3}{5}) values({2}'{4}',{6}) ",
        //                        TableName, Keys, Values, PropertyNameCol,PropertyName, PropertyValueCol,PropertyValue );
        //                    QueryTemplateUpdate = string.Format(@"UPDATE {0} SET {1} {2}='{3}', {4}={5}",
        //                        TableName, KeysUpdate, PropertyNameCol,PropertyName, PropertyValueCol,PropertyValue);
        //                    SingleQueryScript = @"
        //if Exist(select count(*) from {0} where {1}) 
        //";
        //                }
        //            }


        //        }
        //    }
        protected void btnNewFieldTextBox_Click(object sender, EventArgs e)
        {
            SetupNewField(ControlType.TextBox);
        }
        void SetupNewField(ControlType UIControlType)
        {
            ClearControls(pnlField);
            lblfldFieldID.Text = "";
            lblfldSearchPanelID.Text = "";

            int lblCaptionRowNo = 1, UIControlRowNo = 2;
            //if(gvField.Rows.Count!=0)
            //{
            lblCaptionRowNo = (((gvField.Rows.Count + 1) * 2) - 1);
            UIControlRowNo = (gvField.Rows.Count + 1) * 2;
            // }
            txtfldUIControlType.Text = getEnumConstant(UIControlType.GetType(), UIControlType.ToString()).ToString();

            lblfldSearchPanelID.Text = txtSearchPanelID.Text;
            txtfldCaption.Text = CUtilityWeb.BreakCamelCase(txtNewFieldID.Text);
            txtfldCaptionContainerCol.Text = "1";
            txtfldCaptionContainerRow.Text = lblCaptionRowNo.ToString();
            txtfldCaptionCssClass.Text = "PWCLabel";
            txtfldCaptionVisible.Text = "true";

            txtfldContainerCol.Text = "1";
            txtfldContainerRow.Text = UIControlRowNo.ToString();
            txtfldDBColName.Text = txtNewFieldID.Text;
            txtfldID.Text = lblfldFieldID.Text = txtNewFieldID.Text;
            switch (UIControlType)
            {
                case ControlType.TextBox:
                    txtfldCssClass.Text = "PWCTextBox";
                    break;
                case ControlType.ComboBox:
                case ControlType.ComboBoxValues:
                case ControlType.LookUpComboBox:
                case ControlType.LookUpComboBoxCascade:
                    txtfldCssClass.Text = "PWCDropDownList";
                    break;
                case ControlType.DateControl:

                    txtfldSkin.Text = "~/skins/WindowsStyle.EO.Calendar.ascx";

                    break;
                case ControlType.CheckBoxList:
                    break;
                case ControlType.OptionButtonList:
                    break;
                default:
                    break;
            }
            txtfldEnabled.Text = "true";
            txtfldReadOnly.Text = "true";
            txtfldVisible.Text = "true";
            txtfldIsCrossPage.Text = "true";


        }
        int getEnumConstant(Type EnumType, string EnumValue)
        {
            Array EnumArray = Enum.GetValues(EnumType);

            int iLoop;// EnumArray.Length;
            for (iLoop = 0; iLoop < EnumArray.Length; iLoop++)
            {
                if (EnumArray.GetValue(iLoop).ToString() == EnumValue)
                {

                    break;
                }
            }
            return iLoop;
        }

        protected void btnNewLookUpCombo_Click(object sender, EventArgs e)
        {
            SetupNewField(ControlType.LookUpComboBox);
        }
        protected void btnNewCaseCade_Click(object sender, EventArgs e)
        {
            SetupNewField(ControlType.LookUpComboBoxCascade);
        }
        protected void btnNewLOV_Click(object sender, EventArgs e)
        {
            SetupNewField(ControlType.ComboBoxValues);
        }
        protected void btnDate_Click(object sender, EventArgs e)
        {
            SetupNewField(ControlType.DateControl);
        }
        protected void btnSaveField_Click(object sender, EventArgs e)
        {
            SaveField();

        }
        void SaveField()
        {
            string CTRLPrefix = "txtfld";
            StringBuilder FieldScript = new StringBuilder();
            string SingleScript = "", FieldID = "", SearchPanelID = "";
            FieldScript.Append("declare @PropertyValue varchar(4000)");

            SearchPanelID = txtSearchPanelID.Text.Trim();
            FieldID = lblfldFieldID.Text.Trim();
            if (SearchPanelID == "" || FieldID == "") return;


            FieldScript.Append(string.Format(@"
IF NOT Exists(SELECT FieldID, SearchPanelID FROM RPTChartEngineSearchField WHERE (FieldID = '{0}') AND (SearchPanelID = '{1}'))
BEGIN
    INSERT INTO RPTChartEngineSearchField (FieldID, SearchPanelID) VALUES('{0}', '{1}')
END
", FieldID, SearchPanelID));

            foreach (Control ctrl in pnlField.Controls)
            {
                if (ctrl.GetType().Name == "TextBox")
                {

                    TextBox tb = (TextBox)ctrl;
                    if (tb.ID.Contains(CTRLPrefix))
                    {
                        string PropertyName = "", PropertyValue = "";
                        PropertyName = tb.ID.Replace(CTRLPrefix, "").Trim();
                        PropertyValue = tb.Text.Trim().Replace("'", "''");

                        SingleScript = string.Format(@"
set @PropertyValue ='{3}'
if  not exists(SELECT FieldProperty FROM RPTChartEngineFieldProperty WHERE (FieldProperty = '{0}') AND (FieldID = '{1}') AND (SearchPanelID = '{2}')) and @PropertyValue <> ''
begin
    print 'Inserting - {0}'
INSERT INTO RPTChartEngineFieldProperty (FieldProperty, FieldID, SearchPanelID, PropertyValue) VALUES  ('{0}', '{1}', '{2}', '{3}')
end
else
begin
	

	if(@PropertyValue='')
	begin
    print 'Deleting - {0}'
		Delete from RPTChartEngineFieldProperty WHERE (FieldProperty = '{0}') AND (FieldID = '{1}') AND (SearchPanelID = '{2}')
	end
	else
	begin
        print 'Updating - {0}'
		UPDATE RPTChartEngineFieldProperty SET PropertyValue = '{3}' WHERE (FieldProperty = '{0}') AND (FieldID = '{1}') AND (SearchPanelID = '{2}')
	end
end

", PropertyName, FieldID, SearchPanelID, PropertyValue);
                        FieldScript.Append(SingleScript);



                    }
                }
            }
            CUtilityWeb.ExecScript(FieldScript.ToString(), CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB));
            gvField.DataBind();
        }


        protected void btnSaveGridHolder_Click(object sender, EventArgs e)
        {
            string CTRLPrefix = "txtgrdh";
            StringBuilder GridScript = new StringBuilder();
            string SingleScript = "", ObjectID = "";

            ObjectID = txtgrdGridID.Text;

            GridScript.Append("declare @PropertyValue varchar(4000)");
            foreach (Control ctrl in pnlGridHolder.Controls)
            {
                if (ctrl.GetType().Name == "TextBox")
                {
                    TextBox tb = (TextBox)ctrl;
                    if (tb.ID.Contains(CTRLPrefix))
                    {
                        string PropertyName = "", PropertyValue = "";
                        PropertyName = tb.ID.Replace(CTRLPrefix, "");
                        PropertyValue = tb.Text.Trim().Replace("'", "''");

                        SingleScript = string.Format(@"
set @PropertyValue ='{2}'
if  not exists(SELECT ObjectParentID FROM RPTChartEngineObjecProperty WHERE (ObjectParentID = '{0}') AND (ObjectID = '{0}') AND (PropertyName='{1}' )) and @PropertyValue <> ''
begin
    print 'Inserting'
	INSERT INTO RPTChartEngineObjecProperty (ObjectParentID, ObjectID, PropertyName, PropertyValue, PropertyPath) VALUES ('{0}', '{0}', '{1}', '{2}', '')
end
else
begin
	if(@PropertyValue='')
	begin
    print 'Deleting'
		Delete from RPTChartEngineObjecProperty WHERE (ObjectParentID = '{0}') AND (ObjectID = '{0}') AND (PropertyName='{1}' )
	end
	else
	begin
        print 'Updating'
		UPDATE RPTChartEngineObjecProperty SET PropertyValue = '{2}' WHERE ( ObjectParentID = '{0}' AND ObjectID = '{0}'  and PropertyName = '{1}' ) 
	end
end

", ObjectID, PropertyName, PropertyValue);
                        GridScript.Append(SingleScript);
                        //if (chkCreateGraph.Checked && txtChartID.Text.Trim() != "")
                        //{

                        //}
                        //if (chkCreateGrid.Checked && txtGridID.Text.Trim() != "")
                        //{
                        //}
                        // gvReport.DataBind();


                    }
                }
            }
            CUtilityWeb.ExecScript(GridScript.ToString(), CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB));

        }
        protected void btnFetchFields_Click(object sender, EventArgs e)
        {
            StoredProcInvoker SPI;
            txtgrdhSQLCommand.Text = txtgrdhSQLCommand.Text.Trim();
            if (txtgrdhSQLCommand.Text == "")
            {
                return;
            }
            ddlFields.Items.Clear();
            if (txtgrdhDataConnectionString.Text.Trim() == "")
            {
                SPI = new StoredProcInvoker(txtgrdhSQLCommand.Text);
            }
            else
            {
                SPI = new StoredProcInvoker(txtgrdhSQLCommand.Text, txtgrdhDataConnectionString.Text.Trim());

            }
            //SPI.ResultTable.Columns
            if (SPI.ResultTable == null)
            {
                ddlFields.Items.Add(new ListItem("Error occured while executing stored procedure!", "-1"));
                return;
            }
            ddlFields.Items.Add(new ListItem("----- Select Column -----", "-1"));

            foreach (DataColumn DTC in SPI.ResultTable.Columns)
            {
                ddlFields.Items.Add(new ListItem("GCT" + DTC.ColumnName, DTC.ColumnName));
            }
            //ddlFields.DataSource = SPI.ResultTable.Columns;


        }
        protected void gvGridColumns_DataBound(object sender, EventArgs e)
        {
            GridView gvcols = (GridView)sender;
            txtNewGridOrderID.Text = (gvcols.Rows.Count + 1).ToString();
        }
        protected void btnSaveGridColumn_Click(object sender, EventArgs e)
        {
            string SSQL = @"
if not exists(SELECT GridID FROM RPTChartEngineGridTemplateColumns WHERE (GridID = '{0}') AND (ColumnID = '{1}'))
INSERT INTO RPTChartEngineGridTemplateColumns (GridID, ColumnID, OrderID) VALUES ('{0}', '{1}', {2})
";
            SSQL = string.Format(SSQL, txtGridID.Text.Trim(), txtNewGridColID.Text, txtNewGridOrderID.Text);
            CUtilityWeb.ExecScript(SSQL, CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB));
            gvGridColumns.DataBind();
        }
        protected void btnSaveColumnTemplate_Click(object sender, EventArgs e)
        {
            string CTRLPrefix = "txtgct";
            StringBuilder ColTemlateScript = new StringBuilder();
            string SingleScript = "", GridID = "", ColumnID = "";
            ColTemlateScript.Append("declare @PropertyValue varchar(4000)");

            GridID = txtggctGridID.Text.Trim();
            ColumnID = txtggctColumnID.Text.Trim();
            if (GridID == "" || ColumnID == "") return;

            foreach (Control ctrl in pnlGridColumnTemplate.Controls)
            {
                if (ctrl.GetType().Name == "TextBox")
                {

                    TextBox tb = (TextBox)ctrl;
                    if (tb.ID.Contains(CTRLPrefix))
                    {
                        string PropertyName = "", PropertyValue = "";
                        PropertyName = tb.ID.Replace(CTRLPrefix, "").Trim();
                        PropertyValue = tb.Text.Trim().Replace("'", "''");

                        SingleScript = string.Format(@"
set @PropertyValue ='{3}'
if  not exists(SELECT ObjectParentID FROM RPTChartEngineObjecProperty WHERE (ObjectParentID = '{0}') AND (ObjectID = '{1}') AND (PropertyName = '{2}')) and @PropertyValue <> ''
begin
    print 'Inserting - {0}'
INSERT INTO RPTChartEngineObjecProperty (ObjectParentID, ObjectID, PropertyName,  PropertyValue,PropertyPath) VALUES ('{0}', '{1}', '{2}', '{3}', '')
end
else
begin
	

	if(@PropertyValue='')
	begin
    print 'Deleting - {0}'
		Delete from RPTChartEngineObjecProperty WHERE  (ObjectParentID = '{0}') AND (ObjectID = '{1}') AND (PropertyName = '{2}')
	end
	else
	begin
        print 'Updating - {0}'
		UPDATE RPTChartEngineObjecProperty SET PropertyValue = '{3}' WHERE  (ObjectParentID = '{0}') AND (ObjectID = '{1}') AND (PropertyName = '{2}')
	end
end

", GridID, ColumnID, PropertyName, PropertyValue);
                        ColTemlateScript.Append(SingleScript);



                    }
                }
            }
            CUtilityWeb.ExecScript(ColTemlateScript.ToString(), CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB));

        }
        protected void gvGridColumns_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            // e.NewValues 
        }
        protected void gvGridColumns_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            e.Cancel = true;
            gvGridColumns.EditIndex = -1;

            string OldColumnID, NewColumnID, SQLUpdateColTemplate = "", SQLUpdateColProperty = "";
            SqlTransaction transaction;
            SqlConnection conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB);
            transaction = conn.BeginTransaction();
            OldColumnID = e.OldValues["ColumnID"].ToString();
            NewColumnID = e.NewValues["ColumnID"].ToString();


            SQLUpdateColTemplate = string.Format(@"
UPDATE    RPTChartEngineGridTemplateColumns
SET               ColumnID ='{0}', Visible ={1}, OrderID ={2}
where GridID='{4}'  and   ColumnID ='{3}'
", NewColumnID, (e.NewValues["Visible"].ToString() == "True" ? 1 : 0), e.NewValues["OrderID"].ToString()
     , OldColumnID, e.OldValues["GridID"].ToString());
            if (OldColumnID != NewColumnID)
            {
                SQLUpdateColProperty = string.Format(@"
UPDATE    RPTChartEngineObjecProperty
SET      ObjectID = '{0}'
WHERE     (ObjectParentID = '{1}') AND (ObjectID = '{2}') 
", NewColumnID, e.OldValues["GridID"].ToString(), OldColumnID);
            }
            try
            {
                CUtilityWeb.ExecScript(SQLUpdateColTemplate, conn, transaction);
                CUtilityWeb.ExecScript(SQLUpdateColProperty, conn, transaction);
                transaction.Commit();

            }
            catch (Exception ex)
            {
                transaction.Rollback();

            }
            finally
            {
                conn.Close();
                transaction.Dispose();
                transaction = null;
            }

        }
    }
}