

AsyncWidgets.WidgetScripts.frmRentalContracts = function (obj) {

    var t = obj;

    AsyncWidgets.WidgetScripts.frmRentalContracts.t = t;

    var conGrd = AsyncWidgets.get("conRentalContracts_Cust");
    var conCar = AsyncWidgets.get("conRentalContracts_Cars");


    //On Focus of Customer Code to Get Customer Popup Selection
    $('[argumentid="CustomerRecCode"]', t.el).focus(function () {
        if (!conGrd._Masked) {
            conGrd._Masked = $('#MainContainer');
            conGrd._Masked.mask();

        }
        var txt = $(this), trow = txt.closest('tr');
        if (!t._LOVCon) {
            var rtop = trow.offset().top, lf = trow.offset().left, rw = trow.width();
            t._LOVCon = $(' <div style="padding:0px;display:none;position:absolute;border:1px solid #8298B0;background:#EEEEFF;"> /div>')
                .css({ 'top': 100, 'width': rw - 2, left: lf });
            $('body').append(t._LOVCon);
        }

        t._LOVCon.css('z-index', 9999).append(conGrd.el).show();
        conGrd._frm = t;
        conGrd.show();
        $('.reset', conGrd.el).trigger('click');
        $('.search', conGrd.el).trigger('click');

    });
    //End On Focus of Customer Code to Get Customer Popup Selection

    //On Focus of Car Number to Get Cars Popup Selection
    $('[argumentid="CarNumber"]', t.el).focus(function () {
        $('[argumentid="CarNumber"]', t.el).css({ 'color': 'red', 'font-style': 'normal', 'font-weight': 'bold' });

        if (!$('[argumentid="OutLocationId"]', t.el).val()) {
            $('[argumentid="CarNumber"]', t.el).val('Please Select Location').css({ 'color': '#A5A5A5', 'font-style': 'italic', 'font-weight': 'normal' });
            $('[argumentid="OutLocationId"]', t.el).focus().blur().focus();
            t.showInvalid(t);
            return;
        }

        if (!conCar._Masked) {
            conCar._Masked = $('#MainContainer');
            conCar._Masked.mask();

        }
        var txt = $(this), trow = txt.closest('tr');
        if (!t._LOVConCar) {
            var rtop = trow.offset().top, lf = trow.offset().left, rw = trow.width();
            t._LOVConCar = $(' div style="padding:0px;display:none;position:absolute;border:1px solid #8298B0;background:#EEEEFF;"> /div>')
                .css({ 'top': 100, 'width': rw - 2, left: lf });
            $('body').append(t._LOVConCar);
        }

        t._LOVConCar.css('z-index', 9999).append(conCar.el).show();
        conCar._frm = t;
        conCar.show();
        $('.reset', conCar.el).trigger('click');
        $('.search', conCar.el).trigger('click');
    });
    //End On Focus of Car Number to Get Cars Popup Selection

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

        if (li.attr('tabid') == 'ContractDetails') {
            AsyncWidgets.get('frmRentalContracts').loadValues();
        }

        if (li.attr('tabid') == 'AdditionalDrivers') {
            AsyncWidgets.get('grdAdditionalDrivers').show().Requery();
        }

        if (li.attr('tabid') == 'OtherCharges') {
            AsyncWidgets.get('grdOtherCharges').show().Requery();
        }

        if (li.attr('tabid') == 'PaymentDetails') {
            AsyncWidgets.get('grdPaymentDetails').show().Requery();
        }

        if (li.attr('tabid') == 'ContractComments') {
            AsyncWidgets.get('grdContractComments').show().Requery();
        }

        return false;
    });
    // End

    // Date Difference Function
    var cDate = function (date) {
        var dttmAr = date.split(' '), dt, tm, nDate;
        dt = dttmAr[0].split('/');
        if (dttmAr.length > 1) {
            tm = dttmAr[1].split(':');
            return new Date(dt[2], dt[1] - 1, dt[0], tm[0], tm[1], tm[2]);
        }
        return new Date(dt[2], dt[1] - 1, dt[0]);
    };
    var dateDiff = function (d1, d2) {
        return (d1 - d2) / (3600000 * 24);
    };
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

    var getDate = function (iParam) {
        var x = iParam.split("/");
        day = x[0];
        mon = x[1];
        year = x[2];
        var myDate = new Date(year, mon - 1, day);
        return myDate;
    };


    // On Start & Expiry Date Selection Get Day Time and Days
    var GetDays = function (e, vl, dt) {


        var weekday = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
        var sts = 0, sDate, eDate, cDate = new Date(), cH = cDate.getHours(), cM = cDate.getMinutes();

        cH = cH < 10 ? '0' + cH : cH;
        cM = cM < 10 ? '0' + cM : cM;

        sDate = getDate($('[argumentid="ContractStartDate"]', t.el).val());
        if ($(e).attr('argumentid') == 'ContractStartDate') {
            if (sDate.toString() == 'NaN') {
                $('[argumentid="ContractStartDay"],[argumentid="ContractStartTime"]', t.el).val('');
                sts = 1;
            }
            else {
                $('[argumentid="ContractStartDay"]', t.el).val(weekday[sDate.getDay()]);
                $('[argumentid="ContractStartTime"]', t.el).val(cH + ':' + cM);
            }
        }

        eDate = getDate($('[argumentid="ContractExpiryDate"]', t.el).val());
        if ($(e).attr('argumentid') == 'ContractExpiryDate') {
            if (eDate.toString() == 'NaN') {
                $('[argumentid="ContractExpiryDay"],[argumentid="ContractExpiryTime"],[argumentid="ContractDays"]', t.el).val('');
                sts = 1;
            }
            else {
                $('[argumentid="ContractExpiryDay"]', t.el).val(weekday[eDate.getDay()]);
                $('[argumentid="ContractExpiryTime"]', t.el).val(cH + ':' + cM);
            }
        }

        if (sts) {
            return false;
        }

        if (sDate > eDate) {
            if ($(e).attr('argumentid') == 'ContractStartDate') {
                alert('Contract Start Date has to be less than Contract Expiry Date');
                $('[argumentid="ContractStartDate"],[argumentid="ContractStartDay"],[argumentid="ContractStartTime"],[argumentid="ContractDays"]', t.el).val('');

            }
            else {
                alert('Contract Expiry Date has to be greater than Contract Start Date');
                $('[argumentid="ContractExpiryDate"],[argumentid="ContractExpiryDay"],[argumentid="ContractExpiryTime"],[argumentid="ContractDays"]', t.el).val('');
            }
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

        $('[argumentid="ContractDays"]', t.el).val(days);

        GetActualDays();
        CalculateRentalContractChargesOnSuperEdit();

    };

    $('[argumentid="ContractStartDate"]', t.el).change(GetDays)[0].onDateSelect = GetDays;
    $('[argumentid="ContractExpiryDate"]', t.el).change(GetDays)[0].onDateSelect = GetDays;
    // End On Start & Expiry Date Selection Get Day Time and Days

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


    $('[argumentid="ContractEndDate"]', t.el).change(function () { GetActualDays(); CalculateRentalContractChargesOnSuperEdit(); })[0].onDateSelect = function () { GetActualDays(); CalculateRentalContractChargesOnSuperEdit(); };
    //$('[argumentid="ContractEndDate"]', t.el).change(CalculateRentalContractChargesOnSuperEdit)[0].onDateSelect = CalculateRentalContractChargesOnSuperEdit;
    // End On Start & Expiry Date Selection Get Day Time and Days

    //On Change of Controls Calculate Rental Charges Again
    //$('[argumentid="ContractStartDate"]', t.el).change(CalculateRentalContractChargesOnSuperEdit)[0].onDateSelect = CalculateRentalContractChargesOnSuperEdit;
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

        //Disable Button Close Contract - Payment Cleared if the Contract Due Amount is > 0, currently apply only for Rental Contract later apply for lease

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

    // On Form Show
    t.on('show', function (args) {

        //Always Move to First Tab on Show
        var li = $('li[tabid="ContractDetails"]', t.el), tbl;
        li.parent().children('li.active').removeClass('active');
        li.addClass('active');
        tbl = li.closest('table').children();
        tbl.children('tr:not(:first)').hide();
        tbl.children('tr[tabid="' + li.attr('tabid') + '"]').show();
        $('.tabid', t.el).val(li.attr('tabid'));
        //End Always Move to First Tab on Show

        // Hide Edit For Normal Users
        $('[roles]', t.el).hide().each(function () {
            if (AsyncWidgets.user.conf.Roles.indexOf($(this).attr('roles')) > -1) {
                $(this).show();
            }
        });

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

        $('[argumentid="CarRateType"] option:not(:first)', t.el).remove(); //Clear Car Rate Type

        var CurrentDate = new Date(); //Get Current Date to set Start Date On New for particular states
        var cD = CurrentDate.getDate() < 10 ? '0' + CurrentDate.getDate() : CurrentDate.getDate();
        var cM = (CurrentDate.getMonth() + 1) < 10 ? '0' + (CurrentDate.getMonth() + 1) : (CurrentDate.getMonth() + 1);
        var cY = CurrentDate.getFullYear();

        if ($('[argumentid="StateId"]', t.el).text() == '') {
            $('[argumentid="StateId"]', t.el).text('RRCStartState');
            $('[argumentid="StateName"]', t.el).text('Start State');
            $('.btn_1,.btn_2,.btn_3,.btn_4,.btn_5,.btn_6,.btn_7,.btn_8,.btn_9', t.el).attr('disabled', 'disabled');
            $('.Button_Edit', t.el).hide();
            $('[argumentid="ContractStartDate"]', t.el).val(cD + '/' + cM + '/' + cY);
            //$('[argumentid="ContractStartDate"]', t.el).change(GetDays)[0].onDateSelect = GetDays;
            //sdebugger;
            GetDays($('[argumentid="ContractStartDate"]', t.el));
        }

        $('.btn_10', t.el).hide();
        $('.btn_11', t.el).show();

        $('.CommonDisable,.DisableOnClose,.btn_10', t.el).removeAttr('disabled');
        $('input[disabled="disabled"]:not([type="radio"]),textarea[disabled="disabled"],select[disabled="disabled"]', t.el).addClass('ElemDisabled');
        $('span[argumentid="ChassisNo"],span[argumentid="CustomerName"],span[argumentid="InsuranceExpiry"],span[argumentid="FullInsuranceExpiry"],span[argumentid="PassportExpiry"],span[argumentid="NationalIDExpiryDate"],span[argumentid="DrivingLicenseExpiry"]', t.el).css('color', '#628296'); //Change Color to Normal on form show

        if ($('[argumentid="CarRate"]', t.el).val() == '') {
            $('[argumentid="CarRate"]', t.el).val(0);
        }
        if ($('[argumentid="CarAllowedKM"]', t.el).val() == '') {
            $('[argumentid="CarAllowedKM"]', t.el).val(0);
        }
        if ($('[argumentid="CarExtraKMRate"]', t.el).val() == '') {
            $('[argumentid="CarExtraKMRate"]', t.el).val(0);
        }
    });
    // End On Form Show

    // On Start of Onloaded Values
    t.on('onLoadedValues', function (args) {

        t.fireEvent('show');

        $('.btn_11', t.el).hide();
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
            HLD('InsuranceExpiry', 'ChassisNo')('FullInsuranceExpiry', 'ChassisNo')('PassportExpiry', 'CustomerName')('NationalIDExpiryDate', 'CustomerName')('DrivingLicenseExpiry', 'CustomerName');
            // End of Highlight of expired dates

            $('.OnNewHide', t.el).show();
            $('.SimpleTab', t.el).removeAttr('disabled');

            SHMileageType(); // This function is called to hide show Mileage Type Related Fields on Value Loaded

            //Load Car Rate Types
            t.LoadCombo(t, $('[argumentid="CarRateType"]', t.el));
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

            if ($('[argumentid="StateId"]', t.el).text() == 'RRCStartState') {
                $('.btn_2,.btn_3,.btn_4,.btn_5,.btn_6,.btn_7,.btn_8,.btn_9', t.el).attr('disabled', 'disabled');
                $('.OnLoadHide', t.el).hide();
                $('[argumentid="OutLocationId"]', t.el).removeAttr('disabled').removeClass('ElemDisabled');
                $('.Button_Edit', t.el).hide();
            }

            if ($('[argumentid="StateId"]', t.el).text() == 'RRCCreatedState') {
                $('.btn_2,.btn_3,.btn_4,.btn_5,.btn_6,.btn_7,.btn_8,.btn_9', t.el).attr('disabled', 'disabled');
                $('.OnLoadHide', t.el).hide();
                //$('.SimpleTab', t.el).attr('disabled', 'disabled');
                $('[argumentid="OutLocationId"]', t.el).removeAttr('disabled').removeClass('ElemDisabled');
                $('.Button_Edit', t.el).hide();
            }

            if ($('[argumentid="StateId"]', t.el).text() == 'RRCContractOpen') {
                $('.btn_1,.btn_7,.btn_8', t.el).attr('disabled', 'disabled');
                $('.CommonDisable', t.el).attr('disabled', 'disabled');
                $('[argumentid="ContractEndDate"]', t.el).val(cD + '/' + cM + '/' + cY);
                GetActualDays();

                $('[argumentid="InLocationId"]', t.el).val($('[argumentid="OutLocationId"]', t.el).val());

                $('[argumentid="ContractKMIn"]', t.el).addClass('required');

            }

            if ($('[argumentid="StateId"]', t.el).text() == 'RRCContractOpenCarIn') {
                $('.btn_2,.btn_5,.btn_6,.btn_8', t.el).attr('disabled', 'disabled');
                $('.CommonDisable', t.el).attr('disabled', 'disabled');
                $('[argumentid="ContractEndDate"]', t.el).val(cD + '/' + cM + '/' + cY);
                GetActualDays();

                $('[argumentid="InLocationId"]', t.el).val($('[argumentid="OutLocationId"]', t.el).val());
            }

            if ($('[argumentid="StateId"]', t.el).text() == 'RRCWithLegalContractOpenCarOut') {
                $('.btn_2,.btn_3,.btn_4,.btn_5,.btn_6,.btn_7,.btn_8,.btn_10', t.el).attr('disabled', 'disabled');
                $('.CommonDisable,.DisableOnClose', t.el).attr('disabled', 'disabled');
                $('[argumentid="ContractEndDate"]', t.el).val(cD + '/' + cM + '/' + cY);
                GetActualDays();

                $('[argumentid="InLocationId"]', t.el).val($('[argumentid="OutLocationId"]', t.el).val());
            }

            if ($('[argumentid="StateId"]', t.el).text() == 'RRCWithLegalContractOpenCarIn') {
                $('.btn_1,.btn_3,.btn_4,.btn_5,.btn_6,.btn_7,.btn_8,.btn_10', t.el).attr('disabled', 'disabled');
                $('.CommonDisable,.DisableOnClose', t.el).attr('disabled', 'disabled');
                $('[argumentid="ContractEndDate"]', t.el).val(cD + '/' + cM + '/' + cY);
                GetActualDays();

                $('[argumentid="InLocationId"]', t.el).val($('[argumentid="OutLocationId"]', t.el).val());
            }

            if ($('[argumentid="StateId"]', t.el).text() == 'RRCWithLegalContractClosedPendingPayment') {
                $('.btn_1,.btn_2,.btn_4,.btn_5,.btn_6,.btn_7,.btn_8,.btn_10', t.el).attr('disabled', 'disabled');
                $('.CommonDisable,.DisableOnClose', t.el).attr('disabled', 'disabled');
                $('[argumentid="ContractStartDate"]', t.el).next('img').hide();
                $('[argumentid="ContractExpiryDate"]', t.el).next('img').hide();
                $('[argumentid="ContractEndDate"]', t.el).next('img').hide();
            }

            if ($('[argumentid="StateId"]', t.el).text() == 'RRCContractClosedPendingPayment') {
                $('.btn_2,.btn_3,.btn_5,.btn_6,.btn_7,.btn_10', t.el).attr('disabled', 'disabled');
                $('.CommonDisable,.DisableOnClose', t.el).attr('disabled', 'disabled');
                $('[argumentid="ContractStartDate"]', t.el).next('img').hide();
                $('[argumentid="ContractExpiryDate"]', t.el).next('img').hide();
                $('[argumentid="ContractEndDate"]', t.el).next('img').hide();
            }

            if ($('[argumentid="StateId"]', t.el).text() == 'RRCContractClosed') {
                $('.btn_1,.btn_2,.btn_3,.btn_4,.btn_5,.btn_6,.btn_7,.btn_8,.btn_10', t.el).attr('disabled', 'disabled');
                $('.CommonDisable,.DisableOnClose', t.el).attr('disabled', 'disabled');
                $('[argumentid="ContractStartDate"]', t.el).next('img').hide();
                $('[argumentid="ContractExpiryDate"]', t.el).next('img').hide();
                $('[argumentid="ContractEndDate"]', t.el).next('img').hide();
            }

            if ($('[argumentid="StateId"]', t.el).text() == 'RRCContractCancelled') {
                $('.btn_1,.btn_2,.btn_3,.btn_4,.btn_5,.btn_6,.btn_7,.btn_8,.btn_9,.btn_10', t.el).attr('disabled', 'disabled');
                $('.CommonDisable,.DisableOnClose', t.el).attr('disabled', 'disabled');
                $('[argumentid="ContractStartDate"]', t.el).next('img').hide();
                $('[argumentid="ContractExpiryDate"]', t.el).next('img').hide();
                $('[argumentid="ContractEndDate"]', t.el).next('img').hide();
            }


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

        }
    });
    // End of On Loaded Values
}