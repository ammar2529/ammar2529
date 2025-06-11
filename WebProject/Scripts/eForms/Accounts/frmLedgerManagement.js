AsyncWidgets.WidgetScripts.frmLedgerManagement = function (obj)
{
    var t = obj;
    AsyncWidgets.WidgetScripts.frmLedgerManagement.t = t;

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


    $('.UPD_Row_Save_Btn', t.el).on('click', function () {
        

        let btn = $(this);

        t.submit(btn);

        $('.UPD_Row_Save_Btn', t.el).hide()
        $('.INS_Row_Save_Btn', t.el).show()
        $("input[value='D']").prop("checked", true);
        $(".amountInput, [argumentid='LedgerManagementReason']", t.el).val("");
        // Set dropdown to the first option
        $('select[argumentid="AccountsPaymentType"]').prop('selectedIndex', 0);



    });

    $('.INS_Row_Save_Btn', t.el).on('click', function () {
        

        let btn = $(this);

        t.submit(btn);
        $("input[value='D']").prop("checked", true);
        $(".amountInput, [argumentid='LedgerManagementReason']", t.el).val("");
        // Set dropdown to the first option
        $('select[argumentid="AccountsPaymentType"]').prop('selectedIndex', 0);



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

            $('.UPD_Row_Save_Btn', t.el).hide()
            $('.INS_Row_Save_Btn', t.el).show()

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

                            const AmountRecId = innerRow.AmountRecId;
                            const LedgerAmountCredit = innerRow.LedgerAmountCredit;
                            const LedgerAmountDebit = innerRow.LedgerAmountDebit;
                            const GrandTotal = innerRow.GrandTotal;
                            const TotalLedgerAmount = innerRow.TotalLedgerAmount;
                            const LedgerManagementRecCode = innerRow.LedgerManagementRecCode
                            const TransactionDate = innerRow.TransactionDate
                            const AccountsPaymentType = innerRow.AccountsPaymentType
                            const AccountsPaymentTypeId = innerRow.AccountsPaymentTypeId
                            const TotalDebit = innerRow.TotalDebit
                            const TotalCredit = innerRow.TotalCredit

                            const DebitCreditTotal = innerRow.DebitCreditTotal
                            const Reason = innerRow.Reason
                            //const CreatedBy = innerRow.CreatedBy;
                            //const DateCreated = innerRow.DateCreated;
                            $('[argumentid="GrandTotal"]', t.el).text(GrandTotal.toFixed(3)) || 0;
                            $('[argumentid="TotalDebit"]', t.el).text(TotalDebit.toFixed(3)) || 0;
                            $('[argumentid="TotalCredit"]', t.el).text(TotalCredit.toFixed(3)) || 0;

                            $('[argumentid="DebitCreditTotal"]', t.el).text(DebitCreditTotal.toFixed(3)) || 0;

                            
                            $('[argumentid="AmountRecId"]', t.el).text(AmountRecId);
                            // Generate table row
                            tblRowsHTML += `
                            <tr class="ItemTableRow" style="white-space: nowrap" evenrowcss="w-grid-row-odd" oddrowcss="w-grid-row-odd" hoverrowcss="">
                                <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${LedgerManagementRecCode}</td>
                                <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${TransactionDate}</td>
                                <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${LedgerAmountDebit.toFixed(3)}</td>
                                <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${LedgerAmountCredit.toFixed(3)}</td>
                                <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;" AccountsPaymentTypeId="${AccountsPaymentTypeId}" >${AccountsPaymentType}</td>
                                <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${Reason} </td>
                                <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;"  AmountRecId="${AmountRecId}">
                                    <div class="action-icons">
                                        <i class="fa-solid fa-pen-to-square edit-icon"  title="Edit" AmountRecId="${AmountRecId}"></i>
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
                            debugger
                            var btn = $(this);



                            //var DeleteUploadFile = AsyncWidgets.WidgetScripts.frmSalesContracts.DeleteUploadFile;
                            //DeleteUploadFile(t, recId, fileName);
                            EditRow(this);
                            // Remove the row from the table
                            var curTR = btn.closest('tr');//.remove();

                            if ($('tr', curTR.parent()).length == 1) {
                                // curTR.remove();
                                $('.ItemTR', tblUFL).hide();
                                $('.NoRecordsTR', tblUFL).show();
                                //return;
                            }
                            curTR.remove();

                        }); // end of click of Edit button event

                        $('.delete-icon', tblUFL).click(function () {
                            debugger
                            var btn = $(this);
                            var RecId = btn.attr("AmountRecId");


                            DeleteRow(t, RecId);

                            // Remove the row from the table
                            var curTR = btn.closest('tr');//.remove();

                            if ($('tr', curTR.parent()).length == 1) {
                                // curTR.remove();
                                $('.ItemTR', tblUFL).hide();
                                $('.NoRecordsTR', tblUFL).show();
                                //return;
                            }
                            curTR.remove();

                        }); // end of click of Edit button event
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
        
        //curTR.find('td[LedgerAmountId]').addClass('disabled-td'); // Add CSS class
        $('td[AmountRecId]').addClass('disabled-td');


        debugger
        // Fetch values
        var debitAmount = curTR.find('td:nth-child(3)').text().trim(); // Debit Amount
        var creditAmount = curTR.find('td:nth-child(4)').text().trim(); // Credit Amount
        var reason = curTR.find('td:nth-child(6)').text().trim(); // Reason
        /*var PaymentType = curTR.find('td:nth-child(6)').text().trim(); // */

        // Determine Transaction Type
        var transactionType = debitAmount !== "0.000" ? "D" : "C";

        // Determine which amount to set
        var finalAmount = debitAmount !== "0.000" ? debitAmount : creditAmount;

        // Set values in form
        $('input[argumentid="LedgerManagementAmount"]').val(finalAmount);
        $('input[argumentid="LedgerManagementReason"]').val(reason);
        $('input[name="TransactionType"][value="' + transactionType + '"]').prop('checked', true);

        
        // Set dropdown value
 
        var paymentTypeId = curTR.find('td[AccountsPaymentTypeId]').attr('AccountsPaymentTypeId');

        // Ensure value exists before setting
        if (paymentTypeId) {
            $('select[argumentid="AccountsPaymentType"]').val(paymentTypeId).trigger('change');


        }
        $('.UPD_Row_Save_Btn', t.el).show()
        $('.INS_Row_Save_Btn', t.el).hide()
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