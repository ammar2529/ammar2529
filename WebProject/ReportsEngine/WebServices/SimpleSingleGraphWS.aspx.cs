using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Reflection;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Web.Script.Services;
using System.Web.Script.Serialization;
using System.Data;
using System.Data.SqlClient;
using System.Xml;
using System.IO;
using System.Text;

namespace WebProject.ReportsEngine.WebServices 
{
    public partial class SimpleSingleGraphWS : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string[] ReportDesignerServiceRequest(string ServiceActionId, string ServiceInfo)
        {
            try
            {
                switch (ServiceActionId)
                {
                    case "UpdateGridData":
                        return new string[] { "Ok", SaveGridData(ServiceInfo) };
                    //case "RenderWidgetDesigner":
                    //    return RenderWidgetDesigner(ServiceInfo);
                    default:
                        return new string[] { "Exception", "Service Action Id Not Found!" };

                }
            }
            catch (Exception e)
            {

                return new string[] { "Exception", ServiceActionId, ServiceInfo, e.Message + "\t\n" + e.StackTrace };
            }
        }
        public class GridParams : SimplePropertyMapper
        {
            public GridParams(string GirdId)
            {
                LoadClassFields(GirdId, GirdId, "RPTChartEngineObjecProperty", " and propertyName in('DataConnectionString','UpdateSP') ");
            }
            protected string _DataConnectionString = null;
            protected string _UpdateSP = null;
            public string DataConnectionString { get { return _DataConnectionString; } }
            public string UpdateSP { get { return _UpdateSP; } }

        }

        public static string SaveGridData(string ServiceInfo)
        {
            Dictionary<string, string> Params = SerivceParameters(ServiceInfo);
            string GridId = Params["GridId"];
            GridParams GridProps = new GridParams(GridId);
            if (GridProps.UpdateSP == null) throw new Exception("UpdateSP property not found ");

            StringReader sr = new StringReader(Params["DataToUpdate"].Replace("@EV", "null"));
            DataSet DataToSaveDS = new DataSet("DataToSave");
            DataToSaveDS.ReadXml(sr);

            string SPTemplate = GetSPTemplate(GridProps.UpdateSP);

            StringBuilder sbSaveRecs = new StringBuilder(1024);
            foreach (DataRow dr in DataToSaveDS.Tables[0].Rows)
            {
                string CurRow;
                CurRow = SPTemplate;
                foreach (DataColumn dc in DataToSaveDS.Tables[0].Columns)
                {
                    //dr[dc].ToString
                    CurRow = CurRow.Replace("::@" + dc.ColumnName + "::", dr[dc.ColumnName].ToString());
                }
                sbSaveRecs.Append(CurRow);
            }

            string ConnectionString = GridProps.DataConnectionString;

            using (SqlConnection sqlConnection = ConnectionString != null ? new SqlConnection(ConnectionString) : CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                //System.Diagnostics.Trace.WriteLine(sbSaveRecs.ToString());
                CUtilityWeb.ExecScript(sbSaveRecs.ToString().Replace(@"'null'", "null"), sqlConnection);
            }
            return "Data Saved";
        }
        private static Dictionary<string, string> SerivceParameters(string Paramets)
        {
            string[] arrParameters = Paramets.Split(new string[] { "||" }, StringSplitOptions.RemoveEmptyEntries);
            Dictionary<string, string> ParamDic = new Dictionary<string, string>();
            for (int iLoop = 0; iLoop < arrParameters.Length; iLoop++)
            {
                ParamDic.Add(arrParameters[iLoop], arrParameters[++iLoop]);

            }
            return ParamDic;
        }
        private static string GetSPTemplate(string SPName)
        {
            return GetSPTemplate(SPName, null);
        }

        private static string GetSPTemplate(string SPName, string ConnectionString)
        {
            if (SPName == null || SPName == "") { throw new Exception(string.Format(@"Stored '{0}' procedure not found ", SPName)); }
            //-----------------------------------------------------//
            SqlParameter[] arrSqlParams = new SqlParameter[1];

            arrSqlParams[0] = AddParameter("@procedure_name", SqlDbType.VarChar, 390, SPName, ParameterDirection.Input);
            DataTable dtProcParams;

            using (SqlConnection sqlConnection = ConnectionString != null ? new SqlConnection(ConnectionString) : CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                dtProcParams = CUtilityWeb.getDataTable("sp_sproc_columns", sqlConnection, arrSqlParams);
            }
            arrSqlParams = new SqlParameter[dtProcParams.Rows.Count - 1];
            int iRow = 0;
            string ProceExeTemplate = "exec " + SPName + " ";
            foreach (DataRow DR in dtProcParams.Rows)
            {
                if (iRow == 0) { iRow++; continue; } //skip first param

                string ParamName = DR["Column_Name"].ToString();
                if ("nvarcharncharsmalldatetime".Contains(DR["Type_Name"].ToString())) //if it's Alpha numeric or date type
                {
                    ProceExeTemplate += "'::" + DR["Column_Name"].ToString() + "::',";
                }
                else
                {
                    ProceExeTemplate += "::" + DR["Column_Name"].ToString() + "::,";
                }
            }

            return ProceExeTemplate.TrimEnd(new char[] { ',' }) + "\t\n";
        }

        public static SqlParameter AddParameter(string strParamName,
                                 SqlDbType strType,
                                 int nLen,
                                 object strParamValue,
                                 ParameterDirection Direction)
        {
            try
            {
                SqlParameter oAddParameter;
                oAddParameter = new SqlParameter(strParamName, strType, nLen);
                oAddParameter.Direction = Direction;
                oAddParameter.Value = strParamValue;
                return oAddParameter;
            }
            catch (Exception errError)
            {
                throw errError;
            }
        }
    }
}