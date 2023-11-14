AsyncWidgets.WidgetScripts.frmCustomerRentalContracts = function (obj) {
   
    var t = obj;

    AsyncWidgets.WidgetScripts.frmSalesContracts.t = t;
    var conGrd = AsyncWidgets.get("conRentalContracts_Cust");
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

            $('span[argumentid="CustomerName"],span[argumentid="PassportExpiry"],span[argumentid="NationalIDExpiryDate"],span[argumentid="DrivingLicenseExpiry"]', f.el).css('color', '#628296'); //Change Color to Normal on every click

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
        })
        $('table[itemno] td,table[itemno] div').css('cursor', 'pointer');
    });
};