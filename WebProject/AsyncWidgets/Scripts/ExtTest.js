
class Dog extends Ext.util.Observable {
    constructor(name, age, breed) {
        debugger;
        super(name, age); // Call the constructor of the base class
        this.breed = breed;
        this.fireEvent('constructor');
        this.addEvents({ 'onConstructor': true });
    }

    test() {
            this.fireEvent('onConstructor');
        

    }
}

var dog = new Dog('Rover', 2, 'Doberman');
dog.on('onConstructor', function () {
    console.log('Dog Constructor Fired');

});

dog.test();
/*
AsyncWidgets.widgetContainer = Ext.extend(Ext.util.Observable, {
    DefaultState: {
        WidgetId: null,
        WidgetType: null,
        Controller: null,
        AutoInit: true,
        Facade: 'ExeControllerAction',
        FacadePath: ROOT_PATH + 'AsyncWidgets/WebServices/RemoteActions.asmx'
    },
    constructor: function (element, config) {
        var t = this;
        t.el = element;
        t.State = {};
        t.loaded = false;
        Ext.apply(t.State, config, t.DefaultState);
        $(t.el).attr('widgetid', t.State.WidgetId).attr('wtype', t.State.WidgetType);
        t.addEvents({ 'onLoad': true, 'onValidate': true, 'show': true, 'hide': true, 'refresh': true });
        AsyncWidgets.widgetContainer.superclass.constructor.call(t, config);
    },
    show: function () { //WidgetBase Class
        var t = this;
        AsyncWidgets.WidgetManager.hideLast(t);
        $(t.el).show();
        t.visible = true;
        t.fireEvent('show');
        return t;
    },
    refresh: function (t) { //WidgetBase Class
        var t = this;
        t.fireEvent('refresh');
    },
    load: function () {
        var t = this;
        t.loaded = true;
        t.fireEvent('onLoad');
    },
    hide: function (conf) {
        var t = this, e = $(this.el);
        if (!t.visible) return;
        conf = conf || {};
        if (!!conf.destroy) { $('*', e).unbind(); e.html(''); }
        e.hide();
        t.visible = false;

        t.fireEvent('hide', conf);
        return t;
    },
    init: function () {
        this.invokeRA('init', {
            onSuccess: this.RASuccess.createDelegate(this),
            onFailure: this.RAFailure.createDelegate(this)
        });
    },
    invokeRA: function (action, ops) {
        ops = ops || {};
        var onSuccessv = ops.onSuccess || this.RASuccess.createDelegate(this);
        var onFailurev = ops.onFailure || this.RAFailure.createDelegate(this);
        //var facade = ops.facade || this.State.Facade;
        var facade = typeof ops.facade == 'undefined' ? this.State.Facade :
            ops.facade == "sessioned" ? "ExeControllerActionSessioned" : ops.facade;

        if ($(this.el).height() < 100) {
            if (typeof $(this.el).attr('EmptyHeight') != 'undefined') {
                $(this.el).append($('<div id="EmptyHeightdiv" style="height:' + $(this.el).attr('EmptyHeight') + ';"></div>'))
            }
        }
        $(this.el).mask('Please wait while loading ... ');
        this.callWS(this.State.FacadePath + "/" + facade,
            ['Controller', this.State.Controller,
                'WidgetState', encJSON(this.State).replace(/"/g, '\\\"')
                , 'Action', action],
            onSuccessv, onFailurev
        );
    },
    RASuccess: function (response) {
        if (!!response.d) response = response.d;
        Ext.apply(this.State, response.State, {});
        if (response.innerHTML != "") {
            $('#EmptyHeightdiv', this.el).remove();
            this.el.innerHTML = response.WidgetHTML;
        }
        $(this.el).unmask();
    },
    RAFailure: function (response) {
        $(this.el).unmask();
    },
    loadJSFile: function () {

    },
    loadJSFiles: function (files, callback) {
        var cback = callback || function () { };
        var fileCount = 0, loadedFiles = 0;
        var Files = decJSON($(this.el).attr(files));
        for (var iLoop = 0; iLoop < Files.length; iLoop++) {
            for (var jLoop = 0; jLoop < Files[iLoop].files.length; jLoop++) {
                var path = Files[iLoop].path;
                $.getScript(path + Files[iLoop].files[jLoop], cback);
                fileCount++;
            }
        }

    },
    loadHtml: function () {//widget baseclass
        var t = this, st = t.State;
        $('body').mask(Msgs.PleaseWait[_Lang]);
        //t.$el.mask('Please wait while loading ... ');
        //        for (var i = 0; i < 500000; i++) {
        //           var c = 9898999 / (3.67+i);
        //        }
        t.callWS("../" + st.FacadePath + "/GetWidgetHTML",
            ['PageName', "", 'WidgetId', st.WidgetId, 'LazyType', st.LazyType, 'SessionLC', st.SessionLC, 'AnonymousLC', st.AnonymousLC

            ],
            function (res) {
                res = res.d || res;
                var reshtml = res.WidgetHTML;
                $(t.el).html(reshtml);
                //LanguageSetup(t.el);
                if (!!t.setTemplates)
                    t.setTemplates();
                t.fireEvent('HTMLLoaded');
                $('body').unmask();
                //t.HtmlLoaded = true;
            }, function (res) {
                $('body').unmask();
            });

    },
    callWS: function (webMethod, parameters, successFn, errorFN) {
        var paramList = '';
        if (parameters.length > 0) {
            for (var i = 0; i < parameters.length; i += 2) {
                if (paramList.length > 0) paramList += ',';
                paramList += '"' + parameters[i] + '":"' + parameters[i + 1] + '"';
            }
        }
        paramList = '{' + paramList + '}';
        var errHnadler = errorFN || function (msg) { alert("Error Occured While Executing web service\t\n" + msg.responseText); };
        $.ajax({
            type: "POST",
            url: webMethod,
            contentType: "application/json; charset=utf-8",
            data: paramList,
            dataType: "json",
            success: successFn,
            error: errHnadler

        });

    },
    css: function (stl, vl, sel, el) {
        //;
        var t = this;
        el = el || t.css.el || t.el || $('body');
        sel = sel || t.css.sel;
        t.css.el = el;
        $(sel, el).css(stl, vl);
        return t.css.createDelegate(t);
    },
    bindEvents: function () {
        var t = this;
        $(t.el).keypress(function (e) {
            if (e.which == 13) {
                $('.default', t.el).trigger('click');
                return false;
            }
        });
        $('textarea', t.el).keypress(function (e) {

            if (e.which == 13) {
                e.stopPropagation();

            }
        });
    }
});*/