using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebProject
{

    public static class Constants
    {
        public class CSSFiles
        {
            public class Bootstrap
            {
                public const string CORE = "Assets/css/bootstrap.min.css";
                public const string FONTAWESOME = "Assets/fonts/font-awesome-4.4.0/css/font-awesome.min.css";
                public const string Linearicons = "Assets/Linearicons/demo-files/LineariconsGI.css";
                public const string OPENSANS_FONT = "Assets/fonts/opensans/opensans.css";
            }

            public class JQuery
            {
                //public const string UI_ALL = "Assets/fonts/opensans/opensans.css";
            }

            public class FXRESPONSIVE
            {
                public const string SMARTADMIN_PLUGIN = "Assets/css/smartadmin-production-plugins.min.css";
                public const string SMARTADMIN_PRODUCTION = "Assets/css/smartadmin-production.min.css";
                //public const string SMARTADMIN_SKINS = "Assets/css/smartadmin-skins.min.css";
                //public const string SMARTADMIN_RTL = "Assets/css/smartadmin-rtl.min.css";
                public const string UISTYLES = "Assets/UIStyles.css";
                public const string FxUICommonCSS = "Assets/FxUICommonCSS.css";
                //public const string SCROLLBAR = "Assets/css/jquery.mCustomScrollbar.min.css";
                //public const string TourGlobalInbox = "Assets/css/powertour.3.0.0.css";
            }
        }

        public class ScriptFiles
        {
            public class JQuery
            {
                public const string CORE = "Assets/js/jquery.min.js";
                public const string UI_ALL = "Assets/js/jquery-ui.min.js";
                public const string APPCONFIG = "Assets/js/app.config.js";
                public const string APPMIN = "Assets/js/app.min.js";

                //public const string GRID = "Script/jquery.jqGrid-4.4.4/js/jquery.jqGrid.src.js";
                //public const string GRID_EN = "Assets/js/plugin/jqgrid/grid.locale-en.min.js";

                //public const string SPARKLINE = "Assets/js/plugin/sparkline/jquery.sparkline.min.js";
                //public const string VALIDATE = "Assets/js/plugin/jquery-validate/jquery.validate.min.js";
                //public const string MASKEDINPUT = "Assets/js/plugin/masked-input/jquery.maskedinput.min.js";

                public const string TOUCH = "Assets/js/plugin/jquery-touch/jquery.ui.touch-punch.min.js";
                //public const string BROWSER_DETECTION = "Assets/js/plugin/msie-fix/jquery.mb.browser.min.js";
                public const string FASTCLICK = "Assets/js/plugin/fastclick/fastclick.min.js";

                //datatable files
                public const string DATATABLE = "Assets/js/plugin/datatables/jquery.dataTables.min.js";
                public const string DATATABLE_RESPONSIVE = "Assets/js/plugin/datatable-responsive/datatables.responsive.min.js";
                public const string COLUMNFILTER = "Scripts/GlobalInbox/jquery.dataTables.columnFilter.js";
                public const string FNFILTERCLEAR = "Scripts/GlobalInbox/fnFilterClear.js";

                //public const string DATATABLE_TOOlS = "Assets/js/plugin/datatables/dataTables.tableTools.min.js";
                public const string DATATABLE_BOOTSTRAP = "Assets/js/plugin/datatables/dataTables.bootstrap.min.js";

                //public const string SCROLLBAR = "Assets/js/jquery.mCustomScrollbar.js";
                //public const string GRID_COMMON = "Scripts/jquery.jqGrid.common.js";
                //public const string MIGRATE = "Script/jquery-migrate-1.1.1.js";
                //public const string TourGlobalInbox_Js = "Scripts/GlobalInbox/GlobalInboxTour.js";
                //public const string TourGlobalInbox = "Assets/js/powertour.3.0.0.js";

                public const string RAPHAEL = "Scripts/GlobalInbox/raphael-2.1.4.min.js";
                public const string JUSTGAGE = "Scripts/GlobalInbox/justgage-1.1.0.min.js";
                //public const string CHARTJS = "Assets/js/plugin/chartjs/chart.min.js";

            }

            public class Bootstrap
            {
                public const string CORE = "Assets/js/bootstrap/bootstrap.min.js";
                //public const string SLIDER = "Assets/js/plugin/bootstrap-slider/bootstrap-slider.min.js";
                //public const string MAXLENGTH = "Assets/js/plugin/maxlength/bootstrap-maxlength.min.js";
            }

            public class FXRESPONSIVE
            {
                //public const string JQUERY_COOKIE = "JQuery/MenuCookie/jquery_cookie.js";
                public const string SESSION_EXPIRE = "JQuery/SessionExpired.js";
                public const string SMARTNOTIFICATION = "Assets/js/notification/SmartNotification.min.js";
                // public const string WIDGETS = "Assets/js/smartwidgets/jarvis.widget.min.js";

            }

            public class GlobalInbox
            {
                //public const string COMMON_LIBRARY_HEAD = "Script/Common.Head.js";
                //public const string COMMON_SITE_COMMON = "Scripts/SiteCommon.aspx";
                //public const string COMMON_LIBRARY = "Script/Common.js";
                //public const string MULTI_CULTURE_SUPPORT = "Scripts/MultiCulture.js";
                //public const string TABS = "Scripts/tabs.js";
                //public const string COMMON_VALIDATION = "Script/CommonValidation.js";
                //public const string GLOBAL_FUNCTION = "Script/GlobalFunction.js";
                //public const string SPATTACHMENT = "Scripts/GlobalInbox/SPAttachmentsGI.js";
                public const string GLOBALINBOXDATATABLE = "Scripts/GlobalInbox/GlobalInboxDataTable.js";
                public const string ASYNGLOBALINBOX = "Scripts/GlobalInbox/AsyncListGlobalInbox.js";
                public const string WIDGETS = "Scripts/GlobalInbox/Widgets.js";
                // public const string ADVAJCESEARCU = "Scripts/GlobalInbox/SaveAdvSearch.js";



            }

        }

        public class SessionVariableNames
        {
            #region FRAMEWORK SESSION VARIABLES

            //public const string THEMEID = FWConstants.SessionVariableNames.THEMEID;
            //public const string USER_LANGUAGE = FWConstants.SessionVariableNames.USER_LANGUAGE;
            //public const string AUTHENTICATED = FWConstants.SessionVariableNames.AUTHENTICATED;
            //public const string DIRECTION = FWConstants.SessionVariableNames.DIRECTION;
            //public const string PASSWORD = FWConstants.SessionVariableNames.PASSWORD;
            //public const string ROLES = FWConstants.SessionVariableNames.ROLES;
            //public const string USER_ID = FWConstants.SessionVariableNames.USER_ID;

            public const string USER_ID = "UserId";
            public const string PASSWORD = "password";
            public const string AUTHENTICATED = "Authenticated";
            public const string USER_LANGUAGE = "UserLanguage";
            public const string DIRECTION = "Direction";
            public const string THEMEID = "ThemeId";
            public const string ROLES = "Roles";

            #endregion FRAMEWORK SESSION VARIABLES

            #region USER DEFINED SESSION VARIABLES

            public const string USER_FULLNAME = "UserFullName";

            #endregion USER DEFINED SESSION VARIABLES
        }

        public class DataNames
        {
            public class FWDataMembersNames
            {
                public class User
                {
                    public const string FIRSTNAME = "FirstName";
                }
            }
        }


    }

}