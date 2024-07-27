using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace WebProject
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
   
        public void Session_OnStart()
        {
            // Example code to initialize session-specific data
            // Here you can add code to initialize session variables or perform logging

            // Initialize a new session variable
            Session["StartTime"] = DateTime.Now;

            // Log session start event (Example: using a custom logging method)
            LogSessionEvent("Session started at " + Session["StartTime"] );
        }

        public void Session_OnEnd()
        {

            // Example code to handle session end
            // Here you can add code to perform cleanup or log session end

            // Log session end event (Example: using a custom logging method)
            LogSessionEvent("Session ended at " + DateTime.Now);
        }

        // Example method to log session events
        private void LogSessionEvent(string message)
        {
            // You might want to write logs to a file or database
            // For simplicity, we are using the Trace facility here
            //System.Diagnostics.Trace.WriteLine(message);

            //string user = HttpContext.Current.User?.Identity?.Name ?? "Anonymous";
            string sessionId = Session.SessionID;
            string logMessage = $"{message}, User: , Session ID: {sessionId}";
            Trace.WriteLine(logMessage);
        }
    }
}