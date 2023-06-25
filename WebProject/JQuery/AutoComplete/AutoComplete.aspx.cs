using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Text;
using WebProject.ReportsEngine;

namespace WebProject.JQuery.AutoComplete
{


    public partial class AutoComplete : System.Web.UI.Page
    {
        public class AutoCompleteParams : SimplePropertyMapper
        {
            public AutoCompleteParams(string GirdId, string ColumnId)
            {
                LoadClassFields(GirdId, ColumnId, "RPTChartEngineObjecProperty", " and propertyName in('DataConnectionString','__AutoCompleteQuery ','__AutoCompleteConnString') ");
            }
            protected string _DataConnectionString = null;
            protected string ___AutoCompleteQuery = null;
            protected string ___AutoCompleteConnString = null;

            public string DataConnectionString { get { return ___AutoCompleteConnString == null ? _DataConnectionString : ___AutoCompleteConnString; } }
            public string AutoCompleteQuery { get { return ___AutoCompleteQuery; } }

        }


        protected void Page_Load(object sender, EventArgs e)
        {
            //System.Threading.Thread.Sleep(2000);
            string q = Request.QueryString["q"],
                    GridId = Request.QueryString["GridId"],
                    ColumnId = Request.QueryString["ColumnId"];
            StringBuilder snResult = new StringBuilder(1024);

            if (q != null)
            {

                if (GridId != null && ColumnId != null)
                {
                    try
                    {
                        AutoCompleteParams ACParams = new AutoCompleteParams(GridId, ColumnId);

                        DataTable dtAutoComplete;
                        using (SqlConnection sqlConnection = ACParams.DataConnectionString != null ? new SqlConnection(ACParams.DataConnectionString) : CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
                        {
                            dtAutoComplete = CUtilityWeb.getDataTable(ACParams.AutoCompleteQuery.Replace("::q::", q), sqlConnection);
                        }

                        foreach (DataRow objRow in dtAutoComplete.Rows)
                        {
                            snResult.Append(objRow[0].ToString());// + ", " + objRow["TeamName"].ToString());
                            snResult.Append(Environment.NewLine);
                        }
                        Response.Clear();
                        Response.ContentType = "text";
                        Response.Write(snResult.ToString().TrimEnd('\n'));
                        Response.End();
                    }
                    catch (System.Threading.ThreadAbortException ex)
                    {
                    }
                    catch (Exception ex)
                    {

                        // System.Diagnostics.Debug.Write(ex.Source + "\t\n" + ex.Message + "\t\n" + ex.StackTrace);
                        snResult.AppendFormat("Unable to fetch autocomplete list!");
                        Response.Clear();
                        Response.ContentType = "text";
                        Response.Write(snResult.ToString().TrimEnd('\n'));
                        Response.End();
                    }

                }

            }

        }
    }
}