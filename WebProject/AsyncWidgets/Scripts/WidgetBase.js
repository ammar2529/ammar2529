Ext.namespace('AsyncWidgets.WidgetScripts');
//AsyncWidgets.WidgetScripts

if (location.protocol=="https:")
{
	if(ROOT_PATH.indexOf("https")!=0){
		ROOT_PATH=ROOT_PATH||"/";
		ROOT_PATH =location.protocol+"//"+location.host+ ROOT_PATH;
	}
} 
RES_PATH = ROOT_PATH + "AsyncWidgets/Widgets/resources/";
MSGWAIT = 'Please wait while loading ...';
Number.prototype.fix = function (prec) {
    prec = prec||0;
    var f = Math.pow(10, prec);
    return (Math.floor(this * f) / f).toFixed(prec);
};
Number.prototype.numberWithCommas = function () {
    var x = this;
    var parts = x.toString().split(".");
    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    return parts.join(".");
}
String.prototype.numberWithCommas = function () {
    var x = this;
    var parts = x.toString().split(".");
    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    return parts.join(".");
}
String.prototype.toNumber = function (cf) {
    cf = cf || {};
    _cf = { WhenNaN: 0 };
    Ext.apply(_cf, cf);
    var x = this;
    var con = Number(x.replace(/[, ]/g, '')); //remove commas and space form the number;
    if (isNaN(con)) {
        return _cf.WhenNaN;
    }
    return con;
}
Ext.apply(Ext.util.Format, {
    nullSP: function (v) {
        return v !== null ? v : '&nbsp;'; 
    },
    nullNSTR: function (v) {
        return v !== null ? v : '';
    },
    fix: function (v, x, cf) {
       
        try {
            var cf = cf || {};
            if (v == null) {
                return '';
            }
            else if (!!cf.Comma) {
                return v.fix(x).numberWithCommas();
            }
            else
                return v.fix(x);

        }
        catch (ex) {
            debugger;
        }
    }
});
Ext.applyIf(String, {
    escape: function (string) {
        return string.replace(/('|\\)/g, "\\$1");
    },
    leftPad: function (val, size, ch) {
        var result = String(val);
        if (!ch) {
            ch = " ";
        }
        while (result.length < size) {
            result = ch + result;
        }
        return result;
    }
});
//__DBG__ = true;
/************************************* <Remote Action Class> *******************************************/
AsyncWidgets.RAInvoker = Ext.extend(Ext.util.Observable, {
    constructor: function (element, conf) {
        var t = this;
        conf = conf || {};
        Ext.apply(t, {
            facade: 'DoAction',
			facadePath: ROOT_PATH + 'AsyncWidgets/WebServices/RemoteActions.asmx',
            xhr: {}				   
        }, conf);
        t.addEvents({ 'onSuccess': true, 'afterSuccess': true, 'onFailure': true });

        AsyncWidgets.RAInvoker.superclass.constructor.call(t, conf);
    },
    abort: function () {
        if (!!this.xhr.abort) this.xhr.abort();
    },
    invokeRA: function (op) {
        var t = this;
        op = op || {};
        var facadePath = op.facadePath || t.facadePath;
        var webMethod = op.facade || facadePath + "/" + t.facade;
        // $(t.el).mask(op.msg || 'Please wait while loading ... ');
        t.callWS(webMethod, op.params);
    },
    success: function (res) {
        res = res.d || res;
        var t = this;
        t.fireEvent('onSuccess', res);

        t.fireEvent('afterSuccess', res);
        // $(t.el).unmask();
    }
    , failure: function (res) {
        res = res.d || res;
        var t = this;
		console.log(`RAInvoker faild for url:(${t.facadePath})
		response: ${JSON.stringify(res)}
		`);
        t.fireEvent('onFailure', res);
        
    }
    ,
    callWS: function (webMethod, parameters, successFn, errorFN) {
        var paramList = '';
        if (parameters.length > 0) {
            for (var i = 0; i < parameters.length; i += 2) {
                if (paramList.length > 0) paramList += ',';
                paramList += '"' + parameters[i] + '":"' + parameters[i + 1] + '"';
            }
        }
        paramList = '{' + paramList + '}';
        // var errHnadler = errorFN || function (msg) { alert("Error Occured While Executing web service\t\n" + msg.responseText); };
        successFn = successFn || this.success.createDelegate(this);
        errorFN = errorFN || this.failure.createDelegate(this);
        this.xhr =$.ajax({
            type: "POST",
            url: webMethod,
            contentType: "application/json; charset=utf-8",
            data: paramList,
            dataType: "json",
            success: successFn,
            error: errorFN

        });
        AsyncWidgets.user.action();
    }
});
////////////////////////// Check if user is logged in or not //////////////////////////////////
AsyncWidgets.user = function () {
    var isFirst = true; Observer = new Ext.util.Observable();
    Observer.addEvents({ 'loggedOut': true, 'loggedIn': true, 'actionPerformed': true });
    return {
        on: function (e, fn) {
            Observer.on(e, fn);
        },
       
        fireEvent: function (e) {
            debugger;
            Observer.fireEvent(e);
        },
        login: function () {
            Observer.fireEvent('loggedIn');
        },
        logout: function () {
            Observer.fireEvent('loggedOut');
        },
        action: function () {
            Observer.fireEvent('actionPerformed');
        },
        isLogged: function (cf) {
            var CurTime = (new Date()).getTime(), limitElap = ((((CurTime - AsyncWidgets.user.lastLogChecked) / 1000) / 60) > 15), cb = cf.callBack;
            if (isFirst || limitElap) {
                var inv = new AsyncWidgets.RAInvoker();
                inv.on('onSuccess', function (res) {
                    var Res = decJSON(res), ret;
                    if (Res.status == "OK") {
                        if (Res.Response) {
                            AsyncWidgets.user.logged = true;
                            if (!!cb) cb(true);
                            // Observer.fireEvent('loggedIn');
                        }
                        else {
                            AsyncWidgets.user.logged = false;
                            if (!!cb) cb(false);
                            Observer.fireEvent('loggedOut');
                        }
                    }
                    AsyncWidgets.user.lastLogChecked = (new Date).getTime();
                });

                inv.on('onFailure', function (res) {
                    if (!!cb) cb(false);
                    Observer.fireEvent('loggedOut');
                });


                inv.invokeRA({ params: ["ActorId", "Authentication", "ActionId", "IsUserLogged", "ServiceInfo",
            "<root><dummy></dummy></root>"]
                });
            }
            isFirst = false;
            return true;
        }
    };
} ();
/************************************* </Remote Action Class> *******************************************/
Ext.apply(AsyncWidgets, {
    JSPath: ROOT_PATH + "AsyncWidgets/Scripts",
    // JSPath: "../Scripts",
    CSSPath: RES_PATH + "css",
    // CSSPath: "../Widgets/resources/css",
    get: function (WidgetId) {
        return AsyncWidgets.Widgets.getWidget(WidgetId);
    },
    has: function (WidgetId) {
        return AsyncWidgets.Widgets.contains(WidgetId);
    },
    loadCSS: function (file, id, path) {
        var t = this;
        file = (path || t.CSSPath) + "/" + file + ".css";

        if (!(id in t.LoadedCSS)) {
            if (document.createStyleSheet) {
                document.createStyleSheet(file);
            }
            else {
                $('<link rel="stylesheet" type="text/css" href="' + file + '" />').appendTo("head");
            }
            t.LoadedCSS[id] = { Loaded: true };
        }
    },
    loadJS: function (file, id, fnCB, path) {
        var t = this;
        file = (path || t.JSPath) + "/" + file;
        var LoadCount = 0, MaxLoadCount = 10;
        onJsLoaded = function () {
            t.LoadedJS[id] = true;
            //            if (!!t.LoadedJS[id]) {
            //                fnCB();
            //            }
            //            else {
            //                if (LoadCount > MaxLoadCount)
            //                    alert('JS file couln\'t be initialized!');
            //                else
            //                    onJsLoaded.defer(350);
            //            }
            fnCB();
        }
        if (!(id in t.LoadedJS)) {
            $.getScript(file + '.js', onJsLoaded);
        }
        else fnCB();
    },
    LoadedJS: {},
    LoadedCSS: {}
});

//*************************************JQuery Mask Plugin********************************************//
(function (a) {
    var _nm="";
    a.fn.mask = function (c, b,nm) {
    _nm=nm;
        a(this).each(function () {
            if (this.__maskCount == undefined) {
                this.__maskCount = 1;
            } 
            else 
            this.__maskCount++;
            
            if (b !== undefined && b > 0) {
                var d = a(this);
                d.data("_mask_timeout", setTimeout(function () {
                    
                    a.maskElement(d, c)
                }, b))
            } else {
            
                a.maskElement(a(this), c)
            }
        })
    };
    a.fn.unmask = function () {
        a(this).each(function () {
            this.__maskCount = this.__maskCount == undefined || this.__maskCount < 0 ? 0 : --this.__maskCount;
            if (this.__maskCount > 0) return;
            a.unmaskElement(a(this));
        })
    };
    a.fn.isMasked = function () {
        return this.hasClass("masked")
    };
    a.maskElement = function (d, c) {
        
        if (d.data("_mask_timeout") !== undefined) {
            clearTimeout(d.data("_mask_timeout"));
            d.removeData("_mask_timeout")
        }
        
        if (d.isMasked()) {
            a.unmaskElement(d)
        }
       
        if (d.css("position") == "static") {
            d.addClass("masked-relative")
        }
        d.addClass("masked");

        var e =a('.loadmask',d).show();
        if(e.length==0) 
            e=a('<div class="loadmask"></div>');

        if (navigator.userAgent.toLowerCase().indexOf("msie") > -1) {
            e.height(d.height() + parseInt(d.css("padding-top")) + parseInt(d.css("padding-bottom")));
            e.width(d.width() + parseInt(d.css("padding-left")) + parseInt(d.css("padding-right")))
        }
       
        if (navigator.userAgent.toLowerCase().indexOf("msie 6") > -1) {
            d.find("select").addClass("masked-hidden")
        }
        d.append(e);
        if (c !== undefined) {
            
            //var b = a('<div class=" loadmask-msg" style="display:none;"></div>');
           // b.append("<div>" + c + "</div>");
            //d.append(b);
            
            var b = a('.loadmask-msg',d);
             if(b.length==0)
             {
                 b=a('<div  class="loadmask-msg" style="display:none;"><div class="msgcon">'+ c +'</div></div>'); 
                 d.append(b);
            }
            else 
                a('msgcon',b).text(c);
            b.css("top", Math.round(d.height() / 2 - (b.height() - parseInt(b.css("padding-top")) - parseInt(b.css("padding-bottom"))) / 2) + "px");
            b.css("left", Math.round(d.width() / 2 - (b.width() - parseInt(b.css("padding-left")) - parseInt(b.css("padding-right"))) / 2) + "px");
            b.show();
        }
    };
    a.unmaskElement = function (b) {
    
        if (b.data("_mask_timeout") !== undefined) {
            clearTimeout(b.data("_mask_timeout"));
            b.removeData("_mask_timeout")
        }
        b.find(".loadmask-msg,.loadmask").hide();
        b.removeClass("masked");
        b.removeClass("masked-relative");
        b.find("select").removeClass("masked-hidden")
    }
})(jQuery);

//(function (a) { a.fn.mask = function (c, b) { a(this).each(function () { if (this.__maskCount == undefined) { this.__maskCount = 1 } else this.__maskCount++; if (b !== undefined && b > 0) { var d = a(this); d.data("_mask_timeout", setTimeout(function () { a.maskElement(d, c) }, b)) } else { a.maskElement(a(this), c) } }) }; a.fn.unmask = function () { a(this).each(function () { this.__maskCount = this.__maskCount == undefined ? 0 : --this.__maskCount; if (this.__maskCount > 0) return; a.unmaskElement(a(this)) }) }; a.fn.isMasked = function () { return this.hasClass("masked") }; a.maskElement = function (d, c) { if (d.data("_mask_timeout") !== undefined) { clearTimeout(d.data("_mask_timeout")); d.removeData("_mask_timeout") } if (d.isMasked()) { a.unmaskElement(d) } if (d.css("position") == "static") { d.addClass("masked-relative") } d.addClass("masked"); var e = a('<div class="loadmask"></div>'); if (navigator.userAgent.toLowerCase().indexOf("msie") > -1) { e.height(d.height() + parseInt(d.css("padding-top")) + parseInt(d.css("padding-bottom"))); e.width(d.width() + parseInt(d.css("padding-left")) + parseInt(d.css("padding-right"))) } if (navigator.userAgent.toLowerCase().indexOf("msie 6") > -1) { d.find("select").addClass("masked-hidden") } d.append(e); if (c !== undefined) { var b = a('<div class="loadmask-msg" style="display:none;"></div>'); b.append("<div>" + c + "</div>"); d.append(b); b.css("top", Math.round(d.height() / 2 - (b.height() - parseInt(b.css("padding-top")) - parseInt(b.css("padding-bottom"))) / 2) + "px"); b.css("left", Math.round(d.width() / 2 - (b.width() - parseInt(b.css("padding-left")) - parseInt(b.css("padding-right"))) / 2) + "px"); b.show() } }; a.unmaskElement = function (b) { if (b.data("_mask_timeout") !== undefined) { clearTimeout(b.data("_mask_timeout")); b.removeData("_mask_timeout") } b.find(".loadmask-msg,.loadmask").remove(); b.removeClass("masked"); b.removeClass("masked-relative"); b.find("select").removeClass("masked-hidden") } })(jQuery);
//(function (a) { a.showMessage = function (e, c) { settings = a.extend({ id: "sliding_message_box", position: "bottom", size: "30", backgroundColor: "rgb(143, 177, 240)", delay: 2500, speed: 500, fontSize: "18px" }, c); var d = a("#" + settings.id); var b; if (d.length == 0) { d = a("<div></div>").attr("id", settings.id); d.css({ "z-index": "999", "background-color": settings.backgroundColor, "text-align": "center", position: "absolute", position: "fixed", left: "0", width: "100%", "line-height": settings.size + "px", "font-size": settings.fontSize }); a("body").append(d) } d.html(e); d.css(settings.position, "-" + settings.size + "px"); var f = {}; f[settings.position] = 0; d.animate(f, settings.speed); if (!a.showMessage.hideDT) { a.showMessage.hideDT = new Ext.util.DelayedTask(function () { f = {}; f[settings.position] = "-" + settings.size + "px"; a("#" + settings.id).animate(f, settings.speed) }) } a.showMessage.hideDT.delay(settings.delay) } })(jQuery);
;
function dbg(){
    return !!window.__DBG__;
}
 function isList (e) {
    if (!e.length) e = $(e);
    return !!e.attr('size');
}
function gt(a, b) {
    return a > b;
}
function lt(a, b) {
    return a < b;
}

var _IsIE = $.browser.msie, _BrVer = parseInt($.browser.version.charAt(0)),
    __IE8 = _IsIE && _BrVer == 8 ? true : false;
    __touch = !!('ontouchstart' in window);
(function ($) {
    $.showMessage = function (message, options,secondCall) {
        if(!secondCall){
            $.showMessage.defer(500,this,[message,options,true]);
            return;
        }
       settings = $.extend({
            id: 'sliding_message_box',
            position: 'top',
            size: '20',
            backgroundColor: '#FFFFAA',
            delay: 3500,
            speed: 500,
            fontSize: '11px'
        }, options);

        var elem = $('#' + settings.id);
        var delayed;

        // generate message div if it doesn't exist
        if (elem.length == 0) {
            elem = $('<div><div class="conmsg"></div></div>').attr('id', settings.id);
            elem.hover(
                function () { 
                    $(this).css("background-color", "#FFFFCF"); 
                    $.showMessage.hideDT.delay(999999999);
            }, 
                function () { 
                    $(this).css("background-color", "#FFFFAA"); 
                    $.showMessage.hideDT.delay(1000);
            });
                var lf=0;width="100%";
                if( !!$('.left-border').length){
                    lf= $('.left-border').offset().left +15;
                    width='942px';
                }
                elem.css({ 'z-index': '999',
                'cursor':'pointer',
                'background-color': settings.backgroundColor,
                'text-align': 'center',
                'position': 'absolute',
                'left':  lf,
                'top':'0',
                'width': width,
                'line-height': settings.size + 'px',
                'font-family': 'verdana,sans-serif,trebuchet ms,arial',
                'font-size': settings.fontSize,
                'font-weight':'bold',
                'color': '#333333',
                'border-bottom': '1px solid #73ABCB',
                'padding': '5px 0'
            });
            $('body').append(elem);
        }
        message = message || 'Data updated successfully!';
        var conmsg = $('.conmsg', elem).html(message);
        var cf = {} ,win = $(window),setElem;
		
        cf[settings.position] = 0;
        setElem =function(op){
			op =op||"slow";
            elem.stop().animate({ "marginTop": win.scrollTop() +"px" },op,
            function () {
				(function (dl) { 
					(function () { 
						conmsg.css('visibility', (conmsg.css('visibility') == 'hidden' ? 'visible' : 'hidden')); 
					}).defer(dl,this); 
				 return arguments.callee; 
				 })(0)(500)(1000)(1500);
			}
            );
        };
        var ElemHidden=false;
        function animateElem(){
        console.log('anim called');
            if(!ElemHidden){
                if(elem.css('marginTop') != '0px')
                {
                    elem.css('marginTop','-35');
                    setElem('fast');
                    animateElem.defer(300);
                    console.log('anim called');
                }
            }
        }
        setElem('fast');
        win.bind('scroll.showmsg',setElem);
        function hideMSG() {
            $("#" + settings.id).stop().animate({ "marginTop":  "-35px" }, "slow");
            win.unbind('scroll.showmsg');
            ElemHidden=true;
        }
        elem.click(hideMSG);
        if (!$.showMessage.hideDT) $.showMessage.hideDT = new Ext.util.DelayedTask(hideMSG);
        $.showMessage.hideDT.delay(settings.delay);
    }
})(jQuery);
String.prototype.splitCamel = function () { return this.replace(/([a-z])([A-Z])/g, "$1 $2"); };

decJSON = Ext.util.JSON.decode, encJSON = Ext.util.JSON.encode;

/*
jQuery.extend(
  jQuery.expr[ ":" ], 
  { reallyvisible : "(jQuery(a).is(':visible') && jQuery(a).parents(':hidden').length == 0)" }
);

function ($) {
    $.extend(
    $.expr[":"],
        { reallyvisible: function (a) { return ($(a).is(":visible") && $(a).parents(":hidden").length == 0) } }
    );
} (jQuery);
*/
function setCommonEvents() {
    $('.w-ui-panel-icon').live('mouseleave', function () {
        $(this).addClass('w-ui-icon').removeClass('w-ui-icon-hover');
    });
    $('.w-ui-panel-icon').live('mouseenter', function () {
        $(this).addClass('w-ui-icon-hover').removeClass('w-ui-icon');
    });
    $('.w-ui-panel-icon').live('click', function () {
        if ($(this).hasClass('w-ui-panel-icon-opened')) {
            $(this).addClass('w-ui-panel-icon-closed').removeClass('w-ui-panel-icon-opened');
        }
        else {
            $(this).addClass('w-ui-panel-icon-opened').removeClass('w-ui-panel-icon-closed');
        }
    });
}

$(document).ready(function () {
    //    $('td.ColTemplate, td.ColValue,td.ColValue div,td.ColTemplate div').live('click', function () {
    //        alert(this.tagName + '- width:' + $(this).width() +' , outerWidth' + $(this).outerWidth());
    //    });
    //  setCommonEvents();

    //*********************************Show Time in the Application*************************//
    //  $('.jclock').jclock();
    //****End****//

    $('.unselectable').live('selectstart', function (e) {
        return false;
    })
    setAccordion();
    if (!window.console) {
        console = { 
            log:function(){
            },
            debug:function(){
            },
            info:function(){
            },
            warn:function(){
            },
            error:function(){
            }
        } ;
    
    } //dummy console for ie to avoid error


    //********************************* Initialize Asynce Widgets*************************//
    _Lang = 'en'; // $('[id$=_CurrentLang]')[0].value;

    $('[IsAsync]:not([autoinstance="false"])').each(function () {
        try {
            var conf = decJSON($(this).attr('conf')) || {};
            var Widget;
            if (!!conf.WidgetType) {
                try {
                    Widget = new AsyncWidgets.Widgets[conf.WidgetType](this, conf); // Confusing?? taking Property(AsyncWidgets.Widgets.RegisterUser ={}) using collection notation and then call object constructor
                    AsyncWidgets.Widgets.addWidget(conf.WidgetId, Widget);  //adding widget to the collection
                }
                catch (e) {
                    debugger;
                }
            }
            else {//if widget DataType not provide in the config of widget
                !!conf.WidgetId ? alert('Widget type not specified for widget: ' + conf.WidgetId) :
                              alert('Widget configuration is incorrect');
            }
        }
        catch (e) {
            debugger;
        }

    });
    AsyncWidgets.Widgets.initWidgets.defer(1); //deffered call to initalize widgets
    AsyncWidgets.WidgetManager.init();

    (function () {
        $('[formsetter]').each(function () {
            $(this).click(function () {
                var cf = decJSON($(this).attr('formsetter')) || {};

                if (!cf.forms || !cf.params) return;
                for (var i = 0; i < cf.forms.length; i++) {
                    AsyncWidgets.get(cf.forms[i]).setParams(cf);
                }

            });
        });
    }).defer(200);
});                                     //ready




AsyncWidgets.WidgetManager = function () {
    var me = this, containers = {};
    return {
        init: function () {
            this.bind($('[showwidget]'));
            return me;
        },
        bind: function (obj) {
            obj.click(function () {
                var w;
                //try 
                {
                    var conf = $(this).attr('showwidget');
                    if (conf.indexOf(':') > -1) {
                        Ext.applyIf(conf, { retType: false });
                        var cf = decJSON(conf), parent = AsyncWidgets.get(cf.parentId);
                        if (!parent.childExist(cf.widgetId, true))
                            parent.showChild(AsyncWidgets.get(cf.widgetId));
						conf = cf; 
                    }
                    else {
                        var retType = typeof $(this).attr('returntype') == 'undefined' ? false : true;
                        w = AsyncWidgets.get(conf), cid = $(w.el).parent()[0].id;
                        if (containers[cid] == w) {
                            containers[cid].refresh();
                            return retType;
                        }
                        w.show();
                        return retType;
                    }
                    return conf.retType;
                }
                //                catch (e) {
                //                    debugger;
                //                }
            });

        }
        ,
        hideLast: function (w) {
            if ($(w.el).parent().length) {
                var cid = $(w.el).parent()[0].id; //get the id of parent Container
                if (!cid) return;
                if (cid in containers) {
                    containers[cid].hide({src:'WidgetManager'}); //hide the last widget shown
                }
                containers[cid] = w; //save the current widget
            }
        },
        hide: function (container) {
            if (cid in containers) {
                containers[cid].hide();
            }
            return me;
        }
    };

} ();

//*************************************Widgets Collection********************************************//
AsyncWidgets.Widgets = function () {
    var _widgets = {};
    var _keys = [];
    var _count = 0;
    var _lastWidgetAdd = null, Observer = new Ext.util.Observable();

    Observer.addEvents({ 'initialized': true });
    return {
        on: function (event, handler) {
            Observer.on(event, handler);
        },
        addWidget: function (widgetId, widget) {

            _widgets[widgetId] = { index: _count, widget: widget };
            _keys[_count] = widgetId;
            _widgets[widgetId].index = _count;
            _lastWidgetAdd = widget;
            _count++;
        },
        removeWidget: function (widgetId) {
            if (!!_widgets[widgetId]) {
                delete _keys[_widgets[widgetId].index];
                delete _widgets[widgetId];
                _count--;
            }
        },
        
        getWidget: function (widgetId) {
          //  debugger;
            if (typeof _widgets[widgetId] == 'undefined') {

                console.log("Widget '" + widgetId + "' not found!");
            }
            else
                return _widgets[widgetId].widget;
        },
        getWidgetAt: function (index) {
            return _widgets[_keys[index]].widget;
        },
        contains: function (widgetId) {
            return !!_widgets[widgetId];
        },
        count: function () { return _count },
        initWidgets: function () {
            //debugger;
            for (var widgetId in _widgets) {
                if (_widgets[widgetId].widget.State.AutoInit) {
                    _widgets[widgetId].widget.init();
                }
            }
            Observer.fireEvent('initialized');
        }
    }
} ();
/************************************* <widgetContainer Widget> *******************************************/
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

        t.fireEvent('hide',conf);
        return t;
    },
    init: function () {
        this.invokeRA('init', { onSuccess: this.RASuccess.createDelegate(this),
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
        //debugger;
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
});
/************************************* </widgetContainer Widget> *******************************************/
/************************************* <Container Class> *******************************************/
AsyncWidgets.Widgets.Container = Ext.extend(Ext.util.Observable, {
    constructor: function (el, conf) {
        var t = this; t.base = AsyncWidgets.Widgets.Container.superclass;
        t.base.constructor.call(t, conf);
        t.el = el;
        t.$el = $(el);
        t.$el.css('position', 'relative')
        t.State = {};
        Ext.apply(t.State, conf);
        t.$el.attr('widgetid', t.State.WidgetId).attr('wtype', t.State.WidgetType);
        t.addEvents({ 'onLoad': true, 'onValidate': true, 'show': true, 'hide': true, 'refresh': true });
    },
    load: function () {
        var t = this;
        if (t.State.ShowOnLoad) {
            t.show();
        }
    },
    show: function (cf) {
        var t = this;
        cf = cf || {};
        Ext.applyIf(cf, { showChildern: true });
        AsyncWidgets.WidgetManager.hideLast(t);
        t.visible = true;
        $(t.el).show();
        t.fireEvent('show',cf);
        if (cf.showChildern) {
            $('[widgetid]', t.el).each(function () {

                var id = this.getAttribute('widgetid'), wg;

                if (AsyncWidgets.has(id)) {
                    wg = AsyncWidgets.get(id);
                    var w$ = $(wg.el);
                    //  if (w$.closest('div[wtype="Container"]').attr('widgetid') == t.State.WidgetId) {
                    if (w$.parent().closest('div[wtype="Container"]').attr('widgetid') == t.State.WidgetId) {
                        if (!!wg.load) {
                            wg.load();
                            wg.container = t;
                        }
                    }
                }
            });
        }
        return t;
    },
    childExist: function () {
        return false;
    },
    showChild: function (w) {
        var t = this;
        if (!!t.lastChild) t.lastChild.hide();
        t.lastChild = w;
        w.show();
    },
    hide: function () {
        var t = this;
        t.visible = false;
        t.$el.hide();
        return t;
    },
    css: function (stl, vl, sel, el) {
        //debugger;
        var t = this;
        el = el || t.css.el || t.el || $('body');
        sel = sel || t.css.sel;
        t.css.el = el;
        $(sel, el).css(stl, vl);
        return t.css.createDelegate(t);

    },
    remCss: function (styles, sel, el) {
        var t = this;
        el = el || t.css.el || t.el || $('body');
        sel = sel || t.css.sel;
        t.remCss.el = el;
        if (typeof styles == 'string') styles = decJSON("{'" + styles + "': true }");
        el$ = !sel ? $(el) : $(sel, el);
        el$.attr('style',
                    $.grep(el$.attr('style').split(';'),
                         function (curCssName) {
                             var stl = curCssName.split(':');
                             if (!styles[$.trim(stl[0].toLowerCase())]) {
                                 return curCssName;
                             }
                         }
                     ).join(";")
                    );
        return t.remCss.createDelegate(t);
    },
    refresh: function () {

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
});
/************************************* </Container Class> *******************************************/
/************************************* <TabPanel Widget> *******************************************/
AsyncWidgets.Widgets.TabPanel = Ext.extend(Ext.util.Observable, {
    constructor: function (el, conf) {
        var t = this; t.base = AsyncWidgets.Widgets.TabPanel.superclass;
        t.el = el;
        t.$el = $(el).hide();
        t.State = {};
        Ext.apply(t.State, conf);
        t.$el.attr('widgetId', t.State.WidgetId);

        t.scrollSize = "117";

        conf = conf || {};
        Ext.apply(t, {
            facade: 'DoAction',
            facadePath: 'WebServices/RemoteActions.asmx'
        }, conf);
        Ext.applyIf(t, { brClr: "#8DB2E3", bgClr: "#DEECFD", width: "100%", height: "100%" });

        t.tabs = {};

        t.addEvents({ 'onShowTab': true });
        t.base.constructor.call(t, conf);

        //        var t1 = $('<div style="width:100%;height:100%;background-color:gray;">hi how r u 1 hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1 hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1 hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1 hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1 hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1 hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1 hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1hi how r u 1 </div>'),
        //        t2 = $('<div style="width:100%;height:100%;background-color:gray;">hi how r u 2</div>'),
        //        t3 = $('<div style="width:100%;height:100%;background-color:gray;">hi how r u 3</div>');
        //        t.addTabs(
        //                    [
        //                        { wg: { id: 'test1', el:t1 , $el: t1 }, caption: 'Test 1' },
        //                        { wg: { id: 'test2', el:  t2 ,$el:t2}, caption: 'Test 2' },
        //                         { wg: { id: 'test3', el: t3 ,$el:t3}, caption: 'Test 3' }
        //                    ]
        //                    );
        if (t.State.AutoBuild) {
            t.build();
            AsyncWidgets.Widgets.on('initialized', function () {
                //debugger;
                if (!!t.State.Tabs) {
                    t.initTabs();
                }
            });
        }
    },
    initTabs: function () {
        var t = this;
        if (!!t.State.Tabs) {

            var ids = decJSON(t.State.Tabs), wgs = [], wg;

            for (var i = 0; i < ids.length; i++) {
                wg = AsyncWidgets.get(ids[i].widgetId);
                wgs[i] = { wg: wg, caption: wg.caption, closeable: !!ids[i].closeable };
            }
            t.addTabs(wgs);
            for (var i = 0; i < ids.length; i++) {
                wgs[i].wg.show();
            }
        }
        t.tabsInit = true;
    }
    ,
    setParentHeight: function () {

        var t = this;
        if (t.width == "100%") {
            var p = t.$el.parent(), pp = p.parent();
            //  p.click(function () { alert(p.height()); });
            if (p.hasClass('FitRem')) {
                var chs = pp.children(), i, h = 0;
                for (i = 0; i < chs.length; i++) {
                    var ch = $(chs[i]);
                    if (!ch.hasClass('FitRem')) {
                        h += ch.height();
                    }
                }
                //alert();outerHeight() - p.Height());.height() + " - " 
                //h + " - " + t.$el.outerHeight() - t.$el.height());
                p.height(pp.height() - (h + (p.outerHeight(true) - p.height())));
            }
        }
    }
    ,
    load: function () { //TabPanel Widget
        var t = this;

        if (!t.loaded) {
            t.setParentHeight();
            t.build();
            t.show();
            t.loaded = true;

            var s, fn;
//            s = $(t.el).children('pre[template="script"]');
			s = $('pre[template="script"][wid="'+t.State.WidgetId+'"]', t.el);
            if (s.length>0) {
                var ss = s[0].textContent || s[0].innerText || s[0].text;
                try {
                    eval(ss);
                }
                catch (ex) {
                    console.log(String.format('Error Evaluating2 JS!\n  - Message:     {0}\n   - Description:  {1}', ex.message, ex.name));
                }
                if (!!fn) {
                    t.fn = fn;
                    fn();
                }
            }
        }
        // else alert('already');
    },
    show: function () {
        var t = this;

        if (!t.built) {
            t.build();
        }
        if (!t.tabsInit) t.initTabs();

    },
    showChild: function (w, caption) {
        var t = this;
        if (!w) return;
        t.addTabs([{ wg: w, caption: caption}]);
        w.show();
    },
    build: function () {
        var t = this;
        t.$el.show().css({ width: t.width });

        t.tabEl = $('<div class="w-tab-tabEl">     </div>').css({ width: t.$el.width() });
        t.tabBar = $('<div class="w-tab-tabBar" ><div class="w-tab-scorll w-tab-LScorll"></div><div class="w-tab-scorll w-tab-RScorll"></div></div>');

        //  t.tabBar = $(".w-tab-tabBar",t.tabWrap);
        t.tabsCon = $('<div class="w-tab-tabCon" > </div>'); //width:562
        t.tabsList = $('<ul class="w-tab-tabsList unselectable" > </ul>'); //.css({ 'border-bottom-color': t.brClr }); // background-image: url('tab-strip-bg.gif')  w-tab-icon
        t.tabItem = $('<li class="w-tab-tabitem" ><a class="w-tab-close"></a>\
                   <span class="w-tab-leftCorner" ><em class="w-tab-rightCorner"><span class="w-tab-center"><span class="w-tab-caption">Tab 1</span></span></em></span>\
                   ');
        t.pnlBody = $('<div class="w-tab-pnlBody" ></div>'); //.css({ "border-top": 'none', "border-color": t.brClr });

        t.tabWrap = $('<div class="w-tab-tabWrap" ></div>').css('width', t.$el.width() - 2).append(t.tabBar.append(t.tabsCon.append(t.tabsList)));

        t.$el.append(t.tabEl.append(t.tabWrap));
        t.tabEl.append(t.pnlBody);

        t.tabsList.append($('<div class="clear"></div>'));
        $('.w-tab-LScorll', t.tabBar).
                    mouseover(function () { $(this).addClass('w-tab-LScorll-over') }).
                    mouseout(function () { $(this).removeClass('w-tab-LScorll-over') }).
                    click(function () { t.LScroll(t) });
        $('.w-tab-RScorll', t.tabBar).
                    mouseover(function () { $(this).addClass('w-tab-RScorll-over') }).
                    mouseout(function () { $(this).removeClass('w-tab-RScorll-over') }).
                    click(function () { t.RScroll(t) });
        // $(window).resize(function () { t.resized(t) }); //t.tabResized)
        // t.setSize.defer(250, t);
        $('body').mask('Please wait ...');
        (function () { t.resized(t); }).defer(1000);
        t.built = true;
    },
    resized: function (t) {
        // var t = this;
        // alert(t.$el.parent().height());
        // t.tabBar.css({ width: t.tabEl.width() - 2 });
        //t.setParentHeight();

        t.tabEl.css({ width: t.$el.width() });
        t.tabWrap.css('width', t.$el.width() - 2)
        t.tabEl.css({ height: t.$el.parent().height() });
        t.pnlBody.css({ height: t.$el.parent().height() - t.tabBar.height() - 5 });
        $('body').unmask();

    },
    setSize: function () {

        var t = this;
        t.tabEl.css({ height: t.$el.parent().height() });
        //  t.tabBar.css({ width: t.tabEl.width() - 2 });
        // t.tabsCon.css({ width: t.tabEl.width() - 38 });

        //                    t.tabBar.css({ width: t.parent.width() - 2 });
        //                    t.tabsCon.css({ width: t.parent.width() - 38 });
    },
    LScroll: function (t) {
        var pos = t.tabsCon.scrollLeft(), newPos = parseInt(pos) - parseInt(t.scrollSize);
        newPos = newPos < 0 ? 0 : newPos;
        if (pos == newPos) return;
        else {
            t.tabsCon.animate({ scrollLeft: newPos });
        }
    }
                ,
    RScroll: function (t) {
        var pos = t.tabsCon.scrollLeft(), newPos = parseInt(pos) + parseInt(t.scrollSize),
                    curLeft = $('.w-tab-tabitem:last', t.tabsList).position().left,
                    lastWidth = $('.w-tab-tabitem:last', t.tabsList).width(),
                    max = t.tabsCon.width() - (lastWidth + 4)
        newLeft = curLeft - (newPos - pos);
        if (curLeft == (max)) return;
        if (newLeft < max) {
            var diff = max - newLeft;
            t.tabsCon.animate({ scrollLeft: newPos - diff });
        }
        else {
            t.tabsCon.animate({ scrollLeft: newPos });
        }
    },
    addTabs: function (conf) {

        var t = this;
        var tab, tabToShow;
        for (var i = 0; i < conf.length; i++) {
            var item = conf[i], btn = t.tabItem.clone(), wg = item.wg, id = !!wg.id ? wg.id : wg.State.WidgetId;

            t.tabs[id] = {};
            tab = t.tabs[id];
            if (i == 0) tabToShow = tab;
            tab.id = id;
            $('.w-tab-caption', btn).html(!!item.caption ? item.caption : wg.State.Caption);
            item.closeable = item.closeable == false ? false : true;
            btn.attr('tabid', id);
            $('.w-tab-close', btn).attr('tabid', id).css('display', (item.closeable ? '' : 'none'));
            item.el = $('<div class="w-tab-tabDiv" style="display:none;height:100%"></div>').attr('tabid', id).css({ margin: t.tabMargin }).append(item.wg.$el.css({ 'overflow': 'auto', height: '100%' }));
            tab.wg = wg;
            tab.el = item.el;
            t.pnlBody.append(tab.el);

            tab.btn = btn;
            $('.clear', t.tabsList).before(btn);
            $('body').append($('.w-tab-caption', btn).clone().addClass('xxxx').css({ 'position': 'absolute', 'display': '', left: -5000 }))
            $('.w-tab-center', btn).width($('.xxxx').width() + 1);
            $('.xxxx').remove();
        }
        t.bindEvents();
        t.showTab(tabToShow);

        //        t.setSize();
        //        t.resized(t);
    },
    bindEvents: function () {
        var t = this;
        $('li', t.tabsList).unbind('click').bind('click', function () {
            //alert(); 
            var tabid = $(this).attr('tabid');
            t.showTab(tabid);
        });
        $('li .w-tab-close', t.tabsList).unbind('click').bind('click', function (event) {
            //debugger;
            var id = $(this).attr('tabid'), tab = t.tabs[id];
            if (tab.btn.prev().length == 0) {
                if (tab.btn.next().length == 0) return;
                t.showTab(tab.btn.next().attr('tabid'));
            }
            else {
                t.showTab(tab.btn.prev().attr('tabid'));
            }
            tab.wg.hide();
            tab.wg.$el.appendTo('body');
            tab.btn.remove();
            delete t.tabs[id];
            return false;
        });
    }
                ,
    childExist: function (id, act) {
        act = act || false;

        if (!!this.tabs[id]) {
            if (act) this.showTab(id);
        }
        return !!this.tabs[id];
    }
                ,
    showTab: function (tab) {
        var t = this, id;
        if (typeof tab == 'string') {
            id = tab;
            tab = t.tabs[id];
        }
        if (!!t.tabs[t.activeTabId]) {
            tabDeA = t.tabs[t.activeTabId];
            t.deActiveTab(tabDeA);
        }
        tab.btn.css({ 'margin-bottom': '-1px' });
        tab.el.show();
        $('.w-tab-caption', tab.btn).addClass('w-tab-selected-caption');

        //        t.css('padding-bottom', '5px', '.w-tab-caption', tab.btn)('background-position', '0 0', '.w-tab-leftCorner')
        //                    ('background-position', 'right -301px', '.w-tab-rightCorner')('background-position', '0 -151px', '.w-tab-center');

        t.css('background-position', '0 0', '.w-tab-leftCorner', tab.btn)
                        ('background-position', 'right -301px', '.w-tab-rightCorner')('background-position', '0 -151px', '.w-tab-center');

        t.activeTabId = tab.id;
        t.fireEvent('onShowTab', { t: t, tab: tab });
    },
    deActiveTab: function (tab) {
        var t = this;
        if (typeof tab == 'string') {
            var id = tab;
        }
        else {
            $('.w-tab-caption', tab.btn).removeClass('w-tab-selected-caption');
            //t.remCss('margin-bottom', '', tab.btn)('padding-bottom', '.w-tab-caption')('background-position', '.w-tab-rightCorner')('background-position', '.w-tab-leftCorner')('background-position', '.w-tab-center');
            t.remCss('margin-bottom', '', tab.btn)('background-position', '.w-tab-rightCorner')('background-position', '.w-tab-leftCorner')('background-position', '.w-tab-center');
            tab.el.hide();
        }
    },
    css: function (stl, vl, sel, el) {
        //debugger;
        var t = this;
        el = el || t.css.el || t.el || $('body');
        sel = sel || t.css.sel;
        t.css.el = el;
        $(sel, el).css(stl, vl);
        return t.css.createDelegate(t);

    },
    remCss: function (styles, sel, el) {
        var t = this;
        el = el || t.remCss.el || t.el || $('body');
        if (sel == '') t.remCss.sel = '';
        sel = sel || t.remCss.sel;
        t.remCss.el = el;
        if (typeof styles == 'string') styles = decJSON("{'" + styles + "': true }");
        el$ = !sel ? $(el) : $(sel, el);
        el$.attr('style',
                    $.grep(el$.attr('style').split(';'),
                         function (curCssName) {
                             var stl = curCssName.split(':');
                             if (!styles[$.trim(stl[0].toLowerCase())]) {
                                 return curCssName;
                             }
                         }
                     ).join(";")
                    );
        return t.remCss.createDelegate(t);
    }
}); 

/************************************* </TabPanel Widget> *******************************************/

/************************************* <Form Widget> *******************************************/
function hideFields(cf,hide) {
    var flds, i, fld,
    show = typeof hide =='undefined' || hide ? false: true ;
    if (!Ext.isObject(cf)) {
        cf = {fields: cf};
    }
    flds = typeof cf.fields == "string" ? cf.fields = $(cf.fields, cf.ctx) : cf.fields;

    if (!!cf.not)
        flds = flds.not(cf.not);
    if (!!cf.filter)
        flds = flds.filter(cf.filter);
    show ? flds.show() : flds.hide();
    flds = flds.filter('.date:not(.notdatepicker)');
    for (i = 0; i < flds.length; i++) {
        fld = flds[i];
       // if ($(fld).hasClass('.date') && !($(fld).attr('nodatepicker')))
        show ? fld.showTrigger() : fld.hideTrigger();

//        if (!!fld.relObjs) {
//            for (var key in fld.relObjs) {
//                if (!!fld.relObjs[key].hideWithField) {
//                    if (show ) 
//                        $(fld.relObjs[key]).show();
//                    else 
//                        $(fld.relObjs[key]).hide();
//                }
//            }
//        }
    }
}
function showFields(cf) {
    hideFields(cf,false);
}
function setDatePicker(ctx) {
    var el =ctx,dts;
    if (ctx instanceof jQuery)
        el = ctx[0];

    dts = $('.date:not(.notdatepicker)', ctx);

    for (var i = 0; i < dts.length; i++) {
        //<img class="ui-datepicker-trigger" src="images/calendar.gif" alt="..." title="...">
        var tcf=dts.attr('datepicker');
        try {
            tcf = decJSON(tcf || '{}');
        }
        catch (e) {
            alert('Unable to decode datepicker configuration!');
            tcf = { conf: {} };
        }
        var onSelect = function (value, date) {
            //$(this).trigger('change');
            if (!!this.onDateSelect) this.onDateSelect(this, value, date);
            if (!$(this).attr('disabled')) {
                this.focus();
                this.blur();
            }
        };
        cf = {
            showOn: "button",
            buttonImage: RES_PATH + "images/DatePicker.png",
            buttonImageOnly: true,
            changeMonth: true,
            changeYear: true,
            dateFormat: 'dd/mm/yy',
            onSelect: onSelect
        };
        Ext.apply(cf, tcf.conf);
        $(dts[i]).datepicker(cf);
        dts[i].hideTrigger =function () {  $.datepicker._getInst(this).trigger.hide()};
        dts[i].showTrigger = function () { $.datepicker._getInst(this).trigger.show() };
        if ($(dts[i]).css('display') == 'none') dts[i].hideTrigger();
//        if (!dts[0].relObjs) dts[0].relObjs = {};
        //       

    }
}
function GetArgVal(ArgId, GroupId, ctx) {
    GroupId = !!GroupId ? "[groupid='" + groupid + "']" : "";
    var e = $(GroupId + "[argumentid='" + ArgId + "']", ctx);
    if (e.length > 0) {
        return val(e[0], ctx);
    }
    else
    {
        console.log("Argument ID '" + ArgId + "' Not found!");
        return "Argument ID '" + ArgId + "' Not found!";
    }
}
function val(elem, ctx) {
    if (!ctx) { //if ctx is not given,
        if (!!val._ctx) {//if ctx is saved
            ctx = val._ctx; //restore ctx
        }
    }
    else {//if ctx is given save it
        val._ctx = ctx;
    }
    if (elem instanceof jQuery) {
        if (elem.length > 0) {
            elem = elem[0];
        }
    }
    else if (typeof elem == 'string') {
       
        //var $elem = $(`[argumentid="${elem}"]`, ctx);
        var $elem = $('[argumentid]:not(div[widgetid] div[widgetid] [argumentid])', ctx).filter(`[argumentid="${elem}"]`);
        if ($elem <1)
        {
            var $elem = $('[argumentid]:not(div[widgetid] div[widgetid] [argumentid])', ctx).find(`[argumentid="${elem}"]`);
        }
        if ($elem.length > 0) {
            elem = $elem[0];
        }
        else
        {
           
            var msg = `ArgumentId(${elem}) not found`;
            console.log(msg);
            $.showMessage(msg);
            return "";
        }
    }
    var text = $(elem).attr('valtype') == 'text' ? true : false;
    if (elem.tagName.toLowerCase() == 'select') {
        if (elem.selectedIndex > -1)
            return text ? $('option:selected', elem)[0].text : $('option:selected', elem)[0].value;
        else return "";
    }
    else if (elem.tagName.toLowerCase() == "textarea") {
        return $(elem).val();
    }
    else if (elem.tagName.toLowerCase() == 'input') {
        if ("textareapasswordhidden".indexOf(elem.type.toLowerCase()) > -1)
            return $(elem).val();
        else if (elem.type.toLowerCase() == 'radio') {
         //   var rdo = elem.name.toLowerCase(), grpid = elem.getAttribute('groupid');
            var rdo = elem.name, grpid = elem.getAttribute('groupid');
            //  var arr = $("[name='" + elem.name + "']", ctx).map(function () { if ($(this).attr('checked')) return this.value; });
            var rdVal;
            $("[name='" + rdo + "']", ctx).each(function () {
                if (this.checked) {
                    rdVal = $.trim(this.value);
                    return false;
                }
            });
            return !rdVal || rdVal == "" ? "" : rdVal;
            // return text? elem.value :$(elem).attr('checked');
        }
        else if (elem.type.toLowerCase() == 'checkbox') {
            return $(elem).attr('checked') ? "1" : "0";
        }

    }
    else if (elem.tagName == 'SPAN') {
        return $.trim($(elem).text());
    }
}


function SetDateFormat(date, returnType) {
    returnType = returnType||"string"
    var dttmAr = date.split(' '), dt, tm, nDate;
    dt = dttmAr[0].split('/');
    if (dttmAr.length > 1) {
        tm = dttmAr[1].split(':');
        return new Date(dt[2], dt[1] - 1, dt[0], tm[0], tm[1], tm[2]);
    }
    if (returnType == "string") {
        return dt[2] + "-" + dt[1] + "-" + dt[0];
    }
    else {
        return new Date(dt[2] , dt[1] - 1 , dt[0]);
    }
}
function getForm(container, ContainerGroup, DALInfo,Fields,NoEsacpe,cf) {
    //DALInfo might be DBObject or key value pair to add to Info form
    //Fields only add these fields of for to the info form
    var IsDebug = true;
    var groups = {};
    var currentGroup = "";
    cf = cf || {};
    cf = Ext.applyIf(cf, { filter: false });  // filter is a jquery selector to include only those elements which are in filter
    if (!!container) {
        var getAllFlds = !Fields;
        ContainerGroup = ContainerGroup || container.getAttribute('defGroup');
        DALInfo = DALInfo || container.getAttribute('defDALInfo')


        // containerId = !!containerId ? "#" + containerId + " " : "";  // container which can contain groups(each group for different table) of fields 
        ContainerGroup = !!ContainerGroup ? "='" + ContainerGroup + "']" : "]";
        var UniqueKeys = null, UniqueKeysWithVal = null;
        var flds;
        if ($('div[widgetid]', container).length < 1) {
            flds = $(`[groupid${ContainerGroup}`, container);
        }
        else {
            flds = $(`[groupid${ContainerGroup}:not(div[widgetid] div[widgetid] [groupid]`, container);
        }

        

        var fields = !cf.filter ? flds : flds.filter(cf.filter);

        fields.each(function () { // iterate throug each field of the container group(if specified else iterate through all fields in all groups in the container)

            //debugger;
            jqThis = $(this); //get current field
            if (!getAllFlds && Fields.indexOf(jqThis.attr("argumentid")) < 0) return;

            thisGroupId = jqThis.attr("groupid"); //get group id of the current field



            if (currentGroup != thisGroupId) {
                currentGroup = thisGroupId;
                if (!(currentGroup in groups)) {
                    groups[currentGroup] = $("<" + currentGroup + " >");
                }
            }
            if (!!jqThis.attr("uniquekey")) { //if current field is a unique key then add it to the xmlDoc
                if (!!groups[currentGroup].attr("uniquekeys")) {  //if uniquekey attribute is already created then append the current unique key

                    var OldUKs = groups[currentGroup].attr("uniquekeys"); //save old unique keys
                    groups[currentGroup].attr("uniquekeys", OldUKs + "," + jqThis.attr("uniquekey")); //append current unique key to uniquekeys
                }
                else //if uniquekey attribute is not created
                    groups[currentGroup].attr("uniquekeys", jqThis.attr("uniquekey")); //add current unique key to xmlDoc


            }
            var etype = this.type || "";
            if (etype.toUpperCase() == "RADIO")
                if (!this.checked) return;

            var fldVal = val(jqThis[0], container);
            var t = !!fldVal && fldVal != "";

            if (t) {
                fldVal = jqThis.hasClass('date') ?SetDateFormat( fldVal) : fldVal;
                groups[currentGroup].attr(jqThis.attr("argumentid"), fldVal);
            }
            else {//if field have no value

                if (jqThis.attr("allowedWhenempty") == '1') {
                    groups[currentGroup].attr(jqThis.attr("argumentid"), '@EA'); //@EA ==> EmptyAllowed
                }
                else {
                    groups[currentGroup].attr(jqThis.attr("argumentid"), '@EV'); //@EmptyValue
                }
            }
        });
    }
    else {
        groups["dummy"]  = $("<dummy>");
    }
    var Context = this;
    var ServiceInfo = "<root>";
    for (var groupId in groups) {
        var doc = groups[groupId][0].document;
        //debugger
        if (!!DALInfo) {

            var di = DALInfo,
                dal = di[groupId],
                gp = groups[groupId];

            if (!!dal)
                gp.attr('DALInfo', dal);
            else {

                addAttr(gp, di);

            }
        }
        if (!NoEsacpe)
            ServiceInfo += $("<div></div>").append(groups[groupId][0]).html().replace(/\\/g, '\\\\').replace(/"/g, '\\\"');
        else
            ServiceInfo += $("<div></div>").append(groups[groupId][0]).html(); 
    }

    ServiceInfo += "</root>"
    return ServiceInfo;
    //    exeWS(DoAction,
    //                ['ActorId', actorId, 'ActionId', actionId, 'ServiceInfo', ServiceInfo], OnSuccess, OnFailure);

}
function addAttr(obj, conf) {
    for (var key in conf) {
      
        if (typeof conf[key] != "boolean" && conf[key] === "") continue;
        obj.attr(key, conf[key]);
    }
}
var setListValue = function (ctl,val) // can be DOM or jquery
{
    ////////////////////////////////////////////
    if (!ctl.tagName) // if not a DOM object then convert it to DOM object
    {
        /////////////////////////////////////////////////////////
      //  console.log("Converting jquery to DOM");
        ctl = ctl[ 0 ];
    }

    ////////////////////////////////////////////
    val = val || "";

    val = val.toString().toUpperCase();
    for (var i = 0; i < ctl.options.length; i++)
    {
        let ctlVale = ctl.options[ i ].text.toUpperCase();
        if (ctlVale == val)
        {
            ctl.selectedIndex = i;
            return;
        }
    }
    //////////////////////////////////////////////////////
};
var setField = function (ctl, param, ctx)
{
    
    var tag, val;
    
    if (!ctx) { //if ctx is not given,
        if (!!setField._ctx) {//if ctx is saved
            ctx = setField._ctx; //restore ctx
        }
    }
    else {//if ctx is given save it
         setField._ctx = ctx;
    }


    if (Ext.isObject(param)) {
        val = param.val
    }
    else {
        val = param;
        param = { val: val };
    }

    if (typeof ctl == "string") { //if argumentid is passed, find it's control
        var $ctl = $('[argumentid]:not(div[widgetid] div[widgetid] [argumentid])', ctx).filter(`[argumentid='${ctl}']`);
        if ($ctl.length < 1)
        {
            $ctl=$('[argumentid]:not(div[widgetid] div[widgetid] [argumentid])', ctx).find(`[argumentid='${ctl}']`);
        }

        //$(`[argumentid='${ctl}']`, ctx);
        if ($ctl.length > 0) {
            ctl = $ctl[0];
        }
        else {
            console.log(`Set field error! controlid is ${ctl}`);
        }

    }

    else if (!ctl.tagName) { // if not DOM object
        if (ctl.length > 0) {
            ctl = ctl[0];
        }
        else {
            console.log('Set field error!');
            return;
        }
    }
    //console.log(`setting value: ${$(ctl).attr("argumentid")}-${param.val}`);
    tag = ctl.tagName;
    if (tag == 'SELECT') {
        if (val == '') {
            $(ctl)[0].selectedIndex = -1;
            if (!!$(ctl).attr('childcombo')) $(ctl).trigger('change'); 
        }

//        if ($(ctl).attr('argumentid') == "Branch")
//            debugger;
        if (!!$(ctl).attr('ccloading')) {
            arguments.callee.defer(1000, this, Array.prototype.slice.call(arguments));
            if (!ctl.masked) {
                ctl.masked = true;
                $(ctx).mask('Please wait while loading ...');
            }
            return;
        }
        if (!!ctl.masked) {
            $(ctx).unmask();
            ctl.masked = false;
        }
        let valType = $(ctl).attr("valtype") || "value";
        $(ctl)[ 0 ].selectedIndex = -1;
        if (param.type == "text" || valType == "text")
        {
            if (!!val)
            {
               // $("option:contains(" + val + ")", ctl).attr('selected', 'selected');
                setListValue(ctl,val);
                if (ctl.selectedIndex < 0)
                {
                    $(ctl).val(val);
                    //if ($.trim(ctl.options[ ctl.selectedIndex ].text).toUpperCase() != $.trim(val).toUpperCase())
                    //{
                       
                    //}
                }
            }

        }
        else {
            $(ctl).val(val);
            if ($(ctl).val() != val) { //if value is not set, from previous line
                if (val == '')
                {
                    ctl.selectedIndex = -1;
                    return;
                };
                //$("option:contains(" + val + ")", ctl).attr('selected', 'selected');
                setListValue(ctl, val);
            }
        }
        var ch = $(ctl).attr('childcombo'), sid = $(ctl).attr('storeinfo');
        if (ctl.selectedIndex < 0 && !param.isRow)
            console.log('value "' + val + '" not found in the list!');
        if (ctl.selectedIndex <= 0 && !!param.isRow && !!sid) {
            $(ctl).attr('rowvaluetoset', val);
        }
        //if (ctl.selectedIndex > 0 && !!param.isRow && !!ch) {
        if (ctl.selectedIndex > 0 && !!param.isRow) {
            $(ctl).trigger('change');
        }
    }

    else if (tag == 'INPUT') {
        if ('textareapasswordhidden'.indexOf(ctl.type) > -1) {
            $(ctl).val(val);
        }
        else if (ctl.type == 'radio') {
            var rdo = ctl.name, grpid = ctl.getAttribute('groupid');
            if ($("[name='" + rdo + "'][checked]", ctx).length>0)
                $("[name='" + rdo + "'][checked]", ctx)[0].checked = false;
            if (("" + val) != '') {
                if ($("[name='" + rdo + "'][value='" + val + "']", ctx).length > 0) {
                    $("[name='" + rdo + "'][value='" + val + "']", ctx).attr('checked', 'checked')
                }
                else {
                    if (val == null) {
                        if ($("[name='" + rdo + "'][default='default']", ctx).length > 0)
                             $("[name='" + rdo + "'][default='default']", ctx)[0].checked = true;
                    }
                    else
                        $("[name='" + rdo + "'][textvalue='" + val.toUpperCase() + "']", ctx).attr('checked', 'checked');
                }
            }
        }
        else if (ctl.type == ('checkbox')) {
            ctl.checked = !!(~ ~param.val);
        }
    }
    else if (tag == 'TEXTAREA') {
        $(ctl).val(val);
    }
    else if ('DIVSPAN'.indexOf(tag) > -1) {
        $(ctl).text(val);
    }
    else if (tag == 'IMG') {
        ctl.src = ctl.getAttribute('path') + param.val + (ctl.getAttribute('ext') || '');
    }
}
/******************************Form Widget class */
AsyncWidgets.Widgets.Form = Ext.extend(AsyncWidgets.widgetContainer, {
    constructor: function (el, config) {
        var t = this;
        t.rowItem = false;
        t.$el = $(el);
        t.base = AsyncWidgets.Widgets.Form.superclass;
        config = config || {};
        config.Controller = config.Controller || 'Form';
        t.base.constructor.call(this, el, config);
        t.addEvents({ 'actionSuccess': true, 'widgetAction': true, 'onActionClicked': true, 'afterActionClicked': true, 'onComboFilled': true,
            'beforeComboFill': true, 'onParentCobmoChanged': true, 'AutocompleteResult': true, 'onLoadingValues': true, 'beforeLoadingValues': true
            , 'LOVPopupShown': true, 'LOVPopupClose': true, FormClosing: true, FormClosed:true
        });
        AsyncWidgets.Widgets.on('initialized', function () {
            if (t.State.Hidden) {
                if (t.State.LoadOnInit) {
                    t.load();
                }
                else $(t.el).hide();
            }
            else
                t.show();
        });

        //        t.bindEvents();
        //        t.validator = new AsyncWidgets.Validater(t.el);
    },
    showPopup: function (cf) {
      
            //cf=>{ popupId: '-div-tag-id-of the popup', searchFormId: 'optional for row select popup', resultGridId: 'optional for row select popup', top:'top of the popup div',left:'' } //row select popup configuration
        //cf=>{ popupId: '-div-tag-id-of the popup', autoShowControls: 'searchFormId', top:'top of the popup div',left:''  } //non-row select popup configuration
       
        var t = this;
        var popId , searchForm, searchFormId, resGrd, resGrdId ,
            popup ,top,left,
            autoShowControls, popupControls = []; // comma separated controls which has to be shown automatically
        //console.log(cf.ctrl);
        if (!!cf.ctrl) {

            var txt = $(cf.ctrl), trow = txt.closest('tr');


            let lf = trow.offset().left, rw = trow.width();
            //t._LOVCon = $('<div style="padding:0px;display:none;position:absolute;border:1px solid #8298B0;background:#EEEEFF;"></div>')
            //    .css({ 'top': 100, 'width': rw - 2, left: lf });
            cf.top = trow.offset().top;
            cf.left = lf;
            cf.width = rw - 2;
        }

        left = cf.left || '8%';
        if (!!cf.ctrl) {// if control is given then
            var ctrl = cf.ctrl;
            popId = $(ctrl).attr('lovpopupid');
            popup = $(`div.LOVPopup[lovpopupid="${popId}"]`);
            autoShowControls = $(ctrl).attr('auto-show-popup-controls');
            searchFormId = $(ctrl).attr('lovsearchformid');
            resGrdId = $(ctrl).attr('lovresultgridid');
            top = cf.top|| $(ctrl).offset().top;

        }
        else { // if control is not give
            //{ popupId: '-div-tag-id-of the popup', searchFormId: 'searchFormId', resultGridId: 'resultGridId', top:'top of the popup div',left:'' } //row select popup configuration
            //{ popupId: '-div-tag-id-of the popup', autoShowControls: 'searchFormId', top:'top of the popup div',left:''  } //non-row select popup configuration

            popId = cf.popupId;
            popup = $(`div.LOVPopup[lovpopupid="${popId}"]`);
            autoShowControls = cf.autoShowControls;
            searchFormId = cf.searchFormId;
            resGrdId = cf.resultGridId;
            top = cf.top|| '20%';
         }


        if (popup.length < 1) {
            $.showMessage('A LOV popup with id:"' + popId + '" not found!');
            return;
        }
        
        //'#628296'

        popup.css({ position: 'absolute', top: top, left: left, 'z-index': '10000', border: '1px solid rgb(130, 152, 176)', 'background': 'rgb(238, 238, 255)', width:(cf.width||'900px' )}).show();
        if (!autoShowControls) { //row select grid with a search panel and datagrid

            searchFormId = !!searchFormId ? searchFormId : $('[wtype="Form"]', popup).attr('widgetid');
            searchForm = AsyncWidgets.get(searchFormId);
            if (!searchForm) {
                $.showMessage('LOV popup must contain at least a form - "' + popId + '"');
                return;
            }
            resGrdId = !!resGrdId ? resGrdId : $('[wtype="DataGrid"]', popup).attr('widgetid');
            resGrd = AsyncWidgets.get(resGrdId);
            if (resGrd.length < 1) {
                $.showMessage('LOV popup must contain at least a data grid - "' + popId + '"');
                return;
            }
            resGrd.on('rowClicked', function HandleRowClick(args) {
                args.canceled = false;
                t.setParams({ params: args.rowData, isRow: true });
                popup.hide();
                t.fireEvent('LOVPopupClosed', args);
                $(t.el).unmask();
                resGrd.removeListener('rowClicked', HandleRowClick);
            });
            $(t.el).mask("");
            $('.loadmask-msg', t.el).hide();
          //  popup.css({ position: 'absolute', top: top, left: '0px', 'z-index': '1000', 'background': '#628296' }).show();
            searchForm.show();

            resGrd.show();
            searchForm.search();

        }
        else {
            let ctrls = autoShowControls.split(',');

            for (var i = 0; i < ctrls.length; i++) {
                let ctrl = AsyncWidgets.get(ctrls[i]);
                if (!ctrl) {
                    console.log(`control(${ctrls[i]}) in LOV popup not found, popupid: ${popId}`);
                }
                else {
                    ctrl.show();
                    popupControls.push(ctrl);
                }
            }
           // $('body').css('overflow', 'clip');
            $(t.el).mask("");
            $('.loadmask-msg', t.el).hide();
           
            t.fireEvent('LOVPopupShown', popup);

        }

        $('.CloseLOVPopup', popup).bind('click.LOVPopup', function () {
           // $('body').css('overflow', 'clip');
            popup.hide();
            $(t.el).unmask();
            $('.CloseLOVPopup', popup).unbind('click.LOVPopup');
            t.fireEvent('LOVPopupClosed');
        });

    },//end of show popup function of form widget

    bindEvents: function () { //form widget
        var t = this, nestChilds = $('div[conf] *', t.el);
        $('.submit', t.el).not(nestChilds).click(function () { t.submit(this); return false; });
        $('.search', t.el).not(nestChilds).click(function () { t.search(this); return false; });
        $('#Close', t.el).click(function () {
            t.parent.show();
        });
        $('.CloseForm', t.el).not(nestChilds).click(function () {
            t.fireEvent("FormClosing");
            t.hide();
            t.fireEvent("FormClosed");
        });
        $('#Next', t.el).click(function () {
            t.showRec(t.RecNo + 1);
        });
        $('#Back', t.el).click(function () {
            t.showRec(t.RecNo - 1);
        });
        $('#First', t.el).click(function () {
            t.showRec(1);
        });
        $('#Last', t.el).click(function () {
            t.showRec(t.data.Count);
        });
        $('.DataAction', t.el).not(nestChilds).click(function () {
            t.submit(this);
            return false;
        });
        $('.WidgetAction', t.el).not(nestChilds).click(function () {
            t.fireEvent('widgetAction', this);
            //t.onWidgetAction(this); 
            return false;
        });
        $('.reset', t.el).not(nestChilds).click(function () {
            t.setParams({ reset: true });
            return false;
        });
        $('.ActionButton', t.el).not(nestChilds).unbind('click').click(function () {

            var cf;
            cf = !!$(this).attr('conf') ? decJSON($(this).attr('conf')) : {};
            t.ActionClicked(t, this, cf);
            return false;

        });


		//textbox which will show popup on focus
        $('.LOVPopup', t.el).focus(function ()
        {//form widget inside bindEvents()
            //this is textbox control
            //debugger;
            var cf = { ctrl: this };
            t.showPopup(cf);

            //var popId = $(this).attr('lovpopupid'), searchForm, searchFormId = $(this).attr('lovsearchformid'), resGrd, resGrdId = $(this).attr('lovresultgridid'),
            //    popup = $(`div.LOVPopup[lovpopupid="${popId}"]`),
            //    autoShowControls = $(this).attr('auto-show-popup-controls'),popupControls=[]; // comma separated controls which has to be shown automatically
        });//end of focus event
        t.AutoComplete();
    },
    AutoComplete: function (ctx) {
        var t = this;
        ctx = ctx || t.el;
        if (!!$('.AutoComplete', ctx).length) {
            var fnCB = function () {
                $('.AutoComplete', ctx).each(function () {

                    this.name = $(this).attr('argumentid');
                    function formatItem(row, i, total) {
                        var FormattedRow = "";
                        for (var iLoop = 0; iLoop < row.length; iLoop++) {
                            FormattedRow += (typeof row[iLoop] == 'undefined' ? " " : row[iLoop]) + (iLoop == (row.length - 1) ? "" : " &nbsp;, ");
                        }
                        return FormattedRow;
                    }
                    //MatchContains, cf.Multiple , cf.MatchSubset,cf.MinChar ,cf.Width,cf.Max,cf.Delay
                    var cf = decJSON(this.getAttribute('conf'));
                    cf.ACParams = cf.ACParams || {};
                    var opts = $.extend({
                        contentType: "application/json; charset=utf-8",
                        method: 'POST',
                        multiple: false,
                        matchContains: true,
                        matchSubset: false,
                        mustMatch: true,
                        autoFill: true,
                        width: 0,
                        max: 100,
                        cacheLength: 0,

                        delay: 500,
                        formatItem: formatItem,
                        cellSeparator: '||',
                        formatRequestData: function (p) {
                            var SrvInf, rdata = p.rdata;
                            rdata.QueryId = cf.QueryId || 'default';
                            rdata.StoreId = cf.StoreId;
                            SrvInf = getForm(ctx, null, rdata, cf.ParamFields, true);
                            t.fireEvent('getExtraParams', this, SrvInf);
                            $.extend(p.form, { ActorId: cf.ActorId, ActionId: cf.ActionId, ServiceInfo: SrvInf });
                            p.rdata = rdata = encJSON(p.form);
                        }

                    }, cf.ACParams);

                    var ac = $(this).autocomplete(ROOT_PATH + 'AsyncWidgets/WebServices/RemoteActions.asmx/DoAction', opts);
                    ac.result(function (event, data, formatted) {
                        if (!!data) {
                            if (!!cf.ArgToSet) {
                                for (var i = 0; i < cf.ArgToSet.length; i++) {
                                    if (!!data[cf.ArgToSet[i].Index]) {
                                        if (!!cf.ArgToSet[i].Name) {
                                            var grp;
                                            grp = !!cf.ArgToSet[i].GroupId ? '[groupid="' + cf.ArgToSet[i].GroupId + '"]' : "";

                                            setField($(grp + '[argumentid="' + cf.ArgToSet[i].Name + '"]', ctx), data[cf.ArgToSet[i].Index]);
                                        }
                                        else {
                                            alert('Field name not found!');
                                        }
                                    }
                                }
                            }
                        }
                        else {
                            if (!!cf.ArgToSet) {
                                for (var i = 0; i < cf.ArgToSet.length; i++) {
                                    if (!!cf.ArgToSet[i].Name) {
                                        var grp;
                                        grp = !!cf.ArgToSet[i].GroupId ? '[groupid="' + cf.ArgToSet[i].GroupId + '"]' : "";
                                        setField($(grp + '[argumentid="' + cf.ArgToSet[i].Name + '"]', ctx), '');
                                    }
                                    else {
                                        if (dbg()) alert('Field name not found!');
                                    }
                                }
                            }
                        }
                        t.fireEvent('AutocompleteResult', { elem: $(this), data: data });
                    });
                }); //end of .autocomplete.each()
            } //end of fnCB
            AsyncWidgets.loadCSS('jquery.autocomplete', 'AutoComplete');
            AsyncWidgets.loadJS('jquery.autocomplete', 'AutoComplete', fnCB);

        } //end of if
    }
    ,
    ActionClicked: function (t, btn, cf) { //form widget
        //try {

            cf.cancel = false;
            t.fireEvent('onActionClicked', cf);


            if (!(cf.Action in t)) {//if action function exists int this form object
                //  alert('Button action not found!');
                return;
            }
            if (!cf.cancel)
                t[cf.Action](t, cf, btn);
            t.fireEvent('afterActionClicked', cf);

        //} catch (ex) {
        //    console.log(ex);
        //}

    }
    , GetArgVal: function (ArgId, GroupId, ctx) {
        return GetArgVal(ArgId, GroupId, (ctx || this.el))
    },
    // read field values either by , separated names or by jquery object of fields selected
    GetArgs: function (params, ctx) {
        var values = {}, pn, t = this;
        ctx = ctx || t.el;
        if (Ext.isString(params)) {
            var ar = params.split(',');
            for (var i = 0; i < ar.length; i++) {
                pn = $.trim(ar[i]);
                if ($('[argumentid="' + pn + '"]', t.el).length > 0) {
                    values[pn] = val($('[argumentid="' + pn + '"]', t.el)[0], ctx);
                }
            }
        }
        else {
            for (var i = 0; i < params.length; i++) {
                pn = params[i].Name; //params ==> { [{Name:'Param1',Value:'param1Value'},{Name:'Param2',Value:'param2Value'}] } //value is optional
                var e$;
                if (!!params[i].Element) e$ = $(params[i].Element);
                if (typeof params[i].Value != 'undefined') {
                    values[pn] = params[i].Value;
                }
                else if (!!e$ && e$.length != 0) {
                    values[pn] = val(e$[0], window);
                }
                else if (!!params[i].SPParamName && $('[argumentid="' + pn + '"]', t.el).length > 0) {
                    values[params[i].SPParamName] = val($('[argumentid="' + pn + '"]', t.el)[0], ctx);
                }
                else if ($('[argumentid="' + pn + '"]', t.el).length > 0) {
                    values[pn] = val($('[argumentid="' + pn + '"]', t.el)[0], ctx);
                }
            }
        }
        return values;
    },
    SetArgVal: function (ArgId, val, ctx) {
        var t = this;
        ctx = ctx || t.el;
        setField($('[argumentid="' + ArgId + '"]', ctx), val, ctx);
        return t;
    },
    SetArgsVal: function (params, ctx) {
        var t = this;
        ctx = ctx || t.el;
        for (var i = 0; i < params.length; i++) {
            setField($('[argumentid="' + params[i].Name + '"]', ctx), params[i].Value, ctx);
        }
        return t;
    },
    GetFields: function (flds, ctx) {
        var t = this;
        if (!flds) return;
        ctx = ctx || t.el;
        var arr = flds.split(','), arg = '';
        for (var i = 0; i < arr.length; i++) {
            arg += '[argumentid="' + arr[i] + '"],';
        }
        return $(arg, ctx);
    },
    
    LoadCombo: function (t, cbo, ParentKey, cf) {
      //  debugger;
        var ch = cbo.filter('select'), sInfo = ch.attr('storeinfo');
        if (!sInfo) {
            console.log('Store info not found for: ' + ch.attr('argumentid'));
            return;
        }
        sInfo = decJSON(sInfo);
        sInfo["ParentKey"] = ParentKey;
        sInfo.IsParentSTR = !!sInfo.IsParentSTR || false;
        cf = cf || {};
        if (!!sInfo.Params) {
            Ext.apply(sInfo, t.GetArgs(sInfo.Params, t.el));
            delete sInfo.Params;
        }
        if (!!cf.params) { // cf.params is the object which can contain key:value pairs as paramsvis
            Ext.apply(sInfo, cf.params);
        }
        var inv = new AsyncWidgets.RAInvoker();
        inv.on('onSuccess', function (res) {

            var res = decJSON(res), itemAttrs = "";
            if (res.status == 'OK' && res.Response.Rows.length > 0) {

                if (!!sInfo.ItemExtraAttrs) {
                    var k = "", arr = sInfo.ItemExtraAttrs, i;
                    for (i = 0; i < arr.length; i++) {
                        itemAttrs += String.format(" {0}='{{1}}' ", arr[i], arr[i]);
                    }
                }
                // rowTemplate = '<tpl for="."><option  value="{' + sInfo.ValCol + '}">{[this.getField(values,\'' + sInfo.TextCol + '\') ]}</option></tpl>';
                rowTemplate = String.format('<tpl for="."><option {2} value="{{0}}">{{1}}</option></tpl>', sInfo.ValCol, sInfo.TextCol, itemAttrs);
                var rowTpl = new Ext.XTemplate(rowTemplate,
                    {
                        compiled: true,
                        disableFormats: true
                    });
                rowTpl.compile();
                var tt = rowTpl.applyTemplate(res.Response.Rows);

                if (!isList(ch))
                //$('option:first', ch).after($(tt));
                    $('option:first', ch).after(tt);
                else
                    ch.html(tt);
                //  ch.html($(tt));
                //to prevent a combobox from getting enabled automatically, add attribute "no-enable-on-values-loaded" with a value set to "true"
                var NoEnableOnValuesLoaded = ch.attr("no-enable-on-values-loaded") || "false";
               // NoEnableOnValuesLoaded = NoEnableOnValuesLoaded.toLowerCase();
                if (NoEnableOnValuesLoaded.toLowerCase() =="false") {
                    ch[0].disabled = false;
                }

                var vl = ch.attr('rowvaluetoset');
                if (!!vl) {
                    ch.attr('rowvaluetoset', '');
                    setField(ch, vl, t.el);
                }
            }
            ch.removeAttr("ccloading");
            ch.attr("loaded", "true");
            t.fireEvent('onComboFilled', { combo: ch, Response: res, valueToSet: vl });
            t.$el.unmask();
        });
        inv.on('onFailure', function (res) {
            t.$el.unmask();
            ch.removeAttr("ccloading", "");
        });
        ch[0].disabled = true;
        if (!isList(ch))
            $('option:not(:first)', ch).remove();
        else
            $('option', ch).remove();
        var args = { combo: ch, params: sInfo };
        t.fireEvent('beforeComboFill', args);
        var ServiceInfo = getForm(null, null, sInfo);
        ch.attr("ccloading", "Loading");
        t.$el.mask('Please wait while loading ... ');
        inv.invokeRA({ params: ["ActorId", "DataHelper", "ActionId", "ChildComboRows", "ServiceInfo", ServiceInfo] });
    },

    onCBOChanged: function (t, cbo) {
        var chid = cbo.getAttribute('childcombo'), ch, chids;
        if (!!chid) {
            chids = chid.split(',');
            for (var i = 0; i < chids.length; i++) {
                var ch = $('[argumentid="' + chids[i] + '"]', t.el);
                if (!!ch) {
                    t.fireEvent('onParentCobmoChanged', { parent: cbo, child: ch });
                    if (!!$(cbo).val()) {
                        t.LoadCombo(t, ch, $(cbo).val())
                    }
                    else {
                        $('option:not(:first)', ch).remove();
                        ch[0].disabled = true;
                    }

                } else {
                    alert('Store info not found for child of ' + cbo.getAttribute('childcombo'));
                }
            }
        }

    },
    setTemplates: function () { //form widget
        var t = this, s, fn, cbos, wc, cf;
        //s = $(t.el).children('pre[template="script"]');
        cf = $('pre[template="WidgetConfig"][wid="' + t.State.WidgetId + '"]', t.el).html();
        if (!!cf) {
            cf = cf.substring(cf.indexOf('{'), cf.lastIndexOf('}') + 1);
        }
        wc = { DataActionParams: {}, header: { Style: {}, Visible: false, Collapsed: false, HeadText: '' }, ContainerStyle: {} };
        $.extend(true, wc, decJSON(cf) || {});
        t.WCF = wc;

        if (wc.header.Visible) {//
            wc.header.template = $('<div class="x-form-container" style="padding:5px;"><center><div class="w-panel-head w-top-corner"><table cellspacing="0" cellpadding="0" border="0" style="width: 100%;"><tbody><tr><td><table cellspacing="0" cellpadding="0" border="0" style="width: 100%;"><tbody><tr><td class="w-head-text"></td></tr></tbody></table></td><td style="width: 100%;">&nbsp;</td><td><span class="w-ui-icon w-ui-panel-icon-opened w-ui-panel-icon" style="">&nbsp;</span></td></tr></tbody></table></div></center></div>').css(wc.ContainerStyle);
            $('.w-head-text', wc.header.template).html(wc.header.HeadText);
            $(t.el).prepend(wc.header.template);
            var frm = $('.x-form-container', t.el).next();
            while (1) {
                frm = frm.next();
                if (frm.length == 0)
                    break;
                else if (!!frm.attr('template') || frm[0].tagName == "STYLE")
                    continue;
                else break;
            }
            if (frm.length != 0) {
                $('.x-form-container center', t.el).append(frm);
                t.htmlForm = frm;
                frm.css('border', '1px solid #D0D0D0'); //.css('border-top','0px');
                if (wc.header.Collapsed) {
                    frm.hide();
                    $('.w-panel-head .w-ui-panel-icon', wc.header.template).addClass('w-ui-panel-icon-closed').removeClass('w-ui-panel-icon-opened');
                }
                $('.w-panel-head .w-ui-panel-icon', wc.header.template).click(function () {
                    if ($(this).hasClass('w-ui-panel-icon-opened')) {
                        frm.hide();
                        $(this).removeClass('w-ui-panel-icon-opened').addClass('w-ui-panel-icon-closed');
                    }
                    else {
                        $(this).removeClass('w-ui-panel-icon-closed').addClass('w-ui-panel-icon-opened');
                        frm.show();
                    }
                    return false;

                });
            }

        }
        //form widget template settings

        if (!!AsyncWidgets.WidgetScripts[t.State.WidgetId]) {

            AsyncWidgets.WidgetScripts[t.State.WidgetId](t);
        }
        else {
            setTimeout(() => {
                if (!!AsyncWidgets.WidgetScripts[t.State.WidgetId]) {

                    AsyncWidgets.WidgetScripts[t.State.WidgetId](t);
                }
            }, 2000);

        }
        //s = $('pre[template="script"]', t.el);
        s = $('pre[template="script"][wid="' + t.State.WidgetId + '"]', t.el);
        if (s.length > 0) {
            var ss = s[0].textContent || s[0].innerText || s[0].text;
            try {
                eval(ss);
            }
            catch (ex) {
                console.log(String.format('Error Evaluating3 JS!\n  - Message:     {0}\n   - Description:  {1}', ex.message, ex.name));
            }
            if (!!fn) {
                t.fn = fn;
                fn(t);
            }
        }
        //s = $('pre[template="WidgetConfig"]', t.el);
        s = $('pre[template="WidgetConfig"][wid="' + t.State.WidgetId + '"]', t.el);
        if (s.length > 0) {
            var ss = s[0].textContent || s[0].innerText || s[0].text;
            try {
                eval(ss);
            }
            catch (ex) {
                console.log(String.format('Error Evaluating4 JS!\n  - Message:     {0}\n   - Description:  {1}', ex.message, ex.name));
            }
            //            if (!!fn) {
            //                t.fn = fn;
            //                fn();
            //            }
        }
        s = $('input.WidgetAction[conf*="ActionId:\'HideForm\'"]', t.el);
        if (!!t.isGridFrom) { // hide close button for New Form (If there is a single form for add/edit) and show the edit button;
            s.hide();

            $('.CloseForm', t.el).show();
        }
        else {
            s.show();
            $('.CloseForm', t.el).hide();
        }
        cbos = $('select[childcombo],select[loadoninit]', t.el);
        for (var i = 0; i < cbos.length; i++) {
            var $cb = $(cbos[i]);
            if ($cb.attr('loadoninit') == 'true')
                t.LoadCombo(t, $(cbos[i]), "");

            if (!!$cb.attr('childcombo')) {
                $(cbos[i]).change(function () {
                    t.onCBOChanged(t, this);
                });
            }
        }
        /*                         header: {
        Style: {},
        Visible:true,
        Collapsed: true
        }
        */

        setDatePicker(t.el);
        t.bindEvents();
        t.validator = new AsyncWidgets.Validater(t.el,'', { widget: t });
        t.HtmlLoaded = true;
        t.fireEvent('TemplateLoaded');
    },
    onWidgetAction: function (ctl) {

    }
    ,
    showDetail: function (cf) {//form widget
        var t = this;
        t.SF = cf.SF;
        t.parent = cf.parent;
        t.PageSize = cf.PageSize;
        t.PageNo = cf.PageNo;
        t.data = null;
        t.showRec((cf.PageNo - 1) * cf.PageSize + parseInt(cf.ItemNo));
    }
    ,
    showRec: function (RecNo) {//form widget
        var t = this, $fld = $('[argumentid]', t.$el), ItemNo = RecNo % t.PageSize, nPageNo = Math.ceil(RecNo / t.PageSize);
        ItemNo = ItemNo == 0 ? t.PageSize : ItemNo;
        var fillData = function () {

            var r = t.data.Rows[ItemNo - 1];
            for (var i = 0; i < $fld.length; i++) {
                var fld = $fld[i], id = fld.getAttribute('argumentid');
                if (id in r) {
                    setField(fld, { val: r[id] }, t.$el);
                }
                else if (id + "_" + _Lang.toUpperCase() in r) {
                    var lngCF = decJSON(fld.getAttribute('lang') || '{}'),
                   type = lngCF.type || 'innerText';
                    fld.setAttribute('lang', String.format("{'type':'{0}',ar:'{1}',en:'{2}'}", type, r[id + "_AR"], r[id + "_EN"]));
                    setField(fld, { val: r[id + '_' + _Lang.toUpperCase()] }, t.$el);
                }
            }
            if (RecNo == 1) {
                t.css('display', 'none', '"#Back,#First"', t.el)('display', '', '#Back0,#First0');
            }
            else {
                t.css('display', '', '"#Back,#First"', t.el)('display', 'none', '#Back0,#First0');
            }
            if (RecNo < t.data.Count) {
                t.css('display', '', '"#Next,#Last"', t.el)('display', 'none', '#Next0,#Last0');
            }
            else {
                t.css('display', 'none', '"#Next,#Last"', t.el)('display', '', '#Next0,#Last0');
            }
            t.RecNo = RecNo; t.PageNo = nPageNo;
            $('img[argumentid]', t.el).each(function () {
                var tt = $(this), oldH = tt.height() + 10;
                tt.show();
                tt.parent().animate({ height: oldH, "min-height": oldH });
            });
            $("[argumentid]:not('img')", t.el).not('img').show(300);
        }
        $('#RecNo', t.el).text(RecNo + " ");
        if (!t.data || nPageNo != t.PageNo) {
            var inv = new AsyncWidgets.RAInvoker();
            inv.on('onSuccess', function (res) {
                var Res = decJSON(res);
                if (Res.status != "OK") { t.$el.unmask(); alert(Res.detail.message + "\t\n" + Res.detail.stackTrace); return; }
                var r = Res.Response;
                if (r.Rows.length > 0) {
                    $("#Count", t.el).html(r.Count);
                    if (!t.data) t.show();
                    t.data = r;
                    fillData();
                }
                t.$el.unmask();
            });

            inv.on('onFailure', function (res) {
                t.$el.unmask();

            });
            t.$el.mask('Please wait while loading ...');
            var t1 = { DALInfo: this.State.DALInfo, PageNo: nPageNo, PageSize: t.PageSize },
            ServiceInfo = getForm(t.SF.el, null, t1);
            inv.invokeRA({ params: ["ActorId", "DataHelper", "ActionId", "Search", "ServiceInfo",
        ServiceInfo]
            });
        }
        else {
            $('img[argumentid]', t.el).each(function () {
                var tt = $(this), oldH = tt.parent().height();
                tt.parent().css({ height: oldH, "min-height": oldH });
            });
            for (var i = 0; i < $("[argumentid]", t.el).length; i++) {
                if (i == $("[argumentid]", t.el).length - 1)
                    $($("[argumentid]", t.el)[i]).hide(200, function () { fillData(); });
                else
                    $($("[argumentid]", t.el)[i]).hide(200);
            }
        }
    },

    search: function (btn) {//form widget

        var t = this;
        if (!!t.rowDetail) {
            $('[forms~=' + t.State.WidgetId + ']', t.rowDetail.parent.el).each(function () {
                //debugger;widgetid
                //
                //AsyncWidgets.get(this.getAttribute('widgetid')).search({ wg: t, reset: true });
                var w = t.rowDetail.getControls(t)[this.getAttribute('widgetid')];
                w.search({ wg: t, reset: true, params: t.rowDetail.getValues(w.State.RelativeKeys) });

                //wgGRD.State.RelativeKeys.split(','),
                //wgGRD.search({ params: keys });
            });
            return t;
        }
        //find widgets who are attaced to this form and invoke search.
        $('[forms~=' + t.State.WidgetId + ']').each(function () {
            //debugger;
            var id = this.getAttribute('widgetid');
            if (!!id) {
                var sWG = AsyncWidgets.get(id);
                sWG.search({ wg: t, reset: true });
            }
        });
        return t;
    },
    setParams: function (cf) {//form widget
        var t = this, ctx = cf.ctx || t.el;
        ctx = ctx instanceof jQuery ? ctx : $(ctx);
        if (!!cf.reset) {
            $('[argumentid]:not(.noautoreset)', ctx).each(function (idx, elem) {
                
                setField(elem, '', ctx);
                $(elem).removeAttr("primaryKeyValue");
            });

            $('[argumentid][type="radio"][default="default"]', ctx).each(function (idx, elem) {
                elem.checked = true;
            });
        }
        var fld;
        var subWidgetFilter = "";
        if (ctx.length > 1 && !!ctx.attr('widgetid')) {//if ctx is jquery object with at least one element and is a widget div element
            let wid = ctx[0].id;
            subWidgetFilter = `:not(#${wid} div[widgetid] [argumentid])`;
        }
        if (!!cf.params)
        {
           // debugger;
            for (var param in cf.params)
            {

                //var $fld = ctx.find('[argumentid="' + param + '"]'),
                fld = null;


                var $fld = $(`[argumentid]${subWidgetFilter}`, ctx).filter('[argumentid="' + param + '"]');
                if ($fld.length < 1)
                {
                    $fld = $(`[argumentid]${subWidgetFilter}`, ctx).find('[argumentid="' + param + '"]')
                }
                if ($fld.length > 0)
                {
                    fld = $fld[0];
                }
                if (!fld)
                {
                    // debugger;
                    if (dbg())
                    {
                        alert("Field '" + param + "' not found in the form! ");
                    }
                    //console.log("Field '" + param + "' not found in the form! ");
                    continue;
                   
                };
                if (!!cf.isRow) {
                    var pr = { val: cf.params[param], isRow: true };
                    setField(fld, pr, ctx);
                }
                else {

                    setField(fld, cf.params[param],ctx);
                }
                var primarykey = $fld.attr('primaryKey'),
                    argumentid = $fld.attr('argumentid');

                if (!!primarykey) { // this field is either primarykey or uniquekey, save original pmk values
                    $fld.attr("primaryKeyValue", val(fld, t.el));

                    if (primarykey.toLowerCase().indexOf(argumentid.toLowerCase()) > -1) {//if this is primary key field not just a unique field
                        var pkOrg = $(`[argumentid="${argumentid}_Original"]`, t.el);
                        if (pkOrg.length < 1) {
                            $(`<input type='hidden' value='' name='${argumentid}_Original' argumentid='${argumentid}_Original' groupid='${$fld.attr('groupid')}' >`).appendTo(t.el);
                        }
                        pkOrg.val(val(fld, t.el));
                    }
                }
            }
        }
        if (!!cf.doSearch) {
            t.search();
        }
    },
    showInvalid: function (t) {//form widget
        //  $(":above-the-top")
        var top = $(window).scrollTop(), el;
        el = $('span[errmsg]:visible', t.el).filter(function () {
            return ($(this).prev().attr('isvalid') == "true" ? false : true);
        });
        // $($('span[errmsg]:visible')[0]).offset()
        if (el.length > 0) {
            if (top >= el.offset().top + el.height()) {
                $(document).scrollTop(el.offset().top + el.height() - 50);

            }
            try {
                $(el[0]).prev().focus();
            }
            catch (ex) {
            }
            (function (dl) { (function () { el.css('visibility', (el.css('visibility') == 'hidden' ? 'visible' : 'hidden')); }).defer(dl); return arguments.callee; })
            (0)(500)(1000)(1500);
        }
    },
    submit: function (btn) {//form widget
        var t = this;
        var cf = decJSON($(btn).attr('conf'));
        btn.cf = cf; 
        if (!!cf.GroupId) {
            t.validator = new AsyncWidgets.Validater(t.el, '[groupid="' + cf.GroupId + '"]', { widget: t });
        }
        $('span[errmsg]', t.el).hide();									   
        if (!t.validator.isValid({btn:$(btn)})) {
            t.showInvalid(t);
            return false;
        }
        var inv = new AsyncWidgets.RAInvoker();
        inv.on('onSuccess', function (res) {
            Ext.applyIf(cf, { ShowActionMsg: true });
            var res = decJSON(res);

            if (res.status == 'OK') {
                params = res.Response.split('||');
                if (params[1] == 'Error') {
                    $.showMessage(params[2]);
                }
                else {

                    $('[argumentid][isvalid]', t.el).trigger('blur');

                    t.fireEvent('actionSuccess', { btn: btn, cf: cf, res: res, params: params }); //deprecated

                    t.fireEvent('afterDataAction', { btn: btn, cf: cf, res: res, params: params });



                    t.setParams({ reset: cf.ResetOnSuccess }); //reset form if specified in button config

                    if (cf.ShowActionMsg) $.showMessage(params[2]);

                    if (!!cf.HideOnSuccess) {
                        $('.CloseForm', t.el).trigger('click');
                        //t.hide();
                    }
                    if (!!cf.Requery) {
                        t.loadValues();
                    }
                    if (!!cf.RequeryParent && !!t.parent) {
                        t.parent.Requery();
                    }
                }
            }
            else {
                if (dbg()) {
                    alert(res.detail.message);
                }
            }

            $(t.el).unmask();
        });
        inv.on('onFailure', function (res) {
            $(t.el).unmask();
            alert('Problem occured while connecting to web server');
        });

        var params = { Command: cf.Command, cancel: false };
        if (!!t.FormMode) {
            params.Action = t.FormMode;
        }
        Ext.apply(params, t.WCF.DataActionParams);
        if (!!cf.Params) {
            Ext.apply(params, cf.Params);
        }
        params.btn = btn;
        
        t.fireEvent('beforeDataAction', params);
        if (params.cancel) return;
        t.$el.mask('Please wait while loading ...');

        ServiceInfo = getForm(t.el, cf.GroupId || null, params, null, null, { filter: cf.filter });
        inv.invokeRA({ params: ["ActorId", cf.ActorId, "ActionId", cf.ActionId, "ServiceInfo",
        ServiceInfo]
        });
    },
    load: function () {//form widget
        var t = this, st = t.State;
        if (!!t.loaded) return t;
        var sh = function () {
            t.removeListener("HTMLLoaded", sh);
            t.base.load.call(t);
            if (!t.visible && st.ShowOnLoad)
                t.show();
        }
        var cbLogged = function (logged) {
            if (logged) {
                if (st.LazyLoading && !t.HtmlLoaded) {
                    t.on('HTMLLoaded', sh);
                    t.loadHtml();
                }
                else {
                    if (!t.HtmlLoaded) t.setTemplates();
                    sh();
                }
            }
        } (true);
        return t;

    },
    show: function () {//form widget
        var t = this, st = t.State;
        var onLoad = function () {
            t.removeListener("onLoad", onLoad);
            t.base.show.call(t);
            var pnlH = $('.w-panel-head', t.el);
            if (!$.boxModel && pnlH.length != 0 && !t.HeadSet) {
                pnlH.width(pnlH.parent().width() - 2);
                t.HeadSet = true;
            }
            if (!t.cboloaded) {
                t.cboloaded = true;
                $('select[loadon="FirstVisible"]', t.el).each(function () {
                    t.LoadCombo(t, $(this), "");
                });
            }
            $('select[loadon="EveryVisible"]', t.el).each(function () {
                t.LoadCombo(t, $(this), "");
            });
        }
        if (!t.loaded) {
            t.on('onLoad', onLoad);
            t.load();
        }
        else {
            onLoad();
        }

        return t;
    },
    refresh: function () {
        var t = this;
        t.base.refresh.call(t);
    },
    Requery: function (cf) {
        this.loadValues(cf);
    },
    loadValues: function (cf,success) {
        var t = this, st = t.State, ServiceInfo;
        cf = cf || {};
        $(t.el).mask(MSGWAIT);
        Ext.applyIf(cf, { Command: st.DALInfo, GroupId: null, ActorId: 'DataHelper', ActionId: 'Search', readFormValues:true, Params: {} });
        var inv = new AsyncWidgets.RAInvoker();
        inv.on('onSuccess', function (res) {
            res = decJSON(res);
            t.fireEvent('onLoadingValues', { res: res });
            if (res.status == 'OK') {
                if (res.Response.Rows.length > 0) {
                    t.setParams({ params: res.Response.Rows[0], isRow: true });

                }
                else {
                    t.setParams({ reset: true });

                }
            }
            t.fireEvent('onLoadedValues', { res: res });
            if (!!success)
            {
                success(res);
            }
            $(t.el).unmask();
        });

        inv.on('onFailure', function (res) {
            $(t.el).unmask();
            alert('Problem occured while connection to web server');
        });
        t.fireEvent('beforeLoadedValues', { cf: cf });
        var formEl = cf.readFormValues ? t.el : null; //when null then form values are retrieved

        ServiceInfo = getForm(formEl, cf.GroupId, Ext.apply({ Command: cf.Command, PageSize: -1 }, cf.Params));
        inv.invokeRA({ params: ["ActorId", cf.ActorId, "ActionId", cf.ActionId, "ServiceInfo",
            ServiceInfo]
        });
    }
});


/************************************* </Form Widget> *******************************************/

/************************************* <DataGrid Widget> ************************ *******************/
AsyncWidgets.Widgets.DataGrid = Ext.extend(AsyncWidgets.widgetContainer, {

    constructor: function (el, config) {
        var t = this, colTemplate, tt;
        t.$el = $(el);
        t.rowCount = -1;
        if ($('.smartLable').length == 0) { //,
            $('body').append($('<div class="smartLable" style="position:absolute;display:none;padding-left:5px;padding-right:5px"  >Init text</div>')
                .mouseleave(function () {
                    $(this).css('left', -1000);
                }).css({ 'left': -1000, 'position': 'absolute', 'background-color': '#FFFFE1', border: '1px solid black', 'font': '7.5pt/20px Verdana' })
            );
        }
        if (!$('.smartLable')[0].task) {
            var tsk = new Ext.util.DelayedTask(function () {
                $('.smartLable').css({ 'left': -1000 });
            });
            $('.smartLable')[0].task = tsk;
        }
        t.base = AsyncWidgets.Widgets.DataGrid.superclass;
        config = config || {};
        config.Controller = config.Controller || 'DataGrid';
        t.base.constructor.call(this, el, config);

        t.State.PageNo = 1;
        t.State.PgLen = 5;
        t.SingleEditForm = true;
        t.colFMT = false;
        t.addEvents({ 'rowsRendered': true, 'rowClicked': true, 'beforeSearchGetForm': true, 'beforeRowDelete': true, 'afterRowDelete': true, 
		'onNoRecords': true, 'onFetchRecords': true, 'onItemColGenerated': true, 'onActionClicked': true, 'afterActionClicked': true,
		'afterDataAction': true, 'beforeDataAction': true		
		});
        AsyncWidgets.Widgets.on('initialized', function () {
            if (t.State.Hidden) {

                if (t.State.LoadOnInit) {
                    t.load();
                }
                else $(t.el).hide();
            }
            else
                t.show();
        });

    },
    setHeader: function (header) {
        var t = this;
        $('>.GridContainer>table>tbody>tr:first .w-head-text', t.el).text(header);
    },
    setPage: function (pageNo) {
        var t = this;
        t.State.PageNo = pageNo;
        if (typeof t.searchCF != 'undefined') {

            t.searchCF.reset = false;
            //t.search({ wg: t, reset: false, params: t.RowDetailParams() });
            t.search(t.searchCF);
        }

        //t.searchCF.reset = false;
        //t.search({ wg: t, reset: false, params: t.RowDetailParams() });
        //t.search(t.searchCF);
    },
    setPageSize: function (PageSize) {
        var t = this;
        t.State.PageSize = PageSize / t.State.Columns;
        t.setPage(1);
    },
    RowDetailParams: function (keys) {

        var t = this;
        if (!!t.rowDetail) {
            keys = key || w.State.RelativeKeys;
            var w = t.rowDetail.getControls(t)[t.State.WidgetId];
            w.search({ wg: t, reset: true, params: t.rowDetail.getValues(w.State.RelativeKeys) });
            return t.rowDetail.getValues(w.State.RelativeKeys);
        }
        else {
            return null;
        }

    },
    ActionClicked: function (t, btn, cf) { //Datagrid widget
        //try {
            //debugger;
            cf.cancel = false;
            t.fireEvent('onActionClicked', cf);

            if (!(cf.Action in t)) {
                //  alert('Button action not found!');
                return;
            }


            if (!cf.cancel)
                t[cf.Action](t, cf, btn);
            t.fireEvent('afterActionClicked', cf);

        //} catch (ex) {
        //    alert(ex.Message);
        //}

    },
    HideGridForm: function (t, cf) {
        var gf = t.GridForms;
        Ext.applyIf(cf, {
            FormId: '',
            HideElem: '.GridContainer',
            Container: ''
        });
        if (!cf.Container)
            cf.Container = $(t.el);
        else {
            cf.Container = $(cf.Container, t.el);
        }
    },
    DeleteRows: function (t, cf, btn) {
        //ActionCF --> specified as part of button's configuration

        // var bcf = t.GridConf.buttons.DeleteRows || cf.ActionCF || false;

        var drs = t.GridConf.buttons, bcf = {}; //cf.ActionCF || t.GridConf.buttons.DeleteRows || false;
        drs.DeleteRows = drs.DeleteRows || {};
        bcf.Command = cf.Command || drs.DeleteRows.Command || false;
        bcf.DeleteKeys = cf.DeleteKeys || cf.KeysCol || drs.DeleteRows.DeleteKeys || false;

        if (!!bcf.Command || !!bcf.DeleteKeys) {
            Ext.applyIf(cf, bcf);
            Ext.applyIf(cf, { ActorId: 'DataHelper', ActionId: 'DeleteRows', ButtonId: $(btn).attr('buttonid') });
            var itemTbl, delKeys = cf.DeleteKeys, rowsToDelete = "";
            $('td.Item table .chkRowSelect', t.Repeater).each(function () {
                //  debugger;
                if (this.checked) {
                    itemTbl = $(this).closest('tr');
                    rowsToDelete += $('[colid="' + delKeys + '"] .ColValue', itemTbl).text() + ",";
                }
            });
            rowsToDelete = rowsToDelete.replace(/,$/g, '');
            var flags = { queryDelete: true };
            if (!!rowsToDelete) {
                Ext.apply(cf, t.GridConf.DataActionParams);
                t.fireEvent('beforeRowDelete', { cf: cf, flags: flags });
                if (!flags.queryDelete) return;0
                var ServiceInfo = getForm(null, null, Ext.apply(cf, { RowsToDelete: rowsToDelete })); // "<root>" + $("<dummyform></dummyform>") + "</root>";
                t.$el.mask('Please wait while loading ...');
                var inv = new AsyncWidgets.RAInvoker();
                inv.on('onSuccess', function (res) {
                    t.fireEvent('afterRowDelete', { res: res });
                    t.$el.unmask();
                    var res = decJSON(res);
                    if (res.status == 'OK') {
                        params = res.Response.split('||');
                        //                        if (~ ~params[0] > 0) {
                        if (!!t.searchCF) {
                            if (t.searchCF.wg)
                                t.search({ reset: false, wg: t.searchCF.wg });
                            else t.search({ reset: false });
                        }
                        else
                            t.search({ reset: false });
                        $.showMessage(params[2]);
                        //                        }
                        //  $.showMessage('Please select rows to delete', { position: 'top' });
                    }

                });
                inv.on('onFailure', function (res) {
                    t.$el.unmask();
                });
                inv.invokeRA({ params: ["ActorId", cf.ActorId, "ActionId", cf.ActionId, "ServiceInfo", ServiceInfo] });
            }
            else {
                $.showMessage('Please select rows to delete');
            }
        }
        else
            alert('Delete button configuration not found! ');
    },
    //open new grid form
    ShowGridForm: function (t, cf) { //grid widget
        //show inplace form(not inline form for edit)
        var frms = t.GridConf.forms, wFrm;
        if (!!frms.NewFormId) {
            wFrm = AsyncWidgets.get(frms.NewFormId);
            wFrm.isGridFrom = true;
            wFrm.FormMode = "new";
            var onHide = function (arg) {
                arg = arg || {};
                wFrm.removeListener("hide", onHide);
                if (arg.src == 'WidgetManager') return;
                if (!!frms.OnFormHideShow) {
                    AsyncWidgets.get(frms.OnFormHideShow).show();
                }
                else if (t.container != wFrm.container) {
                    if (!!t.container)
                        t.container.show();
                    else
                        t.show();
                }
                else {
                    t.show();
                }
                t.Requery();
            };

            if (!!wFrm) {
                wFrm.on('hide', onHide);
                $('.validateunique', wFrm.el).attr('isvalid', 'false');
                $('span[errmsg]', wFrm.el).remove();
                t.hide();
                wFrm.setParams({ reset: true, setDefault: true });
                wFrm.show();
            }
        }
        else {

            var gf = t.GridForms;

            if (!gf.templates) {
                alert('Grid form temlate not found');
                return;
            }
            Ext.applyIf(cf, {
                FormId: '',
                HideElem: '.GridContainer',
                Container: ''
            });
            if (!cf.Container)
                cf.Container = $(t.el);
            else {
                cf.Container = $(cf.Container, t.el);
            }


            if (!gf.forms) { //if no form is initialized yet
                var frm;
                gf.forms = {};

                gf.templates.each(function () {
                    //    debugger;
                    var conf = decJSON($(this).attr('conf')) || {};
                    frm = gf.forms[conf.WidgetId] = new AsyncWidgets.Widgets[conf.WidgetType](this, conf);
                    frm.isGridFrom = true;
                    cf.Container.append(frm.el);
                    $('.CloseForm', frm.el).click(function () {
                        var oFrm = gf.forms[$(this).data('formId')];
                        oFrm.hide();
                        $(cf.HideElem, t.el).show();
                    }).data('formId', conf.WidgetId);
                    frm.parent = t;
                    if (!gf.forms.defaultForm) {
                        gf.forms.defaultForm = frm;
                    }
                });
            }
            $(cf.HideElem, t.el).hide();
            if (!cf.FormId) {
                if (!gf.forms.defaultForm) {
                    alert('No default form found for the grid!');
                }
                gf.forms.defaultForm.show();
            }
            else
                gf.forms[cf.FormId].show();
        }
    },
    Requery: function () {
        this.setPage(this.State.PageNo);
    },
    RequeryGrid: function () {
        this.setPage(this.State.PageNo);
    },
    search: function (conf) { //grid widget
        var t = this;
        if (!t.visible) {
            t.show({ cf: conf, recall: true });
            return t;
        }
        //if grid is a child of another grid then get search form, and relative keys
        if (t.rowDetail) {
            if (!conf) conf = {};
            if (!!$(t.el).attr('forms')) {
                var w = t.rowDetail.getControls(t)[$(t.el).attr('forms').split(' ')[0]];
                Ext.apply(conf, { wg: w, params: t.rowDetail.getValues(t.State.RelativeKeys) });
            }
            else {
                Ext.apply(conf, { params: t.rowDetail.getValues(t.State.RelativeKeys) });
            }

        }
        $('.RowEditForm.ColValue', t.Repeater).unbind(); //unbind events for detail form
        var wg, ServiceInfo; //= conf.reset ?: conf;
        conf = conf || t.searchCF || {};
        //Ext.applyIf(conf, {reset:false})
        conf.reset = conf.reset || false;
        if (conf.reset) {
            t.State.PageNo = 1;
        }
        var pgNo = t.State.PageNo, PgSz = t.State.PageSize, pgCols = t.State.Columns;
        //t1 holds parameters which will be sent to server
        var t1 = { DALInfo: this.State.DALInfo, PageNo: pgNo, PageSize: PgSz * pgCols };

        t1 = !!conf.params ? Ext.apply(t1, conf.params) : t1;

        wg = conf.wg || null;
        if (!!t.sortCol) {
            Ext.apply(t1, { SortBy: t.sortCol + ' ' + t.sortDir });
        }
        
        Ext.apply(t1, t.GridConf.DataActionParams);
       
          t.fireEvent('beforeSearchGetForm', t1); 
        if (!!wg) {
            //            t.LastSF = wg;
            ServiceInfo = getForm(wg.el, null, t1); //  wg is search form widget
        }
        else {
            ServiceInfo = getForm(null, null, t1); // "<root>" + $("<dummyform></dummyform>") + "</root>";
        }
        t.searchCF = conf;
        var inv = new AsyncWidgets.RAInvoker();
        inv.on('onSuccess', function (res) {
            var Res = decJSON(res);
            $('.chkRowSelect', t.Header.repCon).attr('checked', false);
            //t.$el.unmask();
            if (Res.status != "OK") { alert(Res.detail.message + "\t\n" + Res.detail.stackTrace); return; }
            var rc = t.RowClose,
                ro = t.RowOpen,
                lastRow = (PgSz * pgCols),
                r = Res.Response;

            t.rowCount = r.Rows.length;
			t.rows = r.Rows;				   
            if (r.Rows.length > 0) {

                t.fireEvent("onFetchRecords");
                //                if (!!$(t.el).children('.ZeroRecs').length) {
                //                    $(t.el).children('.GridContainer,.NoRecsFound').remove();
                //                    $(t.el).children('.ZeroRecs').addClass('GridContainer').removeClass('ZeroRecs').show();
                //                }

                $('.NoRecsHide,.HeaderTR,.ItemTR', t.el).show();
                $('.NoRecordsTR', t.el).hide();
                var AutoCols = $('<td style="width:32px;" class="DataGridHead"><div style="width:19px;overflow:hidden;margin-left:5px;margin-right:8px"><input class="chkRowSelect" type="checkbox"></div></td>');

                if (!t.Header.added) {
                    var colTempHead = $(t.Header.colTemp), colTempItem = $(t.Item.colTemp), i = 0,
                            hTemps = t.Header.TempsById, iTemps = t.Header.TempsById, iTemps = t.Item.TempsById, tt, t2;

                    if (t.State.SelectableRow) {
                        tt = $('[templateid="SelectableRow"]', hTemps);
                        t2 = $('[templateid="SelectableRow"]', iTemps);
                        t2 = !t2.length ? tt : t2; //if item temlate is not specified use the same template for the item.

                        //default template for the old grid
                        var SelableRowH = AutoCols,
                                SelableRowI = SelableRowH.clone().removeClass('DataGridHead');

                        SelableRowH = !!tt.length ? $($('<div>').append(tt.clone()).html()) : SelableRowH;
                        SelableRowI = !!t2.length ? $($('<div>').append(t2.clone()).html()) : SelableRowI;

                        t.Header.repCon.append(SelableRowH.clone().addClass('RowSelect  ColName colIndex-' + i).attr('colid', 'RowSelect'));
                        t.Item.repCon.append(SelableRowI.clone().addClass('RowSelect ColValue colIndex-' + i++));
                    }
                    t.Header.ShowSequence = true;
                    if (t.Header.ShowSequence) {
                        tt = $('[templateid="Sequence"]', hTemps).addClass('Sequence');
                        t2 = $('[templateid="Sequence"]', iTemps).addClass('Sequence');
                        t2 = !t2.length ? tt : t2;  //if item temlate is not specified use the same template for the item.

                        var SeqH = $('<td  class="DataGridHead Sequence" align="center" style="width:40px"><div  class="PWCLabel ColName" style="overflow:hidden;"></div></td>'),
                                SeqI = SeqH.clone().removeClass('DataGridHead').css('overflow', 'hidden');
                        $('.ColName', SeqI).addClass('ColValue').removeClass('ColName');

                        SeqH = !!tt.length ? $($('<div>').append(tt.clone()).html()) : SeqH;
                        SeqI = !!t2.length ? $($('<div>').append(t2.clone()).html()) : SeqI;
                        SeqI.attr('align', 'center');
                        $('.ColValue', SeqI).css({ 'padding-right': '0px', 'overflow': 'hidden' }).html('{Sequence}');
                        $('.ColName', SeqH);
                        t.Header.repCon.append(SeqH.clone().addClass('colIndex-' + i).attr('colid', 'Sequence'));
                        t.Item.repCon.append(SeqI.clone().addClass('colIndex-' + i++));

                    }
                    var frms = t.GridConf.forms;
                    if (!!frms.EditFormId) {
                        var childRow = $('<td style="width:19px;"><div style="width:25px;overflow:hidden">&nbsp;</div></td>');
                        t.Header.repCon.append(childRow.clone().addClass('EditForm w-grid-head-back w-grid-cell-border ColName colIndex-' + i).attr('colid', 'EditForm'));
                        t.Item.repCon.append(childRow.clone().addClass('EditForm ColValue  w-grid-cell-border colIndex-' + i++).css('cursor', 'pointer'));
                    }
                    if (!!t.ChildGrids) {
                        var childRow = $('<td style="width:19px;"><div style="width:19px;overflow:hidden">&nbsp;</div></td>');
                        t.Header.repCon.append(childRow.clone().addClass('ChildGrid DataGridHead ColName colIndex-' + i).attr('colid', 'ChildGrid'));
                        t.Item.repCon.append(childRow.clone().addClass('ChildGrid ColValue colIndex-' + i++).css('cursor', 'pointer'));
                    }
                    if (t.State.RowEditForm) {

                        tt = $('[templateid="RowEditForm"]', hTemps);
                        t2 = $('[templateid="RowEditForm"]', iTemps);
                        t2 = !t2.length ? tt : t2; //if item temlate is not specified use the same template for the item.

                        var editRowH = $('<td style="width:19px;" class="RowEditForm DataGridHead"><div style="width:19px;overflow:hidden">&nbsp;</div></td>'),
                         editRowI = AutoCols.clone().removeClass('DataGridHead');

                        editRowH = !!tt.length ? $($('<div>').append(tt.clone()).html()) : editRowH;
                        editRowI = !!t2.length ? $($('<div>').append(t2.clone()).html()) : editRowI;

                        t.Header.repCon.append(editRowH.clone().addClass('ColName colIndex-' + i).attr('colid', 'RowEditForm'));
                        t.Item.repCon.append(editRowI.clone().addClass('ColValue colIndex-' + i++).css('cursor', 'pointer'));
                    }
                    for (var col in r.Rows[0]) {//iterate through each colum
                        if (!!t.RowDetail.templates) { //if RowDail template is provided
                            tt = $('[templateid="RowDetail"]', hTemps);
                            t2 = $('[templateid="RowDetail"]', iTemps);
                            t2 = !t2.length ? tt : t2; //if item temlate is not specified use the same template for the item.

                            var cRD,
                                detailRowH = $('<td style="width:19px;" class="DataGridHead RowDetail"><div style="width:19px;overflow:hidden">&nbsp;</div></td>'),
                                detailRowI = detailRowH.clone().removeClass('DataGridHead');

                            detailRowH = !!tt.length ? $($('<div>').append(tt.clone()).html()) : detailRowH;
                            detailRowI = !!t2.length ? $($('<div>').append(t2.clone()).html()) : detailRowI;

                            cRD = { length: 0 };

                            while (true) {

                                cRD = t.RowDetail.templates.filter('[colIndex=' + i + ']');
                                if (!!cRD.length) {
                                    var icon = cRD.attr('iconcss') || 'w-grid-row-detail-icon';
                                    t.Header.repCon.append(detailRowH.clone().addClass('ColName colIndex-' + i).attr('colid', 'RowDetail').attr('colindex', i));
                                    t.Item.repCon.append(detailRowI.clone().addClass(icon + ' ColValue colIndex-' + i).attr('iconcss', icon).attr('colindex', i++));
                                }
                                else break;

                            }
                        }
                        var _t = t.ColumnTemplates.templates;
                        if (!!t.ColumnTemplates.templates) {
                            var cl, colid, colCap, colCF;
                            t.colFMT = true;
                            for (iLoop = 0; iLoop < _t.length; iLoop++) {

                                cl = colid = _t[iLoop].getAttribute('columnid');

                                colCF = t.GridConf.cols[cl] || {};
                                colCap = colCF.caption == undefined ? cl.splitCamel() : colCF.caption;
                                tt = $('<TD  class="w-grid-head-cell w-grid-head-back w-grid-cell-border" ><DIV><SPAN class="w-grid-head ColName sort"></SPAN></DIV></TD>');
                                t2 = $('<TD  class="w-grid-cell-border"><DIV  class="ColValue w-grid-label"></DIV></TD>');
                                if (!!colCF.ColTDStyle) {
                                    if (!!t.GridConf.styles[colCF.ColTDStyle])
                                        t2.css(t.GridConf.styles[colCF.ColTDStyle]);
                                }														 

                                tt.addClass('colIndex-' + i).attr('colindex', i).attr('colid', cl);
                                $('.ColName', tt).html(colCap);

                                t2.addClass('colIndex-' + i).attr('colindex', i).attr('colid', cl);
                                var colTemp = $(_t[iLoop]).html();																  
                                var itemCol = $('.ColValue', t2).html(colTemp).parent();
                                t.Header.repCon.append(tt);
                                t.fireEvent('onItemColGenerated', { colId: cl, itemCol: itemCol });
                                t.Item.repCon.append(t2);
                                i++;
                            }
                            break;
                        }
                        else {
                            var colCF = t.GridConf.cols[col] || {}, colCap, colFMT;
                            colFMT = !!colCF.format ? ':' + colCF.format : '';

                            if (!t.colFMT)
                                t.colFMT = !!colCF.format;												  
                            if (!t.colFMT) t.colFMT = !!colCF.format;
                            colCap = colCF.caption == undefined ? col.splitCamel() : colCF.caption;
                            t.Header.repCon.append(
                                                $(".ColName", colTempHead.clone().addClass('colIndex-' + i).attr('colindex', i))
                                                .html(colCap)
                                                .closest('td').attr('colid', col)
                                              );
                            var itemCol = $(".ColValue", colTempItem.clone().addClass('colIndex-' + i++).attr('colid', col)).html("{" + col + colFMT + "}").parent();
                            t.fireEvent('onItemColGenerated', { colId: col, itemCol: itemCol });
                            t.Item.repCon.append(itemCol);
                        }
                    }
                    t.noOfCols = i;
                    $('.Header', t.Repeater).append(t.Header);
                    t.Header.added = true;
                    t.Item.html = $("<div>").append(t.Item).html();
                    $('.Pager', t.el).append(t.Pager);

                    $('.PageSize-' + t.GridConf.pager.PageSizeType, t.Pager).show();
                    $('td:not(".RowSelect, .Sequence, .RowEditForm, .RowDetail")', t.Header.repCon).click(function () {
                        t.sortCol = $(this).attr('colid');
                        t.sortDir = t.sortDir == 'Desc' || !t.sortDir ? 'Asc' : 'Desc';
                        t.RequeryGrid();
                    });
                    //Apply Styles to columns
                } //end of t.Header.added

                var rowTemplate = '<tpl for="." >' + t.Item.html.replace(">", " itemno='{ItemNo}' >") + "</tpl>"
                ItemsPerPg = PgSz * pgCols;

                $('.Item', t.Repeater).html(''); // 
                $('.PageNo', t.Repeater).attr('value', t.State.PageNo)
                $('div.PageNo,span.PageNo', t.Repeater).html(t.State.PageNo);
                $('.TotalPages', t.Repeater).html(r.Pages);
                $('.Count', t.Repeater).html(r.Count); //No of records

                $('.ItemStart', t.Repeater).html(ItemsPerPg * pgNo - ItemsPerPg + 1);
                $('.ItemEnd', t.Repeater).html(ItemsPerPg * pgNo - ItemsPerPg + r.Rows.length);

                $('.PageSize', t.el).each(function () {
                    if (this.tagName == 'SELECT')
                        $(this).val(t1.PageSize);
                    else {
                        if ($.trim($(this).html()) == t1.PageSize) {
                            $('.SelPageSize', t.el).removeClass('SelPageSize');
                            $(this).addClass('SelPageSize');
                        }
                    }

                });

                //**************************************************************************//
                var setPager = function (conf) {
                    //debugger;
                    var pager = $(conf.pager);


                    var j = Math.ceil(pgNo / t.State.PgLen) * t.State.PgLen - (t.State.PgLen - 1); // Math.ceil(pgNo / (PgSz * pgCols));
                    showHide = function (pgNo, pages, pagers) {
                        if ($('.w-grid-button', pager).length < 1) {
                            if (pgNo == 1) {
                                t.css('display', 'none', '.First, .Back', pagers);
                            }
                            else t.css('display', '', '.First, .Back', pagers);
                            if (pgNo == pages) {
                                t.css('display', 'none', '.Last, .Next', pager);
                            }
                            else
                            { t.css('display', '', '.Last, .Next', pager); }
                        }
                        else {
                            if (pgNo == 1) {
                                $('.First, .Back', pagers).addClass('w-icon-disabled');
                            }
                            else $('.First, .Back', pagers).removeClass('w-icon-disabled');
                            if (pgNo == pages) {

                                $('.Last, .Next', pagers).addClass('w-icon-disabled');
                            }
                            else
                                $('.Last, .Next', pagers).removeClass('w-icon-disabled');
                        }


                    }
                    showHide(t.State.PageNo, r.Pages, pager);

                    if (!pager.attr('events')) {

                        $('.Last', pager).click(function () {
                            if (t.State.PageNo == t.Pages) return;
                            t.setPage(t.Pages);
                        });
                        $('.First', pager).click(function () {
                            if (t.State.PageNo == 1) return;
                            t.setPage(1);
                        });
                        $('.Next', pager).click(function () {

                            if (t.State.PageNo == t.Pages) return;
                            t.setPage(t.State.PageNo + 1);
                        });
                        $('.Back', pager).click(function () {
                            if (t.State.PageNo == 1) return;
                            t.setPage(t.State.PageNo - 1);
                        });
                        var gotoPage = function (nPage) {
                            // var  =;
                            if (!!nPage && nPage > 0 && nPage <= r.Pages && nPage != t.State.PageNo) t.setPage(nPage);
                        };
                        $('.PageSize', t.el).unbind().change(function () {
                            t.setPageSize($(this).val());
                            return false;

                        }).click(function () {
                            if (this.tagName == "SELECT") return false;
                            t.setPageSize($.trim($(this).html()));
                            $(this).addClass('SelPageSize');
                            return false;
                        });
                        $('.PageNoToGo', t.el).keypress(function (e) {
                            if (e.which == 13) {
                                gotoPage(this.value || 1);
                                return false;
                            }
                        })
                        .focus(function () { $(this).addClass('w-ui-textbox-focus'); })
                        .blur(function () { $(this).removeClass('w-ui-textbox-focus'); });
                        $('.GoToPage', t.el).click(function () {
                            gotoPage(parseInt($.trim($('.PageNoToGo', $(this).parent()).val())));
                            return false;
                        });
                        var $e = $('.w-grid-button', t.el);
                        $e.unbind('mouseenter').bind('mouseenter', function () {
                            if (!$(this).hasClass('w-icon-disabled'))
                                $(this).addClass('w-grid-button-hover');
                            return false;
                        });
                        $e.unbind('mouseleave').bind('mouseleave', function () {
                            if (!$(this).hasClass('w-icon-disabled'))
                                $(this).removeClass('w-grid-button-hover');
                            return false;
                        });

                        pager.attr('events', 'true');
                    }

                } //end of pager function
                //**************************************************************************//
                $('.Pager', t.el).each(function () {
                    setPager({ pager: this });
                });

                t.Pages = r.Pages;
                var rowTpl;
                if (!t._rowTpl) {
                    rowTpl = new Ext.XTemplate(rowTemplate,
                    {
                        compiled: true,
                        disableFormats: !t.colFMT,
                        getField: function (vls, fld, conf) {
                            if (!!conf) {
                                conf.prop = conf.prop || 'innerText';
                                return String.format("lang=\"'type':'{0}',ar:'{1}',en:'{2}'\"", conf.prop,
                                       vls[fld + "_AR"], vls[fld + "_EN"]
                                );
                            }
                            else
                                return vls[fld + "_" + _Lang.toUpperCase()];
                        }
                    });

                    rowTpl.compile();
                }
                else {
                    rowTpl = t._rowTpl;
                }
                var rowsHtml = "", itemNo = 1, j, seq = (pgNo * PgSz - (PgSz - 1));
                for (var iLoop = 0; iLoop < lastRow && iLoop < r.Rows.length; iLoop += t.State.Columns) {
                    for (j = 0; j < t.State.Columns && itemNo <= r.Rows.length; j++, itemNo++) {
                        r.Rows[itemNo - 1]["ItemNo"] = itemNo;
                        r.Rows[itemNo - 1]["Sequence"] = seq++;
                    }

                    rowsHtml += rowTpl.applyTemplate(r.Rows.slice(iLoop, (iLoop + t.State.Columns)));
                }
                $('.Item', t.Repeater).unbind().html('').append($(rowsHtml));
                var cols = t.GridConf.cols, stl = t.GridConf.styles;
                if (!$.isEmptyObject(stl)) {
                    var tcolids = $('.Item td[colid]', t.Repeater), tcolstl;
                    for (var k in cols) {
                        var colst = cols[k].style; //$('.Item', t.Repeater)
                        if (!!colst) {
                            //var tcol = $('.Item td[colid="' + k + '"] .ColValue', t.Repeater), tcolstl;
                            var tcol = $('div.ColValue', tcolids.filter('[colid="' + k + '"]')); // tcolids.filter('[colid="' + k + '"] .colValue', tcolids);
                            tcolstl = tcol.attr('style') || '';
                            if (!!stl[colst])
                                tcol.attr('style', tcolstl + ";" + stl[colst]);
                            //    tcol.css('color','red');
                        }
                    }

                }
                $('.Item table:even', t.Repeater).addClass(t.EvenRowCSS);
                $('.Item table:odd', t.Repeater).addClass(t.OddRowCSS);
                $('table.' + $.trim(t.EvenRowCSS) + ',table.' + $.trim(t.OddRowCSS), t.el)
                .mouseenter(function () {
                    $(this).addClass('w-grid-row-hover');
                }).mouseleave(function () {
                    $(this).removeClass('w-grid-row-hover');
                }).click(function (e) {
                    if ($(e.target).hasClass('ColValue') || $(e.target).attr('colid') || $(e.target).closest('.ColValue').length)
                        t.fireEvent('rowClicked', { rowData: r.Rows[$(this).attr('itemno') - 1], e: e, row: this });
                    if (!!t.highLightedRow) {
                        t.highLightedRow.removeClass('w-grid-row-highlighted');
                        if (t.highLightedRow[0] === this) return;
                    }
                    $(this).addClass('w-grid-row-highlighted');
                    t.highLightedRow = $(this);
                });

                var nestWG = $('div[conf] *', t.el);
                if (t.hasListener('rowclicked')) {
                    var cols = $('table[itemno] td:not(.RowSelect,.EditForm)', t.el).not(nestWG).css('cursor', 'pointer');
                    $('.ColValue', cols).css('cursor', 'pointer');
                }
                if (t.State.SelectableRow) {
                    var rowChecks = $('.chkRowSelect', t.el).not(nestWG),
                        headCheck = $('.chkRowSelect', t.Header.repCon);
                    if (!t.State.SingleRowSelect) {
                        headCheck.click(function () {
                            if (this.checked)
                                rowChecks.not("[disabled]").attr('checked', true);
                            else
                                rowChecks.attr('checked', false);
                        });
                    }
                    $('.Item .chkRowSelect', t.Repeater).click(function () {
                        if (t.State.SingleRowSelect) {
                            var c = this.checked;
                            rowChecks.attr('checked', false);
                            this.checked = c;
                        };
                        if (this.checked && rowChecks.length - 1 == $('.chkRowSelect[checked]', t.el).not(nestWG).length)
                            headCheck.attr('checked', true);
                        else
                            headCheck.attr('checked', false);
                    });
                }

                t.setColWidth(t);
                (function () {
                    var lastCol = $('td:visible:last', t.Header.repCon), LCId, cols;
                    LCId = $('td:visible:last', t.Header.repCon).removeClass('w-grid-cell-border').addClass('w-grid-cell-border-last').attr('colindex');
                    cols = $('.colIndex-' + LCId, t.Repeater);
                    for (var i = 0; i < cols.length; i++) {
                        var tc = $(cols[i]);
                        tc.css('border-left', '1px solid ' + (tc.css('background-color') || 'transparent'));
                        tc.removeClass('w-grid-cell-border').addClass('w-grid-cell-border-last');
                    }
                }).defer(1);
                t.bindEvents();							  
                /********************************Row Detail**************************************/
                delete t.RowDetail.detail;
                t.RowDetail.detail = {};
                $('.RowDetail.ColValue', t.Repeater).unbind().click(function () {

                    var itemTbl = $(this).closest('table'),
                        rowIdx = itemTbl.attr('itemno'),
                        colIdx = $(this).attr('colindex'),
                        rd = t.RowDetail,
                        tmpl = rd.templates,
                        objName = "detail_" + rowIdx + "_" + colIdx,
                        colName = "col_" + colIdx,
                        dt;

                    if (!rd.detail[colName]) rd.detail[colName] = {};
                    dt = rd.detail[colName];
                    if (!dt[objName]) {

                        dt[objName] = {};
                        dt[objName].controls = {};
                        var dtRow = $('<tr class="RowDetailRow"><td class="RowDetailCell w-grid-cell-border"></td></tr>');
                        dt[objName].RowDetailRow = dtRow;
                        var dtObj = rd.templates.filter('[colindex="' + colIdx + '"]').clone().children();

                        var cf = decJSON(dtObj.attr('conf')) || {};
                        dt[objName].container = new AsyncWidgets.Widgets[cf.WidgetType](dtObj[0], cf);
                        dt[objName].container.show({ showChildern: false });
                        dt[objName].container.parent = t;
                        $('.RowDetailCell', dtRow).attr('colspan', t.noOfCols).append(dtObj);
                        $(this).closest('tr').after(dtRow);
                        //                        wgForm = t.EditForms[itemno] = new AsyncWidgets.Widgets.Form(EditForm[0], decJSON(EditForm.attr('conf')) || {});
                        //                        fitElems(null, wgForm.el);


                        var getValues = function (RK) {
                            var RK = RK.split(','), keys = {}, SInfo;

                            for (var j = 0; j < RK.length; j++) {
                                keys[RK[j]] = $('[colid="' + RK[j] + '"] .ColValue', itemTbl).html();
                            }
                            return keys;
                        };



                        var getControls = function (wg) {
                            var rdt = wg.rowDetail, p = rdt.parent.parent;
                            return p.RowDetail.detail["col_" + rdt.colIdx]["detail_" + rdt.rowIdx + "_" + rdt.colIdx].controls;
                        };
                        var AddWidget = function () {
                            var th = $(this), cf = decJSON(th.attr('conf')) || {};
                            var Widget = new AsyncWidgets.Widgets[cf.WidgetType](this, cf); // Confusing?? taking Property(AsyncWidgets.Widgets.RegisterUser ={}) using collection notation and then call object constructor
                            //Widget.RowDetail
                            dt[objName].controls[cf.WidgetId] = Widget;
                            Widget.rowDetail = { itemTbl: itemTbl, rowIdx: rowIdx, colIdx: colIdx, parent: dt[objName].container,
                                getControls: getControls, getValues: getValues
                            };
                            //Widget.rowDetail.parent = ;
                            // Widget.rowDetail.getControls = getControls;
                            Widget.show();
                        }
                        dt[objName].iconCell = $(this);
                        if (!dt.iconCSS) {
                            dt.iconCSS = $(this).attr('iconcss');
                            dt.iconCSSEx = dt.iconCSS + '-ex';
                        }
                        $('[IsAsync]', dtObj).not('pre[template] [IsAsync]', dtObj).each(AddWidget);
                        // $('[IsAsync]', dtObj).each(AddWidget);

                    }
                    if (!!dt[objName]) {
                        // dt[objName].container.show({ showChildern: false });
                        //expaneded
                        // var iconcss = dt[objName].iconCell.attr('iconcss');
                        if (dt["curRow"] == objName) { //toggle code

                            // dt[objName].container.hide();
                            dt[objName].RowDetailRow.hide();
                            dt[objName].iconCell.removeClass(dt.iconCSSEx).addClass(dt.iconCSS);
                            dt["curRow"] = null;
                            return;
                        }
                        if (!!dt["curRow"]) {
                            dt[dt["curRow"]].RowDetailRow.hide();
                            dt[dt["curRow"]].iconCell.removeClass(dt.iconCSSEx).addClass(dt.iconCSS);
                        }
                        dt[objName].RowDetailRow.show();
                        dt[objName].iconCell.removeClass(dt.iconCSS).addClass(dt.iconCSSEx);
                        // dt[objName].container.show({ showChildern: false });
                        dt["curRow"] = objName;
                    }



                });
                /********************************\Row Detail\***********************************/

                /********************************Edit Form**************************************/
                delete t.EditForms;
                t.EditForms = [];
                $('.RowEditForm.ColValue', t.Repeater).unbind().click(function () {
                    //debugger;
                    var itemTbl = $(this).closest('table'), itemno = itemTbl.attr('itemno'), parent;
                    if (t.SingleEditForm) {
                        //.not($('div[conf] *', t.el))
                        $('.RowEditorRow', t.el).not($('div[conf] *', t.el)).hide();
                    }
                    parent = $(this).closest('tr').parent();
                    //if ($('.RowEditorRow', parent).length == 0) {
                    if ($(' .RowEditorRow', parent).not($('div[conf] *', parent)).length == 0) {
                        var EditRow = $('<tr class="RowEditorRow "><td class="RowEditorCell w-grid-cell-border"></td></tr>');
                        var EditForm = t.RowEditForm.clone(), wgForm;
                        $('.RowEditorCell', EditRow).attr('colspan', t.noOfCols).append(EditForm.show());
                        $(this).closest('tr').after(EditRow);
                        wgForm = t.EditForms[itemno] = new AsyncWidgets.Widgets.Form(EditForm[0], decJSON(EditForm.attr('conf')));
                        // fitElems(null, wgForm.el);
                        wgForm.parent = t;
                        //    wgForm.isEditForm = true;
                        wgForm.show();
                        wgForm.on('actionSuccess', function (prs) {
                            if (!!prs.cf.RequeryParent)
                                t.RequeryGrid();
                        });

                        wgForm.on('widgetAction', function (ctl) {
                            EditRow.css('display', 'none');
                        });
                        var RK = wgForm.State.RelativeKeys.split(','), keys = {}, SInfo;
                        for (var j = 0; j < RK.length; j++) {
                            keys[RK[j]] = $('[colid="' + RK[j] + '"] .ColValue', itemTbl).html();
                        }
                        keys.Command = t.State.DALInfo;
                        Ext.apply(keys, wgForm.WCF.DataActionParams);
                        wgForm.fireEvent('beforeSearchGetForm', keys);
                        SInfo = getForm(null, null, keys);
                        var inv = new AsyncWidgets.RAInvoker();
                        inv.on('onSuccess', function (res) {
                            var res = decJSON(res);
                            if (res.status == 'OK') {
                                if (res.Response.Rows.length > 0) {
                                    t.EditForms[itemno].fireEvent('onLoadingValues', { res: res });
                                    t.EditForms[itemno].setParams({ params: res.Response.Rows[0], isRow: true });
                                    t.EditForms[itemno].fireEvent('onLoadedValues', { res: res });
                                }
                            }
                        });
                        inv.invokeRA({ params: ["ActorId", "DataHelper", "ActionId", "GetData", "ServiceInfo", SInfo] });
                    }
                    else {
                        $('.RowEditorRow', parent).not($('div[conf] *', parent)).show();
                    }
                });
                /********************************\Edit Form\**************************************/
                delete t.ChildGridsCol;
                t.ChildGridsCol = [];
                /********************************Child Grid**************************************/
                $('.ChildGrid.ColValue', t.Repeater).unbind().click(function () {
                    var jbtn = $(this); itemTbl = jbtn.closest('table'), itemno = itemTbl.attr('itemno');
                    var createNew = $('.ChildGridRow', jbtn.closest('tr').parent()).length == 0;
                    if (jbtn.hasClass('ChildGridExpanded')) {
                        jbtn.removeClass('ChildGridExpanded');
                        $('.ChildGridRow', $(jbtn).closest('tr').parent()).hide();
                        t.ChildGridsCol[itemno].base.hide.call(t.ChildGridsCol[itemno]);
                        t.lastGRD = { btn: this, GRD: t.ChildGridsCol[itemno] };
                        return;
                    }
                    if (createNew) {

                        var ChildRow = $('<tr class="ChildGridRow"><td class="ChildGridCell"></td></tr>');
                        var ChildGrid = t.ChildGrids.clone(), wgGRD;
                        $('.ChildGridCell', ChildRow).attr('colspan', t.noOfCols).append(ChildGrid.show());
                        $(this).addClass('ChildGridExpanded').closest('tr').after(ChildRow);
                        wgGRD = t.ChildGridsCol[itemno] = new AsyncWidgets.Widgets.DataGrid(ChildGrid[0], decJSON(ChildGrid.attr('conf')) || {});
                        if (!!t.lastGRD) {
                            $(t.lastGRD.btn).removeClass('ChildGridExpanded');
                            $('.ChildGridRow', $(t.lastGRD.btn).closest('tr').parent()).hide();
                            t.lastGRD.GRD.base.hide.call(t.lastGRD.GRD);
                        }
                        t.lastGRD = { btn: this, GRD: wgGRD };

                        var RK = wgGRD.State.RelativeKeys.split(','), keys = {}, SInfo;
                        for (var j = 0; j < RK.length; j++) {
                            keys[RK[j]] = $('[colid="' + RK[j] + '"] .ColValue', itemTbl).html();
                        }
                        wgGRD.search({ params: keys });


                    }
                    else {
                        //debugger;
                        if ($(this).hasClass('ChildGridExpanded')) { // already visible
                            $(this).removeClass('ChildGridExpanded');
                            $('.ChildGridRow', $(this).closest('tr').parent()).hide();
                            t.ChildGridsCol[itemno].base.hide.call(t.ChildGridsCol[itemno]);
                        }
                        else {

                            if (!!t.lastGRD) {
                                $(t.lastGRD.btn).removeClass('ChildGridExpanded');
                                $('.ChildGridRow', $(t.lastGRD.btn).closest('tr').parent()).hide();
                            }
                            $(this).addClass('ChildGridExpanded');
                            $('.ChildGridRow', $(this).closest('tr').parent()).show();
                            t.ChildGridsCol[itemno].base.show.call(t.ChildGridsCol[itemno]);
                            t.lastGRD = { btn: this, GRD: t.ChildGridsCol[itemno] };

                        }
                    }
                });
                t.fireEvent('rowsRendered');
            }
            else {
                var flags = { queryShowDefTemp: true };

                t.fireEvent("onNoRecords", { flags: flags });

                if (flags.queryShowDefTemp) {
                    $('.Pager', t.el).append(t.Pager);

                    $('.NoRecsHide , .HeaderTR, .ItemTR', t.el).hide();
                    $('.NoRecordsTR', t.el).show();
                    var $e = $('.w-grid-button', t.el);

                    $e.unbind('mouseenter').bind('mouseenter', function () {
                        if (!$(this).hasClass('w-icon-disabled'))
                            $(this).addClass('w-grid-button-hover');
                        return false;
                    });
                    $e.unbind('mouseleave').bind('mouseleave', function () {
                        if (!$(this).hasClass('w-icon-disabled'))
                            $(this).removeClass('w-grid-button-hover');
                        return false;
                    });
                    t.bindEvents();
                    $(t.el).unmask();
                }
                return;
            }
            $(t.el).unmask();
        });

        inv.on('onFailure', function (res) {

            $(t.el).unmask();
        });
        $(t.el).mask('Please wait while loading ...');
        inv.invokeRA({ params: ["ActorId", "DataHelper", "ActionId", "Search", "ServiceInfo",
        ServiceInfo]
        });
    },
    setColWidth: function (t) {
        var arrHead = [], arrCols = [], heads, col, hSel, cSel; //store queried head columns to bost performance
        if (!!t._arrHeads) {
            arrHead = t._arrHeads;
        }

        if (!t.ColWidthSettled) { //first time call only
            if (!(!$.boxModel && t.Top.hasClass('w-panel-head')))
                t.ColWidthSettled = true;

            var w, col, tp = 0;
            // hSel = $('> table  > tbody > tr.HeaderTR > td.Header td', t.Repeater
            hSel = $('.Header', t.Repeater);
            for (var i = 0; i < t.noOfCols; i++) {
                if (!t._arrHeads) { //if header columns is not saved, then construct the array - only first time
                    heads = $('.colIndex-' + i, hSel); //$('table > tbody > tr.HeaderTr > td .colIndex-' + i, t.Repeater);
                    arrHead[i] = heads;
                }
                else {
                    heads = arrHead[i];
                }
                heads.css({ 'padding-left': '0px', 'padding-right': '0px' });

                if (!!t._arrHeads) { t._arrHeads = arrHead }
                var b = t.GridConf.cols[heads.attr('colid')] || {}, LMmargin = ~ ~b.LeftMargin || ~ ~t.State.ColLeftMargin;
                if (!!b.width) {// if column width is defined in GridConfiguration then
                    w = b.width.replace(/px/g, '');
                    if (w == '0') heads.hide();
                    else {
                        if (!$.boxModel) {
                            w = (parseInt(w) || 0) + (parseInt(heads.css('borderLeftWidth')) || 0) + (parseInt(heads.css('borderRightWidth')) || 0);
                        }

                        $('.ColName', heads).closest('div').css({ 'white-space': 'nowrap', 'overflow': 'hidden', 'margin-left': LMmargin + 'px' }).width(w - LMmargin + "px");
                        heads.width(w);
                    }
                }
            }
            if (!t._arrHeads) t._arrHeads = arrHead;

            for (var i = 0; i < t.noOfCols; i++) {
                // heads = $('.Header .colIndex-' + i, t.Repeater);
                heads = arrHead[i];
                if (!$.boxModel) {
                    w = (parseInt(heads.width()) || 0) + (parseInt(heads.css('borderLeftWidth')) || 0) + (parseInt(heads.css('borderRightWidth')) || 0);
                }
                else
                    w = heads.width();

               // if (__IE8 && $.boxModel)
                    heads.width(w);
                var b = t.GridConf.cols[heads.attr('colid')] || {}, LMmargin = ~ ~b.LeftMargin || ~ ~t.State.ColLeftMargin;
                $('.ColName', heads).closest('div')
                .css({ 'white-space': 'nowrap', 'overflow': 'hidden', 'margin-left': LMmargin + 'px' }).width((w - (LMmargin + 10)))
               .mouseenter(
                function () {
                    //debugger; left: -1000,
                    var e = this, $e = $(this), sl = $('.smartLable'), lf, wd;

                    //  if ($e.width() + LMmargin < e.scrollWidth) {
                    if ($e.width() < e.scrollWidth) {
                        sl.html($e.text());
                        lf = $e.offset().left, wd = sl.width();
                        if ($('body').width() < (lf + wd + 14)) {
                            lf = lf - (lf + wd - $('body').width()) - 14;
                        }
                        sl.css({ left: lf, top: $e.offset().top - 20 }).show();
                        //  (function () { sl.css('left', '-1000') }).defer(5000);
                        sl[0].task.delay(5000);

                    }
                });

            }

        }
        //  cSel = $('> table  > tbody > tr.ItemTR td.Item ', t.Repeater);
        cSel = $('.Item', t.Repeater);
        for (var i = 0; i < t.noOfCols; i++) {
            // heads = $('.Header .colIndex-' + i, t.Repeater);
            heads = arrHead[i];
            // arrCols[i] = col = $('.Item .colIndex-' + i, t.Repeater);
            arrCols[i] = col = $('.colIndex-' + i, cSel); //$('table > tbody > tr.ItemTr > td .colIndex-' + i, t.Repeater);
            if (heads.css('display') == 'none') col.hide();
        }
        //   $('[itemno]', t.el).hide();
        for (var i = 0; i < t.noOfCols; i++) {
            //      $('.Header .colIndex-' + i, t.Repeater).click(function () { alert($(this).width()); return false; });
            ///       $('.Item .colIndex-' + i, t.Repeater).click(function () { $(this).width(41); alert($(this).width()); return false; });
            //  heads = $('.Header .colIndex-' + i, t.Repeater);
            heads = arrHead[i];
            //    if (heads.hasClass('RowSelect')) continue;
            // col = $('.Item .colIndex-' + i, t.Repeater).css('padding', '0px');
            col = arrCols[i];
            col.css('padding', '0px')
            var b = t.GridConf.cols[heads.attr('colid')] || {}, LMmargin = ~ ~b.LeftMargin || ~ ~t.State.ColLeftMargin;

            if (heads.css('display') == 'none')
                col.hide();
            else {
                w = b.width || heads.width();
                //  w = heads.width();
                //heads.width(w);
                if (!$.boxModel)
                    w = heads.width() + (parseInt(heads.css('borderLeftWidth')) || 0) +
                                        (parseInt(heads.css('borderRightWidth')) || 0) +
                                        (parseInt(heads.css('paddingLeft')) || 0) +
                                        (parseInt(heads.css('paddingRight')) || 0);
                else
                    w = heads.width() + (parseInt(heads.css('paddingLeft')) || 0) +
                                        (parseInt(heads.css('paddingRight')) || 0);
                if (!!b.NoToolTip) $('.ColValue', col).addClass('NoTooltip');
                $('.ColValue', col).css({ 'overflow': 'hidden', 'margin-left': LMmargin + 'px' }).width(w - (LMmargin + 10)).mouseenter(
                function () {
                    var e = this, $e = $(this), sl = $('.smartLable'), lf, wd;
                    if ($e.hasClass('NoTooltip') || $.trim($e.text()) == '') return;
                    //  if ($e.width() + LMmargin < e.scrollWidth) {
                    if ($e.width() < e.scrollWidth) {
                        if ($($e.html()).length > 0) {
                            sl.html($($e.html()));
                        }
                        else
						{							
							sl.html($e.text());
						}
                        lf = $e.offset().left, wd = sl.width();
                        if ($('body').width() < (lf + wd + 14)) {
                            lf = lf - (lf + wd - $('body').width()) - 14;
                        }
                        sl.css({ left: lf, top: $e.offset().top }).show();


                        //(function () { sl.css('left', '-1000') }).defer(5000);
                        sl[0].task.delay(5000);
                    }
                });

                col.width(w);
                //alert(heads.attr('colid') + ": " + w + ' - ' + col.width());
            }

        }
        if (!$.boxModel && t.Top.hasClass('w-panel-head') && !t.ColWidthSettled) {
            t.Top.width(t.Top.parent().width() - 2);
            t.ColWidthSettled = true;
        }
        return t;
    },
    submit: function () { //grid control
        var t = this, params;
        t.fireEvent('onSubmitting'); //DEPRECATE 
        var inv = new AsyncWidgets.RAInvoker();
        inv.on('onSuccess', function (res) {
            var res = decJSON(res);
            if (res.status == 'OK') {
                params = res.Response.split('||');
                if (params[1] == 'OK') {
                    alert(params[2]);
                }
                else {
                    alert(params[2]);
                }

            }

        });
        inv.on('onFailure', function (res) {
            t.status = "err";
            console.log('Problem occured while connection to web server');

        });
        t.status = "sav"; //saving
        var ServiceInfo = getForm(t.el, "RegisterNewUser", { RegisterNewUser: 'User_RegisterUser' });
        inv.invokeRA({ params: ["ActorId", "Authentication", "ActionId", "RegisterNewUser", "ServiceInfo",
        ServiceInfo]
        });

    },
    rowAction: function (t, cf, btn) {
        t = t || this;
        cf = cf || {};
        cf = Ext.apply({ ActorId: 'DataHelper', ActionId: 'DataAction', RequeryOnSuccess: true }, cf);

        //var cf = decJSON($(btn).attr('conf'));
        //        if (!!cf.GroupId) {
        //            t.validator = new AsyncWidgets.Validater(t.el, '[groupid="' + cf.GroupId + '"]');
        //        }
        //        if (!t.validator.isValid()) {
        //            t.showInvalid(t);
        //            return false;
        //        }

        var inv = new AsyncWidgets.RAInvoker();
        inv.on('onSuccess', function (res) {
            var res = decJSON(res);
            if (res.status == 'OK') {
                params = res.Response.split('||');
                if (params[1] == 'Error') {
                    $.showMessage(params[2]);
                }
                else {
                    //   $('[argumentid][isvalid]', t.el).trigger('blur');
                    //   t.fireEvent('actionSuccess', { btn: btn, cf: cf, res: res, params: params }); //deprecated
                    //   t.fireEvent('afterDataAction', { btn: btn, cf: cf, res: res, params: params });
                    //                    t.setParams({ reset: cf.ResetOnSuccess }); //reset form if specified in button config
                    $.showMessage(params[2]);
                    //                    if (!!cf.HideOnSuccess) {
                    //                        $('.CloseForm', t.el).trigger('click');
                    //                    }
                    if (!!cf.RequeryOnSuccess) {
                        t.Requery();
                    }
                }
            }
            else {
                if (dbg()) {
                    alert(res.detail.message);
                }
            }

            $(t.el).unmask();
        });
        inv.on('onFailure', function (res) {
            $(t.el).unmask();
            alert('Problem occured while connection to web server');
        });
        if (!!cf.ColumnParams) {
            var itemTbl = $(btn).closest('tr');
            if (!cf.Params) cf.Params = {};
            for (var i = 0; i < cf.ColumnParams.length; i++)
                cf.Params[cf.ColumnParams] = $('[colid="' + cf.ColumnParams[i] + '"] .ColValue', itemTbl).text();
        }
        var params = { Command: cf.Command };
        if (!!cf.Params) {
            Ext.apply(params, cf.Params);
        }
        //  Ext.apply(params, t.WCF.DataActionParams);
        //  t.fireEvent('beforeDataAction', params);
        //debugger;
        $(t.el).mask('Please wait while loading ...');
        //ServiceInfo = getForm(t.el, cf.GroupId || null, params, null, null, { filter: cf.filter });
        ServiceInfo = getForm(null, null, params);
        inv.invokeRA({ params: ["ActorId", cf.ActorId, "ActionId", cf.ActionId, "ServiceInfo",
        ServiceInfo]
        });
    },
    setTemplates: function () { //grid control
        var t = this, s, fn, cbos, el = t.el;

        //s = $(t.el).children('pre[template="script"]');
      //  console.log(t.State.WidgetId);
        if (!!AsyncWidgets.WidgetScripts[t.State.WidgetId]) {
            
            AsyncWidgets.WidgetScripts[t.State.WidgetId](t);
        }
        else {
            setTimeout(() => {
                if (!!AsyncWidgets.WidgetScripts[t.State.WidgetId]) {

                    AsyncWidgets.WidgetScripts[t.State.WidgetId](t);
                }
            }, 2000);

        }

        s = $('pre[template="script"][wid="' + t.State.WidgetId + '"]', t.el);
        if (s.length > 0) {
            var ss = s[0].textContent || s[0].innerText || s[0].text;
            try {
                eval(ss);
            }
            catch (ex) {
                console.log(String.format('Error Evaluating1 JS!\n  - Message:     {0}\n   - Description:  {1}', ex.message, ex.name));
            }
            if (!!fn) {
                t.fn = fn;
                fn(t);
            }
        }
        /////////////////// Setting Templates ////////////////////////////////
        Ext.applyIf(t.State, { ContainerMargin: '5px' });

        if (t.State.GridTemplate == 'jQueryUI') {
            t.Top = $('<div class="w-panel-head w-top-corner"> <table border="0" cellpadding="0" cellspacing="0" style="width:100%"> <tr> <td> <table border="0" cellpadding="0" cellspacing="0" style="width:100%"> <tr> <td class="w-head-text"> </td> </tr> </table> </td> <td style="width:100%">&nbsp;</td> <td> <span style="" class="w-ui-icon w-ui-panel-icon-opened w-ui-panel-icon">&nbsp;</span> </td> </tr> </table> </div>');
            t.Repeater = $('<div class="GridContainer"> <table cellspacing="0" cellpadding="0" border="0" style="width:100%;text-align:left"> <tbody> <tr class="TopTR"> <td class="Top"> </td> </tr> <tr class="HeaderTR"> <td class="Header w-grid-border"> </td> </tr> <tr class="ItemTR"> <td class="Item w-grid-border"> </td> </tr><tr class="NoRecordsTR" style="display:none;"><td class="NoRecords w-grid-norecords-msg" ></td></tr> <tr class="BottomTR"> <td class="Bottom"> </td> </tr> </tbody> </table> </div>');
            t.Header = $('<table cellspacing="0" cellpadding="0" width="100%" border="0" class="w-grid-header"> <tbody> <tr class="w-grid-head-back"> <td class=" ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border"> <div> <span href="#" class="w-grid-head ColName sort"></span> </div> </td> </tr> <tr class="TemplatesById"> <td templateid="SelectableRow" style="width:32px;padding:0;overflow:hidden;margin:0" class="w-grid-cell-border w-grid-head-back"> <div style="width:19px;overflow:hidden;overflow:hidden;margin-left:5px"> <input type="checkbox" class="chkRowSelect"></div> </td> <td templateid="Sequence" style="width:40px;overflow:hidden" class="w-grid-head-back w-grid-cell-border"> <div style="overflow:hidden" class="PWCLabel ColName"></div> </td><td templateid="RowEditForm" style="width: 40px;overflow:hidden;"  class="RowEditForm w-grid-head-back w-grid-cell-border"><div style="overflow: hidden;" class="PWCLabel ColName">&nbsp;</div></td><td templateid="RowDetail" style="width: 40px;overflow:hidden;"  class=" RowDetail w-grid-head-back w-grid-cell-border"><div style="overflow: hidden;" class="PWCLabel ColName">&nbsp;</div></td></tr> </tbody> </table>');
            t.Item = $('<table cellspacing="0" cellpadding="0" border="0" style="width:100%;table-layout:fixed"> <tbody> <tr class="ItemTableRow" style="white-space:nowrap" EvenRowCSS="w-grid-row-odd" OddRowCSS="w-grid-row-odd" HoverRowCSS=""> <td class="ColTemplate w-grid-cell-border" style="white-space:nowrap;overflow:hidden"> <div class="ColValue w-grid-label" style="white-space:nowrap"> </div> </td> </tr> <tr class="TemplatesById"> <td templateid="SelectableRow" style="margin:0;width:32px;overflow:hidden" class="w-grid-cell-border"> <div style="width:19px;overflow:hidden;margin-left:5px"> <input type="checkbox" class="chkRowSelect"></div> </td> <td templateid="Sequence" style="width:40px" class="w-grid-cell-border"> <div style="overflow:hidden" class="w-grid-label ColValue"></div> </td><td templateid="RowEditForm"   class="RowEditForm w-grid-cell-border"><div style="overflow: hidden;" class="w-grid-label ColValue">&nbsp;</div></td><td templateid="RowDetail"   class=" RowDetail w-grid-cell-border"><div style="overflow: hidden;" class="w-grid-label ColValue">&nbsp;</div></td></tr> </tbody> </table>');
            t.Pager = $('<table border="0" cellpadding="0" cellspacing="0" width="100%" style="background-color:White;padding:2px;table-layout:auto" class="w-grid-border-bottom" > <tbody> <tr> <td align="left" style="width:50%;height:26px"> <table border="0" cellpadding="0" cellspacing="0"> <tbody> <tr class="w-grid-buttons-bottom-container"> </tr> </tbody> </table> </td> <td align="center" class="NoRecsHide"> <table cellspacing="0" cellpadding="0" border="0" style="table-layout:auto;white-space:nowrap"> <tbody> <tr> <td class="w-all-corner w-grid-button First"> <span class="w-ui-icon-yellow w-grid-icon-first"></span></td> <td class="w-all-corner w-grid-button Back"> <span class="w-ui-icon-yellow w-grid-icon-pre"></span></td> <td style="padding-left:5px;padding-right:5px;width:4px;cursor:default" class="w-all-corner w-elem-disabled"> <div class="w-icon-separator"></div></td> <td dir="ltr" class="w-grid-pg-text PWCLabel" style="white-space:nowrap;vertical-align:middle;padding:0px">&nbsp;Page&nbsp;&nbsp;<input type="text" maxlength="7" size="2" class="PWCTextBox PageNoToGo PageNo">&nbsp;&nbsp;of&nbsp; <span class="TotalPages">&nbsp;2&nbsp;</span></td> <td style="padding-left:5px;padding-right:5px;width:4px;cursor:default" class="w-all-corner w-elem-disabled"> <div class="w-icon-separator"></div></td> <td class="w-all-corner w-grid-button Next"> <span class="w-ui-icon-yellow w-grid-icon-next"></span></td> <td class="w-all-corner w-grid-button Last"> <span class="w-ui-icon-yellow w-grid-icon-last"></span></td><td dir="ltr" style="padding-left:5px"> <select class="PWCDropDownList PageSize PageSize-Dropdown" style="display:none"> <option selected="" value="10" role="option">10</option> <option value="20" role="option">20</option><option value="30" role="option">30</option></select> </td></tr></tbody> </table> </td> <td align="right" style="width:50%" class="NoRecsHide"> <table border="0" cellpadding="0" cellspacing="0" width="100%"> <tbody> <tr> <td align="right"> <span><span class="PWCLabel PageSize-NumberList" style="padding-right:0px;display:none">Items per page : <span class="PageSize">10</span>, <span class="PageSize">20</span>, <span class="PageSize">30</span></span><span class="PWCLabel PageSize-NumberList" style="display:none;padding-left:10px;padding-right:10px">|</span> <span class="PWCLabel" Class="w-grid-item-startend" style="padding-right:5px">View <span class="ItemStart"></span> - <span class="ItemEnd">&nbsp;</span>&nbsp;of <span class="Count"></span></span> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table>');
            t.Bottom = $('<span class="Pager"></span>');
            t.NoRecords = $('<div style="padding:10px;background-color:transparent" class="PWCNoDataMessage">No records available.</div>')

        }
        else {

            t.Top = $(' <table width="100%" border="0" class="Actions"><tbody><tr><td><input type="button" conf="{Action:\'DeleteRows\'}" class="PWCButton ActionButton" value="Delete" id="btnDelete"><input type="button" conf="{Action:\'ShowGridForm\'}" class="PWCButton ActionButton" value="New" id="btnNew"></td></tr></tbody></table><table width="100%" border="0" class="NoRecsHide"><tbody><tr><td class="PWCListSummaryLabel"><span>Item Count (</span><span class="Count" style="font-weight: bold;">0</span><span>)</span></td><td align="center" class="PWCListSummaryLabel"><span>Page </span><span style="font-weight: bold;" class="PageNo">0</span><span> of </span><span class="TotalPages" style="font-weight: bold;">0</span></td><td align="right" class="PWCListSummaryLabel"><span>Page </span><input type="text" style="width: 25px;" class="PageNoToGo PWCTextBox"><span></span><input class="GoToPage PWCListSummaryButton" type="button" value="Go"></td></tr></tbody></table>');
            t.Repeater = $('<div class="GridContainer" ><table   cellspacing="0" cellpadding="0" border="0" style="width: 100%;text-align:left;" ><tbody><tr class="TopTR"><td class="Top"></td></tr><tr class="HeaderTR"><td class="Header"></td></tr><tr class="ItemTR"><td class="Item"></td></tr><tr class="NoRecordsTR" style="display:none"><td class="NoRecords" ></td></tr><tr class="BottomTR"><td class="Bottom"></td></tr></tbody></table><div>');
            t.Header = $('<table cellspacing="0" cellpadding="0" width="100%" border="0"><tbody><tr style="height:20px;background-image:url(../App_Themes/Silver/Images/cellback_SubSectionHead1.gif)"><td class="PWCListTitle ColTemplate" style="background-image:url(../App_Themes/Silver/Images/cellback_SubSectionHead1.gif)" ><div ><a href="#" class=\'PWCHyperLink ColName sort\'></a></div></td></tr></tbody></table>');
            t.Item = $('<table  cellspacing="0" cellpadding="0" border="0"><tbody><tr style="white-space:nowrap"><td class="ColTemplate" style="white-space:nowrap;overflow:hidden" ><div class="ColValue PWCLabel" style="white-space:nowrap"></div></td></tr></tbody></table>');
            t.Pager = $('<table border="0" width="100%" ><tbody><tr><td><a href="javascript:void(0);" class="PWCHyperLink First" >First</a><a href="javascript:void(0);" class="PWCHyperLink Next" >Next</a><a href="javascript:void(0);" class="PWCHyperLink Back" >Prev</a><a href="javascript:void(0);" class="PWCHyperLink Last" >Last</a></td></tr></tbody></table>');
            t.Bottom = $('<span class="Pager NoRecsHide" ></span>');
            t.NoRecords = $('<div style="padding:10px;background-color:transparent" class="PWCNoDataMessage">No records available.</div>')
        }
        //tpl.Bottom = $('<span class="Pager"></span>');

        var tpls = $(el).children('[template]'), TMPById, dtbl = $('<table></table>'), trow, key;


        tt = $('[template="Repeater"]', el).html();
        t.Repeater = !!tt ? $(tt) : t.Repeater;
        // t.Repeater.addClass('fitelem');
        // t.Repeater.wrap('<div>')


        tt = $('[template="Top"]', el).html();
        t.Top = !!tt ? $(tt) : t.Top;

        !t.State.ShowGridHead ?
                t.Top.hasClass('w-panel-head') ? t.Top.hide() : $('.w-panel-head', t.Top).hide()
                : null;
        tt = $('[template="Header"]', el).html();

        t.Header = !!tt ? $(tt) : t.Header;
        dtbl.append($('tr.TemplatesById', t.Header));

        t.Header.TempsById = dtbl;
        //        t.Header.SelableRowTemp = $('[templateid="SelectableRow"]', dtbl);

        t.Header.repCon = $('.ColTemplate', t.Header).parent();
        t.Header.colTemp = $('<div>').append($('.ColTemplate', t.Header)).html();


        tt = $('[template="Item"]', el).html();
        t.Item = !!tt ? $(tt) : t.Item;

        dtbl = $('<table></table>');
        dtbl.append($('tr.TemplatesById', t.Item));

        t.Item.TempsById = dtbl;
        t.Item.repCon = $('.ColTemplate', t.Item).parent();
        t.Item.colTemp = $('<div>').append($('.ColTemplate', t.Item)).html();


        tt = $('[template="Bottom"]', el).html();
        t.Bottom = !!tt ? $(tt) : t.Bottom;

        tt = $('[template="Pager"]', el).html();
        t.Pager = !!tt ? $(tt) : t.Pager;

        t.Pager = t.Pager || $($('[template="Pager"]', el).html());


        t.RowEditForm = $($('[template="RowEditForm"]', el).html());

        t.ChildGrids = $($('[template="ChildGrids"]', el).html());
        t.ChildGrids = t.ChildGrids.length == 0 ? false : t.ChildGrids;


        tt = $.trim($('[template="RowDetail"]', el).html());
        t.RowDetail = {};
        t.RowDetail.templates = !!tt ? $(tt) : false;

        tt = $.trim($('[template="ColumnTemplates"]', el).html());
        t.ColumnTemplates = {};
        t.ColumnTemplates.templates = !!tt ? $(tt).filter('pre') : false;

        //$(tpls).filter('[template="GridForm"]')
        tt = $.trim($(tpls).filter('[template="GridForms"]').html());
        t.GridForms = {};

        t.GridForms.templates = !!tt ? $(tt) : false;

        var grdCF = $('[template="GridConfig"]', el).html(), btnConf, gc;
        if (!!grdCF) {
            grdCF = grdCF.substring(grdCF.indexOf('{'), grdCF.lastIndexOf('}') + 1)
        }
        //gc = decJSON(grdCF) || { cols: {}, buttons: {} };
        gc = { forms: { ColIndex: RES_PATH + 'images/GridRowEdit.gif' }, cols: {}, buttons: {}, styles: {}, pager: { Visible: true, PageSizeType: 'NumberList' }, header: { Visible: true }, TopButtonPanel: { Visible: true} };
        $.extend(true, gc, decJSON(grdCF) || {}); // { cols: {}, buttons: {} };//
        gc.DataActionParams = gc.DataActionParams || {};
        t.GridConf = gc;
        t.GridConf.cols['Sequence'] = !!t.GridConf.cols['Sequence'] ? t.GridConf.cols['Sequence'] : { LeftMargin: 1 };

        $('.Top', t.Repeater).append(t.Top); //add top pager to the html
        $('.NoRecords', t.Repeater).append(t.NoRecords);
        $('.Bottom', t.Repeater).append(t.Bottom);
        if (!gc.pager.Visible) {
            $('.Bottom', t.Repeater).hide();
        }
        t.$el.append(t.Repeater);
        t.Repeater.css('padding', t.State.ContainerMargin);
        $(t.State.HideElems, t.el).hide();

        trow = $('tr:first', t.Item);

        t.EvenRowCSS = trow.attr('EvenRowCSS');
        t.EvenRowCSS = t.EvenRowCSS || "PWCEvenRow";
        t.OddRowCSS = trow.attr('OddRowCSS');
        t.OddRowCSS = t.OddRowCSS || "PWCOddRow";
        t.HoverRowCSS = trow.attr('HoverRowCSS');
        t.HoverRowCSS = t.HoverRowCSS || "";
        try {
            btnConf = decJSON(t.State.GridButtons || '{}');
        }
        catch (e) {
            alert('Unable to decode buttons configuration');
            btnConf = {};
        }
        t.buttons = {
            'refresh': { text: '', visible: false, location: 'bottom', conf: { Action: 'RequeryGrid'} },
            'delete': { text: 'Delete', location: 'top', conf: { Action: 'DeleteRows'} },
            'new': { text: 'New', location: 'top', conf: { Action: 'ShowGridForm'} }
        };
        $.extend(true, t.buttons, btnConf);
        var topBtnPnl, btnCount = 0;
        for (key in t.buttons) { //iterate through all the buttons;
            var btn = t.buttons[key], btnEl, topPanelAdded;
            btn.location = btn.location || 'both'
            Ext.applyIf(btn, { text: btn.conf.text || '&nbsp;', containers: '.w-grid-buttons-bottom-container', 'CSSclass': 'ActionButton', visible: true, conf: '{}', icon: 'w-ui-icon-' + key, iconImage: 'w-ui-icon-yellow' });
            if (btn.location == 'bottom' || btn.location == 'both') {
                var cons = $(btn.containers, t.Pager);

                btnEl = $('<td class="w-all-corner w-grid-button"><div class="unselectable w-grid-icon"></div> <div class="unselectable w-grid-icon-text"></div></td>')
                .attr('buttonid', key).attr('conf', (Ext.isObject(btn.conf) ? encJSON(btn.conf) : btn.conf));
                $('.w-grid-icon', btnEl).addClass(btn.icon + " " + btn.iconImage);
                if (!!btn.CSSclass)
                    btnEl.addClass(btn.CSSclass);
                if (!!btn.text)
                    $('.w-grid-icon-text', btnEl).html(btn.text);
                else
                    $('.w-grid-icon-text', btnEl).hide();
                if (!btn.visible) btnEl.hide();
                $('.w-grid-icon', btnEl).css('display', !!btn.conf.HideIcon ? 'none' : '');
                cons.append($('<div>').append(btnEl).clone().html());
            }
            if (btn.location == 'top' || btn.location == 'both') {
                var iconImg = 'grid-action-' + key;
                btnCount++;
                if (!topPanelAdded) {
                    topPanelAdded = true;
                    topBtnPnl = $('<div class="w-grid-buttons-top-container" style=" background: none repeat scroll 0 0 #E1E9EC;margin: 0;padding: 0;width: 100%;border-top: 1px solid #E6ECEF;border-left: 1px solid #D0D0D0;border-right: 1px solid #D0D0D0;height: 30px;padding-top: 2px;vertical-align: middle;"><ul style="list-style: none outside none;margin: 1px 0 0;padding: 0;" class="buttonsCon" ></ul><br clear="all"></div>');
                }
                if (btn.text == "Delete") { btn.text = "Delete Selected Item(s)"; }
                btnEl = $('<li style="display:block;float:left;cursor:pointer;margin-bottom:0px" class="ActionButton unselectable" ><a class="w-grid-top-buttons" style="color: #105678;display: block;font-size: 11px;padding: 5px 5px 5px 28px;background: url(' + RES_PATH + 'images/' + iconImg + '.gif) no-repeat scroll 8px center transparent; text-decoration:none;"  >' + btn.text + '</a></li>')
                            .attr('buttonid', key).attr('conf', (Ext.isObject(btn.conf) ? encJSON(btn.conf) : btn.conf));
                $('.buttonsCon', topBtnPnl).append(btnEl);
                if (!btn.visible) {
                    btnCount--;
                    btnEl.hide();
                }
            }
        }
        if (!!topBtnPnl) {
            $('.Top', t.Repeater).append(topBtnPnl);
        }
        if (!btnCount || !gc.TopButtonPanel.Visible) {
            topBtnPnl.hide();
        }
        //////////////////// Collapse Header ////////////////////////////////
        $('.w-head-text', t.Top).text(t.State.GridHeadText || '');
        if (!gc.header.Visible)
            $('.w-head-text', t.Top).closest('.w-panel-head').hide();
        /////////////////// Setting Templates ////////////////////////////////
        t.bindEvents();
        t.HtmlLoaded = true;

        var pnl = $('.w-ui-panel-icon', t.el);

        if (pnl.length > 0) {
            pnl.bind('mouseleave', function () {
                $(this).addClass('w-ui-icon').removeClass('w-ui-icon-hover');
            });
            pnl.bind('mouseenter', function () {
                $(this).addClass('w-ui-icon-hover').removeClass('w-ui-icon');
            });
            pnl.bind('click', function () {

                if ($(this).hasClass('w-ui-panel-icon-opened')) {

                    $(this).addClass('w-ui-panel-icon-closed').removeClass('w-ui-panel-icon-opened');
                    $('.w-grid-buttons-top-container,.Header, .Pager, .Item,Top *:not(.w-panel-head)',t.el).hide();
                }
                else {
                    $(this).addClass('w-ui-panel-icon-opened').removeClass('w-ui-panel-icon-closed');
                    $('.w-grid-buttons-top-container,.Header, .Pager,.Item,Top > *:not(.w-panel-head)',t.el).show();
                }
            });
        }



        t.fireEvent('TemplateLoaded');
    },
    bindEvents: function () { //grid control
        var t = this, el = t.el;
        $('.ActionButton', el).not($('div[conf] *', el)).unbind('click').click(function () {
            //debugger;
            var cf;
            cf = !!$(this).attr('conf') ? decJSON($(this).attr('conf')) : {};
            t.ActionClicked(t, this, cf);

        });
        //called on when edit form is opened (non-row edit)
        $('.EditForm.ColValue', t.el).click(function () {
            var frms = t.GridConf.forms, wFrm;
            frms.EditFormId = frms.EditFormId || frms.NewFormId;
            
            wFrm = AsyncWidgets.get(frms.EditFormId);
            wFrm.FormMode = "update";
            wFrm.isGridFrom = true;

/******************************************on hide handler**************************************************************/

            var onHide = function (arg) {
                arg = arg || {};
                
                wFrm.removeListener("hide", onHide);
                if (arg.src == 'WidgetManager') return;

                if (!!frms.OnFormHideShow) {

                    AsyncWidgets.get(frms.OnFormHideShow).show();
                }
                else if (t.container != wFrm.container) {

                    if (!!t.container)
                        t.container.show();
                    else
                        t.show();
                }
                else {
                    t.show();
                }
                
                t.Requery();
            };
/******************************************end: on hide handler**************************************************************/
            //Grid EditForm
            if (!!wFrm) {
                $(t.el).mask(MSGWAIT);
                wFrm.on('hide', onHide);
                t.hide();
                wFrm.setParams({ reset: true });
                $('span[errmsg]', wFrm.el).remove(); //remove all error messages
                // wFrm.validator = new AsyncWidgets.Validater(wFrm.el); // add new validator
                $('.validateunique', wFrm.el).attr('isvalid', 'true');
                wFrm.show();

                var RK = frms.Keys.split(','), keys = {}, SInfo, itemTbl = $(this).closest('tr');
                for (var j = 0; j < RK.length; j++) {
                    keys[RK[j]] = $('[colid="' + RK[j] + '"] .ColValue', itemTbl).html();
                }
                keys.Command = t.State.DALInfo;
                Ext.apply(keys, wFrm.WCF.DataActionParams);
                SInfo = getForm(null, null, keys);
                var inv = new AsyncWidgets.RAInvoker();
                inv.on('onSuccess', function (res) {
                    var res = decJSON(res);
                    if (res.status == 'OK') {
                        if (res.Response.Rows.length > 0) {
                            wFrm.fireEvent('onLoadingValues', { res: res });
                            wFrm.setParams({ params: res.Response.Rows[0], isRow: true });
                            wFrm.fireEvent('onLoadedValues', { res: res });
                        }
                    }
                    $(t.el).unmask();
                });
                inv.invokeRA({ params: ["ActorId", "DataHelper", "ActionId", "GetData", "ServiceInfo", SInfo] });
            }
        });
    },
    load: function () { //grid control
        var t = this, st = t.State;
        var sh = function () {
            t.removeListener("HTMLLoaded", sh);
            t.base.load.call(t);
            //if (caller == t.show && !t.visible && st.ShowOnLoad)
            if (sh.__caller !== t.show && st.ShowOnLoad)
                t.show();
        }; //sh()
        sh.__caller = arguments.callee.caller; //save the caller function for later use
        var cbLogged = function (logged) {
            if (logged) {
                if (st.LazyLoading && !t.HtmlLoaded) {
                    t.on('HTMLLoaded', sh);
                    t.loadHtml();
                }
                else {
                    if (!t.HtmlLoaded) t.setTemplates();
                    sh();
                }
            }
        } (true);
        return t;

    },
    show: function (args) { //grid control
        var t = this, st = t.State;
        //Ensure single entry to show method
        if (t.show.inProg)
            return t;
        else
            t.show.inProg = true;
        args = args || { recall: false, cf: {} };
        var onLoad = function () {
            t.removeListener("onLoad", onLoad);
            t.base.show.call(t);
            if (onLoad.__caller !== t.search) {//&& st.ShowOnLoad) { //if show is not invoked by search method, then call search to fill the grid.
                if (st.AutoSearch == "OnVisible" || st.AutoSearch == "OnEveryVisible") {
                    t.search({ reset: true });
                    st.AutoSearch = st.AutoSearch == "OnEveryVisible" ? "OnEveryVisible" : "";
                }
                else if (st.AutoSearch == "OnLoad") {
                    t.search({ reset: true });
                    st.AutoSearch = "";
                }
            }
            if (args.recall) { //reinvoke the orignal caller
                onLoad.__caller.call(t, args.cf);
            }
            t.show.inProg = false;
        }; //onLoad()

        onLoad.__caller = arguments.callee.caller; //save caller to use after the Web Service reinvoke
        if (!t.loaded) {
            t.on('onLoad', onLoad);
            t.load();
        }
        else
            onLoad();
        return t;
    },
    hideButtons: function () {
        var t = this, arg = args = Array.prototype.slice.call(arguments, 0);
        (function () { // deffered call so if the widget is not loaded let it get loaded first and the hide the button
            for (var iLoop = 0; iLoop < arg.length; iLoop++)
            {
                $('[buttonid="' + arg[iLoop] + '"]', t.Repeater).hide();
            }
        }).defer("100");
        return t;
    },
    showButtons: function () {
        var t = this, arg = args = Array.prototype.slice.call(arguments, 0);
        (function () { // deffered call so if the widget is not loaded let it get loaded first and the hide the button

            for (var iLoop = 0; iLoop < arg.length; iLoop++) {
                $('[buttonid="' + arg[iLoop] + '"]', t.Repeater).show();
            }
        }).defer("100");
        return t;
    }, 
    refresh: function () {
        var t = this;
        if ($('.form', t.el).length < 1) {
            $('.aftersubmit', t.el).remove();
            t.show();
        }
    }
});

/************************************* </Repeater Widget> *******************************************/
/************************************* < Validation Class> *******************************************/
AsyncWidgets.Validater = function (ctx, groupid, cf) { //cf to contain extra arguments right now {widget:t }, where t is the widget using the class 
    groupid = groupid || '';
    cf = cf || {};
    this.isElemValid = function (elem, cfg) {
        var t = $(elem);
        var valid = true, tval = $.trim(this.val(elem)), igv, argid = t.attr('argumentid') || "";
        cfg = cfg || { btn: { attr: function () { return ""; } } };
        igv = cfg.btn.attr('ignorevalidate') || "";
        if (igv.toLowerCase() == 'all' || igv.toLowerCase().indexOf(argid.toLowerCase()) > -1) {
            //return true;
        }
        else {
            if (t.hasClass('required')) {
                if (tval == "") {
                    this.showErr(t, t.attr('requirederr'));
                    t.removeAttr('isvalid');
                    return false;
                }
            }
        }
        if (t.hasClass('number') && $.trim(tval) != "") {
            if (tval.indexOf('.') != tval.lastIndexOf('.')) {
                this.showErr(t, ' Invalid Number');
                return false;
            }
            if (!((tval - 0) == tval && tval.length > 0)) {
                this.showErr(t, ' Invalid Number');
                return false;
            }
														               if (typeof t.attr('minvalue') != 'undefined') {
                var minval=parseFloat(t.attr('minvalue')) ||0 ;
                if(parseFloat(tval) < minval ){
                    this.showErr(t, "Value must be greater than or equal to " + t.attr('minvalue'));
                    return false;
                   
                }
            }
            if (typeof t.attr('maxvalue') != 'undefined') {
                var maxvalue = parseFloat(t.attr('maxvalue')) || 0;
                if (parseFloat(tval) < maxvalue) {
                    this.showErr(t, "Value must be less than or equal to " + t.attr('maxvalue'));
                    return false;

                }
            }
        }
        if (typeof t.attr('[minlen]') != 'undefined') {
            if (tval.length < t.attr('[minlen]')) {
                this.showErr(t, "Length must be equal to " + t.attr('[MinLen]'));
                return false;
            }
        }
        if (t.hasClass('validateunique')) {
            if (t.attr('isvalid') != 'true') {
                return false;
            }
        }
        if (elem.type.toLowerCase() == 'password' && (!!t.attr('confirmid') || !!t.attr('confirmpassid'))) {
            var u, uval;
            if (typeof t.attr('confirmid') == 'undefined' && !!t.attr('confirmpassid')) { //if it's not first box
                var tid = t.attr('confirmpassid');

                if (typeof tid != 'undefined') {//if it's the second box
                    u = $('[confirmid="' + tid + '"]' + groupid, ctx) //get frist box
                    // this.hideErr(u);
                    this.hideErr(t);
                    if (tval != u[0].value) {
                        this.showErr(t, ' Passwords don\'t match!');
                        return false;
                    }

                    //                    else {

                    //                    }
                }
                if (u[0].value.length < 4) {
                    this.showErr(u, ' Password length must be atleast 4 charactors!');
                    return false;
                }
                return true;
            }
            u = $('[confirmpassid="' + t.attr('confirmid') + '"]' + groupid, ctx);
            uval = $.trim(this.val(u[0]));
            //            this.hideErr(u);
            this.hideErr(t);
            if (tval == "") {
                this.showErr(t, t.attr('requirederr'));
                return false;
            }

            if (tval.length < 4) {
                this.showErr(t, ' Password length must be atleast 4 charactors!');
                return false;
            }
            if (tval != u[0].value) {
                this.showErr(u, ' Passwords don\'t match!');
                return false;
            }

            if (uval == tval) {
                this.hideErr(t); this.hideErr(u);
                return true;
            }
        }
        else
            if (t.hasClass('email')) {
                var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/,
            msg = ' Invalid Email Address';
                if (!emailReg.test(tval)) {
                    this.showErr(t, msg);
                    return false;
                }
            }
            else if (t.hasClass('date')) {

                if (!this.isDate(t) && $.trim(t.val()) != '') {
                    this.showErr(t, { en: ' Invalid date format (dd/mm/yyyy)', ar: 'تاری' });
                    return false;
                }
            }
        if (t.hasClass('dependent')) {
            var op = $.trim(t.attr('operator')), vld = true, chval = this.val($('[argumentid="' + t.attr('depchildid') + '"]' + groupid, ctx)[0]);

            if (isNaN(parseFloat(chval))) {
                return true;
            }
            else {
                chval = parseFloat(chval);
            }

            if (isNaN(parseFloat(tval))) {
                return true;
            }
            else {
                tval = parseFloat(tval);
            }

            if (op == "=") {
            }
            switch (op) {
                case '=':
                    vld = (chval == tval);
                    break;
                case '<':
                    vld = (chval > tval);
                    break;
                case '>':
                    vld = (chval < tval);
                    break;
                case '>=':
                    vld = (chval <= tval);
                    break;
                case '<=':
                    vld = (chval >= tval);
                    break;
                case 'required':
                    vld = ($.trim(chval) != "");
                    break;
                default:
                    break;

            }

            if (!vld) {
                this.showErr(t, " *");
                if (!!t.attr('deperr'))
				{					
					$.showMessage(t.attr('deperr'), { delay: 5000 });
				}
                return false;
            };
        }

        return true;
    }
    this.isDate = function (elem) {
        var expReg = /^((0[1-9]|[12]\d)\/(0[1-9]|1[0-2])|30\/(0[13-9]|1[0-2])|31\/(0[13578]|1[02]))\/(19|20)?\d{2}$/;

        var aRet = true,
        input = elem,
        value = input.attr('value'),
        arrV = value.split('/');
        if (arrV.length == 3) {
            if (arrV[0].length == 1) arrV[0] = '0' + arrV[0];
            if (arrV[1].length == 1) arrV[1] = '0' + arrV[1];
            value = arrV[0] + '/' + arrV[1] + '/' + arrV[2];
        }

        if ((value) && (value.match(expReg)) && (value != '')) {

            var dia = value.substring(0, 2);
            var mes = value.substring(3, 5);
            var ano = value.substring(6, 10);
            if (ano < 1900) return false;
            if ((mes == 4 || mes == 6 || mes == 9 || mes == 11) && dia > 30) {
                aRet = false;
            }
            else {
                if ((ano % 4) != 0 && mes == 2 && dia > 28)
                    aRet = false;
                else
                    if ((ano % 4) == 0 && mes == 2 && dia > 29)
                        aRet = false;
            }
        }
        else {
            aRet = false;
        }

        return aRet;
    }
    this.showErr = function (elem, msg, color) {
        msg = msg || (_Lang == 'en' ? '&nbsp;* Required' : 'قاسم');
        try { msg = decJSON(msg) } catch (err) { }
        if (!!msg.en) {
            msg = _Lang == 'en' ? msg.en : msg.ar;
        }
        //        var buble = $($('.bubbleTemplate').html());
        //        buble.css({'display':''}).appendTo('body')

        color = color || 'red';
        var t = elem, err = t.hasClass('date') ? t.next().next() : t.next();
        //if (err.hasClass('ui-datepicker-trigger')) err = err.next();

        if (err.length != 0 && err[0].tagName.toLowerCase() == 'span' && err.attr('errmsg') == 'true') { //if err span exists
            err.html(msg);
            err.css({ display: '', color: color });
        }
        else {
            if (t.hasClass('date')) t = t.next();
            t.after(String.format("<span errmsg='true' style='color:{0}' class='PWCLabel'>{1}</span>", color, msg));
        }
    }
    this.hideErr = function (elem) {

        var err = elem.hasClass('date') ? elem.next().next() : elem.next();
        if (err.length == 0) return;
        if (err[0].tagName.toLowerCase() == 'span' && err.attr('errmsg') == 'true') { //if err span exists
            err.html('').css('display', 'none');
        }
    }
    this.isValid = function (conf) {
        var valid = true, me = this;
        conf = conf || { btn: { attr: function () { return ''; } } };
        $('input' + groupid + ',textarea' + groupid + ',select' + groupid, ctx).each(function () {

            if (!me.isElemValid(this, { btn: conf.btn })) {
                valid = false;

            }
        });
        var pcf = { isValid: valid, groupId: groupid };
        if (!!cf.widget) {
            cf.widget.fireEvent('onValidate', pcf);
        }
        return pcf.isValid;
    }
    this.init = function () {
        //debugger;
        var me = this;
        $('.date' + groupid, ctx).numeric({ allow: '/' });
        $('.number' + groupid + ' , .alphanum' + groupid + ' , .alpha' + groupid, ctx).each(function () {
            var t = $(this), conf = {};


            if (typeof t.attr('alphconf') != 'undefined') {
                conf = decJSON($(this).attr('alphconf'));
            }
            if (t.hasClass('number')) {
                t.numeric(conf);
            }
            else if (t.hasClass('alpha')) t.alpha(conf);
            else t.alphanumeric(conf);
        });


        this.validateUnique = function () {
            var t = $(this);
            if ($.trim(t.val()) == "") return;

            var storeId = $(ctx).attr('storeid') || t.attr('storeid'),

            msgfnd = t.attr('uniquefound') || "{ en: 'Record already exists',ar:'سجل موجود' ,color:'red'}",
            msgnfnd = t.attr('uniquenotfound') || "{ en:'Record not found',ar:'سجل مش موجود' ,color:'green'}";
            msgfnd = decJSON(msgfnd);
            msgnfnd = decJSON(msgnfnd);

            var inv = new AsyncWidgets.RAInvoker();
            inv.on('onSuccess', function (res) {

                var res = decJSON(res), con;
                con = t.hasClass('mustexist') ? true : false;

                if (res.Response == con) {
                    t.attr('isvalid', 'true');
                }
                else {
                    t.attr('isvalid', 'false');
                }

                if (res.Response == false) {
                    me.showErr(t, msgnfnd[_Lang], msgnfnd.color);
                }
                else {

                    me.showErr(t, msgfnd[_Lang], msgfnd.color);
                }
                $(ctx).unmask();

            });
            inv.on('onFailure', function (res) {

                $(ctx).unmask();
                me.showErr(t, 'Unable to execute webservice');

            });
            $(ctx).mask('Please wait while loading ... ');
            var vls = { 'uniquekeys': t.attr('argumentid') };
            vls[t.attr('argumentid')] = t.val();

            if (!!t.attr('uniquekeys')) {
                var keys = t.attr('uniquekeys').split(',');
                for (var i = 0; i < keys.length; i++) {
                    var fldvl = $('[argumentid="' + keys[i] + '"]', ctx).val();
                    vls['uniquekeys'] += ',' + keys[i];
                    vls[keys[i]] = $.trim(fldvl) == "" ? "@EV" : fldvl;
                }
            }
            if (!!t.attr('primarykey')) { // to exclude the current record from unique check in edit mode.
                var PMKeyVl, elm = $('[argumentid="' + t.attr('primarykey') + '"]', ctx);
                if (elm.length > 0) {
                    // PMKeyVl = val(elm[0], ctx);
                    PMKeyVl = elm.attr("primarykeyValue");

                    if (!!PMKeyVl) {
                        vls["primarykey"] = t.attr('primarykey');
                        vls["primarykeyvalue"] = PMKeyVl;
                    }
                }

            }
            var SI = getForm(null, null, vls).replace(/<dummy /, '<' + storeId + ' ').replace(/<\/dummy>/, '</' + storeId + '>');
            inv.invokeRA({ params: ["ActorId", "DataHelper", "ActionId", "RecordExists", "ServiceInfo", SI] });

            //            inv.invokeRA({ params: ["ActorId", "DataHelper", "ActionId", "RecordExists", "ServiceInfo",
            //             $("<div></div>").append($("<root></root>").append(
            //                            $('<' + storeId + ' />')
            //                             .attr(t.attr('argumentid'), t.val())
            //                             .attr('uniquekeys', t.attr('argumentid'))
            //                        )).html().replace(/\\/g, '\\\\').replace(/"/g, '\\\"')
            //            ]
            //            });
        }
        $('.validateunique' + groupid, ctx).change(function () { this.setAttribute('isvalid', 'false'); }).blur(me.validateUnique);
        $('input:not([type="submit"])' + groupid + ',textarea' + groupid + ',select' + groupid, ctx).blur(function () {
            //        $('input:not([type="submit"]),select', ctx).blur(function () {
            var t = $(this);
            if (t.attr('blurvalidate') == 'false') {
                me.hideErr(t);
            }
            else {
                if (me.isElemValid(this)) {
                    me.hideErr(t)
                };
            }
            if (t.hasClass('number') && !!t.attr('fix')) {
                if (parseFloat(t.attr('fix'))) {
                    if (!!parseFloat(t.val())) {
                        t.val(parseFloat(t.val()).fix(parseInt(t.attr('fix'))));
                    }
                }
            }
        });

        $('input:not([type="submit"])' + groupid + ',select' + groupid, ctx).keyup(function (event) {

            if (event.keyCode == '9' || event.keyCode == '16' || this.type == 'checkbox') return;
            var t = $(this);
            if (t.attr('blurvalidate') == 'false') {
                me.hideErr(t);
            }
            else {
                if (me.isElemValid(this)) {
                    me.hideErr(t);
                }
            }
        });

        $('input[type="checkbox"]' + groupid, ctx).click(function (event) {
            var t = $(this);
            if (me.isElemValid(this)) {
                me.hideErr(t);
            }
        });
    }

    this.val = function (elem) {
        //if (!elem) {
        //    return "";
        //}
        var text = $(elem).attr('valtype') == 'text' ? true : false;
        if (elem.tagName.toLowerCase() == 'select') {
            return text ? $('option:selected', elem).text() : $('option:selected', elem).val();
        }
        else if (elem.tagName.toLowerCase() == "textarea") {
            return $(elem).val();
        }
        else if (elem.tagName.toLowerCase() == 'input') {
            if ("textareapassword".indexOf(elem.type.toLowerCase()) > -1)
                return $(elem).val();
            else if (elem.type.toLowerCase() == 'radio') {
                var rdo = elem.name.toLowerCase();
                var arr = $("[name='" + elem.name + "']" + groupid, ctx).map(function () { if ($(this).attr('checked')) return this.value; });
                return arr.length == 0 ? "" : arr[0];
                // return text? elem.value :$(elem).attr('checked');
            }
            else if (elem.type.toLowerCase() == 'checkbox') {
                return $(elem).attr('checked') ? "1" : "";
            }

        }
        else if (elem.tagName == 'SPAN' || elem.tagName == 'DIV') {
            return $.trim($(elem).text());
        }
    }

    this.init();
}


/************************************* </ Validation Class> *******************************************/

/************************************* <Repeater Widget> *******************************************/
AsyncWidgets.Widgets.ItemRepeater = Ext.extend(AsyncWidgets.widgetContainer, {
    constructor: function (el, config) {
        var t = this;
        t.$el = $(el);

        //Save template with the Instances
        t.Repeater = $($('[template="Repeater"]', el).html());
        t.Top = $($('[template="Top"]', el).html());
        t.Header = $($('[template="Header"]', el).html());
        t.Item = $($('[template="Item"]', el).html());
        t.Bottom = $($('[template="Bottom"]', el).html());
        t.Pager = $($('[template="Pager"]', el).html());


        $('.Top', t.Repeater).append(t.Top); //add top pager to the html
        $('.Header', t.Repeater).append(t.Header);
        $('.Bottom', t.Repeater).append(t.Bottom);

        t.$el.append(t.Repeater);
        t.base = AsyncWidgets.Widgets.ItemRepeater.superclass;
        config = config || {};
        config.Controller = config.Controller || 'ItemRepeater';
        t.base.constructor.call(this, el, config);
        t.State.PageNo = 1;
        t.State.PgLen = 5;

    },
    setPage: function (pageNo) {
        var t = this;
        t.State.PageNo = pageNo;
        //t.search(t.LastSF);
        t.search(t.LastSF);
    },
    setPageSize: function (PageSize) {
        //debugger;
        var t = this;
        t.State.PageSize = PageSize / t.State.Columns;
        t.setPage(1);
    },
    search: function (conf) { //Repeater Widget

        var t = this;
        if (!t.visible) t.show();
        $('.wheninit', t.GridHTML).remove();

        var wg, ServiceInfo; //= conf.reset ?: conf;
        conf = conf || {};
        conf.reset = conf.reset || false;
        if (conf.reset) {
            t.State.PageNo = 1;
        }
        var pgNo = t.State.PageNo, PgSz = t.State.PageSize, pgCols = t.State.Columns;
        var t1 = { DALInfo: this.State.DALInfo, PageNo: pgNo, PageSize: PgSz * pgCols };

        wg = conf.wg || null;
        if (!!wg) {
            t.LastSF = wg;
            ServiceInfo = getForm(wg.el, null, t1);
        }
        else {
            ServiceInfo = getForm(null, null, t1); // "<root>" + $("<dummyform></dummyform>") + "</root>";
        }
        t.$el.mask('Please wait while loading ...');
        var inv = new AsyncWidgets.RAInvoker();
        inv.on('onSuccess', function (res) { //repeater widget;
            var Res = decJSON(res);
            if (Res.status != "OK") { t.$el.unmask(); alert(Res.detail.message + "\t\n" + Res.detail.stackTrace); return; }
            var rc = t.RowClose,
                ro = t.RowOpen,
                lastRow = (PgSz * pgCols),

                r = Res.Response;
            if (r.Rows.length > 0) {



                t.css('display', '', '.whendata', t.GridHTML)('display', 'none', '.whennodata');
                ro = !!ro ? ro : "<tr>";
                rc = !!rc ? rc : "</tr>";
                var rowTemplate = '<tpl for="." >' + t.Item.replace(">", " itemno='{ItemNo}' >") + "</tpl>";


                //pager first link number;
                var ItemsPerPg = PgSz * pgCols;

                $('#Items', t.GridHTML).html(''); // 
                $('.PageNo', t.GridHTML).html(t.State.PageNo);
                $('.TotalPages', t.GridHTML).html(r.Pages);
                $('.Count', t.GridHTML).html(r.Count + " "); //No of records

                $('#ItemStart', t.GridHTML).html(ItemsPerPg * pgNo - ItemsPerPg + 1);
                $('#ItemEnd', t.GridHTML).html(ItemsPerPg * pgNo - ItemsPerPg + r.Rows.length);


                //**************************************************************************//
                var setPager = function (conf) {
                    var pager = conf.pager;

                    if (!pager.attr('events')) {

                        $('.Last', pager).click(function () { t.setPage(t.Pages); });
                        $('.First', pager).click(function () { t.setPage(1); });
                        $('.Next', pager).click(function () {

                            t.setPage(t.State.PageNo + 1);
                        });
                        $('.Back', pager).click(function () { t.setPage(t.State.PageNo - 1); });
                        pager.attr('events', 'true');

                    }


                    var j = Math.ceil(pgNo / t.State.PgLen) * t.State.PgLen - (t.State.PgLen - 1); // Math.ceil(pgNo / (PgSz * pgCols));
                    if (pgNo == 1) {


                        t.css('display', 'none', '.First, .Back', pager)('display', '', '.First0, .Back0');
                    }
                    else {
                        t.css('display', '', '.First, .Back', pager)('display', 'none', '.First0, .Back0');
                    }
                    if (pgNo == r.Pages) {
                        t.css('display', 'none', '.Last, .Next', pager)('display', '', '.Last0, .Next0');
                    }
                    else {
                        t.css('display', '', '.Last, .Next', pager)('display', 'none', '.Last0, .Next0');
                    }


                    //******************* generate paging links ***************************//
                    var TPg = $('#PagerTable', pager);
                    if (TPg.length > 0) {
                        $('.nottpl', TPg).remove();
                        var TAPg = $('#ActivePageNumber', TPg).closest('td');
                        var TPgLnk = $('#PageNumber', TPg).closest('td');

                        TAPg.css('display', 'none');
                        TPgLnk.css('display', 'none');


                        for (var i = j; i < (j + t.State.PgLen) && i <= r.Pages; i++) {
                            var col;
                            if (pgNo == i) {
                                col = TAPg.clone().css('display', '').addClass('nottpl');
                                $('#ActivePageNumber', col).html(i);
                            }
                            else {
                                col = TPgLnk.clone().css('display', '').addClass('nottpl');
                                $('#PageNumber', col).html(i);
                                col.click(function () {
                                    //debugger;
                                    t.setPage($('span', this).text() * 1);
                                });
                            }
                            $('tr', TPg).append(col);

                        } //end of for loop 
                    }
                    //*******************end generate paging links ***************************//

                } //end of pager function
                //**************************************************************************//
                setPager({ pager: t.TopPager });
                setPager({ pager: t.BottomPager });

                t.Pages = r.Pages;
                var rowTpl = new Ext.XTemplate(rowTemplate,
                    {
                        compiled: true,
                        disableFormats: false,
                        getField: function (vls, fld, conf) {
                            //      return '{test:"test"}';

                            if (!!conf) {
                                conf.prop = conf.prop || 'innerText';
                                return String.format("lang=\"'type':'{0}',ar:'{1}',en:'{2}'\"", conf.prop,
                                       vls[fld + "_AR"], vls[fld + "_EN"]
                                );
                            }
                            else
                                return vls[fld + "_" + _Lang.toUpperCase()];
                        }
                    });
                rowTpl.compile();
                var rowsHtml = "", itemNo = 1, j;

                for (var iLoop = 0; iLoop < lastRow && iLoop < r.Rows.length; iLoop += t.State.Columns) {
                    for (j = 0; j < t.State.Columns && itemNo <= r.Rows.length; j++, itemNo++) {
                        r.Rows[itemNo - 1]["ItemNo"] = itemNo;

                    }

                    rowsHtml += ro + rowTpl.applyTemplate(r.Rows.slice(iLoop, (iLoop + t.State.Columns))) + rc;
                }
                $('#Items', t.GridHTML).unbind().html('').append('<table>' + rowsHtml + '</table>');

                $('#Items [showform]', t.GridHTML).click(function () {
                    var $e = $(this),
                        recno = $e.closest('[itemno]').attr('itemno');
                    t.frmCurDetail = AsyncWidgets.get($e.attr('showform'));
                    t.frmCurDetail.showDetail({ ItemNo: recno, parent: t, SF: t.LastSF, PageNo: t1.PageNo, PageSize: t1.PageSize })

                });
            }
            else {


                $('.whendata', t.GridHTML).css('display', 'none');
                $('.whennodata', t.GridHTML).css('display', '');
            }
            t.$el.unmask();
        });
        inv.on('onFailure', function (res) {
            t.$el.unmask();
            //debugger;
        });
        inv.invokeRA({ params: ["ActorId", "DataHelper", "ActionId", "Search", "ServiceInfo",
        ServiceInfo]
        })
    },
    submit: function () {
        var t = this;
        t.fireEvent('onSubmitting');
        var inv = new AsyncWidgets.RAInvoker();
        inv.on('onSuccess', function (res) {
            var res = decJSON(res);
            if (res.status == 'OK') {
                params = res.Response.split('||');
                if (params[1] == 'OK') {
                    alert(params[2
                    ]);
                    $('.insert', t.el).remove();
                    $('.afterinsert', t.el).css('display', '');
                }
                else {
                    alert(params[2]);
                }

            }

        });
        inv.on('onFailure', function (res) {
            t.status = "err";
            alert('Problem occured while connection to web server');

        });
        t.status = "sav"; //saving
        var ServiceInfo = getForm(t.el, "RegisterNewUser", { RegisterNewUser: 'User_RegisterUser' });
        inv.invokeRA({ params: ["ActorId", "Authentication", "ActionId", "RegisterNewUser", "ServiceInfo",
        ServiceInfo]
        });

    },
    show: function () {
        var t = this;
        t.base.show.call(t);
        t.search({ reset: true });

        //        t.loadJSFiles('prejs');
        //        //-----------------Start on success handler --------------------------//
        //        var onSuccess = function (reponse) {
        //            t.RASuccess(reponse);
        //            t.validator = new AsyncWidgets.Validater(t.el);
        //            var onRegisterUser = function () {
        //                if (t.validator.isValid()) {
        //                    t.submit();
        //                }
        //                return false;
        //            };
        //            $('.submit', this.el).click(submit);
        //        }
        //-----------------End on success handler --------------------------//

        // this.invokeRA('init', { onSuccess: onSuccess.createDelegate(t) });
    },
    refresh: function () {
        var t = this;
        if ($('.form', t.el).length < 1) {
            $('.aftersubmit', t.el).remove();
            t.show();
        }
    }
});
/************************************* </Repeater Widget> *******************************************/

/************************************** Accordion Menu ************************************************/
function setAccordion() {
    /*
    $('ul.accordionmenu ul').hide();
    $.each($('ul.accordionmenu'), function(){
    $('#' + this.id + '.expandfirst ul:first').show();
    });
    */
    $('ul.accordionmenu li a').live('click',
		function () {
		    //debugger;
		    var checkElement = $(this).next();
		    var parent = this.parentNode.parentNode;

		    if ($(parent).hasClass('noaccordion')) {
		        $(this).next().slideToggle('normal');
		        return false;
		    }
		    if ((checkElement.is('ul')) && (checkElement.is(':visible'))) {
		        if ($(parent).hasClass('collapsible')) {
		            $('.ActiveAcc span.DownArrow', parent).removeClass('DownArrow').addClass('RightArrow');
		            $('ul:visible', parent).slideUp('normal').parent().removeClass('ActiveAcc');

		        }
		        return false;
		    }
		    //(checkElement.is('ul')
		    if ((!checkElement.is(':visible'))) {
		        $('.ActiveAcc span.DownArrow', parent).removeClass('DownArrow').addClass('RightArrow');

		        $('ul:visible', parent).slideUp('normal').parent().removeClass('ActiveAcc');
		        checkElement.slideDown('normal').parent().addClass('ActiveAcc');
		        $('.ActiveAcc span.RightArrow', parent).removeClass('RightArrow').addClass('DownArrow');
		        return false;
		    }
		}
	);
}


/************************************** Mouse Wheel Menu ************************************************/

(function ($) {

    var types = ['DOMMouseScroll', 'mousewheel'];

    if ($.event.fixHooks) {
        for (var i = types.length; i; ) {
            $.event.fixHooks[types[--i]] = $.event.mouseHooks;
        }
    }

    $.event.special.mousewheel = {
        setup: function () {
            if (this.addEventListener) {
                for (var i = types.length; i; ) {
                    this.addEventListener(types[--i], handler, false);
                }
            } else {
                this.onmousewheel = handler;
            }
        },

        teardown: function () {
            if (this.removeEventListener) {
                for (var i = types.length; i; ) {
                    this.removeEventListener(types[--i], handler, false);
                }
            } else {
                this.onmousewheel = null;
            }
        }
    };

    $.fn.extend({
        mousewheel: function (fn) {
            return fn ? this.bind("mousewheel", fn) : this.trigger("mousewheel");
        },

        unmousewheel: function (fn) {
            return this.unbind("mousewheel", fn);
        }
    });


    function handler(event) {
        var orgEvent = event || window.event, args = [].slice.call(arguments, 1), delta = 0, returnValue = true, deltaX = 0, deltaY = 0;
        event = $.event.fix(orgEvent);
        event.type = "mousewheel";

        // Old school scrollwheel delta
        if (event.wheelDelta) { delta = event.wheelDelta / 120; }
        if (event.detail) { delta = -event.detail / 3; }

        // New school multidimensional scroll (touchpads) deltas
        deltaY = delta;

        // Gecko
        if (orgEvent.axis !== undefined && orgEvent.axis === orgEvent.HORIZONTAL_AXIS) {
            deltaY = 0;
            deltaX = -1 * delta;
        }

        // Webkit
        if (orgEvent.wheelDeltaY !== undefined) { deltaY = orgEvent.wheelDeltaY / 120; }
        if (orgEvent.wheelDeltaX !== undefined) { deltaX = -1 * orgEvent.wheelDeltaX / 120; }

        // Add event and delta to the front of the arguments
        args.unshift(event, delta, deltaX, deltaY);

        return ($.event.dispatch || $.event.handle).apply(this, args);
    }

})(jQuery);

$('.mousewheel').live('mousewheel', function (e, delta) {
    //debugger;
    var scrollTop = $(this).scrollTop();
    $(this).scrollTop(scrollTop - (Math.round(delta) * 30));
});
