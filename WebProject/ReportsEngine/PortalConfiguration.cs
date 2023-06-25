using System;
using System.Collections.Generic;
using System.Web;
namespace WebProject.ReportsEngine
{

    /// <summary>
    /// Summary description for PortalConfiguration
    /// </summary>
    public class PortalConfiguration
    {
        public PortalConfiguration()
        {

        }
        public static string WidgetsPath
        {
            get { return "~/ReportsEngine/ReportWidgetControls/"; }
        }
        public static string DesignerWidgetsPath
        {
            get { return "~/ReportsEngine/ReportDesigner/"; }
        }
        public static string FusionMapsPath
        {
            get { return "~/ReportsEngine/FusionMaps/"; }
        }
        public static string FusionChartsPath
        {
            get { return "~/ReportsEngine/FusionCharts/"; }
        }
        public static string AsyncWidgetsPath
        {
            get { return "~/AsyncWidgets/"; }
        }

        public static string ImagesPath
        {
            get { return "~/App_Themes/eForms_Theme/Images/"; }
        }


    }
}