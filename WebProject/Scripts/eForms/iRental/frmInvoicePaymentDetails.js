AsyncWidgets.WidgetScripts.frmInvoicePaymentDetails = function (obj)
{
    var t = obj;

    AsyncWidgets.WidgetScripts.frmInvoicePaymentDetails.t = t;



    t.on('beforeDataAction', function (param)
    {


        // Ext.apply(params, frmProcGS.GetArgs([{ Name: 'FormType' }, { Name: 'FormNameCode' }]));
        var frm = AsyncWidgets.get("frmSparePartInventoryInvoice");
        param.ParentRecId = frm.GetArgVal('RecId');
    });

    setTimeout(function ()
    {
        AsyncWidgets.get('frmInvoicePaymentDetails').show()
    }, 3000);

    //        var fn = function () {
    function cnvrt2Upper(str)
    {
        return str.toLowerCase().replace(/\b[a-z]/g, cnvrt);
        function cnvrt()
        {
            return arguments[ 0 ].toUpperCase();
        }
    }
    function getAmountInWords(v)
    {

        if (!v) return '';
        else
        {
            v = parseFloat(v);
        }
        var arr = v.fix(3).toString().split('.');
        var des = cnvrt2Upper(toWords(arr[ 0 ])) + 'KD';
        if (arr.length == 2)
        {
            var num = parseInt(arr[ 1 ]);
            if (num > 0)
            {
                des += ' and ' + cnvrt2Upper(toWords(arr[ 1 ])) + 'Fils';
            }
        }
        return des + ' Only';
    }

    t.on('show', function (args)
    {
        $('.ChequeNo', t.el).hide();
        $('.BankName', t.el).hide();
        $('.ChequeDate', t.el).hide();
        $('nobr:contains("Cheque No*:")', t.el).hide();
        $('nobr:contains("Cheque Date*:")', t.el).hide();
        $('.PaymentMetthodDetails td>.ui-datepicker-trigger').hide();
        $('div>.ui-datepicker-trigger').hide();
        $('tr.PaymentMetthodDetails').hide();
        $('tr.PaymentModedd>td.ftitle').removeAttr("rowspan")
        $('div.a>nobr ').hide();
        $('[argumentid="BankName"],[argumentid="ChequeNo"],[argumentid="ChequeDate"]', t.el).removeClass('required');
        $('.AlwaysDisable', t.el).attr('disabled', 'disabled');
        $('[argumentid="PaymentMode"]', t.el).removeAttr('disabled').removeClass('ElemDisabled');

        var frm = AsyncWidgets.get('frmSparePartInventoryInvoice');
        $('[argumentid="ParentRecId"]', t.el).text(frm.GetArgVal('RecId'));

        var dt = new Date();
        if (t.FormMode == "new")
        {
            $('[argumentid="PaymentDate"]', t.el).val(dt.getDate() + '/' + (dt.getMonth() + 1) + '/' + dt.getFullYear());
        }

        //$('[argumentid="PaymentMode"] option:nth(1)', t.el).attr('selected', 'selected');
        //$('[argumentid="PaymentMode"]', t.el).attr('rowvaluetoset', 'Cash');
    });

    //On Change of Payment Mode  $('option:selected', elem)
    $('[argumentid="PaymentMode"]', t.el).change(function ()
    {


        var cbo = $('[argumentid="PaymentMode"] option:selected', t.el).text();
        
        var extractedCbo = cbo.replace('Select Payment Mode', '').trim(); // Remove 'Select Payment Mode' and trim any extra spaces
        if ($.trim(extractedCbo) == 'Cheque')
        {
            $('.ChequeNo', t.el).show();
            $('.BankName', t.el).show();
            $('.ChequeDate', t.el).show();
            $('nobr:contains("Cheque No*:")', t.el).show();
            $('nobr:contains("Cheque Date*:")', t.el).show();
            $('.PaymentMetthodDetails td>.ui-datepicker-trigger').show();
            $('div>.ui-datepicker-trigger').show();
            $('div.a>nobr ').show();
            $('[argumentid="BankName"],[argumentid="ChequeNo"],[argumentid="ChequeDate"]', t.el).addClass('required');
            $('tr.PaymentMetthodDetails').show();
            $('tr.PaymentModedd>td.ftitle').attr("rowspan", "2")
        }
        else
        {
            $('.ChequeNo', t.el).hide();
            $('.BankName', t.el).hide();
            $('.ChequeDate', t.el).hide();
            $('nobr:contains("Cheque No*:")', t.el).hide();
            $('nobr:contains("Cheque Date*:")', t.el).hide();
            $('.PaymentMetthodDetails td>.ui-datepicker-trigger').hide();
            $('div>.ui-datepicker-trigger').hide();
            $('div.a>nobr ').hide()
            $('[argumentid="ChequeNo"]', t.el).val('');
            $('[argumentid="BankName"]', t.el).val('');
            $('.PaymentMetthodDetails td>.ChequeDate', t.el).val('');
            $('[argumentid="BankName"],[argumentid="ChequeNo"],[argumentid="ChequeDate"]', t.el).removeClass('required');
            $('tr.PaymentMetthodDetails').hide();
            $('tr.PaymentModedd>td.ftitle').removeAttr("rowspan")
        }
    });
    //End On Change of Payment Mode

    //On Change of Amount Update Amount in Words
    $('[argumentid="PaymentAmount"]', t.el).change(function ()
    {

        $('[argumentid="AmountInWords"]', t.el).val(getAmountInWords($('[argumentid="PaymentAmount"]', t.el).val()));

    });

};