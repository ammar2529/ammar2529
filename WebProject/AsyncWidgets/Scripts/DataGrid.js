
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
        t.addEvents({
            'rowsRendered': true, 'rowClicked': true, 'beforeSearchGetForm': true, 'beforeRowDelete': true, 'afterRowDelete': true,
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
        //;
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
                //  ;
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
                if (!flags.queryDelete) return; 0
                var ServiceInfo = getForm(null, null, Ext.apply(cf, { RowsToDelete: rowsToDelete })); // "<root>" + $("<dummyform></dummyform>") + "</root>";
                // t.$el.mask('Please wait while loading ...');
                showOverlay(); 
                var inv = new AsyncWidgets.RAInvoker();
                inv.on('onSuccess', function (res) {
                    t.fireEvent('afterRowDelete', { res: res });
                    // t.$el.unmask();
                    hideOverlay();
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
                    //t.$el.unmask();
                     hideOverlay();
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
                    //    ;
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
    Requery: function () { //grid widget
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
        function onSearchResult(Res) {
            //var t = this;
            // var Res = decJSON(res);
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

                if (!t.Header.added) {//For the first time only to create headers
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

                        var SeqH = $('<td  class="DataGridHead Sequence" align="center" style="width:40px"><div  class="PWCLabel ColName " style="overflow:hidden;"></div></td>'),
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
                    //if (!!frms.EditFormId) {
                    //    var childRow = $('<td style="width:19px;"><div style="width:25px;overflow:hidden">&nbsp;</div></td>');
                    //    t.Header.repCon.append(childRow.clone().addClass('EditForm w-grid-head-back w-grid-cell-border ColName colIndex-' + i).attr('colid', 'EditForm'));
                    //    t.Item.repCon.append(childRow.clone().addClass('EditForm ColValue  w-grid-cell-border colIndex-' + i++).css('cursor', 'pointer'));
                    //}
                    //if (!!t.ChildGrids) {
                    //    var childRow = $('<td style="width:19px;"><div style="width:19px;overflow:hidden">&nbsp;</div></td>');
                    //    t.Header.repCon.append(childRow.clone().addClass('ChildGrid DataGridHead ColName colIndex-' + i).attr('colid', 'ChildGrid'));
                    //    t.Item.repCon.append(childRow.clone().addClass('ChildGrid ColValue colIndex-' + i++).css('cursor', 'pointer'));
                    //}
                    if (!!frms.EditFormId) {
                        var childRow = $('<td style="width:12px;"></td>');
                        var editIcon = $('<i class="fa-regular fa-pen-to-square"></i>'); // Font Awesome edit icon

                        t.Header.repCon.append(
                            childRow.clone().addClass('EditForm w-grid-head-back w-grid-cell-border ColName colIndex-' + i)
                                .attr('colid', 'EditForm')
                        );

                        t.Item.repCon.append(
                            childRow.clone().addClass('EditForm ColValue w-grid-cell-border colIndex-' + i++)
                                .css('cursor', 'pointer')
                                .append(editIcon) // Append the edit icon here
                        );
                    }

                    if (!!t.ChildGrids) {
                        var childRow = $('<td style="width:12px;">/td>');

                        t.Header.repCon.append(
                            childRow.clone().addClass('ChildGrid DataGridHead ColName colIndex-' + i)
                                .attr('colid', 'ChildGrid')
                        );

                        t.Item.repCon.append(
                            childRow.clone().addClass('ChildGrid ColValue colIndex-' + i++)
                                .css('cursor', 'pointer')
                        );
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
                                var ShowOnMDDevice = _t[iLoop].getAttribute('ShowOnMDDevice');
                                var HideOnAllSmallDevices = _t[iLoop].getAttribute('HideOnAllSmallDevices');
                                var ShowOnMdDevices = 'd-none d-sm-none d-xs-none d-md-block d-lg-block d-xl-block';
                                var ShowOnlyLargeDevices = 'd-none d-sm-none d-xs-none d-md-none d-lg-block d-xl-block';
                                
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

                                t2.addClass('colIndex-' + i).attr('colindex', i).attr('colid', cl); // Add your specific class here

                                //if (ShowOnMDDevice !== null && ShowOnMDDevice !== undefined) {
                                //    tt.addClass(ShowOnMdDevices); // Visible on md, lg, xl
                                //    t2.addClass(ShowOnMdDevices);
                                //}

                                //if (HideOnAllSmallDevices !== null && HideOnAllSmallDevices !== undefined) {
                                //    tt.addClass(ShowOnlyLargeDevices); // Visible on md, lg, xl
                                //    t2.addClass(ShowOnlyLargeDevices);
                                //}



                                var colTemp = $(_t[iLoop]).html();
                                var itemCol = $('.ColValue', t2).html(colTemp).parent();
                                t.Header.repCon.append(tt);
                                t.fireEvent('onItemColGenerated', { colId: cl, itemCol: itemCol });
                                t.Item.repCon.append(t2);
                                i++;
                            }
                            break;
                        }
                        else { //not a templated grid
                            var colCF = t.GridConf.cols[col] || {}, colCap, colFMT;
                            colFMT = !!colCF.format ? ':' + colCF.format : '';

                            if (!t.colFMT) {
                                t.colFMT = !!colCF.format;
                            }


                            colCap = colCF.caption == undefined ? col.splitCamel() : colCF.caption;
                            
                            var colBootstrapClass = "d-none d-md-table-cell noneForOtherScreen";// colCF.smallDeviceWitdh == undefined ? "d-none d-md-table-cell" : "d-sm-table-cell";// colCF.bootstrapClass;
                            var colMdBotstrapClass = "d-none d-md-none d-lg-table-cell noneForMdScree";

                            var viewportSize = getViewportSize(); // Get the current viewport size

                            //if (viewportSize === 'md') {
                            //    colMdBotstrapClass = "d-none d-md-table-cell";
                            //} else if (viewportSize === 'lg') {
                            //    colMdBotstrapClass = "d-md-none d-lg-table-cell";
                            //}

                         
                            var colHeadHtmlTemplate = colTempHead.clone().addClass('colIndex-' + i).attr('colindex', i);
                            colHeadHtmlTemplate.attr("class", ` ${colBootstrapClass}`);

                            var colHead = $(".ColName", colHeadHtmlTemplate)
                                .html(colCap)
                                .closest('td');
                            var existingClasses = "";
                            if (!!colHead.attr('class') ) {
                                existingClasses = colHead.attr('class');
                            }

                            colHead.attr('colid', col);

                       

                            colHead.attr('class', `${existingClasses} ${colBootstrapClass}`);
                            colHead.attr('caption', colCap)

                            if (colCF.hideOnMeduimDevice !== undefined) {
                                colHead.attr('class', `${existingClasses} ${colMdBotstrapClass}`);
                                colHead.attr('caption', colCap)
                            }

                            t.Header.repCon.append(colHead);



                            var colItemTemplate = colTempItem.clone().addClass('colIndex-' + i++).attr('colid', col);

                            var colItem = $(".ColValue", colItemTemplate)
                                .html("{" + col + colFMT + "}")
                                .parent();
                            if (colCF.smallDeviceWitdh !== undefined) {
                                colItem.addClass("hasDuplicate");
                            }
                            existingClasses = "";
                            if (!!colItem.attr('class')) {
                                existingClasses = colItem.attr('class');
                            }

                         

                            colItem.attr('class', `${existingClasses} ${colBootstrapClass}`);
                            colItem.attr('caption', colCap);
                            if (colCF.hideOnMeduimDevice !== undefined) {
                                colItem.attr('class', `${existingClasses} ${colMdBotstrapClass}`);
                                colItem.attr('caption', colCap)
                            }
                            t.fireEvent('onItemColGenerated', { colId: col, itemCol: colItem });
                            t.Item.repCon.append(colItem);
                        }
                    }
                    ////////////adding columns for small device//////////////
                    // Adding columns for small devices
                    var colTempHead = $(t.Header.colTemp);
                    var colTempItem = $(t.Item.colTemp);
                    var isSmallDevice = window.matchMedia("(max-width: 767px)").matches;
                    var isMediumDevice = window.matchMedia("(min-width: 768px) and (max-width: 991px)").matches;
                    for (var key in t.GridConf.cols) {

                       let colConfig = t.GridConf.cols[key];
                        if (colConfig.smallDeviceWitdh !== undefined) 
                        {

                            var colHeadHtmlTemplate = colTempHead.clone();//.addClass('colIndex-' + i).attr('colindex', i);
                            colHeadHtmlTemplate.attr("class", "d-sm-table-cell d-md-none ");
                            let fieldName = colConfig.caption === undefined ? key : colConfig.caption;
                            var colHead = $(".ColName", colHeadHtmlTemplate)
                                .html(fieldName)
                                .closest('td');
                            //var existingClasses = "";
                            //if (!!colHead.attr('class')) {
                            //    existingClasses = colHead.attr('class');
                            //}

                            colHead.attr('colid', `${key}_sm`).css("width", colConfig.smallDeviceWitdh);

                          //  colHead.attr('class', `${existingClasses} ${colBootstrapClass}`);

                            t.Header.repCon.append(colHead);

                            var colItemTemplate = colTempItem.clone()//.addClass('colIndex-' + i++).attr('colid', col);

                            var colItem = $(".ColValue", colItemTemplate)
                                .html(`{${key}}`)
                                .parent();

                            colItem.addClass(`d-sm-table-cell d-md-none isDuplicate`).css("width", colConfig.smallDeviceWitdh);

                            t.fireEvent('onItemColGenerated', { colId: `${key}_sm`, itemCol: colItem });
                            t.Item.repCon.append(colItem);
                           

                        }
                    }

                    t.Header.repCon.append(`<td class= "d-sm-table-cell d-md-table-cell d-lg-none collapseBtn" > </td>`);
                    t.Item.repCon.append(`<td class="d-sm-table-cell d-md-table-cell d-lg-none collapseBtn"><i class="fas fa-chevron-down"></i></td>`);

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
                        if ($(this).html().trim() == t1.PageSize) {
                            $('.SelPageSize', t.el).removeClass('SelPageSize');
                            $(this).addClass('SelPageSize');
                        }
                    }

                });

                //**************************************************************************//
                var setPager = function (conf) {
                    //;
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
                            else { t.css('display', '', '.Last, .Next', pager); }
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
                if (!t._rowTpl) { //if template not compile then compile it and save
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
                else { // otherwise get saved template
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

                /////
                // Handle chevron click event
                // Handle chevron click event
                $('.Item .collapseBtn', t.Repeater).click(function () {
             
                    var viewportSize = getViewportSize();
                    var $tr = $(this).closest('tr');
                    var $nextTr = $tr.next('.generatedRow');
                    var $icon = $(this).find('i');

                    // Remove any previously expanded rows
                    $('.generatedRow').remove();
                    $('.collapseBtn i').removeClass('fa-chevron-up').addClass('fa-chevron-down');

                    // Toggle visibility if the row already exists
                    if ($nextTr.length) {
                        $nextTr.remove();
                        $icon.removeClass('fa-chevron-up').addClass('fa-chevron-down');
                        return;
                    }

                    // Function to generate Bootstrap row content
                    function generateRowContent($row, excludedClasses) {
                        return $row.find('td').not(excludedClasses).map(function () {
                            var colid = $(this).attr('colid');
                            var colCap = $(this).attr('caption');
                            var text = $(this).text().trim();

                            var label = colCap != null && colCap !== undefined ? colCap : colid;

                            return label && text ? `
                                <div class="row" style="margin: 5px 0;">
                                    <div class="col-4 text-end" style="padding: 5px; font-weight: bold;">
                                        ${label}:
                                    </div>
                                    <div class="col-8 text-start" style="padding: 5px;">
                                        ${text}
                                    </div>
                                </div>` : null;
                        }).get();
                    }

                    // Generate and insert the new row based on viewport size
                    var values;
                    var newRow;
                    if (viewportSize === 'sm' || viewportSize === 'xs') {
                        $nextTr.remove();
                        $icon.removeClass('fa-chevron-up').addClass('fa-chevron-down');
                        values = generateRowContent($tr, '.hasDuplicate, .RowSelect, .Sequence, .isDuplicate');
                        newRow = `
                                    <tr class="generatedRow d-sm-table-row d-md-none">
                                        <td colspan="5">
                                            <div class="card">
                                                <div class="card-body">
                                                    ${values.join('')}
                                                </div>
                                            </div>
                                        </td>
                                    </tr>`;
                    } else if (viewportSize === 'md') {
                        $nextTr.remove();
                        $icon.removeClass('fa-chevron-up').addClass('fa-chevron-down');
                        values = generateRowContent($tr, '.hasDuplicate, .RowSelect, .Sequence, .isDuplicate, .noneForOtherScreen');
                        newRow = `
                                    <tr class="generatedRow d-md-table-row d-none d-lg-none">
                                        <td colspan="5">
                                            <div class="card">
                                                <div class="card-body">
                                                    ${values.join('')}
                                                </div>
                                            </div>
                                        </td>
                                    </tr>`;
                    }

                    // Insert the new row and update icons
                    $tr.after(newRow);
                    $icon.removeClass('fa-chevron-down').addClass('fa-chevron-up');

                    // Scroll to the new row and set focus
                    $('html, body').animate({
                        scrollTop: $tr.offset().top
                    }, 200);
                    $tr.next('.generatedRow').focus();
                });

                /////

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
                        if ($(e.target).hasClass('ColValue') || $(e.target).attr('colid') || $(e.target).closest('.ColValue').length) {
                            t.fireEvent('rowClicked', { rowData: r.Rows[$(this).attr('itemno') - 1], e: e, row: this });
                        }
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
                            Widget.rowDetail = {
                                itemTbl: itemTbl, rowIdx: rowIdx, colIdx: colIdx, parent: dt[objName].container,
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
                    //;
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
                        //;
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
                    //$(t.el).unmask();
                     hideOverlay();
                }
                return;
            }
            // $(t.el).unmask();
             hideOverlay();
        }



        inv.on('onSuccess', function (res) {
            onSearchResult(res);

        });

        inv.on('onFailure', function (res) {

            //  $(t.el).unmask();
            showOverlay()
        });
        // $(t.el).mask('Please wait while loading ...');
        showOverlay();
        inv.invokeRA({
            params: ["ActorId", "DataHelper", "ActionId", "Search", "ServiceInfo",
                ServiceInfo]
        });
    },
    setColWidth: function (t) {
        var arrHead = [], arrCols = [], heads, col, headerColumn, cSel; //store queried head columns to bost performance
        if (!!t._arrHeads) {
            arrHead = t._arrHeads;
        }

        if (!t.ColWidthSettled) { //first time call only
            //if (!(!$.boxModel && t.Top.hasClass('w-panel-head')))
            //    t.ColWidthSettled = true;

            var w, col, tp = 0;
            // hSel = $('> table  > tbody > tr.HeaderTR > td.Header td', t.Repeater
            headerColumn = $('.Header', t.Repeater); // column which contains the header table
            for (var i = 0; i < t.noOfCols; i++) {

                if (!t._arrHeads) { //if header columns is not saved, then construct the array - only first time
                    heads = $('.colIndex-' + i, headerColumn); //$('table > tbody > tr.HeaderTr > td .colIndex-' + i, t.Repeater);
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
                            //; left: -1000,
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
                $('.ColValue', col)
                    .css({ 'overflow': 'hidden', 'margin-left': LMmargin + 'px' })
                    .width(w - (LMmargin + 10))
                    .mouseenter(
                    function () {
                        var e = this, $e = $(this), sl = $('.smartLable'), lf, wd;
                        if ($e.hasClass('NoTooltip') || $.trim($e.text()) == '') return;
                        //  if ($e.width() + LMmargin < e.scrollWidth) {
                        if ($e.width() < e.scrollWidth) {
                            if (isHTML($e.html())) {
                                sl.html($($e.html()));
                            }
                            else {
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
        inv.invokeRA({
            params: ["ActorId", "Authentication", "ActionId", "RegisterNewUser", "ServiceInfo",
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

            //$(t.el).unmask();
             hideOverlay();
        });
        inv.on('onFailure', function (res) {
            // $(t.el).unmask();
            hideOverlay();
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
        //;
        // $(t.el).mask('Please wait while loading ...');
        showOverlay();
        //ServiceInfo = getForm(t.el, cf.GroupId || null, params, null, null, { filter: cf.filter });
        ServiceInfo = getForm(null, null, params);
        inv.invokeRA({
            params: ["ActorId", cf.ActorId, "ActionId", cf.ActionId, "ServiceInfo",
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
            t.Item = $('<table class="table " cellspacing="0" cellpadding="0" border="0" style="width:100%;table-layout:fixed"> <tbody> <tr class="ItemTableRow" style="white-space:nowrap" EvenRowCSS="w-grid-row-odd" OddRowCSS="w-grid-row-odd" HoverRowCSS=""> <td class="ColTemplate w-grid-cell-border" style="white-space:nowrap;overflow:hidden"> <div class="ColValue w-grid-label" style="white-space:nowrap"> </div> </td> </tr> <tr class="TemplatesById"> <td templateid="SelectableRow" style="margin:0;width:32px;overflow:hidden" class="w-grid-cell-border"> <div style="width:19px;overflow:hidden;margin-left:5px"> <input type="checkbox" class="chkRowSelect"></div> </td> <td templateid="Sequence" style="width:40px" class="w-grid-cell-border"> <div style="overflow:hidden" class="w-grid-label ColValue"></div> </td><td templateid="RowEditForm"   class="RowEditForm w-grid-cell-border"><div style="overflow: hidden;" class="w-grid-label ColValue">&nbsp;</div></td><td templateid="RowDetail"   class=" RowDetail w-grid-cell-border"><div style="overflow: hidden;" class="w-grid-label ColValue">&nbsp;</div></td></tr> </tbody> </table>');
            t.Pager = $('<table border="0" cellpadding="0" cellspacing="0" width="100%" style="background-color:White;padding:2px;table-layout:auto" class="w-grid-border-bottom" > <tbody> <tr> <td align="left" style="width:50%;height:26px"> <table border="0" cellpadding="0" cellspacing="0"> <tbody> <tr class="w-grid-buttons-bottom-container"> </tr> </tbody> </table> </td> <td align="center" class="NoRecsHide"> <table cellspacing="0" cellpadding="0" border="0" style="table-layout:auto;white-space:nowrap"> <tbody> <tr> <td class="w-all-corner w-grid-button First"> <span class="w-ui-icon-yellow w-grid-icon-first"></span></td> <td class="w-all-corner w-grid-button Back"> <span class="w-ui-icon-yellow w-grid-icon-pre"></span></td> <td style="padding-left:5px;padding-right:5px;width:4px;cursor:default" class="w-all-corner w-elem-disabled"> <div class="w-icon-separator"></div></td> <td dir="ltr" class="w-grid-pg-text PWCLabel" style="white-space:nowrap;vertical-align:middle;padding:0px">&nbsp;Page&nbsp;&nbsp;<input type="text" maxlength="7" size="2" class="PWCTextBox PageNoToGo PageNo">&nbsp;&nbsp;of&nbsp; <span class="TotalPages">&nbsp;2&nbsp;</span></td> <td style="padding-left:5px;padding-right:5px;width:4px;cursor:default" class="w-all-corner w-elem-disabled"> <div class="w-icon-separator"></div></td> <td class="w-all-corner w-grid-button Next"> <span class="w-ui-icon-yellow w-grid-icon-next"></span></td> <td class="w-all-corner w-grid-button Last"> <span class="w-ui-icon-yellow w-grid-icon-last"></span></td><td dir="ltr" style="padding-left:5px"> <select class="PWCDropDownList PageSize PageSize-Dropdown" style="display:none"> <option selected="" value="10" role="option">10</option> <option value="20" role="option">20</option><option value="30" role="option">30</option></select> </td></tr></tbody> </table> </td> <td align="right" style="width:50%" class="NoRecsHide"> <table border="0" cellpadding="0" cellspacing="0" width="100%"> <tbody> <tr> <td align="right"> <span><span class="PWCLabel PageSize-NumberList" style="padding-right:0px;display:none">Items per page : <span class="PageSize">10</span>, <span class="PageSize">20</span>, <span class="PageSize">30</span></span><span class="PWCLabel PageSize-NumberList" style="display:none;padding-left:10px;padding-right:10px">|</span> <span class="PWCLabel" Class="w-grid-item-startend" style="padding-right:5px">View <span class="ItemStart"></span> - <span class="ItemEnd">&nbsp;</span>&nbsp;of <span class="Count"></span></span> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table>');
            t.Bottom = $('<span class="Pager"></span>');
            t.NoRecords = $('<div style="padding:10px;background-color:transparent" class="PWCNoDataMessage">No records available.</div>')

    //}
    //    if (t.State.GridTemplate == 'jQueryUI') {
    //        t.Top = $('<div class="w-panel-head w-top-corner"><div class="card-header collapsible-header" data-bs-toggle="collapse" data-bs-target="#collapsePanel" aria-expanded="true" aria-controls="collapsePanel"><table border="0" cellpadding="0" cellspacing="0" style="width:100%"><tr><td><table border="0" cellpadding="0" cellspacing="0" style="width:100%"><tr><td class="w-head-text">Data Grid Example</td></tr></table></td><td style="width:100%">&nbsp;</td><td><span id="collapse-icon" class="w-ui-icon w-ui-panel-icon-opened w-ui-panel-icon">-</span></td></tr></table></div><div id="collapsePanel" class="collapse show"></div></div>');
    //        t.Repeater = $('<div class="GridContainer"><table cellspacing="0" cellpadding="0" border="0" style="width:100%;text-align:left"><tbody><tr class="TopTR"><td class="Top"></td></tr><tr class="HeaderTR"><td class="Header w-grid-border"></td></tr><tr class="ItemTR"><td class="Item w-grid-border"></td></tr><tr class="NoRecordsTR" style="display:none;"><td class="NoRecords w-grid-norecords-msg"></td></tr><tr class="BottomTR"><td class="Bottom"></td></tr></tbody></table></div>');
    //        t.Header = $('<table cellspacing="0" cellpadding="0" width="100%" border="0" class="w-grid-header"><tbody><tr class="w-grid-head-back"><td class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border"><div><span href="#" class="w-grid-head ColName sort"></span></div></td></tr><tr class="TemplatesById"><td templateid="SelectableRow" style="width:32px;padding:0;overflow:hidden;margin:0" class="w-grid-cell-border w-grid-head-back"><div style="width:19px;overflow:hidden;overflow:hidden;margin-left:5px"><input type="checkbox" class="chkRowSelect"></div></td><td templateid="Sequence" style="width:40px;overflow:hidden" class="w-grid-head-back w-grid-cell-border"><div style="overflow:hidden" class="PWCLabel ColName"></div></td><td templateid="RowEditForm" style="width:40px;overflow:hidden;" class="RowEditForm w-grid-head-back w-grid-cell-border"><div style="overflow:hidden;" class="PWCLabel ColName">&nbsp;</div></td><td templateid="RowDetail" style="width:40px;overflow:hidden;" class="RowDetail w-grid-head-back w-grid-cell-border"><div style="overflow:hidden;" class="PWCLabel ColName">&nbsp;</div></td></tr></tbody></table>');
    //        t.Item = $('<table cellspacing="0" cellpadding="0" border="0" style="width:100%;table-layout:fixed"><tbody><tr class="ItemTableRow" style="white-space:nowrap" EvenRowCSS="w-grid-row-odd" OddRowCSS="w-grid-row-odd" HoverRowCSS=""><td class="ColTemplate w-grid-cell-border" style="white-space:nowrap;overflow:hidden"><div class="ColValue w-grid-label" style="white-space:nowrap"></div></td></tr><tr class="TemplatesById"><td templateid="SelectableRow" style="margin:0;width:32px;overflow:hidden" class="w-grid-cell-border"><div style="width:19px;overflow:hidden;margin-left:5px"><input type="checkbox" class="chkRowSelect"></div></td><td templateid="Sequence" style="width:40px" class="w-grid-cell-border"><div style="overflow:hidden" class="w-grid-label ColValue"></div></td><td templateid="RowEditForm" class="RowEditForm w-grid-cell-border"><div style="overflow:hidden;" class="w-grid-label ColValue">&nbsp;</div></td><td templateid="RowDetail" class="RowDetail w-grid-cell-border"><div style="overflow:hidden;" class="w-grid-label ColValue">&nbsp;</div></td></tr></tbody></table>');
    //        t.Pager = $('<table border="0" cellpadding="0" cellspacing="0" width="100%" style="background-color:White;padding:2px;table-layout:auto" class="w-grid-border-bottom"><tbody><tr><td align="left" style="width:50%;height:26px"><table border="0" cellpadding="0" cellspacing="0"><tbody><tr class="w-grid-buttons-bottom-container"></tr></tbody></table></td><td align="center" class="NoRecsHide"><table cellspacing="0" cellpadding="0" border="0" style="table-layout:auto;white-space:nowrap"><tbody><tr><td class="w-all-corner w-grid-button First"><span class="w-ui-icon-yellow w-grid-icon-first"></span></td><td class="w-all-corner w-grid-button Back"><span class="w-ui-icon-yellow w-grid-icon-pre"></span></td><td style="padding-left:5px;padding-right:5px;width:4px;cursor:default" class="w-all-corner w-elem-disabled"><div class="w-icon-separator"></div></td><td dir="ltr" class="w-grid-pg-text PWCLabel" style="white-space:nowrap;vertical-align:middle;padding:0px">&nbsp;Page&nbsp;&nbsp;<input type="text" maxlength="7" size="2" class="PWCTextBox PageNoToGo PageNo">&nbsp;&nbsp;of&nbsp;<span class="TotalPages">&nbsp;2&nbsp;</span></td><td style="padding-left:5px;padding-right:5px;width:4px;cursor:default" class="w-all-corner w-elem-disabled"><div class="w-icon-separator"></div></td><td class="w-all-corner w-grid-button Next"><span class="w-ui-icon-yellow w-grid-icon-next"></span></td><td class="w-all-corner w-grid-button Last"><span class="w-ui-icon-yellow w-grid-icon-last"></span></td></tr></tbody></table></td><td align="right" style="width:50%" class="NoRecsHide"><table border="0" cellpadding="0" cellspacing="0" width="100%"><tbody><tr><td align="right"><span><span class="PWCLabel PageSize-NumberList" style="padding-right:0px;display:none">Items per page:<span class="PageSize">10</span>,<span class="PageSize">20</span>,<span class="PageSize">30</span></span><span class="PWCLabel PageSize-NumberList" style="display:none;padding-left:10px;padding-right:10px">|</span><span class="PWCLabel" Class="w-grid-item-startend" style="padding-right:5px">View<span class="ItemStart"></span>-<span class="ItemEnd">&nbsp;</span>&nbsp;of<span class="Count"></span></span></td></tr></tbody></table></td></tr></tbody></table>');
    //        t.Bottom = $('<span class="Pager"></span>');
    //        t.NoRecords = $('<div style="padding:10px;background-color:transparent" class="PWCNoDataMessage">No records available.</div>');

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

        var tpls = $(el).children('[template]'), TMPById, dtbl = $('<table class="container mt-5 "></table>'), trow, key;


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

        dtbl = $('<table ></table>');
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
        gc = { forms: { ColIndex: RES_PATH + 'images/GridRowEdit.gif' }, cols: {}, buttons: {}, styles: {}, pager: { Visible: true, PageSizeType: 'NumberList' }, header: { Visible: true }, TopButtonPanel: { Visible: true } };
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
            'refresh': { text: '', visible: false, location: 'bottom', conf: { Action: 'RequeryGrid' } },
            'delete': { text: 'Delete', location: 'top', conf: { Action: 'DeleteRows' } },
            'new': { text: 'New', location: 'top', conf: { Action: 'ShowGridForm' } }
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
                    $('.w-grid-buttons-top-container,.Header, .Pager, .Item,Top *:not(.w-panel-head)', t.el).hide();
                }
                else {
                    $(this).addClass('w-ui-panel-icon-opened').removeClass('w-ui-panel-icon-closed');
                    $('.w-grid-buttons-top-container,.Header, .Pager,.Item,Top > *:not(.w-panel-head)', t.el).show();
                }
            });
        }



        t.fireEvent('TemplateLoaded');
    },
    bindEvents: function () { //grid control
        var t = this, el = t.el;
        $('.ActionButton', el).not($('div[conf] *', el)).unbind('click').click(function () {
            //;
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
                //$(t.el).mask(MSGWAIT);
                showOverlay();
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
                   // var res = decJSON(res);
                    if (res.status == 'OK') {
                        if (res.Response.Rows.length > 0) {
                            wFrm.fireEvent('onLoadingValues', { res: res });
                            wFrm.setParams({ params: res.Response.Rows[0], isRow: true });
                            wFrm.fireEvent('onLoadedValues', { res: res });
                        }
                    }
                    // $(t.el).unmask();
                    hideOverlay();
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
        }(true);
        return t;

    },
    hide: function () {
        var t = this
        t.unbindWinResize();
        t.base.hide.call(t);
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
        else {
            onLoad();
        }
        t.bindWinResize();

        return t;
    },
    hideButtons: function () {
        var t = this, arg = args = Array.prototype.slice.call(arguments, 0);
        (function () { // deffered call so if the widget is not loaded let it get loaded first and the hide the button
            for (var iLoop = 0; iLoop < arg.length; iLoop++) {
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
    },
    onResize: function () {
        var t = this;
        if (!!t.resizeTimeout) {
            clearTimeout(t.resizeTimeout);
            t.resizeTimeout = null;
        }
        
        t.resizeTimeout = setTimeout(function () {
            console.log('Current viewport size: ' + getViewportSize());
        }, 200);

    },
    bindWinResize: function () {

        var t = this;
        if (!!t.isResizeBound) {
            return;
        }
        t.isResizeBound = true;
        // Example usage:
        window.addEventListener('resize', t.onResize);
    },
    unbindWinResize: function () {

        var t = this;
        t.isResizeBound = false;
        // Example usage:
      //  window.RemoveEventListener('resize', t.onResize);
    }



});
