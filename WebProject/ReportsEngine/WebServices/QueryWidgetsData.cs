using System;
using System.Web;
using System.Collections;
using System.Collections.Generic;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Web.Script.Services;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Reflection;
using System.Threading;
using System.Web.UI.WebControls;

namespace WebProject.ReportsEngine.WebServices{
/// <summary>
/// Summary description for QueryWidgetsData
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.ComponentModel.ToolboxItem(false)]
[ScriptService]
public class QueryWidgetsData : System.Web.Services.WebService {

    [WebMethod]
    public string[] GetProperties(string CasecadeParams)
    {
        /*_strArg Contains
         * Selected Value
         * Parent ID
         * SearchPanel ID
         */
       // System.Threading.Thread.Sleep(5000);
        string ParentDDLValue, ParentDDLId, SearchPanelId,ChildDDLId,SQLChildQuery;

        //IDictionary<string, object> ContextDictionary = (IDictionary<string, object>)context;

        if (!string.IsNullOrEmpty( CasecadeParams))
        {
            //string strCascadeArguments = CasecadeParams;//((string)ContextDictionary["Value"]);
            string[] arrCascadeArguments = new string[4];

            arrCascadeArguments = CasecadeParams.Split('|');


            ParentDDLValue = arrCascadeArguments[0].ToString(); //parent Dropdown Value
            ParentDDLId = arrCascadeArguments[1].ToString().Substring(arrCascadeArguments[1].ToString().IndexOf("_") + 1); //Parent Dropdown id
            SearchPanelId = arrCascadeArguments[1].ToString().Substring(0, arrCascadeArguments[1].ToString().IndexOf("_")); // SearchPanel Id
            ChildDDLId = arrCascadeArguments[2].ToString(); 

            string SQLParentDDLProperties = string.Format(@"SELECT PropertyValue  FROM  RPTChartEngineFieldProperty
WHERE     (SearchPanelID = '{0}') AND (FieldID = '{1}')  AND (FieldProperty = 'LookupQuery') ", SearchPanelId.Replace("'", "''"), ChildDDLId.Replace("'", "''"));

            DataTable dtDDLProperties;
            using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
            {
                dtDDLProperties = CUtilityWeb.getDataTable(SQLParentDDLProperties, sqlConnection);
            }
            if (dtDDLProperties.Rows.Count ==1)
            {
                SQLChildQuery = dtDDLProperties.Rows[0]["PropertyValue"].ToString();
                return getChildDataset(ParentDDLId, ParentDDLValue, SearchPanelId+"_"+ChildDDLId, SQLChildQuery);

            }
            else
            {
                return new string[] { "Couldn't Fetch The List", "Couldn't Fetch The List" };
            }

            //setCascededChildID(Args);
            //_ControlID = Args[2].ToString() + "_" + _casecaschildID;
            //getLookUpQuery(Args);
  
        }
        else
        {
            return null;
        }



    }

    [WebMethod]
    public string[] GetASPGridHTML(string ReportId, string WidgetId, int PageIndex, string SortBy, string Parameters)
    {
        try
        {
            //PageIndex = 1;
            return new string[] { WidgetId, RenderUserControl(PortalConfiguration.WidgetsPath + "ASPGridWidget.ascx", ReportId, WidgetId, PageIndex, SortBy, Parameters) };
        }
        catch (Exception e)
        {
            return new string[] { WidgetId,e.Message + "\t\n" + e.StackTrace };
        }
    }
    public string RenderUserControl(string path, params object[] Parameters)
    {
        Page pageHolder = new Page();
        System.Web.UI.Control UserControl = LoadControl(path, pageHolder, Parameters);
        UserControl.ID = Parameters[0] + "_" + Parameters[1];

        HtmlForm HTMLForm = new HtmlForm();
        HtmlGenericControl div = new HtmlGenericControl("DynamicUserControl");
        div.Controls.Add(UserControl);
        HTMLForm.Controls.Add(div);
        pageHolder.Controls.Add(HTMLForm);
        pageHolder.DesignerInitialize();
        using (System.IO.StringWriter output = new System.IO.StringWriter())
        {
            HttpContext.Current.Server.Execute(pageHolder, output, false);
            int UserControlStartIndex, UserControlEndIndex;
            string UCRenderedHtml = output.ToString();
            UserControlStartIndex = UCRenderedHtml.IndexOf("<DynamicUserControl>") + "<DynamicUserControl>".Length;
            UserControlEndIndex = UCRenderedHtml.IndexOf("</DynamicUserControl>") - "</DynamicUserControl>".Length + 1;
            return UCRenderedHtml.Substring(UserControlStartIndex, UserControlEndIndex - UserControlStartIndex);
        }
    }
    private  UserControl LoadControl(string UserControlPath, Page _Page,  object[] constructorParameters)
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
    private string[] getChildDataset(string ParentDDLId,string ParentDDLValue,string ChildDDLId,string ChildLookupQuery )//string[] _Arguments)
    {
       // string SQLProperties = _lookUpQuery.ToString().ToLower();

        string ChildLookupQueryEmbeded = ChildLookupQuery.Replace("::" + ParentDDLId + "::", ParentDDLValue);
        DataTable dtChildDDLRows;
        using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
        {
            dtChildDDLRows = CUtilityWeb.getDataTable(ChildLookupQueryEmbeded, sqlConnection);
        }
      //  DataTable _MyTable = new DataTable();
        //_MyTable = dtChildDDLRows.Copy();
        //DataSet ds = new DataSet();
        //ds.Tables.Add(dtChildDDLRows);
        string[] _resultantArray = new string[dtChildDDLRows.Rows.Count + 1];
        _resultantArray[0] = ChildDDLId;
        for (int iLoop = 1; iLoop <= dtChildDDLRows.Rows.Count; iLoop++)
        {
            _resultantArray[iLoop] = dtChildDDLRows.Rows[iLoop-1][0].ToString();
        }
        return _resultantArray;
    }
	[WebMethod]
    public string[] GetChartData(string NextReportId,string WidgetId, string SearchParameters)
    {
	
        if (!(string.IsNullOrEmpty(NextReportId)))
        {
            FusionChartWidget FusionChartBuilder = new FusionChartWidget(NextReportId, WidgetId);

            return new string[] {WidgetId,FusionChartBuilder.GetChartXML(QueryParameter.GetQueryParameters(SearchParameters))};
        }
        else
        {
            return new string[] {WidgetId,""};
        }
    }
}

}