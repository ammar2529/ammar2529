using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NLog;
using NLog.Fluent;

namespace WebProject
{
    public partial class NLogTestFile : System.Web.UI.Page
    {
        private static readonly Logger Logger = LogManager.GetCurrentClassLogger();
        protected void Page_Load(object sender, EventArgs e)
        {
            var conf = LogManager.Configuration;
            Logger.Info("testing log file");
            Log.Info("with using logmanager");
           // Logger
        }
    }
}