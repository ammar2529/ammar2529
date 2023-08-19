
AsyncWidgets.WidgetScripts.grdLeaseContracts_Cars = function (obj) {

    var t = obj;


    //CustomerRecCode
        var conCar = AsyncWidgets.get("conLeaseContracts_Cars");
        var f = conCar._frm;

        t.on('beforeSearchGetForm', function (p) {
            p.CarLocationId = f.GetArgVal('OutLocationId');
        });

        t.on('rowsRendered', function () {

            $('[colid="Status"]:not(".w-grid-head-cell")').each(function () {
                var ptr = $(this).closest('tr');
                if ($(this).text().toLowerCase().trim() != "available") {

                    ptr.css({ background: '#F1F1F1', cursor: 'not-allowed' })
                        .prop('disabled', true);
                    $("div.ColValue", ptr).css('cursor', 'not-allowed');
                    //$('td:nth-child(3)', ptr).css('cursor', '').unbind();


                    //  
                    //   , cursor: 'not-allowed'

                }
                else {
                    $("div.ColValue", ptr).css('cursor', 'pointer');
                    ptr.css('cursor', 'pointer');
                }
            });

            $('table[itemno]', t.el).click(function () {

                if ($('[colid="Status"] .ColValue', this).text().toLowerCase() != "available") {
                    return;
                }

                $('[argumentid="CarNumber"]', f.el).val($('[colid="CarNumber"] .ColValue', this).text());
                $('[argumentid="ChassisNo"]', f.el).text($('[colid="ChassisNo"] .ColValue', this).text());
                $('[argumentid="Brand"]', f.el).text($('[colid="BrandId"] .ColValue', this).text());
                $('[argumentid="Model"]', f.el).text($('[colid="ModelId"] .ColValue', this).text());
                $('[argumentid="CarYear"]', f.el).text($('[colid="CarYear"] .ColValue', this).text());
                $('[argumentid="Color"]', f.el).text($('[colid="ColorId"] .ColValue', this).text());
                $('[argumentid="Type"]', f.el).text($('[colid="TypeId"] .ColValue', this).text());
                $('[argumentid="InsuranceExpiry"]', f.el).text($('[colid="frmInsuranceExpiry"] .ColValue', this).text());
                $('[argumentid="FullInsuranceExpiry"]', f.el).text($('[colid="frmFullInsuranceExpiry"] .ColValue', this).text());
                $('[argumentid="CarPreviousKM"]', f.el).text($('[colid="CurrentMileage"] .ColValue', this).text());
                $('[argumentid="ContractKMOut"]', f.el).val($('[colid="CurrentMileage"] .ColValue', this).text());

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

                $('span[argumentid="ChassisNo"],span[argumentid="InsuranceExpiry"],span[argumentid="FullInsuranceExpiry"]', f.el).css('color', '#62AW296'); //Change Color to Normal on every click

                // Highlight dates as red which have expired
                var HLD = function (arg) {
                    var expDate = f.GetArgVal(arg).replace(/3rd - /g, '').replace(/Full - /g, '');
                    if ($.trim(expDate) != '') {
                        if (Math.floor(dateDiff(new Date(), cDate(expDate))) >= 0) {
                            $('span[argumentid="' + arg + '"]', f.el).css('color', 'red');
                            $('span[argumentid="ChassisNo"]', f.el).css('color', 'red');
                        }
                    }
                    return HLD;
                };
                HLD('InsuranceExpiry')('FullInsuranceExpiry');
                // End of Highlight of expired dates

                f._LOVConCar.hide();
                $('[argumentid="CarNumber"]', f.el).trigger('keyup'); //This is to remove the required validation issue
                conCar._Masked.unmask();
                conCar._frm = conCar._Masked = null;

                //Load Car Rate Types
                f.LoadCombo(f, $('[argumentid="CarRateType"]', f.el));
                $('[argumentid="CarRate"],[argumentid="CarAllowedKM"],[argumentid="CarExtraKMRate"]', f.el).val(0);
                //End Load Car Rate Types
            })
            $('table[itemno] > tbody > tr', t.el).css('cursor', 'pointer');
            //$('table[itemno] td,table[itemno] div').css('cursor', 'pointer');
        });
    


};




/*
 * ************************************************grdLeaseContracts_Cust**************************************************
 * @param {any} obj
 */
AsyncWidgets.WidgetScripts.grdLeaseContracts_Cust = function (obj) {

    var t = obj;

//CustomerRecCode
    var conGrd = AsyncWidgets.get("conLeaseContracts_Cust");
    var conCar = AsyncWidgets.get("conLeaseContracts_Cars");


    t.on('rowsRendered', function () {
       
        $('table[itemno]', t.el).click(function () {

            var f = conGrd._frm;
            $('[argumentid="CustomerRecCode"]', f.el).val($('[colid="RecCode"] .ColValue', this).text());
            $('[argumentid="CustomerName"]', f.el).text($('[colid="CustomerName"] .ColValue', this).text());
            $('[argumentid="CustomerType"]', f.el).text($('[colid="CustomerType"] .ColValue', this).text());
            $('[argumentid="Nationality"]', f.el).text($('[colid="Nationality"] .ColValue', this).text());
            $('[argumentid="Gender"]', f.el).text($('[colid="Gender"] .ColValue', this).text());
            $('[argumentid="PassportNo"]', f.el).text($('[colid="PassportNo"] .ColValue', this).text());
            $('[argumentid="PassportExpiry"]', f.el).text($('[colid="PassportExpiry"] .ColValue', this).text());
            $('[argumentid="NationalIDNo"]', f.el).text($('[colid="NationalIDNo"] .ColValue', this).text());
            $('[argumentid="NationalIDExpiryDate"]', f.el).text($('[colid="NationalIDExpiryDate"] .ColValue', this).text());
            $('[argumentid="DrivingLicenseNo"]', f.el).text($('[colid="DrivingLicenseNo"] .ColValue', this).text());
            $('[argumentid="DrivingLicenseExpiry"]', f.el).text($('[colid="DrivingLicenseExpiry"] .ColValue', this).text());
            $('[argumentid="WorkTelephone"]', f.el).text($('[colid="WorkTelephone"] .ColValue', this).text());
            $('[argumentid="ResidenceTelephone"]', f.el).text($('[colid="ResidenceTelephone"] .ColValue', this).text());
            $('[argumentid="MobileTelephone1"]', f.el).text($('[colid="MobileTelephone1"] .ColValue', this).text());
            $('[argumentid="MobileTelephone2"]', f.el).text($('[colid="MobileTelephone2"] .ColValue', this).text());

            //Load Commas if both numbers are there
            if (!!$('[argumentid="WorkTelephone"]', f.el).text() && !!$('[argumentid="ResidenceTelephone"]', f.el).text()) {
                $('.CommaWR', f.el).show();
            }
            else {
                $('.CommaWR', f.el).hide();
            }

            if (!!$('[argumentid="MobileTelephone1"]', f.el).text() && !!$('[argumentid="MobileTelephone2"]', f.el).text()) {
                $('.CommaM12', f.el).show();
            }
            else {
                $('.CommaM12', f.el).hide();
            }
            //End Commas if both numbers are there

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

            $('span[argumentid="CustomerName"],span[argumentid="PassportExpiry"],span[argumentid="NationalIDExpiryDate"],span[argumentid="DrivingLicenseExpiry"]', f.el).css('color', '#62AW296'); //Change Color to Normal on every click

            // Highlight dates as red which have expired
            var HLD = function (arg) {
                var expDate = f.GetArgVal(arg).replace(/3rd - /g, '').replace(/Full - /g, '');
                if ($.trim(expDate) != '') {
                    if (Math.floor(dateDiff(new Date(), cDate(expDate))) >= 0) {
                        $('span[argumentid="' + arg + '"]', f.el).css('color', 'red');
                        $('span[argumentid="CustomerName"]', f.el).css('color', 'red');
                    }
                }
                return HLD;
            };
            HLD('PassportExpiry')('NationalIDExpiryDate')('DrivingLicenseExpiry');
            // End of Highlight of expired dates

            f._LOVCon.hide();
            $('[argumentid="CustomerRecCode"]', f.el).trigger('keyup'); //This is to remove the required validation issue
            conGrd._Masked.unmask();
            conGrd._frm = conGrd._Masked = null;
        });// gridrow click event
        $('table[itemno] > tbody > tr', t.el).css('cursor', 'pointer');
    }); //rowsRendered
};

//};