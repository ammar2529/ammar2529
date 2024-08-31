/// <reference path="../../../jquery/common.js" />


AsyncWidgets.WidgetScripts.frmCarAndServiceDetails = function (obj) {
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
            

            var myMessage = "Record Insert Successfully!!";
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





            //// This line will only execute if the message is "Invoice create Successfully"
            $('[argumentid="CarAndCustomersDetailsRecId"]', t.el).val(code);
            //$('[argumentid="RecId"]', t.el).val(code);
            //var inv = $('[argumentid="InvoicePaymentRecId"]', t.el).val(code);
            //console.log("Setting InvoiceRecId to:", code); // Add this line for debugging
            //console.log("Setting InvoicePaymentRecId to:", inv);


            var params = {
                Command: 'SEL_GRG_CarAndCustomerDetails',
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
                        var rows = res.Response.Rows;
                        for (var i = 0; i < rows.length; i++)
                        {
                            var row = rows[ i ];
                            var recId = row.RecId;
                            var CustomerRecCode = row.CustomerRecCode;
                            var CustomerName = row.CustomerName;
                            var NationalIDNo = row.NationalIDNo;
                            var Nationality = row.Nationality;
                            var NationalityID = row.NationalityID;
                            var CreatedBy = row.CreatedBy;
                            var DateCreated = row.DateCreated;





                        }


                        var params = {
                            Command: 'SEL_GRG_CarAndCustomerDetails',
                            CustomerRecCode: `${CustomerRecCode}`,
                             CustomerName : `${CustomerName}`,
                             NationalIDNo : `${NationalIDNo}`,
                              NationalityID : `${NationalityID}`
                            


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
                                     


                                    }






                                }


                            }





                        });
                        


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
            t.on('FormClosed', () => {
                t.__firstShow = undefined;
        });

  


 

    
 

 


    

        t.on('show', function (args)
        {

            if (t.FormMode == 'new')
            {
                

                if ($('.Sales').is(":checked"))
                {
                    //$('.carPopupCutomerAndCarDetailsForRental').hide();
                    //$('.carPopupCutomerAndCarDetailsForLease').hide();
                    //$('.carPopupCutomerAndCarDetailsForOther').hide();
                    //$('.carPopupCutomerAndCarDetailsForSales').show();

                    var kv = {
                        'Sales': 'carPopupCutomerAndCarDetailsForSales',
                        'Rental': 'carPopupCutomerAndCarDetailsForRental',
                        'Lease': 'carPopupCutomerAndCarDetailsForLease',
                        'Other': 'carPopupCutomerAndCarDetailsForOther'
                    };

                    //carPopupCutomerAndCarDetailsSales
                    var toShow = kv['Sales'];
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

                var tblUFL = $('table.CustomerModifyList', t.el);
                $('table.CustomerModifyList .ItemTR .ItemTableRow', t.el).remove();
                /* $('.ItemTR > td', tblUFL).empty();*/
                $('.NoRecordsTR', tblUFL).show();
            }
            

           
    });
    // End On Form Show

    // On Start of Onloaded Values
        t.on('onLoadedValues', function (args)
        {
           
            var carNumber = $('[argumentid="CarNumber"]', t.el).val();
            $('[argumentid="CarNumber"]', t.el).val(carNumber);

            $('.RadioButtons',t.el).addClass('ElemDisabled');
            $('.RadioButtons', t.el).attr('disabled', 'disabled')
            $('[argumentid="CarNumber"]', t.el).addClass('ElemDisabled');
            $('[argumentid="CarNumber"]', t.el).attr('disabled', 'disabled');

            // Hide the dropdown for Sales, Rental, and Lease
            //if ($('.Sales').is(":checked") || $('.Rental').is(":checked") || $('.Lease').is(":checked"))
            //{


            //    $('.CommonCarDropdown').removeClass('required').hide();
            //    $('.carCutomerAndCarDetailsForOther', t.el).hide();
            //    $('.hideTr', t.el).show();
            //    $('.ChassisNo', t.el).show();
            //    $('[argumentid="OtherCarNumber"]', t.el).removeClass('required');
            //}
    });
    // End of On Loaded Values
}

AsyncWidgets.WidgetScripts.frmCarAndServiceDetails.showCustomerList = function (res, t)
{
    if (res.status == 'OK')
    {
        if (res.Response.Rows.length > 0)
        {
            var rows = res.Response.Rows;
            var tblUFL = $('table.uploadedItemList', t.el);
            $('.ItemTR', tblUFL).show();
            $('.NoRecordsTR', tblUFL).hide();
            var tblRowsHTML = "";


            for (var i = 0; i < rows.length; i++)
            {


                var row = rows[ i ];

                var RecId = row.RecId;
                var ItemId = row.ItemId;
                var RecCode = row.RecCode;
                var SparePartName = row.SparePartName;
                var SparePartQuantity = row.SparePartQuantity;
                var SelectQuantity = row.SelectQuantity;
                var SparePartUnitPrice = row.SparePartUnitPrice;
                var TotalPrice = row.TotalPrice;
                //var toFixedSparePartUnitPrice = SparePartUnitPrice.toFixed(3);
                //var toFixedTotalPrice = TotalPrice.toFixed(3);


                var genHtml = ` <tr class="ItemTableRow" style="white-space: nowrap" evenrowcss="w-grid-row-odd" oddrowcss="w-grid-row-odd" hoverrowcss="">


                                                    <td class="ColTemplate w-grid-cell-border colIndex-3" style="white-space: nowrap; overflow: hidden; cursor: pointer; padding: 0px; width: 60px;" colid="ItemId">
                                                        <div class="ColValue w-grid-label ItemIdName" style="white-space: nowrap; cursor: pointer; overflow: hidden; margin-left: 10px; ">${ItemId}</div>
                                                    </td>
                                                    
                                                     <td class="ColTemplate w-grid-cell-border colIndex-4" style="white-space: nowrap; overflow: hidden; cursor: pointer; padding: 0px; width: 110px;" colid="FileType">
                                                        <div class="ColValue w-grid-label" style="white-space: nowrap; cursor: pointer; overflow: hidden; margin-left: 10px; width: 100px;">${SparePartName}</div>
                                                    </td>
                                                    <td class="ColTemplate w-grid-cell-border colIndex-4" style="white-space: nowrap; overflow: hidden; cursor: pointer; padding: 0px; width: 110px;" colid="CreatedBy">
                                                        <div class="ColValue w-grid-label" style="white-space: nowrap; cursor: pointer; overflow: hidden; margin-left: 10px; width: 100px;">${SparePartQuantity}</div>
                                                    </td>
                                                    <td class="ColTemplate w-grid-cell-border colIndex-4" style="white-space: nowrap; overflow: hidden; cursor: pointer; padding: 0px; width: 110px;" colid="DateCreated">
                                                        <div class="ColValue w-grid-label" style="white-space: nowrap; cursor: pointer; overflow: hidden; margin-left: 10px; width: 100px;">${SelectQuantity}</div>
                                                    </td>
                                                    <td class="ColTemplate w-grid-cell-border colIndex-4" style="white-space: nowrap; overflow: hidden; cursor: pointer; padding: 0px; width: 110px;" colid="DateCreated">
                                                        <div class="ColValue w-grid-label" style="white-space: nowrap; cursor: pointer; overflow: hidden; margin-left: 10px; width: 100px;">${SparePartUnitPrice}</div>
                                                    </td>
                                                      <td class="ColTemplate w-grid-cell-border colIndex-4" style="white-space: nowrap; overflow: hidden; cursor: pointer; padding: 0px; width: 110px;" colid="DateCreated">
                                                        <div class="ColValue w-grid-label TotalPriceVal" style="white-space: nowrap; cursor: pointer; overflow: hidden; margin-left: 10px; width: 100px;">${TotalPrice}</div>
                                                    </td>
                                                     <td class="ColTemplate w-grid-cell-border colIndex-4" style="white-space: nowrap; overflow: hidden; cursor: pointer; padding: 0px; width: 45px;" colid="Delete">
                                                            <div class="ColValue w-grid-label" style="white-space: nowrap; cursor: pointer; overflow: hidden; margin-left: 10px; width: 35px;">
                                                             <span title="Delete Item" class="remove-button" recid="${RecId}" ></span>
                                                            </div>
                                                        </td>
                              

                                                </tr>`;

                //<td class="ColTemplate w-grid-cell-border colIndex-4" style="white-space: nowrap; overflow: hidden; cursor: pointer; padding: 0px; width: 62px;" colid="FileSize">
                //    <div class="ColValue w-grid-label" style="white-space: nowrap; cursor: pointer; overflow: hidden; margin-left: 10px; width: 60px;">${RecCode}</div>
                //</td>

                tblRowsHTML += genHtml;



            }  // for loop;



            var tblUFL = $('table.uploadedItemList', t.el); // get the main table

            $('.ItemTR tbody', tblUFL).html(tblRowsHTML); //inject html of the download file list table


            $('.remove-button', tblUFL).click(function ()
            {

                var btn = $(this);

                var ItemId = btn.closest('tr').find('.ColValue:eq(0)').text().trim();

                var SparePartQuantity = btn.closest('tr').find('.ColValue:eq(2)').text().trim();
                var SelectQuantity = btn.closest('tr').find('.ColValue:eq(3)').text().trim();
                var recId = btn.attr("recId");
                var curTR = btn.closest('tr');
                var DeleteUploadItem = AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.DeleteUploadItem;
                DeleteUploadItem(t, recId, curTR, btn, ItemId, SelectQuantity);

                // Remove the row from the table
                var curTR = btn.closest('tr');//.remove();

                if ($('tr', curTR.parent()).length == 1)
                {
                    // curTR.remove();
                    $('.ItemTR', tblUFL).hide();
                    $('.NoRecordsTR', tblUFL).show();
                    //return;
                }
                curTR.remove();

            }); // end of click of close button event


        } // if length>0
        else
        {
            var tblUFL = $('table.uploadedItemList', t.el);
            $('.ItemTR', tblUFL).hide();
            $('.NoRecordsTR', tblUFL).show();
        }
    } //  if (res.status == 'OK')

};














