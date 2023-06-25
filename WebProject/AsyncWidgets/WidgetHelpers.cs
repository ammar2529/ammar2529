using System;
using System.Collections.Generic;
using System.Web;
using Newtonsoft.Json;

namespace WebProject.AsyncWidgets
{
    public interface IRemoteActionInvoker
    {
        object InvokeAction(string ActionToExecute);
        object InvokeAction();
    }
    public interface IStateableWidget
    {
        WidgetState WidgetState();
    }
    public class WebResponse
    {
        public string Status;
        public WidgetState State;
        public string WidgetHTML;
        public string JavaScript;

        public bool UpdateState;
        public bool UpdateHtml;
        public bool UpdateJS;

        public string ActionExecuted;
        public string GetJSONResponse(string Status, object State, string WidgetHTML)
        {
            return JsonConvert.SerializeObject(this, Formatting.Indented);
        }

    }
    public class WebResponseMsg
    {
        public string Status;
        public string Message;
    }

    public class WidgetState
    {

        public string
            WidgetId = null,
            WidgetType = null,
            Controller = null,
            Facade = null,
            FacadePath = null;

    }
}