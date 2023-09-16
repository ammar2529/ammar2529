/// <reference path="/JQuery/Common.js" />


    AsyncWidgets.WidgetScripts.frmSalesContracts = function (obj) {
        var t = obj;
       
    AsyncWidgets.WidgetScripts.frmSalesContracts.t = t;

        t.on('beforeDataAction', function (params)
        {

            // Ext.apply(params, frmProcGS.GetArgs([{ Name: 'FormType' }, { Name: 'FormNameCode' }]));

        });
        t.on('LOVPopupClosed', (args) =>
        {
            //  debugger;

            t.setParams({ params: args.rowData, isRow: true });
        });
        t.on('LOVPopupShown', (popup) =>
        {
            // debugger;
            $(t.el).mask("");
            $('.loadmask-msg', t.el).hide();
            popup.css({ position: 'absolute', top: '25%', left: '0px', 'z-index': '1000', 'background': '#628296' }).show();
            t.fireEvent('LOVPopupShown', popup);
        });


        ///////////////////////////////////////// File Upload  //////////////////////////////////////////////////////////////////
        $('.file-list', t.el).html("");
      
        AsyncWidgets.WidgetScripts.frmSalesContracts.BindUploadHandlers(t); //to db
       // AsyncWidgets.WidgetScripts.frmSalesContracts.ShowUploadFile(t);
       // AsyncWidgets.WidgetScripts.frmSalesContracts.DeleteUploadFile();
       ///////////////////////////////////////////////////////////////////////////////////////////////

       //calculate days
        var CalculateDays = AsyncWidgets.WidgetScripts.frmSalesContracts.CalculateDays;
        $('[argumentid="ContractStartDate"], [argumentid="ReservationDate"]', t.el).on('blur', function ()
        {

            CalculateDays();
        });

        //calculate weekday on start date
        var CalculateDayOfWeekCsDate = AsyncWidgets.WidgetScripts.frmSalesContracts.CalculateDayOfWeekCsDate;
        $('[argumentid="ContractStartDate"]').on('blur', function ()
        {
            var csDate = val('ContractStartDate',t.el);

            var dow = CalculateDayOfWeekCsDate(csDate);
            setField('ContractStartDay', dow, t.el);

        });

        //calculate weekday on end date
        var CalculateDayOfWeekRsDate = AsyncWidgets.WidgetScripts.frmSalesContracts.CalculateDayOfWeekRsDate;
        $('[argumentid="ReservationDate"]').on('blur', function ()
        {
            var rsDate = val('ReservationDate', t.el);
            var dow = CalculateDayOfWeekRsDate(rsDate);
            setField('ReservationWeekDays', dow, t.el);
        });

     

    //lines marked by Qasim
  
    //On Click Plus Sign to Show hide More details of Customer & Cars
    $('.contDetailsIcon', t.el).click(function () {
        var ic = $(this);
        if (ic.hasClass('w-ui-panel-icon-opened')) {
            ic.addClass('w-ui-panel-icon-closed').removeClass('w-ui-panel-icon-opened');
            $('.OnLoadHideCarCust', t.el).hide();
        }
        else {
            ic.addClass('w-ui-panel-icon-opened').removeClass('w-ui-panel-icon-closed');
            $('.OnLoadHideCarCust', t.el).show();
        }
    });
    //End On Click Plus Sign to Show hide More details of Customer & Cars

    //On Click of Print Contract Button
    $('.btn_9', t.el).click(function () { //
        var strlink = ROOT_PATH + "Pages/eForms/iRental/Reports/PrintOpenContractFrPg.aspx?FormCode=" + $('[argumentid="RecCode"]', t.el).text(); // +'&amp;FormId=' + pm.SelectedKey;
        console.log(strlink);
        var width = 920;
        var height = 600;
        var left = parseInt((screen.availWidth / 2) - (width / 2)) - 15;
        var top = parseInt((screen.availHeight / 2) - (height / 2));
        window.open(strlink, '_blank', "'titlebar=no,resizable=1,scrollbars=yes,height=" + height + ",width=" + width + ",left=" + left + ",top=" + top + "screenX=" + left + ",screenY=" + top + "'");
        return false;
    });
    //End On Click of Print Contract Button

    // To Select Tabs
    $('.SimpleTab li', t.el).click(function () {
        var li = $(this), tbl;
        if (!!$(this).parent().attr('disabled')) return;
        if (li.parent().children('li.active').attr('tabid') == li.attr('tabid')) return false;
        li.parent().children('li.active').removeClass('active');
        li.addClass('active');
        tbl = li.closest('table').children();
        tbl.children('tr:not(:first)').hide();
        tbl.children('tr[tabid="' + li.attr('tabid') + '"]').show();
        $('.tabid', t.el).val(li.attr('tabid'));

        if (li.attr('tabid') == 'SalesContractDetails')
        {
            var wg = AsyncWidgets.get('frmSalesContracts');
            
            var cf = {
                ActionId: "GetData", GroupId: null, readFormValues: false,
                Params: { RecId: val('RecId', wg.el), Command: 'SEL_iRental_SalesContracts' }

            }
            wg.loadValues(cf, function ()
            {
                wg.show();
            });
            
        }

        else if (li.attr('tabid') == 'SalesPaymentDetails') {
            AsyncWidgets.get('grdSalesContractsPaymentDetails').show().Requery();
        }

        else if (li.attr('tabid') == 'ContractComments') {
            AsyncWidgets.get('grdContractComments').show().Requery();
        }

        return false;
    });
    // End

    // End

    // Function to Show Hide Mileage Type Related Fields
    var SHMileageType = function () {
        if ($('[argumentid="ContractTypeOL"]:checked', t.el).val() == 'Open') {
            $('.MileageType', t.el).hide();
            $('.MileageTypeCharges', t.el).hide();
        }
        else { //if check value is 'Limited'
            $('.MileageType', t.el).show();

            if ($('[argumentid="StateId"]', t.el).text() != '' && $('[argumentid="StateId"]', t.el).text() != 'RRCStartState' && $('[argumentid="StateId"]', t.el).text() != 'RRCCreatedState') {
                $('.MileageTypeCharges', t.el).show();
            }

        }
    };
    $('[argumentid="ContractTypeOL"]', t.el).change(SHMileageType);
    // End of Show Hide Mileage Type Related Fields

    //On Change of Location Out Empty Car Details
    $('[argumentid="OutLocationId"]', t.el).change(function () {
        $('[argumentid="CarNumber"]', t.el).val('');
        $('[argumentid="ChassisNo"]', t.el).text('');
        $('[argumentid="Brand"]', t.el).text('');
        $('[argumentid="Model"]', t.el).text('');
        $('[argumentid="CarYear"]', t.el).text('');
        $('[argumentid="Color"]', t.el).text('');
        $('[argumentid="Type"]', t.el).text('');
        $('[argumentid="InsuranceExpiry"]', t.el).text('');
        $('[argumentid="FullInsuranceExpiry"]', t.el).text('');
        $('[argumentid="CarPreviousKM"]', t.el).text('');
        $('[argumentid="ContractKMOut"]', t.el).val('');
        $('[argumentid="CarRateType"] option:not(:first)', t.el).remove(); //Clear Car Rate Type
        $('[argumentid="CarRate"],[argumentid="CarAllowedKM"],[argumentid="CarExtraKMRate"]', t.el).val(0);
    });
    //End On Change of Location Out Empty Car Details

    // On End Date Selection Get Day Time and Days
    var GetActualDays = function (e, vl, dt) {

        var weekday = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
        var sts = 0, sDate, eDate, cDate = new Date(), cH = cDate.getHours(), cM = cDate.getMinutes();

        cH = cH < 10 ? '0' + cH : cH;
        cM = cM < 10 ? '0' + cM : cM;

        sDate = getDate($('[argumentid="ContractStartDate"]', t.el).val());
        if (sDate.toString() == 'NaN') {
            sts = 1;
        }

        eDate = getDate($('[argumentid="ContractEndDate"]', t.el).val());
        if (eDate.toString() == 'NaN') {
            $('[argumentid="ContractEndDay"],[argumentid="ContractEndTime"],[argumentid="ActualContractDays"]', t.el).val('');
            sts = 1;
        }
        else {
            $('[argumentid="ContractEndDay"]', t.el).val(weekday[eDate.getDay()]);
            $('[argumentid="ContractEndTime"]', t.el).val(cH + ':' + cM);
        }

        if (sts) {
            return false;
        }

        if (sDate > eDate) {
            alert('Contract End Date has to be greater than Contract Start Date');
            $('[argumentid="ContractEndDate"],[argumentid="ContractEndDay"],[argumentid="ContractEndTime"],[argumentid="ActualContractDays"]', t.el).val('');
            return false;
        }

        diff = new Date();
        diff.setTime(Math.abs(sDate.getTime() - eDate.getTime()));
        days = Math.floor(diff / (1000 * 60 * 60 * 24)) + 1;

        if (days.toString() == 'NaN') {
            days = '';
        }
        else if (days > 1) {
            days = days - 1;
        }
        $('[argumentid="ActualContractDays"]', t.el).val(days);
    };

    //lines marked by Qasim
    $('[argumentid="CarRateType"],[argumentid="CarRate"],[argumentid="CarAllowedKM"],[argumentid="CarExtraKMRate"],[argumentid="ContractKMOut"],[argumentid="ContractKMIn"],[argumentid="ContractDiscount"],[argumentid="ContractTypeOL"]', t.el).change(CalculateRentalContractChargesOnSuperEdit);
    //End On Change of Controls Calculate Rental Charges Again

    //Calculate Extra KM
    function CalculateExtraKMCharges() {

        if ($('[argumentid="ContractTypeOL"]:checked', t.el).val() == 'Limited') {

            var intCarRatePerExtraKM = $('[argumentid="CarExtraKMRate"]', t.el).val();

            if (isNaN(parseFloat(intCarRatePerExtraKM))) {
                intCarRatePerExtraKM = 0;
                $('[argumentid="CarExtraKMRate"]', t.el).val('0.000');
            }

            var intActualContractDays = $('[argumentid="ActualContractDays"]', t.el).val();
            if (isNaN(parseFloat(intActualContractDays)))
                intActualContractDays = 0;

            var intContractKMOut = $('[argumentid="ContractKMOut"]', t.el).val();
            if (isNaN(parseFloat(intContractKMOut)))
                intContractKMOut = 0;

            var intContractKMIn = $('[argumentid="ContractKMIn"]', t.el).val();
            if (isNaN(parseFloat(intContractKMIn)))
                intContractKMIn = 0;

            var intCarAllowedKMPerDay = $('[argumentid="CarAllowedKM"]', t.el).val();
            if (isNaN(parseFloat(intCarAllowedKMPerDay))) {
                intCarAllowedKMPerDay = 0;
                $('[argumentid="CarAllowedKM"]', t.el).val('0');

            }
            intKMDifference = intContractKMIn - intContractKMOut;

            intExtraKM = intKMDifference - (intCarAllowedKMPerDay * intActualContractDays);

            if (intExtraKM > 0) {

                $('[argumentid="ContractExtraKM"]', t.el).text(intExtraKM);
                decContractExtraKMCharges = parseFloat(intCarRatePerExtraKM) * parseFloat(intExtraKM);
                $('[argumentid="ContractExtraKMCharges"]', t.el).text(decContractExtraKMCharges.toFixed(3));

            }
            else {
                $('[argumentid="ContractExtraKM"]', t.el).text('0');
                $('[argumentid="ContractExtraKMCharges"]', t.el).text('0.000');
            }
        }
        else {
            $('[argumentid="ContractExtraKM"]', t.el).text('0');
            $('[argumentid="ContractExtraKMCharges"]', t.el).text('0.000');
        }
    }
    //End Calculate Extra KM

    // Check if Payment Cleared to Enable Disable Payment Clear Button
    function CheckPaymentCleared() {

        //Disable Button Close Contract - Payment Cleared if the Contract Due  is > 0, currently apply only for Rental Contract later apply for lease

        if ($('[argumentid="ContractType"]:checked', t.el).val() == 'Rental') {

            var strStatus = $('[argumentid="StateName"]', t.el).text();

            if (strStatus != '' && strStatus != 'Start State' && strStatus != 'Created - Reservation' && strStatus != 'Contract Closed - Payment Cleared' && strStatus != 'With Legal - Contract Open - Car In' && strStatus != 'With Legal - Contract Open - Car Out' && strStatus != 'With Legal - Contract Closed - Pending Payment') {

                decRentalCurrentDueAmount = parseFloat($('[argumentid="TotalAmountDue"]', t.el).text());
                if (decRentalCurrentDueAmount > 0) {
                    $('.btn_4', t.el).attr('disabled', 'disabled');
                    $('.btn_4', t.el).removeClass('ElemDisabled');
                    $('.btn_4', t.el).addClass('ElemDisabled');
                }
                else {
                    $('.btn_4', t.el).removeAttr('disabled');
                    $('.btn_4', t.el).removeClass('ElemDisabled');
                }
            }
        }
    }
    // End Check if Payment Cleared to Enable Disable Payment Clear Button

    // Calculate Rental Charges On Edit
    function CalculateRentalContractChargesOnSuperEdit() {

        // Calculate Rental Charges On Load, Check if Contract Type = Rental 
        if ($('[argumentid="ContractType"]:checked', t.el).val() == 'Rental') {

            // Calculate Actual Contract Days and Update the Form
            GetActualDays();

            var intCarRatePerDay = $('[argumentid="CarRate"]', t.el).val();
            var intActualContractDays = $('[argumentid="ActualContractDays"]', t.el).val();

            if (isNaN(parseFloat(intCarRatePerDay))) {
                intCarRatePerDay = 0;
                $('[argumentid="CarRate"]', t.el).val(0);
            }

            if (isNaN(parseFloat(intActualContractDays))) {
                intActualContractDays = 0;
            }

            // Calculate Contract Period Charges based on the Rate Per Day
            decContractPeriodCharges = parseFloat(intCarRatePerDay) * parseFloat(intActualContractDays);
            $('[argumentid="ContractPeriodCharges"]', t.el).text(decContractPeriodCharges.toFixed(3));

            // Calculate Extra KM Charges, logically performed on Contract Closing, but added here as same function used on any changes       
            CalculateExtraKMCharges();

            decContractExtraKMCharges = parseFloat($('[argumentid="ContractExtraKMCharges"]', t.el).text());

            if (isNaN(parseFloat(decContractExtraKMCharges)))
                decContractExtraKMCharges = 0;

            // Get Other Charges Amount in variable to use later and perform 3 decimal places fix 
            if (isNaN(parseFloat($('[argumentid="ContractOtherCharges"]', t.el).text()))) {
                $('[argumentid="ContractOtherCharges"]', t.el).text('0.000');
                decContractOtherCharges = 0;
            }
            else {
                decContractOtherCharges = parseFloat($('[argumentid="ContractOtherCharges"]', t.el).text());
                $('[argumentid="ContractOtherCharges"]', t.el).text(decContractOtherCharges.toFixed(3));
            }

            // Get Discount Charges Amount in variable to use later and perform 3 decimal places fix 
            if (isNaN(parseFloat($('[argumentid="ContractDiscount"]', t.el).val()))) {
                $('[argumentid="ContractDiscount"]', t.el).val('0.000');
                decContractDiscount = 0;
            }
            else {
                decContractDiscount = parseFloat($('[argumentid="ContractDiscount"]', t.el).val());
                $('[argumentid="ContractDiscount"]', t.el).val(decContractDiscount.toFixed(3));
            }

            // If Total Paid by Customer returns NAN then update the value on the form to 0.000
            if (isNaN(parseFloat($('[argumentid="TotalPaidByCustomer"]', t.el).text()))) {
                $('[argumentid="TotalPaidByCustomer"]', t.el).text('0.000');
            }
            else {
                decTotalPaidByCustomer = parseFloat($('[argumentid="TotalPaidByCustomer"]', t.el).text());
                $('[argumentid="TotalPaidByCustomer"]', t.el).text(decTotalPaidByCustomer.toFixed(3));
            }

            // Calculate Total Rental Charges and perform 3 decimal places fix
            decContractTotalCharges = parseFloat(decContractPeriodCharges) + parseFloat(decContractExtraKMCharges) + parseFloat(decContractOtherCharges) - parseFloat(decContractDiscount)
            $('[argumentid="ContractTotalCharges"]', t.el).text(decContractTotalCharges.toFixed(3));

            // Calculate Due Amount and perform 3 decimal places fix 

            $('[argumentid="TotalAmountDue"]', t.el).text(parseFloat($('[argumentid="ContractTotalCharges"]', t.el).text()) - parseFloat($('[argumentid="TotalPaidByCustomer"]', t.el).text()));
            decRentalCurrentDueAmount = parseFloat($('[argumentid="TotalAmountDue"]', t.el).text());
            $('[argumentid="TotalAmountDue"]', t.el).text(decRentalCurrentDueAmount.toFixed(3));

            //If Due Payment < 1 then Enable Clear Button
            CheckPaymentCleared();
        }
    }
    //End Calculate Rental Charges On Edit


    //Calculate Rental Charges

    function CalculateRentalContractCharges() {

        // Calculate Rental Charges On Load, Check if Contract Type = Rental 
        if ($('[argumentid="ContractType"]:checked', t.el).val() == 'Rental') {

            var strStatus = $('[argumentid="StateName"]', t.el).text();

            // Calculate Rental Charges and Due Amount, Check if the Contract is Still Open, If Open then need to calculate Days with Current Date

            if (strStatus == 'Contract Open - Car Out' || strStatus == 'Contract Open - Car In' || strStatus == 'With Legal - Contract Open - Car Out' || strStatus == 'With Legal - Contract Open - Car In') {

                // Calculate Actual Contract Days and Update the Form
                GetActualDays();

                var intCarRatePerDay = $('[argumentid="CarRate"]', t.el).val();
                var intActualContractDays = $('[argumentid="ActualContractDays"]', t.el).val();

                if (isNaN(parseFloat(intCarRatePerDay))) {
                    intCarRatePerDay = 0;
                }

                if (isNaN(parseFloat(intActualContractDays))) {
                    intActualContractDays = 0;
                }

                // Calculate Contract Period Charges based on the Rate Per Day
                decContractPeriodCharges = parseFloat(intCarRatePerDay) * parseFloat(intActualContractDays);
                $('[argumentid="ContractPeriodCharges"]', t.el).text(decContractPeriodCharges.toFixed(3));

                // Calculate Extra KM Charges, logically performed on Contract Closing, but added here as same function used on any changes       
                CalculateExtraKMCharges();

                decContractExtraKMCharges = parseFloat($('[argumentid="ContractExtraKMCharges"]', t.el).text());

                if (isNaN(parseFloat(decContractExtraKMCharges)))
                    decContractExtraKMCharges = 0;

                // Get Other Charges Amount in variable to use later and perform 3 decimal places fix 
                if (isNaN(parseFloat($('[argumentid="ContractOtherCharges"]', t.el).text()))) {
                    $('[argumentid="ContractOtherCharges"]', t.el).text('0.000');
                    decContractOtherCharges = 0;
                }
                else {
                    decContractOtherCharges = parseFloat($('[argumentid="ContractOtherCharges"]', t.el).text());
                    $('[argumentid="ContractOtherCharges"]', t.el).text(decContractOtherCharges.toFixed(3));
                }

                // Get Discount Charges Amount in variable to use later and perform 3 decimal places fix 
                if (isNaN(parseFloat($('[argumentid="ContractDiscount"]', t.el).val()))) {
                    $('[argumentid="ContractDiscount"]', t.el).val('0.000');
                    decContractDiscount = 0;
                }
                else {
                    decContractDiscount = parseFloat($('[argumentid="ContractDiscount"]', t.el).val());
                    $('[argumentid="ContractDiscount"]', t.el).val(decContractDiscount.toFixed(3));
                }

                // If Total Paid by Customer returns NAN then update the value on the form to 0.000
                if (isNaN(parseFloat($('[argumentid="TotalPaidByCustomer"]', t.el).text()))) {
                    $('[argumentid="TotalPaidByCustomer"]', t.el).text('0.000');
                }
                else {
                    decTotalPaidByCustomer = parseFloat($('[argumentid="TotalPaidByCustomer"]', t.el).text());
                    $('[argumentid="TotalPaidByCustomer"]', t.el).text(decTotalPaidByCustomer.toFixed(3));
                }

                // Calculate Total Rental Charges and perform 3 decimal places fix
                decContractTotalCharges = parseFloat(decContractPeriodCharges) + parseFloat(decContractExtraKMCharges) + parseFloat(decContractOtherCharges) - parseFloat(decContractDiscount)
                $('[argumentid="ContractTotalCharges"]', t.el).text(decContractTotalCharges.toFixed(3));

                // Calculate Due Amount and perform 3 decimal places fix 

                $('[argumentid="TotalAmountDue"]', t.el).text(parseFloat($('[argumentid="ContractTotalCharges"]', t.el).text()) - parseFloat($('[argumentid="TotalPaidByCustomer"]', t.el).text()));
                decRentalCurrentDueAmount = parseFloat($('[argumentid="TotalAmountDue"]', t.el).text());
                $('[argumentid="TotalAmountDue"]', t.el).text(decRentalCurrentDueAmount.toFixed(3));

            }
            else {
                // Calculate Due Amount, as the Contract is Closed, Due Amount is not a Data Member Field but Calculated on Load and other values

                decContractPeriodCharges = parseFloat($('[argumentid="ContractPeriodCharges"]', t.el).text());
                if (isNaN(parseFloat(decContractPeriodCharges))) {
                    $('[argumentid="ContractPeriodCharges"]', t.el).text('0.000');
                    decContractPeriodCharges = 0;
                }
                else {
                    decContractPeriodCharges = parseFloat($('[argumentid="ContractPeriodCharges"]', t.el).text());
                    $('[argumentid="ContractPeriodCharges"]', t.el).text(decContractPeriodCharges.toFixed(3));
                }


                decContractExtraKMCharges = parseFloat($('[argumentid="ContractExtraKMCharges"]', t.el).text());
                if (isNaN(parseFloat(decContractExtraKMCharges))) {
                    $('[argumentid="ContractExtraKMCharges"]', t.el).text('0.000');
                    decContractExtraKMCharges = 0;
                }
                else {
                    decContractExtraKMCharges = parseFloat($('[argumentid="ContractExtraKMCharges"]', t.el).text());
                    $('[argumentid="ContractExtraKMCharges"]', t.el).text(decContractExtraKMCharges.toFixed(3));
                }

                // Get Other Charges Amount in variable to use later and perform 3 decimal places fix 
                if (isNaN(parseFloat($('[argumentid="ContractOtherCharges"]', t.el).text()))) {
                    $('[argumentid="ContractOtherCharges"]', t.el).text('0.000');
                    decContractOtherCharges = 0;
                }
                else {
                    decContractOtherCharges = parseFloat($('[argumentid="ContractOtherCharges"]', t.el).text());
                    $('[argumentid="ContractOtherCharges"]', t.el).text(decContractOtherCharges.toFixed(3));
                }

                // Get Discount Charges Amount in variable to use later and perform 3 decimal places fix 
                if (isNaN(parseFloat($('[argumentid="ContractDiscount"]', t.el).val()))) {
                    $('[argumentid="ContractDiscount"]', t.el).val('0.000');
                    decContractDiscount = 0;
                }
                else {
                    decContractDiscount = parseFloat($('[argumentid="ContractDiscount"]', t.el).val());
                    $('[argumentid="ContractDiscount"]', t.el).val(decContractDiscount.toFixed(3));
                }


                // Calculate Total Rental Charges and perform 3 decimal places fix
                decContractTotalCharges = parseFloat(decContractPeriodCharges) + parseFloat(decContractExtraKMCharges) + parseFloat(decContractOtherCharges) - parseFloat(decContractDiscount)
                $('[argumentid="ContractTotalCharges"]', t.el).text(decContractTotalCharges.toFixed(3));


                // If Total Paid by Customer returns NAN then update the value on the form to 0.000
                if (isNaN(parseFloat($('[argumentid="TotalPaidByCustomer"]', t.el).text()))) {
                    $('[argumentid="TotalPaidByCustomer"]', t.el).text('0.000');
                }
                else {
                    decTotalPaidByCustomer = parseFloat($('[argumentid="TotalPaidByCustomer"]', t.el).text());
                    $('[argumentid="TotalPaidByCustomer"]', t.el).text(decTotalPaidByCustomer.toFixed(3));
                }


                // Calculate Due Amount and perform 3 decimal places fix 
                $('[argumentid="TotalAmountDue"]', t.el).text(parseFloat($('[argumentid="ContractTotalCharges"]', t.el).text()) - parseFloat($('[argumentid="TotalPaidByCustomer"]', t.el).text()));
                decRentalCurrentDueAmount = parseFloat($('[argumentid="TotalAmountDue"]', t.el).text());
                $('[argumentid="TotalAmountDue"]', t.el).text(decRentalCurrentDueAmount.toFixed(3));

            }

            //If Due Payment < 1 then Enable Clear Button
            CheckPaymentCleared();
        }
    }
    //End Calculate Rental Charges

    //On Selection of CarRateType
    $('[argumentid="CarRateType"]', t.el).change(function () {


        if (this.selectedIndex < 1)
            $('[argumentid="CarRate"],[argumentid="CarAllowedKM"],[argumentid="CarExtraKMRate"]', t.el).val(0);
        else {

            var itm = this.options[this.selectedIndex];
            t.SetArgsVal([{ Name: 'CarRate', Value: $(itm).attr('CarRate') }, { Name: 'CarAllowedKM', Value: $(itm).attr('CarAllowedKM') }, { Name: 'CarExtraKMRate', Value: $(itm).attr('CarExtraKMRate') }]);
        }

        if ($('[argumentid="CarRateType"]', t.el).val() == 1) {
            $('[argumentid="CarRate"],[argumentid="CarAllowedKM"],[argumentid="CarExtraKMRate"]', t.el).removeAttr('disabled').removeClass('ElemDisabled');
            $('[argumentid="CarRate"]').val('').focus();
        }
        else {
            $('[argumentid="CarRate"],[argumentid="CarAllowedKM"],[argumentid="CarExtraKMRate"]', t.el).attr('disabled', 'disabled').addClass('ElemDisabled');
        }
    });
    //End On Selection of CarRateType


    //On Click of Edit Button by Super User
    $('.Button_Edit', t.el).click(function () {

        $('.CommonDisable,.DisableOnClose,.SuperUserEdit,.btn_1,.btn_2,.btn_10', t.el).removeAttr('disabled').removeClass('ElemDisabled');
        $('[argumentid="ContractEndDate"]', t.el).next('img').show().removeAttr('disabled').removeClass('ElemDisabled');
        $('[argumentid="ContractStartDate"]', t.el).next('img').show().removeAttr('disabled').removeClass('ElemDisabled');
        $('[argumentid="ContractExpiryDate"]', t.el).next('img').show().removeAttr('disabled').removeClass('ElemDisabled');

        if ($('[argumentid="CarRateType"]', t.el).val() == 1) {
            $('[argumentid="CarRate"],[argumentid="CarAllowedKM"],[argumentid="CarExtraKMRate"]', t.el).removeAttr('disabled').removeClass('ElemDisabled');
        }
    });
    //End On Click of Edit Button by Super User

    // On Form Show file-list
        t.on('show', function (args)
        {
            console.log($('.file-list', t.el).length);
            $('.file-list', t.el).html('');
            console.log($('.file-list', t.el).length);
        //Always Move to First Tab on Show
        var li = $('li[tabid="ContractDetails"]', t.el), tbl;
        li.parent().children('li.active').removeClass('active');
        li.addClass('active');
        tbl = li.closest('table').children();
        tbl.children('tr:not(:first)').hide();
        tbl.children('tr[tabid="' + li.attr('tabid') + '"]').show();
        $('.tabid', t.el).val(li.attr('tabid'));
        //End Always Move to First Tab on Show

        //// Hide Edit For Normal Users
        //$('[roles]', t.el).hide().each(function () {
        //    if (AsyncWidgets.user.conf.Roles.indexOf($(this).attr('roles')) > -1) {
        //        $(this).show();
        //    }
        //});

        $('.AlwaysDisable', t.el).attr('disabled', 'disabled');
        $('.ElemDisabled', t.el).removeClass('ElemDisabled');
        $('[argumentid="ContractKMIn"]', t.el).removeClass('required');

        $('.OnNewHide,.OnLoadHide,.CommaWR,.CommaM12,.MileageTypeCharges,.OnLoadHideCarCust', t.el).hide();
        $('[argumentid="ContractStartDate"]', t.el).next('img').show().addClass('CommonDisable');
        $('[argumentid="ContractExpiryDate"]', t.el).next('img').show().addClass('DisableOnClose');
        $('[argumentid="ContractEndDate"]', t.el).next('img').hide().addClass('AlwaysDisable').addClass('OnLoadHide');
        $('.contDetailsIcon', t.el).addClass('w-ui-panel-icon-closed').removeClass('w-ui-panel-icon-opened');


        $('.SimpleTab', t.el).attr('disabled', 'disabled');
      

        SHMileageType(); // This function is called to hide show Mileage Type Related Fields on Value Loaded

       // $('[argumentid="CarRateType"] option:not(:first)', t.el).remove(); //Clear Car Rate Type

        var CurrentDate = new Date(); //Get Current Date to set Start Date On New for particular states
        var WeekDay = AsyncWidgets.WidgetScripts.frmSalesContracts.getWeekdayName(CurrentDate);
        var setTime = AsyncWidgets.WidgetScripts.frmSalesContracts.formateTime(CurrentDate);
        var cD = CurrentDate.getDate() < 10 ? '0' + CurrentDate.getDate() : CurrentDate.getDate();
        var cM = (CurrentDate.getMonth() + 1) < 10 ? '0' + (CurrentDate.getMonth() + 1) : (CurrentDate.getMonth() + 1);
        var cY = CurrentDate.getFullYear();

        if ($('[argumentid="StateId"]', t.el).text() == '') {
            $('[argumentid="StateId"]', t.el).text('SCSCreatedState');
            $('[argumentid="StateName"]', t.el).text('Created State');
            $('.btn_1,.btn_2,.btn_3,.btn_4,.btn_5,.btn_6,.btn_7,.btn_8,.btn_9', t.el).attr('disabled', 'disabled');
            $('.Button_Edit', t.el).hide();
            $('[argumentid="ContractStartDate"]', t.el).val(cD + '/' + cM + '/' + cY);
            $('[argumentid="ContractStartDay"]', t.el).val(WeekDay);
            $('[argumentid="ContractStartTime"]', t.el).val(setTime);

            $('[argumentid="ReservationExpireTime"]', t.el).val(setTime);

       }

        $('.btn_10', t.el).hide();
        $('.btn_11', t.el).show();

        $('.CommonDisable,.DisableOnClose,.btn_10', t.el).removeAttr('disabled');
        $('input[disabled="disabled"]:not([type="radio"]),textarea[disabled="disabled"],select[disabled="disabled"]', t.el).addClass('ElemDisabled');
        $('span[argumentid="ChassisNo"],span[argumentid="CustomerName"],span[argumentid="InsuranceExpiry"],span[argumentid="FullInsuranceExpiry"],span[argumentid="PassportExpiry"],span[argumentid="NationalIDExpiryDate"],span[argumentid="DrivingLicenseExpiry"]', t.el).css('color', '#628296'); //Change Color to Normal on form show
        AsyncWidgets.WidgetScripts.frmSalesContracts.ConvertToDecimal();
 
    });
    // End On Form Show

    // On Start of Onloaded Values
    t.on('onLoadedValues', function (args) {

        $('.btn_11', t.el).show();
        $('.btn_10', t.el).show();

        var res = args.res;

        if (res.status == 'OK') {

            // Highlight dates as red which have expired
            var HLD = function (arg, arg2) {
                var expDate = t.GetArgVal(arg).replace(/3rd - /g, '').replace(/Full - /g, '');
                if ($.trim(expDate) != '') {
                    if (Math.floor(dateDiff(new Date(), cDate(expDate))) >= 0) {
                        $('span[argumentid="' + arg + '"]', t.el).css('color', 'red');
                        $('span[argumentid="' + arg2 + '"]', t.el).css('color', 'red');
                    }
                }
                return HLD;
            };
            HLD('PassportExpiry', 'CustomerName')('NationalIDExpiryDate', 'CustomerName')('DrivingLicenseExpiry', 'CustomerName');
            // End of Highlight of expired dates

            $('.OnNewHide', t.el).show();
            $('.SimpleTab', t.el).removeAttr('disabled');

            SHMileageType(); // This function is called to hide show Mileage Type Related Fields on Value Loaded


            if (!t.__cboEvnt) {
                t.__cboEvnt = true;
                t.on('onComboFilled', function (p) {

                    // This is to enable disabled RateType Field, because the fields are loaded on demand...
                    if ('RRCCreatedStateRRCStartState'.indexOf($('[argumentid="StateId"]', t.el).text()) < 0) {
                        $('[argumentid="OutLocationId"],[argumentid="CarRateType"]', t.el).attr('disabled', 'disabled');
                    }
                    else {
                        $('[argumentid="CarRateType"]', t.el).removeAttr('disabled').removeClass('ElemDisabled');

                        if (p.valueToSet == 1) {
                            $('[argumentid="CarRate"],[argumentid="CarAllowedKM"],[argumentid="CarExtraKMRate"]', t.el).removeAttr('disabled').removeClass('ElemDisabled');
                        }
                    }

                    $('[argumentid="InLocationId"]', t.el).attr('disabled', 'disabled');
                });

            }
            //End Load Car Rate Types

            //Load Commas if both numbers are there
            if (!!$('[argumentid="WorkTelephone"]', t.el).text() && !!$('[argumentid="ResidenceTelephone"]', t.el).text()) {
                $('.CommaWR', t.el).show();
            }

            if (!!$('[argumentid="MobileTelephone1"]', t.el).text() && !!$('[argumentid="MobileTelephone2"]', t.el).text()) {
                $('.CommaM12', t.el).show();
            }
            //End Commas if both numbers are there

            var CurrentDate = new Date(); //Get Current Date to set End Date On Load for particular states
            var cD = CurrentDate.getDate() < 10 ? '0' + CurrentDate.getDate() : CurrentDate.getDate();
            var cM = (CurrentDate.getMonth() + 1) < 10 ? '0' + (CurrentDate.getMonth() + 1) : (CurrentDate.getMonth() + 1);
            var cY = CurrentDate.getFullYear();

            //Disable Enable Controls based on StateId
            $('.btn_1,.btn_2,.btn_3,.btn_4,.btn_5,.btn_6,.btn_7,.btn_8,.btn_9,.btn_10 ', t.el).removeAttr('disabled');
            $('.OnLoadHide', t.el).show();
            $('[argumentid="ContractEndDate"]', t.el).next('img').show();
            $('[argumentid="ContractStartDate"]', t.el).next('img').show();
            $('[argumentid="ContractExpiryDate"]', t.el).next('img').show();

           

            CalculateRentalContractCharges(); // Calculate Rental Charges on Value Loaded
            CheckPaymentCleared(); // Check if Payment Cleared to Enable Disable Payment Clear Button

            $('.ElemDisabled', t.el).removeClass('ElemDisabled');
            $('input[disabled="disabled"]:not([type="radio"]),textarea[disabled="disabled"],select[disabled="disabled"]', t.el).addClass('ElemDisabled');

            //                                      RRCStartState
            //                                      RRCCreatedState
            //                                      RRCContractOpen
            //                                      RRCContractOpenCarIn
            //                                      RRCWithLegalContractOpenCarOut
            //                                      RRCWithLegalContractOpenCarIn
            //                                      RRCWithLegalContractClosedPendingPayment
            //                                      RRCContractClosedPendingPayment
            //                                      RRCContractClosed
            //                                      RRCContractCancelled


            AsyncWidgets.WidgetScripts.frmSalesContracts.ConvertToDecimal();

        }
    });
    // End of On Loaded Values
}


/// Calculate reserve days
AsyncWidgets.WidgetScripts.frmSalesContracts.CalculateDays =  function () {
    var t = AsyncWidgets.WidgetScripts.frmSalesContracts.t;
    var cDate = new Date();
    var cH = cDate.getHours();
    var cM = cDate.getMinutes();

    cH = cH < 10 ? '0' + cH : cH;
    cM = cM < 10 ? '0' + cM : cM;


    var sDate = new Date();
    var eDate = new Date();
  
    if (sDate > eDate) {

        return 0;
    } else {

        sDate = val('ContractStartDate', t.el).convertDate(); // getDate($('[argumentid="ContractStartDate"]', t.el).val());
        eDate = val('ReservationDate').convertDate();//getDate($('[argumentid="ContractExpiryDate"]'));



        setField('ReservationDays', sDate.getDateDiffInDays(eDate), t.el);
       // $('[argumentid="ReservationDays"]', t.el).val(ReserveDays);
       
        $('[argumentid="ContractStartTime"]', t.el).val(cH + ':' + cM);
        $('[argumentid="ReservationExpireTime"]', t.el).val(cH + ':' + cM);
    }
};



///set time function 
AsyncWidgets.WidgetScripts.frmSalesContracts.formateTime = function (date)
{
    var t = AsyncWidgets.WidgetScripts.frmSalesContracts.t;

    var hours = date.getHours();
    var minutes = date.getMinutes();
    var ampm = hours >= 12 ? 'PM' : 'AM';
    hours %= 12;
    hours = hours || 12; // 0 should be displayed as 12
    return hours + ':' + (minutes < 10 ? '0' : '') + minutes + ' ' + ampm;
};

//set weekdays function

AsyncWidgets.WidgetScripts.frmSalesContracts.getWeekdayName = function (date)
{
    var weekdays = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
    return weekdays[date.getDay()];
};


//calculate weekday of start date
AsyncWidgets.WidgetScripts.frmSalesContracts.CalculateDayOfWeekCsDate = function (csDate)
{

    if (!!csDate)
    {
        var oDate = csDate.convertDate();
        if (!isNaN(oDate))
        {
            var weekdays = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
            return weekdays[oDate.getDay()];



        }
        return "";
    }
};

//calculate weekday of reserve date
AsyncWidgets.WidgetScripts.frmSalesContracts.CalculateDayOfWeekRsDate = function (rsDate)
{

    if (!!rsDate)
    {
        var oDate = rsDate.convertDate();
        if (!isNaN(oDate))
        {
            var weekdays = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
            return weekdays[oDate.getDay()];



        }
        return "";
    }
};


AsyncWidgets.WidgetScripts.frmSalesContracts.BindUploadHandlers = function (t)
{

 
    $(".upload-button",t.el).click(function (e)
    {
        debugger;
        var isGUIDUpdateNeeded = false;
        if (val('FileGuid',t.el).trim() == "")
        {
            var guid = generateGuid();
            setField('FileGuid', guid, t.el);
            if (t.FormMode == 'update')
            {
                isGUIDUpdateNeeded = true;
            }
        }

        e.preventDefault();
        var fileInput = $(".file-input", t.el)[0];
       
        var files = fileInput.files;

        if (files.length === 0)
        {
            var errorMsg = $(".message", t.el).html("Please select a file.");
            $.showMessage(errorMsg);
            return;
        }


        var formData = new FormData();
        for (var i = 0; i < files.length; i++)
        {
            
            formData.append("file" + i, files[i]);
        }

        formData.append("FileGuid",val("FileGuid", t.el));
        if (isGUIDUpdateNeeded)
        {
            formData.append("SalesRecId", val("RecId"));
        }
        $('.progress-bar', t.el).show();
        $.ajax({

            type: "POST",
            url: "UploadFile/UploadFiles", // Replace with your server-side handler URL
            data: formData,
            dataType : 'text',
            processData: false,
            contentType: false,
            xhr: function ()
            {
                var xhr = new window.XMLHttpRequest();
                xhr.upload.addEventListener("progress", function (evt)
                {
                    if (evt.lengthComputable)
                    {
                        var percentComplete = (evt.loaded / evt.total) * 100;
                        $(".progress-bar", t.el).width(percentComplete + "%");

                        if (percentComplete >95)
                        {
                            setTimeout(function () { $('.progress-bar', t.el).hide(); }, 3000);
                        }
                    }
                }, false);
                return xhr;
               
            },
            success: function (response)
            {
                objRes = JSON.parse(response)
                var rows = objRes.Response.Rows;
                for (var i = 0; i < rows.length; i++)
                {
                    var row = rows[i];
                    var fileName = row.FileName;
                    var msg = $(".message", t.el).html(`File [${fileName}] uploaded successfully.`);
                    $(".file-input", t.el).val('');

                }
                
                AsyncWidgets.WidgetScripts.frmSalesContracts.GenerateUploadFiles(objRes, t);
                $.showMessage(msg)
                
               // $('.message', t.el).text(response);
            },
            error: function (error)
            {
                $(".message", t.el).html("Error uploading file(s): " + error.statusText);
            }
        }); //end of Ajax
    });

    // Remove a file from the list
    $(document).on("click", ".remove-file", function ()
    {
        $(this).closest(".file-item").remove();
        $(".file-input", t.el).val('');
    });

    // Handle Drag drop file selection and display in the list
    $(".file-input", t.el).on("dragover", function (e)
    {
        e.preventDefault();
        e.stopPropagation();
        $(this).addClass("drag-over");
    });

    $(".file-input", t.el).on("dragleave", function (e)
    {
        e.preventDefault();
        e.stopPropagation();
        $(this).removeClass("drag-over");
    });

    $(".file-input", t.el).on("drop", function (e)
    {
        var isGUIDUpdateNeeded = false;
        if (val('FileGuid', t.el).trim() == "")
        {
            var guid = generateGuid();
            setField('FileGuid', guid, t.el);
            if (t.FormMode == 'update')
            {
                isGUIDUpdateNeeded = true;
            }
        }
        e.preventDefault();
        e.stopPropagation();
        $(this).removeClass("drag-over");

        var fileList = $(".file-list", t.el);

        var files = e.originalEvent.dataTransfer.files;
     
        for (var i = 0; i < files.length; i++)
        {
            var RfileName = files[i].name.replace(/[ .]/g, '_');

            var fileItem = $(`<div class='file-item ${RfileName}'></div>`);
            var fileName = $("<div class='file-name'></div>").text(files[i].name);
            var removeButton = $("<div class='remove-file'>X</div>");
            fileItem.css('background-color', 'lightcoral');
            fileItem.append(fileName);
            fileItem.append(removeButton);
            fileList.append(fileItem);
        }
    });

  //   Handle file selection and display in the list

    $(".file-input", t.el).change(function ()
    {
        var fileList = $(".file-list", t.el);
      

        var files = this.files;
        for (var i = 0; i < files.length; i++)
        {
            var RfileName = files[i].name.replace(/[ .]/g, '_');

        

            var fileItem = $(`<div class='file-item ${RfileName}'></div>`);
            var fileName = $("<div class='file-name'></div>").text(files[i].name);
            var removeButton = $("<div class='remove-file'>X</div>");
            fileItem.css('background-color', 'lightcoral'); 
            fileItem.append(fileName);
            fileItem.append(removeButton);
            fileList.append(fileItem);
        }
    });


    function generateGuid()
    {

        return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c)
        {
            var r = Math.random() * 16 | 0,
                v = c == 'x' ? r : (r & 0x3 | 0x8);
            return v.toString(16);
        });

    }

    t.on('onLoadedValues', function (params)
    {

        console.log(params);
         var params = { Command: 'FX_UPD_FileUpload', FileGuid: val('FileGuid', t.el), DBAction: 'GetUploadedFiles' };

        SInfo = getForm(null, null, params);
        var inv = new AsyncWidgets.RAInvoker();
        inv.on('onSuccess', function (res)
        {
            var res = decJSON(res);
            AsyncWidgets.WidgetScripts.frmSalesContracts.GenerateUploadFiles(res, t);
            $(t.el).unmask();
        });
        inv.invokeRA({ params: ["ActorId", "DataHelper", "ActionId", "GetData", "ServiceInfo", SInfo] });

    });
};


//GenerateUploadFiles
AsyncWidgets.WidgetScripts.frmSalesContracts.GenerateUploadFiles = function (res, t)
{
    if (res.status == 'OK')
    {
        if (res.Response.Rows.length > 0)
        {
            var rows = res.Response.Rows;
            var currentFileList = $('.file-list .file-item', t.el);
            var anchorFileList = $('.file-list .file-link', t.el);
            var $fileList = $(".file-list", t.el);
            for (var i = 0; i < rows.length; i++)
            {
                var row = rows[i];
                var fileName = row.FileName;
                var recId = row.RecId;
                var fileGuid = row.FileGuid;
                var RfileName = row.FileName.replace(/[ .]/g, '_');

                $("." + RfileName, t.el).remove();

                var fileLink = `<a class='file-link' href='Uploads/${recId}_${fileGuid}_${fileName}'>${fileName}</a>`;

            

                var fileItem = $('<div class="file-item"></div>');

                var fileNameElement = `<span class="file-name">${fileLink}</span>`;
                var removeButton = $('<span class="remove-button">X</span>');

                // Attach a click event to the remove button to handle removal
                removeButton.data('recId', recId);

                removeButton.data('fileName', fileName); // Store the file name in a data attribute

                removeButton.on('click', function ()
                {
                    var DeleteUploadFile = AsyncWidgets.WidgetScripts.frmSalesContracts.DeleteUploadFile;
                    var clickedRecId = $(this).data('recId'); // Get the recId from the data attribute
                    var clickedFileName = $(this).data('fileName'); // Get the file name from the data attribute

                    DeleteUploadFile(t, clickedRecId, clickedFileName);
                    $(this).closest('.file-item').remove();

                    console.log('Remove button clicked for file: ' + fileName);
                });

                // Append elements to the file item
                fileItem.append(fileNameElement);
                fileItem.append(removeButton);
                // Append the file item to the "file-list" element
                $fileList.append(fileItem);




            }
        }
    }
    function isFileNameDuplicate(fileName)
    {
        // Check if the file name already exists in the list
        return $fileList.find(".file-list .file-link").filter(function ()
        {
            return $(this).text() === fileName;
        }).length > 0;
    }
};

//Delete  upload file on SC form and db
AsyncWidgets.WidgetScripts.frmSalesContracts.DeleteUploadFile = function (t, recId, fileName)
{

    var params = { Command: 'FX_UPD_FileUpload', RecId: recId, DBAction: 'DeleteFile' };
    SInfo = getForm(null, null, params);
    var inv = new AsyncWidgets.RAInvoker();
    inv.on('onSuccess', function (res)
    {
        var res = decJSON(res);
        if (res.status == 'OK')
        {
            var response = res.Response || '';
            var msg = response.split('||');
            $.showMessage(`[${fileName}] ${msg[2]}`);
        } else
        {
            $.showMessage(`File [${fileName}] not Delete `);

        }
        $(t.el).unmask();
    });
    inv.invokeRA({ params: ["ActorId", "DataHelper", "ActionId", "DataAction", "ServiceInfo", SInfo] });
};


//convert to decimal 
AsyncWidgets.WidgetScripts.frmSalesContracts.ConvertToDecimal = function ()
{
    var t = AsyncWidgets.WidgetScripts.frmSalesContracts.t;

    //convert to decimal
    var decCarPrice = parseFloat($('[argumentid="Price"]',t.el).text());
    if (isNaN(decCarPrice))
    {
        $('[argumentid="Price"]').text('0.000')
    }
    else
    {
     $('[argumentid="Price"]', t.el).text(decCarPrice.toFixed(3));
    }


    var decAdditionalAmount = parseFloat($('[argumentid="AdditionalAmount"]', t.el).val());
    if (isNaN(decAdditionalAmount))
    {
        $('[argumentid="AdditionalAmount"]', t.el).val('0.000')
    }
    else
    {
        $('[argumentid="AdditionalAmount"]',t.el).val(decAdditionalAmount.toFixed(3));
    }

    var decDiscount = parseFloat($('[argumentid="Discount"]', t.el).val());
    if (isNaN(decDiscount))
    {
        ($('[argumentid="Discount"]', t.el).val('0.000'));
    } else
    {
        $('[argumentid="Discount"]', t.el).val(decDiscount.toFixed(3));
    }

    //if (isNaN(parseFloat($('[argumentid="ContractDiscount"]', t.el).val())))
    //{
    //    $('[argumentid="ContractDiscount"]', t.el).val('0.000');
    //    decContractDiscount = 0;
    //}
    //else
    //{
    //    decContractDiscount = parseFloat($('[argumentid="ContractDiscount"]', t.el).val());
    //    $('[argumentid="ContractDiscount"]', t.el).val(decContractDiscount.toFixed(3));
    //}


    var decTotalAmount = parseFloat($('[argumentid="TotalAmount"]',t.el).text());
    if (isNaN(decTotalAmount))
    {
        $('[argumentid="TotalAmount"]', t.el).text('0.000');
    }
    else
    {
        $('[argumentid="TotalAmount"]',t.el).text(decTotalAmount.toFixed(3));
    }

    var SalesContractTab = $('[tabid="SalesContractDetails"]', t.el);

    var decAmountReceived = parseFloat(val( 'PaymentAmount', SalesContractTab));
    if (isNaN(decAmountReceived))
    {
        setField('PaymentAmount','0.000', SalesContractTab);
        //$('[argumentid="PaymentAmount"]', t.el).text('0.000');
    }
    else
    {
        setField('PaymentAmount', decAmountReceived.toFixed(3), SalesContractTab);
       // $('[argumentid="PaymentAmount"]',t.el).text();
    }

    var decAmountDue = parseFloat($('[argumentid="AmountDue"]', t.el).text());
    if (isNaN(decAmountDue))
    {
        $('[argumentid="AmountDue"]', t.el).text('0.000');
    }
    else
    {
        $('[argumentid="AmountDue"]', t.el).text(decAmountDue.toFixed(3));
    }
};

