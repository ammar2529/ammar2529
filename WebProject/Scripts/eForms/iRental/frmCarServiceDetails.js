AsyncWidgets.WidgetScripts.frmCarServiceDetails = function (obj)
{
    var t = obj;

    AsyncWidgets.WidgetScripts.frmCarServiceDetails.t = t;


    t.on('rowsRendered', function ()
    {
        $('table[itemno]', t.el).click(function ()
        {
            debugger
        });
        
    });

 

    t.on('show', function (args)
    {
        var dt = new Date();
        $('[argumentid="CarRecivedDate"]', t.el).val(dt.getDate() + '/' + (dt.getMonth() + 1) + '/' + dt.getFullYear());
        $('[argumentid="CarToBeDeliverdDate"]', t.el).val(dt.getDate() + '/' + (dt.getMonth() + 1) + '/' + dt.getFullYear());
    });

    //On Change of Payment Mode  $('option:selected', elem)

    t.on('onLoadedValues', function (res)
    {
      

        if (res.res.status === 'OK')
        {
            if (res.res.Response.Rows.length > 0)
            {
                var rows = res.res.Response.Rows;

                for (var i = 0; i < rows.length; i++)
                {
                    var row = rows[ i ];

                    var RecId = row.RecId;
                    var CarRecivedDate = row.CarRecivedDate;
                    var LastServiceKM = row.LastServiceKM;
                }

                if (!!CarRecivedDate || !!LastServiceKM)
                {
                    $('[argumentid="LastCarRecivedDate"]', t.el).text(CarRecivedDate);
                    $('[argumentid="LastCurrentKM"]', t.el).text(LastServiceKM);
                } else
                {
                    $('[argumentid="LastCarRecivedDate"]', t.el).text('');
                    $('[argumentid="LastCurrentKM"]', t.el).text('');
                }
            }

        }

      
    });

};