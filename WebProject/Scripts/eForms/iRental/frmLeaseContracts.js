/// <reference path="/JQuery/Common.js" />

AsyncWidgets.WidgetScripts.frmLeaseContracts = function (obj) {
    var t = obj;
    var conGrd = AsyncWidgets.get("conLeaseContracts_Cust");
    var conCar = AsyncWidgets.get("conLeaseContracts_Cars");

    $('.printBtn', t.el).click(function () { //
        var strlink = ROOT_PATH + "Pages/eForms/iRental/Reports/PrintOpenLeaseContract.aspx?FormCode=" + $('[argumentid="RecCode"]', t.el).text(); // +'&amp;FormId=' + pm.SelectedKey;
        console.log(strlink);
        var width = 920;
        var height = 600;
        var left = parseInt((screen.availWidth / 2) - (width / 2)) - 15;
        var top = parseInt((screen.availHeight / 2) - (height / 2));
        window.open(strlink, '_blank', "'titlebar=no,resizable=1,scrollbars=yes,height=" + height + ",width=" + width + ",left=" + left + ",top=" + top + "screenX=" + left + ",screenY=" + top + "'");
        console.log('Click on Print Button');

        return false;
    });

    $('.LeaseStatement', t.el).click(function ()
    { //
        var strlink = ROOT_PATH + "Pages/eForms/iRental/Reports/PrintStatementLeaseContracts.aspx?FormCode=" + $('[argumentid="RecCode"]', t.el).text(); // +'&amp;FormId=' + pm.SelectedKey;
        console.log(strlink);
        var width = 920;
        var height = 600;
        var left = parseInt((screen.availWidth / 2) - (width / 2)) - 15;
        var top = parseInt((screen.availHeight / 2) - (height / 2));
        window.open(strlink, '_blank', "'titlebar=no,resizable=1,scrollbars=yes,height=" + height + ",width=" + width + ",left=" + left + ",top=" + top + "screenX=" + left + ",screenY=" + top + "'");
        console.log('Click on Print Button');

        return false;
    });

    

    //On Focus of Customer Code to Get Customer Popup Selection
    $('[argumentid="CustomerRecCode"]', t.el).focus(function () {
        if (!conGrd._Masked) {
            conGrd._Masked = $('#MainContainer');
            conGrd._Masked.mask();

        }
        var txt = $(this), trow = txt.closest('tr');
        if (!t._LOVCon) {

            var rtop = trow.offset().top, lf = trow.offset().left, rw = trow.width();
            t._LOVCon = $('<div style="padding:0px;display:none;position:absolute;border:1px solid #8298B0;background:#EEEEFF;"></div>')
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
            t._LOVConCar = $('<div style="padding:0px;display:none;position:absolute;border:1px solid #8298B0;background:#EEEEFF;"></div>')
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
            AsyncWidgets.get('frmLeaseContracts').loadValues();
        }

        if (li.attr('tabid') == 'OtherCharges') {
            AsyncWidgets.get('grdLeaseOtherCharges').show().Requery();
        }

        if (li.attr('tabid') == 'PaymentDetails')
        {
          
            AsyncWidgets.get('grdLeasePaymentDetails').show().Requery();
        }

        if (li.attr('tabid') == 'ContractComments') {
            AsyncWidgets.get('grdLeaseContractComments').show().Requery();
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

    // On Start Date Selection Get Day Time
    var GetDays = function (e, vl, dt) {

        var weekday = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
        var sts = 0, sDate, cDate = new Date(), cH = cDate.getHours(), cM = cDate.getMinutes();

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

        if (sts) {
            return false;
        }

        //GetActualDays();
        //CalculateRentalContractChargesOnSuperEdit();

    };

    $('[argumentid="ContractStartDate"]', t.el).change(GetDays)[0].onDateSelect = GetDays;
    // End On Start Date Selection Get Day Time


    //On Change of Controls Calculate Rental Charges Again
    //$('[argumentid="CarRateType"],[argumentid="CarRate"],[argumentid="CarAllowedKM"],[argumentid="CarExtraKMRate"],[argumentid="ContractKMOut"],[argumentid="ContractKMIn"],[argumentid="ContractDiscount"],[argumentid="ContractTypeOL"]', t.el).change(CalculateRentalContractChargesOnSuperEdit);
    //End On Change of Controls Calculate Rental Charges Again

    // Get Last Payment Date
    function GetLastPaymentDate() {


        var intLeaseInstallments = $('[argumentid="LeaseInstallments"]', t.el).val();

        if (isNaN(parseFloat(intLeaseInstallments))) {
            intLeaseInstallments = 0;
        }

        var sDate = getDate($('[argumentid="LeaseFirstPaymentDate"]', t.el).val());

        if (sDate.toString() == 'NaN') {
            return false;
        }

        if (intLeaseInstallments > 0) {

            var sDateMonthsFromNow = new Date(sDate.getTime() + parseInt((30.3333333 * intLeaseInstallments) * 24 * 60 * 60 * 1000));

            var curDay = sDateMonthsFromNow.getDate();
            var curMonth = sDateMonthsFromNow.getMonth() + 1;
            var curYear = sDateMonthsFromNow.getFullYear()
            curDate = curDay + '/' + curMonth + '/' + curYear;

            $('[argumentid="LeaseLastPaymentDate"]', t.el).val(curDate);
        }

        //CalculateLeaseDetails();
    }
    // End Get Last Payment Date
    $('[argumentid="LeaseFirstPaymentDate"]', t.el).change(FocusGetDate)[0].onDateSelect = FocusGetDate;

    //Focus Date of First Payment Date and get Last Date
    function FocusGetDate() {
        $('[argumentid="LeaseFirstPaymentDate"]', t.el).focus().select();
        GetLastPaymentDate();
    }
    //End Focus Date of First Payment Date and get Last Date

    //Calculate Lease Payments
    function CalculateLeasePayments() {

        var intLeaseTotalAmount = $('[argumentid="LeaseTotalAmount"]', t.el).val();
        var intLeaseAdvancePaid = $('[argumentid="LeaseAdvancePaid"]', t.el).val();
        var intLeaseInstallments = $('[argumentid="LeaseInstallments"]', t.el).val();
        var intLeaseLastPayment = $('[argumentid="LeaseLastPayment"]', t.el).val();

        $('[argumentid="LeaseMonthlyPayment"]', t.el).val((parseFloat(intLeaseTotalAmount) - parseFloat(intLeaseAdvancePaid)) / parseFloat(intLeaseInstallments));
        $('[argumentid="LeaseLastPayment"]', t.el).val($('[argumentid="LeaseMonthlyPayment"]', t.el).val());

        if ($('[argumentid="LeaseMonthlyPayment"]', t.el).val() == 'Infinity') {
            $('[argumentid="LeaseMonthlyPayment"]', t.el).val(0);
            $('[argumentid="LeaseLastPayment"]', t.el).val(0);
        }

        if (isNaN($('[argumentid="LeaseMonthlyPayment"]', t.el).val())) {
            $('[argumentid="LeaseMonthlyPayment"]', t.el).val(0);
            $('[argumentid="LeaseLastPayment"]', t.el).val(0);
        }

        if (isNaN(parseFloat($('[argumentid="LeaseAdvancePaid"]', t.el).val()))) {
            $('[argumentid="LeaseAdvancePaid"]', t.el).val(0);
        }

        decLeaseTotalAmount = parseFloat($('[argumentid="LeaseTotalAmount"]', t.el).val());
        if (decLeaseTotalAmount > 0)
            $('[argumentid="LeaseTotalAmount"]', t.el).val(decLeaseTotalAmount.toFixed(3));

        decLeaseAdvancePaid = parseFloat($('[argumentid="LeaseAdvancePaid"]', t.el).val());
        if (decLeaseAdvancePaid > 0)
            $('[argumentid="LeaseAdvancePaid"]', t.el).val(decLeaseAdvancePaid.toFixed(3));

        decLeaseMonthlyPayment = parseFloat($('[argumentid="LeaseMonthlyPayment"]', t.el).val());
        if (decLeaseMonthlyPayment > 0)
            $('[argumentid="LeaseMonthlyPayment"]', t.el).val(decLeaseMonthlyPayment.toFixed(3));

        decLeaseLastPayment = parseFloat($('[argumentid="LeaseLastPayment"]', t.el).val());
        if (decLeaseLastPayment > 0)
            $('[argumentid="LeaseLastPayment"]', t.el).val(decLeaseLastPayment.toFixed(3));

        GetLastPaymentDate();
        CalculateLeaseDetails();
    }
    //End Calculate Lease Payments
    $('[argumentid="LeaseTotalAmount"],[argumentid="LeaseAdvancePaid"],[argumentid="LeaseInstallments"]', t.el).change(CalculateLeasePayments);

    //Get Last Payment Amount
    function CalculateLastPayment() {

        var intLeaseTotalAmount = $('[argumentid="LeaseTotalAmount"]', t.el).val();
        var intLeaseAdvancePaid = $('[argumentid="LeaseAdvancePaid"]', t.el).val();
        var intLeaseInstallments = $('[argumentid="LeaseInstallments"]', t.el).val();
        var intLeaseMonthlyPayment = $('[argumentid="LeaseMonthlyPayment"]', t.el).val();

        $('[argumentid="LeaseLastPayment"]', t.el).val((parseFloat(intLeaseTotalAmount) - parseFloat(intLeaseAdvancePaid)) - parseFloat(intLeaseMonthlyPayment) * (parseFloat(intLeaseInstallments) - 1));

        if (isNaN(parseFloat($('[argumentid="LeaseLastPayment"]', t.el).val()))) {
            $('[argumentid="LeaseMonthlyPayment"]', t.el).val(0);
            $('[argumentid="LeaseLastPayment"]', t.el).val(0);
        }

        decLeaseMonthlyPayment = parseFloat($('[argumentid="LeaseMonthlyPayment"]', t.el).val());
        if (decLeaseMonthlyPayment > 0)
            $('[argumentid="LeaseMonthlyPayment"]', t.el).val(decLeaseMonthlyPayment.toFixed(3));

        decLeaseLastPayment = parseFloat($('[argumentid="LeaseLastPayment"]', t.el).val());
        if (decLeaseLastPayment > 0)
            $('[argumentid="LeaseLastPayment"]', t.el).val(decLeaseLastPayment.toFixed(3));
    }
    //End Get Last Payment Amount
    $('[argumentid="LeaseMonthlyPayment"]', t.el).change(CalculateLastPayment);

    function monthDiff(date1, date2) {
        var m;
        m = (date2.getFullYear() - date1.getFullYear()) * 12;
        m -= date1.getMonth() + 1;
        m += date2.getMonth();
        return m;
    }

    // Calculate Lease Details
    function CalculateLeaseDetails() {

        var curDate = new Date();
        var strFirstInstallment = getDate($('[argumentid="LeaseFirstPaymentDate"]', t.el).val());

        //                                  var strcurDate = new Date();

        //                                  strcurDate.DateDiff({
        //                                      interval: "m",
        //                                      date1: strFirstInstallment,
        //                                      date2: curDate
        //                                  });

        var months = monthDiff(strFirstInstallment, curDate);

        var curDay = curDate.getDate();
        var curMonth = curDate.getMonth() + 1;
        var curYear = curDate.getFullYear()

        curDate = curMonth + '/' + curDay + '/' + curYear;

        var intInstallmentsTillDate;

        var mycurDate = new Date(curDate);

        if (getDate($('[argumentid="LeaseFirstPaymentDate"]', t.el).val()) <= mycurDate) {
            intInstallmentsTillDate = months + 2;
        }
        else {
            intInstallmentsTillDate = 0;
        }


        var intLeaseInstallments;
        var AddLastPaymentAmount = 0;

        if (isNaN(parseFloat($('[argumentid="LeaseInstallments"]', t.el).val()))) {
            intLeaseInstallments = 0;
        }
        else {
            intLeaseInstallments = $('[argumentid="LeaseInstallments"]', t.el).val();
        }

        if (intInstallmentsTillDate > intLeaseInstallments) {
            $('[argumentid="InstallmentsTillDate"]', t.el).text(intLeaseInstallments);
            AddLastPaymentAmount = 1;
        }
        else {
            $('[argumentid="InstallmentsTillDate"]', t.el).text(intInstallmentsTillDate);
        }


        var intLeaseMonthlyPayment = $('[argumentid="LeaseMonthlyPayment"]', t.el).val();
        var intLeaseDueInstallments = $('[argumentid="InstallmentsTillDate"]', t.el).text();
        var intLeaseLastPayment = $('[argumentid="LeaseLastPayment"]', t.el).val();

        if (isNaN(parseFloat(intLeaseMonthlyPayment))) {
            intLeaseMonthlyPayment = 0;
        }

        if (isNaN(parseFloat(intLeaseDueInstallments))) {
            intLeaseDueInstallments = 0;
        }

        if (isNaN(parseFloat(intLeaseLastPayment))) {
            intLeaseLastPayment = 0;
        }


        if (isNaN(parseFloat($('[argumentid="TotalPaidByCustomer"]', t.el).text()))) {
            $('[argumentid="TotalPaidByCustomer"]', t.el).text('0.000');
        }

        if (AddLastPaymentAmount > 0) {

            intLeaseDueInstallments = intLeaseDueInstallments - 1;

            $('[argumentid="AmountTillDate"]', t.el).text(parseFloat($('[argumentid="LeaseAdvancePaid"]', t.el).val()) + (parseFloat(intLeaseMonthlyPayment) * parseFloat(intLeaseDueInstallments)));
            $('[argumentid="AmountTillDate"]', t.el).text(parseFloat($('[argumentid="AmountTillDate"]', t.el).text()) + parseFloat(intLeaseLastPayment));
			$('[argumentid="AmountDue"]', t.el).text(parseFloat($('[argumentid="AmountTillDate"]', t.el).text()) - parseFloat($('[argumentid="TotalPaidByCustomer"]', t.el).text()));

        }
        else {

            $('[argumentid="AmountTillDate"]', t.el).text(parseFloat($('[argumentid="LeaseAdvancePaid"]', t.el).val()) + (parseFloat(intLeaseMonthlyPayment) * parseFloat(intLeaseDueInstallments)));
            $('[argumentid="AmountDue"]', t.el).text(parseFloat($('[argumentid="AmountTillDate"]', t.el).text()) - parseFloat($('[argumentid="TotalPaidByCustomer"]', t.el).text()));
        }
       // debugger;
        if (parseFloat($('[argumentid="TotalPaidByCustomer"]', t.el).text()) < parseFloat($('[argumentid="LeaseAdvancePaid"]', t.el).val())) {
            $('[argumentid="InstallmentsDue"]', t.el).text((parseFloat($('[argumentid="AmountDue"]', t.el).text()) - parseFloat($('[argumentid="LeaseAdvancePaid"]', t.el).val())) / parseFloat($('[argumentid="LeaseMonthlyPayment"]', t.el).val()));
        }
        else {
            $('[argumentid="InstallmentsDue"]', t.el).text(parseFloat($('[argumentid="AmountDue"]', t.el).text()) / parseFloat($('[argumentid="LeaseMonthlyPayment"]', t.el).val()));
        }

        decAmountTillDate = parseFloat($('[argumentid="AmountTillDate"]', t.el).text());
        $('[argumentid="AmountTillDate"]', t.el).text(decAmountTillDate.toFixed(3));

        decAmountDue = parseFloat($('[argumentid="AmountDue"]', t.el).text());
        $('[argumentid="AmountDue"]', t.el).text(decAmountDue.toFixed(3));

        intInstallmentsDue = parseFloat($('[argumentid="InstallmentsDue"]', t.el).text());
        $('[argumentid="InstallmentsDue"]', t.el).text(intInstallmentsDue.toFixed(0));


        decTotalPaidByCustomer = parseFloat($('[argumentid="TotalPaidByCustomer"]', t.el).text());
        $('[argumentid="TotalPaidByCustomer"]', t.el).text(decTotalPaidByCustomer.toFixed(3));

        decContractOtherCharges = parseFloat($('[argumentid="ContractOtherCharges"]', t.el).text());
        if (isNaN(parseFloat(decContractOtherCharges))) {
            decContractOtherCharges = 0;
        }
        $('[argumentid="ContractOtherCharges"]', t.el).text(decContractOtherCharges.toFixed(3));

        decTotalAmountDue = decAmountDue + decContractOtherCharges;
        $('[argumentid="TotalAmountDue"]', t.el).text(decTotalAmountDue.toFixed(3));
    }
    // End Calculate Lease Details


    // Check if Payment Cleared to Enable Disable Payment Clear Button
    function CheckPaymentCleared() {

        //Disable Button Close Contract - Payment Cleared if the Contract Due Amount is > 0
        var strStatus = $('[argumentid="StateName"]', t.el).text();

        if (strStatus != '' && strStatus != 'Start State' && strStatus != 'Created - Reservation' && strStatus != 'Contract Closed - Payment Cleared' && strStatus != 'With Legal - Contract Open - Car In' && strStatus != 'With Legal - Contract Open - Car Out' && strStatus != 'With Legal - Contract Closed - Pending Payment') {

            decLeaseCurrentDueAmount = parseFloat($('[argumentid="TotalAmountDue"]', t.el).text());
            if (decLeaseCurrentDueAmount > 0) {
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
    // End Check if Payment Cleared to Enable Disable Payment Clear Button


    //On Click of Edit Button by Super User
    $('.Button_Edit', t.el).click(function () {
        $('.CommonDisable,.DisableOnClose,.SuperUserEdit,.btn_1,.btn_2,.btn_10', t.el).removeAttr('disabled').removeClass('ElemDisabled');
        $('[argumentid="ContractStartDate"]', t.el).next('img').show().removeAttr('disabled').removeClass('ElemDisabled');
        $('[argumentid="LeaseFirstPaymentDate"]', t.el).next('img').show().removeAttr('disabled').removeClass('ElemDisabled');
        $('[argumentid="LeaseLastPaymentDate"]', t.el).next('img').show().removeAttr('disabled').removeClass('ElemDisabled');
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
        $('[argumentid="LeaseFirstPaymentDate"]', t.el).next('img').show().addClass('CommonDisable');
        $('[argumentid="LeaseLastPaymentDate"]', t.el).next('img').hide().addClass('AlwaysDisable');
        $('.contDetailsIcon', t.el).addClass('w-ui-panel-icon-closed').removeClass('w-ui-panel-icon-opened');

        $('.SimpleTab', t.el).attr('disabled', 'disabled');

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
            GetDays($('[argumentid="ContractStartDate"]', t.el));
        }

        $('.btn_10', t.el).hide();
        $('.btn_11', t.el).show();

        $('.CommonDisable,.DisableOnClose,.btn_10', t.el).removeAttr('disabled');
        $('input[disabled="disabled"]:not([type="radio"]),textarea[disabled="disabled"],select[disabled="disabled"]', t.el).addClass('ElemDisabled');
        $('span[argumentid="ChassisNo"],span[argumentid="CustomerName"],span[argumentid="InsuranceExpiry"],span[argumentid="FullInsuranceExpiry"],span[argumentid="PassportExpiry"],span[argumentid="NationalIDExpiryDate"],span[argumentid="DrivingLicenseExpiry"]', t.el).css('color', '#628296'); //Change Color to Normal on form show

        if ($('[argumentid="LeaseTotalAmount"]', t.el).val() == '') {
            $('[argumentid="LeaseTotalAmount"]', t.el).val(0);
        }
        if ($('[argumentid="LeaseAdvancePaid"]', t.el).val() == '') {
            $('[argumentid="LeaseAdvancePaid"]', t.el).val(0);
        }
        if ($('[argumentid="LeaseInstallments"]', t.el).val() == '') {
            $('[argumentid="LeaseInstallments"]', t.el).val(0);
        }
        if ($('[argumentid="LeaseMonthlyPayment"]', t.el).val() == '') {
            $('[argumentid="LeaseMonthlyPayment"]', t.el).val(0);
        }
        if ($('[argumentid="LeaseLastPayment"]', t.el).val() == '') {
            $('[argumentid="LeaseLastPayment"]', t.el).val(0);
        }
    });
    // End On Form Show

    // On Start of Onloaded Values

    t.on('onLoadedValues', function (args) {

       // alert             ("onloaded calling")
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
            $('[argumentid="ContractStartDate"]', t.el).next('img').show();
            $('[argumentid="LeaseFirstPaymentDate"]', t.el).next('img').show();
            $('[argumentid="LeaseLastPaymentDate"]', t.el).next('img').hide();

            if ($('[argumentid="StateId"]', t.el).text() == 'RRCStartState') {
                $('.btn_2,.btn_3,.btn_4,.btn_5,.btn_6,.btn_7,.btn_8,.btn_9', t.el).attr('disabled', 'disabled');
                $('.OnLoadHide', t.el).hide();
                $('[argumentid="OutLocationId"]', t.el).removeAttr('disabled').removeClass('ElemDisabled');
                $('.Button_Edit', t.el).hide();
            }

            if ($('[argumentid="StateId"]', t.el).text() == 'RRCCreatedState') {
                $('.btn_2,.btn_3,.btn_4,.btn_5,.btn_6,.btn_7,.btn_8,.btn_9', t.el).attr('disabled', 'disabled');
                $('.OnLoadHide', t.el).hide();
                $('[argumentid="OutLocationId"]', t.el).removeAttr('disabled').removeClass('ElemDisabled');
                $('.Button_Edit', t.el).hide();
            }

            if ($('[argumentid="StateId"]', t.el).text() == 'RRCContractOpen') {
                $('.btn_1,.btn_7,.btn_8', t.el).attr('disabled', 'disabled');
                $('.CommonDisable', t.el).attr('disabled', 'disabled');
                $('[argumentid="InLocationId"]', t.el).val($('[argumentid="OutLocationId"]', t.el).val());
                $('[argumentid="ContractKMIn"]', t.el).addClass('required');
            }

            if ($('[argumentid="StateId"]', t.el).text() == 'RRCContractOpenCarIn') {
                $('.btn_2,.btn_5,.btn_6,.btn_8', t.el).attr('disabled', 'disabled');
                $('.CommonDisable', t.el).attr('disabled', 'disabled');
                $('[argumentid="InLocationId"]', t.el).val($('[argumentid="OutLocationId"]', t.el).val());
            }

            if ($('[argumentid="StateId"]', t.el).text() == 'RRCWithLegalContractOpenCarOut') {
                $('.btn_2,.btn_3,.btn_4,.btn_5,.btn_6,.btn_7,.btn_8,.btn_10', t.el).attr('disabled', 'disabled');
                $('.CommonDisable,.DisableOnClose', t.el).attr('disabled', 'disabled');
                $('[argumentid="InLocationId"]', t.el).val($('[argumentid="OutLocationId"]', t.el).val());
            }

            if ($('[argumentid="StateId"]', t.el).text() == 'RRCWithLegalContractOpenCarIn') {
                $('.btn_1,.btn_3,.btn_4,.btn_5,.btn_6,.btn_7,.btn_8,.btn_10', t.el).attr('disabled', 'disabled');
                $('.CommonDisable,.DisableOnClose', t.el).attr('disabled', 'disabled');
                $('[argumentid="InLocationId"]', t.el).val($('[argumentid="OutLocationId"]', t.el).val());
            }

            if ($('[argumentid="StateId"]', t.el).text() == 'RRCWithLegalContractClosedPendingPayment') {
                $('.btn_1,.btn_2,.btn_4,.btn_5,.btn_6,.btn_7,.btn_8,.btn_10', t.el).attr('disabled', 'disabled');
                $('.CommonDisable,.DisableOnClose', t.el).attr('disabled', 'disabled');
                $('[argumentid="ContractStartDate"]', t.el).next('img').hide();
                $('[argumentid="LeaseFirstPaymentDate"]', t.el).next('img').hide();
                $('[argumentid="LeaseLastPaymentDate"]', t.el).next('img').hide();
            }

            if ($('[argumentid="StateId"]', t.el).text() == 'RRCContractClosedPendingPayment') {
                $('.btn_2,.btn_3,.btn_5,.btn_6,.btn_7,.btn_10', t.el).attr('disabled', 'disabled');
                $('.CommonDisable,.DisableOnClose', t.el).attr('disabled', 'disabled');
                $('[argumentid="ContractStartDate"]', t.el).next('img').hide();
                $('[argumentid="LeaseFirstPaymentDate"]', t.el).next('img').hide();
                $('[argumentid="LeaseLastPaymentDate"]', t.el).next('img').hide();
            }

            if ($('[argumentid="StateId"]', t.el).text() == 'RRCContractClosed') {
                $('.btn_1,.btn_2,.btn_3,.btn_4,.btn_5,.btn_6,.btn_7,.btn_8,.btn_10', t.el).attr('disabled', 'disabled');
                $('.CommonDisable,.DisableOnClose', t.el).attr('disabled', 'disabled');
                $('[argumentid="ContractStartDate"]', t.el).next('img').hide();
                $('[argumentid="LeaseFirstPaymentDate"]', t.el).next('img').hide();
                $('[argumentid="LeaseLastPaymentDate"]', t.el).next('img').hide();
            }

            if ($('[argumentid="StateId"]', t.el).text() == 'RRCContractCancelled') {
                $('.btn_1,.btn_2,.btn_3,.btn_4,.btn_5,.btn_6,.btn_7,.btn_8,.btn_9,.btn_10', t.el).attr('disabled', 'disabled');
                $('.CommonDisable,.DisableOnClose', t.el).attr('disabled', 'disabled');
                $('[argumentid="ContractStartDate"]', t.el).next('img').hide();
                $('[argumentid="LeaseFirstPaymentDate"]', t.el).next('img').hide();
                $('[argumentid="LeaseLastPaymentDate"]', t.el).next('img').hide();
            }


            CalculateLeaseDetails(); // Calculate Lease Details
            //CheckPaymentCleared(); // Check if Payment Cleared to Enable Disable Payment Clear Button

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
    ;