using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebProject.Pages.eForms.iRental.Reports
{
    public partial class PrintReceiptVoucherFrPg : System.Web.UI.Page
    {
        [Obsolete]
        protected void Page_Load(object sender, EventArgs e)
        {
            CrystalReportViewer1.DisplayGroupTree = false;
            //CrystalReportViewer1.Visible = false;

        }
        //DataTable dt;
        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    AsyncWidgets.DAL.ParamDictionary<string, AsyncWidgets.DAL.QueryParameter> pd = new AsyncWidgets.DAL.ParamDictionary<string, AsyncWidgets.DAL.QueryParameter>("Dummy", "");
        //    string  FormId = Request.QueryString["FormId"] == null ? "-1" : Request.QueryString["FormId"].ToString();

        //    //VN = "6-246/11";
        //    // FormId = "20";
        //    //EmpId = "140";

        //    pd.AddQueryParam("RecId", new AsyncWidgets.DAL.QueryParameter(FormId));
        //    pd.AddQueryParam("__UserId", new AsyncWidgets.DAL.QueryParameter(Session["UserId"].ToString()));


        //    ReportDocument repDoc = CrystalReportSource1.ReportDocument;
        //    //repDoc.SetDataSource(AsyncWidgets.DAL.DBHelper.GetDataSet("select * from vw_EPG_PaySlip_Report where EmpId=" + VN).Tables[0]);
        //    repDoc.SetDataSource(AsyncWidgets.DAL.DBHelper.GetDataTableProc("RNTRentalContract_Print_Receipt_Voucher_SP",pd));
        //    //repDoc.SetDataSource(AsyncWidgets.DAL.DBHelper.);

        //    Response.Buffer = false;
        //    // Clear the response content and headers
        //    Response.ClearContent();
        //    Response.ClearHeaders();
        //    Response.ContentType = "application/pdf";
        //    try
        //    {
        //        // Export the Report to Response stream in PDF format and file name Customers
        //        repDoc.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "Receipt");
        //        // There are other format options available such as Word, Excel, CVS, and HTML in the ExportFormatType Enum given by crystal reports
        //        Response.Flush();
        //        Response.Close();
        //    }
        //    catch (Exception ex)
        //    {
        //        Console.WriteLine(ex.Message);
        //        ex = null;
        //    }




        //}
    }
}