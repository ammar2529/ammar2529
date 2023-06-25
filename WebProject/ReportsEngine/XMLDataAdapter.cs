using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
using System.Data.SqlClient;
using System.Drawing;
using Newtonsoft.Json;
using System.Collections.Generic;
namespace WebProject.ReportsEngine {
/// <summary>
/// Converts Table Data Into Fusion Chart Readable XML
/// </summary>
public class XMLDataAdapter
{
    string _SPName; //SearchPanel _SPanel;
    ChartDataOrientation _DataOrientation;
    private SearchPanel _SPanel;
    public SearchPanel SPanel
    {
        get { return _SPanel; }
        set { _SPanel = value; }
    }
    public string YSeriesRenderType = "", DrillDownParamTemplate = "", WidgetId,DrillDownWidgetId="";
    public int DYSeriesIndex = -1;
    public bool isSliced;
    string _DataConnectionString;
    string _ColorPalleteName="";
    public string ColorPalleteName { get { return _ColorPalleteName; } set { _ColorPalleteName = value; } }
    string _ToolTip="";
    public string ToolTip { get { return _ToolTip; } set { _ToolTip = value; } }
    public string ToolTipFormat = "", WidgetHeading = "";
    public DataTable _PalleteNames;
    public DataRow[] _PalleteRowNames;
    public XMLDataAdapter(string SPName, SearchPanel SPanel, ChartDataOrientation DataOrientation, string DataConnectionString)
    {
        _SPName = SPName;
        _SPanel = SPanel;
        _DataOrientation = DataOrientation;
        _DataConnectionString = DataConnectionString;

    }

    
    public XMLDataAdapter(string SPName, ChartDataOrientation DataOrientation, string DataConnectionString)
    {
        _SPName = SPName;
        _SPanel = SPanel;
        _DataOrientation = DataOrientation;
        _DataConnectionString = DataConnectionString;

    }
    public string GetChartXML()
    {
        StoredProcInvoker spi = _DataConnectionString == "" ? new StoredProcInvoker(_SPName, _SPanel) : new StoredProcInvoker(_SPName, _SPanel, _DataConnectionString);

        return GenerateXML(spi);
    }
    public string GetChartXML(IndexedDictionary<string, IQueryParameter> Parameters)
    {
        StoredProcInvoker spi = _DataConnectionString == "" ? new StoredProcInvoker(_SPName, Parameters) : new StoredProcInvoker(_SPName, Parameters, _DataConnectionString);
        return GenerateXML(spi);

    }

    public struct TooltipFormatInfo
    {
        public Dictionary<string, string> AxisFormat;
    }

    Dictionary<string, TooltipFormatInfo> TooltipFormatDic;// = new Dictionary<string, TooltipFormatInfo>();

    public void InitJSONObjects()
    {
        if (!string.IsNullOrEmpty(ToolTipFormat))
        {
            try
            {
                TooltipFormatDic = JsonConvert.DeserializeObject<Dictionary<string, TooltipFormatInfo>>(ToolTipFormat);
            }
            catch (Exception ex) { }
        }

    }
    string GenerateXML(StoredProcInvoker SPInvoker)
    {
        InitJSONObjects();
        switch (_DataOrientation)
        {
            case ChartDataOrientation.SimpleData:
                return GetSimpleData(SPInvoker.ResultTable, -1, _ToolTip);
                break;
            case ChartDataOrientation.PivotData:
                return GetPivotData(SPInvoker.ResultTable, _ToolTip);

                break;
            case ChartDataOrientation.PiesData:
                return GetPieData(SPInvoker.ResultTable, _ToolTip);

                break;

            default:
                return null;
                break;
        }
    }
    string FormatAxisValues(string AxisValue, string SeriesName, string Axis)
    {

        Int64 iResult; Double dResult;
        if (!Int64.TryParse(AxisValue, out iResult))
            if (!Double.TryParse(AxisValue, out dResult)) return AxisValue;

        try
        {

            TooltipFormatInfo TFI;
            if (TooltipFormatDic.ContainsKey(SeriesName))
            {
                TFI = TooltipFormatDic[SeriesName];
                if (TFI.AxisFormat.ContainsKey(Axis))
                    if (AxisValue.Contains("."))
                        return string.Format("{0:" + TFI.AxisFormat[Axis] + "}", Convert.ToDouble(AxisValue));
                    else
                        return string.Format("{0:" + TFI.AxisFormat[Axis] + "}", Convert.ToInt64(AxisValue));
                else
                    return (TooltipFormatDic.ContainsKey("default") && SeriesName != "default" ? FormatAxisValues(AxisValue, "default", Axis) : AxisValue);
            }
            else
                return (TooltipFormatDic.ContainsKey("default") && SeriesName != "default" ? FormatAxisValues(AxisValue, "default", Axis) : AxisValue);
        }
        catch (Exception ex) { return AxisValue; }
    }
    string GetPivotData(DataTable DataToTransform, string ToolText)
    {
        StringBuilder sbTransformedData = new StringBuilder(2048);
        StringBuilder sbXAxis = new StringBuilder(1024);
        StringBuilder sbSeries = new StringBuilder(2048);
        StringBuilder sbCategories = new StringBuilder(2048);

        string XAxisColName = DataToTransform.Columns[0].ColumnName;
        string SeriesColName = DataToTransform.Columns[2].ColumnName;

        DataTable dtXAxis = DataToTransform.DefaultView.ToTable(true, new string[] { XAxisColName });
        DataTable dtSeries = DataToTransform.DefaultView.ToTable(true, new string[] { SeriesColName });
        DataTable dtColourPallet = new DataTable();
        string _tooltext = null;
        if (_ColorPalleteName != "" && _ColorPalleteName != null)
        {
            dtColourPallet = GetColorPallete(_ColorPalleteName);
        }
        foreach (DataRow drSeriesRow in dtSeries.Rows)
        {
            if (dtXAxis.Rows.Count > 0)
            {

                if (_ColorPalleteName != "" && _ColorPalleteName != null)
                {

                    _PalleteRowNames = dtColourPallet.Select("ColorKey='" + drSeriesRow[0].ToString().Replace("'", "''") + "'");//GetColorPallete(_ColorPalleteName, );
                    if (_PalleteRowNames != null && _PalleteRowNames.Length > 0)
                    {
                        sbSeries.AppendFormat(@"<dataset seriesName=""{0}"" color='{1}'>", HttpUtility.HtmlAttributeEncode(CUtilityWeb.BreakCamelCase(drSeriesRow[0].ToString())), _PalleteRowNames[0]["Color"].ToString().Replace("#", ""));

                    }
                    else
                    {
                        string _Color = GenerateRandomColor();
                        sbSeries.AppendFormat(@"<dataset seriesName=""{0}"" color='{1}'>", HttpUtility.HtmlAttributeEncode(CUtilityWeb.BreakCamelCase(drSeriesRow[0].ToString())), _Color.Replace("#", ""));

                        InsertPalletePropoerties(_ColorPalleteName, drSeriesRow[0].ToString(), _Color);
                    }
                }
                else
                {
                    sbSeries.AppendFormat(@"<dataset seriesName=""{0}"">", HttpUtility.HtmlAttributeEncode(CUtilityWeb.BreakCamelCase(drSeriesRow[0].ToString())));

                }
                /// sbSeries.AppendFormat("<dataset seriesName='{0}'>", CUtilityWeb.BreakCamelCase(drSeriesRow[0].ToString()));
                /// 

                string strLastSeries = DataToTransform.Rows[DataToTransform.Rows.Count - 1][XAxisColName].ToString();

                string ColorAttribute = "";
                if (dtColourPallet != null && dtColourPallet.Rows.Count > 0)
                {

                    _PalleteRowNames = dtColourPallet.Select("ColorKey=':LastElement'");
                    if (_PalleteRowNames != null && _PalleteRowNames.Length > 0)
                    {
                        ColorAttribute = string.Format(" color ='{0}'", _PalleteRowNames[0]["Color"].ToString().Replace("#", ""));
                    }
                }
                foreach (DataRow drXAxisRow in dtXAxis.Rows) //XAxis Value
                {

                    DataRow[] YXisValue = DataToTransform.Select(string.Format("{0} ='{1}' and {2}='{3}'",
                        SeriesColName.ToString().Replace("'", "''"), drSeriesRow[0].ToString().Replace("'", "''"),
                        XAxisColName.ToString().Replace("'", "''"), drXAxisRow[0].ToString().Replace("'", "''")));
                    string TooltipAttribute = "", DrillDownAttribute = "";
                    string LastSeriesColorAttribute;

                    LastSeriesColorAttribute = "";

                    if (strLastSeries == drXAxisRow[0].ToString())
                    {
                        LastSeriesColorAttribute = ColorAttribute;
                    }
                    if (YXisValue.Length != 0)
                    {
                        if (ToolText != "")
                        {
                            if (ToolText.Contains("%"))
                            {
                                TooltipAttribute = string.Format(@" toolText=""{0}""",
                                    ToolText.Replace("%SeriesName", HttpUtility.HtmlAttributeEncode(YXisValue[0][2].ToString()))
                                        .Replace("%YAxisValue", FormatAxisValues(YXisValue[0][1].ToString(), YXisValue[0][2].ToString(), "YAxisValue")
                                        .Replace("%XAxisValue", FormatAxisValues(HttpUtility.HtmlAttributeEncode(drXAxisRow[0].ToString()), YXisValue[0][2].ToString(), "XAxisValue"))));
                            }
                        }
                        if (DrillDownParamTemplate != "")
                        {
                            DrillDownAttribute = @" link=""j-DrillDownWidget-" + WidgetId + "|||" + HttpUtility.HtmlAttributeEncode(DrillDownParamTemplate.Replace("%SeriesName", YXisValue[0][2].ToString()).Replace("%YAxisValue", YXisValue[0][1].ToString()).Replace("%XAxisValue", drXAxisRow[0].ToString())) + @"""";
                        }
                        if (YXisValue.Length > 0)
                        {
                            sbSeries.AppendFormat(@" <set value=""{0}"" {1} {2} {3} />", YXisValue[0][1], TooltipAttribute, LastSeriesColorAttribute, DrillDownAttribute);
                        }
                    }
                    else //if no YAxis Values found create an element with YAxis zero
                    {
                        if (ToolText != "") //create tooltopwith YAxis Value equal to zero
                        {
                            if (ToolText.Contains("%"))
                            {
                                TooltipAttribute = string.Format(@" toolText=""{0}""",
                                    HttpUtility.HtmlAttributeEncode(ToolText.Replace("%SeriesName", drSeriesRow[0].ToString())
                                    .Replace("%XAxisValue", HttpUtility.HtmlAttributeEncode(FormatAxisValues(drXAxisRow[0].ToString(), drSeriesRow[0].ToString(), "XAxisValue")))
                                    .Replace("%YAxisValue", "0")));
                            }
                        }
                        if (DrillDownParamTemplate != "") //create DrillDownParamTemplate with YAxis Value equal to zero
                        {
                            DrillDownAttribute = @" link=""j-DrillDownWidget-" + HttpUtility.HtmlAttributeEncode(DrillDownParamTemplate.Replace("%SeriesName", drSeriesRow[0].ToString()).Replace("%XAxisValue", drXAxisRow[0].ToString()).Replace("%YAxisValue", "0")) + @"""";
                        }
                        sbSeries.AppendFormat(" <set value='0' {0} {1} {2} />", TooltipAttribute, LastSeriesColorAttribute, DrillDownAttribute);
                    }
                }
                sbSeries.Append("</dataset>");
            }
        }

        sbCategories.Append("<categories>");
        foreach (DataRow drXAxis in dtXAxis.Rows)
        {
            sbCategories.AppendFormat(@"<category label=""{0}"" />", HttpUtility.HtmlAttributeEncode(drXAxis[0].ToString()));

        }
        sbCategories.Append("</categories>");
        return sbCategories.ToString() + sbSeries.ToString();
    }


    public String GetSimpleData(DataTable DataToTransform,
int SYAxisSeriesNo,
string ToolTip
)
    {
        IndexedDictionary<string, string> SeriesRenderType = new IndexedDictionary<string, string>();

        string[] arrSeriesRenderType; //= YSeriesRenderType.Split(new char[] { '|' });
        if (YSeriesRenderType != "")
        {
            arrSeriesRenderType = YSeriesRenderType.Split(new char[] { '|' });
            for (int iLoop = 0; iLoop < arrSeriesRenderType.Length; iLoop++)
            {
                string[] arrSRT = arrSeriesRenderType[iLoop].Split(new char[] { ',' });
                SeriesRenderType.Add(arrSRT[0].ToString(), arrSRT[1]);
            }
        }
        StringBuilder sbXMLData = new StringBuilder();
        StringBuilder sbXAxis = new StringBuilder();
        StringBuilder sbCategories = new StringBuilder();
        DataTable dtColourPallet = new DataTable();
        StringBuilder[] sbSeries = new StringBuilder[DataToTransform.Columns.Count - 1];

        string[] SeriesColNames = new string[DataToTransform.Columns.Count - 1];
        string XAxisColName = DataToTransform.Columns[0].ColumnName;
        int index;
        for (index = 1; index < DataToTransform.Columns.Count; index++)
        {
            SeriesColNames[index - 1] = DataToTransform.Columns[index].ColumnName;
        }

        //Initialize <categories> element - necessary to generate a multi-series chart
        sbCategories.Append("<categories>");

        //Initiate <dataset> elements
        index = 0;
        if (_ColorPalleteName != "" && _ColorPalleteName != null)
        {
            dtColourPallet = GetColorPallete(_ColorPalleteName);
        }
        foreach (string SeriesColName in SeriesColNames)
        {

            string RenderAs, parentYAxis;
            RenderAs = "";
            if (SeriesRenderType.ContainsKey((index + 2).ToString()))
            {
                RenderAs = string.Format("renderAs='{0}'", SeriesRenderType[(index + 2).ToString()]);
            }
            parentYAxis = "";
            if ((DYSeriesIndex > -1) && (DYSeriesIndex - 2) <= index)
            {
                parentYAxis = "parentYAxis='S'";
            }
            if (_ColorPalleteName != null && _ColorPalleteName != "")
            {
                _PalleteRowNames = dtColourPallet.Select("ColorKey='" + SeriesColName.Replace("'", "''") + "'");//GetColorPallete(_ColorPalleteName, SeriesColName);
                if (_PalleteRowNames != null && _PalleteRowNames.Length > 0)
                {
                    sbSeries[index] = new StringBuilder(String.Format(@"<dataset seriesName=""{0}"" {1} {2}  color ='{3}'>", HttpUtility.HtmlAttributeEncode(CUtilityWeb.BreakCamelCase(SeriesColName)), RenderAs, parentYAxis, _PalleteRowNames[0]["Color"].ToString().Replace("#", "")));
                }
                else
                {
                    string _Color = GenerateRandomColor();
                    sbSeries[index] = new StringBuilder(String.Format(@"<dataset seriesName=""{0}"" {1} {2} color = '{3}' >", HttpUtility.HtmlAttributeEncode(CUtilityWeb.BreakCamelCase(SeriesColName)), RenderAs, parentYAxis, _Color.Replace("#", "")));
                    InsertPalletePropoerties(_ColorPalleteName, SeriesColName, _Color);
                }
            }
            else
            {
                sbSeries[index] = new StringBuilder(String.Format(@"<dataset seriesName=""{0}"" {1} {2} >", HttpUtility.HtmlAttributeEncode(CUtilityWeb.BreakCamelCase(SeriesColName)), RenderAs, parentYAxis));
            }
            index++;
        }
        foreach (DataRow drSeriesRow in DataToTransform.Rows)
        {

            sbCategories.AppendFormat(@"<category label=""{0}""  />", HttpUtility.HtmlAttributeEncode(drSeriesRow[XAxisColName].ToString()));
            string strLastSeries = DataToTransform.Rows[DataToTransform.Rows.Count - 1][XAxisColName].ToString();

            //Add <set value='...' /> to both the datasets
            string ColorAttribute = "";
            if (dtColourPallet != null && dtColourPallet.Rows.Count > 0)
            {

                _PalleteRowNames = dtColourPallet.Select("ColorKey=':LastElement'");
                if (_PalleteRowNames != null && _PalleteRowNames.Length > 0)
                {
                    ColorAttribute = string.Format(" color ='{0}'", _PalleteRowNames[0]["Color"].ToString().Replace("#", ""));
                }
            }

            for (index = 0; index < SeriesColNames.Length; index++)
            {
                string SeriesName = SeriesColNames[index];
                string YAxisValue = (drSeriesRow[SeriesColNames[index]].ToString() == "") ? "" : drSeriesRow[SeriesColNames[index]].ToString();
                string XAxisValue = drSeriesRow[XAxisColName].ToString();
                string ToolText = ToolTip;
                string TooltipAttribute = "", DrillDownAttribute = "";
                string LastSeriesColorAttribute = "";
                if (strLastSeries == drSeriesRow[XAxisColName].ToString())
                {
                    LastSeriesColorAttribute = ColorAttribute;
                }

                if (ToolText != "")
                {
                    if (ToolText.Contains("%"))
                    {
                        ToolText = ToolText.Replace("%SeriesName", SeriesName)
                            .Replace("%YAxisValue", FormatAxisValues(YAxisValue, SeriesName, "YAxisValue"))
                            .Replace("%XAxisValue", FormatAxisValues(XAxisValue, SeriesName, "XAxisValue"));

                    }
                    TooltipAttribute = @" toolText=""" + HttpUtility.HtmlAttributeEncode(ToolText) + @"""";
                }

                if (DrillDownParamTemplate != "")
                {
                    DrillDownAttribute = @" link=""j-DrillDownWidget-" + WidgetId + "|||" + HttpUtility.HtmlAttributeEncode(DrillDownParamTemplate.Replace("%SeriesName", SeriesName).Replace("%YAxisValue", YAxisValue).Replace("%XAxisValue", XAxisValue)) + @"""";
                }

                sbSeries[index].AppendFormat("<set value='{0}' {1} {2} {3}/>", YAxisValue, TooltipAttribute, DrillDownAttribute, LastSeriesColorAttribute);

            }
        }

        //Close <categories> element
        sbCategories.Append("</categories>");

        //Assemble the entire XML now
        sbXMLData.Append(sbCategories.ToString());
        index = 0;
        for (index = 0; index < sbSeries.Length; index++)
        {
            //Close <dataset> elements
            sbSeries[index].Append("</dataset>");
            sbXMLData.Append(sbSeries[index].ToString());
        }

        return sbXMLData.ToString();
    }
    public String GetPieData(DataTable DataToTransform, string ToolText

      )
    {
        StringBuilder sbXMLData = new StringBuilder(),
            sbXAxis = new StringBuilder(),
            sbCategories = new StringBuilder(),
            sbSeries = new StringBuilder();

        string[] SeriesColNames = new string[DataToTransform.Columns.Count - 1];
        string XAxisColName = DataToTransform.Columns[0].ColumnName;
        int index;
        for (index = 1; index < DataToTransform.Columns.Count; index++)
        {
            SeriesColNames[index - 1] = DataToTransform.Columns[index].ColumnName;
        }
        DataTable dtColourPallet = new DataTable();
        if (_ColorPalleteName != "" && _ColorPalleteName != null)
        {
            dtColourPallet = GetColorPallete(_ColorPalleteName);
        }
        string _Color = "", ColorAttribute = "";
        foreach (DataRow drSeriesRow in DataToTransform.Rows)
        {
            if (_ColorPalleteName != "" && _ColorPalleteName != null)
            {
                _PalleteRowNames = dtColourPallet.Select("ColorKey='" + drSeriesRow[0].ToString().Replace("'", "''") + "'");//GetColorPallete(_ColorPalleteName, );
                if (_PalleteRowNames != null && _PalleteRowNames.Length > 0)
                {
                    _Color = _PalleteRowNames[0]["Color"].ToString().Replace("#", "");

                }
                else
                {
                    _Color = GenerateRandomColor();
                    InsertPalletePropoerties(_ColorPalleteName, drSeriesRow[0].ToString(), _Color);
                }
            }
            ColorAttribute = string.Format("color='{0}'", _Color.Replace("#", ""));

            string DrillDownlLinkResolved = "";

            if (!string.IsNullOrEmpty(DrillDownParamTemplate))
            {
                //DrillDownAttribute = " link='j-DrillDownWidget-" + WidgetId + "|||" + DrillDownParamTemplate.Replace("%SeriesName", YXisValue[0][2].ToString()).Replace("%YAxisValue", YXisValue[0][1].ToString()).Replace("%XAxisValue", drXAxisRow[0].ToString()) + "'";

                DrillDownlLinkResolved = @" link=""j-DrillDownWidget-" + WidgetId + "|||" +
                DrillDownParamTemplate.Replace("%PieValue", HttpUtility.UrlEncode(drSeriesRow[0].ToString())) + @""" ";
            }


            string IsSlicedAttribute = isSliced ? " isSliced='1'" : "";

            sbSeries.AppendFormat(@"<set label=""{0}"" value=""{1}"" {2} {3} {4} />", HttpUtility.HtmlAttributeEncode(drSeriesRow[0].ToString()),
                drSeriesRow[1].ToString(), DrillDownlLinkResolved, ColorAttribute, IsSlicedAttribute);

        }


        return sbSeries.ToString();
    }
    private DataTable GetColorPallete(string PalleteName)
    {
        string SQLProperties = string.Format(@"select PaletteName,ColorKey,Color from RPTChartEngineColorPalette where PaletteName='{0}' ",
                                                                     PalleteName);
        DataTable dtFields;
        using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
        {
            dtFields = CUtilityWeb.getDataTable(SQLProperties, sqlConnection);
        }
        return dtFields;
    }
    private DataTable GetColorPallete(string PalleteName, string ColorKey)
    {
        string SQLProperties = string.Format(@"select PaletteName,ColorKey,Color from RPTChartEngineColorPalette where PaletteName='{0}' and ColorKey='{1}' ",
                                                                     PalleteName, ColorKey);
        DataTable dtFields;
        using (SqlConnection sqlConnection = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
        {
            dtFields = CUtilityWeb.getDataTable(SQLProperties, sqlConnection);
        }
        return dtFields;
    }


    private static Random Randomizer;
    private string GenerateRandomColor()
    {
        Random rnd;
        rnd = XMLDataAdapter.Randomizer = XMLDataAdapter.Randomizer == null ? new Random((int)DateTime.Now.Millisecond) : XMLDataAdapter.Randomizer;
        SolidBrush sb = new
        SolidBrush(Color.FromArgb(rnd.Next(0, 255), rnd.Next(0, 255), rnd.Next(0, 255)));
        return "#" + sb.Color.Name.Substring(2);


    }

    private void InsertPalletePropoerties(string ColorPalleteName, string SeriesColName, string _Color)
    {
        string ReportScript = string.Format(@"insert into RPTChartEngineColorPalette (PaletteName,ColorKey,Color)  values ('{0}','{1}','{2}')", ColorPalleteName.Replace("'", "''"), SeriesColName.Replace("'", "''"), _Color);
        CUtilityWeb.ExecScript(ReportScript.ToString(), CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB));
    }
}
}