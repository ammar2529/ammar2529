AsyncWidgets.WidgetScripts.frmLedgerManagement = function (obj)
{
    var t = obj;
    AsyncWidgets.WidgetScripts.frmLedgerManagement.t = t;

    $('.new-wrap', t.el).click(function () {
        $('.removeOnEditMode', '.trTableItemRow', t.el).hide();
        debugger
        const $target = $('.ShowOnNewClickButton', t.el);
        $target.toggle(); // shows if hidden, hides if visible

        // Add or remove requiredElem class based on visibility
        const isVisible = $target.is(':visible');
        $('select[argumentid="AccountsPaymentType"], input[argumentid="LedgerManagementAmount"]', t.el)
            .toggleClass('requiredElem', isVisible);
        // Toggle the required-error span next to both the amount input and payment type select
        $('.commonRemoveRequiredStaric', t.el).next('span.required-error').remove();
        $('.commonRemoveRequiredStaric', t.el).next().next('span.required-error').remove();

        $("input[value='D']", t.el).prop("checked", true);
        const today = new Date();
        const formattedDate = today.getDate().toString().padStart(2, '0') + '/' +
            (today.getMonth() + 1).toString().padStart(2, '0') + '/' +
            today.getFullYear();
        $('input[argumentid="AccountTransactionDate2"]', t.el).val(formattedDate);
        $(".amountInput, [argumentid='LedgerManagementReason']", t.el).val("");
        // Set dropdown to the first option
        $('select[argumentid="AccountsPaymentType"]', t.el).prop('selectedIndex', 0);

        const $icon = $('.Plus-Icon', t.el);
        if ($icon.hasClass('fa-plus')) {
            $icon.removeClass('fa-plus').addClass('fa-minus');
        } else {
            $icon.removeClass('fa-minus').addClass('fa-plus');
        }

        $('.show-on-service-select', t.el).hide().find('input').val('');
        $('.show-on-cheque-select', t.el).hide().find('input').val('');
    });

    $('select[argumentid="AccountsPaymentType"]',t.el).on('change', function () {
        // Check karte hain agar value 30718 (Service) hai
        
        if ($(this).val() === "30734") {
            $('.show-on-service-select', t.el).show();
            $('[argumentid="DueDate"]', t.el).val('');
            
        } else {
            // Agar doosri value select ho toh service row remove karo
            $('.show-on-service-select', t.el)
                .hide()
                .find('input, select, textarea')
                .val('');        }

        if ($(this).val() === "30732") {
            $('.show-on-cheque-select', t.el).show();
            $('[argumentid="ChequeDateAMT"]', t.el).val('');
            $('.CommonRequiredClass', t.el).addClass('requiredElem')
        } else {
            // Agar doosri value select ho toh service row remove karo
            $('.show-on-cheque-select', t.el).hide().find('input, select, textarea').val('');
            $('.CommonRequiredClass', t.el).removeClass('requiredElem')

        }
    });

    $('.CloseNewForm', t.el).click(function () {
        const $target = $('.ShowOnNewClickButton', t.el);
        $target.toggle(); // shows if hidden, hides if visible

        $("input[value='D']").prop("checked", true);
        $(".amountInput, [argumentid='LedgerManagementReason']", t.el).val("");
        // Set dropdown to the first option
        $('select[argumentid="AccountsPaymentType"]').prop('selectedIndex', 0);
        const $icon = $('.Plus-Icon', t.el);
        $icon.removeClass('fa-minus').addClass('fa-plus');
        $('.show-on-service-select', t.el).hide().val('');

    });


    $('.secondSaveBtn', t.el).on('click', function () {
        setTimeout(function () {
            $('[argumentid="LedgerManagementReason"]', t.el).val('');
            $('[argumentid="LedgerManagementAmount"]', t.el).val('');
        }, 2000)



    });

    $(".amountInput", t.el).on("blur", function () {
        
        let amount = $(this).val();
        if (amount !== "" && amount !== null && amount !== undefined) {
            formatAmount(this);
        }
    });


    $('.CloseTableNewForm', t.el).click(function () {
        $('.LineOfItemRow ', t.el).hide();
        $('.Plus-Icon', t.el).removeClass('fa-minus').addClass('fa-plus');
        $('.show-on-service-select', t.el).hide().find('input').val('');

    })

    $('.INS_Row_Save_Btn', t.el).on('click', function ()
    {
        
        
        let btn = $(this);
        let $targetRow = $(this).closest('tr.LineOfItemRow');

        // Reset any previous validation indicators
        $('.requiredElem', $targetRow).each(function () {
            $(this).siblings('.required-error').remove(); // Remove previous error indicators
        });

        // Check all required fields
        let isValid = true;
        $('.requiredElem', $targetRow).each(function () {
            let $element = $(this);
            let value = $element.val().trim();

            // Check if the field is empty
            if (value === '' || value === null) {
                isValid = false;

                if ($element.hasClass('date')) {
                    // Target the datepicker trigger and insert after it
                    $element.closest('td').find('.ui-datepicker-trigger')
                        .after('<span class="required-error" style="color: red; margin-left: 5px;">*</span>');
                } else {
                    // Default placement for other fields
                    $element.after('<span class="required-error" style="color: red; margin-left: 5px;">*</span>');
                }
            }
        });

        // If any required field is empty, stop further execution
        if (!isValid) {
            return false;
        }
        
        
        var submit =  t.submit(btn);
        if (submit == false) {
            return false;
        }
        $("input[value='D']").prop("checked", true);
        $(".amountInput, [argumentid='LedgerManagementReason']", t.el).val("");
        // Set dropdown to the first option
        $('select[argumentid="AccountsPaymentType"]').prop('selectedIndex', 0);

        
        const $target = $('.ShowOnNewClickButton', t.el);
        $target.toggle(); // shows if hidden, hides if visible
        $('.Plus-Icon', t.el).removeClass('fa-minus').addClass('fa-plus');



    });


    // Add event listeners to required fields to remove asterisk when filled
    $('.requiredElem', t.el).on('input change blur', function () {
        debugger
        let $element = $(this);
        let value = $element.val().trim();

        // Remove the asterisk if the field is no longer empty
        if (value !== '' && value !== null )  {
            $element.siblings('.required-error').remove();
        } else if (value === '' || value === null)
        {
            isValid = false;

            if ($element.hasClass('date')) {
                // Target the datepicker trigger and insert after it
                $element.closest('td').find('.ui-datepicker-trigger')
                    .after('<span class="required-error" style="color: red; margin-left: 5px;">*</span>');
            } else {
                // Default placement for other fields
                $element.after('<span class="required-error" style="color: red; margin-left: 5px;">*</span>');
            }
        }
    });


    t.on('onLoadedValues', function (args)
    {
        
        var res = args.res;
        if (res.status == 'OK') {
            
            var recId = res.Response.Rows[0].RecId;


            if (res.Response.Rows.length == 1) {
                setTimeout(function () { FetchLedegerAmounts(res, t) }, 1000)
            }
         

            let amount = args.res.Response.Rows?.[0]?.LedgerManagementAmount || 0;
            //$(".amountInput").val(amount.toFixed(3));

            $('.firstSaveBtn', t.el).hide();
            $('.secondSaveBtn', t.el).show();
            $('.trTransaction', t.el).show();

            //$('.UPD_Row_Save_Btn', t.el).hide()
            //$('.INS_Row_Save_Btn', t.el).show()

            $('.HideOnNewForm', t.el).show();
            $('.tofix', t.el).each(function () {
                
                //var val = parseFloat($(this).text()) || 0;
                /*$(this).text(val.toFixed(3));*/
                formatAmount(this);
            });


        }




    });


    t.on('show', function (args) {



        if (t.FormMode == 'new') {

            let zero = 0;
            // $(".amountInput").val('0.000')

            $('.firstSaveBtn', t.el).show();
            $('.secondSaveBtn', t.el).hide();

            var tblUFL = $('table.LedegerAmountsTable', t.el);
            $('.ItemTableRow', tblUFL).remove();
            $('.NoRecordsTR', tblUFL).show();

            $('.trTransaction', t.el).hide();

            var dt = new Date();
            $('[argumentid="TransactionDate"]', t.el).val(dt.getDate() + '/' + (dt.getMonth() + 1) + '/' + dt.getFullYear());

            //$('.UPD_Row_Save_Btn', t.el).hide()
            //$('.INS_Row_Save_Btn', t.el).show()

            $('.HideOnNewForm', t.el).hide();
        }
    });


    function FetchLedegerAmounts(res, t) {
        if (res.status === 'OK' && res.Response.Rows.length > 0) {

            //$('[argumentid="GrandTotal"]', t.el).text('0.000') ;
            //$('[argumentid="TotalDebit"]', t.el).text('0.000') ;
            //$('[argumentid="TotalCredit"]', t.el).text('0.000') ;

            //$('[argumentid="DebitCreditTotal"]', t.el).text('0.000');

            const rows = res.Response.Rows;
            let tblRowsHTML = "";
            const tblUFL = $('table.LedegerAmountsTable', t.el);
            $('.ItemTableRow', tblUFL).remove();
            // Show relevant rows and hide 'No Records' row
            $('.ItemTableRow', tblUFL).show();
            $('.NoRecordsTR', tblUFL).hide();



            // Iterate over main rows
            rows.forEach(row => {
                const recId = row.RecId;
                const TransactionID = row.LedgerManagementRecCode

                const params = {
                    Command: 'SEL_Account_LedgerManagement_Amounts',
                    LedgerAmountId: recId
                };

                // API Call
                ServerCall(params, function (res) {
                    const response = decJSON(res);

                    if (response.status === 'OK' && response.Response.Rows.length > 0)
                    {
                        response.Response.Rows.forEach(innerRow => {
                            //let totalDebit = 0;
                            //let totalCredit = 0;

                            const AmountRecId = innerRow.AmountRecId;
                            const LedgerAmountCredit = parseFloat(innerRow.LedgerAmountCredit) || 0;
                            const LedgerAmountDebit = parseFloat(innerRow.LedgerAmountDebit) || 0;

                            const GrandTotal = innerRow.GrandTotal;
                            const TotalLedgerAmount = innerRow.TotalLedgerAmount;
                            const LedgerManagementRecCode = innerRow.LedgerManagementRecCode
                            const TransactionDate = innerRow.TransactionDate
                            const AccountsPaymentType = innerRow.AccountsPaymentType
                            const AccountsPaymentTypeId = innerRow.AccountsPaymentTypeId
                            const TotalDebit = parseFloat(innerRow.TotalDebit) || 0;
                            const TotalCredit = parseFloat(innerRow.TotalCredit) || 0;
                            const DueDateSetInCtrl = innerRow.DueDateSetInCtrl;
                            const BankNameAMT = innerRow.BankNameAMT;
                            const ChequeFromAMT = innerRow.ChequeFromAMT;
                            const ChequeNoAMT = innerRow.ChequeNoAMT;
                            const ChequeDateAMT = innerRow.ChequeDateAMT

                            const DebitCreditTotal = innerRow.DebitCreditTotal
                            const RecStatus = innerRow.RecStatus ?? '';
                            const Reason = innerRow.Reason
                            //const CreatedBy = innerRow.CreatedBy;
                            //const DateCreated = innerRow.DateCreated;
                            const isDeleted = RecStatus?.trim().toLowerCase() === 'deleted';

                            //if (!isDeleted) {
                            //    totalDebit += LedgerAmountDebit;
                            //    totalCredit += LedgerAmountCredit;
                            //}

                            //const DebitCreditTotall = Math.abs(totalCredit - totalDebit);



                            $('[argumentid="GrandTotal"]', t.el).text(GrandTotal.toFixed(3)) || 0;
                            $('[argumentid="TotalDebit"]', t.el).text(TotalDebit.toFixed(3)) || 0;
                            $('[argumentid="TotalCredit"]', t.el).text(TotalCredit.toFixed(3)) || 0;

                            $('[argumentid="DebitCreditTotal"]', t.el).text(DebitCreditTotal.toFixed(3)) || 0;

                            
                            $('[argumentid="AmountRecId"]', t.el).text(AmountRecId);
                            $('[argumentid="DueDateSetInCtrl"]', t.el).text(DueDateSetInCtrl);

                            //$('[argumentid="BankNameAMT"]', t.el).text(BankNameAMT);
                            $('[argumentid="ChequeFromAMT"]', t.el).text(ChequeFromAMT);
                            $('[argumentid="ChequeNoAMT"]', t.el).text(ChequeNoAMT);
                            $('[argumentid="ChequeDateAMT"]', t.el).text(ChequeDateAMT);

                            // Generate table row
                            let rowStyle = '';
                            let disabledAttr = '';

                            rowStyle = isDeleted
                                ? 'text-decoration: line-through; background: white; color: black;'
                                : 'background: white; color: black;';

                            disabledAttr = isDeleted ? 'pointer-events: none; opacity: 0.5;' : '';

                            tblRowsHTML += `
                            <tr class="ItemTableRow" style="white-space: nowrap" evenrowcss="w-grid-row-odd" oddrowcss="w-grid-row-odd" hoverrowcss="">
                                <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; ${rowStyle}">${LedgerManagementRecCode}</td>
                                <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; ${rowStyle}">${TransactionDate}</td>
                                <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px;  ${rowStyle};color:red;">${LedgerAmountDebit.toFixed(3)}</td>
                                <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px;color:green; ${rowStyle};color:green;">${LedgerAmountCredit.toFixed(3)}</td>
                                <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; ${rowStyle}" AccountsPaymentTypeId="${AccountsPaymentTypeId}">${AccountsPaymentType}</td>
                                <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; ${rowStyle}">${RecStatus}</td>
                                <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; ${rowStyle}">${Reason}</td>
                                <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; ${rowStyle}" templateid="RowEditForm" AmountRecId="${AmountRecId}">
                                    <div class="action-icons" style="${disabledAttr}">

                                        <i class="LOVPopupOnClick fa-solid fa-pen-to-square edit-icon" title="Edit" AmountRecId="${AmountRecId}"></i>
                                        <span class="pipe">|</span>
                                        <i class="fa-solid fa-trash delete-icon" title="Delete" AmountRecId="${AmountRecId}"></i>

                                    </div>
                                </td>
                            </tr>
                            `;

                                        //                            <i class="fa-solid fa-square-plus expand-icon"></i>
                                        //<span class="pipe">|</span>

                            //                            <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${CreatedBy}</td>
                            //<td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${DateCreated}</td>
                        });

                        // Inject rows into table

                        $('tbody', tblUFL).html(tblRowsHTML);

                        $('.edit-icon', tblUFL).click(function () {

                            $('.Plus-Icon', t.el).removeClass('fa-minus').addClass('fa-plus');
                            $('.show-on-service-select', t.el).hide().val('');
                            var btn = $(this);

                            

                            //var DeleteUploadFile = AsyncWidgets.WidgetScripts.frmSalesContracts.DeleteUploadFile;
                            //DeleteUploadFile(t, recId, fileName);
                            EditRow(this);
                            // Remove the row from the table
                            //var curTR = btn.closest('tr');//.remove();

                            //if ($('tr', curTR.parent()).length == 1) {
                            //    // curTR.remove();
                            //    $('.ItemTR', tblUFL).hide();
                            //    $('.NoRecordsTR', tblUFL).show();
                            //    //return;
                            //}
                            //curTR.remove();

                        }); // end of click of Edit button event
                        $('.delete-icon', tblUFL).click(function () {
                            var btn = $(this);
                            var RecId = btn.attr("AmountRecId");

                            Swal.fire({
                                text: "Do you really want to delete this record?",
                                showCancelButton: true,
                                confirmButtonColor: '#28a745',
                                cancelButtonColor: '#dc3545',
                                confirmButtonText: 'Yes',
                                cancelButtonText: 'No',
                                customClass: {
                                    popup: 'swal2-custom-popup',
                                    confirmButton: 'swal2-same-size-btn',
                                    cancelButton: 'swal2-same-size-btn',
                                    htmlContainer: 'swal2-text-bigger'
                                }
                            })

                              .then((result) => {
                                if (result.isConfirmed) {
                                    DeleteRow(t, RecId);

                                    var curTR = btn.closest('tr');

                                    if ($('tr', curTR.parent()).length == 1) {
                                        $('.ItemTR', tblUFL).hide();
                                        $('.NoRecordsTR', tblUFL).show();
                                    }

                                    curTR.remove();

                                    //Swal.fire(
                                    //    'Deleted!',
                                    //    'The record has been deleted.',
                                    //    'success'
                                    //)
                                }
                            });
                        });
                        $('.expand-icon', tblUFL).click(function () {

                            
                            $('.Plus-Icon', t.el).removeClass('fa-minus').addClass('fa-plus');
                            var btn = $(this);

                            ExpandRow(btn);
                        })
                        
                    } else {
                        setTimeout(() => {

                            $('table.LedegerAmountsTable .ItemTableRow').hide();
                            $('table.LedegerAmountsTable .NoRecordsTR').show();
                        }, 1000);
                    }
                }, 'GetData');
            });

        } else
        {
            setTimeout(() => {
                
                $('table.LedegerAmountsTable .ItemTableRow').hide();
                $('table.LedegerAmountsTable .NoRecordsTR').show();
            }, 1000);
        }
    }

 
    let previousYellowRow = null; // Track the previously yellow row
    function EditRow(button) {
        let t = this
       

        var curTR = $(button).closest('tr'); // Get current row
        $('.ShowOnNewClickButton', t.el).hide();
        ////curTR.find('td[LedgerAmountId]').addClass('disabled-td'); // Add CSS class
        //$('td[AmountRecId]').addClass('disabled-td');


        //
 

        
        var amountRecId = curTR.find('td[AmountRecId]').attr('AmountRecId');

        $('.removeOnEditMode', '.trTableItemRow').remove();
        
        // Hide any previously visible testTR rows
        

        if (previousYellowRow && previousYellowRow[0] !== curTR[0]) {
            $('td', previousYellowRow).css('background', '#ffffff');
        }
        // Find the row where the button is clicked
        var $currentRow = $(button).closest('tr');

        // Insert testTR row right after the clicked row
        
        //var $testRow = $('.testTR:first', t.el).clone(); // Clone the testTR template
        //$testRow.insertAfter($currentRow).show();
 
        $('.removeOnEditMode', t.el).addClass('testTR LineOfItemTestRow');
        $('td', $currentRow).css('background', '#fdf5cf');
        previousYellowRow = $currentRow;
        //$currentRow.css('background', '#fdf5cf');
        var $testRow = $('.testTR:first', t.el).clone().css('background', '#fdf5cf').insertAfter($currentRow).show();
        
        $('.removeOnEditMode', t.el).removeClass('testTR LineOfItemTestRow');
               // Fetch values
        var TransactionID = curTR.find('td:nth-child(1)').text().trim();
        var TransactionDate = curTR.find('td:nth-child(2)').text().trim();
        var debitAmount = curTR.find('td:nth-child(3)').text().trim(); // Debit Amount
        var creditAmount = curTR.find('td:nth-child(4)').text().trim(); // Credit Amount
        var reason = curTR.find('td:nth-child(7)').text().trim(); // Reason
        /*var PaymentType = curTR.find('td:nth-child(6)').text().trim(); // */

        // Determine Transaction Type
        var transactionType = debitAmount !== "0.000" ? "D" : "C";

        // Determine which amount to set
        var finalAmount = debitAmount !== "0.000" ? debitAmount : creditAmount;

        // Set values in form
        
        $('[argumentid="TransactionID2"]', $testRow).text(TransactionID);
        $('span[argumentid="AccountTransactionDate2"]', $testRow).text(TransactionDate);
        $('input[argumentid="LedgerManagementAmount2"]', $testRow).val(finalAmount);
        $('textarea[argumentid="LedgerManagementReason2"]', $testRow).val(reason);
        

        // Set dropdown value

        var paymentTypeId = curTR.find('td[AccountsPaymentTypeId]', t.el).attr('AccountsPaymentTypeId');

        // Ensure value exists before setting
        if (paymentTypeId) {
            $('select[argumentid="AccountsPaymentType2"]', $testRow).val(paymentTypeId).trigger('change');


        }

       
        const $targetRow = $testRow;
            
            // Saare radio buttons ko unchecked karein
            $targetRow.find('input[name="TransactionType2"]').prop('checked', false);

            // Jo value match kare usko checked karein
            $targetRow.find('input[name="TransactionType2"][value="' + transactionType + '"]').prop('checked', true);
        

        $('.CloseTableEditForm', $testRow).click(function () {
            $('.removeOnEditMode', t.el).addClass('testTR LineOfItemTestRow');
            const $target = $('.testTR', t.el);
            $target.toggle(); // shows if hidden, hides if visible
            $('td', $currentRow).css('background', '#ffffff');
            // Clear previousYellowRow
            previousYellowRow = null;
            $('.testTR input[name="TransactionType2"][value="D"]').prop("checked", true);
            $(".amountInput, [argumentid='LedgerManagementReason2']", t.el).val("");
            // Set dropdown to the first option
            $('select[argumentid="AccountsPaymentType2"]').prop('selectedIndex', 0);
            $('.testTR').hide();
            $('.show-on-service-select', t.el).hide().val('');
        });



        $('.UPD_Row_Save_Btn', $testRow).on('click', function ()
        {
            let btn = $(this);


            $('.requiredElem', $testRow).each(function () {
                $(this).siblings('.required-error').remove(); // Remove previous error indicators
            });

            // Check all required fields
            let isValid = true;
            $('.requiredElem', $testRow).each(function () {
                let $element = $(this);
                let value = $element.val().trim();

                // Check if the field is empty
                if (value === '' || value === null) {
                    isValid = false;

                    if ($element.hasClass('date')) {
                        // Target the datepicker trigger and insert after it
                        $element.closest('td').find('.ui-datepicker-trigger')
                            .after('<span class="required-error" style="color: red; margin-left: 5px;">*</span>');
                    } else {
                        // Default placement for other fields
                        $element.after('<span class="required-error" style="color: red; margin-left: 5px;">*</span>');
                    }
                }
               
            });

            // If any required field is empty, stop further execution
            if (!isValid) {
                return false;
            }

            $('.removeOnEditMode', t.el).addClass('testTR LineOfItemTestRow');
            //var params = { Command: 'UPD_Account_LedgerManagement_Amounts', AmountRecId: AmountRecId, DBAction: 'UpdateRow' };


            // API Call
            ServerCallCtx($('.LineOfItemTestRow', '.LedegerAmountsTable')[0], { Command: 'UPD_Account_LedgerManagement_Amounts', AmountRecId: amountRecId, DBAction: 'UpdateRow' }, function (res) {

                var res = decJSON(res)
                
                var parts = res.Response.split('||');
                var code = parts[0];
                var messageStatus = parts[1];
                var message = parts[2];


                $.showMessage(message);


            }, 'Search');


            //const params = {
            //    Command: 'SEL_Account_LedgerManagement_Amounts',
            //    LedgerAmountId: amountRecId
            //};

            // API Call
            //ServerCall(params, function (res) {
            //    
            //    var res = res.res;
            //    if (res.status == 'OK') {

            //        FetchLedegerAmounts(res, t)
            //    }

            //}, 'GetData');



            // Reset form fields
            $("input[value='D']", $testRow).prop("checked", true);
            $(".amountInput, [argumentid='LedgerManagementReason']", $testRow).val("");
            $('select[argumentid="AccountsPaymentType"]', $testRow).prop('selectedIndex', 0);

            // Hide the edit form (testTR)
            $('.testTR', t.el).hide();

            // Reset the clicked row's background to white
            $('td', $currentRow).css('background', '#ffffff');
            // Clear previousYellowRow
            previousYellowRow = null;

            setTimeout(function () {
                let a = AsyncWidgets.get('frmLedgerManagement', t.el).Requery();

            }, 500)
        });






        // Add event listeners to required fields to remove asterisk when filled
        $('.requiredElem', $testRow).on('input change blur', function () {
            let $element = $(this);
            let value = $element.val().trim();

            // Remove the asterisk if the field is no longer empty
            if (value !== '' && value !== null) {
                $element.siblings('.required-error').remove();
            }
        });



            
            //if ($('.PaymentTypeDD').val() === '30718') {
            //    console.log('Value 30718 (Service) is selected');
            //} else {
            //    console.log('Value 30718 is not selected');
            //}
            
            const $select = $('.PaymentTypeDD', $testRow);
            const selectedValue = $select.val(); // Ye selected option ki value deta hai
            const selectedText = $select.find('option[value="' + selectedValue + '"]').text(); // Ye selected option ka text deta hai
            if (selectedValue === '30718')
            {
                var DueDate = $('[argumentid="DueDateSetInCtrl"]', t.el).text();
                $('[argumentid="DueDate2"]', $testRow).val(DueDate);
                $('.show-on-service-select', $testRow).show();

            } else if (selectedValue === '30717') {
                var BankNameAMT = $('[argumentid="BankNameAMT"]', t.el).first().text();;
                var ChequeFromAMT = $('[argumentid="ChequeFromAMT"]', t.el).first().text();;
                var ChequeNoAMT = $('[argumentid="ChequeNoAMT"]', t.el).first().text();;
                var ChequeDateAMT = $('[argumentid="ChequeDateAMT"]', t.el).first().text();;

                $('[argumentid="BankNameAMT2"]', $testRow).val(BankNameAMT);
                $('[argumentid="ChequeFromAMT2"]', $testRow).val(ChequeFromAMT);
                $('[argumentid="ChequeNoAMT2"]', $testRow).val(ChequeNoAMT);
                $('[argumentid="ChequeDateAMT2"]', $testRow).val(ChequeDateAMT);

                $('.show-on-cheque-select', $testRow).show();
            }

            else
            {
                $('.show-on-service-select', $testRow).hide().find('input, select, textarea').val('');
                $('.show-on-cheque-select', $testRow).hide().find('input, select, textarea').val('');

            }
      


        $('select[argumentid="AccountsPaymentType2"]', $testRow).on('change', function () {
            // Check karte hain agar value 30718 (Service) hai
            
            if ($(this).val() === "30734") {
                $('.show-on-service-select', $testRow).show();
                $('[argumentid="DueDate"]', $testRow).val('');

            } else {
                // Agar doosri value select ho toh service row remove karo
                $('.show-on-service-select', $testRow)
                    .hide()
                    .find('input, textarea')
                    .val('');
            }

            if ($(this).val() === "30732") {
                $('.show-on-cheque-select', $testRow).show();
                $('[argumentid="ChequeDateAMT"]', t.el).val('');
                $('.CommonRequiredClass', $testRow).addClass('requiredElem')
            } else {
                // Agar doosri value select ho toh service row remove karo
                $('.show-on-cheque-select', $testRow).hide().find('input,  textarea').val('');
                $('.CommonRequiredClass', $testRow).removeClass('requiredElem')

            }
        });
    }


    function DeleteRow(t, AmountRecId) {
        
        var recId = $('[argumentid="RecId"]',t.el).text()
        var params = { Command: 'UPD_Account_LedgerManagement_Amounts', AmountRecId: AmountRecId, RecId: recId, DBAction: 'DeleteRow' };
        SInfo = getForm(null, null, params);
        var inv = new AsyncWidgets.RAInvoker();
        inv.on('onSuccess', function (res) {
            var res = decJSON(res);
            if (res.status == 'OK') {
                var response = res.Response || '';
                var msg = response.split('||');
                $.showMessage(` ${msg[2]}`);

            } else {
                $.showMessage(`not Delete `);

            }
            $(t.el).unmask();
        });
        inv.invokeRA({ params: ["ActorId", "DataHelper", "ActionId", "DataAction", "ServiceInfo", SInfo] });
        setTimeout(function () {
            let a = AsyncWidgets.get('frmLedgerManagement', t.el).Requery();

        }, 500)
    }

    function ExpandRow(btn)
    {
        
        const $icon =btn; // The clicked icon
        const $parentRow = $icon.closest('tr'); // The parent row
        const amountRecId = $icon.closest('td').attr('AmountRecId'); // Get AmountRecId for uniqueness
        const childRowId = `child-row-${amountRecId}`; // Unique ID for child row
        const $childRow = $parentRow.next(`#${childRowId}`); // Check for existing child row

        // If the clicked row's child is already open, toggle it off
        if ($childRow.length && $childRow.is(':visible')) {
            $childRow.hide();
            $icon.removeClass('fa-square-minus').addClass('fa-square-plus');
            return;
        }

        // Close any other open child rows and reset their icons
        $('.child-row').remove();
        $('.expand-icon').removeClass('fa-square-minus').addClass('fa-square-plus');

        // If no child row exists for this parent, create and insert it
        if (!$childRow.length)
        {
            const childRowHTML = `
                <tr id="${childRowId}" class="child-row">
                    <td colspan="8" style="padding: 10px; background: #f9f9f9;">
                        <table style="width: 100%; border-collapse: collapse;">
                            <thead>
                                <tr style="background: #e0e0e0;">
                                    <th style="padding: 5px;">Child Column 1</th>
                                    <th style="padding: 5px;">Child Column 2</th>
                                    <th style="padding: 5px;">Child Column 3</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td style="padding: 5px;">Data 1</td>
                                    <td style="padding: 5px;">Data 2</td>
                                    <td style="padding: 5px;">Data 3</td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            `;
            $parentRow.after(childRowHTML);
        } else {
            // If child row exists but was hidden, show it
            $childRow.show();
        }

        // Set the icon to minus for the clicked row
        $icon.removeClass('fa-square-plus').addClass('fa-square-minus');
        
        
    }
}