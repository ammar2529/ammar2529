using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using System.Collections;
using dotnetCHARTING;
using System.Drawing;
using System.Reflection;
namespace WebProject.ReportsEngine
{

    /// <summary>
    /// Build charts with custom code.
    /// </summary>
    public class CustomChart
    {
        private string _CustomChartId;
        private DataTable _ChartData;
        private static Dictionary<string, string> _CustomChartList = null;
        private static Dictionary<string, string> _CustomURLInvokeList = null;
        private DataTable dtBUColors = null;
        private Chart _Chart;
        public delegate void CustomURLInvokeListHandler();

        public string CustomChartId
        {
            get { return _CustomChartId; }
        }


        public CustomChart(string CustomChartId)
        {
            _CustomChartId = CustomChartId;
            //    _Chart = chart;
            // CustomChart.CustomURLDelegate(CustomChart )
        }
        /// <summary>
        /// Constructor to be called for custom chart rendering
        /// </summary>
        /// <param name="CustomChartId">ChartID for which the chart to be rendered</param>
        /// <param name="ChartData">Data Required to Render the chart</param>
        public CustomChart(string CustomChartId, DataTable ChartData)
        {
            _CustomChartId = CustomChartId;
            _ChartData = ChartData;
        }


        public void BuildChart(Chart ChartControl, SearchPanel SearchPanel)
        {
            if (!CustomChart.IsChartExists(_CustomChartId))
                throw new Exception(string.Format("Custom ChartId not found for chart {0}!", _CustomChartId));

            switch (_CustomChartId)
            {
                case "gphMPBAllBussinessGroups":
                    MPBAllBussinessGroups(ChartControl, SearchPanel);
                    break;
                case "gphYearlyUsageReportByState":
                    YearlyUsageReportByState(ChartControl, SearchPanel);
                    break;
                default:
                    break;
            }

        }
        private static bool IsChartExists(string CustomChartId)
        {
            if (_CustomChartList == null)
            {
                _CustomChartList = new Dictionary<string, string>();
                _CustomChartList.Add("gphMPBAllBussinessGroups", "gphMPBAllBussinessGroups"); //MPM statands for mobile phone billing
                _CustomChartList.Add("gphYearlyUsageReportByState", "gphYearlyUsageReportByState");
            }
            if (_CustomChartList.ContainsKey(CustomChartId))
                return true;
            else return false;
        }

        private void MPBAllBussinessGroups(Chart ChartControl, SearchPanel SearchPanel)
        {
            DataTable dtChart = _ChartData;
            Chart CustomChart = ChartControl;
            CustomChart.LegendBox.Visible = false;
            //  using(SqlConnection Conn= CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB )) 
            //using (OleDbConnection Conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["eFormsDBConnectionString"].ConnectionString))
            //{
            //    dtChart = CUtilityWeb.getDataTable(SSQL, Conn);
            //}

            //     int XAxisMaximum = (dtCustomChart.Rows.Count *20) +10;

            //   CustomChart.Size = (ChartWidth.ToString()) + "x600";
            DataRow LastRow = null, LastChartType = null;
            int XAxisMaximum, BarCount = 0;
            double OfficialYAxisMax = 0, PersonalYAxisMax = 0, YAxisMaximum = 0;
            foreach (DataRow DR1 in dtChart.Rows)
            {
                if (LastRow != null && DR1["ChartType"].ToString() != "Personal") //if offical present and personal is missing
                {
                    LastRow = null;
                    BarCount++;
                    if (YAxisMaximum < (OfficialYAxisMax)) YAxisMaximum = OfficialYAxisMax;
                    OfficialYAxisMax = 0;
                }
                if (LastRow != null) //if Last row was not null means last chartype was Official and current row is not personal
                {

                    LastRow = null;
                    BarCount++;
                    PersonalYAxisMax = Convert.ToDouble(DR1["CurrentCharges"]);


                    if (YAxisMaximum < (PersonalYAxisMax + OfficialYAxisMax)) YAxisMaximum = PersonalYAxisMax + OfficialYAxisMax;
                    OfficialYAxisMax = 0;
                    PersonalYAxisMax = 0;
                }
                else //if last row was null mean last row was not official
                {
                    if (DR1["ChartType"].ToString() == "Personal") //if Official is missing
                    {
                        LastRow = null;
                        BarCount++;
                        PersonalYAxisMax = Convert.ToDouble(DR1["CurrentCharges"]);

                        if (YAxisMaximum < PersonalYAxisMax) YAxisMaximum = PersonalYAxisMax;
                        OfficialYAxisMax = 0;
                        PersonalYAxisMax = 0;
                    }
                    else //if Current is offical and next might be personal 
                    {
                        LastRow = DR1;
                        OfficialYAxisMax = Convert.ToDouble(DR1["CurrentCharges"]);
                        PersonalYAxisMax = 0;
                    }

                }
            }
            XAxisMaximum = (BarCount * 20) + 10;
            YAxisMaximum = YAxisMaximum + ((YAxisMaximum / 100) * 5); //add 5 percent to The calculated YAxis
            int ChartWidth = (BarCount * 50) + 125;//extra 125 for area outside chart area and other 125 for legend box

            CustomChart.Size = (Convert.ToInt32(ChartWidth)).ToString() + "x400";
            string MonthName = "", BusinessUnit = "";
            if (dtChart.Rows.Count > 0)
            {
                MonthName = dtChart.Rows[0]["MonthName"].ToString();
                BusinessUnit = dtChart.Rows[0]["BusinessUnit"].ToString();
            }
            IEnumerator enumerator = dtChart.Rows.GetEnumerator();
            DataRow DR = null;
            SeriesCollection SC = new SeriesCollection();
            bool IsLastRecord = enumerator.MoveNext();
            int Count = 1, MonthStart = 1, BUStart = 1;

            CustomChart.XAxis.Scale = Scale.Normal;
            CustomChart.XAxis.NumberPrecision = 0;
            CustomChart.XAxis.Maximum = XAxisMaximum;// XAxisMaximum;
            CustomChart.XAxis.Maximum = YAxisMaximum;
            CustomChart.XAxis.SpacingPercentage = 10;
            Element LastElement = null;
            Series LastSeries = null;
            while (IsLastRecord)
            {
                DR = (DataRow)enumerator.Current;
                BusinessUnit = DR["BusinessUnit"].ToString();

                BUStart = Count;
                while (DR["BusinessUnit"].ToString() == BusinessUnit)
                {
                    MonthName = DR["MonthName"].ToString();
                    if (LastSeries != null)
                    {
                        Count++;
                        LastSeries = null;
                    }
                    MonthStart = Count;

                    while (DR["MonthName"].ToString() == MonthName)
                    {
                        Series series = new Series();

                        series.EmptyElement.Mode = EmptyElementMode.Ignore;
                        Element element = new Element();
                        series.Name = DR["ChartType"].ToString();
                        element.ToolTip = string.Format("{0} - {1} - {2} : %YValue", BusinessUnit, MonthName, DR["ChartType"].ToString());

                        if (LastSeries != null) //has element before (personal)
                        {

                            element.YValue = Convert.ToDouble(DR["CurrentCharges"]);
                            series.YAxis = LastSeries.YAxis;
                            series.XAxis = LastSeries.XAxis;
                            series.Elements.Add(element);
                            element.XValue = (LastSeries.Elements[0].XValue);

                            element.Color = ColorTranslator.FromHtml("#F78800"); //GetBUColor(DR["BusinessUnit"].ToString());

                            Annotation AnnotationTotal = new Annotation("Total: " + (LastSeries.Elements[0].YValue + element.YValue).ToString());
                            // Set the dotnetCHARTING.Orientation.
                            AnnotationTotal.Orientation = dotnetCHARTING.Orientation.Top;
                            element.Annotation = AnnotationTotal;
                            LastSeries = null;
                        }
                        else //new element (official)
                        {
                            series.YAxis = new Axis();
                            series.YAxis.Maximum = YAxisMaximum;
                            series.XAxis = new Axis();
                            series.XAxis.Maximum = XAxisMaximum;//XAxisMaximum;
                            series.YAxis.Scale = Scale.Stacked;

                            if (Count > 1) // clear all Axis except first one
                            {
                                series.YAxis.Clear();
                                series.XAxis.Clear();

                            }
                            else //if first Series
                            {

                                CustomChart.XAxis = series.XAxis; //assign the first 
                            }
                            element.ToolTip = string.Format("{0} - {1} - {2} : %YValue", BusinessUnit, MonthName, DR["ChartType"].ToString());
                            element.YValue = Convert.ToDouble(DR["CurrentCharges"]);
                            element.XValue = ((Count) * 10) + 4;
                            series.Elements.Add(element);

                            if (DR["ChartType"].ToString() == "Official")//if official element is not missing
                            {
                                LastSeries = series; //save it to get YAxis settings for the next personal element
                                element.Color = GetBUColor(DR["BusinessUnit"].ToString() + " " + DR["ChartType"].ToString());
                                //    element.ToolTip = string.Format("{0} - {1} - {2} : %YValue", BusinessUnit, MonthName, DR["ChartType"].ToString());
                                element.URL = string.Format("SimpleSingleGraph.aspx?NextReportID=MPBByDepartment&BusinessUnit={0}&MonthDate={1}&DateYear={2}", BusinessUnit, MonthName, SearchPanel.SearchFields["DateYear"].FieldValue);


                            }
                            else //if Official Element is missing
                            {
                                Count++; //then add space for official element
                                element.Color = ColorTranslator.FromHtml("#F78800"); //GetBUColor(DR["BusinessUnit"].ToString()); //GetColor without official
                                                                                     //    element.ToolTip = string.Format("{0} - {1} - {2} : %YValue", BusinessUnit, MonthName, DR["ChartType"].ToString());

                            }

                        }
                        element.SmartLabel.Text = DR["ChartType"].ToString();
                        element.ShowValue = true;
                        series.XAxis.StaticColumnWidth = 40;
                        Count++;
                        CustomChart.SeriesCollection.Add(series);
                        IsLastRecord = enumerator.MoveNext();
                        if (!IsLastRecord)
                        {
                            break;
                        }
                        DR = (DataRow)enumerator.Current;
                    }
                    if (LastSeries != null)
                    {
                        AxisTick tick = new AxisTick((MonthStart * 10) - 4, ((Count) * 10) + 4, MonthName.Substring(0, 3));
                        CustomChart.XAxis.ExtraTicks.Add(tick);

                    }
                    else
                    {
                        AxisTick tick = new AxisTick((MonthStart * 10) - 4, ((Count - 1) * 10) + 4, MonthName.Substring(0, 3));
                        CustomChart.XAxis.ExtraTicks.Add(tick);
                    }
                    if (!IsLastRecord)
                    {
                        break;
                    }
                }

                AxisTick tick2 = new AxisTick((BUStart * 10) - 4, ((Count - 1) * 10) + 4, BusinessUnit);
                tick2.SetAllColors(GetBUColor(BusinessUnit + " Official"));
                tick2.Label.Font = new Font(tick2.Label.Font.Name, tick2.Label.Font.Size, FontStyle.Bold);
                CustomChart.XAxis.ExtraTicks.Add(tick2);
            }
            CustomChart.XAxis.Clear();


        }
        private void YearlyUsageReportByState(Chart ChartControl, SearchPanel SearchPanel)
        {
            DataTable dtChart = _ChartData;
            Chart CustomChart = ChartControl;
            CustomChart.LegendBox.Visible = false;
            //  using(SqlConnection Conn= CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB )) 
            //using (OleDbConnection Conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["eFormsDBConnectionString"].ConnectionString))
            //{
            //    dtChart = CUtilityWeb.getDataTable(SSQL, Conn);
            //}

            //     int XAxisMaximum = (dtCustomChart.Rows.Count *20) +10;

            //   CustomChart.Size = (ChartWidth.ToString()) + "x600";
            DataRow LastRow = null, LastChartType = null;
            int XAxisMaximum, BarCount = 0;
            double OfficialYAxisMax = 0, PersonalYAxisMax = 0, YAxisMaximum = 0;
            foreach (DataRow DR1 in dtChart.Rows)
            {
                if (LastRow != null && DR1["ChartType"].ToString() != "RequestCount") //if offical present and personal is missing
                {
                    LastRow = null;
                    BarCount++;
                    if (YAxisMaximum < (OfficialYAxisMax)) YAxisMaximum = OfficialYAxisMax;
                    OfficialYAxisMax = 0;
                }
                if (LastRow != null) //if Last row was not null means last chartype was Official and current row is not personal
                {

                    LastRow = null;
                    BarCount++;
                    PersonalYAxisMax = Convert.ToDouble(DR1["CurrentCharges"]);


                    if (YAxisMaximum < (PersonalYAxisMax + OfficialYAxisMax)) YAxisMaximum = PersonalYAxisMax + OfficialYAxisMax;
                    OfficialYAxisMax = 0;
                    PersonalYAxisMax = 0;
                }
                else //if last row was null mean last row was not official
                {
                    if (DR1["ChartType"].ToString() == "RequestCount") //if Official is missing
                    {
                        LastRow = null;
                        BarCount++;
                        PersonalYAxisMax = Convert.ToDouble(DR1["CurrentCharges"]);

                        if (YAxisMaximum < PersonalYAxisMax) YAxisMaximum = PersonalYAxisMax;
                        OfficialYAxisMax = 0;
                        PersonalYAxisMax = 0;
                    }
                    else //if Current is offical and next might be personal 
                    {
                        LastRow = DR1;
                        OfficialYAxisMax = Convert.ToDouble(DR1["CurrentCharges"]);
                        PersonalYAxisMax = 0;
                    }

                }
            }
            XAxisMaximum = (BarCount * 20) + 10;
            YAxisMaximum = YAxisMaximum + ((YAxisMaximum / 100) * 5); //add 5 percent to The calculated YAxis
            int ChartWidth = (BarCount * 50) + 125;//extra 125 for area outside chart area and other 125 for legend box

            CustomChart.Size = (Convert.ToInt32(ChartWidth)).ToString() + "x400";
            string MonthName = "", BusinessUnit = "";
            if (dtChart.Rows.Count > 0)
            {
                MonthName = dtChart.Rows[0]["MonthName"].ToString();
                BusinessUnit = dtChart.Rows[0]["BusinessUnit"].ToString();
            }
            IEnumerator enumerator = dtChart.Rows.GetEnumerator();
            DataRow DR = null;
            SeriesCollection SC = new SeriesCollection();
            bool IsLastRecord = enumerator.MoveNext();
            int Count = 1, MonthStart = 1, BUStart = 1;

            CustomChart.XAxis.Scale = Scale.Normal;
            CustomChart.XAxis.NumberPrecision = 0;
            CustomChart.XAxis.Maximum = XAxisMaximum;// XAxisMaximum;
            CustomChart.XAxis.Maximum = YAxisMaximum;
            CustomChart.XAxis.SpacingPercentage = 10;
            Element LastElement = null;
            Series LastSeries = null;
            while (IsLastRecord)
            {
                DR = (DataRow)enumerator.Current;
                BusinessUnit = DR["BusinessUnit"].ToString();

                BUStart = Count;
                while (DR["BusinessUnit"].ToString() == BusinessUnit)
                {
                    MonthName = DR["MonthName"].ToString();
                    if (LastSeries != null)
                    {
                        Count++;
                        LastSeries = null;
                    }
                    MonthStart = Count;

                    while (DR["MonthName"].ToString() == MonthName)
                    {
                        Series series = new Series();

                        series.EmptyElement.Mode = EmptyElementMode.Ignore;
                        Element element = new Element();
                        series.Name = DR["ChartType"].ToString();
                        element.ToolTip = string.Format("{0} - {1} - {2} : %YValue", BusinessUnit, MonthName, DR["ChartType"].ToString());

                        if (LastSeries != null) //has element before (personal)
                        {

                            element.YValue = Convert.ToDouble(DR["CurrentCharges"]);
                            series.YAxis = LastSeries.YAxis;
                            series.XAxis = LastSeries.XAxis;
                            series.Elements.Add(element);
                            element.XValue = (LastSeries.Elements[0].XValue);

                            // element.Color = ColorTranslator.FromHtml("#F78800"); //GetBUColor(DR["BusinessUnit"].ToString());

                            Annotation AnnotationTotal = new Annotation("Total: " + (LastSeries.Elements[0].YValue + element.YValue).ToString());
                            // Set the dotnetCHARTING.Orientation.
                            AnnotationTotal.Orientation = dotnetCHARTING.Orientation.Top;
                            element.Annotation = AnnotationTotal;
                            LastSeries = null;
                        }
                        else //new element (official)
                        {
                            series.YAxis = new Axis();
                            series.YAxis.Maximum = YAxisMaximum;
                            series.XAxis = new Axis();
                            series.XAxis.Maximum = XAxisMaximum;//XAxisMaximum;
                            series.YAxis.Scale = Scale.Stacked;

                            if (Count > 1) // clear all Axis except first one
                            {
                                series.YAxis.Clear();
                                series.XAxis.Clear();

                            }
                            else //if first Series
                            {

                                CustomChart.XAxis = series.XAxis; //assign the first 
                            }
                            element.ToolTip = string.Format("{0} - {1} - {2} : %YValue", BusinessUnit, MonthName, DR["ChartType"].ToString());
                            element.YValue = Convert.ToDouble(DR["CurrentCharges"]);
                            element.XValue = ((Count) * 10) + 4;
                            series.Elements.Add(element);

                            if (DR["ChartType"].ToString() == "Hit")//if official element is not missing
                            {
                                LastSeries = series; //save it to get YAxis settings for the next personal element
                                                     // element.Color = GetBUColor(DR["BusinessUnit"].ToString() + " " + DR["ChartType"].ToString());



                            }
                            else //if Official Element is missing
                            {
                                Count++; //then add space for official element
                                         //   element.Color = ColorTranslator.FromHtml("#F78800"); //GetBUColor(DR["BusinessUnit"].ToString()); //GetColor without official

                            }

                        }//end of if statement
                        element.SmartLabel.Text = DR["ChartType"].ToString();
                        element.ShowValue = true;
                        series.XAxis.StaticColumnWidth = 40;
                        Count++;
                        CustomChart.SeriesCollection.Add(series);
                        IsLastRecord = enumerator.MoveNext();
                        if (!IsLastRecord)
                        {
                            break;
                        }
                        DR = (DataRow)enumerator.Current;
                    }//end of last column(MonthName)
                    if (LastSeries != null)
                    {
                        AxisTick tick = new AxisTick((MonthStart * 10) - 4, ((Count) * 10) + 4, MonthName.Substring(0, 3));
                        CustomChart.XAxis.ExtraTicks.Add(tick);

                    }
                    else
                    {
                        AxisTick tick = new AxisTick((MonthStart * 10) - 4, ((Count - 1) * 10) + 4, MonthName.Substring(0, 3));
                        CustomChart.XAxis.ExtraTicks.Add(tick);
                    }
                    if (!IsLastRecord)
                    {
                        break;
                    }
                }//end of second column(BussinessUnit)

                AxisTick tick2 = new AxisTick((BUStart * 10) - 4, ((Count - 1) * 10) + 4, BusinessUnit);
                //  tick2.SetAllColors(GetBUColor(BusinessUnit + " Official"));
                tick2.Label.Font = new Font(tick2.Label.Font.Name, tick2.Label.Font.Size, FontStyle.Bold);
                CustomChart.XAxis.ExtraTicks.Add(tick2);
            }//end of main loop
            CustomChart.XAxis.Clear();


        }

        Color GetBUColor(string BusinessUnit)
        {

            if (dtBUColors == null)
            {
                using (SqlConnection Conn = CUtilityWeb.getConnection(CUtilityWeb.ConnType.eFormsDB))
                //using (OleDbConnection Conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["eFormsDBConnectionString"].ConnectionString))
                {
                    dtBUColors = CUtilityWeb.getDataTable(@"
                    SELECT     ColorKey, Color
                    FROM         RPTChartEngineColorPalette
                    WHERE     (PaletteName = 'BusinessUnits')
                ", Conn);
                }
            }
            DataRow[] SelectColors = dtBUColors.Select("ColorKey='" + BusinessUnit + "'");
            if (SelectColors.Length > 0)
                return ColorTranslator.FromHtml(SelectColors[0]["Color"].ToString());
            else
                return Color.Black;

        }

        public void BuildCustomURL(ref Chart ChartControl)
        {
            _Chart = ChartControl;
            InvokeCustomURLDelegate(_CustomChartId, this);
            //CustomURLInvokeListHandler CustomerURLInvoker = CustomURLDelegate(_CustomChartId,this);
            //CustomerURLInvoker.Invoke();

        }
        private static void InvokeCustomURLDelegate(string CustomChartId, CustomChart CustomChartObject)
        {
            if (_CustomURLInvokeList == null)
            {
                _CustomURLInvokeList = new Dictionary<string, string>();
                _CustomURLInvokeList.Add("gphRecruitmentKPI", "CustomURLRecruitmentKPI"); //CustomerChartObject.CustomURLRecruitmentKPI);
            }
            if (_CustomURLInvokeList.ContainsKey(CustomChartId))
            {
                Type CustomChartType = typeof(CustomChart);
                CustomChartType.InvokeMember(_CustomURLInvokeList[CustomChartId],
                                            BindingFlags.NonPublic | BindingFlags.Instance | BindingFlags.InvokeMethod,
                                            null, CustomChartObject, null);

                //return _CustomURLInvokeList[CustomChartId];
            }
            else
            {
                throw new Exception(string.Format("Custom ChartId not found for chart {0}!", CustomChartId));
            }
        }
        private void CustomURLRecruitmentKPI()
        {

            foreach (Series series in _Chart.SeriesCollection)
            {
                foreach (Element element in series.Elements)
                {
                    if (element.Name == "GIL")
                    {
                        element.URL = _Chart.DefaultElement.URL.Replace("::NextReportID::", "RecruitmentGILSubBUKPI");
                    }
                    else
                    {
                        element.URL = _Chart.DefaultElement.URL.Replace("::NextReportID::", "RecruitmentDeptKPIByBU");

                    }
                }
            }
        }

    }
}
