using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Services;
using System.Web.Script.Services;
using System.Web.Script.Serialization;
using Newtonsoft.Json;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Reflection;
using System.Threading;
using System.Web.UI.WebControls;
using HtmlAgilityPack;
using System.Diagnostics;
using WebProject.AsyncWidgets.BAL;

namespace WebProject.AsyncWidgets.WebServices
{
    /// <summary>
    /// Summary description for RemoteActions
    /// </summary>

    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [ScriptService]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class RemoteActions : System.Web.Services.WebService
    {

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string DoAction(string ActorId, string ActionId, string ServiceInfo)
        
        {
            // System.Threading.Thread.Sleep(5000);
            //System.IO.StreamWriter LogFileSW;
            ////LogFileSW = System.IO.File.AppendText("c:\\temp\\TraceLogFile.txt");
            //LogFileSW = System.IO.File.AppendText("c:\\Inetpub\\wwwroot\\AgeFormsOraServices\\TraceLogFile.txt");
            //LogFileSW.WriteLine(DateTime.Now + "\t-----\t" + "");

            //LogFileSW.Flush();
            //LogFileSW.Close();
            //LogFileSW = null;
            string Response = @"{{status:""{0}"" {1}}}", ret;
            try
            {
                var session =  System.Web.HttpContext.Current.Session;
                if (session["UserId"]==null && ActorId!= "Authentication")
                {
                    return string.Format(Response, "UserNotLoggedIn", ",Response:{Message:'User Not Logged in'}");
                }
                object obj = ActorFacade.ExecuteAction(ActorId, ActionId, ServiceInfo);
                if (obj.GetType().Name != "String")
                {
                    ret = JsonConvert.SerializeObject(obj);
                }
                else
                {
                    ret = obj.ToString();
                }

                return string.Format(Response, "OK", ",Response:" + ret);
            }
            catch (Exception ex)
            {

                return string.Format(Response, "Exception",
                                string.Format(",detail:{{message:'{0}',stackTrace:'{1}'}}",
                                // ex.Message.Replace(@"\", @"\\").Replace("'", "\'"), ex.StackTrace.Replace(@"\", @"\\").Replace("'", "\'"))
                                ex.Message.Replace("'", @"\'").Replace("\r\n", @"\n"), ex.StackTrace.Replace("'", @"\'").Replace("\r\n", @"\n")
                             ));
            }
        }
        string WidgetsPath = "~/AsyncWidgets/Widgets/";
        [WebMethod(EnableSession = true)]
        public WebResponse ExeControllerAction(string Controller, string WidgetState, string Action)
        {
            WebResponse wr = new WebResponse();
            System.Web.UI.UserControl Widget = null;
            try
            {
                Widget = LoadControl(WidgetsPath + Controller + ".ascx", WidgetState, Action, wr);
                wr.WidgetHTML = RenderUserControl(Widget);
            }
            catch (Exception ex)
            {
                wr.WidgetHTML = "Remote widget request failed to execute!";
            }
            return wr;
        }
        [WebMethod(EnableSession = true)]
        public WebResponseMsg ExeControllerMsgAction(string Controller, string WidgetState, string Action)
        {
            WebResponseMsg wrm = new WebResponseMsg();
            System.Web.UI.UserControl Widget = null;
            try
            {
                Widget = LoadControl(WidgetsPath + Controller + ".ascx",
                                                                WidgetState, Action);

                wrm.Message = ((IRemoteActionInvoker)Widget).InvokeAction().ToString();
                wrm.Status = "OK";
                return wrm;
            }
            catch (Exception ex)
            {
                wrm.Status = "Failed";
                wrm.Message = "Remote widget request failed to execute!";

            }

            return wrm;
        }
        [WebMethod(EnableSession = true)]
        public WebResponse ExeControllerActionSessioned(string Controller, string WidgetState, string Action)
        {
            WebResponse wr = new WebResponse();
            System.Web.UI.UserControl Widget = null;
            try
            {
                Widget = LoadControl(WidgetsPath + Controller + ".ascx", WidgetState, Action, wr);
                wr.WidgetHTML = RenderUserControl(Widget);
            }
            catch (Exception ex)
            {
                wr.WidgetHTML = "Remote widget request failed to execute!";
            }
            return wr;
        }
        [WebMethod(EnableSession = true)]
        public WebResponseMsg ExeControllerMsgActionSession(string Controller, string WidgetState, string Action)
        {
            WebResponseMsg wrm = new WebResponseMsg();
            System.Web.UI.UserControl Widget = null;
            try
            {
                Widget = LoadControl(WidgetsPath + Controller + ".ascx",
                                                                WidgetState, Action);

                wrm.Message = ((IRemoteActionInvoker)Widget).InvokeAction().ToString();
                wrm.Status = "OK";
                return wrm;
            }
            catch (Exception ex)
            {
                wrm.Status = "Failed";
                wrm.Message = "Remote widget request failed to execute!";

            }

            return wrm;
        }
        public string RenderUserControl(UserControl Widget)//string path, params object[] Parameters)
        {
            // Page pageHolder = new Page();
            Page pageHolder = Widget.Page;

            HtmlForm HTMLForm = new HtmlForm();
            HtmlGenericControl div = new HtmlGenericControl("DynamicUserControl");
            div.Controls.Add(Widget);
            HTMLForm.Controls.Add(div);
            pageHolder.Controls.Add(HTMLForm);
            pageHolder.DesignerInitialize();
            using (System.IO.StringWriter output = new System.IO.StringWriter())
            {
                HttpContext.Current.Server.Execute(pageHolder, output, false);
                int UserControlStartIndex, UserControlEndIndex;
                string UCRenderedHtml = output.ToString();
                UserControlStartIndex = UCRenderedHtml.IndexOf("<DynamicUserControl>") + "<DynamicUserControl>".Length;
                UserControlEndIndex = UCRenderedHtml.IndexOf("</DynamicUserControl>");//- "</DynamicUserControl>".Length + 1;
                return UserControlStartIndex < UserControlEndIndex ?
                    UCRenderedHtml.Substring(UserControlStartIndex, UserControlEndIndex - UserControlStartIndex) : "";
            }
        }
        private UserControl LoadControl(string UserControlPath, params object[] constructorParameters)
        {
            Page _Page = new Page();
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

        [WebMethod(EnableSession = true)]
        public WebResponse GetWidgetHTML(string PageName, string WidgetId, string LazyType, string SessionLC, string AnonymousLC)
        {
            HttpContext ctx = HttpContext.Current;
            HtmlDocument doc = new HtmlDocument();
            StringWriter sw = new StringWriter();

            Session[Session.SessionID + "_Default"] = sw.ToString();
            string Uri = ctx.Request.UrlReferrer.AbsoluteUri,
                   LocalPath = ctx.Request.UrlReferrer.LocalPath;
            if (LocalPath == "/")
            {
                LocalPath = "/Default.aspx";
                Uri += "Default.aspx";
            }
            string[] tmp = Uri.Split(new char[] { '/' });
            bool UserLogged = Session["UserId"] != null;

            string callingPage = "", callingPath, UniquePageId = LocalPath.Replace('/', '_').Replace('.', '_');
            if (tmp.Length > 0)
            {

                callingPage = tmp[tmp.Length - 1].Split(new char[] { '?' })[0];
            }
            //if (ctx.Request.UrlReferrer.LocalPath == "/")
            //{
            //    callingPath = "Default.aspx";
            //}
            //else
            //{
            callingPath = LocalPath.Substring(0, LocalPath.LastIndexOf(callingPage));
            //}
            callingPage = callingPage.Replace(".aspx", "");
            SessionLC = SessionLC == "" ? callingPage : SessionLC;
            SessionLC = callingPath + SessionLC + "_Lazy_Logged.aspx";

            AnonymousLC = AnonymousLC == "" ? callingPage : AnonymousLC;
            AnonymousLC = callingPath + AnonymousLC + "_Lazy.aspx";
            string LCHtml = ""; //Lazy Container HTML
            if (LazyType.ToLower() == "anonymous" || !UserLogged) //if User not logged or lazytype is Anonymous
            {

                resetApp(UniquePageId);
                if (Application[UniquePageId] == null)
                {
                    try
                    {
                        ctx.Server.Execute(AnonymousLC + "?LoadHtml=true", sw);
                    }
                    catch (Exception ex)
                    {
                        string msg = ex.Message;
                    }
                    Application.Lock();
                    Application[UniquePageId] = LCHtml = sw.ToString();
                    Application.UnLock();
                }
                else
                {
                    LCHtml = Application[UniquePageId].ToString();
                }

            }
            else //if User is logged and lazytype is not Anonymous
            {
                resetSession(UniquePageId);
                if (Session[UniquePageId] == null)
                {

                    try
                    {
                        ctx.Server.Execute(SessionLC + "?LoadHtml=true", sw);
                    }
                    catch (Exception ex)
                    {
                        string msg = ex.Message;
                    }

                    Session[UniquePageId] = LCHtml = sw.ToString();
                }
                else
                {
                    LCHtml = Session[UniquePageId].ToString();
                }
            }
            doc.LoadHtml(LCHtml);
            HtmlNode wg = doc.DocumentNode.SelectSingleNode("//div[@widgetid='" + WidgetId + "']");
            WebResponse wr = new WebResponse();
            wr.WidgetHTML = wg.InnerHtml;


            return wr;
        }

        [Conditional("DEBUG")]
        void resetApp(string UniquePageId)
        {
            Application[UniquePageId] = null;
        }
        [Conditional("DEBUG")]
        void resetSession(string UniquePageId)
        {
            Session[UniquePageId] = null;
        }
    }

}
