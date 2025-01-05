AsyncWidgets.WidgetScripts.grdSalesContractComments = function (obj)
{
    var t = obj;

    t.on('beforeSearchGetForm', function (P)
    {
        var frm = AsyncWidgets.get('frmSalesContracts');
        var RecId =  P.ParentRecId = frm.GetArgVal('RecId');


        var params = {
            Command: 'SEL_iRental_SalesContracts',
            RecId: `${RecId}`,


        };

        // Assuming ServerCall is a function to make an API call
        ServerCall(params, function (res)
        {

            var res = decJSON(res)


            if (res.status === 'OK')
            {

                if (res.Response.Rows.length > 0)
                {
                    var rows = res.Response.Rows;
                    for (var i = 0; i < rows.length; i++)
                    {
                        var row = rows[ i ];
                        var RecCode = row.RecCode;
                        var CarNumber = row.CarNumber;
                        var CustomerName = row.CustomerName;
                        var AmountDue = row.AmountDue;
                        var PaymentAmount = row.PaymentAmount;



                    }


                }

            }


            setTimeout(function ()
            {



                var a = $('div.SalesCommentsPanelDiv')
                $('[argumentid="RecCodePanel"]', a).text(RecCode);
                $('[argumentid="CarNumberPanel"]', a).text(CarNumber);
                $('[argumentid="CustomerNamePanel"]', a).text(CustomerName);
                $('[argumentid="AmountDuePanel"]', a).text(AmountDue.toFixed(3));
                $('[argumentid="PaymentAmountPanel"]', a).text(PaymentAmount.toFixed(3));



            }, 2000);

        }, 'GetData');
    });




    t.on('rowsRendered', function () 
    {


    
        var a = $('div.SalesCommentsPanelDiv')


        if ($('table.SalesCommentsPanel', a).length > 0)
        {
            $('table.SalesCommentsPanel', a).show();
        }

    });






    $('[tabid="SalesContractComments"]', t.el).on('click', function ()
    {

        setTimeout(function ()
        {

            var a = $('div.SalesCommentsPanelDiv')
            if ($('table.SalesCommentsPanel', a).length > 0)
            {
                $('table.SalesCommentsPanel', a).show();
            }

        }, 1000);
    });

};