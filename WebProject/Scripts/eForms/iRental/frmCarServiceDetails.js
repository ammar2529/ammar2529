AsyncWidgets.WidgetScripts.frmCarServiceDetails = function (obj)
{
    var t = obj;

    AsyncWidgets.WidgetScripts.frmCarServiceDetails.t = t;
   /* , [ argumentid = "CurrentServiceKm" ]'*/
    
    //$('[argumentid="CarRecivedDate"]', t.el).on('blur', function ()
    //{
    //    var CarRecivedDate = $(this).val();

    //    var ParseCarRecivedDate = CarRecivedDate.convertDate();
    //    var formattedDate = ParseCarRecivedDate.toLocaleDateString('en-GB');
    //    $('[argumentid="LastCarServiceDate"]', t.el).text(formattedDate);
       
    //});

    //$('[argumentid="CurrentServiceKm"]', t.el).on('blur', function ()
    //{
    //    debugger
    //    var CurrentServiceKm = $(this).val();

      
    //    $('[argumentid="LastServiceKm"]', t.el).text(CurrentServiceKm);

    //});


    $('.CarServiceButton_Edit', t.el).click(function ()
    {
        $('[argumentid="StateId"]', t.el).text('RRCCreatedState');
         $('[argumentid="StateName"]', t.el).text('Start State');

        $('[argumentid="StateId"]', t.el).text('RRCCreatedState');
        $('[argumentid="StateName"]', t.el).text('Start State');

        $('.common-button,.CommonDisableClass', t.el).removeAttr('disabled', 'disabled');

        $('.common-button,.CommonDisableClass', t.el).removeClass('ElemDisabled');
        $('[argumentid="CarRecivedDate"]', t.el).next('img').show();
        $('[argumentid="CarToBeDeliverdDate"]', t.el).next('img').show();
        $('[argumentid="CarDeliverdDate"]', t.el).next('img').show();

    });

 

    t.on('show', function (args)
    {
        var dt = new Date();
        $('[argumentid="CarRecivedDate"]', t.el).val(dt.getDate() + '/' + (dt.getMonth() + 1) + '/' + dt.getFullYear());
        $('[argumentid="CarToBeDeliverdDate"]', t.el).val(dt.getDate() + '/' + (dt.getMonth() + 1) + '/' + dt.getFullYear());
       /* $('[argumentid="LastCarServiceDate"]', t.el).text(dt.getDate() + '/' + (dt.getMonth() + 1) + '/' + dt.getFullYear());*/
        if (t.FormMode == 'new')
        {

            $('.grgbtnSave2', t.el).hide();
            $('.grgbtnSave', t.el).show();

            if ($('[argumentid="StateId"]', t.el).text() == '')
            {

                $('[argumentid="StateId"]', t.el).text('RRCCreatedState');
                $('[argumentid="StateName"]', t.el).text('Start State');

                $('.common-button,.CommonDisableClass', t.el).removeAttr('disabled', 'disabled');

                $('.common-button,.CommonDisableClass', t.el).removeClass('ElemDisabled');
                $('[argumentid="CarRecivedDate"]', t.el).next('img').show();
                $('[argumentid="CarToBeDeliverdDate"]', t.el).next('img').show();
                $('[argumentid="CarDeliverdDate"]', t.el).next('img').show();

            }
        }
     
    });

    //On Change of Payment Mode  $('option:selected', elem)

    t.on('onLoadedValues', function (res)
    {
      

        if (res.res.status === 'OK')
        {
            if (res.res.Response.Rows.length > 0)
            {
                var rows = res.res.Response.Rows;
               
                //for (var row of rows)
                //{
                //    var keys = Object.keys(row);
                //    console.log(keys);
                //    $()
                //}

                //for (var i = 0; i < rows.length; i++)
                //{
                //    var row = rows[ i ];

                //    var RecId = row.RecId;
                //    var CarRecivedDate = row.CarRecivedDate;
                //    var LastServiceKM = row.LastServiceKM;
                //}

                //if (!!CarRecivedDate || !!LastServiceKm)
                //{
                //    $('[argumentid="LastCarServiceDate"]', t.el).text(CarRecivedDate);
                //    $('[argumentid="LastServiceKm"]', t.el).text(LastServiceKM);
                //} else
                //{
                //    $('[argumentid="LastCarServiceDate"]', t.el).text('');
                //    $('[argumentid="LastServiceKm"]', t.el).text('');
                //}
            }

        }


        if (t.FormMode == 'update')
        {

            $('.grgbtnSave2', t.el).show();
            $('.grgbtnSave', t.el).hide();

            if ($('[argumentid="StateId"]', t.el).text() == 'ClosedState')
            {


                $('.common-button,.CommonDisableClass', t.el).attr('disabled', 'disabled');

                $('.common-button,.CommonDisableClass', t.el).attr('disabled', 'disabled');
                $('.common-button,.CommonDisableClass', t.el).addClass('ElemDisabled');
                $('[argumentid="CarRecivedDate"]', t.el).next('img').hide();
                $('[argumentid="CarToBeDeliverdDate"]', t.el).next('img').hide();
                $('[argumentid="CarDeliverdDate"]', t.el).next('img').hide();

            }

            if ($('[argumentid="StateId"]', t.el).text() == 'CreatedState')
            {
                $('.common-button,.CommonDisableClass ', t.el).removeAttr('disabled', 'disabled');

                $('.common-button,.CommonDisableClass', t.el).removeAttr('disabled', 'disabled');
                $('.common-button,.CommonDisableClass', t.el).removeClass('ElemDisabled');
                $('[argumentid="CarRecivedDate"]', t.el).next('img').show();
                $('[argumentid="CarToBeDeliverdDate"]', t.el).next('img').show();
                $('[argumentid="CarDeliverdDate"]', t.el).next('img').show();

            }
        }

      
    });

};