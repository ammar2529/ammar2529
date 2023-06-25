using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

using Newtonsoft.Json;
using System.Reflection;
using System.ComponentModel;
using WebProject.AsyncWidgets;

namespace WebProject.AsyncWidgets.Widgets
{
    public partial class ItemRepeater : System.Web.UI.UserControl
    {



        private ITemplate _JSON;
        [TemplateContainer(typeof(JSONContainer))]
        [PersistenceMode(PersistenceMode.InnerProperty)]
        public ITemplate JSON
        {
            get
            {
                return _JSON;
            }
            set
            {
                _JSON = value;
            }
        }

        private ITemplate _TopTemplate;
        [TemplateContainer(typeof(JSONContainer))]
        [PersistenceMode(PersistenceMode.InnerProperty)]
        public ITemplate TopTemplate
        {
            get
            {
                return _TopTemplate;
            }
            set
            {
                _TopTemplate = value;
            }
        }

        private ITemplate _HeaderTemplate;
        [TemplateContainer(typeof(JSONContainer))]
        [PersistenceMode(PersistenceMode.InnerProperty)]
        public ITemplate HeaderTemplate
        {
            get
            {
                return _HeaderTemplate;
            }
            set
            {
                _HeaderTemplate = value;
            }
        }

        private ITemplate _RepeaterTemplate;
        [TemplateContainer(typeof(JSONContainer))]
        [PersistenceMode(PersistenceMode.InnerProperty)]
        public ITemplate RepeaterTemplate
        {
            get
            {
                return _RepeaterTemplate;
            }
            set
            {
                _RepeaterTemplate = value;
            }
        }

        private ITemplate _ItemTemplate;
        [TemplateContainer(typeof(JSONContainer))]
        [PersistenceMode(PersistenceMode.InnerProperty)]
        public ITemplate ItemTemplate
        {
            get
            {
                return _ItemTemplate;
            }
            set
            {
                _ItemTemplate = value;
            }
        }

        private ITemplate _BottomTemplate;
        [TemplateContainer(typeof(JSONContainer))]
        [PersistenceMode(PersistenceMode.InnerProperty)]
        public ITemplate BottomTemplate
        {
            get
            {
                return _BottomTemplate;
            }
            set
            {
                _BottomTemplate = value;
            }
        }

        private ITemplate _PagerTemplate;
        [TemplateContainer(typeof(JSONContainer))]
        [PersistenceMode(PersistenceMode.InnerProperty)]
        public ITemplate PagerTemplate
        {
            get
            {
                return _PagerTemplate;
            }
            set
            {
                _PagerTemplate = value;
            }
        }
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            JSONContainer container;
            if (_JSON != null)
            {
                //  ContainerHolder.Controls.Add(new LiteralControl("No template defined"));

                container = new JSONContainer();
                _JSON.InstantiateIn(container);
                WPNL.Controls.Add(container);
            }
            if (_TopTemplate != null)
            {
                container = new JSONContainer("script");
                container.Attributes.Add("template", "Top");
                container.Attributes.Add("type", "text/html");
                _TopTemplate.InstantiateIn(container);
                WPNL.Controls.Add(container);
            }
            if (_HeaderTemplate != null)
            {
                container = new JSONContainer("script");
                container.Attributes.Add("template", "Header");
                container.Attributes.Add("type", "text/html");
                _HeaderTemplate.InstantiateIn(container);
                WPNL.Controls.Add(container);
            }
            if (_RepeaterTemplate != null)
            {
                container = new JSONContainer("script");
                container.Attributes.Add("template", "Repeater");
                container.Attributes.Add("type", "text/html");
                _RepeaterTemplate.InstantiateIn(container);
                WPNL.Controls.Add(container);
            }
            if (_ItemTemplate != null)
            {
                container = new JSONContainer("script");
                container.Attributes.Add("template", "Item");
                container.Attributes.Add("type", "text/html");
                _ItemTemplate.InstantiateIn(container);
                WPNL.Controls.Add(container);
            }
            if (_BottomTemplate != null)
            {
                container = new JSONContainer("script");
                container.Attributes.Add("template", "Bottom");
                container.Attributes.Add("type", "text/html");
                _BottomTemplate.InstantiateIn(container);
                WPNL.Controls.Add(container);
            }
            if (_PagerTemplate != null)
            {
                container = new JSONContainer("script");
                container.Attributes.Add("template", "Pager");
                container.Attributes.Add("type", "text/html");
                _PagerTemplate.InstantiateIn(container);
                WPNL.Controls.Add(container);
            }
        }
        //////////////////////////////////////////////////

        string _conf = "{{WidgetId:'{0}',WidgetType:'ItemRepeater',AutoInit:false,AutoSearch:{1},PageSize:{2},Columns:{3},DALInfo:'{4}'}}";
        WebResponse _WebResponse;
        ItemRepeaterState _WidgetState;
        string _Action;

        string _EmptyHeight;
        [Browsable(true), DefaultValue("200px"), Category("Appearence")]
        public string EmptyHeight { get { return _EmptyHeight; } set { _EmptyHeight = value; } }

        string _Forms;
        [Browsable(true), Category("Behaviour")]
        public string Forms { get { return _Forms; } set { _Forms = value; } }

        bool _AutoSearch = false;
        [Browsable(true), Category("Behaviour"), DefaultValue(false)]
        public bool AutoSearch { get { return _AutoSearch; } set { _AutoSearch = value; } }

        string _DataSource;
        [Browsable(true), Category("Data")]
        public string DataSource { get { return _DataSource; } set { _DataSource = value; } }

        bool _Hidden;
        [Browsable(true), Category("Appearence"), DefaultValue(true)]
        public bool Hidden { get { return _Hidden; } set { _Hidden = value; } }

        int _Columns;
        [Browsable(true), Category("Appearence"), DefaultValue(5)]
        public int Columns { get { return _Columns; } set { _Columns = value; } }

        int _PageSize;
        [Browsable(true), Category("Appearence"), DefaultValue(4)]
        public int PageSize { get { return _PageSize; } set { _PageSize = value; } }

        public ItemRepeater()
        {
            //  System.Web.UI.Design.WebControls
        }
        public ItemRepeater(string WidgetState, string Action, WebResponse WebResponse)
        {
            _WebResponse = WebResponse;
            _WebResponse.ActionExecuted = Action;
            _WidgetState =
            JsonConvert.DeserializeObject<ItemRepeaterState>(WidgetState);
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
                WPNL.Attributes.Add("conf", string.Format(_conf, ID, _AutoSearch.ToString().ToLower(), PageSize, Columns, _DataSource));
                WPNL.Attributes.Add("EmptyHeight", EmptyHeight);
                WPNL.Attributes.Add("forms", _Forms);
                if (_Hidden) WPNL.Style.Add("display", "none");
                //  WPNL.Attributes.Add("DALInfo", _DataSource);
                //  WPNL.Attributes.Add("PageSize", PageSize.ToString());
                // WPNL.Attributes.Add("Columns", Columns.ToString());
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



public class JSONContainer : WebControl, INamingContainer
    {
        public JSONContainer() { }
        public JSONContainer(string tag) : base(tag) { }
    }






    public class ItemRepeaterState : WidgetState
    {

    }
}