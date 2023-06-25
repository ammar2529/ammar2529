using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Reflection;
using System.Drawing;

namespace WebProject.ReportsEngine.ReportWidgetControls
{
    public partial class HTMLLabelWidget : SimplePropertyMapperUCLabel, ILayoutLabelWidget, IReportWidget // System.Web.UI.UserControl
    {
        string _WidgetMargin = "", _LabelWidgetText = "<strong>No Text Specified For this Lable</strong>",
        _WidgetPadding = "", _WidgetId = "", _NextReportId = "", _ContainerId = "";
        int _RowNo = 0, _ColNo = 0;

        public HTMLLabelWidget()
            : base()
        {
        }
        public HTMLLabelWidget(string WidgetId, string ContainerId, int RowNo, int ColNo)
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
            ltlWidgetLabel.Text = _LabelWidgetText;
            //  _ContainerTables.Add(_WidgetId, tblPanelBody);
        }
        private void InitializeControl()
        {

        }

        //public string WidgetId { get { return _WidgetId; } set {_WidgetId=value  ;} }
        protected void Page_Init(object sender, EventArgs e)
        {

        }
        protected void Page_Load(object sender, EventArgs e)
        {
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
                    string[] arrStyleNameValue = StyleNameValue.Split(',');

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

        //public IndexedDictionary<string, System.Web.UI.HtmlControls.HtmlTable> ContainerTables
        //{
        //    get 
        //    {
        //        return _ContainerTables;
        //    }
        //}

        //public IndexedDictionary<string, Panel> ContainerPanels
        //{
        //    get 
        //    {
        //        return _ContainerPanels;
        //    }
        //}
        public string WidgetId { get { return _WidgetId; } }
        #endregion
    }

    public class SimplePropertyMapperUCLabel : System.Web.UI.UserControl
    {
        public SimplePropertyMapperUCLabel()
            : base()
        {
        }
        protected void LoadClassFields(string ObjectParentID, string ObjectID, string PropertyTable)
        {
            LoadClassFields(ObjectParentID, ObjectID, PropertyTable, "");
        }
        protected void LoadClassFields(string ObjectParentID, string ObjectID, string PropertyTable, string ExtraConditions)
        {
            // string PropertyTable = "RPTChartEngineObjecProperty";
            string SQLProperties = string.Format(@"select  ObjectParentID, ObjectID, '_' + PropertyName AS PropertyName, PropertyPath, PropertyValue from {0} where objectparentid='{1}' and objectid='{2}' {3}
                                                 order by propertypath         ",
                                                                        PropertyTable, ObjectParentID, ObjectID, ExtraConditions);
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
                return Color.FromArgb(Convert.ToInt32(PropertyValue));
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
    }
}