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
            ;
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
      
        if (res.status=="UserNotLoggedIn")
        {
            AsyncWidgets.user.logged = true;
            //window.location.reload();
            return;
        }
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
    callWS_old: function (webMethod, parameters, successFn, errorFN) {
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
    },
    callWS: function (webMethod, parameters, successFn, errorFN) {
        var paramList = {};
        if (parameters.length > 0) {
            for (var i = 0; i < parameters.length; i += 2) {
                paramList[parameters[i]] = parameters[i + 1];
            }
        }
        
        successFn = successFn || this.success.createDelegate(this);
        errorFN = errorFN || this.failure.createDelegate(this);

        fetch(webMethod, {
            method: 'POST',
            accept: "application/json, text/javascript; q=0.01",
            headers: {
                'Content-Type': 'application/json; charset=utf-8'
            },
            body: JSON.stringify(paramList)
        })
            .then(
                response => {
                    var res = response.json();
                    console.log(res);
                    return res;
                }
            )
            .then(data => successFn(data))
            .catch(error => function () {
               debugger
                errorFN(error)
            });

        //AsyncWidgets.user.action();
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

var _IsIE = false,
    __IE8 = false;
  
(function ($) {
    $.showMessage = function (message, options, secondCall) {
        // Immediately return if it's the first call; defer for 500ms
        debugger
        if (!secondCall) {
            $.showMessage.defer(500, this, [message, options, true]);
            return;
        }

        // Default settings
        const settings = $.extend({
            id: 'sliding_message_box',
            position: 'top',
            size: '20',
            backgroundColor: '#FFFFAA',
            delay: 3500,
            speed: 500,
            fontSize: '11px'
        }, options);

        let elem = $('#' + settings.id);

        // Generate message div if it doesn't exist
        if (elem.length === 0) {
            elem = $('<div><div class="conmsg"></div></div>').attr('id', settings.id);

            // Hover behavior for the message box
            elem.hover(
                function () {
                    $(this).css("background-color", "#FFFFCF");
                    $.showMessage.hideDT.delay(999999999);
                },
                function () {
                    $(this).css("background-color", "#FFFFAA");
                    $.showMessage.hideDT.delay(1000);
                }
            );

            // Set message box position and styling
            let leftOffset = 0, width = "100%";
            if (!!$('.left-border').length) {
                leftOffset = $('.left-border').offset().left + 15;
                width = '942px';
            }

            elem.css({
                'z-index': '999',
                'cursor': 'pointer',
                'background-color': settings.backgroundColor,
                'text-align': 'center',
                'position': 'absolute',
                'left': leftOffset,
                'top': '0',
                'width': width,
                'line-height': settings.size + 'px',
                'font-family': 'verdana, sans-serif, trebuchet ms, arial',
                'font-size': settings.fontSize,
                'font-weight': 'bold',
                'color': '#333333',
                'border-bottom': '1px solid #73ABCB',
                'padding': '5px 0'
            });

            $('body').append(elem);
        }

        // Update the message content
        message = message || 'Data updated successfully!';
        const conmsg = $('.conmsg', elem).html(message);

        const win = $(window);
        let elemHidden = false;

        // Function to set element position
        const setElem = function (op = "slow") {
            elem.stop().animate({ "marginTop": win.scrollTop() + "px" }, op);
        };

        // Show the message
        setElem('fast');
        win.bind('scroll.showmsg', setElem);

        // Function to hide the message
        function hideMSG() {
            $("#" + settings.id).stop().animate({ "marginTop": "-35px" }, "slow");
            win.unbind('scroll.showmsg');
            elemHidden = true;

            // Show Bootstrap Toast after the message is hidden
            showBootstrapToast(message);
        }

        elem.click(hideMSG);

        // Delayed task for hiding the message
        if (!$.showMessage.hideDT) {
            $.showMessage.hideDT = new Ext.util.DelayedTask(hideMSG);
        }
        $.showMessage.hideDT.delay(settings.delay);
    };

    // Function to display Bootstrap Toast
    function showBootstrapToast(message) {
        const toastHTML = `
            <div class="toast align-items-center text-bg-primary border-0" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="d-flex">
                    <div class="toast-body">
                        ${message}
                    </div>
                    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
            </div>
        `;

        // Append the toast element to the body
        const toastElement = $(toastHTML);
        $('body').append(toastElement);

        // Initialize and show the toast
        const toast = new bootstrap.Toast(toastElement[0]);
        toast.show();

        // Remove the toast element after hiding
        toastElement.on('hidden.bs.toast', function () {
            $(this).remove();
        });
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
//function setCommonEvents() {
//    $('.w-ui-panel-icon').live('mouseleave', function () {
//        $(this).addClass('w-ui-icon').removeClass('w-ui-icon-hover');
//    });
//    $('.w-ui-panel-icon').live('mouseenter', function () {
//        $(this).addClass('w-ui-icon-hover').removeClass('w-ui-icon');
//    });
//    $('.w-ui-panel-icon').live('click', function () {
//        if ($(this).hasClass('w-ui-panel-icon-opened')) {
//            $(this).addClass('w-ui-panel-icon-closed').removeClass('w-ui-panel-icon-opened');
//        }
//        else {
//            $(this).addClass('w-ui-panel-icon-opened').removeClass('w-ui-panel-icon-closed');
//        }
//    });
//}

$(document).ready(function () {
    //    $('td.ColTemplate, td.ColValue,td.ColValue div,td.ColTemplate div').live('click', function () {
    //        alert(this.tagName + '- width:' + $(this).width() +' , outerWidth' + $(this).outerWidth());
    //    });
    //  setCommonEvents();

    //*********************************Show Time in the Application*************************//
    //  $('.jclock').jclock();
    //****End****//

  
    //setAccordion();
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
                    var el = this;
                    //while (true) {
                    //    var widgetParent = $(el).parent();
                    //    var parentId = widgetParent[0].id || "Parent have no Id"
                    //    parentId = parentId.toLowerCase();
                    //    console.log(`widget:${conf.WidgetId} - widget parent:${parentId}, parent tag:${widgetParent[0].tagName}`);
                    //    if (parentId == 'mainpanel' || parentId == 'maindiv' || widgetParent[0].tagName.toLowerCase() == "body") {
                    //        break;
                    //    }
                    //    el = widgetParent;
                    //}
                    
                    Widget = new AsyncWidgets.Widgets[conf.WidgetType](this, conf); // Confusing?? taking Property(AsyncWidgets.Widgets.RegisterUser ={}) using collection notation and then call object constructor
                    AsyncWidgets.Widgets.addWidget(conf.WidgetId, Widget);  //adding widget to the collection
                }
                catch (e) {
                    ;
                }
            }
            else {//if widget DataType not provide in the config of widget
                !!conf.WidgetId ? alert('Widget type not specified for widget: ' + conf.WidgetId) :
                              alert('Widget configuration is incorrect');
            }
        }
        catch (e) {
            ;
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
                        w = AsyncWidgets.get(conf),
                            cid = $(w.el).parent()[0].id;
                            //cid = $(w.el).parent()[0].id ? $(w.el).parent()[0].id : "mainpanel";

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
                //                    ;
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
          //  ;
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
            //;
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
        //;
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
                //;
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
            //;
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
        //;
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
function setDatePicker(ctx, datePickerCF) {
    // datePickerCF:{minDate:'yyyy/mm/dd'}

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

        Ext.apply(cf, tcf.conf,datePickerCF);
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
function val(elem, ctx) {//framework function to read a field value from a context
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
    var text = $(elem).attr('valtype') == 'text';
    if (elem.tagName.toLowerCase() == 'select') {
        if (elem.selectedIndex > -1) {
            return text ? $('option:selected', elem)[0].text : $('option:selected', elem)[0].value;
        }
        else { 
            return "";
        }
    }
    else if (elem.tagName.toLowerCase() == "textarea") {
        return $(elem).val();
    }
    else if (elem.tagName.toLowerCase() == 'input') {

        if ("textpasswordhiddendate".indexOf(elem.type.toLowerCase()) > -1) { 
            return $(elem).val();
          }
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
    dt = dttmAr[0].split('-');
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
        /*  ContainerGroup = !!ContainerGroup ? "='" + ContainerGroup + "']" : "]";*/
            ContainerGroup = !!ContainerGroup ? "='" + ContainerGroup + "']" : "]";
        var UniqueKeys = null, UniqueKeysWithVal = null;
        var flds;
        if ($('div[widgetid]', container).length < 1) {
            flds = $(`[groupid${ContainerGroup}`, container);
        }
        else {
            //flds = $(`[groupid${ContainerGroup}:not(div[widgetid] div[widgetid] [groupid]`, container);
            flds = $(`[groupid${ContainerGroup}`, container);

        }

        

        var fields = !cf.filter ? flds : flds.filter(cf.filter);

        fields.each(function () { // iterate throug each field of the container group(if specified else iterate through all fields in all groups in the container)

            //;
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

            if (t)
            {

                //if (jqThis.attr("argumentid") == 'LastCarServiceDate')
                //{
                    
                //}
               // fldVal = jqThis.hasClass('date') || jqThis.hasClass('dateLabel') ?SetDateFormat( fldVal) : fldVal;
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
        //
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
            ServiceInfo += $("<div></div>").append(groups[groupId][0]).html();//.replace(/\\/g, '\\\\').replace(/"/g, '\\\"');
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
var setListValue = function (ctl,val,valType,ctx) // can be DOM or jquery
{
    
    valType = valType || "text";    
    //////////////////////////////////////////
    if (typeof ctl == "string")
    {
        if (!ctx) {
            if (!setListValue._ctx) {
                $.showMessage("ctx needed when argument selector is provided");
                return;
            }
            ctx = setListValue._ctx
        }
        else {
            setListValue._ctx = ctx;
        }
        
        ctl = ctl.indexOf("argumentid") > -1 ? $(ctl,ctx) :$(`[argumentid="${ctl}"]`,ctx );
    }
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
        let ctlVale = valType == "text" ? ctl.options[i].text.toUpperCase() : ctl.options[i].value.toUpperCase();
        if (ctlVale == val.toUpperCase())
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
//            ;
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
                setListValue(ctl, val,'value');
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
        if (ctl.type == "date") {
            if (!!val) {
                let arrVal = val.split("/");
                val = `${arrVal[2]}-${arrVal[1]}-${arrVal[0]}`;
            }
            
            $(ctl).val(val);
        }
        else if ('textareapasswordhidden'.indexOf(ctl.type) > -1) {
            $(ctl).val(val);
        }
        //else if (ctl.type == 'radio') {
        //    var rdo = ctl.name, grpid = ctl.getAttribute('groupid');
        //    if ($("[name='" + rdo + "'][checked]", ctx).length > 0)

        //      //  $("[name='" + rdo + "']", ctx).removeAttr('checked');

        //        $("[name='" + rdo + "'][checked]", ctx)[0].checked = false;
        //    if (("" + val) != '') {
        //        if ($("[name='" + rdo + "'][value='" + val + "']", ctx).length > 0) {
        //            $("[name='" + rdo + "'][value='" + val + "']", ctx).attr('checked', 'checked')
        //        }
        //        else {
        //            if (val == null) {
        //                if ($("[name='" + rdo + "'][default='default']", ctx).length > 0)
        //                     $("[name='" + rdo + "'][default='default']", ctx)[0].checked = true;
        //            }
        //            else
        //                $("[name='" + rdo + "'][textvalue='" + val.toUpperCase() + "']", ctx).attr('checked', 'checked');
        //        }
        //    }
            //}
        if (ctl.type === 'radio') {
            const rdo = ctl.name;
     

            // Uncheck the currently checked radio button
            const checkedRadio = $("[name='" + rdo + "'][checked]", ctx);
            if (checkedRadio.length > 0) {
                checkedRadio.prop('checked', false).removeAttr('checked');
            }

            // Check the radio button with the specified value
            if (("" + val) !== '') {
                const targetRadio = $("[name='" + rdo + "'][value='" + val + "']", ctx);
                if (targetRadio.length > 0) {
                    targetRadio.prop('checked', true).attr('checked', 'checked');
                } else {
                    if (val == null) {
                        // Set default radio button if value is null
                        const defaultRadio = $("[name='" + rdo + "'][default='default']", ctx);
                        if (defaultRadio.length > 0) {
                            defaultRadio.prop('checked', true).attr('checked', 'checked');
                        }
                    } else {
                        // Handle case where value doesn't match but text value does
                        const textValueRadio = $("[name='" + rdo + "'][textvalue='" + val.toUpperCase() + "']", ctx);
                        if (textValueRadio.length > 0) {
                            textValueRadio.prop('checked', true).attr('checked', 'checked');
                        }
                    }
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
       
        val = (val == null || val == undefined) ? "" : val;
        $(ctl).text(val);
    }
    else if (tag == 'IMG') {
        ctl.src = ctl.getAttribute('path') + param.val + (ctl.getAttribute('ext') || '');
    }
}


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
            /*tval = tval.replace(/,/g, '');*/
            if (tval.indexOf('.') != tval.lastIndexOf('.')) {
                this.showErr(t, ' Invalid Number');
                return false;
            }
            if (!((tval - 0) == tval && tval.length > 0)) {
                this.showErr(t, ' Invalid Number' );
                return false;
            }
            //if (t.hasClass('timePick') && $.trim(tval) != "")
            //{

            //    var isValidTime = /^([01]?[0-9]|2[0-3]):[0-5][0-9]$/.test(tval);


            //    if (!isValidTime)
            //    {
            //        this.showErr(t, 'Invalid Time');
            //        t.val('12:00'); // Reset to default time if invalid
            //        return false;
            //    }

            //}
            //if (t.hasClass('timePick') && $.trim(tval) != "")
            //{
                
            //    var isValidTime = /^([01]?[0-9]|2[0-3]):[0-5][0-9]$/.test(tval);

              
            //    if (!isValidTime)
            //    {
            //        this.showErr(t, 'Invalid Time');
            //        t.val('12:00'); // Reset to default time if invalid
            //        return false;
            //    }

            //}
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
        value = elem.val();
        var arrV = value.split('-'); // the incoming formate is yyyy-mm-dd
        let dateYear = arrV[0]; // save year in a temporary variable 1/0/2020
        arrV[0] = arrV[2]; // swap day to place of year
        arrV[2] = dateYear;
        if (arrV.length == 3) {
            if (arrV[0] == undefined) {
                return false;
            }
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
        //;
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
            if ("textareapassworddate".indexOf(elem.type.toLowerCase()) > -1)
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
        //;
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
                                    //;
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
            //;
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
        t.status = "save"; //saving
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
//function setAccordion() {
//    /*
//    $('ul.accordionmenu ul').hide();
//    $.each($('ul.accordionmenu'), function(){
//    $('#' + this.id + '.expandfirst ul:first').show();
//    });
//    */
//    $('ul.accordionmenu li a').live('click',
//		function () {
//		    //;
//		    var checkElement = $(this).next();
//		    var parent = this.parentNode.parentNode;

//		    if ($(parent).hasClass('noaccordion')) {
//		        $(this).next().slideToggle('normal');
//		        return false;
//		    }
//		    if ((checkElement.is('ul')) && (checkElement.is(':visible'))) {
//		        if ($(parent).hasClass('collapsible')) {
//		            $('.ActiveAcc span.DownArrow', parent).removeClass('DownArrow').addClass('RightArrow');
//		            $('ul:visible', parent).slideUp('normal').parent().removeClass('ActiveAcc');

//		        }
//		        return false;
//		    }
//		    //(checkElement.is('ul')
//		    if ((!checkElement.is(':visible'))) {
//		        $('.ActiveAcc span.DownArrow', parent).removeClass('DownArrow').addClass('RightArrow');

//		        $('ul:visible', parent).slideUp('normal').parent().removeClass('ActiveAcc');
//		        checkElement.slideDown('normal').parent().addClass('ActiveAcc');
//		        $('.ActiveAcc span.RightArrow', parent).removeClass('RightArrow').addClass('DownArrow');
//		        return false;
//		    }
//		}
//	);
//}


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


