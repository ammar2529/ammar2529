using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using System.Reflection;
using System.ComponentModel;
using WebProject.AsyncWidgets.UI.Widgets;

namespace WebProject.AsyncWidgets.Widgets
{
    public partial class Form : System.Web.UI.UserControl
    {

        string _conf = "{{WidgetId:'{0}',WidgetType:'Form',AutoInit:false,DALInfo:'{1}',RelativeKeys:'{2}',RequiresLogin:{3},LazyLoading:{4},LazyType:'{5}',SessionLC:'{6}',AnonymousLC:'{7}',Hidden:{8},ShowOnLoad:{9},LoadOnInit:{10}}}";
        WebResponse _WebResponse;
        FormState _WidgetState;
        string _Action;
        bool loadHTML;
        string _EmptyHeight = "200px";
        [Browsable(true), DefaultValue("200px"), Category("Appearence")]
        public string EmptyHeight { get { return _EmptyHeight; } set { _EmptyHeight = value; } }

        string _AsyncForm = null;
        [Browsable(true), Category("Appearence")]
        public string AsyncForm
        {
            get { return _AsyncForm; }
            set
            {
                _AsyncForm = value;
            }
        }

        string _DataSource;
        [Browsable(true), Category("Data")]
        public string DataSource { get { return _DataSource; } set { _DataSource = value; } }


        bool _Hidden;
        [Browsable(true), Category("Appearence"), DefaultValue(false)]
        public bool Hidden
        {
            get { return _Hidden; }
            set
            {
                _Hidden = value;
            }
        }
        bool _AutoInstance = true;
        [Browsable(true), Category("Appearence"), DefaultValue(true)]
        public bool AutoInstance
        {
            get { return _AutoInstance; }
            set
            {
                _AutoInstance = value;
            }
        }
        string _RelativeKeys;
        [Browsable(true), Category("Appearence")]
        public string RelativeKeys
        {
            get { return _RelativeKeys; }
            set
            {
                _RelativeKeys = value;
            }
        }
        string _SelectCommand;
        [Browsable(true), Category("Appearence")]
        public string SelectCommand
        {
            get { return _SelectCommand; }
            set
            {
                _SelectCommand = value;
            }
        }
        bool _RequiresLogin = false;
        [Browsable(true), Category("Appearence")]
        public bool RequiresLogin
        {
            get { return _RequiresLogin; }
            set
            {
                _RequiresLogin = value;
            }
        }
        bool _LazyLoading = false;
        [Browsable(true), Category("Lazy Loading"), DefaultValue("true")]
        public bool LazyLoading { get { return _LazyLoading; } set { _LazyLoading = value; } }

        LazyLoadType _LazyType = LazyLoadType.Anonymous;
        [Browsable(true), Category("Lazy Loading"), DefaultValue(LazyLoadType.Anonymous)]
        public LazyLoadType LazyType { get { return _LazyType; } set { _LazyType = value; } }

        //Session Lazy Container
        string _SessionLC = "";
        [Browsable(true), Category("Lazy Loading"), DefaultValue("")]
        public string SessionLC { get { return _SessionLC; } set { _SessionLC = value; } }

        //Anonymous Lazy Container
        string _AnonymousLC = "";
        [Browsable(true), Category("Lazy Loading"), DefaultValue("")]
        public string AnonymousLC { get { return _AnonymousLC; } set { _AnonymousLC = value; } }

        bool _RoleBased = false;
        [Browsable(true), Category("Lazy Loading"), DefaultValue("")]
        public bool RoleBased { get { return _RoleBased; } set { _RoleBased = value; } }

        bool _ShowOnLoad = false;
        [Browsable(true), Category("Show The widget when its loaed"), DefaultValue("true")]
        public bool ShowOnLoad { get { return _ShowOnLoad; } set { _ShowOnLoad = value; } }

        bool _LoadOnInit = true;
        [Browsable(true), Category("Load widget when it is instantiated"), DefaultValue("true")]
        public bool LoadOnInit { get { return _LoadOnInit; } set { _LoadOnInit = value; } }

        private ITemplate _WidgetConfig;
        [TemplateContainer(typeof(ScriptContainer))]
        [PersistenceMode(PersistenceMode.InnerProperty)]
        public ITemplate WidgetConfig
        {
            get
            {
                return _WidgetConfig;
            }
            set
            {
                _WidgetConfig = value;
            }
        }

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
        string _Style;
        [Browsable(true), Category("Appearence"), DefaultValue("")]
        public string Style
        {
            get { return _Style; }
            set
            {
                _Style = value;
            }
        }
        protected override void OnInit(EventArgs e)
        {
            HttpContext ctx = HttpContext.Current;
            base.OnInit(e);
            ContainerHolder.Controls.Clear();
            loadHTML = ctx.Request.QueryString["LoadHtml"] != null;
            ScriptContainer container;
            //if both LoadHTML and lazyloading are true or false then execute else don't execute (XOR)
            if (((loadHTML && _LazyLoading) ||
                (!loadHTML && !_LazyLoading))
            )
            {
                if ((_Scripts != null))
                {
                    container = new ScriptContainer("pre");
                    _Scripts.InstantiateIn(container);
                    WPNL.Controls.Add(container);


                }
                if (_WidgetConfig != null)
                {
                    container = new ScriptContainer("pre", "WidgetConfig");
                    //SContainer.Attributes.Add("template", "GridConfig");
                    // SContainer.Style.Add("display", "none");
                    //container.Attributes.Add("type", "text/html");
                    _WidgetConfig.InstantiateIn(container);
                    WPNL.Controls.Add(container);
                }
            }

        }
        public Form()
        {
            //  System.Web.UI.Design.WebControls
        }
        public Form(string WidgetState, string Action, WebResponse WebResponse)
        {
            _WebResponse = WebResponse;
            _WebResponse.ActionExecuted = Action;
            _WidgetState =
            JsonConvert.DeserializeObject<FormState>(WidgetState);
            _Action = Action;

            _WebResponse.UpdateHtml = true;

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
                //"{{WidgetId:'{0}',WidgetType:'Form',AutoInit:false,DALInfo:'{1}',RelativeKeys:'{2}',RequiresLogin:{3},LazyLoading:{4},
                //LazyType:'{5}',SessionLC:'{6}',AnonymousLC:'{7}'}}";

                WPNL.Attributes.Add("conf", string.Format(_conf, ID, _DataSource, _RelativeKeys, _RequiresLogin.ToString().ToLower(),
                    _LazyLoading.ToString().ToLower(), _LazyType.ToString(), _SessionLC, _AnonymousLC, _Hidden.ToString().ToLower(),
                    _ShowOnLoad.ToString().ToLower(), _LoadOnInit.ToString().ToLower()
                    ));
                WPNL.Attributes.Add("EmptyHeight", EmptyHeight);

                WPNL.Attributes.Add("autoinstance", AutoInstance.ToString().ToLower());
                WPNL.Attributes.Add("selectcommand", _SelectCommand);
                WPNL.Attributes.Add("widgetid", ID);
                if (_RoleBased)
                    WPNL.Attributes.Add("rolebase", _RoleBased.ToString().ToLower());
                //if (_AsyncForm != null) {
                //  WPNL.Controls.Add(Page.LoadControl(_AsyncForm));
                //}
                if (_Style != "")
                    WPNL.Attributes.Add("style", _Style);
                if (_Hidden)
                {
                    WPNL.Style.Add("display", "none");
                }
                if (_AsyncForm != null && ((loadHTML && _LazyLoading) || (!loadHTML && !_LazyLoading)))
                {
                    WPNL.Controls.Add(Page.LoadControl(_AsyncForm));
                }


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

    public class FormState : WidgetState
    {

    }
}