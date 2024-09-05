/// <reference path="../../../jquery/common.js" />


AsyncWidgets.WidgetScripts.frmCarAndServiceDetails = function (obj)
{
    var t = obj;

    AsyncWidgets.WidgetScripts.frmCarAndServiceDetails.t = t;
    $(".Sales, .Rental,.Lease, .Other").click(function ()
    {
        //
        //AsyncWidgets.WidgetScripts.frmCarAndServiceDetails.toggleDropdownCarSearchDetails();
        var kv = {
            'Sales': 'carPopupCutomerAndCarDetailsForSales',
            'Rental': 'carPopupCutomerAndCarDetailsForRental',
            'Lease': 'carPopupCutomerAndCarDetailsForLease',
            'Other': 'carPopupCutomerAndCarDetailsForOther'
        };

        //carPopupCutomerAndCarDetailsSales
        var toShow = kv[ this.value ];
        $('input[lovpopupid="carPopupCutomerAndCarDetailsForRental"],input[lovpopupid="carPopupCutomerAndCarDetailsForLease"],input[lovpopupid="carPopupCutomerAndCarDetailsForOther"],input[lovpopupid="carPopupCutomerAndCarDetailsForSales"]', t.el)
            .each(function ()
            {
                var elm = $(this);
                if (elm.attr('lovpopupid') != toShow)
                {
                    elm.removeClass('required')
                        .hide();
                    elm.next('span[errmsg]').remove();
                }

            });


        /*$(`.${toShow}`)*/
        $(`input[lovpopupid="${toShow}"]`).addClass('required').show();

        $('.CommonDisableCarNumber').val('');
        $('.CommonDisable').text('');

        // Hide the dropdown for Sales, Rental, and Lease; show otherwise

        //var otherDropdowns = $('.CommonCarDropdown',t.el);
        //if (toShow === 'carPopupCutomerAndCarDetailsForSales' || toShow === 'carPopupCutomerAndCarDetailsForRental' || toShow === 'carPopupCutomerAndCarDetailsForLease')
        //{
        //    otherDropdowns.removeClass('required').hide();
        //    $('.ChassisNo', t.el).show();
        //    $('.carCutomerAndCarDetailsForOther', t.el).hide();
        //    $('.hideTr',t.el).show()
        //} else
        //{
        //    otherDropdowns.addClass('required').show();
        //    $('.carCutomerAndCarDetailsForOther', t.el).show();
        //    $('.ChassisNo', t.el).hide();
        //    $('.hideTr',t.el).hide();
        //}
    });


    //});
    t.on('afterDataAction', function (params)
    {
        // This will pause execution for debugging if the developer tools are open
        if (params.res.status === 'OK')
        {

            
            var myMessage = "Record Updated Successfully..";
            var trimMyMessage = myMessage.trim();
            var parts = params.res.Response.split('||');
            var code = parts[ 0 ];
            var messageStatus = parts[ 1 ];
            var message = parts[ 2 ];
            if (message !== undefined)
            {
                var trimMessage = message.trim();
                // Further processing with trimMessage
            }







            var params = {
                Command: 'SEL_GRG_CarAndCustomerDetails_Customer_Audit',
                RecId: `${code}`,


            };

            // Assuming ServerCall is a function to make an API call
            ServerCall(params, function (res)
            {
                
                var res = decJSON(res)


                if (res.status === 'OK')
                {
                    if (res.Response.Rows.length > 0)
                    {

                        AsyncWidgets.WidgetScripts.frmCarAndServiceDetails.showCustomerList(res, t)

                    }


                }





            }, 'GetData');


        }

    });
    t.on('LOVPopupClosed', (args) =>
    {
        /*    ;*/


    });
    ('LOVPopupShown', (popup) =>
    {
        // ;
        $(t.el).mask("");
        $('.loadmask-msg', t.el).hide();
        popup.css({ position: 'absolute', top: '25%', left: '0px', 'z-index': '1000', 'background': '#628296' }).show();
        t.fireEvent('LOVPopupShown', popup);
    });
    t.on('FormClosed', () =>
    {
        t.__firstShow = undefined;
    });














    t.on('show', function (args)
    {

        if (t.FormMode == 'new')
        {


            if ($('.Sales').is(":checked"))
            {
               

                var kv = {
                    'Sales': 'carPopupCutomerAndCarDetailsForSales',
                    'Rental': 'carPopupCutomerAndCarDetailsForRental',
                    'Lease': 'carPopupCutomerAndCarDetailsForLease',
                    'Other': 'carPopupCutomerAndCarDetailsForOther'
                };

                //carPopupCutomerAndCarDetailsSales
                var toShow = kv[ 'Sales' ];
                $('input[lovpopupid="carPopupCutomerAndCarDetailsForRental"],input[lovpopupid="carPopupCutomerAndCarDetailsForLease"],input[lovpopupid="carPopupCutomerAndCarDetailsForOther"],input[lovpopupid="carPopupCutomerAndCarDetailsForSales"]', t.el)
                    .each(function ()
                    {
                        var elm = $(this);
                        if (elm.attr('lovpopupid') != toShow)
                        {
                            elm.removeClass('required')
                                .hide();
                            elm.next('span[errmsg]').remove();
                        }

                    });


                /*$(`.${toShow}`)*/
                $(`input[lovpopupid="${toShow}"]`).addClass('required').show();


                $('.RadioButtons', t.el).removeClass('ElemDisabled');
                $('.RadioButtons', t.el).removeAttr('disabled', 'disabled')
                /* $('.Other', t.el).addClass('ElemDisabled').attr('disabled', 'disabled');*/

                $('[argumentid="CarNumber"]', t.el).removeClass('ElemDisabled');
                $('[argumentid="CarNumber"]', t.el).removeAttr('disabled', 'disabled')

                // Hide the dropdown for Sales
                //$('.CommonCarDropdown').removeClass('required').hide();
                //$('.carCutomerAndCarDetailsForOther', t.el).hide();
                //$('.hideTr', t.el).show();
                //$('.ChassisNo', t.el).show();
            }

            var tblUFL = $('table.CustomerModifyListt', t.el);
            //$('table.CustomerModifyList .ItemTR .ItemTableRow', t.el).remove();
            /* $('.ItemTR > td', tblUFL).empty();*/
        //    $('.NoRecordsTR', tblUFL).show();
            $('table.CustomerModifyListt tfoot tr').show();
            $('table.CustomerModifyListt tbody tr').remove();
            $('.StatusTR', t.el).hide();
            $('.btnSave2', t.el).hide();
            $('.btnSave', t.el).show();
        }



    });
    // End On Form Show

    // On Start of Onloaded Values
    t.on('onLoadedValues', function (args)
    {
        
        var carNumber = $('[argumentid="CarNumber"]', t.el).val();
        $('[argumentid="CarNumber"]', t.el).val(carNumber);
        $('.StatusTR', t.el).show();
        $('.btnSave2', t.el).show();
        $('.btnSave', t.el).hide();

        $('.RadioButtons', t.el).addClass('ElemDisabled');
        $('.RadioButtons', t.el).attr('disabled', 'disabled')
        $('[argumentid="CarNumber"]', t.el).addClass('ElemDisabled');
        $('[argumentid="CarNumber"]', t.el).attr('disabled', 'disabled');


        if (args.res.status == 'OK')
        {
            
            if (args.res.Response.Rows.length > 0)
            {

                var rows = args.res.Response.Rows;
                console.log(row);

                for (var i = 0; i < rows.length; i++)
                {

                    var row = rows[ i ];
                    var recId = row.RecId;

                    var params = {
                        Command: 'SEL_GRG_CarAndCustomerDetails_Customer_Audit',
                        RecId: `${recId}`,


                    };

               /*  Assuming ServerCall is a function to make an API call*/
                    ServerCall(params, function (res)
                    {

                        var res = decJSON(res)


                        if (res.status === 'OK')
                        {
                            
                               
                                AsyncWidgets.WidgetScripts.frmCarAndServiceDetails.showCustomerList(res, t)

                            


                        }





                    }, 'GetData');


                }//end for loop

                


            }


        }
    });
    // End of On Loaded Values


    AsyncWidgets.WidgetScripts.frmCarAndServiceDetails.showCustomerList = function (res, t)
    {



        if (res.status == 'OK')
        {
            if (res.Response.Rows.length > 0)
            {
                var rows = res.Response.Rows;
                //var tblUFL = $('table.CustomerModifyList', t.el);
                //$('.ItemTR', tblUFL).show();
                //$('.NoRecordsTR', tblUFL).hide();


                var tblUFL = $('table.CustomerModifyListt', t.el);
                $('table.CustomerModifyListt tfoot tr').hide();
                $('table.CustomerModifyListt tbody tr').show();

                

                var tblRowsHTML = "";


                for (var i = 0; i < rows.length; i++)
                {

                    var row = rows[ i ];
                    var recId = row.RecId;
                    var CustomerRecCode = row.CustomerRecCode;
                    var CustomerName = row.CustomerName;
                    var NationalIDNo = row.NationalIDNo;
                    var Nationality = row.Nationality;
                    var NationalityID = row.NationalityID;
                    var MobileTelephone1 = row.MobileTelephone1;
                    var CreatedBy = row.CreatedBy;
                    var DateCreated = row.DateCreated;



                    var genHtml = ` 
                    
                                      

                            <tr>
                              <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${CustomerRecCode}</td>
                              <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;"> ${CustomerName}</td>
                              <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${Nationality}</td>
                              <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${NationalIDNo}</td>
                              <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;"> ${MobileTelephone1}</td>
                             <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;"> ${DateCreated}</td>
                              <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${CreatedBy}</td>
                            </tr>

                                                `;

                    tblRowsHTML += genHtml;



                }  // for loop;



                $('tbody ', tblUFL).html(tblRowsHTML);
            } else
            {
                //var tblUFL = $('table.CustomerModifyListt', t.el);
                //$('tbody', tblUFL).hide();
                ///* $('.NoRecordsTR', tblUFL).show();*/
                //$('table.CustomerModifyListt tfoot tr').show();

                $('table.CustomerModifyListt tfoot tr').show();
                $('table.CustomerModifyListt tbody tr').hide();
            }
        } //  if (res.status == 'OK')

    }

};