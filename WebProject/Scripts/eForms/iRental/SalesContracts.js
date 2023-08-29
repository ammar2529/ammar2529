﻿/*const { param} = require("jquery");
*/
Ext.namespace('Sales.SalesContracts');

/**
 * *******************************Sales Contract main grid Script***********************************************
 */

Sales.SalesContracts.grdSalesContracts = function (t) {
    var ColClick = function () {
        $('.EditForm.ColValue', $(this).closest('tr')).trigger('click');
        return false;
    };
    t.on('rowsRendered', function () {

        $('.StateName', t.el).each(function () {
            //if ($(this).text().indexOf('Created - Reservation') > -1) {
            //$('.chkRowSelect', $(this).closest('tr')).removeAttr('disabled');
            //}
            //else if ($(this).text() != '{StateName}') {
            $('.chkRowSelect', $(this).closest('tr')).attr('disabled', 'disabled');
            //}

            var ptr = $(this).closest('tr');

            if ($(this).text().indexOf('Contract Closed - Payment Cleared') > -1) {
                ptr.css('background', '#F1F1F1').attr('disabled', 'disabled');
            }
            else if ($(this).text().indexOf('Contract Cancelled') > -1) {
                ptr.css('background', '#F1F1F1').attr('disabled', 'disabled');
            }
            else if ($(this).text().indexOf('Contract Open - Car In') > -1) {
                $(this).css('color', 'Red');
            }
            else if ($(this).text().indexOf('With Legal - Contract Open - Car Out') > -1) {
                $(this).css('color', 'Red');
            }
            else if ($(this).text().indexOf('With Legal - Contract Open - Car In') > -1) {
                $(this).css('color', 'Red');
            }
            else if ($(this).text().indexOf('With Legal - Contract Closed - Pending Payment') > -1) {
                $(this).css('color', 'Red');
            }
            else if ($(this).text().indexOf('Contract Closed - Pending Payment') > -1) {
                $(this).css('color', 'Red');
            }
        });
        var cols = $('table[itemno] td:not(.RowSelect,.EditForm)', t.el).css('cursor', 'pointer').click(ColClick);
        $('.ColValue', cols).css('cursor', 'pointer').click(ColClick);
    });
};

/**
 * *******************************Sales Contract main form Script***********************************************
 */
Sales.SalesContracts.frmSalesContractsInit = 
     function (t) {
      
        t.on('beforeDataAction', function (params) {

          // Ext.apply(params, frmProcGS.GetArgs([{ Name: 'FormType' }, { Name: 'FormNameCode' }]));

        });
        t.on('LOVPopupClosed', (args) => {
          //  debugger;

            t.setParams({ params: args.rowData, isRow: true });
            //for (var key in args.rowData) {
            //    console.log(`${key}:${args.rowData[key]}`);
            //   //debugger;
            //    var targetElement = $(`[argumentid='${key}']`, t.el);
            //    if (targetElement.is('input')) {
            //        targetElement.val(args.rowData[key]);
            //        alert('element not found')
            //        return
            //    }
            //    else {

            //        targetElement.text(args.rowData[key]);
            //    }


            //}

        });
        t.on('LOVPopupShown', (popup) => {
           // debugger;
            $(t.el).mask("");
            $('.loadmask-msg', t.el).hide();
            popup.css({ position: 'absolute', top: '25%', left: '0px', 'z-index': '1000', 'background': '#628296' }).show();
            t.fireEvent('LOVPopupShown', popup);
        });

        

          
    }

/**
 * *******************************Sales Contract Payment Details Init Script***********************************************
 */
Sales.SalesContracts.frmSalesContactsPaymentDetails =
    function (t) {

        t.on('beforeDataAction', function (param) {

            // Ext.apply(params, frmProcGS.GetArgs([{ Name: 'FormType' }, { Name: 'FormNameCode' }]));
            var frm = AsyncWidgets.get("frmSalesContracts");
            param.ParentRecId = frm.GetArgVal('RecId');
        });

        setTimeout(function () {
            AsyncWidgets.get('frmSalesContactsPaymentDetails').show()
        }, 3000);

//        var fn = function () {

            t.on('show', function (args) {
                $('.ChequeNo', t.el).hide();
                $('.AlwaysDisable', t.el).attr('disabled', 'disabled');
                $('[argumentid="PaymentMode"]', t.el).removeAttr('disabled').removeClass('ElemDisabled');

                var frm = AsyncWidgets.get('frmSalesContracts');
                $('[argumentid="ParentRecId"]', t.el).text(frm.GetArgVal('RecId'));

                var dt = new Date();
                $('[argumentid="PaymentDate"]', t.el).val(dt.getDate() + '/' + (dt.getMonth() + 1) + '/' + dt.getFullYear());

                $('[argumentid="PaymentMode"] option:nth(1)', t.el).attr('selected', 'selected');
                $('[argumentid="PaymentMode"]', t.el).attr('rowvaluetoset', 'Cash');
            });

            //On Change of Payment Mode  $('option:selected', elem)
            $('[argumentid="PaymentMode"]', t.el).change(function () {
                var cbo = $('[argumentid="PaymentMode"] option:selected');
                if ($.trim(cbo.text()) == 'Cheque') {
                    $('.ChequeNo', t.el).show();
                }
                else {
                    $('.ChequeNo', t.el).hide();
                    $('[argumentid="ChequeNo"]', t.el).val('');
                }
            });
            //End On Change of Payment Mode

            //On Change of Amount Update Amount in Words
            $('[argumentid="PaymentAmount"]', t.el).change(function () {

                $('[argumentid="AmountInWords"]', t.el).val(getAmountInWords($('[argumentid="PaymentAmount"]', t.el).val()));

            });



       // }
    }


/*
  * *******************************Sales Contract Payment main Details Grid  Script***********************************************

 */
Sales.SalesContracts.grdPaymentDetails =
    function (t) {
        t.on('beforeSearchGetForm', function (P) {
            var frm = AsyncWidgets.get('frmSalesContracts');
            P.ParentRecId = frm.GetArgVal('RecId');
        });
        t.on('beforeRowDelete', function (P) {
                                /*debugger*/;

            var fRow = $('td.Item table .chkRowSelect:first', t.Repeater).closest('tr'), pVal;
            pVal = $('[colid="ParentRecId"] .ColValue', fRow).text();
            P.cf['ParentRecId'] = pVal;
            //    P.flags.queryDelete = false;
        });
        t.on('rowsRendered', function () {

            var frm = AsyncWidgets.get('frmSalesContracts');
            var strMainStateId = frm.GetArgVal('StateId');

         

            $('[colid="PaymentType"]:not(".w-grid-head-cell")').each(function () {
                var ptr = $(this).closest('tr');
                if ($(this).text().toLowerCase() == "return") {
                    $('[colid="PaymentAmount"] div', ptr).css({ 'font-weight': 'bold', 'color': 'red' });
                    $('[colid="PaymentAmount"] div', ptr).text('-' + $('[colid="PaymentAmount"] div', ptr).text());
                }
                $('[colid="PaymentAmount"] div', ptr).text(parseFloat($('[colid="PaymentAmount"] div', ptr).text()).fix(3));
            });

            $('[colid="StateId"]:not(".w-grid-head-cell")').each(function () {
                var ptr = $(this).closest('tr');
                if ($(this).text().toLowerCase() == "deleted") {
                    ptr.css('background', '#F1F1F1').attr('disabled', 'disabled');
                    $('[colid="PaymentAmount"] div', ptr).css({ 'font-weight': 'Normal', 'color': '#333333', 'text-decoration': 'line-through' });
                    $('.chkRowSelect', ptr).attr('disabled', 'disabled');
                    $('td:nth-child(3)', ptr).css('cursor', '').unbind();
                    $('td:nth-child(4)', ptr).css('cursor', '').unbind();

                    var cur = {
                        'background-image': 'url(' + ROOT_PATH + 'AsyncWidgets/Widgets/resources/images/RowEditForm_Disabled.png)',
                        'background-repeat': 'no-repeat',
                        'background-position': 'center center'
                    };
                    $('td:nth-child(3)', ptr).css(cur);

                    cur = {
                        'background-image': 'url(' + ROOT_PATH + 'App_Themes/eForms_Theme/Images/Print_Disabled.png)',
                        'background-repeat': 'no-repeat',
                        'background-position': 'center center'
                    };

                    $('td:nth-child(4)', ptr).css(cur);
                }
            });



            //If Main State ID = RRCContractClosed or RRCContractCancelled
            if (strMainStateId == 'RRCContractClosed' || strMainStateId == 'RRCContractCancelled') {
                $('[itemno] td:nth-child(1) input', t.Repeater).attr('disabled', 'disabled');
                $('[itemno] td:nth-child(3)', t.Repeater).css('cursor', '').unbind();
                $('[itemno] td:nth-child(4)', t.Repeater).css('cursor', '').unbind();
                $('[buttonid="new"],[buttonid="delete"],.w-grid-buttons-top-container', t.Repeater).hide();
            }
            //else if (AsyncWidgets.user.conf.Roles.indexOf('iRen_Contracts_Lawyer') > -1) {
            //    $('[itemno] td:nth-child(1) input', t.Repeater).attr('disabled', 'disabled');
            //    $('[itemno] td:nth-child(3)', t.Repeater).css('cursor', '').unbind();
            //    $('[itemno] td:nth-child(4)', t.Repeater).css('cursor', '').unbind();
            //    $('[buttonid="new"],[buttonid="delete"],.w-grid-buttons-top-container', t.Repeater).hide();
            //}
            else {
                $('[buttonid="new"],[buttonid="delete"],.w-grid-buttons-top-container', t.Repeater).show();
            }
            //End If Main State ID = RRCContractClosed or RRCContractCancelled
        });

        t.on('onNoRecords', function () {
            t.fireEvent('rowsRendered');
        });
        t.on('rowsRendered', function () {
            $('.PrintReport', t.el).click(function () { //
                var strlink = ROOT_PATH + "Pages/eForms/iRental/Reports/PrintReceiptVoucherFrPg.aspx?FormId=" + $(this).text() + "&ContractType=RNT"; // +'&amp;FormId=' + pm.SelectedKey;
                console.log(strlink);
                var width = 920;
                var height = 600;
                var left = parseInt((screen.availWidth / 2) - (width / 2)) - 15;
                var top = parseInt((screen.availHeight / 2) - (height / 2));
                window.open(strlink, '_blank', "'titlebar=no,resizable=1,scrollbars=yes,height=" + height + ",width=" + width + ",left=" + left + ",top=" + top + "screenX=" + left + ",screenY=" + top + "'");
                return false;
            });
        });
        t.on('onItemColGenerated', function (cf) {
            if (cf.colId == 'PrintId') {

                var cur = {
                    'background-image': 'url(' + ROOT_PATH + 'App_Themes/eForms_Theme/Images/print.png)',
                    'background-repeat': 'no-repeat',
                    'background-position': 'center center',
                    'cursor': 'hand'
                };
                var c = cf.itemCol, vl = $('.ColValue', c);
                vl.hide().parent().css(cur).addClass('PrintReport');

                //vl.html('&lt;a class="EmpReportByEmpId" href="#" click="void(0);"  style="" key="{PrintId}" style="text-decoration: none" > Print &lt;/a>');
                //vl.html('&lt;a class="EmpReportByEmpId" href="#" click="void(0);"  style="" key="{PrintId}" style="text-decoration: none" >Print &lt;/a>');

            }
        });

    }

/*
* ******************************* Sales Contract Payment Other Charges main Details Grid  Script ***********************************************
  */
Sales.SalesContracts.grdOtherCharges =
function(t) {

    t.on('beforeSearchGetForm', function (P) {
        var frm = AsyncWidgets.get('frmSalesContracts');
        P.ParentRecId = frm.GetArgVal('RecId');
    });
    t.on('beforeRowDelete', function (P) {
        var fRow = $('td.Item table .chkRowSelect:first', t.Repeater).closest('tr'), pVal;
        pVal = $('[colid="ParentRecId"] .ColValue', fRow).text();
        P.cf['ParentRecId'] = pVal;
    });
    t.on('rowsRendered', function () {

        var frm = AsyncWidgets.get('frmSalesContracts');
        var strMainStateId = frm.GetArgVal('StateId');

        $('[colid="Charges"]:not(".w-grid-head-cell")').each(function () {
            var ptr = $(this).closest('tr');
            $('[colid="Charges"] div', ptr).text(parseFloat($('[colid="Charges"] div', ptr).text()).fix(3));
        });

        $('[colid="StateId"]:not(".w-grid-head-cell")').each(function () {
            var ptr = $(this).closest('tr');
            if ($(this).text().toLowerCase() == "deleted") {
                ptr.css('background', '#F1F1F1').attr('disabled', 'disabled');
                $('[colid="Charges"] div', ptr).css({ 'text-decoration': 'line-through' });
                $('.chkRowSelect', ptr).attr('disabled', 'disabled');
                $('td:nth-child(3)', ptr).css('cursor', '').unbind();

                var cur = {
                    'background-image': 'url(' + ROOT_PATH + 'AsyncWidgets/Widgets/resources/images/RowEditForm_Disabled.png)',
                    'background-repeat': 'no-repeat',
                    'background-position': 'center center'
                };
                $('td:nth-child(3)', ptr).css(cur);
            }
        });

        //If Main State ID = RRCContractClosed or RRCContractCancelled
        if (strMainStateId == 'RRCContractClosed' || strMainStateId == 'RRCContractCancelled') {
            $('[itemno] td:nth-child(1) input', t.Repeater).attr('disabled', 'disabled');
            $('[itemno] td:nth-child(3)', t.Repeater).css('cursor', '').unbind();
            $('[buttonid="new"],[buttonid="delete"],.w-grid-buttons-top-container', t.Repeater).hide();
        }
        else {
            $('[buttonid="new"],[buttonid="delete"],.w-grid-buttons-top-container', t.Repeater).show();
        }
        //End If Main State ID = RRCContractClosed or RRCContractCancelled
    });

    t.on('onNoRecords', function () {
        t.fireEvent('rowsRendered');
    });
    }
