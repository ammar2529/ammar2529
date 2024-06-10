/// <reference path="../../../jquery/common.js" />


AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice = function (obj) 
{
    var t = obj;

    AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.t = t;


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
                Params: { RecId: val('RecId', wg.el), Command: 'SEL_SparePartCustomerAndInvoiceDetails' }

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
    t.on('show', function (args)
    {
        
        if (t.FormMode == "new") 
        {

            debugger
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
        }

       

    });

    t.on('afterDataAction', function (params)
    {
         // This will pause execution for debugging if the developer tools are open
        if (params.res.status === 'OK')
        {

            var myMessage = "Invoice create Successfully";
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

      

            if (trimMessage === trimMyMessage)
            {
                
                // This line will only execute if the message is "Invoice create Successfully"
                $('[argumentid="InvoiceRecId"]', t.el).val(code);
                $('[argumentid="RecId"]', t.el).val(code);
              var inv =   $('[argumentid="InvoicePaymentRecId"]', t.el).val(code);
                console.log("Setting InvoiceRecId to:", code); // Add this line for debugging
                console.log("Setting InvoicePaymentRecId to:", inv);
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

    //var discount = parseFloat($('[argumentid="Discount"]', t.el).val());
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

    if (!!$('[argumentid="Paid"]', t.el).text())
    {
        var Bal = parseFloat($('[argumentid="Paid"]', t.el).text());
        var resBal = GrandTotal - Bal;
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
        debugger
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

        if (isNaN(resDiscount))
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



    });



};

AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.SaveLineOfItem = function (t)
{
    $('.SaveBtn').click(function ()
    {
        

        var ItemIdInTextBox = $('.ItemIdClass');
        var ItemIdName = $('.ItemIdName');

        for (var i = 0; i < ItemIdName.length; i++)
        {
            
            var getItemID = $(ItemIdName[ i ])

            if (ItemIdInTextBox.val() === getItemID.text())
            {
                $.showMessage("Item is already exist")
                $('.trNoDynamic input', t.el).val('');
                return;
            }
        }

      var  InvoiceRecIdVal = $('[argumentid="InvoiceRecId"]', t.el).val();
       var InvoicePaymentRecId = $('[argumentid="InvoicePaymentRecId"]', t.el).val();

   
      
        ServerCallCtx($('.trNoDynamic', t.el)[ 0 ], { DBAction: 'AddUploadedItem', InvoiceRecId: $('[argumentid="InvoiceRecId"]', t.el).val(),  command: 'UPD_SparePartInventoryInvoiceDetails' }, function (res)
        {
            var res = decJSON(res);
            if (res.status === 'OK')
            {
                debugger
                
                var subTotalVal = parseFloat($('[argumentid="SubTotal"]',t.el).val());
                var Discount = parseFloat($('[argumentid="Discount"]',t.el).val());
                var GrandTotal = parseFloat($('[argumentid="GrandTotal"]',t.el).val());
                var Balance = parseFloat($('[argumentid="Balance"]',t.el).text());
                var Paid = parseFloat($('[argumentid="Paid"]',t.el).text());

                var resBal = GrandTotal - Paid;
                $('[argumentid="Balance"]', t.el).text(resBal.toFixed(3))

                var parts = res.Response.split('||');
                var code = parts[ 0 ];
                console.log(parts[ 0 ]);
                $.showMessage(parts[ 2 ]);

            }
            var params = { Command: 'UPD_SparePartInventoryInvoiceDetails', InvoiceRecId: $('[argumentid="InvoiceRecId"]', t.el).val(),  DBAction: 'GetLinesItems' };
            ServerCall(params, function (res)
            {
                var res = decJSON(res)

                if (res.status === 'OK')
                {
                    AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.GenerateUploadItems(res, t);
                    AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.CalculationOfTotalPrice(t);

                }
            }, "Search");

         

        });

        $('.trNoDynamic input',t.el).val('');

   
     


    });

    t.on('onLoadedValues', function (args)
    {

        $('.SimpleTab', t.el).removeAttr('disabled');
        $('.trNoDynamic input').prop('disabled', false).removeClass('ElemDisabled');
        $('[argumentid="SparePartName"],[argumentid="SparePartQuantity"],[argumentid="SparePartUnitPrice"],[argumentid="TotalPrice"]',t.el).prop('disabled', true).addClass('ElemDisabled');
        
        //const InvoiceRecIdval = args.res.Response.Rows[ 0 ].RecId;
        const InvoiceRecIdval = String(args.res.Response.Rows[ 0 ].RecId);
        $('[argumentid="InvoiceRecId"]').val(InvoiceRecIdval);
        $('[argumentid="InvoicePaymentRecId"]').val(InvoiceRecIdval);
        // Display the RecId as a string
        console.log("InvoiceRecIdval:", InvoiceRecIdval);
        console.log("InvoicePaymentRecId:", InvoiceRecIdval);

        var params = { Command: 'UPD_SparePartInventoryInvoiceDetails', InvoiceRecId: `${InvoiceRecIdval}`, DBAction: 'GetLinesItems' };
        ServerCall(params, function (res)
        {
            var res = decJSON(res)
            
            if (res.status === 'OK')
            {
                AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.GenerateUploadItems(res, t);
                //AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.CalculationOfTotalPrice(t);
             
            }
        }, "GetData");

  
       
        AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.parseFloatSafe(t);


    });
};

AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.parseFloatSafe = function (t)
{

    var subTotalVal = parseFloatSafe($('[argumentid="SubTotal"]').val());
    var Discount = parseFloatSafe($('[argumentid="Discount"]').val());
    var GrandTotal = parseFloatSafe($('[argumentid="GrandTotal"]').val());
    var Balance = parseFloatSafe($('[argumentid="Balance"]').text());
    var Paid = parseFloatSafe($('[argumentid="Paid"]').text());
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


    $('[argumentid="SubTotal"]').val(subTotalVal.toFixed(3));
    $('[argumentid="Discount"]').val(Discount.toFixed(3));
    $('[argumentid="GrandTotal"]').val(GrandTotal.toFixed(3));
    $('[argumentid="Balance"]').text(Balance.toFixed(3));
    $('[argumentid="Paid"]').text(Paid.toFixed(3));
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
                                                        <div class="ColValue w-grid-label" style="white-space: nowrap; cursor: pointer; overflow: hidden; margin-left: 10px; width: 100px;">${SparePartUnitPrice.toFixed(3)}</div>
                                                    </td>
                                                      <td class="ColTemplate w-grid-cell-border colIndex-4" style="white-space: nowrap; overflow: hidden; cursor: pointer; padding: 0px; width: 110px;" colid="DateCreated">
                                                        <div class="ColValue w-grid-label TotalPriceVal" style="white-space: nowrap; cursor: pointer; overflow: hidden; margin-left: 10px; width: 100px;">${TotalPrice.toFixed(3)}</div>
                                                    </td>
                                                     <td class="ColTemplate w-grid-cell-border colIndex-4" style="white-space: nowrap; overflow: hidden; cursor: pointer; padding: 0px; width: 45px;" colid="Delete">
                                                            <div class="ColValue w-grid-label" style="white-space: nowrap; cursor: pointer; overflow: hidden; margin-left: 10px; width: 35px;">
                                                             <span class="remove-button" recid="${RecId}" >X</span>
                                                            </div>
                                                        </td>
                              

                                                </tr>`;

                tblRowsHTML += genHtml;



            }  // for loop;
            


            var tblUFL = $('table.uploadedItemList', t.el); // get the main table

            $('.ItemTR tbody', tblUFL).html(tblRowsHTML); //inject html of the download file list table

           
            $('.remove-button', tblUFL).click(function ()
            {
                
                var btn = $(this);
                var recId = btn.attr("recId");
                var curTR = btn.closest('tr');
                var DeleteUploadItem = AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.DeleteUploadItem;
                DeleteUploadItem(t, recId, curTR);

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

AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.DeleteUploadItem = function (t, recId, curTR)
{

    var params = { Command: 'UPD_SparePartInventoryInvoiceDetails', RecId: recId, DBAction: 'DeleteItem' };
    ServerCall(params, function (res)
    {
        var res = decJSON(res)
        //$('[argumentid="Discount"]', t.el).val('');

        //var recid = $('[argumentid="RecId"]', t.el).val()
        //var subTotalVal = parseFloat($('[argumentid="SubTotal"]').val());
        //var Discount = parseFloat($('[argumentid="Discount"]').val());
        //var GrandTotal = parseFloat($('[argumentid="GrandTotal"]').val());
        //var Balance = parseFloat($('[argumentid="Balance"]').text());
        //var Paid = parseFloat($('[argumentid="Paid"]').text());

        //var resBal = GrandTotal - Paid
        //$('[argumentid="Balance"]').text(resBal.toFixed(3))

        var parts = res.Response.split('||');
        var code = parts[ 0 ];
        console.log(parts[ 0 ]);
        $.showMessage(parts[ 2 ]);
        AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.CalculationOfTotalPrice(t);
    }, "DeleteRows")


    var recid = $('[argumentid="RecId"]', t.el).val()
    var totalprice = parseFloat($('.TotalPriceVal', curTR).text());
    var subTotalVal = parseFloat($('[argumentid="SubTotal"]').val());
    var Discount = parseFloat($('[argumentid="Discount"]').val());
    var GrandTotal = parseFloat($('[argumentid="GrandTotal"]').val());
    var Balance = parseFloat($('[argumentid="Balance"]').text());
    var Paid = parseFloat($('[argumentid="Paid"]').text());

    var total = subTotalVal - totalprice 
    var totalDis = subTotalVal - Discount
    var totalBal = GrandTotal - Paid
    var params = { Command: 'UPD_CustomerInvoiceDetails', RecId: `${recid}`, SubTotal: `${total}`, GrandTotal: `${totalDis}`, Balance: `${totalBal}` };
    ServerCall(params, function (res)
    {


    }); 

    //var params = { Command: 'SEL_SparePartCustomerAndInvoiceDetails', RecId: `${recid}` };
    //ServerCall(params, function (res)
    //{
    //    var res = decJSON(res)

    //}); 

};

AsyncWidgets.WidgetScripts.frmSparePartInventoryInvoice.LoadInvoiceDetail = function (t)
{


    var params = { Command: 'UPD_SparePartInventoryInvoiceDetails', InvoiceRecId: $('[argumentid="InvoiceRecId"]', t.el).val(), DBAction: 'GetLinesItems' };
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

                $('.ItemTR tbody', tblUFL).append(tblRowsHTML);
            }

        }
    }, "Search");

}

