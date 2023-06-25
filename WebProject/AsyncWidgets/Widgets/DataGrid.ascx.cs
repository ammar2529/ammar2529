using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebProject.AsyncWidgets.UI.Widgets;

namespace WebProject.AsyncWidgets.Widgets
{
    public partial class DataGrid : System.Web.UI.UserControl, IRemoteActionInvoker
    {
        public enum AutoSearchType
        {
            OnVisible, OnEveryVisible, OnLoad, none
        }
        public enum GridTemplateType
        {
            eForms, jQueryUI
        }
        private ITemplate _JSON;
        [TemplateContainer(typeof(TemplateContainer))]
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
        [TemplateContainer(typeof(TemplateContainer))]
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
        [TemplateContainer(typeof(TemplateContainer))]
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
        [TemplateContainer(typeof(TemplateContainer))]
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
        [TemplateContainer(typeof(TemplateContainer))]
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
        [TemplateContainer(typeof(TemplateContainer))]
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

        private ITemplate _NoRecrdsTemplate;
        [TemplateContainer(typeof(TemplateContainer))]
        [PersistenceMode(PersistenceMode.InnerProperty)]
        public ITemplate NoRecrdsTemplate
        {
            get
            {
                return _NoRecrdsTemplate;
            }
            set
            {
                _NoRecrdsTemplate = value;
            }
        }

        private ITemplate _PagerTemplate;
        [TemplateContainer(typeof(TemplateContainer))]
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
        private ITemplate _GridConfig;
        [TemplateContainer(typeof(TemplateContainer))]
        [PersistenceMode(PersistenceMode.InnerProperty)]
        public ITemplate GridConfig
        {
            get
            {
                return _GridConfig;
            }
            set
            {
                _GridConfig = value;
            }
        }
        private ITemplate _RowEditForm;
        [TemplateContainer(typeof(TemplateContainer))]
        [PersistenceMode(PersistenceMode.InnerProperty)]
        public ITemplate RowEditForm
        {
            get
            {
                return _RowEditForm;
            }
            set
            {
                _RowEditForm = value;
            }
        }
        private ITemplate _ChildGrids;
        [TemplateContainer(typeof(TemplateContainer))]
        [PersistenceMode(PersistenceMode.InnerProperty)]
        public ITemplate ChildGrids
        {
            get
            {
                return _ChildGrids;
            }
            set
            {
                _ChildGrids = value;
            }
        }
        private ITemplate _RowDetail;
        [TemplateContainer(typeof(TemplateContainer))]
        [PersistenceMode(PersistenceMode.InnerProperty)]
        public ITemplate RowDetail
        {
            get
            {
                return _RowDetail;
            }
            set
            {
                _RowDetail = value;
            }
        }
        private ITemplate _ColumnTemplates;
        [TemplateContainer(typeof(TemplateContainer))]
        [PersistenceMode(PersistenceMode.InnerProperty)]
        public ITemplate ColumnTemplates
        {
            get
            {
                return _ColumnTemplates;
            }
            set
            {
                _ColumnTemplates = value;
            }
        }
        private ITemplate _GridForms;
        [TemplateContainer(typeof(TemplateContainer))]
        [PersistenceMode(PersistenceMode.InnerProperty)]
        public ITemplate GridForms
        {
            get
            {
                return _GridForms;
            }
            set
            {
                _GridForms = value;
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

        string _GridButtons = "";
        /*
        @" Buttons Configuration - 
                                    {
                                        'new':{,container:'top',text:'',class:'',conf:'',visible:true},
                                        'delete':{container:'top',text:'',class:'',conf:'',visible:true}
                                    }
         '&lt;div style="padding:10px;background-color:transparent" class="PWCNoDataMessage">No records available.&lt;/div>'
         */
        [Browsable(true), Category(""), DefaultValue("")]
        public string GridButtons { get { return _GridButtons; } set { _GridButtons = value; } }

        Boolean _ShowGridHead = true;
        [Browsable(true), Category(""), DefaultValue("")]
        public Boolean ShowGridHead { get { return _ShowGridHead; } set { _ShowGridHead = value; } }

        string _GridHeadText = "";
        [Browsable(true), Category(""), DefaultValue("")]
        public string GridHeadText { get { return _GridHeadText; } set { _GridHeadText = value; } }

        GridTemplateType _GridTemplate = GridTemplateType.eForms;
        public GridTemplateType GridTemplate { get { return _GridTemplate; } set { _GridTemplate = value; } }


        protected override void OnInit(EventArgs e)
        {
            HttpContext ctx = HttpContext.Current;
            base.OnInit(e);

            ContainerHolder.Controls.Clear();
            loadHTML = ctx.Request.QueryString["LoadHtml"] != null;
            //if both LoadHTML and lazyloading are true or false then execute else don't execute (XOR)
            if (
                ((loadHTML && _LazyLoading) ||
                (!loadHTML && !_LazyLoading))
               )
            {
                if (_Scripts != null)
                {
                    ScriptContainer scontainer = new ScriptContainer("pre");
                    _Scripts.InstantiateIn(scontainer);
                    WPNL.Controls.Add(scontainer);
                }

                TemplateContainer container;
                ScriptContainer SContainer;
                if (_JSON != null)
                {
                    //  ContainerHolder.Controls.Add(new LiteralControl("No template defined"));

                    container = new TemplateContainer();
                    _JSON.InstantiateIn(container);
                    WPNL.Controls.Add(container);
                }
                if (_TopTemplate != null)
                {
                    container = new TemplateContainer("script");
                    container.Attributes.Add("template", "Top");
                    container.Attributes.Add("type", "text/html");
                    _TopTemplate.InstantiateIn(container);
                    WPNL.Controls.Add(container);
                }
                if (_HeaderTemplate != null)
                {
                    container = new TemplateContainer("script");
                    container.Attributes.Add("template", "Header");
                    container.Attributes.Add("type", "text/html");
                    _HeaderTemplate.InstantiateIn(container);
                    WPNL.Controls.Add(container);
                }
                if (_RepeaterTemplate != null)
                {
                    container = new TemplateContainer("pre");
                    container.Attributes.Add("template", "Repeater");
                    container.Attributes.Add("type", "text/html");
                    container.Attributes.Add("style", "display:none;");
                    _RepeaterTemplate.InstantiateIn(container);
                    WPNL.Controls.Add(container);
                }
                if (_ItemTemplate != null)
                {
                    container = new TemplateContainer("script");
                    container.Attributes.Add("template", "Item");
                    container.Attributes.Add("type", "text/html");
                    _ItemTemplate.InstantiateIn(container);
                    WPNL.Controls.Add(container);
                }
                if (_NoRecrdsTemplate != null)
                {
                    container = new TemplateContainer("script");
                    container.Attributes.Add("template", "Item");
                    container.Attributes.Add("type", "text/html");
                    _NoRecrdsTemplate.InstantiateIn(container);
                    WPNL.Controls.Add(container);
                }
                if (_BottomTemplate != null)
                {
                    container = new TemplateContainer("script");
                    container.Attributes.Add("template", "Bottom");
                    container.Attributes.Add("type", "text/html");
                    _BottomTemplate.InstantiateIn(container);
                    WPNL.Controls.Add(container);
                }
                if (_PagerTemplate != null)
                {
                    container = new TemplateContainer("script");
                    container.Attributes.Add("template", "Pager");
                    container.Attributes.Add("type", "text/html");
                    _PagerTemplate.InstantiateIn(container);
                    WPNL.Controls.Add(container);
                }
                if (_GridConfig != null)
                {
                    SContainer = new ScriptContainer("pre", "GridConfig");
                    //SContainer.Attributes.Add("template", "GridConfig");
                    // SContainer.Style.Add("display", "none");
                    //container.Attributes.Add("type", "text/html");
                    _GridConfig.InstantiateIn(SContainer);
                    WPNL.Controls.Add(SContainer);
                }
                if (_RowEditForm != null)
                {
                    container = new TemplateContainer("pre");
                    container.Attributes.Add("template", "RowEditForm");
                    container.Attributes.Add("type", "text/html");
                    container.Style.Add("display", "none");
                    _RowEditForm.InstantiateIn(container);
                    WPNL.Controls.Add(container);
                }
                if (_ChildGrids != null)
                {
                    container = new TemplateContainer("pre");
                    container.Style.Add("display", "none");
                    container.Attributes.Add("template", "ChildGrids");
                    _ChildGrids.InstantiateIn(container);
                    WPNL.Controls.Add(container);
                }
                if (_RowDetail != null)
                {
                    container = new TemplateContainer("pre");
                    container.Style.Add("display", "none");
                    container.Attributes.Add("template", "RowDetail");
                    _RowDetail.InstantiateIn(container);
                    WPNL.Controls.Add(container);
                }
                if (_ColumnTemplates != null)
                {
                    container = new TemplateContainer("pre");
                    container.Style.Add("display", "none");
                    container.Attributes.Add("template", "ColumnTemplates");
                    _ColumnTemplates.InstantiateIn(container);
                    WPNL.Controls.Add(container);
                }
                if (_GridForms != null)
                {
                    container = new TemplateContainer("pre");
                    container.Style.Add("display", "none");
                    container.Attributes.Add("template", "GridForms");
                    _GridForms.InstantiateIn(container);
                    WPNL.Controls.Add(container);
                }
            }
        }
        //////////////////////////////////////////////////

        //string _conf = "{{WidgetId:'{0}',WidgetType:'DataGrid',AutoInit:false,AutoSearch:'{1}',PageSize:{2},Columns:{3},DALInfo:'{4}',RowEditForm:{5},SelectableRow:{6},SingleRowSelect:{7},AllowNew:{8},DeleteCommand:'{9}',RelativeKeys:'{10}',DeleteKeys:'{11}',HideElems:'{12}',ContainerMargin:'{13}',ContainerStyle:'{14}',ColLeftMargin:'{15}',GridButtons:'{20}',ShowGridHead:{21},GridHeadText:'{22}',GridTemplate:'{23}',Hidden:{24},ShowRowNumbers:{25}}}";
        string _conf = "{{WidgetId:'{0}',WidgetType:'DataGrid',AutoInit:false,AutoSearch:'{1}',PageSize:{2},Columns:{3},DALInfo:'{4}',RowEditForm:{5},SelectableRow:{6},SingleRowSelect:{7},AllowNew:{8},DeleteCommand:'{9}',RelativeKeys:'{10}',DeleteKeys:'{11}',HideElems:'{12}',ContainerMargin:'{13}',ContainerStyle:'{14}',ColLeftMargin:'{15}',GridButtons:'{20}',ShowGridHead:{21},GridHeadText:'{22}',GridTemplate:'{23}',Hidden:{24},ShowRowNumbers:{25},ShowOnLoad:{26},LoadOnInit:{27}}}";
        WebResponse _WebResponse;
        DataGridState _WidgetState;
        string _Action;
        bool loadHTML;
        string _EmptyHeight = "200px";
        [Browsable(true), DefaultValue("200px"), Category("Appearence")]
        public string EmptyHeight { get { return _EmptyHeight; } set { _EmptyHeight = value; } }

        string _Forms;
        [Browsable(true), Category("Behaviour")]
        public string Forms { get { return _Forms; } set { _Forms = value; } }

        AutoSearchType _AutoSearch = AutoSearchType.OnVisible;
        [Browsable(true), Category("Behaviour"), DefaultValue(false)]
        public AutoSearchType AutoSearch { get { return _AutoSearch; } set { _AutoSearch = value; } }

        string _DataSource;
        [Browsable(true), Category("Data")]
        public string DataSource { get { return _DataSource; } set { _DataSource = value; } }

        bool _Hidden;
        [Browsable(true), Category("Appearence"), DefaultValue(false)]
        public bool Hidden { get { return _Hidden; } set { _Hidden = value; } }

        bool _ShowOnLoad = false;
        [Browsable(true), Category("Show The widget when its being loaded"), DefaultValue("true")]
        public bool ShowOnLoad { get { return _ShowOnLoad; } set { _ShowOnLoad = value; } }

        bool _LoadOnInit = true;
        [Browsable(true), Category("Load widget when it is instantiated"), DefaultValue("true")]
        public bool LoadOnInit { get { return _LoadOnInit; } set { _LoadOnInit = value; } }

        int _Columns = 5;
        [Browsable(true), Category("Appearence"), DefaultValue(5)]
        public int Columns { get { return _Columns; } set { _Columns = value; } }

        int _PageSize = 4; //
        [Browsable(true), Category("Appearence"), DefaultValue(4)]
        public int PageSize { get { return _PageSize; } set { _PageSize = value; } }

        bool _SelectableRow = false;
        [Browsable(true), Category("Appearence"), DefaultValue(false)]
        public bool SelectableRow { get { return _SelectableRow; } set { _SelectableRow = value; } }

        bool _SingleRowSelect = false;
        [Browsable(true), Category("Appearence"), DefaultValue(false)]
        public bool SingleRowSelect { get { return _SingleRowSelect; } set { _SingleRowSelect = value; } }

        bool _AllowNew;
        [Browsable(true), Category("Appearence"), DefaultValue(false)]
        public bool AllowNew { get { return _AllowNew; } set { _AllowNew = value; } }
        string _DeleteCommand;
        [Browsable(true), Category("Appearence"), DefaultValue(false)]
        public string DeleteCommand { get { return _DeleteCommand; } set { _DeleteCommand = value; } }

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
        string _DeleteKeys = "";
        [Browsable(true), Category("Appearence")]
        public string DeleteKeys
        {
            get { return _DeleteKeys; }
            set
            {
                _DeleteKeys = value;
            }
        }
        string _HideElems = "";
        [Browsable(true), Category("Appearence")]
        public string HideElems
        {
            get { return _HideElems; }
            set
            {
                _HideElems = value;
            }
        }
        string _Style = "";
        [Browsable(true), Category("Appearence")]
        public string Style
        {
            get { return _Style; }
            set
            {
                _Style = value;
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
        string _ContainerMargin = "";
        [Browsable(true), Category("Appearence")]
        public string ContainerMargin
        {
            get { return _ContainerMargin; }
            set
            {
                _ContainerMargin = value;
            }
        }
        string _ContainerStyle = "";
        [Browsable(true), Category("Appearence")]
        public string ContainerStyle
        {
            get { return _ContainerStyle; }
            set
            {
                _ContainerStyle = value;
            }
        }
        string _ColLeftMargin = "10";
        [Browsable(true), Category("Appearence")]
        public string ColLeftMargin
        {
            get { return _ColLeftMargin; }
            set
            {
                _ColLeftMargin = value;
            }
        }
        bool _ShowRowNumbers;
        [Browsable(true), Category("Appearence"), DefaultValue(false)]
        public bool ShowRowNumbers { get { return _ShowRowNumbers; } set { _ShowRowNumbers = value; } }
        public DataGrid()
        {
            //  System.Web.UI.Design.WebControls
        }
        public DataGrid(string WidgetState, string Action, WebResponse WebResponse)
        {
            _WebResponse = WebResponse;
            _WebResponse.ActionExecuted = Action;
            _WidgetState =
            JsonConvert.DeserializeObject<DataGridState>(WidgetState);
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
                WPNL.Attributes.Add("conf", string.Format(_conf, ID, _AutoSearch.ToString(), PageSize, Columns, _DataSource,
                    (_RowEditForm != null).ToString().ToLower(),
                    SelectableRow.ToString().ToLower(), _SingleRowSelect.ToString().ToLower(),
                    AllowNew.ToString().ToLower(),
                    _DeleteCommand, _RelativeKeys, _DeleteKeys, _HideElems,
                    _ContainerMargin, _ContainerStyle, _ColLeftMargin,
                    _LazyLoading.ToString().ToLower(), _LazyType.ToString(), _SessionLC, _AnonymousLC,
                    _GridButtons, _ShowGridHead.ToString().ToLower(), _GridHeadText, _GridTemplate.ToString(), _Hidden.ToString().ToLower(),
                    _ShowRowNumbers.ToString().ToLower(), _ShowOnLoad.ToString().ToLower(), _LoadOnInit.ToString().ToLower()
                   ));
                WPNL.Attributes.Add("style", _Style);
                WPNL.Attributes.Add("EmptyHeight", EmptyHeight);
                if (!String.IsNullOrEmpty(_Forms))
                    WPNL.Attributes.Add("forms", _Forms);
                if (!AutoInstance) WPNL.Attributes.Add("autoinstance", AutoInstance.ToString().ToLower());
                //  if (_Hidden) WPNL.Style.Add("display", "none");
                if (WPNL.Style["width"] == null) WPNL.Style.Add("width", "100%");
                if (WPNL.Style["text-align"] == null) WPNL.Style.Add("text-align", "center");

                // WPNL.Style.Add("margin", "4px"); SelectableRow
                if (WPNL.Style["box-sizing"] == null)
                    WPNL.Style.Add("box-sizing", "border-box");

                if (_Hidden)
                {
                    WPNL.Style.Add("display", "none");
                }

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

    public class DataGridState : WidgetState
    {

    }
}