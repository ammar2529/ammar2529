/// <reference path="../../../jquery/common.js" />


AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice = function (obj) 
{
    var t = obj;

    AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.t = t;

    t.on('LOVPopupClosed', function (args) {
        debugger;
        if (args.popupId == "ItemCodePopup") {
            calcData(args.row);
            
            //var SparePartUnitPrice = parseFloat(val("SparePartUnitPrice", t.el)) || 0;
           // var SparePartQuantity = parseFloat(val("SparePartQuantity", t.el)) || 0;

        }
    });

    function calcData(row) {
        var f = t;
        var SparePartUnitPrice = parseFloat($('[colid="SparePartUnitPrice"] .ColValue', row).text()) || 0;
        var SparePartQuantity = parseFloat($('[colid="SparePartQuantity"] .ColValue', row).text()) || 0;
        var SelectQuantity = 1;
        if (SparePartQuantity === 0) {
            var c = $('[argumentid="SelectQuantity"]', f.el).val(0)
            var b = $('[argumentid="SparePartUnitPrice"]', f.el).val(SparePartUnitPrice.toFixed(3));
            var a = $('[argumentid="TotalPrice"]', f.el).val(SparePartUnitPrice.toFixed(3));
            $('[argumentid="SelectQuantity"]', f.el).focus().select();

        } else {
            var Result = SelectQuantity * SparePartUnitPrice;
            var a = $('[argumentid="TotalPrice"]', f.el).val(Result.toFixed(3));
            var b = $('[argumentid="SparePartUnitPrice"]', f.el).val(SparePartUnitPrice.toFixed(3));
            var c = $('[argumentid="SelectQuantity"]', f.el).val(SelectQuantity)
            $('[argumentid="SelectQuantity"]', f.el).focus().select();

        }
    }


    $(".myTableInvoice",t.el).on("keydown", function (event) {
        if (event.key === "Enter") {
            event.preventDefault();

            $(".trNoDynamic .SaveBtn", this).click(); // Trigger the Save button click
         
        }
    });

    t.on('LOVPopupShown', (popup) => {
         ;
        $(t.el).mask("");
        $('.loadmask-msg', t.el).hide();
        popup.css({ position: 'absolute', top: '25%', left: '0px', 'z-index': '1000', 'background': '#628296' }).show();
        t.fireEvent('LOVPopupShown', popup);
    });

    // Handle input on the Card field
    $('[argumentid="Card"]', t.el).on('input', function () {
        var Card = parseFloat($(this).val()) || 0;
        var GrandTotal = parseFloat($('[argumentid="GrandTotal"]', t.el).val()) || 0;
        var Totall = parseFloat($('[argumentid="Total"]', t.el).val()) || 0;
        
        // Calculate remaining Cash
        var total = GrandTotal - Card;

        if (Card === 0 || Card === '') {

            $('[argumentid="Cash"]', t.el).val(''); // Clear Cash if Card is 0
            $('[argumentid="Cash"]', t.el).val(GrandTotal.toFixed(3));

        } else if (Card > GrandTotal) {
            var zero = 0;
            $.showMessage('Card amount cannot exceed the Grand Total.');
             $(this).val(GrandTotal.toFixed(3)); // Reset Card to GrandTotal if it exceeds
            $('[argumentid="Cash"]', t.el).val(zero.toFixed(3)); // Set Cash to 0 if Card equals GrandTotal
            //;
            //showErr($('[argumentid="Card"]', t.el), { 'en': 'Card amount cannot exceed the Grand Total.' }, 'red');
        }

      else {
            $('[argumentid="Cash"]', t.el).val(total.toFixed(3)); // Update Cash with calculated total
            
        }
    });

    // Handle input on the Cash field
    $('[argumentid="Cash"]', t.el).on('input', function () {
        var Cash = parseFloat($(this).val()) || 0;
        var GrandTotal = parseFloat($('[argumentid="GrandTotal"]', t.el).val()) || 0;
        var Totall = parseFloat($('[argumentid="Total"]', t.el).val()) || 0;


        // Calculate remaining Card
        var total = GrandTotal - Cash;

        if (Cash === 0 || Cash === '') {
            $('[argumentid="Card"]', t.el).val(''); // Clear Card if Cash is 0
            $('[argumentid="Card"]', t.el).val(GrandTotal.toFixed(3));
        } else if (Cash > GrandTotal) {
            var zero = 0;
            $.toShow('Cash amount cannot exceed the Grand Total.');
            $(this).val(GrandTotal.toFixed(3)); // Reset Cash to GrandTotal if it exceeds
            $('[argumentid="Card"]', t.el).val(zero.toFixed(3)); // Set Card to 0 if Cash equals GrandTotal
        }
       else
         {
            $('[argumentid="Card"]', t.el).val(total.toFixed(3)); // Update Card with calculated total
            
        }
        
    });


    $('[argumentid="Cash"]', t.el).on('blur', function () {
        var Cash = parseFloat($(this).val()) || 0;
        var Card = parseFloat($('[argumentid="Card"]', t.el).val()) || 0;
        var GrandTotal = parseFloat($('[argumentid="GrandTotal"]', t.el).val()) || 0;
       


        // Check if the sum of Cash and Card exceeds GrandTotal
        if (Cash + Card > GrandTotal) {
            alert('Total amount (Cash + Card) cannot exceed the Grand Total.');
            Cash = GrandTotal - Card; // Set Cash to the max allowable value within GrandTotal
            $(this).val(Cash.toFixed(3)); // Update the Cash input with adjusted value
        }
       

        var result = Cash + Card;
        $('[argumentid="Total"]', t.el).val(result.toFixed(3));
        $(this).val(Cash.toFixed(3));

        setTimeout(function () {
            var Totall = parseFloat($('[argumentid="Total"]', t.el).val()) || 0;

            
            if (GrandTotal === Totall) {
                $('[argumentid="GrandTotal"]').css('color', 'green');
                $('[argumentid="Total"]').css('color', 'green');
            } else {
                $('[argumentid="GrandTotal"]').css('color', 'red');
                $('[argumentid="Total"]').css('color', 'red');
            }
        }, 1000)
    });


    $('[argumentid="Card"]', t.el).on('blur', function () {
        var Card = parseFloat($(this).val()) || 0;
        var GrandTotal = parseFloat($('[argumentid="GrandTotal"]', t.el).val()) || 0;
        var Cash = parseFloat($('[argumentid="Cash"]', t.el).val()) || 0;
        


        if (Card > GrandTotal) {
            alert('Card amount cannot exceed the Grand Total.');
            $(this).val(GrandTotal.toFixed(3)); // Set Card value to GrandTotal if it exceeds
            Card = GrandTotal;
        }



        var result = Cash + Card;
        $('[argumentid="Total"]', t.el).val(result.toFixed(3));
        $(this).val(Card.toFixed(3));
        setTimeout(function () {
            var Totall = parseFloat($('[argumentid="Total"]', t.el).val()) || 0;
            if (GrandTotal === Totall) {
                $('[argumentid="GrandTotal"]').css('color', 'green');
                $('[argumentid="Total"]').css('color', 'green');
            } else {
                $('[argumentid="GrandTotal"]').css('color', 'red');
                $('[argumentid="Total"]').css('color', 'red');
            }
        }, 1000)
    });

    $('.MyDataAction', t.el).click(function () {
     

        var btn = $(this);
        var InvRecId = parseInt($('.ItemTableRow td.InvRecId', '.uploadedItemList').first().text()) || 0;
        var Balance = parseFloat($('[argumentid="Balance"]').text()) || 0;
        var isQuotationInvoiceChecked = val('C', t.el) === 'QuotationInvoice';
        var GrandTotal = parseFloat($('[argumentid="GrandTotal"]').val()) || 0;
        var Total = parseFloat($('[argumentid="Total"]').val()) || 0;

        
        if (btn.hasClass('ClosedInvoice'))
        {
            debugger
            const isWarrantyChecked = $('.WarrentyInvoice', t.el).is(':checked'); // Warranty checkbox
            const isCashChecked = $('.CashInvoice', t.el).is(':checked'); // Cash checkbox

            // Agar warranty checked hai, submit hona chahiye
            if (isWarrantyChecked) {
                console.log("Warranty checked. Submitting the invoice...");
                t.submit(btn);
                return false;
            }

            // Agar cash checked hai, submit nahi hona chahiye
            //if (isCashChecked) {
            //    $.showMessage("Cash option selected. Cannot submit the invoice.");
            //    return false;
            //}

            // If QuotationInvoice is checked, skip balance check
            if ($('[argumentid="QuotationInvoice"]', t.el).is(':checked') && GrandTotal === 0 && Total === 0)
            {
                $.showMessage("Amount due must be zero to close the invoice.");
                return false;
            }

          
             if (GrandTotal != Total || (GrandTotal === 0 && Total===0)) {

                

                $.showMessage(" Grand Total & Total  must be zero not to close the invoice.");
                return false;
            }

            if (InvRecId != 0 ) {
                console.log('Close button working');
                t.submit(btn);
                return false;
            } else {
                $.showMessage("Items must be added before closing the invoice.");
                return false;
            }


        }

        // Condition for CanceledInvoice
        else if (btn.hasClass('CanceledInvoice')) {
            if (InvRecId == 0 || (isQuotationInvoiceChecked && InvRecId == 0)) {
                console.log('Cancel button working');
                t.submit(btn);
                return false;
            } else {
                $.showMessage("Items must be deleted before canceling the invoice.");
                return false;
            }
        }

        return false;
    });




  
    $(".ServiceInvoice, .PartsInvoice,.QuotationInvoice,.CashInvoice,.WarrentyInvoice",t.el).click(function () {
       
    
        
        AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.toggleDropdown();

    });


    $('[argumentid="ItemId"]', t.el).on('focus', function ()
    {



        $('.trNoDynamic').find('[argumentid]').each(function ()
        {
            var $element = $(this);
            var argumentid = $element.attr('argumentid');
            var value = $element.val('');

        });

        $('.trNoDynamic').find('[argumentid]').each(function ()
        {
            var $element = $(this);
            var argumentid = $element.attr('argumentid');
            var value = $element.val().trim();

            if (value === '')
            {
                isValid = true;
              /*  console.log('Argument ID:', argumentid, 'is empty');*/
                $element.css('border', '');
                $('[argumentid="ItemId"]', t.el).css('border', '1px solid #ff5555');
            }
        });



    })

    $('.PrintBill  ', t.el).click(function ()
    { //
        var strlink = ROOT_PATH + "Pages/eForms/iRental/Reports/PrintInvoice.aspx?FormCode=" + $('[argumentid="InvRecCode"]', t.el).text(); // +'&amp;FormId=' + pm.SelectedKey;
        console.log(strlink);
        var width = 920;
        var height = 600;
        var left = parseInt((screen.availWidth / 2) - (width / 2)) - 15;
        var top = parseInt((screen.availHeight / 2) - (height / 2));
        window.open(strlink, '_blank', "'titlebar=no,resizable=1,scrollbars=yes,height=" + height + ",width=" + width + ",left=" + left + ",top=" + top + "screenX=" + left + ",screenY=" + top + "'");
        console.log('Click on Print Button');

        return false;
    });

    $('.InvoiceButton_Edit', t.el).click(function () {


        $('.common-button,.CommonDisableClasss ', t.el).removeAttr('disabled', 'disabled');

        $('.common-button,.CommonDisableClasss ', t.el).removeClass('ElemDisabled');

        setTimeout(function ()
        {
            $('.remove-button', t.el).show();
            $('.LineOfItemRow', t.el).show();
            $('[argumentid = "ItemId"], [argumentid = "SelectQuantity"], [argumentid = "SparePartUnitPrice"]', t.el).removeAttr('disabled');
            $('[argumentid = "ItemId"], [argumentid = "SelectQuantity"], [argumentid = "SparePartUnitPrice"]', t.el).removeClass('ElemDisabled')
          
        }, 500)
      


    });

   


    $('#dynamicRows').on('input', '[argumentid="SparePartUnitPrice"]', function () {
        
        var SparePartUnitPrice = parseFloat($(this).val()) || 0;
        
        // Check if SparePartUnitPrice is an integer
        //if (Number.isInteger(SparePartUnitPrice)) {
        //    SparePartUnitPrice = SparePartUnitPrice.toFixed(3); // Format integer to 3 decimal places
        //    $(this).val(SparePartUnitPrice);
        //}
        //else {
        //    SparePartUnitPrice = SparePartUnitPrice.toFixed(3); 
        //    $(this).val(SparePartUnitPrice);
        //}
        // Set SparePartUnitPrice back to the input field
       

        var SelectQuantity = parseFloat($('[argumentid="SelectQuantity"]', t.el).val()) || 0;
        var Result = SparePartUnitPrice * SelectQuantity;

        // Check if Result is an integer and format TotalPrice accordingly
        if (Number.isInteger(Result)) {
            $('[argumentid="TotalPrice"]', t.el).val(Result.toFixed(3)); // Format integer to 3 decimal places
        } else {
            $('[argumentid="TotalPrice"]', t.el).val(Result.toFixed(3)); // Keep existing decimals as they are
        }
    });

    $('#dynamicRows').on('blur', '[argumentid="SparePartUnitPrice"]', function () {

        var SparePartUnitPrice = parseFloat($(this).val()) || 0;
        $('[argumentid="SparePartUnitPrice"]', t.el).val(SparePartUnitPrice.toFixed(3));
    });

    // To Select Tabs
    $('.SimpleTab li', t.el).click(function ()
    {
        var li = $(this), tbl;
        if (!!$(this).parent().attr('disabled'))
            return;
        if (li.parent().children('li.active').attr('tabid') == li.attr('tabid'))
            return false;
        li.parent().children('li.active').removeClass('active'); //make all tabs inactive
        li.addClass('active'); // make current tabe active
        tbl = li.closest('table').children(); // get table container which contains the tabs and table pages
        tbl.children('tr:not(:first)').hide();
        tbl.children('tr[tabid="' + li.attr('tabid') + '"]').show();
        $('.tabid', t.el).val(li.attr('tabid'));

        if (li.attr('tabid') == 'InvoiceDetails')
        {
            var wg = AsyncWidgets.get('frmSparePartInventoryInvoice');

            var cf = {
                ActionId: "GetData", GroupId: null, readFormValues: false,
                Params: { RecId: val('RecId', wg.el), Command: 'SEL_Invoice' }

            }
            wg.loadValues(cf);
            //, function () {
            //    wg.show();
            //}
            if ($('[widgetid="grdInvoicePaymentDetails"]', t.el).length > 0) {
                $('[widgetid="grdInvoicePaymentDetails"]', t.el).hide();
                $('[widgetid="frmInvoicePaymentDetails"]', t.el).hide();
            }

        }

        else if (li.attr('tabid') == 'InvoicePaymentDetails')
        {
            
           var a =  AsyncWidgets.get('grdInvoicePaymentDetails').show().Requery();

            if ($('[widgetid="grdInvoicePaymentDetails"]', t.el).length > 0) {
                $('[widgetid="grdInvoicePaymentDetails"]', t.el).show();
               /* $('[widgetid="frmInvoicePaymentDetails"]', t.el).show();*/
                
            }
        }

        return false;
    });
    // End

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
    t.on('show', function (args)
    {
        
        if (t.FormMode == "new") 
        {
            
            $('.reset[resetonpopupshow]',t.el).click();
            $('.search', AsyncWidgets.get('frmInvoiceItemCode').el).click();
            $('[argumentid="InvoiceDate" ]', t.el).next('img').show();
            $('.LineOfItemRow', t.el).show();
            var tblUFL = $('table.uploadedItemList', t.el);
            $('table.uploadedItemList .ItemTableRow',t.el).remove();
            /* $('.ItemTR > td', tblUFL).empty();*/
            $('.NoRecordsTR', tblUFL).show();
            $('.trNoDynamic input',t.el).prop('disabled', true).addClass('ElemDisabled');

            AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.parseFloatSafe(t)


            var li = $('li[tabid="InvoiceDetails"]', t.el), tbl;
            li.parent().children('li.active').removeClass('active');
            li.addClass('active');
            tbl = li.closest('table').children();
            tbl.children('tr:not(:first)').hide();
            tbl.children('tr[tabid="' + li.attr('tabid') + '"]').show();
            $('.tabid', t.el).val(li.attr('tabid'));
            $('.SimpleTab', t.el).attr('disabled', 'disabled');
            //End Always Move to First Tab on Show

            // Hide Edit For Normal Users
            $('[roles]', t.el).hide().each(function ()
            {
                if (AsyncWidgets.user.conf.Roles.indexOf($(this).attr('roles')) > -1)
                {
                    $(this).show();
                }
            });

            var dt = new Date();

            $('[argumentid="InvoiceDate"]', t.el).val(dt.getDate() + '/' + (dt.getMonth() + 1) + '/' + dt.getFullYear());


            

            
            AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.toggleDropdown();
            $('.ServiceInvoice', t.el).removeAttr('disabled', 'disabled');
            $('.PartsInvoice', t.el).removeAttr('disabled', 'disabled');
            $('.QuotationInvoice', t.el).removeAttr('disabled', 'disabled');
            $('.StatusRow', t.el).hide();
            $('.btnSaveInvoice', t.el).removeAttr('disabled').removeClass('ElemDisabled');
            $('.btnSaveInvoice', t.el).show();

            $('.btnSave,.OnCreateInvoice', t.el).attr('disabled');
            $('.btnSave,.OnCreateInvoice', t.el).addClass('ElemDisabled');
            $('.btnSave,.OnCreateInvoice', t.el).hide();

            if ($('[argumentid="StateId"]', t.el).text() == '') {

                $('[argumentid="StateId"]', t.el).text('OpenState');
                $('[argumentid="StateName"]', t.el).text('Start State');

                $('.common-button,.CommonDisableClasss,', t.el).removeAttr('disabled', 'disabled');

                $('.common-button,.CommonDisableClasss', t.el).removeClass('ElemDisabled');
                $('[argumentid="InvoiceDate"]', t.el).next('img').show();

                $('.OnNewForm', t.el).hide();
               

            }

            $('.trNoDynamic').find('[argumentid]').each(function () {
                var $element = $(this);
                var argumentid = $element.attr('argumentid');
                var value = $element.val().trim();

                if (value === '') {
                    isValid = true;
                   /* console.log('Argument ID:', argumentid, 'is empty');*/
                    $element.css('border', '');
                } 
            });

            $('.InvoiceTypeCommon').prop('disabled', false);
            $('.HideOnNewForm', t.el).hide();
        }

       

    });

    t.on('afterDataAction', function (params)
    {
         // This will pause execution for debugging if the developer tools are open
        if (params.res.status === 'OK')
        {
            
            
            var myMessage = "Invoice Created Successfully";
            var trimMyMessage = myMessage.trim();
            var parts = params.res.Response.split('||');
            var code = parts[ 0 ];
            var messageStatus = parts[ 1 ];
            var message = parts[ 2 ];
            $('.btnSaveInvoice', t.el).attr('disabled')
            $('.btnSaveInvoice', t.el).hide();
            $('.btnSaveInvoice', t.el).addClass('ElemDisabled');

            $('.btnSave,.OnCreateInvoice', t.el).removeAttr('disabled').removeClass('ElemDisabled');
            $('.btnSave,.OnCreateInvoice', t.el).show();
            
            if (message !== undefined)
            {
                var trimMessage = message.trim();
                // Further processing with trimMessage
            }

      

            if (trimMessage.toLowerCase() === trimMyMessage.toLowerCase())
            {
                
                // This line will only execute if the message is "Invoice create Successfully"
                $('[argumentid="InvoiceRecId"]', t.el).val(code);
                $('[argumentid="RecId"]', t.el).val(code);
                $('[argumentid="SystemId"]', t.el).text(code);
              var inv =   $('[argumentid="InvoicePaymentRecId"]', t.el).val(code);
                console.log("Setting InvoiceRecId to:", code); // Add this line for debugging
                console.log("Setting InvoicePaymentRecId to:", inv);
                AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.toggleDropdown(trimMessage.toLowerCase(),'');
                $('.StatusRow', t.el).show();
                $('.SimpleTab', t.el).removeAttr('disabled');


                var params = {
                    Command: 'SEL_Invoice',
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
                                var InvRecCode = row.InvRecCode;
                                var InvoiceNo = row.InvoiceNo;
                                var StateName = row.StateName;



                            }

                            setTimeout(function ()
                            {
                           
                                $('[argumentid="InvRecCode"]', t.el).text(InvRecCode);
                                $('[argumentid="InvoiceNo"]', t.el).text(InvoiceNo);
                                $('[argumentid="StateName"]', t.el).text(StateName);
                               

                               



                            }, 2000);
                        }

                    }




                },'GetData');
            } else
            {
                console.log("Line of item");
            }
        } else
        {
            console.error("Unexpected status:", params.res.status);
        }


    });

    
  

  


  /*  AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.CallToServer(t);*/
    AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.CalculationOfQuantityAndUnitPrice(t);
    AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.CalculateDiscount(t);
    //AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.CalculateCustomerPaid(t);
    AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.EnableDisableLineOfItems(t);
    AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.SaveLineOfItem(t);
   /* AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.CallToServerForItemCode(t);*/
   /* AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.toggleDropdown();*/

    //AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.btnSavePayment(t);

    $('#addRowButton').off('click').on('click', function ()
    {
        
        
        const newRow = `<tr class="DyRows">
                    <td><input type="text" style="text-align: center; width: 80px;" maxlength="10" class="text PriceC number CommonDisableClasss" groupid="SparePartInventoryInvoice" argumentid="ItemId" /></td>
                    <td><input type="text" style="text-align: center; width: 80px;" maxlength="10" class="text PriceC" groupid="SparePartInventoryInvoice" argumentid="Code" /></td>
                    <td><input type="text" style="text-align: center; width: 150px; font-weight: bold;" maxlength="30" class="text PriceC" groupid="SparePartInventoryInvoice" argumentid="SparePartName" /></td>
                    <td><input type="text" style="text-align: center; width: 80px;" maxlength="10" class="text number" groupid="SparePartInventoryInvoice" argumentid="SparePartQuantity" /></td>
                    <td><input type="text" style="text-align: center; width: 80px;" maxlength="10" class="text PriceC" groupid="SparePartInventoryInvoice" argumentid="SelectQuantity" /></td>
                    <td><input type="text" style="text-align: center; width: 80px;" maxlength="10" class="text number" groupid="SparePartInventoryInvoice" argumentid="SparePartUnitPrice" /></td>
                    <td><input type="text" style="text-align: center; width: 80px;" maxlength="10" class="text PriceC" groupid="SparePartInventoryInvoice" argumentid="TotalPrice" /></td>
                    <td><button type = "button" class="deleteRowButton">Delete</button></td> <!-- Delete button -->
                    </tr>`;
        $('#dynamicRows').append(newRow);
        $('#addRowButton', t.el).prop('disabled', true);
    });

    $('#dynamicRows').on('click', '.deleteRowButton', function ()
    {
        $(this).closest('tr').remove(); // Remove the parent row of the clicked delete button
    });

    if ($('[argumentid="SelectQuantity"]', t.el).val() == "")
    {
        
        $('#addRowButton', t.el).prop('disabled', true);
    } 

    
   


};
//end of AsyncWidgets.WidgetScripts.frmSparePartInventory = function (obj)

AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.CallToServer = function (t)
{
    var lastRecId = null;
    //var itemIdInput = $('input[argumentid="ItemId1"]');

    $('#dynamicRows').on('blur', '[argumentid="ItemId"]', function ()
    {


        var isValid = true;

        // Client-side validation
        $('.trNoDynamic').find('[argumentid]').each(function ()
        {
            
            var $element = $(this);
            var argumentid = $element.attr('argumentid');
            var value = $element.val().trim();

            if (value != '')
            {
                isValid = true;
                $element.css('border', '');
                //console.log('Argument ID:', argumentid, 'is empty');
                //$element.css('border', '1px solid red');
            }
        
        });

        var itemIdInput = $(this).val();
        if (!itemIdInput)
        {
            return;
        }



        var params = { Command: 'SEL_iRental_SparePartInventory', RecId: `${itemIdInput}` };

        function Success(res)
        {
            var res = decJSON(res);

            if (res.status == 'OK')
            {
                if (res.Response.Rows.length > 0)
                {
                    var rows = res.Response.Rows;
                    for (var i = 0; i < rows.length; i++)
                    {

                        var row = rows[ i ];
                        var recId = row.RecId;
                        var ItemCode = row.SparePartSerialNo;
                        var sparePartName = row.SparePartName;
                        var QTYAVl = row.SparePartQuantity;
                        var unitPrice = row.SparePartUnitPrice;

                    }
                    var parentRow = $(this).closest('tr');

                    $('[argumentid="ItemId"]', parentRow, t.el).val(recId);
                    $('[argumentid="SparePartName"]', parentRow, t.el).val(sparePartName);
                    $('[argumentid="SparePartSerialNo"]', parentRow, t.el).val(ItemCode);
                    $('[argumentid="SparePartQuantity"]', parentRow, t.el).val(QTYAVl);
                    $('[argumentid="SparePartUnitPrice"]', parentRow, t.el).val(unitPrice.toFixed(3));
                } else
                {
                    // If no rows, log 'empty rows' to the console
                    $.showMessage(`Record not Found `);
                    var parentRow = $(this).closest('tr');
                    $('[argumentid="ItemId"]', parentRow, t.el).val('');
                    $('[argumentid="SparePartQuantity"]', parentRow, t.el).val('');
                    $('[argumentid="SparePartName"]', parentRow, t.el).val('');
                    $('[argumentid="SparePartQuantity"]', parentRow, t.el).val('');
                    $('[argumentid="SparePartUnitPrice"]', parentRow, t.el).val('');
                    $('[argumentid="TotalPrice"]', parentRow, t.el).val('');

                }

              

            }
        }


        Success = Success.bind(this);
        ServerCall(params, Success, "GetData");
    });
};
AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.CallToServerForItemCode = function (t)
{
    var lastRecId = null;
    //var itemIdInput = $('input[argumentid="ItemId1"]');

    $('#dynamicRows').on('blur', '[argumentid="SparePartSerialNo"]', function ()
    {


        var itemIdInput = $(this).val();
        if (!itemIdInput)
        {
            return;
        }


        
        var params = { Command: 'SEL_iRental_SparePartInventory', SparePartSerialNo: `${itemIdInput}` };
        2
        function Success(res)
        {
            var res = decJSON(res);

            if (res.status == 'OK')
            {
                if (res.Response.Rows.length > 0)
                {
                    var rows = res.Response.Rows;
                    for (var i = 0; i < rows.length; i++)
                    {
                        
                        var row = rows[ i ];
                        var recId = row.RecId;
                        var ItemCode = row.SparePartSerialNo;
                        var sparePartName = row.SparePartName;
                        var QTYAVl = row.SparePartQuantity;
                        var unitPrice = row.SparePartUnitPrice;

                    }
                    var parentRow = $(this).closest('tr');

                    $('[argumentid="ItemId"]', parentRow, t.el).val(recId);
                    $('[argumentid="SparePartName"]', parentRow, t.el).val(sparePartName);
                    $('[argumentid="SparePartSerialNo"]', parentRow, t.el).val(ItemCode);
                    $('[argumentid="SparePartQuantity"]', parentRow, t.el).val(QTYAVl);
                    $('[argumentid="SparePartUnitPrice"]', parentRow, t.el).val(unitPrice.toFixed(3));
                } else
                {
                    // If no rows, log 'empty rows' to the console
                    $.showMessage(`Record not Found `);
                    var parentRow = $(this).closest('tr');
                    $('[argumentid="ItemId"]', parentRow, t.el).val('');
                    $('[argumentid="SparePartQuantity"]', parentRow, t.el).val('');
                    $('[argumentid="SparePartName"]', parentRow, t.el).val('');
                    $('[argumentid="SparePartQuantity"]', parentRow, t.el).val('');
                    $('[argumentid="SparePartUnitPrice"]', parentRow, t.el).val('');
                    $('[argumentid="TotalPrice"]', parentRow, t.el).val('');
                    2
                }



            }
        }


        Success = Success.bind(this);
        ServerCall(params, Success, "GetData");
    });
};

AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.CalculationOfQuantityAndUnitPrice = function (t)
{
    //$('#dynamicRows').on('input', '[argumentid="SelectQuantity"]', function ()
    //{
    //    var t = this;
    //    //AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.CheckAvailableQTYNotGreaterThan(t);
    //    var $row = $(this).closest('tr'); // Find the closest table row or relevant container
    //    var quantity = parseFloat($row.find('[argumentid="SelectQuantity"]').val()) || 0;
    //    var unitPrice = parseFloat($row.find('[argumentid="SparePartUnitPrice"]').val()) || 0;
    //    var AVLQTY = parseFloat($row.find('[argumentid="SparePartQuantity"]').val()) || 0;
    //    if (!isNaN(quantity) && !isNaN(unitPrice))
    //    {
    //        var totalPrice = quantity * unitPrice;
    //        var LeftQTY = AVLQTY - quantity;
    //        $row.find('[argumentid="TotalPrice"]').val(totalPrice.toFixed(3)); // Assuming there's an input field for total price
    //        //$row.find('[argumentid="SparePartQuantity"]').val(LeftQTY);
    //        AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.CalculationOfTotalPrice(t)
    //        AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.CheckAvailableQTYNotGreaterThan(t, AVLQTY, quantity);


    //    } else
    //    {
    //        $row.find('[argumentid="TotalPrice"]').val(''); // Clear total price if inputs are invalid
    //    }

    //    if ($('[argumentid="SelectQuantity"]',t.el).val != "")
    //    {
    //        $('#addRowButton', t.el).prop('disabled', false);
    //    }
    //});

    $('#dynamicRows').on('input', '[argumentid="SelectQuantity"]', function () {
        var t = this;
        var $row = $(this).closest('tr'); // Find the closest table row or relevant container

        // Parse quantities and unit price
        var quantity = parseFloat($row.find('[argumentid="SelectQuantity"]').val()) || 0;
        var unitPrice = parseFloat($row.find('[argumentid="SparePartUnitPrice"]').val()) || 0;
        var AVLQTY = parseFloat($row.find('[argumentid="SparePartQuantity"]').val()) || 0;
        var TotalPricee = parseFloat($row.find('[argumentid="TotalPrice"]').val()) || 0;

        if (!isNaN(quantity) && !isNaN(unitPrice)) {
            // Calculate total price and left quantity
            var totalPrice = quantity * unitPrice;
            var LeftQTY = AVLQTY - quantity;

            // Set TotalPrice with conditional formatting
            if (Number.isInteger(totalPrice)) {
                $row.find('[argumentid="TotalPrice"]').val(totalPrice.toFixed(3)); // Show as 3 decimal places for integer values
            } else {
                $row.find('[argumentid="TotalPrice"]').val(totalPrice.toFixed(3)); // Retain existing decimal precision
            }

            // Set LeftQTY if needed and call other functions
            // $row.find('[argumentid="SparePartQuantity"]').val(LeftQTY); // Uncomment if needed
            AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.CalculationOfTotalPrice(t);
            AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.CheckAvailableQTYNotGreaterThan(t, AVLQTY, quantity, unitPrice);
        } else {
            // Clear TotalPrice if inputs are invalid
            $row.find('[argumentid="TotalPrice"]').val('');
        }

        // Enable 'Add Row' button if SelectQuantity is not empty
        if ($('[argumentid="SelectQuantity"]', t.el).val() !== "") {
            $('#addRowButton', t.el).prop('disabled', false);
        }
    });


};

AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.CalculationOfTotalPrice = function (t)
{
    
    // Get and parse the discount value, defaulting to 0 if invalid
    var discount = parseFloat($('.Discount', t.el).val()) || 0;

    var totalPriceText = $('.TotalPriceVal', t.el);
    let totalPriceSum = 0;

    // Sum up the total prices
    for (let index = 0; index < totalPriceText.length; index++) {
        var getPriceText = $(totalPriceText[index]).text();
        var getPriceNumber = parseFloat(getPriceText);
        if (!isNaN(getPriceNumber)) {
            totalPriceSum += getPriceNumber;
        }
    }

    console.log("Total Price Sum:", totalPriceSum);
    $('[argumentid="SubTotal"]', t.el).val(formatValue(totalPriceSum));

    // Apply discount to calculate GrandTotal
    var grandTotal = totalPriceSum - discount;
    $('[argumentid="GrandTotal"]', t.el).val(formatValue(grandTotal));
    $('[argumentid="Balance"]', t.el).text(formatValue(grandTotal));

    // Check and apply paid amount to calculate final balance
    var paid = parseFloat($('[argumentid="Paid"]', t.el).text()) || 0;
    var finalBalance = grandTotal - paid;
    $('[argumentid="Balance"]', t.el).text(formatValue(finalBalance));

    // Format values with helper function
    function formatValue(value) {
        return Number.isInteger(value) ? value.toFixed(3) : value.toFixed(3);
    }

};
AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.CalculateDiscount = function (t)
{
    $('[argumentid="Discount"]', t.el).on('blur', function () {
        var discount = $(this).val() || 0;
        var resDiscount = parseFloat(discount);
        var subTotal = parseFloat($('[argumentid="SubTotal"]', t.el).val());

        // Set resDiscount to 0 if it's NaN, otherwise format as needed
        resDiscount = isNaN(resDiscount) ? 0 : resDiscount;

        // Calculate grandTotal and apply appropriate formatting
        var grandTotal = subTotal - resDiscount;
        $('[argumentid="GrandTotal"]', t.el).val(formatValue(grandTotal));
        $('[argumentid="Balance"]', t.el).text(formatValue(grandTotal));

        // Handle Paid and Balance calculations
        var paidText = $('[argumentid="Paid"]', t.el).text() || '0.000';
        var paid = parseFloat(paidText);
        var resBalance = grandTotal - (isNaN(paid) ? 0 : paid);
        $('[argumentid="Balance"]', t.el).text(formatValue(resBalance));

        // Format resDiscount to three decimal places only if it's an integer
        $(this).val(formatValue(resDiscount));
        
        setTimeout(function () {
            var Totall = parseFloat($('[argumentid="Total"]', t.el).val()) || 0;
            var GrandTotal = parseFloat($('[argumentid="GrandTotal"]', t.el).val()) || 0;
            
            if (GrandTotal === Totall && GrandTotal != 0 && Totall != 0) {
                $('[argumentid="GrandTotal"]').css('color', 'green');
                $('[argumentid="Total"]').css('color', 'green');
            } else if (GrandTotal == 0 || Totall == 0) {
                $('[argumentid="GrandTotal"]').css('color', 'red');
                $('[argumentid="Total"]').css('color', 'red');
            }  else {
                $('[argumentid="GrandTotal"]').css('color', 'red');
                $('[argumentid="Total"]').css('color', 'red')
            }

            if ($('.QuotationInvoice').is(":checked")) {
                
                $('[argumentid="GrandTotal"]').css('color', 'green');
                $('[argumentid="Total"]').css('color', 'green');

            }
            if ($('.WarrentyInvoice').is(":checked")) {

                $('[argumentid="GrandTotal"]').css('color', 'green');
                $('[argumentid="Total"]').css('color', 'green');

            }
            var zero = 0;
            $('[argumentid="Card"]', t.el).val(zero.toFixed(3));
            $('[argumentid="Cash"]', t.el).val(zero.toFixed(3));
            $('[argumentid="Total"]', t.el).val(zero.toFixed(3));
        }, 1000);
      
    });

    // Helper function to format values: show toFixed(3) for integers, otherwise keep as is
    function formatValue(value) {
        return Number.isInteger(value) ? value.toFixed(3) : value.toFixed(3);
    }


};

//AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.CalculateCustomerPaid = function (t)
//{
//    //$('[argumentid="Paid"]', t.el).on('blur', function ()
//    //{
//    //    var paid = $(this).val();
//    //    var grandTotal = $('[argumentid="GrandTotal"]', t.el).val();

//    //    var grandTotal = grandTotal - paid;

//    //    $('[argumentid="Balance"]', t.el).val(grandTotal.toFixed(3));



//    });
//};

AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.CheckAvailableQTYNotGreaterThan = function (t, AVLQTY, quantity, unitPrice)
{
    
   
      

    if (quantity > AVLQTY) {
        $.showMessage(`Select QTY Cannot be greater than AVL Qty..! `);
        $('[argumentid="SelectQuantity"]', t.el).val(AVLQTY);
        var SelectQTY = AVLQTY;

    }
    else if (quantity == 0) {
        SelectQTY = 0;
    }
    else if (quantity < AVLQTY) {

        SelectQTY = quantity;
    }
    else if (quantity == AVLQTY) {
        SelectQTY = quantity;
    }
    // Calculate TotalPrice using SelectQTY (either adjusted or original)
    var AgainCalculation = SelectQTY * unitPrice;

    // Format TotalPrice to only show decimals if necessary
    var formattedTotalPrice = Number.isInteger(AgainCalculation) ? AgainCalculation.toFixed(3) : AgainCalculation.toFixed(3);

    // Update TotalPrice field with formatted result
    $('[argumentid="TotalPrice"]', t.el).val(formattedTotalPrice);


};

AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.EnableDisableLineOfItems = function (t)
{
    $('.btnSaveInvoice', t.el).on('click', function ()
    {


        let isValid = false; // Assume no field is filled initially
        
        // Define the required fields to check
        const requiredFields = [
            $('[lovpopupid="customerInvoicePopup"]'),
            $('[lovpopupid="carPopupGarageForInvoice"]'),
            $('[lovpopupid="QuotationInvoicePopup"]')
        ];

        // Loop through the required fields to check if any are filled
        requiredFields.forEach(function (field) {
            if (field.val()) { // If the field is filled
                isValid = true; // Set isValid to true
            }
        });

        // If no required field is filled, stop the click event
        if (!isValid) {
            alert('Please fill in at least one of the required fields.'); // Alert the user
            return false; // Exit the function
        }
        setTimeout(function ()
        {
            $('.trNoDynamic input').prop('disabled', false).removeClass('ElemDisabled');
            $('[argumentid="SparePartSerialNo"],[argumentid="SparePartName"],[argumentid="SparePartQuantity"],[argumentid="TotalPrice"]').prop('disabled', true).addClass('ElemDisabled');

            

        }, 3000);

        $('.btnSaveInvoice', t.el).attr('disabled');
        $('.btnSaveInvoice,.InvoiceButton_Edit,.InvoiceOpenBtn', t.el).hide();
        $('.btnSaveInvoice', t.el).addClass('ElemDisabled');

        
        $('.btnSave,.OnCreateInvoice', t.el).removeAttr('disabled').removeClass('ElemDisabled');
        $('.btnSave,.OnCreateInvoice,.HideOnNewForm', t.el).show();
        $('.OnNewForm', t.el).show();
        $('.InvoiceButton_Edit,.InvoiceOpenBtn', t.el).hide();
        $('[argumentid="ItemId"]', t.el).css('border', '1px solid #ff5555');

        if ($('.WarrentyInvoice').is(":checked")) {

            $('.onQuotation', t.el).hide();
        } else if ($('.CashInvoice').is(":checked")) {
            $('.onQuotation', t.el).show();
        }
        
    });



};

AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.SaveLineOfItem = function (t)
{

    $('.SaveBtn',t.el).click(function ()
    {
        
       

  
        // Client-side validation
        //$('.trNoDynamic').find('[argumentid]').each(function ()
        //{
        //    var $element = $(this);
        //    var argumentid = $element.attr('argumentid');
        //    var value = $element.val().trim();

        //    if (value === '')
        //    {
        //        isValid = false;
        //        console.log('Argument ID:', argumentid, 'is empty');
        //        $element.css('border', '1px solid red');
        //    } else
        //    {
        //        $element.css('border', '');
        //    }
        //});

        let isValid = true; // Initialize isValid

        // Variables to hold the values of SelectQuantity and SparePartUnitPrice
        let selectQuantityValue = null;
        let sparePartUnitPriceValue = null;

        $('.trNoDynamic [argumentid]').each(function () {
            const $element = $(this);
            const argumentid = $element.attr('argumentid');
            const value = $element.val().trim();
            
            // Check if the argumentid is one of the specified ones
            if (['ItemId', 'SelectQuantity', 'SparePartUnitPrice'].includes(argumentid)) {
                if (value === '') {
                    isValid = false;
                    $.showMessage(`Field ${argumentid.splitCamel()} is empty`);
                    $element.css('border', '1px solid red');
                    return false; // Breaks out of the .each loop
                } else {
                    $element.css('border', '');

                    // Store the values for SelectQuantity and SparePartUnitPrice
                    if (argumentid === 'SelectQuantity') {
                        selectQuantityValue = parseFloat(value) || 0; // Convert to float, default to 0 if NaN
                    }
                    if (argumentid === 'SparePartUnitPrice') {
                        sparePartUnitPriceValue = parseFloat(value) || 0; // Convert to float, default to 0 if NaN
                    }
                }
            }
        });

        // Check if both SelectQuantity and SparePartUnitPrice are 0
        if (selectQuantityValue === 0 || sparePartUnitPriceValue === 0) {
            
            $.showMessage('Both Select Quantity and Spare Part Unit Price cannot be zero');
            return false
        }


        //  Additional check to ensure all required fields are filled
        var requiredFieldIds = ['ItemId', 'SelectQuantity', 'SparePartUnitPrice'];
        var requiredFieldsFilled = requiredFieldIds.every(function (id) {
            return $(`.trNoDynamic [argumentid="${id}"]`).val().trim() !== '';
        });

        // If any field is empty, set isValid to false
        if (!requiredFieldsFilled) {
            isValid = false;
        }

        // If any field is empty, prevent further execution
        if (!isValid) {
         /*   console.log('Form validation failed. Please fill all required fields.');*/
            /*$.showMessage("Please fill all required fields.");*/
            return;
        }

        
        var ItemIdInTextBox = $('.ItemIdClass').val();
        var ItemIdNames = $('.linkFileName').toArray();

        for (var i = 0; i < ItemIdNames.length; i++)
        {
            var getItemID = $(ItemIdNames[ i ]).text().trim();

            if (ItemIdInTextBox === getItemID)
            {
                $.showMessage("Item is already exists.");
                $('.trNoDynamic input').val('');
                return;
            }
        }
        debugger
        // All fields are valid, proceed with server call
        executeServerCall();
    });

    function executeServerCall()
    {
       
        var InvoiceDetails = val('InvoiceDetails', t.el);
        var InvoicePaymentRecId = $('[argumentid="InvoicePaymentRecId"]', t.el).val();
        var ServiceNo = val('ServiceNo', t.el);
        /*var InvoiceDetails= $('[argumentid="InvoiceDetails"]', t.el).val();*/

      
        ServerCallCtx($('.trNoDynamic', t.el)[0], { DBAction: 'AddLineItem', InvoiceDetails: InvoiceDetails, InvoiceRecId: $('[argumentid="InvoiceRecId"]', t.el).val(), ServiceNo: ServiceNo, command: 'UPD_InvoiceDetails' }, function (res)
        {
            var res = decJSON(res);
            if (res.status === 'OK')
            {

                
                var subTotalVal = parseFloat($('[argumentid="SubTotal"]', t.el).val()) || 0;
                var Discount = parseFloat($('[argumentid="Discount"]', t.el).val()) || 0;
                var GrandTotal = parseFloat($('[argumentid="GrandTotal"]', t.el).val()) || 0;
                var Balance = parseFloat($('[argumentid="Balance"]', t.el).text()) || 0;
                var Paid = parseFloat($('[argumentid="Paid"]', t.el).text()) || 0;

                var zero = 0;
                

                setTimeout(function () {
                    var Totall = parseFloat($('[argumentid="Total"]', t.el).val()) || 0;
                    var GrandTotal = parseFloat($('[argumentid="GrandTotal"]', t.el).val()) || 0;
                    
                    if (GrandTotal === Totall) {
                        $('[argumentid="GrandTotal"]').css('color', 'green');
                        $('[argumentid="Total"]').css('color', 'green');
                    } else {
                        $('[argumentid="GrandTotal"]').css('color', 'red');
                        $('[argumentid="Total"]').css('color', 'red');
                    }


                    if ($('.QuotationInvoice').is(":checked")) {

                        $('[argumentid="GrandTotal"]').css('color', 'green');
                        $('[argumentid="Total"]').css('color', 'green');

                    }

                    var zero = 0;
                    $('[argumentid="Card"]', t.el).val(zero.toFixed(3));
                    $('[argumentid="Cash"]', t.el).val(zero.toFixed(3));
                    $('[argumentid="Total"]', t.el).val(zero.toFixed(3));
                }, 1000)


                var resBal = GrandTotal - Paid;

                // Format resBal based on whether it's an integer or has a decimal part
                var formattedResBal = Number.isInteger(resBal) ? resBal.toFixed(3) : resBal.toFixed(3);

                // Update Balance field with the formatted result
                $('[argumentid="Balance"]', t.el).text(formattedResBal);


                var parts = res.Response.split('||');
                var code = parts[ 0 ];
                console.log(parts[ 0 ]);
                $.showMessage(parts[ 2 ]);

            }
            var params = { Command: 'UPD_InvoiceDetails', InvoiceRecId: $('[argumentid="InvoiceRecId"]', t.el).val(), DBAction: 'GetLinesItems' };
            ServerCall(params, function (res)
            {
                var res = decJSON(res)

                if (res.status === 'OK')
                {


                    AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.GenerateUploadItems(res, t);
                    setTimeout(function ()
                    {
                        
                        // Assuming totalPriceText is a collection of elements, not a single number
                        var totalPriceText = $('.TotalPriceVal', t.el);

                        let totalPriceSum = 0; // Initialize a variable to store the sum of total prices

                        // Loop through each element in the totalPriceText collection
                        for (let index = 0; index < totalPriceText.length; index++) {
                            var getPriceText = $(totalPriceText[index]).text(); // Get the text content of the current element
                            var getPriceNumber = parseFloat(getPriceText); // Convert the text content to a number

                            // Ensure that the parsed number is a valid number before adding to the sum
                            if (!isNaN(getPriceNumber)) {
                                totalPriceSum += getPriceNumber; // Add the number to the sum
                            }
                        }

                        // Format totalPriceSum based on whether it’s an integer or has decimals
                        var formattedTotalPriceSum = Number.isInteger(totalPriceSum) ? totalPriceSum.toFixed(3) : totalPriceSum.toFixed(3);
                        $('[argumentid="SubTotal"]', t.el).val(formattedTotalPriceSum); // Update the SubTotal field with the formatted sum

                        // Retrieve various values from the form
                        var recid = $('[argumentid="RecId"]', t.el).val();
                        var Discount = parseFloat($('.Discount', t.el).val()) || 0; // Default to 0 if Discount is not a valid number

                        var GrandTotal = parseFloat($('[argumentid="GrandTotal"]', t.el).val()) || 0;
                        var Balance = parseFloat($('[argumentid="Balance"]', t.el).text()) || 0;
                        var Paid = parseFloat($('.Paid', t.el).text()) || 0;
                        var Code = $('[argumentid="Code"]', t.el).val();
                        var InvoiceDate = $('[argumentid="InvoiceDate"]', t.el).val();
                        var DeliveryNo = $('[argumentid="DeliveryNo"]', t.el).val();
                        var CustomerRecCode = $('[argumentid="CustomerRecCode"]', t.el).val();

                        // Calculate the total grand amount after discount
                        var totalGrand = totalPriceSum - Discount;
                        var formattedTotalGrand = Number.isInteger(totalGrand) ? totalGrand.toFixed(3) : totalGrand.toFixed(3);
                        $('[argumentid="GrandTotal"]').val(formattedTotalGrand); // Update the GrandTotal field

                        // Calculate the total balance after payment
                        var totalBal = totalGrand - Paid;
                        var formattedTotalBal = Number.isInteger(totalBal) ? totalBal.toFixed(3) : totalBal.toFixed(3);
                        $('[argumentid="Balance"]', t.el).text(formattedTotalBal); // Update the Balance field

                        setTimeout(function () {
                            var Totall = parseFloat($('[argumentid="Total"]', t.el).val()) || 0;
                            var GrandTotal = parseFloat($('[argumentid="GrandTotal"]', t.el).val()) || 0;
                            
                            if (GrandTotal === Totall) {
                                $('[argumentid="GrandTotal"]').css('color', 'green');
                                $('[argumentid="Total"]').css('color', 'green');
                            } else {
                                $('[argumentid="GrandTotal"]').css('color', 'red');
                                $('[argumentid="Total"]').css('color', 'red');
                            }

                            if ($('.QuotationInvoice').is(":checked")) {

                                $('[argumentid="GrandTotal"]').css('color', 'green');
                                $('[argumentid="Total"]').css('color', 'green');

                            }

                            if ($('.WarrentyInvoice').is(":checked")) {

                                $('[argumentid="GrandTotal"]').css('color', 'green');
                                $('[argumentid="Total"]').css('color', 'green');

                            }

                            var zero = 0;
                            $('[argumentid="Card"]', t.el).val(zero.toFixed(3));
                            $('[argumentid="Cash"]', t.el).val(zero.toFixed(3));
                            $('[argumentid="Total"]', t.el).val(zero.toFixed(3));
                        }, 1000)

                        var params = {
                            Command: 'UPD_InvoiceDetails',
                            RecId: `${recid}`,
                            SubTotal: `${totalPriceSum}`,
                            GrandTotal: `${totalGrand}`,
                            Balance: `${totalBal}`,
                            Discount: `${Discount}`,
                            Paid: `${Paid}`,
                            Code: `${Code}`,
                            InvoiceDate: `${InvoiceDate}`,
                            DeliveryNo: `${DeliveryNo}`,
                            CustomerRecCode: `${CustomerRecCode}`

                        };

                        // Assuming ServerCall is a function to make an API call
                        ServerCall(params, function (res)
                        {

                            var res = decJSON(res)


                            if (res.status === 'OK')
                            {


                                var parts = res.Response.split('||');
                                var code = parts[ 0 ];
                                var messageStatus = parts[ 1 ];
                                var message = parts[ 2 ];
                            }
                            AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.parseFloatSafe(t);






                        });

                        AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.parseFloatSafe(t);


                    }, 2000); // Delay execution by 2 seconds


                }
            }, "Search");



        });

        $('.trNoDynamic input', t.el).val('');
    };

    t.on('onLoadedValues', function (args)
    {
        var res = args.res.Response.Rows;
        InvoiceType = "";
        for (var i = 0; i < res.length; i++)
        {
            var row = res[i];
             InvoiceType = row.InvoiceType
        }
      
        $('.SimpleTab', t.el).removeAttr('disabled');
        $('.trNoDynamic input').prop('disabled', false).removeClass('ElemDisabled');
        $('[argumentid="SparePartSerialNo"],[argumentid="SparePartName"],[argumentid="SparePartQuantity"],[argumentid="TotalPrice"]',t.el).prop('disabled', true).addClass('ElemDisabled');
        $('.StatusRow', t.el).show();
        //const InvoiceRecIdval = args.res.Response.Rows[ 0 ].RecId;
        const InvoiceRecIdval = String(args.res.Response.Rows[ 0 ].RecId);
        $('[argumentid="InvoiceRecId"]').val(InvoiceRecIdval);
        $('[argumentid="InvoicePaymentRecId"]').val(InvoiceRecIdval);
        // Display the RecId as a string
        //console.log("InvoiceRecIdval:", InvoiceRecIdval);
        //console.log("InvoicePaymentRecId:", InvoiceRecIdval);
        $('.btnSaveInvoice', t.el).attr('disabled');
        $('.btnSaveInvoice', t.el).hide();
        $('.btnSaveInvoice', t.el).addClass('ElemDisabled');

        $('.btnSave,.OnCreateInvoice', t.el).removeAttr('disabled').removeClass('ElemDisabled');
        $('.btnSave,.OnCreateInvoice', t.el).show();

        var params = { Command: 'UPD_InvoiceDetails', InvoiceRecId: `${InvoiceRecIdval}`, DBAction: 'GetLinesItems' };
        ServerCall(params, function (res)
        {
            
            var res = decJSON(res)
            
            if (res.status === 'OK')
            {
                AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.GenerateUploadItems(res, t);
                AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.CalculationOfTotalPrice(t);
                setTimeout(function () {
                    var Totall = parseFloat($('[argumentid="Total"]', t.el).val()) || 0;
                    var GrandTotal = parseFloat($('[argumentid="GrandTotal"]', t.el).val()) || 0;
                    
                    if (GrandTotal === Totall && GrandTotal != 0 && Totall != 0) {
                        $('[argumentid="GrandTotal"]').css('color', 'green');
                        $('[argumentid="Total"]').css('color', 'green');
                    } else if (GrandTotal == 0 || Totall == 0) {
                        $('[argumentid="GrandTotal"]').css('color', 'red');
                        $('[argumentid="Total"]').css('color', 'red');
                    } else {
                        $('[argumentid="GrandTotal"]').css('color', 'red');
                        $('[argumentid="Total"]').css('color', 'red')
                    }

                    if ($('.QuotationInvoice').is(":checked")) {
                        
                        $('[argumentid="GrandTotal"]').css('color', 'green');
                        $('[argumentid="Total"]').css('color', 'green');

                    }

                    if ($('.WarrentyInvoice').is(":checked")) {

                        $('[argumentid="GrandTotal"]').css('color', 'green');
                        $('[argumentid="Total"]').css('color', 'green');

                    }
                 
                }, 1000)
             
            }
        }, "GetData");

        
       
        AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.parseFloatSafe(t);
        
        AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.toggleDropdown('',InvoiceType);
    
        
       
        $('.OnNewForm', t.el).show();
        $('.HideOnNewForm', t.el).show();
            
        if ($('[argumentid="StateId"]', t.el).text() == 'ClosedState')
        {


                $('.common-button,.CommonDisableClasss,.CommonDisableClass', t.el).attr('disabled', 'disabled');

            $('.common-button,.CommonDisableClasss,.CommonDisableClass', t.el).addClass('ElemDisabled');
            $('.InvoiceOpenBtn,.InvoiceButton_Edit', t.el).show();

            $('.LineOfItemRow', t.el).hide();
            $('[argumentid="InvoiceDate" ]', t.el).next('img').hide();

            setTimeout(function () {
                $('.remove-button', t.el).hide();
                $('.ItemListDiv', t.el).attr('disabled', 'disabled');
            }, 500)
           

        }



        if ($('[argumentid="StateId"]', t.el).text() == 'CanceledState')
        {


            $('.common-button,.CommonDisableClasss,.CommonDisableClass,.ItemListDiv', t.el).attr('disabled', 'disabled');

            $('.common-button,.CommonDisableClasss,.CommonDisableClass,.ItemListDiv', t.el).addClass('ElemDisabled');
            $('.InvoiceOpenBtn,.InvoiceButton_Edit', t.el).show();
            $('[argumentid="InvoiceDate" ]', t.el).next('img').hide();
            $('.LineOfItemRow', t.el).hide();
            setTimeout(function () {
                $('.remove-button', t.el).hide();
                $('.ItemListDiv', t.el).attr('disabled', 'disabled');
            }, 500)
          
        }

   
            if ($('[argumentid="StateId"]', t.el).text() == 'OpenState')
            {

                $('.LineOfItemRow', t.el).show();
            $('.common-button,.CommonDisableClasss', t.el).removeAttr('disabled', 'disabled');

            $('.common-button,.CommonDisableClasss', t.el).removeClass('ElemDisabled');
            $('.InvoiceOpenBtn', t.el).attr('disabled', 'disabled');
            $('.InvoiceOpenBtn', t.el).attr('disabled', 'disabled');
                $('.InvoiceOpenBtn', t.el).addClass('ElemDisabled');
                $('.InvoiceOpenBtn,.InvoiceButton_Edit', t.el).hide();
                $('[argumentid="InvoiceDate" ]', t.el).next('img').show();

                setTimeout(function () {
                    $('.trNoDynamic').find('[argumentid]').each(function () {
                        var $element = $(this);
                        var argumentid = $element.attr('argumentid');
                        var value = $element.val().trim();

                        if (value === '') {
                            isValid = true;
                            /*console.log('Argument ID:', argumentid, 'is empty');*/
                            $element.css('border', '');
                            $('[argumentid="ItemId"]', t.el).css('border', '1px solid #ff5555');
                        }
                    });

                }, 1000);


        }

        if ($('[argumentid="StateId"]', t.el).text() == 'CreatedState') {


            $('.common-button,.CommonDisableClasss', t.el).removeAttr('disabled', 'disabled');

            $('.common-button,.CommonDisableClasss,', t.el).removeClass('ElemDisabled');

        }

        
        var Cash = parseFloat((parseFloat($('[argumentid="Cash"]', t.el).val()) || 0));
        var Card = parseFloat((parseFloat($('[argumentid="Card"]', t.el).val()) || 0));
        var GrandTotal = parseFloat($('[argumentid="GrandTotal"]', t.el).val()) || 0;

        var result = Cash + Card;
        $('[argumentid="Total"]', t.el).val(result.toFixed(3));

        $('[argumentid="Cash"]', t.el).val(Cash.toFixed(3));
        $('[argumentid="Card"]', t.el).val(Card.toFixed(3));

    });
};

// Define parseFloatSafe function outside to avoid redundant definitions
AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.parseFloatSafe = function (t) {
    
    // Use parseFloatSafe function to safely parse and handle NaN values as 0.000
    var subTotalVal = parseFloatSafe($('[argumentid="SubTotal"]', t.el).val());
    var Discount = parseFloatSafe($('.Discount', t.el).val());
    var GrandTotal = parseFloatSafe($('[argumentid="GrandTotal"]', t.el).val());
    var Balance = parseFloatSafe($('[argumentid="Balance"]', t.el).text());
    var Paid = parseFloatSafe($('[argumentid="Paid"]', t.el).text());

    // Apply conditional formatting: if integer, format to 3 decimals, otherwise show as is
    $('[argumentid="SubTotal"]', t.el).val(formatValue(subTotalVal));
    $('.Discount', t.el).val(formatValue(Discount));
    $('[argumentid="GrandTotal"]', t.el).val(formatValue(GrandTotal));
    $('[argumentid="Balance"]', t.el).text(formatValue(Balance));
    $('[argumentid="Paid"]', t.el).text(formatValue(Paid));
};

// Helper function to check if a number is an integer
function isInteger(value) {
    return Number.isInteger(value);
}

// Function to format values: show toFixed(3) for integers, otherwise as is
function formatValue(value) {
    return isInteger(value) ? value.toFixed(3) : value;
}

// Safe parse function to avoid NaN values by returning 0.000 if NaN
function parseFloatSafe(value) {
    var result = parseFloat(value);
    return isNaN(result) ? 0.000 : result;
}


// Helper function to check if a number is an integer
function isInteger(value) {
    return Number.isInteger(value);
}

// Safe parse function to avoid NaN values by returning 0.000 if NaN
function parseFloatSafe(value) {
    var result = parseFloat(value);
    return isNaN(result) ? 0.000 : result.toFixed(3);
}


AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.GenerateUploadItems = function (res, t)
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
                var InvRecId = row.InvRecId;
                var ItemId = row.ItemId;
                var SparePartSerialNo = row.SparePartSerialNo;
                var SparePartName = row.SparePartName;
                var SparePartQuantity = row.SparePartQuantity;
                var SelectQuantity = row.SelectQuantity;
                var SparePartUnitPrice = Number.isInteger(row.SparePartUnitPrice) ? row.SparePartUnitPrice.toFixed(3) : row.SparePartUnitPrice.toFixed(3);
                var TotalPrice = Number.isInteger(row.TotalPrice) ? row.TotalPrice.toFixed(3) : row.TotalPrice.toFixed(3);
                var PurchasingFrom = row.PurchasingFrom;
                var StoreLocation = row.StoreLocation;
                var SparePartShelfNo = row.SparePartShelfNo;
                var SparePartRackfNo = row.SparePartRackfNo;
                var StoreLocationID = row.StoreLocationID;
                //var toFixedSparePartUnitPrice = SparePartUnitPrice.toFixed(3);
                //var toFixedTotalPrice = TotalPrice.toFixed(3);

                
                var genHtml = `


                                <tr class="ItemTableRow" style="white-space: nowrap" evenrowcss="w-grid-row-odd" oddrowcss="w-grid-row-odd" hoverrowcss="">
                                <td class="ColTemplate w-grid-cell-border colIndex-4 InvRecId" style="padding: 5px; background: white; color: black;display:none;">${InvRecId}</td>
                               <td class="ColTemplate w-grid-cell-border colIndex-4 linkFileName" style="padding: 5px; background: white; color: black;">${ItemId}</td>
                              <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${SparePartSerialNo}</td>
                              <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${SparePartName}</td>
                                <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${PurchasingFrom}</td>
                             
                              <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${SparePartRackfNo}</td>
                               <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${SparePartShelfNo}</td>
                                <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${StoreLocation}</td>
                              <td class="ColTemplate w-grid-cell-border colIndex-4 SparePartQuantity" style="padding: 5px; background: white; color: black;display:none;">${SparePartQuantity}</td>

                              <td class="ColTemplate w-grid-cell-border colIndex-4 SelectQuantity" style="padding: 5px; background: white; color: black;">${SelectQuantity}</td>
                              <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${SparePartUnitPrice}</td>
                              <td class="ColTemplate TotalPriceVal w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${TotalPrice }</td>
                             
                             <td class="ColTemplate w-grid-cell-border colIndex-4  remove-button" style="text-align: center;" recid="${RecId}">X</td>
                              </tr>

                                                `;

                tblRowsHTML += genHtml;
            } //end for loop

            var tblUFL = $('table.uploadedItemList', t.el); // get the main table

            /*  $('.ItemTR tbody', tblUFL).html(tblRowsHTML);*/
            $('tbody', tblUFL).html(tblRowsHTML); //inject html of the download file list table

           
            $('.remove-button', tblUFL).click(function ()
            {
                
                var btn = $(this);
                var curTR = btn.closest('tr');
                var invRecIdValue = curTR.find('.InvRecId').text().trim(); 
                var InvoiceDetails = val('InvoiceDetails', t.el);
                var SparePartQuantity = curTR.find('.SparePartQuantity').text().trim(); 
                var SelectQuantity = curTR.find('.SelectQuantity').text().trim();
                var recId = btn.attr("recId");
                var curTR = btn.closest('tr');
                var DeleteUploadItem = AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.DeleteUploadItem;
                DeleteUploadItem(t, recId, curTR, btn, invRecIdValue, SelectQuantity, InvoiceDetails);

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


            $('table.uploadedItemList .ItemTableRow').hide();
            $('table.uploadedItemList .ItemTableRow').remove();
            $('table.uploadedItemList .NoRecordsTR').show();
        }
    } //  if (res.status == 'OK')

};

AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.DeleteUploadItem = function (t, recId, curTR, btn, invRecIdValue, SelectQuantity, InvoiceDetails)
{

    var params = { Command: 'UPD_InvoiceDetails', RecId: recId, InvoiceDetails: InvoiceDetails, InvRecId: invRecIdValue, SelectQuantity: SelectQuantity, DBAction: 'DeleteItem' };
    ServerCall(params, function (res)
    {
       
        var res = decJSON(res)
      

        var parts = res.Response.split('||');
        var code = parts[ 0 ];
        console.log(parts[ 0 ]);
        $.showMessage(parts[ 2 ]);

      



    }, "DeleteRows") ;

  
    setTimeout(function ()
    {
        

        var totalPriceText = $('.TotalPriceVal', t.el);
        let totalPriceSum = 0; // Initialize a variable to store the sum of total prices

        for (let index = 0; index < totalPriceText.length; index++) {
            var getPriceText = $(totalPriceText[index]).text(); // Get the text content of the current element
            var getPriceNumber = parseFloat(getPriceText); // Convert the text content to a number

            if (!isNaN(getPriceNumber)) {
                totalPriceSum += getPriceNumber; // Add the number to the sum
            }
        }

        console.log(totalPriceSum); // Log the sum of total prices to the console

        // Format totalPriceSum based on whether it has decimals
        totalPriceSum = Number.isInteger(totalPriceSum) ? totalPriceSum.toFixed(3) : totalPriceSum;
        $('[argumentid="SubTotal"]', t.el).val(totalPriceSum);

        // Retrieve various values from the form
        var recid = $('[argumentid="RecId"]', t.el).val();
        var Discount = parseFloat($('.Discount', t.el).val()) || 0; // Ensure Discount is a number, default to 0 if NaN
        var GrandTotal = parseFloat($('[argumentid="GrandTotal"]', t.el).val()) || 0;
        var Balance = parseFloat($('[argumentid="Balance"]', t.el).text()) || 0;
        var Paid = parseFloat($('.Paid', t.el).text()) || 0;
        var Code = $('[argumentid="Code"]', t.el).val();
        var InvoiceDate = $('[argumentid="InvoiceDate"]', t.el).val();
        var DeliveryNo = $('[argumentid="DeliveryNo"]', t.el).val();
        var CustomerRecCode = $('[argumentid="CustomerRecCode"]', t.el).val();

        // Calculate total grand amount after discount
        var totalGrand = totalPriceSum - Discount;
        totalGrand = Number.isInteger(totalGrand) ? totalGrand.toFixed(3) : totalGrand.toFixed(3);
        $('[argumentid="GrandTotal"]').val(totalGrand);

        // Calculate total balance after payment
        var totalBal = totalGrand - Paid;
        totalBal = Number.isInteger(totalBal) ? totalBal.toFixed(3) : totalBal.toFixed(3);
        $('[argumentid="Balance"]', t.el).text(totalBal);

        setTimeout(function () {
            var Totall = parseFloat($('[argumentid="Total"]', t.el).val()) || 0;
            var GrandTotal = parseFloat($('[argumentid="GrandTotal"]', t.el).val()) || 0;
            
            if (GrandTotal === Totall && GrandTotal != 0 && Totall != 0) {
                $('[argumentid="GrandTotal"]').css('color', 'green');
                $('[argumentid="Total"]').css('color', 'green');
            } else if (GrandTotal == 0 || Totall == 0) {
                $('[argumentid="GrandTotal"]').css('color', 'red');
                $('[argumentid="Total"]').css('color', 'red');
            } else {
                $('[argumentid="GrandTotal"]').css('color', 'red');
                $('[argumentid="Total"]').css('color', 'red')
            } 

            if ($('.QuotationInvoice').is(":checked")) {
                
                $('[argumentid="GrandTotal"]').css('color', 'green');
                $('[argumentid="Total"]').css('color', 'green');

            }
            if ($('.WarrentyInvoice').is(":checked")) {

                $('[argumentid="GrandTotal"]').css('color', 'green');
                $('[argumentid="Total"]').css('color', 'green');

            }
            var zero = 0;
            $('[argumentid="Card"]', t.el).val(zero.toFixed(3));
            $('[argumentid="Cash"]', t.el).val(zero.toFixed(3));
            $('[argumentid="Total"]', t.el).val(zero.toFixed(3));
        }, 1000);



        


        var params = {
            Command: 'UPD_InvoiceDetails',
            RecId: `${recid}`,
            SubTotal: `${totalPriceSum}`,
            GrandTotal: `${totalGrand}`,
            Balance: `${totalBal}`,
            Discount: `${Discount}`,
            Paid: `${Paid}`,
            Code: `${Code}`,
            InvoiceDate: `${InvoiceDate}`,
            DeliveryNo: `${DeliveryNo}`,
            CustomerRecCode: `${CustomerRecCode}`

        };

        // Assuming ServerCall is a function to make an API call
        ServerCall(params, function (res)
        {
            
           var res = decJSON(res)

           
            if (res.status === 'OK')
            {

             
                var parts = res.Response.split('||');
                var code = parts[ 0 ];
                var messageStatus = parts[ 1 ];
                var message = parts[ 2 ];
            }
            AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.parseFloatSafe(t);

     

  

          
        });


    }, 2000);



  

};

AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.LoadInvoiceDetail = function (t)
{


    var params = { Command: 'UPD_InvoiceDetails', InvoiceRecId: $('[argumentid="InvoiceRecId"]', t.el).val(), DBAction: 'GetLinesItems' };
    ServerCall(params, function (res)
    {
        var res = decJSON(res)
        
        if (res.status === 'OK')
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
                    var SparePartSerialNo = row.SparePartSerialNo;
                    var SparePartName = row.SparePartName;
                    var SparePartQuantity = row.SparePartQuantity;
                    var SelectQuantity = row.SelectQuantity;
                    var SparePartUnitPrice = row.SparePartUnitPrice;
                    var TotalPrice = row.TotalPrice;
                     

                    
                    var genHtml = `


                                <tr class="ItemTableRow" style="white-space: nowrap" evenrowcss="w-grid-row-odd" oddrowcss="w-grid-row-odd" hoverrowcss="">
                               <td class=" ItemIdName ColTemplate  w-grid-cell-border colIndex-4 linkFileName" style="padding: 5px; background: white; color: black;">${ItemId}</td>
                              <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${SparePartSerialNo}</td>
                              <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${SparePartName}</td>
                              <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${SparePartQuantity}</td>
                              <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${SparePartUnitPrice}</td>
                              <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${TotalPrice}</td>
                             <td class="ColTemplate w-grid-cell-border colIndex-4  remove-button" style="text-align: center;display:block;" recid="${recId}">X</td>
                              </tr>

                                                `;

                    tblRowsHTML += genHtml;
                }//end for loop

                var tblUFL = $('table.uploadedItemList', t.el); // get the main table

                /*  $('.ItemTR tbody', tblUFL).html(tblRowsHTML);*/
                $('tbody', tblUFL).html(tblRowsHTML); //inject html of the download file list table
            }

        }
    }, "Search");

}


AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.toggleDropdown = function (trimMessage,InvoiceType) {
    var t = AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.t;


    
    if ($('.ServiceInvoice').is(":checked"))
    {

        var kv = {
            'ServiceInvoice': 'carPopupGarageForInvoice',
            'PartsInvoice': 'customerInvoicePopup',
            'QuotationInvoice': 'QuotationInvoicePopup'


        };

        //carPopupCutomerAndCarDetailsSales
        var toShow = kv['ServiceInvoice'];
        $('input[lovpopupid="carPopupGarageForInvoice"],input[lovpopupid="customerInvoicePopup"],input[lovpopupid="QuotationInvoicePopup"]', t.el)
            .each(function () {
                var elm = $(this);
                if (elm.attr('lovpopupid') != toShow) {
                    elm.removeClass('required')
                        .hide();
                    elm.next('span[errmsg]').remove();
                }

            });


        /*$(`.${toShow}`)*/
        $(`input[lovpopupid="${toShow}"]`).addClass('required').show();
        
        if (toShow === 'carPopupGarageForInvoice') {
            
            if (t.FormMode == 'update')
            {
                $('.cust', t.el).hide();
                $('.serv', t.el).show();
                $('.PartsInvoice,.QuotationInvoice', t.el).attr('disabled', 'disabled');
                $('.onQuotation', t.el).show();

                if (InvoiceType === 'CashInvoice' || InvoiceType === 'WarrantyInvoice' && InvoiceType != null) {

                    if ($('.CashInvoice', t.el).is(":checked")) {
                        $('.WarrentyInvoice', t.el).prop('disabled', true);
                    } else {
                        $('.WarrentyInvoice', t.el).prop('disabled', false);
                    }

                    if ($('.WarrentyInvoice', t.el).is(":checked")) {
                        $('.CashInvoice', t.el).prop('disabled', true);
                    } else {
                        $('.CashInvoice', t.el).prop('disabled', false);
                    }

                } else
                {
                    $('.InvoiceTypeCommon', t.el).prop('disabled', false);
                }

             
                
            }
            else if(trimMessage){
                $('.PartsInvoice,.QuotationInvoice', t.el).attr('disabled', 'disabled');
            }
            else
            {
            $('.cust', t.el).hide();
                $('.serv', t.el).show();

          
            }

          
        }

       
    



        $('.hideCarandService', t.el).show();
        $('.hideTrForINVCust', t.el).show();
        $('[tabid="InvoicePaymentDetails"],.hideOnQuotation', t.el).show();
        $('.onQuotation', t.el).show();

        if (t.FormMode == 'new') {
            
            $('.HideOnNewForm', t.el).hide();

            if (trimMessage) {

                $('.HideOnNewForm', t.el).show();
            }
        }
        if ($('.WarrentyInvoice', t.el).is(":checked")) {
            $('.onQuotation', t.el).hide();

        }
        else if ($('.CashInvoice', t.el).is(":checked")) {
            $('.onQuotation', t.el).show();
        }

    }



    if ($('.PartsInvoice').is(":checked")) {

        var kv = {
            'ServiceInvoice': 'carPopupGarageForInvoice',
            'PartsInvoice': 'customerInvoicePopup',
            'QuotationInvoice': 'QuotationInvoicePopup'

        };

        //carPopupCutomerAndCarDetailsSales
        var toShow = kv['PartsInvoice'];
        $('input[lovpopupid="carPopupGarageForInvoice"],input[lovpopupid="customerInvoicePopup"],input[lovpopupid="QuotationInvoicePopup"]', t.el)
            .each(function () {
                var elm = $(this);
                if (elm.attr('lovpopupid') != toShow) {
                    elm.removeClass('required')
                        .hide();
                    elm.next('span[errmsg]').remove();
                }

            });


        /*$(`.${toShow}`)*/
        $(`input[lovpopupid="${toShow}"]`).addClass('required').show();
        if (toShow === 'customerInvoicePopup') {
            if (t.FormMode == 'update') {
                $('.cust', t.el).show();
                $('.serv', t.el).hide();
                $('[argumentid="ChassisNo" ]', t.el).val('');
                $('.ServiceInvoice,.QuotationInvoice', t.el).attr('disabled', 'disabled');
                $('.CashInvoice').prop('checked', true);
                $('.onQuotation', t.el).show();
            }
            else if (trimMessage)
            {
                $('.ServiceInvoice,.QuotationInvoice', t.el).attr('disabled', 'disabled');            }
            else {
                $('.cust', t.el).show();
                $('.serv', t.el).hide();
                $('.ServiceInvoice,.QuotationInvoice', t.el).removeAttr('disabled', 'disabled');
                $('.CashInvoice').prop('checked', true);
                $('.onQuotation', t.el).show();
            }

        }
      



        $('.hideCarandService', t.el).hide();
        $('.hideTrForINVCust', t.el).show();
        $('[tabid="InvoicePaymentDetails"],.hideOnQuotation', t.el).show();
        if (t.FormMode == 'new') {

            $('.HideOnNewForm', t.el).hide();

            if (trimMessage) {

                $('.HideOnNewForm', t.el).show();
            }
        }

    }

    if ($('.QuotationInvoice').is(":checked")) {

        var kv = {
            'ServiceInvoice': 'carPopupGarageForInvoice',
            'PartsInvoice': 'customerInvoicePopup',
            'QuotationInvoice': 'QuotationInvoicePopup'

        };
        
        //carPopupCutomerAndCarDetailsSales
        var toShow = kv['QuotationInvoice'];
        $('input[lovpopupid="carPopupGarageForInvoice"],input[lovpopupid="customerInvoicePopup"],input[lovpopupid="QuotationInvoicePopup"]', t.el)
            .each(function () {
                var elm = $(this);
                if (elm.attr('lovpopupid') != toShow) {
                    elm.removeClass('required')
                        .hide();
                    elm.next('span[errmsg]').remove();
                }

            });


        /*$(`.${toShow}`)*/
        $(`input[lovpopupid="${toShow}"]`).addClass('required').show();
        if (toShow === 'QuotationInvoicePopup') {
            if (t.FormMode == 'update') {
                $('.cust', t.el).show();
                $('.serv', t.el).hide();
                $('[argumentid="ChassisNo" ]', t.el).val('');
                $('.ServiceInvoice,.PartsInvoice', t.el).attr('disabled', 'disabled');
                $('.CashInvoice').prop('checked', true);
                $('.onQuotation', t.el).hide();

            }
            else if (trimMessage) {
                $('.ServiceInvoice,.PartsInvoice', t.el).attr('disabled', 'disabled');
            }
            else {
                $('.cust', t.el).show();
                $('.serv', t.el).hide();
                $('.ServiceInvoice,.PartsInvoice', t.el).removeAttr('disabled', 'disabled');
                $('.CashInvoice').prop('checked', true);
                $('.onQuotation', t.el).hide();
            }

        }


        if (t.FormMode == 'new') {

            $('.HideOnNewForm', t.el).hide();
            $('.onQuotation', t.el).hide();

            if (trimMessage) {

                $('.HideOnNewForm', t.el).show();
                $('.onQuotation', t.el).hide();
            }
        }

        $('.hideCarandService', t.el).hide();
        $('.hideTrForINVCust', t.el).show();
        $('[tabid="InvoicePaymentDetails"],.hideOnQuotation', t.el).hide();
        $('.onQuotation', t.el).hide();

    }

    
    
};

