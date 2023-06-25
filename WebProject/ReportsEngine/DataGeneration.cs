using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Collections.Generic;
using System.Text;
using InfoSoftGlobal;
namespace WebProject.ReportsEngine
{
    public class DataGeneration
    {

        public static string GetDataChart1(string strStateName)
        {
            //Initialize database objects
            //string query;
            ////Variable to store XML Data
            ////You can either use string concatenation or XML Object to build XML.
            //StringBuilder xmlData = new StringBuilder();
            ////To store categories
            //StringBuilder categories = new StringBuilder();
            ////To store amount Dataset + quantity dataset
            //StringBuilder strAmtDS = new StringBuilder(), strQtyDS = new StringBuilder();

            //query = "SELECT Year(O.OrderDate) As SalesYear, round(SUM(d.quantity*p.UnitPrice),0) As Total, SUM(d.quantity) as Quantity FROM FC_OrderDetails as d,FC_Orders as o,FC_Products as p WHERE o.orderid= d.orderid and d.productid=p.productid GROUP BY Year(O.OrderDate) ORDER BY Year(O.OrderDate)";

            //using (OdbcConnection connection = DbHelper.Connection(DbHelper.ConnectionStringFisionChart))
            //{
            //    using (OdbcCommand command = new OdbcCommand(query, connection))
            //    {
            //        categories.Append("<categories>");

            //        //Initialize datasets
            //        strAmtDS.Append("<dataset seriesname='Revenue'>");
            //        strQtyDS.Append("<dataset seriesName='Units Sold' parentYAxis='S'>");

            //        //Variable to store link
            //        string strLink;
            //        //Iterate through each data row
            //        using (OdbcDataReader reader = command.ExecuteReader())
            //        {
            //            while (reader.Read())
            //            {
            //                categories.Append("<category label='" + reader["SalesYear"].ToString() + "'/>");
            //                //Generate the link
            //                strLink = HttpUtility.UrlEncode("javaScript:updateCharts(" + reader["SalesYear"].ToString() + ");");
            //                strAmtDS.Append("<set value='" + reader["Total"].ToString() + "' link='" + strLink + "'/>");
            //                strQtyDS.Append("<set value='" + reader["Quantity"].ToString() + "'/>)");
            //            }
            //            reader.Close();
            //        }
            //    }
            //    connection.Close();
            //}
            ////Closing elements
            //categories.Append("</categories>");
            //strAmtDS.Append("</dataset>");
            //strQtyDS.Append("</dataset>");
            ////Entire XML - concatenation
            //xmlData.Append(categories);
            //xmlData.Append(strAmtDS);
            //xmlData.Append(strQtyDS);
            //return xmlData.ToString();

            //string strStateName;
            //strStateName = Request.QueryString["StateName"];

            StringBuilder strXML = new StringBuilder();
            StringBuilder strCategories = new StringBuilder();
            StringBuilder strDataRev = new StringBuilder();
            StringBuilder strDataQty = new StringBuilder();

            string labelFormatting;
            //'If number of items to show on chart is less than 10, we wrap them
            //'else we show as rotated
            //if (int.Parse(count) > 10)
            labelFormatting = " labelDisplay='ROTATE' slantLabels='1' ";
            ///else
            //  labelFormatting = " labelDisplay='WRAP' ";

            //Initialize <chart> element
            strXML.Append("<chart palette='4' caption='Organization Payments Statewise' PYAxisName='Requests' SYAxisName='Amount' formatNumberScale='0' showValues='0' decimals='3'" + labelFormatting + ">");

            //Initialize <categories> element - necessary to generate a multi-series chart
            strCategories.Append("<categories>");

            //Initiate <dataset> elements
            strDataRev.Append("<dataset seriesName='No. of Requests'>");
            strDataQty.Append("<dataset seriesName='Amount' parentYAxis='S'>");

            string SSQLTemplateCols = "SELECT OrganizationName, COUNT(*) AS RecordCount, sum(InvoiceAmount) FROM PwcPaymentRequestForm INNER JOIN DataProfileClassWorkflowStates ON PwcPaymentRequestForm.StateId = DataProfileClassWorkflowStates.StateId where DataProfileClassWorkflowStates.StateName = '" + strStateName + "' GROUP BY OrganizationName";
            DataTable dtTemplateCols;

            using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                dtTemplateCols = CUtilityWeb.getDataTable(SSQLTemplateCols, sqlConnection);
            }
            string strLink;

            //Iterate through each record
            foreach (DataRow DR in dtTemplateCols.Rows)
            {
                //Append <category name='...' /> to strCategories
                strCategories.AppendFormat("<category name='{0}' />", DR[0].ToString());
                //Add <set value='...' /> to both the datasets
                strDataRev.AppendFormat("<set value='{0}' />", DR[1].ToString());
                strDataQty.AppendFormat("<set value='{0}' />", DR[2].ToString());
            }

            //Close <categories> element
            strCategories.Append("</categories>");

            //Close <dataset> elements
            strDataRev.Append("</dataset>");
            strDataQty.Append("</dataset>");

            //Assemble the entire XML now
            strXML.Append(strCategories.ToString() + strDataRev.ToString() + strDataQty.ToString());
            strXML.Append("<styles><definition><style type='font' name='CaptionFont' size='15' color='" + Functions.getCaptionFontColor + "' /><style type='font' name='SubCaptionFont' bold='0' /></definition><application><apply toObject='caption' styles='CaptionFont' /></application></styles>");
            strXML.Append("</chart>");

            return strXML.ToString();

        }


    }
}
