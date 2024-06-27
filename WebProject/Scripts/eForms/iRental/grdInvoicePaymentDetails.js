AsyncWidgets.WidgetScripts.grdInvoicePaymentDetails = function (obj)
{
    var t = obj;
    t.on('beforeSearchGetForm', function (P)
    {

        var frm = AsyncWidgets.get('frmSparePartInventoryInvoice');
        P.ParentRecId = frm.GetArgVal('RecId');
    });
    t.on('beforeRowDelete', function (P)
    {
                                /*debugger*/;

        var fRow = $('td.Item table .chkRowSelect:first', t.Repeater).closest('tr'), pVal;
        pVal = $('[colid="ParentRecId"] .ColValue', fRow).text();
        P.cf[ 'ParentRecId' ] = pVal;
        //    P.flags.queryDelete = false;
    });
    t.on('rowsRendered', function ()
    {

        var frm = AsyncWidgets.get('frmSparePartInventoryInvoice');
        var strMainStateId = frm.GetArgVal('StateId');



        $('[colid="PaymentType"]:not(".w-grid-head-cell")').each(function ()
        {
            ;
            var ptr = $(this).closest('tr');
            if ($(this).text().toLowerCase() == "return")
            {
                $('[colid="PaymentAmount"] div', ptr).css({ 'font-weight': 'bold', 'color': 'red' });
                $('[colid="PaymentAmount"] div', ptr).text('-' + $('[colid="PaymentAmount"] div', ptr).text());
            }
            $('[colid="PaymentAmount"] div', ptr).text(parseFloat($('[colid="PaymentAmount"] div', ptr).text()).fix(3));
        });

        $('[colid="StateId"]:not(".w-grid-head-cell")').each(function ()
        {
            var ptr = $(this).closest('tr');
            if ($(this).text().toLowerCase() == "deleted")
            {
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
        if (strMainStateId == 'RRCContractClosed' || strMainStateId == 'RRCContractCancelled')
        {
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
        else
        {
            $('[buttonid="new"],[buttonid="delete"],.w-grid-buttons-top-container', t.Repeater).show();
        }
        //End If Main State ID = RRCContractClosed or RRCContractCancelled
    });

    t.on('onNoRecords', function ()
    {
        t.fireEvent('rowsRendered');
    });
    t.on('rowsRendered', function ()
    {
        $('.PrintReport', t.el).click(function ()
        { //
            var strlink = ROOT_PATH + "Pages/eForms/iRental/Reports/PrintInvoicePaymentReceiptVoucher.aspx?FormId=" + $(this).text() + "&ContractType=INVOICE_PAYMENT"; // +'&amp;FormId=' + pm.SelectedKey;
            console.log(strlink);
            var width = 920;
            var height = 600;
            var left = parseInt((screen.availWidth / 2) - (width / 2)) - 15;
            var top = parseInt((screen.availHeight / 2) - (height / 2));
            window.open(strlink, '_blank', "'titlebar=no,resizable=1,scrollbars=yes,height=" + height + ",width=" + width + ",left=" + left + ",top=" + top + "screenX=" + left + ",screenY=" + top + "'");
            return false;
        });
    });
    t.on('onItemColGenerated', function (cf)
    {
        if (cf.colId == 'PrintId')
        {

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

};