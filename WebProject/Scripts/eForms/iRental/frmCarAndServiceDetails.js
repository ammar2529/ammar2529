/// <reference path="../../../jquery/common.js" />


AsyncWidgets.WidgetScripts.frmCarAndServiceDetails = function (obj) {
        var t = obj;
      
    AsyncWidgets.WidgetScripts.frmCarAndServiceDetails.t = t;
    $(".Sales, .Rental,.Lease, .Other").click(function ()
    {
        
        AsyncWidgets.WidgetScripts.frmCarAndServiceDetails.toggleDropdownCarSearchDetails();
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
    });


    //});
        t.on('aftereDataAction', function (params)
        {

        
        });
        t.on('LOVPopupClosed', (args) =>
        {
          /*    ;*/

            
        });
        t.on('LOVPopupShown', (popup) =>
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


   


    ///////////////////////////////////////////////////////


 

    
 

 


    

        t.on('show', function (args)
        {

            if (t.FormMode == 'new')
            {

                if ($('.Sales').is(":checked"))
                {
                    $('.carPopupCutomerAndCarDetailsForRental').hide();
                    $('.carPopupCutomerAndCarDetailsForLease').hide();
                    $('.carPopupCutomerAndCarDetailsForOther').hide();
                    $('.carPopupCutomerAndCarDetailsForSales').show();

                }
            }
            

           
    });
    // End On Form Show

    // On Start of Onloaded Values
        t.on('onLoadedValues', function (args)
        {
            
        
           

    });
    // End of On Loaded Values
}

AsyncWidgets.WidgetScripts.frmCarAndServiceDetails.toggleDropdownCarSearchDetails = function ()
{
    var t = AsyncWidgets.WidgetScripts.frmCarAndServiceDetails.t;

    //var detailsDiv = $('.carPopupCutomerAndCarDetails');

    //if ($('.Sales').is(":checked"))
    //{
    //    detailsDiv.html(`
    //                    <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="10" class="text LOVPopup required CommonDisableCarNumber"
    //                           groupid="CarAndCustomersDetails" lovpopupid="carPopupCutomerAndCarDetailsSales" argumentid="CarNumber" />
    //                `).show();
    //} else if ($('.Rental').is(":checked"))
    //{
    //    detailsDiv.html(`
    //                    <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="10" class="text LOVPopup required CommonDisableCarNumber"
    //                           groupid="CarAndCustomersDetails" lovpopupid="carPopupCutomerAndCarDetailsForRental" argumentid="CarNumber" />
    //                `).show();
    //} else if ($('.Lease').is(":checked"))
    //{
    //    detailsDiv.html(`
    //                    <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="10" class="text LOVPopup required CommonDisableCarNumber"
    //                           groupid="CarAndCustomersDetails" lovpopupid="carPopupCutomerAndCarDetailsForLease" argumentid="CarNumber" />
    //                `).show();
    //} else if ($('.Other').is(":checked"))
    //{
    //    detailsDiv.html(`
    //                    <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="10" class="text LOVPopup required CommonDisableCarNumber"
    //                           groupid="CarAndCustomersDetails" lovpopupid="carPopupCutomerAndCarDetailsForOther" argumentid="CarNumber" />
    //                `).show();
    //} else
    //{
    //    detailsDiv.hide();
    //}



    //function addInputField(selector, lovpopupid)
    //{
    //    $(selector).html(`
    //                <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="10" class="text LOVPopup required CommonDisableCarNumber"
    //                groupid="CarAndCustomersDetails" lovpopupid="${lovpopupid}" argumentid="CarNumber" />
    //            `);
    //}

    //if ($('.Sales').is(":checked"))
    //{
    //    $('.carPopupCutomerAndCarDetailsForRental').hide().empty();
    //    $('.carPopupCutomerAndCarDetailsForLease').hide().empty();
    //    $('.carPopupCutomerAndCarDetailsForOther').hide().empty();
       
    //    addInputField('.carPopupCutomerAndCarDetailsForSales', 'carPopupCutomerAndCarDetailsSales');
    //    $('.carPopupCutomerAndCarDetailsForSales').show();
    //    $('.CommonDisableCarNumber').val('');
    //    $('.CommonDisable').text('');
    //} else if ($('.Rental').is(":checked"))
    //{
    //    $('.carPopupCutomerAndCarDetailsForRental').show();
    //    $('.carPopupCutomerAndCarDetailsForLease').hide().empty();
    //    $('.carPopupCutomerAndCarDetailsForOther').hide().empty();
    //    $('.carPopupCutomerAndCarDetailsForSales').hide().empty();
    //    addInputField('.carPopupCutomerAndCarDetailsForRental', 'carPopupCutomerAndCarDetailsForRental');
    //    $('.CommonDisableCarNumber').val('');
    //    $('.CommonDisable').text('');
    //} else if ($('.Lease').is(":checked"))
    //{
    //    $('.carPopupCutomerAndCarDetailsForRental').hide().empty();
    //    $('.carPopupCutomerAndCarDetailsForOther').hide().empty();
    //    $('.carPopupCutomerAndCarDetailsForSales').hide().empty();
    //    $('.carPopupCutomerAndCarDetailsForLease').show();
    //    addInputField('.carPopupCutomerAndCarDetailsForLease', 'carPopupCutomerAndCarDetailsForLease');
    //    $('.CommonDisableCarNumber').val('');
    //    $('.CommonDisable').text('');
    //} else if ($('.Other').is(":checked"))
    //{
    //    $('.carPopupCutomerAndCarDetailsForRental').hide().empty();
    //    $('.carPopupCutomerAndCarDetailsForLease').hide().empty();
    //    $('.carPopupCutomerAndCarDetailsForOther').show();
    //    $('.carPopupCutomerAndCarDetailsForSales').hide().empty();
    //    addInputField('.carPopupCutomerAndCarDetailsForOther', 'carPopupCutomerAndCarDetailsForOther');
    //    $('.CommonDisableCarNumber').val('');
    //    $('.CommonDisable').text('');
    //}
    var fnHide = (toggle) =>
    {
        
    }


    if ($('.Sales').is(":checked"))
    {
        fnHide('carPopupCutomerAndCarDetailsForSales');

      //  $('.carPopupCutomerAndCarDetailsForSales').addClass('required').show();
      //  $('.CommonDisableCarNumber').val('');
      //  $('.CommonDisable').text('');
    }
    else if ($('.Rental').is(":checked"))
    {
        fnHide('carPopupCutomerAndCarDetailsForRental');
        //$('.carPopupCutomerAndCarDetailsForRental').show();
        //$('.carPopupCutomerAndCarDetailsForLease').hide();
        //$('.carPopupCutomerAndCarDetailsForOther').hide();
        //$('.carPopupCutomerAndCarDetailsForSales').hide();
        //$('.CommonDisableCarNumber').val('')
        //$('.CommonDisable').text('')

    }
    else if ($('.Lease ').is(":checked"))
    {
        fnHide('carPopupCutomerAndCarDetailsForLease');
        //$('.carPopupCutomerAndCarDetailsForRental').hide();
       
        //$('.carPopupCutomerAndCarDetailsForOther').hide();
        //$('.carPopupCutomerAndCarDetailsForSales').hide();
        //$('.carPopupCutomerAndCarDetailsForLease').show();
        //$('.CommonDisableCarNumber').val('')
        //$('.CommonDisable').text('')

    }

    else if ($('.Other').is(":checked"))
    {
        
        fnHide('carPopupCutomerAndCarDetailsForOther');
        //$('.carPopupCutomerAndCarDetailsForRental').hide();
        //$('.carPopupCutomerAndCarDetailsForLease').hide();
        //$('.carPopupCutomerAndCarDetailsForOther').show();
        //$('.carPopupCutomerAndCarDetailsForSales').hide();
        //$('.CommonDisableCarNumber').val('');
        //$('.CommonDisable').text('')


    }

};















