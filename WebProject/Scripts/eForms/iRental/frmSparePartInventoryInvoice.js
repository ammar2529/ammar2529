﻿/// <reference path="../../../jquery/common.js" />


AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice = function (obj) 
{
    var t = obj;

    AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.t = t;


    $(".ServiceInvoice, .PartsInvoice").click(function () {
       
    
        
        AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.toggleDropdown();

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

        }

        else if (li.attr('tabid') == 'InvoicePaymentDetails')
        {
            AsyncWidgets.get('grdInvoicePaymentDetails').show().Requery();
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

            
            var tblUFL = $('table.uploadedItemList', t.el);
            $('table.uploadedItemList .ItemTR .ItemTableRow',t.el).remove();
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
            $('.StatusRow', t.el).hide();
            $('.btnSaveInvoice', t.el).removeAttr('disabled').removeClass('ElemDisabled');
            $('.btnSaveInvoice', t.el).show();

            $('.btnSave', t.el).attr('disabled');
            $('.btnSave', t.el).addClass('ElemDisabled');
            $('.btnSave', t.el).hide();
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

            $('.btnSave', t.el).removeAttr('disabled').removeClass('ElemDisabled');
            $('.btnSave', t.el).show();
            
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
              var inv =   $('[argumentid="InvoicePaymentRecId"]', t.el).val(code);
                console.log("Setting InvoiceRecId to:", code); // Add this line for debugging
                console.log("Setting InvoicePaymentRecId to:", inv);
                AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.toggleDropdown(trimMessage.toLowerCase());
                $('.StatusRow', t.el).show();


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

    
  

  


    AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.CallToServer(t);
    AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.CalculationOfQuantityAndUnitPrice(t);
    AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.CalculateDiscount(t);
    //AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.CalculateCustomerPaid(t);
    AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.EnableDisableLineOfItems(t);
    AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.SaveLineOfItem(t);
    AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.CallToServerForItemCode(t);
   /* AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.toggleDropdown();*/

    //AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.btnSavePayment(t);

    $('#addRowButton').off('click').on('click', function ()
    {
        
        
        const newRow = `<tr class="DyRows">
                    <td><input type="text" style="text-align: center; width: 80px;" maxlength="10" class="text PriceC number CommonDisableClass" groupid="SparePartInventoryInvoice" argumentid="ItemId" /></td>
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
    $('#dynamicRows').on('blur', '[argumentid="SelectQuantity"]', function ()
    {
        var t = this;
        //AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.CheckAvailableQTYNotGreaterThan(t);
        var $row = $(this).closest('tr'); // Find the closest table row or relevant container
        var quantity = parseFloat($row.find('[argumentid="SelectQuantity"]').val());
        var unitPrice = parseFloat($row.find('[argumentid="SparePartUnitPrice"]').val());
        var AVLQTY = parseFloat($row.find('[argumentid="SparePartQuantity"]').val());
        if (!isNaN(quantity) && !isNaN(unitPrice))
        {
            var totalPrice = quantity * unitPrice;
            var LeftQTY = AVLQTY - quantity;
            $row.find('[argumentid="TotalPrice"]').val(totalPrice.toFixed(3)); // Assuming there's an input field for total price
            //$row.find('[argumentid="SparePartQuantity"]').val(LeftQTY);
            AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.CalculationOfTotalPrice(t)
            AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.CheckAvailableQTYNotGreaterThan(t, AVLQTY, quantity);


        } else
        {
            $row.find('[argumentid="TotalPrice"]').val(''); // Clear total price if inputs are invalid
        }

        if ($('[argumentid="SelectQuantity"]',t.el).val != "")
        {
            $('#addRowButton', t.el).prop('disabled', false);
        }
    });

};

AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.CalculationOfTotalPrice = function (t)
{
    

    var discount = parseFloat($('.Discount', t.el).val());
    //var Paid = parseFloat($('[argumentid="Paid"]', t.el).val());
    //var Balance = parseFloat($('[argumentid="Balance"]', t.el).val());


    var totalPriceText = $('.TotalPriceVal', t.el);

    let totalPriceSum = 0; // Initialize a variable to store the sum of total prices
    
    for (let index = 0; index < totalPriceText.length; index++)
    {
        var getPriceText = $(totalPriceText[ index ]).text(); // Get the text content of the current element
        var getPriceNumber = parseFloat(getPriceText); // Convert the text content to a number
        totalPriceSum += getPriceNumber; // Add the number to the sum
    }

    console.log(totalPriceSum); // Log the sum of total prices to the console
    $('[argumentid="SubTotal"]',t.el).val(totalPriceSum.toFixed(3))
    $('[argumentid="GrandTotal"]',t.el).val(totalPriceSum.toFixed(3))
    $('[argumentid="Balance"]',t.el).text(totalPriceSum.toFixed(3))
    var GrandTotal = parseFloat($('[argumentid="GrandTotal"]', t.el).val());
    var resDiscount = GrandTotal - discount
    $('[argumentid="GrandTotal"]', t.el).val(resDiscount.toFixed(3))
    if (!!$('[argumentid="Paid"]', t.el).text())
    {
        var Bal = parseFloat($('[argumentid="Paid"]', t.el).text());
        var resBal = resDiscount - Bal;
        $('[argumentid="Balance"]', t.el).text(resBal.toFixed(3));

    } else
    {
        $('[argumentid="Balance"]', t.el).text(totalPriceSum.toFixed(3))
    }

    //var resultSubtotal = totalPriceSum - discount;
    //$('[argumentid="GrandTotal"]', t.el).val(resultSubtotal.toFixed(3));
    //$('[argumentid="Balance"]', t.el).val(resultSubtotal.toFixed(3));


};
AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.CalculateDiscount = function (t)
{
    $('[argumentid="Discount"]', t.el).on('blur', function ()
    { 
        
        var discount = $(this).val();
        var resDiscount = parseFloat(discount);
        var subTotal = parseFloat($('[argumentid="SubTotal"]', t.el).val());

      

        var grandTotal = subTotal - resDiscount;

        $('[argumentid="GrandTotal"]', t.el).val(grandTotal.toFixed(3));
        $('[argumentid="Balance"]', t.el).text(grandTotal.toFixed(3));

        if (!!$('[argumentid="Paid"]', t.el).text())
        {
            var paid = parseFloat($('[argumentid="Paid"]', t.el).text());
            var resBalance = grandTotal - paid;
            $('[argumentid="Balance"]', t.el).text(resBalance.toFixed(3));
        } else
        {
            $('[argumentid="Paid"]', t.el).text('0.000')
        }

        if (!!isNaN(resDiscount))
        {
            resDiscount = 0;
        } else
        {
            // Ensure discount is fixed to 3 decimal places
            resDiscount = resDiscount.toFixed(3);
            $(this).val(resDiscount);
        }

    });

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

AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.CheckAvailableQTYNotGreaterThan = function (t, AVLQTY, quantity)
{

   
        //var availableQTY = parseFloat($('[argumentid="SparePartQuantity"]', t.el).val());
        //var selectQTY = parseFloat($(this).val());

    if (quantity > AVLQTY)
        {
             $.showMessage(`Select QTY Cannot be greater than AVL Qty..! `);
             $('[argumentid="SelectQuantity"]',t.el).val(AVLQTY);
        }



};

AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.EnableDisableLineOfItems = function (t)
{
    $('.btnSaveInvoice', t.el).on('click', function ()
    {
        setTimeout(function ()
        {
            $('.trNoDynamic input').prop('disabled', false).removeClass('ElemDisabled');
            $('[argumentid="SparePartName"],[argumentid="SparePartQuantity"],[argumentid="SparePartUnitPrice"],[argumentid="TotalPrice"]').prop('disabled', true).addClass('ElemDisabled');

            

        }, 3000);

        $('.btnSaveInvoice', t.el).attr('disabled');
        $('.btnSaveInvoice', t.el).hide();
        $('.btnSaveInvoice', t.el).addClass('ElemDisabled');


        $('.btnSave', t.el).removeAttr('disabled').removeClass('ElemDisabled');
        $('.btnSave', t.el).show();
        
        
    });



};

AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.SaveLineOfItem = function (t)
{

    $('.SaveBtn').click(function ()
    {
        var isValid = true;

        // Client-side validation
        $('.trNoDynamic').find('[argumentid]').each(function ()
        {
            var $element = $(this);
            var argumentid = $element.attr('argumentid');
            var value = $element.val().trim();

            if (value === '')
            {
                isValid = false;
                console.log('Argument ID:', argumentid, 'is empty');
                $element.css('border', '1px solid red');
            } else
            {
                $element.css('border', '');
            }
        });

        // Additional check to ensure all required fields are filled
        var requiredFieldsFilled = $('.trNoDynamic').find('[argumentid]').toArray().every(function (element)
        {
            return $(element).val().trim() !== '';
        });

        if (!requiredFieldsFilled)
        {
            isValid = false;
        }

        // If any field is empty, prevent further execution
        if (!isValid)
        {
            console.log('Form validation failed. Please fill all required fields.');
            return;
        }


        var ItemIdInTextBox = $('.ItemIdClass').val().trim();
        var ItemIdNames = $('.ItemIdName').toArray();

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
        // All fields are valid, proceed with server call
        executeServerCall();
    });

    function executeServerCall()
    {

        var InvoiceRecIdVal = $('[argumentid="InvoiceRecId"]', t.el).val();
        var InvoicePaymentRecId = $('[argumentid="InvoicePaymentRecId"]', t.el).val();



        ServerCallCtx($('.trNoDynamic', t.el)[ 0 ], { DBAction: 'AddLineItem', InvoiceRecId: $('[argumentid="InvoiceRecId"]', t.el).val(), command: 'UPD_InvoiceDetails' }, function (res)
        {
            var res = decJSON(res);
            if (res.status === 'OK')
            {


                var subTotalVal = parseFloat($('[argumentid="SubTotal"]', t.el).val());
                var Discount = parseFloat($('[argumentid="Discount"]', t.el).val());
                var GrandTotal = parseFloat($('[argumentid="GrandTotal"]', t.el).val());
                var Balance = parseFloat($('[argumentid="Balance"]', t.el).text());
                var Paid = parseFloat($('[argumentid="Paid"]', t.el).text());

                var resBal = GrandTotal - Paid;
                $('[argumentid="Balance"]', t.el).text(resBal.toFixed(3))

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
                        for (let index = 0; index < totalPriceText.length; index++)
                        {
                            var getPriceText = $(totalPriceText[ index ]).text(); // Get the text content of the current element
                            var getPriceNumber = parseFloat(getPriceText); // Convert the text content to a number

                            // Ensure that the parsed number is a valid number before adding to the sum
                            if (!isNaN(getPriceNumber))
                            {
                                totalPriceSum += getPriceNumber; // Add the number to the sum
                            }
                        }

                        console.log(totalPriceSum); // Log the sum of total prices to the console
                        $('[argumentid="SubTotal"]', t.el).val(totalPriceSum); // Update the SubTotal field with the sum

                        // Retrieve various values from the form
                        var recid = $('[argumentid="RecId"]', t.el).val();
                        var Discount = parseFloat($('.Discount', t.el).val());

                        if (isNaN(Discount))
                        {
                            Discount = 0;
                        }

                        var GrandTotal = parseFloat($('[argumentid="GrandTotal"]', t.el).val());
                        var Balance = parseFloat($('[argumentid="Balance"]', t.el).text());
                        var Paid = parseFloat($('.Paid', t.el).text());
                        var Code = $('[argumentid="Code"]', t.el).val();
                        var InvoiceDate = $('[argumentid="InvoiceDate"]', t.el).val();
                        var DeliveryNo = $('[argumentid="DeliveryNo"]', t.el).val();
                        var CustomerRecCode = $('[argumentid="CustomerRecCode"]', t.el).val();

                        // Ensure totalPriceSum is not NaN
                        if (isNaN(totalPriceSum))
                        {
                            totalPriceSum = 0;
                        }

                        // Calculate the total grand amount after discount
                        var totalGrand = totalPriceSum - Discount;
                        $('[argumentid="GrandTotal"]').val(totalGrand); // Update the GrandTotal field
                        ;

                        // Calculate the total balance after payment
                        var totalBal = totalGrand - Paid;
                        $('[argumentid="Balance"]', t.el).text(totalBal); // Update the Balance field


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

        
        $('.SimpleTab', t.el).removeAttr('disabled');
        $('.trNoDynamic input').prop('disabled', false).removeClass('ElemDisabled');
        $('[argumentid="SparePartName"],[argumentid="SparePartQuantity"],[argumentid="SparePartUnitPrice"],[argumentid="TotalPrice"]',t.el).prop('disabled', true).addClass('ElemDisabled');
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

        $('.btnSave', t.el).removeAttr('disabled').removeClass('ElemDisabled');
        $('.btnSave', t.el).show();

        var params = { Command: 'UPD_InvoiceDetails', InvoiceRecId: `${InvoiceRecIdval}`, DBAction: 'GetLinesItems' };
        ServerCall(params, function (res)
        {
            var res = decJSON(res)
            
            if (res.status === 'OK')
            {
                AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.GenerateUploadItems(res, t);
                AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.CalculationOfTotalPrice(t);
             
            }
        }, "GetData");

  
       
        AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.parseFloatSafe(t);
        
        AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.toggleDropdown();


    });
};

AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.parseFloatSafe = function (t)
{

    var subTotalVal = parseFloatSafe($('[argumentid="SubTotal"]',t.el).val());
    var Discount = parseFloatSafe($('.Discount',t.el).val());
    var GrandTotal = parseFloatSafe($('[argumentid="GrandTotal"]',t.el).val());
    var Balance = parseFloatSafe($('[argumentid="Balance"]',t.el).text());
    var Paid = parseFloatSafe($('[argumentid="Paid"]',t.el).text());
    function parseFloatSafe(value)
    {

        var result = parseFloat(value);
        
        return isNaN(result) ? 0.000 : result;
    }

    console.log("SubTotal type:", typeof subTotalVal);
    console.log("Discount type:", typeof Discount);
    console.log("GrandTotal type:", typeof GrandTotal);
    console.log("Balance type:", typeof Balance);
    console.log("Paid type:", typeof Paid);

    // Ensure toFixed(3) is applied correctly
    console.log("SubTotal:", subTotalVal.toFixed(3));
    console.log("Discount:", Discount.toFixed(3));
    console.log("GrandTotal:", GrandTotal.toFixed(3));
    console.log("Balance:", Balance.toFixed(3));
    console.log("Paid:", Paid.toFixed(3));


    $('[argumentid="SubTotal"]', t.el).val(subTotalVal.toFixed(3));
    $('.Discount', t.el).val(Discount.toFixed(3));
    $('[argumentid="GrandTotal"]', t.el).val(GrandTotal.toFixed(3));
    $('[argumentid="Balance"]', t.el).text(Balance.toFixed(3));
    $('[argumentid="Paid"]', t.el).text(Paid.toFixed(3));
        // Retrieve and parse values safely
};

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
                                                             <span title="Delete Item" class="remove-button" recid="${RecId}" >X</span>
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

AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.DeleteUploadItem = function (t, recId, curTR, btn, ItemId, SelectQuantity)
{

    var params = { Command: 'UPD_InvoiceDetails', RecId: recId, ItemId: ItemId, SelectQuantity: SelectQuantity, DBAction: 'DeleteItem' };
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

        for (let index = 0; index < totalPriceText.length; index++)
        {
            var getPriceText = $(totalPriceText[ index ]).text(); // Get the text content of the current element
            var getPriceNumber = parseFloat(getPriceText); // Convert the text content to a number

            if (!isNaN(getPriceNumber))
            {
                totalPriceSum += getPriceNumber; 
            }
        }

        console.log(totalPriceSum); // Log the sum of total prices to the console
        $('[argumentid="SubTotal"]', t.el).val(totalPriceSum);

        
        var recid = $('[argumentid="RecId"]', t.el).val();
        var Discount = parseFloat($('.Discount',t.el).val());
        var GrandTotal = parseFloat($('[argumentid="GrandTotal"]',t.el).val());
        var Balance = parseFloat($('[argumentid="Balance"]',t.el).text());
        var Paid = parseFloat($('.Paid',t.el).text());
        var Code = $('[argumentid="Code"]', t.el).val();
        var InvoiceDate = $('[argumentid="InvoiceDate"]', t.el).val();
        var DeliveryNo = $('[argumentid="DeliveryNo"]', t.el).val();
        var CustomerRecCode = $('[argumentid="CustomerRecCode"]', t.el).val();





        if (isNaN(totalPriceSum))
        {
            totalPriceSum = 0;
        }

        var totalGrand = totalPriceSum - Discount;
        $('[argumentid="GrandTotal"]').val(totalGrand);
        var totalBal = totalGrand - Paid;
        $('[argumentid="Balance"]',t.el).text(totalBal)

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
                    var RecCode = row.RecCode;
                    var SparePartName = row.SparePartName;
                    var SparePartQuantity = row.SparePartQuantity;
                    var SelectQuantity = row.SelectQuantity;
                    var SparePartUnitPrice = row.SparePartUnitPrice;
                    var TotalPrice = row.TotalPrice;


                    var genHtml = ` <tr class="ItemTableRow" style="white-space: nowrap" evenrowcss="w-grid-row-odd" oddrowcss="w-grid-row-odd" hoverrowcss="">


                                                    <td class="ColTemplate w-grid-cell-border colIndex-3" style="white-space: nowrap; overflow: hidden; cursor: pointer; padding: 0px; width: 60px;" colid="ItemId">
                                                        <div class="ColValue w-grid-label ItemIdName" style="white-space: nowrap; cursor: pointer; overflow: hidden; margin-left: 10px; ">${ItemId}</div>
                                                    </td>
                                                    <td class="ColTemplate w-grid-cell-border colIndex-4" style="white-space: nowrap; overflow: hidden; cursor: pointer; padding: 0px; width: 62px;" colid="FileSize">
                                                        <div class="ColValue w-grid-label" style="white-space: nowrap; cursor: pointer; overflow: hidden; margin-left: 10px; width: 60px;">${RecCode}</div>
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
                                                             <span class="remove-button" recid="${RecId}" >X</span>
                                                            </div>
                                                        </td>
                              

                                                </tr>`;

                    tblRowsHTML += genHtml;
                }//end for loop

                var tblUFL = $('table.uploadedItemList', t.el); // get the main table

                $('.ItemTR tbody', tblUFL).html(tblRowsHTML);
            }

        }
    }, "Search");

}


AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.toggleDropdown = function (trimMessage) {
    var t = AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.t;
 

  
    if ($('.ServiceInvoice').is(":checked"))
    {

        var kv = {
            'ServiceInvoice': 'carPopupGarageForInvoice',
            'PartsInvoice': 'customerInvoicePopup'

        };

        //carPopupCutomerAndCarDetailsSales
        var toShow = kv['ServiceInvoice'];
        $('input[lovpopupid="carPopupGarageForInvoice"],input[lovpopupid="customerInvoicePopup"]', t.el)
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

            if (t.FormMode == 'update') {
            $('.cust', t.el).hide();
            $('.serv', t.el).show();
            $('.PartsInvoice', t.el).attr('disabled', 'disabled');

            }
            else if(trimMessage){
                $('.PartsInvoice', t.el).attr('disabled', 'disabled');
            }
            else
            {
            $('.cust', t.el).hide();
                $('.serv', t.el).show();

          
            }

        }
    



        $('.hideCarandService', t.el).show();
        $('.hideTrForINVCust', t.el).show();
    }



    if ($('.PartsInvoice').is(":checked")) {

        var kv = {
            'ServiceInvoice': 'carPopupGarageForInvoice',
            'PartsInvoice': 'customerInvoicePopup'

        };

        //carPopupCutomerAndCarDetailsSales
        var toShow = kv['PartsInvoice'];
        $('input[lovpopupid="carPopupGarageForInvoice"],input[lovpopupid="customerInvoicePopup"]', t.el)
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
                $('.ServiceInvoice', t.el).attr('disabled', 'disabled');
            }
            else if (trimMessage)
            {
                $('.ServiceInvoice', t.el).attr('disabled', 'disabled');            }
            else {
                $('.cust', t.el).show();
                $('.serv', t.el).hide();
                $('.ServiceInvoice', t.el).removeAttr('disabled', 'disabled');
            }

        }
      

        //$('.RadioButtons', t.el).removeClass('ElemDisabled');
        //$('.RadioButtons', t.el).removeAttr('disabled', 'disabled')
        ///* $('.Other', t.el).addClass('ElemDisabled').attr('disabled', 'disabled');*/

        //$('[argumentid="CarNumber"]', t.el).removeClass('ElemDisabled');
        //$('[argumentid="CarNumber"]', t.el).removeAttr('disabled', 'disabled')

        // Hide the dropdown for Sales
        //$('.CommonCarDropdown').removeClass('required').hide();
        //$('.carCutomerAndCarDetailsForOther', t.el).hide();
        //$('.hideTr', t.el).show();
        //$('.ChassisNo', t.el).show();

        $('.hideCarandService', t.el).hide();
        $('.hideTrForINVCust', t.el).show();

    }

    

};

