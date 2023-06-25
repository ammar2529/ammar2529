using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.Reflection;
using System.ComponentModel;
using WebProject.AsyncWidgets.UI.Widgets;

namespace WebProject.AsyncWidgets.Widgets
{
    public partial class TabPanel : System.Web.UI.UserControl
    {
       
           string _conf = "{{WidgetId:'{0}',WidgetType:'TabPanel',AutoInit:false,Tabs:'{1}',AutoBuild:{2}}}";
        WebResponse _WebResponse;
        TabPanelState _WidgetState;
        string _Action;

        string _EmptyHeight;
        [Browsable(true), DefaultValue("200px"), Category("Appearence")]
        public string EmptyHeight { get { return _EmptyHeight; } set { _EmptyHeight = value; } }

        bool _AutoBuild = true;
        [Browsable(true), Category("Appearence")]
        public bool AutoBuild
        {
            get { return _AutoBuild; }
            set
            {
                _AutoBuild = value;
            }
        }
        string _Tabs;
        [Browsable(true), Category("Appearence"), DefaultValue("")]
        public string Tabs
        {
            get { return _Tabs; }
            set
            {
                _Tabs = value;
            }
        }
        bool _Hidden;
        [Browsable(true), Category("Appearence"), DefaultValue(false)]
        public bool Hidden { get { return _Hidden; } set { _Hidden = value; } }

        private ITemplate _Scripts;
        [TemplateContainer(typeof(ScriptContainer))]
        [PersistenceMode(PersistenceMode.InnerProperty)]
        public ITemplate Scripts
        {
            get
            {
                return _Scripts;
            }
            set
            {
                _Scripts = value;
            }
        }
        public TabPanel()
        {
            //  System.Web.UI.Design.WebControls
        }
        public TabPanel(string WidgetState, string Action, WebResponse WebResponse)
        {
            _WebResponse = WebResponse;
            _WebResponse.ActionExecuted = Action;
            _WidgetState =
            JsonConvert.DeserializeObject<TabPanelState>(WidgetState);
            _Action = Action;

            _WebResponse.UpdateHtml = true;

        }
        protected override void OnInit(EventArgs e)
        {
            HttpContext ctx = HttpContext.Current;
            base.OnInit(e);
            ContainerHolder.Controls.Clear();
            //  loadHTML = ctx.Request.QueryString["LoadHtml"] != null;

            //if both LoadHTML and lazyloading are true or false then execute else don't execute (XOR)
            if ((_Scripts != null)
               //&&
               //((loadHTML && _LazyLoading) ||
               //(!loadHTML && !_LazyLoading))
               )
            {
                ScriptContainer container = new ScriptContainer("pre");
                _Scripts.InstantiateIn(container);
                WPNL.Controls.Add(container);
            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {

            if (_Action != null) //if async call
            {
                //  System.Threading.Thread.Sleep(2000);
                //   System.Threading.Thread.Sleep(3000);

                WPNL.Visible = false;
                AsyncPNL.Visible = true;
                InvokeAction();
            }
            else // if first call(non-async)
            {
                WPNL.Attributes.Add("conf", string.Format(_conf, ID, Tabs, _AutoBuild.ToString().ToLower()));
                WPNL.Attributes.Add("EmptyHeight", EmptyHeight);
                if (_Hidden) WPNL.Style.Add("display", "none");

                // WPNL.Attributes.Add("prejs", "[{path:'/Scripts/',	files:['jquery.ui.core.js','jquery.ui.widget.js','jquery.ui.datepicker.js','jquery.alphanumeric.js']}]");

                // WPNL.Attributes.Add("postjs", "[{path:'/Scripts/',	files:['home.js']}]");
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
    public class TabPanelState : WidgetState
    {

    }



}