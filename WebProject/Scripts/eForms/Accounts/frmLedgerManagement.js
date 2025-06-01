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
        debugger
        let amount = $(this).val();
        if (amount !== "" && amount !== null && amount !== undefined) {
            formatAmount(this);
        }
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
        }
    });


    function FetchLedegerAmounts(res, t) {
        if (res.status === 'OK' && res.Response.Rows.length > 0) {
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

                    if (response.status === 'OK' && response.Response.Rows.length > 0) {
                        response.Response.Rows.forEach(innerRow => {
                            debugger
                            const LedgerAmountCredit = innerRow.LedgerAmountCredit;
                            const LedgerAmountDebit = innerRow.LedgerAmountDebit;
                            const GrandTotal = innerRow.GrandTotal;
                            const TotalLedgerAmount = innerRow.TotalLedgerAmount;
                            const LedgerManagementRecCode = innerRow.LedgerManagementRecCode
                            const TransactionDate = innerRow.TransactionDate
                            const Reason = innerRow.Reason
                            const CreatedBy = innerRow.CreatedBy;
                            const DateCreated = innerRow.DateCreated;
                            $('[argumentid="GrandTotal"]', t.el).text(GrandTotal.toFixed(3)|| 0);
                            // Generate table row
                            tblRowsHTML += `
                            <tr class="ItemTableRow" style="white-space: nowrap" evenrowcss="w-grid-row-odd" oddrowcss="w-grid-row-odd" hoverrowcss="">
                                <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${LedgerManagementRecCode}</td>
                                <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${TransactionDate}</td>
                                <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${LedgerAmountDebit.toFixed(3)}</td>
                                <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${LedgerAmountCredit.toFixed(3)}</td>
                                <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${Reason}</td>

                                <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${CreatedBy}</td>
                                <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${DateCreated}</td>
                            </tr>
                        `;
                        });

                        // Inject rows into table
                        $('tbody', tblUFL).html(tblRowsHTML);
                    }
                }, 'GetData');
            });

        } else {
            setTimeout(() => {
                $('table.LedegerAmountsTable .ItemTableRow').hide();
                $('table.LedegerAmountsTable .NoRecordsTR').show();
            }, 1000);
        }
    }
}