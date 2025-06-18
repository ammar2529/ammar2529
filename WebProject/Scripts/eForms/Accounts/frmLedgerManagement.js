AsyncWidgets.WidgetScripts.frmLedgerManagement = function (obj)
{
    var t = obj;
    AsyncWidgets.WidgetScripts.frmLedgerManagement.t = t;

    $('.new-wrap', t.el).click(function () {
        debugger
        const $target = $('.ShowOnNewClickButton', t.el);
        $target.toggle(); // shows if hidden, hides if visible

        $("input[value='D']").prop("checked", true);
        $(".amountInput, [argumentid='LedgerManagementReason']", t.el).val("");
        // Set dropdown to the first option
        $('select[argumentid="AccountsPaymentType"]').prop('selectedIndex', 0);
    });

    $('.CloseNewForm', t.el).click(function () {
        const $target = $('.ShowOnNewClickButton', t.el);
        $target.toggle(); // shows if hidden, hides if visible

        $("input[value='D']").prop("checked", true);
        $(".amountInput, [argumentid='LedgerManagementReason']", t.el).val("");
        // Set dropdown to the first option
        $('select[argumentid="AccountsPaymentType"]').prop('selectedIndex', 0);
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




    $('.INS_Row_Save_Btn', t.el).on('click', function () {
        

        let btn = $(this);

        debugger
        t.submit(btn);
        //if (submit == false) {
        //    return false;
        //}
        //$("input[value='D']").prop("checked", true);
        //$(".amountInput, [argumentid='LedgerManagementReason']", t.el).val("");
        //// Set dropdown to the first option
        //$('select[argumentid="AccountsPaymentType"]').prop('selectedIndex', 0);

        
        //const $target = $('.ShowOnNewClickButton', t.el);
        //$target.toggle(); // shows if hidden, hides if visible

    });

    t.on('onLoadedValues', function (args)
    {
        var res = args.res;
        if (res.status == 'OK') {
            
            FetchLedegerAmounts(res, t)

            let amount = args.res.Response.Rows?.[0]?.LedgerManagementAmount || 0;
            //$(".amountInput").val(amount.toFixed(3));

            $('.firstSaveBtn', t.el).hide();
            $('.secondSaveBtn', t.el).show();
            $('.trTransaction', t.el).show();

            //$('.UPD_Row_Save_Btn', t.el).hide()
            //$('.INS_Row_Save_Btn', t.el).show()

            $('.HideOnNewForm', t.el).show();

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

            $('.UPD_Row_Save_Btn', t.el).hide()
            $('.INS_Row_Save_Btn', t.el).show()

            $('.HideOnNewForm', t.el).hide();
        }
    });


    function FetchLedegerAmounts(res, t) {
        if (res.status === 'OK' && res.Response.Rows.length > 0) {

            $('[argumentid="GrandTotal"]', t.el).text('0.000') ;
            $('[argumentid="TotalDebit"]', t.el).text('0.000') ;
            $('[argumentid="TotalCredit"]', t.el).text('0.000') ;

            $('[argumentid="DebitCreditTotal"]', t.el).text('0.000');

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
                            let totalDebit = 0;
                            let totalCredit = 0;

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

                            const DebitCreditTotal = innerRow.DebitCreditTotal
                            const RecStatus = innerRow.RecStatus ?? '';
                            const Reason = innerRow.Reason
                            //const CreatedBy = innerRow.CreatedBy;
                            //const DateCreated = innerRow.DateCreated;
                            const isDeleted = RecStatus?.trim().toLowerCase() === 'deleted';

                            if (!isDeleted) {
                                totalDebit += LedgerAmountDebit;
                                totalCredit += LedgerAmountCredit;
                            }

                            const DebitCreditTotall = Math.abs(totalCredit - totalDebit);



                            $('[argumentid="GrandTotal"]', t.el).text(GrandTotal.toFixed(3)) || 0;
                            $('[argumentid="TotalDebit"]', t.el).text(totalDebit.toFixed(3)) || 0;
                            $('[argumentid="TotalCredit"]', t.el).text(totalCredit.toFixed(3)) || 0;

                            $('[argumentid="DebitCreditTotal"]', t.el).text(DebitCreditTotall.toFixed(3)) || 0;

                            
                            $('[argumentid="AmountRecId"]', t.el).text(AmountRecId);
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
                                <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; ${rowStyle}">${LedgerAmountDebit.toFixed(3)}</td>
                                <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; ${rowStyle}">${LedgerAmountCredit.toFixed(3)}</td>
                                <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; ${rowStyle}" AccountsPaymentTypeId="${AccountsPaymentTypeId}">${AccountsPaymentType}</td>
                                <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; ${rowStyle}">${RecStatus}</td>
                                <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; ${rowStyle}">${Reason}</td>
                                <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; ${rowStyle}" templateid="RowEditForm" AmountRecId="${AmountRecId}">
                                    <div class="action-icons" style="${disabledAttr}">
                                        <i class="LOVPopupOnClick fa-solid fa-pen-to-square edit-icon" title="Edit" AmountRecId="${AmountRecId}" ></i>
                                        <span class="pipe">|</span>
                                        <i class="fa-solid fa-trash delete-icon" title="Delete" AmountRecId="${AmountRecId}"></i>
                                    </div>
                                </td>
                            </tr>
                            `;

                            //                            <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${CreatedBy}</td>
                            //<td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${DateCreated}</td>
                        });

                        // Inject rows into table

                        $('tbody', tblUFL).html(tblRowsHTML);

                        $('.edit-icon', tblUFL).click(function () {
                            
                            var btn = $(this);

                            debugger

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
                                title: 'Are you sure?',
                                text: "Do you really want to delete this record?",
                                icon: 'warning',
                                showCancelButton: true,
                                confirmButtonColor: '#d33',
                                cancelButtonColor: '#3085d6',
                                confirmButtonText: 'Yes, delete it!'
                            }).then((result) => {
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

 

    function EditRow(button) {
        let t = this
        var curTR = $(button).closest('tr'); // Get current row
        
        ////curTR.find('td[LedgerAmountId]').addClass('disabled-td'); // Add CSS class
        //$('td[AmountRecId]').addClass('disabled-td');


        //debugger
 

        
        var amountRecId = curTR.find('td[AmountRecId]').attr('AmountRecId');



        // Hide any previously visible testTR rows
        $('.testTR', '.LedegerAmountsTable').remove();


        // Find the row where the button is clicked
        var $currentRow = $(button).closest('tr');

        // Insert testTR row right after the clicked row
        
        var $testRow = $('.testTR:first', t.el).clone(); // Clone the testTR template
        $testRow.insertAfter($currentRow).show();

        //$('.UPD_Row_Save_Btn', t.el).show()
        //$('.INS_Row_Save_Btn', t.el).hide()

        
               // Fetch values
        var debitAmount = curTR.find('td:nth-child(3)').text().trim(); // Debit Amount
        var creditAmount = curTR.find('td:nth-child(4)').text().trim(); // Credit Amount
        var reason = curTR.find('td:nth-child(7)').text().trim(); // Reason
        /*var PaymentType = curTR.find('td:nth-child(6)').text().trim(); // */

        // Determine Transaction Type
        var transactionType = debitAmount !== "0.000" ? "D" : "C";

        // Determine which amount to set
        var finalAmount = debitAmount !== "0.000" ? debitAmount : creditAmount;

        // Set values in form
        $('input[argumentid="LedgerManagementAmount2"]', t.el).val(finalAmount);
        $('textarea[argumentid="LedgerManagementReason2"]', t.el).val(reason);
        

        // Set dropdown value

        var paymentTypeId = curTR.find('td[AccountsPaymentTypeId]', t.el).attr('AccountsPaymentTypeId');

        // Ensure value exists before setting
        if (paymentTypeId) {
            $('select[argumentid="AccountsPaymentType2"]', t.el).val(paymentTypeId).trigger('change');


        }

       
            const $targetRow = $('tr.testTR', '.LedegerAmountsTable');
            
            // Saare radio buttons ko unchecked karein
            $targetRow.find('input[name="TransactionType2"]').prop('checked', false);

            // Jo value match kare usko checked karein
            $targetRow.find('input[name="TransactionType2"][value="' + transactionType + '"]').prop('checked', true);
        

        $('#CloseTableEditForm', '.testTR').click(function () {
            
            const $target = $('.testTR', t.el);
            $target.toggle(); // shows if hidden, hides if visible
            debugger
            $('.testTR input[name="TransactionType2"][value="D"]').prop("checked", true);
            $(".amountInput, [argumentid='LedgerManagementReason2']", t.el).val("");
            // Set dropdown to the first option
            $('select[argumentid="AccountsPaymentType2"]').prop('selectedIndex', 0);
            $('.testTR').hide();
        });



        $('.UPD_Row_Save_Btn', '.LedegerAmountsTable').on('click', function () {
            let btn = $(this);
            debugger
            //var params = { Command: 'UPD_Account_LedgerManagement_Amounts', AmountRecId: AmountRecId, DBAction: 'UpdateRow' };

            // API Call
            ServerCallCtx($('.LineOfItemTestRow', '.LedegerAmountsTable')[0], { Command: 'UPD_Account_LedgerManagement_Amounts', AmountRecId: amountRecId, DBAction: 'UpdateRow' }, function (res) {



 

            }, 'Search');


            const params = {
                Command: 'SEL_Account_LedgerManagement_Amounts',
                LedgerAmountId: amountRecId
            };

            // API Call
            //ServerCall(params, function (res) {
            //    debugger
            //    var res = res.res;
            //    if (res.status == 'OK') {

            //        FetchLedegerAmounts(res, t)
            //    }

            //}, 'GetData');



            // Reset form fields
            $("input[value='D']", t.el).prop("checked", true);
            $(".amountInput, [argumentid='LedgerManagementReason']", t.el).val("");
            $('select[argumentid="AccountsPaymentType"]', t.el).prop('selectedIndex', 0);

            // Hide the edit form (testTR)
            $('.testTR', t.el).hide();

            let a = AsyncWidgets.get('frmLedgerManagement', t.el).Requery();
        });
 
    }


    function DeleteRow(t, AmountRecId) {
        
        var params = { Command: 'UPD_Account_LedgerManagement_Amounts', AmountRecId: AmountRecId, DBAction: 'DeleteRow' };
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
        let a = AsyncWidgets.get('frmLedgerManagement',t.el).Requery();
    }
}