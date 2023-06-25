using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.Reflection;


namespace WebProject.AsyncWidgets.Widgets
{
    public partial class Logout : System.Web.UI.UserControl, IRemoteActionInvoker
    {

        string _conf = "{{WidgetId:'{0}',WidgetType:'Logout',AutoInit:false}}";
        WebResponse _WebResponse;
        LogoutState _WidgetState;
        string _Action;

        public Logout()
        {
            //  System.Web.UI.Design.WebControls
        }
        public Logout(string WidgetState, string Action, WebResponse WebResponse)
        {
            _WebResponse = WebResponse;
            _WebResponse.ActionExecuted = Action;
            _WidgetState =
            JsonConvert.DeserializeObject<LogoutState>(WidgetState);
            _Action = Action;

            _WebResponse.UpdateHtml = true;

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (_Action != null) //if async call
            {
                WPNL.Visible = false;
                AsyncPNL.Visible = true;
                InvokeAction();
            }
            else // if first call(non-async)
            {
                WPNL.Attributes.Add("conf", string.Format(_conf, ID));
                //WPNL.Attributes.Add("prejs", "[{path:'/Scripts/',	files:['jquery.ui.core.js','jquery.ui.widget.js','jquery.ui.datepicker.js','jquery.alphanumeric.js']}]");
                //WPNL.Attributes.Add("postjs", "[{path:'/Scripts/',	files:['home.js']}]");
                // WPNL.Attributes.Add("style", WidgetStyle);
                //if (_EmptyHeight != "") WPNL.Attributes.Add("EmptyHeight", _EmptyHeight);
                WPNL.Visible = true;
                AsyncPNL.Visible = false;
            }
        }

        public object InvokeAction()
        {
            // System.Threading.Thread.Sleep(5000);
            Type type = this.GetType();
            // ((string)type.GetMethod(Action).Invoke(this, null)); //new object[] { ServiceInfo }));
            MethodInfo Action = type.GetMethod(_Action);
            if (Action != null)
                return Action.Invoke(this, null); //new object[] { ServiceInfo }));
            else
                return null;

        }
        public object InvokeAction(string ActionToExecute)
        {
            Type type = this.GetType();
            // ((string)type.GetMethod(Action).Invoke(this, null)); //new object[] { ServiceInfo }));
            MethodInfo Action = type.GetMethod(ActionToExecute);
            if (Action != null)
                return Action.Invoke(this, null); //new object[] { ServiceInfo }));
            else
                return null;
            // System.Threading.Thread.Sleep(2000);
        }
    }



public class LogoutState : WidgetState
    {

    }

}