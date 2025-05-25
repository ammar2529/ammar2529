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
        t.addEvents({
            'actionSuccess': true, 'widgetAction': true, 'onActionClicked': true, 'afterActionClicked': true, 'onComboFilled': true,
            'beforeComboFill': true, 'onParentCobmoChanged': true, 'AutocompleteResult': true, 'onLoadingValues': true, 'beforeLoadingValues': true
            , 'LOVPopupShown': true, 'LOVPopupClose': true, FormClosing: true, FormClosed: true, SettingDatePicker: true
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
        var popId, searchForm, searchFormId, resGrd, resGrdId,
            popup, top, left,
            autoShowControls, popupControls = []; // comma separated controls which has to be shown automatically
        //console.log(cf.ctrl);
        if (!!cf.ctrl) {

            var txt = $(cf.ctrl), trow = txt.closest('div');


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
            top = cf.top || $(ctrl).offset().top;


        }
        else { // if control is not give
            //{ popupId: '-div-tag-id-of the popup', searchFormId: 'searchFormId', resultGridId: 'resultGridId', top:'top of the popup div',left:'' } //row select popup configuration
            //{ popupId: '-div-tag-id-of the popup', autoShowControls: 'searchFormId', top:'top of the popup div',left:''  } //non-row select popup configuration

            popId = cf.popupId;
            popup = $(`div.LOVPopup[lovpopupid="${popId}"]`);
            autoShowControls = cf.autoShowControls;
            searchFormId = cf.searchFormId;
            resGrdId = cf.resultGridId;
            top = cf.top || '20%';
        }


        if (popup.length < 1) {
            $(this).showMessage('A LOV popup with id:"' + popId + '" not found!');
            return;
        }




        //'#628296'
        //'background': 'rgb(238, 238, 255)'

        popup.css({ position: 'absolute', top: top, left: left, 'z-index': '10000', border: '1px solid rgb(130, 152, 176)', 'background': '#ebeff3', width: (cf.width || '900px') }).show();

        //popup.css({
        //    position: 'absolute',
        //    top: top,
        //    left: left,
        //    'z-index': '10000',
        //    border: '1px solid rgb(130, 152, 176)',
        //    background: '#ebeff3',
        //    width: (cf.width || '900px')
        //}).show();
        if (!autoShowControls) { //row select grid with a search panel and datagrid

            searchFormId = !!searchFormId ? searchFormId : $('[wtype="Form"]', popup).attr('widgetid');
            searchForm = AsyncWidgets.get(searchFormId);
            if (!searchForm) {
                $(this).showMessage('LOV popup must contain at least a form - "' + popId + '"');
                return;
            }
            resGrdId = !!resGrdId ? resGrdId : $('[wtype="DataGrid"]', popup).attr('widgetid');
            resGrd = AsyncWidgets.get(resGrdId);
            if (resGrd.length < 1) {
                $(this).showMessage('LOV popup must contain at least a data grid - "' + popId + '"');
                return;
            }


            //if ($('.reset[resetonpopupshow]', searchForm.el).length) {
            //    // Trigger the reset action
            //    $('.reset[resetonpopupshow]', searchForm.el).click();
            //    $('.search', searchForm.el).click();


            //}
            if (!popup[0].init) {
                resGrd.on('rowClicked', function HandleRowClick(args) {
                    if ($("tr", args.row).attr('disabled') == "disabled") {
                        return;
                    }
                    args.canceled = false;
                    t.setParams({ params: args.rowData, isRow: true });
                    popup.hide();
                    args.popupId = popId;
                    t.fireEvent('LOVPopupClosed', args);
                    //$(t.el).unmask();
                    hideOverlay(); 
                    //resGrd.removeListener('rowClicked', HandleRowClick);
                });

                //  popup.css({ position: 'absolute', top: top, left: '0px', 'z-index': '1000', 'background': '#628296' }).show();


                $(searchForm.el).on('keydown', function (event) {
                    if (event.key === "Enter") {
                        $('.Default', searchForm.el).click();
                        event.preventDefault();
                    }

                });
                resGrd.on("rowsRendered", function () {
                   
                    if (resGrd.rows.length == 1) {
                        //  $('table[itemno]', resGrd.el).click(); // Auto-click the single row
                        // if (!window.__debug) {
                        t.setParams({
                            params: resGrd.rows[0],
                            isRow: true
                        });

                        //  $('.CloseLOVPopup', popup).click();
                        // t.fireEvent('LOVPopupClosed');
                        // }
                        $('.CloseLOVPopup', popup).click();
                        t.fireEvent('LOVPopupClosed', { grd: resGrd, rowData: resGrd.rows[0], popupId: popId, row: $('table[itemno]', resGrd.el)[0] });
                    }
                });

                $('.CloseLOVPopup', popup).bind('click.LOVPopup', function () {
                    // $('body').css('overflow', 'clip');
                    popup.hide();
                    // $(t.el).unmask();
                    hideOverlay();
                    // $('.CloseLOVPopup', popup).unbind('click.LOVPopup');

                    t.fireEvent('LOVPopupClosed', { popupId: popId });
                });
                popup[0].init = true;
            }
            //$(t.el).mask("");
             showOverlay();
           // $('.loadmask-msg', t.el).hide();
            searchForm.show();
            resGrd.show();
            $('.OnPopupShowFocus', searchForm.el).focus();
            $('.reset[resetonpopupshow]', searchForm.el).click();
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
           // $(t.el).mask("");
            //$('.loadmask-msg', t.el).hide();
            hideOverlay();
            t.fireEvent('LOVPopupShown', popup);
            popup[0].init = true;
        }
        if (!popup[0].init) {

        }

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
        $('.LOVPopup', t.el).focus(function () {//form widget inside bindEvents()
            //this is textbox control
            //;

            var cf = { ctrl: this };
            t.showPopup(cf);

            //var popId = $(this).attr('lovpopupid'), searchForm, searchFormId = $(this).attr('lovsearchformid'), resGrd, resGrdId = $(this).attr('lovresultgridid'),
            //    popup = $(`div.LOVPopup[lovpopupid="${popId}"]`),
            //    autoShowControls = $(this).attr('auto-show-popup-controls'),popupControls=[]; // comma separated controls which has to be shown automatically
        });//end of focus event
        t.AutoComplete();
    },
    AutoComplete: function (ctx) {
        return;
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
    GetField: (argId, ctx) => {
        //get a form field by argumentid
        var t = this;
        if (!argId) return;
        ctx = ctx || t.el;
        return $(`[argumentid="${argId}"]`, ctx);
    },
    GetFields: function (flds, ctx) {
        //flds is field argument  ids separated by commmas
        //ctx is optional, if not given get the fileds from current form widget
        var t = this;
        if (!flds) return;
        ctx = ctx || t.el;
        var arr = flds.split(','), arg = '';
        for (var i = 0; i < arr.length; i++) {
            arg += '[argumentid="' + arr[i] + '"],';
        }
        return $(arg, ctx);
    },
    //LoadCombo: function (t, cbo, ParentKey, cf) {
    //    var ch = cbo.filter('ul'), sInfo = ch.attr('storeinfo');
    //    if (!sInfo) {
    //        console.log('Store info not found for: ' + ch.attr('argumentid'));
    //        return;
    //    }
    //    sInfo = decJSON(sInfo);
    //    sInfo["ParentKey"] = ParentKey;
    //    cf = cf || {};

    //    if (!!sInfo.Params) {
    //        Ext.apply(sInfo, t.GetArgs(sInfo.Params, t.el));
    //        delete sInfo.Params;
    //    }

    //    if (!!cf.params) {
    //        Ext.apply(sInfo, cf.params);
    //    }

    //    var inv = new AsyncWidgets.RAInvoker();
    //    inv.on('onSuccess', function (res) {
    //        try {
    //            res.Response = decJSON(res.Response);
    //        } catch (ex) { }

    //        if (res.status == 'OK' && res.Response.Rows.length > 0) {
    //            var rowTemplate = String.format('<tpl for="."><li><a class="dropdown-item" href="#" data-value="{{0}}">{{1}}</a></li></tpl>', sInfo.ValCol, sInfo.TextCol);
    //            var rowTpl = new Ext.XTemplate(rowTemplate, { compiled: true, disableFormats: true });
    //            rowTpl.compile();
    //            var tt = rowTpl.applyTemplate(res.Response.Rows);

    //            ch.html(tt);

    //            ch.find('.dropdown-item').on('click', function (e) {
    //                e.preventDefault();
    //                var selectedValue = $(this).data('value');
    //                var selectedText = $(this).text();
    //                ch.closest('.dropdown').find('.dropdown-toggle').text(selectedText).attr('data-selected-value', selectedValue);
    //                ch.attr('selectedValue', selectedValue);
    //            });
    //        }
    //        ch.attr("loaded", "true");
    //        t.fireEvent('onComboFilled', { combo: ch, Response: res });
    //        hideOverlay();
    //    });

    //    inv.on('onFailure', function (res) {
    //        hideOverlay();
    //        ch.removeAttr("ccloading", "");
    //    });

    //    ch.empty().append('<li><a class="dropdown-item" href="#">Loading...</a></li>');
    //    showOverlay();

    //    var ServiceInfo = getForm(null, null, sInfo);
    //    inv.invokeRA({ params: ["ActorId", "DataHelper", "ActionId", "ChildComboRows", "ServiceInfo", ServiceInfo] });
    //}
    LoadCombo: function (t, cbo, ParentKey, cf) {
        //  ;



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
            
            var itemAttrs = "";
            try {
                res.Response = decJSON(res.Response);
            }
            catch (ex) {

            }
            if (res.status == 'OK' && res.Response.Rows.length > 0) {

                if (!!sInfo.ItemExtraAttrs) {
                    var k = "", arr = sInfo.ItemExtraAttrs, i;
                    for (i = 0; i < arr.length; i++) {
                        itemAttrs += String.format(" {0}='{{1}}' ", arr[i], arr[i]);
                    }
                }
                // rowTemplate = '<tpl for="."><option  value="{' + sInfo.ValCol + '}">{[this.getField(values,\'' + sInfo.TextCol + '\') ]}</option></tpl>';
                rowTemplate = String.format('<tpl for="."><option {2} value="{{0}}">{{1}}</option></tpl>', sInfo.ValCol, sInfo.TextCol, itemAttrs);
                //rowTemplate = String.format('<tpl for="."><li><a class="dropdown-item" href="#" data-value="{{0}}">{{1}}</a></li></tpl>', sInfo.ValCol, sInfo.TextCol, itemAttrs);
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
                    // Assuming 'ch' is the <ul> where items should be added
                //    $('li:first', ch).after(`<li class="dropdown-item">${tt}</li>`);
                else
                    ch.html(tt);
                //  ch.html($(tt));
                //to prevent a combobox from getting enabled automatically, add attribute "no-enable-on-values-loaded" with a value set to "true"
                var NoEnableOnValuesLoaded = ch.attr("no-enable-on-values-loaded") || "false";
                // NoEnableOnValuesLoaded = NoEnableOnValuesLoaded.toLowerCase();
                if (NoEnableOnValuesLoaded.toLowerCase() == "false") {
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
            // t.$el.unmask();
            hideOverlay();
        });
        inv.on('onFailure', function (res) {
            // t.$el.unmask();
            hideOverlay(); 
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
        //t.$el.mask('Please wait while loading ... ');
        showOverlay() ;
        
        inv.invokeRA({ params: ["ActorId", "DataHelper", "ActionId", "ChildComboRows", "ServiceInfo", ServiceInfo] });

    }
    ,

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
            
            //  wc.header.template = $('<div class="x-form-container" style="padding:5px;"><center><div class="w-panel-head w-top-corner"><table cellspacing="0" cellpadding="0" border="0" style="width: 100%;"><tbody><tr><td><table cellspacing="0" cellpadding="0" border="0" style="width: 100%;"><tbody><tr><td class="w-head-text"></td></tr></tbody></table></td><td style="width: 100%;">&nbsp;</td><td><span class="w-ui-icon w-ui-panel-icon-opened w-ui-panel-icon" style="">&nbsp;</span></td></tr></tbody></table></div></center></div>').css(wc.ContainerStyle);
            //wc.header.template = $(`<div class="x-form-container container-fluid p-2 style="">
            //                                <div class="w-panel-head w-top-corner shadow-sm rounded">
            //                                    <div class="d-flex align-items-center">
            //                                        <span class="w-head-text  me-2 ink-bar">Test</span>
            //                                    </div>
            //                                    <hr> <!-- Full-width gray line -->
            //                                </div>
            //                            </div>`).css(wc.ContainerStyle);


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

        // {startDate:'yyyy/mm/dd'}
        var datePickerCF = {};


       // t.fireEvent('SettingDatePicker', datePickerCF);
        //setDatePicker(t.el, datePickerCF);
        t.bindEvents();
        t.validator = new AsyncWidgets.Validater(t.el, '', { widget: t });
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
                if (Res.status != "OK") {
                    //t.$el.unmask();
                    hideOverlay();
                    alert(Res.detail.message + "\t\n" + Res.detail.stackTrace); return;
                }
                var r = Res.Response;
                if (r.Rows.length > 0) {
                    $("#Count", t.el).html(r.Count);
                    if (!t.data) t.show();
                    t.data = r;
                    fillData();
                }
                //  t.$el.unmask();
                 t.hideOverlay();
            });

            inv.on('onFailure', function (res) {
                //  t.$el.unmask();
                t.hideOverlay();
              

            });
            // t.$el.mask('Please wait while loading ...');
            t.showOverlay();
            var t1 = { DALInfo: this.State.DALInfo, PageNo: nPageNo, PageSize: t.PageSize },
                ServiceInfo = getForm(t.SF.el, null, t1);
            inv.invokeRA({
                params: ["ActorId", "DataHelper", "ActionId", "Search", "ServiceInfo",
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
                //;widgetid
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
            //;
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
        if (!!cf.params) {
            // ;
            for (var param in cf.params) {

                //var $fld = ctx.find('[argumentid="' + param + '"]'),
                fld = null;


                var $fld = $(`[argumentid]${subWidgetFilter}`, ctx).filter('[argumentid="' + param + '"]');
                if ($fld.length < 1) {
                    $fld = $(`[argumentid]${subWidgetFilter}`, ctx).find('[argumentid="' + param + '"]')
                }
                if ($fld.length > 0) {
                    fld = $fld[0];
                }
                if (!fld) {
                    // ;
                    if (dbg()) {
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

                    setField(fld, cf.params[param], ctx);
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
        debugger
        var t = this;
        var cf = decJSON($(btn).attr('conf'));
        btn.cf = cf;

        if (!!cf.GroupId) {
            t.validator = new AsyncWidgets.Validater(t.el, '[groupid="' + cf.GroupId + '"]', { widget: t });
        }
        $('span[errmsg]', t.el).hide();
        if (!t.validator.isValid({ btn: $(btn) })) {
            t.showInvalid(t);
            return false;
        }
        var inv = new AsyncWidgets.RAInvoker();
        inv.on('onSuccess', function (res) {
            Ext.applyIf(cf, { ShowActionMsg: true });
            /*var res = decJSON(res);*/

            if (res.status == 'OK') {
                params = res.Response.split('||');
                if (params[1] == 'Error') {
                    $(this).showMessage(params[2]);
                }
                else {

                    $('[argumentid][isvalid]', t.el).trigger('blur');

                    t.fireEvent('actionSuccess', { btn: btn, cf: cf, res: res, params: params }); //deprecated

                    t.fireEvent('afterDataAction', { btn: btn, cf: cf, res: res, params: params });



                    t.setParams({ reset: cf.ResetOnSuccess }); //reset form if specified in button config

                    if (cf.ShowActionMsg) {
                        $(this).showMessage(params[2]);
                    }
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

            // $(t.el).unmask();
            hideOverlay();
        });
        inv.on('onFailure', function (res) {
            //  $(t.el).unmask();
            hideOverlay();
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
        // t.$el.mask('Please wait while loading ...');
        showOverlay();

        ServiceInfo = getForm(t.el, cf.GroupId || null, params, null, null, { filter: cf.filter });
        inv.invokeRA({
            params: ["ActorId", cf.ActorId, "ActionId", cf.ActionId, "ServiceInfo",
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
        }(true);
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
                //$('ul[loadon="FirstVisible"]', t.el).each(function () {
                //    t.LoadCombo(t, $(this), "");
                //});
            }
            $('select[loadon="EveryVisible"]', t.el).each(function () {
                t.LoadCombo(t, $(this), "");
            });
        }
        if (!t.loaded) { // if loading is not done yet
            t.on('onLoad', onLoad);
            t.load();
        }
        else { // if has been loaded then run the load logic 
           
            onLoad();
        }

        return t;
    },
    refresh: function () {
        var t = this;
        t.base.refresh.call(t);
    },
    Requery: function (cf) {//form widget
        this.loadValues(cf);
    },
    loadValues: function (cf, success) {

        var t = this, st = t.State, ServiceInfo;
        cf = cf || {};
        //$(t.el).mask(MSGWAIT);
        showOverlay();
        Ext.applyIf(cf, { Command: st.DALInfo, GroupId: null, ActorId: 'DataHelper', ActionId: 'Search', readFormValues: true, Params: {} });
        var inv = new AsyncWidgets.RAInvoker();
        inv.on('onSuccess', function (res) {
          // res = decJSON(res);
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
            if (!!success) {
                success(res);
            }
            // $(t.el).unmask();
            hideOverlay();
        });

        inv.on('onFailure', function (res) {
            //  $(t.el).unmask();
             hideOverlay();
            alert('Problem occured while connection to web server');
        });
        t.fireEvent('beforeLoadedValues', { cf: cf });
        var formEl = cf.readFormValues ? t.el : null; //when null then form values are retrieved

        ServiceInfo = getForm(formEl, cf.GroupId, Ext.apply({ Command: cf.Command, PageSize: -1 }, cf.Params));
        inv.invokeRA({
            params: ["ActorId", cf.ActorId, "ActionId", cf.ActionId, "ServiceInfo",
                ServiceInfo]
        });
    }
});


/************************************* </Form Widget> *******************************************/