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

namespace WebProject.ReportsEngine
{
    public partial class FusionChartDataFacade : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string
                ChartId = Request.QueryString["ChartId"],
                SearchParameters = Request.QueryString["SearchParameters"];
            if (!(string.IsNullOrEmpty(NextReportId)))
            {
                FusionChartWidget FusionChartBuilder = new FusionChartWidget(ChartId, this);
                Response.ClearContent();
                Response.ContentType = "text/xml";
                Response.Output.Write(FusionChartBuilder.GetChartXML(QueryParameter.GetQueryParameters(SearchParameters)));
                Response.End();
            }
        }
        //public static string GetChartXML()
        //{
        //    string
        //ChartId = Request.QueryString["ChartId"],
        //SearchParameters = Request.QueryString["SearchParameters"];
        //    if (!(string.IsNullOrEmpty(NextReportId)))
        //    {
        //        FusionChartWidget FusionChartBuilder = new FusionChartWidget(ChartId, this);
        //     //   Response.ContentType = "text/xml";
        //       // Response.Output.Write(FusionChartBuilder.GetChartXML(GetQueryParameters(SearchParameters)));
        //    }
        //}
        //IndexedDictionary<string, IQueryParameter> GetQueryParameters(string Params)
        //{
        //    IndexedDictionary<string, IQueryParameter> QueryParams = new IndexedDictionary<string, IQueryParameter>();
        //    string[] arrParams = Params.Split('|');
        //    int ParamLength =arrParams.Length;
        //    for (int iLoop = 0; iLoop < ParamLength; iLoop+=2)
        //    {
        //        string ParamName, ParamValue;
        //        ParamName = arrParams[iLoop];
        //        ParamValue= arrParams[iLoop + 1];


        //        //QueryParams.Add(arrParams[iLoop], new QueryParameter(arrParams[iLoop]));
        //        //if Next param Exists && The next param is The TextValue Of the Field
        //        if ((iLoop + 2 <ParamLength && (ParamName + "Text") == arrParams[iLoop + 2]))//Compare With Name Parameter
        //        {
        //            QueryParams.Add(ParamName, new QueryParameter(ParamName, ParamValue, arrParams[iLoop + 3]));
        //            iLoop += 2;

        //        }
        //        else
        //        {
        //            QueryParams.Add(ParamName, new QueryParameter(ParamName, ParamValue, ParamValue));
        //        }
        //    }
        //    return QueryParams;
        //}

        #region IReportPortalSettings Members

        public WidgetServerRequestType SearchPanelRequestType
        {
            get { throw new NotImplementedException(); }
        }

        public WidgetServerRequestType FusionChartWidgetRequestType
        {
            get { throw new NotImplementedException(); }
        }

        public WidgetServerRequestType PageRequestType
        {
            get { throw new NotImplementedException(); }
        }

        public bool IsUsingWidgetFramework
        {
            get { throw new NotImplementedException(); }
        }

        public string ContentHolderName
        {
            get { throw new NotImplementedException(); }
        }

        public string NextReportId { get { return Request.QueryString["NextReportId"]; } }

        public ReportWidgetLoader WidgetLoader
        {
            get { throw new NotImplementedException(); }
        }

        #endregion
    }
}
