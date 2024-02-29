/// <reference path="/JQuery/Common.js" />


AsyncWidgets.WidgetScripts.frmSalesContracts = function (obj) {
        var t = obj;
      
    AsyncWidgets.WidgetScripts.frmSalesContracts.t = t;
        t.on('aftereDataAction', function (params)
        {

        
        });
        t.on('LOVPopupClosed', (args) =>
        {
          /*    debugger;*/

            
        });
        t.on('LOVPopupShown', (popup) =>
        {
            // debugger;
            $(t.el).mask("");
            $('.loadmask-msg', t.el).hide();
            popup.css({ position: 'absolute', top: '25%', left: '0px', 'z-index': '1000', 'background': '#628296' }).show();
            t.fireEvent('LOVPopupShown', popup);
        });
        t.on('FormClosed', () => {
            t.__firstShow = undefined;
        });

    //only test purpose
    $('[argumentid="ChassisNo"]').focus(function () {
      
        
     
        $('[argumentid="AdditionalAmount"]').val('0.000');
        $('[argumentid="Discount"]').val('0.000');
  
        /*$('[argumentid="CarNumber"]').text("");*/

      
    });

   


    ///////////////////////////////////////////////////////




   /* $('[argumentid="FinanceCompany"]').prop('disabled', true);*/
    $('[argumentid="AdditionalAmount"],[argumentid="Discount"],[argumentid="Price"]').blur(function () {
        debugger;
        var carPrice = parseFloat($('[argumentid="Price"]',t.el).val());
        var additionalAmount = parseFloat($('[argumentid="AdditionalAmount"]',t.el).val());
        var discount = parseFloat($('[argumentid="Discount"]').val());
        /* var totalAmount = parseFloat($('[argumentid="TotalAmount"]').val());*/
        var PaymentAmount = parseFloat($('[argumentid="PaymentAmount"]', t.el).text());
        var roundedAmount = Math.round(PaymentAmount * 1000) / 1000; // Isse .001 ko .000 mein convert kiya jaega
        var formattedAmount = roundedAmount.toFixed(3);
        var parsePaymentAmount = parseFloat(formattedAmount);
        var totalCarPrice = carPrice + additionalAmount;
        totalAmount = totalCarPrice - discount;

        var totalAmountDue = totalAmount - parsePaymentAmount
        $('[argumentid="TotalAmount"]', t.el).val(`${totalAmount.toFixed(3)}`);
        $('[argumentid="AmountDue"]', t.el).text(`${totalAmountDue.toFixed(3)}`);

        var value = $(this).val();
        value = parseFloat(value).toFixed(3);
        $(this).val(value);

    })

    
        //////////////////////////////////////////////

        ///////////////////////////////////////// File Upload  //////////////////////////////////////////////////////////////////
    $('.file-list', t.el).html("");
   
      
        AsyncWidgets.WidgetScripts.frmSalesContracts.BindUploadHandlers(t); //to db
       
    ///////////////////////////////////////////////////////////////////////////////////////////////
    
    AsyncWidgets.WidgetScripts.frmSalesContracts.ConvertToDecimalIfNotIsNAN();
    AsyncWidgets.WidgetScripts.frmSalesContracts.ConvertToDecimal();
    AsyncWidgets.WidgetScripts.frmSalesContracts.toggleDropdown();
    var toggleDropdown = AsyncWidgets.WidgetScripts.frmSalesContracts.toggleDropdown;
        $(".cash, .finance").click(function () {
        toggleDropdown();
    });
       

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
    $('[argumentid="ContractDate"]').on('blur', function () {

        var nDate = new Date();
        var cH = nDate.getHours();
        var cM = nDate.getMinutes();

        cH = cH < 10 ? '0' + cH : cH;
        cM = cM < 10 ? '0' + cM : cM;
        var csDate = val('ContractDate', t.el);

        var dow = CalculateDayOfWeekCsDate(csDate);
        setField('ContractWeekDay', dow, t.el);
        $('[argumentid="ContractTime"]', t.el).val(cH + ':' + cM);

    });
    $('[argumentid="DeliveryDate"]').on('blur', function () {

        var nDate = new Date();
        var cH = nDate.getHours();
        var cM = nDate.getMinutes();

        cH = cH < 10 ? '0' + cH : cH;
        cM = cM < 10 ? '0' + cM : cM;
        var csDate = val('DeliveryDate', t.el);

        var dow = CalculateDayOfWeekCsDate(csDate);
        setField('DeliveryWeekDays', dow, t.el);
        $('[argumentid="DeliveryTime"]', t.el).val(cH + ':' + cM);

    });

        //calculate weekday on end date
        var CalculateDayOfWeekRsDate = AsyncWidgets.WidgetScripts.frmSalesContracts.CalculateDayOfWeekRsDate;
        $('[argumentid="ReservationDate"]').on('blur', function ()
        {
            var rsDate = val('ReservationDate', t.el);
            var dow = CalculateDayOfWeekRsDate(rsDate);
            setField('ReservationWeekDays', dow, t.el);
        });

        //calculatr AdditionalAmount - Discount = TotalAmount
        //var TotalAmount = AsyncWidgets.WidgetScripts.frmSalesContracts.TotalAmount;
        //$('[argumentid="AdditionalAmount"], [argumentid="Discount"]').blur(TotalAmount);

  
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
        
     $('.PrintBtn', t.el).click(function () { //
         var strlink = ROOT_PATH + "Pages/eForms/iRental/Reports/SalesContractsTreatyReport.aspx?FormCode=" + $('[argumentid="RecCode"]', t.el).text(); // +'&amp;FormId=' + pm.SelectedKey;
                console.log(strlink);
                var width = 920;
                var height = 600;
                var left = parseInt((screen.availWidth / 2) - (width / 2)) - 15;
                var top = parseInt((screen.availHeight / 2) - (height / 2));
                window.open(strlink, '_blank', "'titlebar=no,resizable=1,scrollbars=yes,height=" + height + ",width=" + width + ",left=" + left + ",top=" + top + "screenX=" + left + ",screenY=" + top + "'");
                console.log('Click on Print Button');

                return false;
            });
        
    //End On Click of Print Contract Button

    //On Click of QuotationBtn Contract Button

    $('.QuotationBtn', t.el).click(function () { //
        var strlink = ROOT_PATH + "Pages/eForms/iRental/Reports/PrintQuotationSalesContracts.aspx?FormCode=" + $('[argumentid="RecCode"]', t.el).text(); // +'&amp;FormId=' + pm.SelectedKey;
        console.log(strlink);
        var width = 920;
        var height = 600;
        var left = parseInt((screen.availWidth / 2) - (width / 2)) - 15;
        var top = parseInt((screen.availHeight / 2) - (height / 2));
        window.open(strlink, '_blank', "'titlebar=no,resizable=1,scrollbars=yes,height=" + height + ",width=" + width + ",left=" + left + ",top=" + top + "screenX=" + left + ",screenY=" + top + "'");
        console.log('Click on QuotationBtn Button');

        return false;
    });

    //End On Click of QuotationBtn Contract Button

    //On Click of BillsBtn Contract Button

    $('.BillsBtn', t.el).click(function () { //
        var strlink = ROOT_PATH + "Pages/eForms/iRental/Reports/PrintBillsSalesContracts.aspx?FormCode=" + $('[argumentid="RecCode"]', t.el).val(); // +'&amp;FormId=' + pm.SelectedKey;
        console.log(strlink);
        var width = 920;
        var height = 600;
        var left = parseInt((screen.availWidth / 2) - (width / 2)) - 15;
        var top = parseInt((screen.availHeight / 2) - (height / 2));
        window.open(strlink, '_blank', "'titlebar=no,resizable=1,scrollbars=yes,height=" + height + ",width=" + width + ",left=" + left + ",top=" + top + "screenX=" + left + ",screenY=" + top + "'");
        console.log('Click on BillsBtn Button');

        return false;
    });

    //End On Click of BillsBtn Contract Button

    // To Select Tabs
    $('.SimpleTab li', t.el).click(function () {
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

        if (li.attr('tabid') == 'SalesContractDetails')
        {
            var wg = AsyncWidgets.get('frmSalesContracts');
            
            var cf = {
                ActionId: "GetData", GroupId: null, readFormValues: false,
                Params: { RecId: val('RecId', wg.el), Command: 'SEL_iRental_SalesContracts' }

            }
            wg.loadValues(cf);
            //, function () {
            //    wg.show();
            //}
            
        }

        else if (li.attr('tabid') == 'SalesPaymentDetails') {
            AsyncWidgets.get('grdSalesContractsPaymentDetails').show().Requery();
        }

        return false;
    });
    // End

    // To select Edit Button
    $('.SalesButton_Edit', t.el).click(function ()
    {
        $('[argumentid="StateId"]', t.el).text('RRCCreatedState');
       /* $('[argumentid="StateName"]', t.el).text('Start State');*/

        $('.btnSave,.QuotationBtn,.PrintBtn,.Statement,.CloseContract,.CancelContract  ', t.el).removeAttr('disabled', 'disabled');

        $('.CommonDisableClass,.DisableOnClose', t.el).removeAttr('disabled', 'disabled');
        $('.CloseContract,.CancelContract,.btnSave,.QuotationBtn,.PrintBtn,.Statement,.CloseContract,.CancelContract,.CommonDisableClass', t.el).removeClass('ElemDisabled');
        $('[argumentid="ContractStartDate"]', t.el).next('img').show();
        $('[argumentid="ReservationDate"]', t.el).next('img').show();
        $('[argumentid="ContractDate"]', t.el).next('img').show();
        $('[argumentid="DeliveryDate"]', t.el).next('img').show();
        $('[argumentid="DocType"]', t.el).prop('disabled', false);

    });

    // On Form Show file-list
        t.on('show', function (args)
        {
            console.log($('.file-list', t.el).length);
            $('.file-list', t.el).html('');
            console.log($('.file-list', t.el).length);
        //Always Move to First Tab on Show
        var li = $('li[tabid="SalesContractDetails"]', t.el), tbl;
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

            if (t.FormMode == "new") {
                $('.SimpleTab', t.el).attr('disabled', 'disabled');
                $('.CloseContract,.CancelContract', t.el).attr('disabled', 'disabled');
               /* $('.btnSave',t.el).hide();*/
                //$('.PrintBtn').css('visibility', 'hidden'); // Hide element;
                //$(".PrintBtn").css("opacity", 0.5);

                //// Disable the button
                //$(".PrintBtn").prop("disabled", true);

                var tblUFL = $('table.uploadedFileList', t.el);
                $('table.uploadedFileList .ItemTR .ItemTableRow').remove();
               /* $('.ItemTR > td', tblUFL).empty();*/
                $('.NoRecordsTR', tblUFL).show();
                $('.btnSave ', t.el).hide();

                
            } 

        var CurrentDate = new Date(); //Get Current Date to set Start Date On New for particular states
        var WeekDay = AsyncWidgets.WidgetScripts.frmSalesContracts.getWeekdayName(CurrentDate);
        var setTime = AsyncWidgets.WidgetScripts.frmSalesContracts.formateTime(CurrentDate);
        var cD = CurrentDate.getDate() < 10 ? '0' + CurrentDate.getDate() : CurrentDate.getDate();
        var cM = (CurrentDate.getMonth() + 1) < 10 ? '0' + (CurrentDate.getMonth() + 1) : (CurrentDate.getMonth() + 1);
        var cY = CurrentDate.getFullYear();

            if ($('[argumentid="StateId"]', t.el).text() == '')
            {
                
                $('[argumentid="StateId"]', t.el).text('RRCCreatedState');
                $('[argumentid="StateName"]', t.el).text('Start State');

                $('.btnSave,.QuotationBtn,.PrintBtn,.Statement,.CloseContract,.CancelContract  ', t.el).removeAttr('disabled', 'disabled');

                $('.CommonDisableClass,.DisableOnClose', t.el).removeAttr('disabled', 'disabled');
                $('.CloseContract,.CancelContract,.btnSave,.QuotationBtn,.PrintBtn,.Statement,.CloseContract,.CancelContract,.CommonDisableClass', t.el).removeClass('ElemDisabled');
                $('[argumentid="ContractStartDate"]', t.el).next('img').show();
                $('[argumentid="ReservationDate"]', t.el).next('img').show();
                $('[argumentid="ContractDate"]', t.el).next('img').show();
                $('[argumentid="DeliveryDate"]', t.el).next('img').show();
                $('[argumentid="DocType"]', t.el).prop('disabled', false);
            }
            

        $('.btnReserve', t.el).show();
        $('.btn_11', t.el).hide();

        $('.CommonDisable,.DisableOnClose,.btn_10', t.el).removeAttr('disabled');
        $('input[disabled="disabled"]:not([type="radio"]),textarea[disabled="disabled"],select[disabled="disabled"]', t.el).addClass('ElemDisabled');
        $('span[argumentid="ChassisNo"],span[argumentid="CustomerName"],span[argumentid="InsuranceExpiry"],span[argumentid="FullInsuranceExpiry"],span[argumentid="PassportExpiry"],span[argumentid="NationalIDExpiryDate"],span[argumentid="DrivingLicenseExpiry"]', t.el).css('color', '#628296'); //Change Color to Normal on form show

            //if ($('[argumentid="StateId"]', t.el).text() == 'RRCStartState')
            //{
            //    debugger
            //    $('[argumentid="StateId"]', t.el).text('RRCStartState');
            //}

            //show the no record on file upload table
            if (t.FormMode == 'new') 
            {

                $('.NoRecordsTR').show();
                AsyncWidgets.WidgetScripts.frmSalesContracts.ConvertToDecimal();

               
               
            }

            //for file extension fetch from LOvchild
            var params = { Command: 'FX_SEL_Common_LOV_AutoFill', textcol: 'Name', valcol: 'ChildId', isparentstr: "false", parenttypeid: "35" };
            function Success(res) {
                var res = decJSON(res);
                if (res.status == 'OK') {
                    if (res.Response.Rows.length > 0) {
                        var rows = res.Response.Rows;
                        console.log(`Rows: ${rows}`);
                        for (var i = 0; i < rows.length; i++)
                        {

                            var row = rows[i];
                            var name = row.Name;
                            console.log(`Name: ${name}`);
                            var myTable = $('.myTable', t.el);
                            $('.allowedFile', myTable).text(`Allowed Files: ${name}`);
                        }
                    }
                }
            }

            ServerCall(params, Success, "ChildComboRows");

            //if (t.FormMode === "new" && t.FormMode === "update") {
            //    //debugger;
            //    //AsyncWidgets.WidgetScripts.frmSalesContracts.toggleDropdown();
            //    AsyncWidgets.WidgetScripts.frmSalesContracts.ConvertToDecimal();
            //}

            AsyncWidgets.WidgetScripts.frmSalesContracts.ConvertToDecimalIfNotIsNAN();

           
                
            if (t.FormMode == "new" && !t.__firstShow)
            {
                t.__firstShow = true;
                AsyncWidgets.WidgetScripts.frmSalesContracts.toggleDropdown();
              
            }

            
            

           
    });
    // End On Form Show

    // On Start of Onloaded Values
        t.on('onLoadedValues', function (args)
        {
            
         var res = args.res;

            if (res.status == 'OK')
            {


            // Highlight dates as red which have expired
            //var HLD = function (arg, arg2) {
            //    var expDate = t.GetArgVal(arg).replace(/3rd - /g, '').replace(/Full - /g, '');
            //    if ($.trim(expDate) != '') {
            //        if (Math.floor(dateDiff(new Date(), cDate(expDate))) >= 0) {
            //            $('span[argumentid="' + arg + '"]', t.el).css('color', 'red');
            //            $('span[argumentid="' + arg2 + '"]', t.el).css('color', 'red');
            //        }
            //    }
            //    return HLD;
            //};
            //HLD('PassportExpiry', 'CustomerName')('NationalIDExpiryDate', 'CustomerName')('DrivingLicenseExpiry', 'CustomerName');
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

           

            $('.ElemDisabled', t.el).removeClass('ElemDisabled');
            $('input[disabled="disabled"]:not([type="radio"]),textarea[disabled="disabled"],select[disabled="disabled"]', t.el).addClass('ElemDisabled');


           
            AsyncWidgets.WidgetScripts.frmSalesContracts.toggleDropdown();
            }
            
            //AsyncWidgets.WidgetScripts.frmSalesContracts.ConvertToDecimalIfNotIsNAN();
            $('.btn_11', t.el).show();
            $('.btnReserve', t.el).hide();
            $('.btnSave ', t.el).show();
            
         


            if (t.FormMode == 'update')
            {
                
                if ($('[argumentid="StateId"]', t.el).text() == 'RRCContractClosed')
                {
                    $('.btnSave,.QuotationBtn,.PrintBtn,.Statement,.CloseContract,.CancelContract  ', t.el).attr('disabled', 'disabled');
                  
                    $('.CommonDisableClass,.DisableOnClose', t.el).attr('disabled', 'disabled');
                    $('.CloseContract,.CancelContract,.btnSave,.QuotationBtn,.PrintBtn,.Statement,.CloseContract,.CancelContract,.CommonDisableClass', t.el).addClass('ElemDisabled');
                    $('[argumentid="ContractStartDate"]', t.el).next('img').hide();
                    $('[argumentid="ReservationDate"]', t.el).next('img').hide();
                    $('[argumentid="ContractDate"]', t.el).next('img').hide();
                    $('[argumentid="DeliveryDate"]', t.el).next('img').hide();
                    $('[argumentid="DocType"]', t.el).prop('disabled', true);
                    
                }

                if ($('[argumentid="StateId"]', t.el).text() == 'RRCCreatedState')
                {
                    $('.btnSave,.QuotationBtn,.PrintBtn,.Statement,.CloseContract,.CancelContract  ', t.el).removeAttr('disabled', 'disabled');

                    $('.CommonDisableClass,.DisableOnClose', t.el).removeAttr('disabled', 'disabled');
                    $('.CloseContract,.CancelContract,.btnSave,.QuotationBtn,.PrintBtn,.Statement,.CloseContract,.CancelContract,.CommonDisableClass', t.el).removeClass('ElemDisabled');
                    $('[argumentid="ContractStartDate"]', t.el).next('img').show();
                    $('[argumentid="ReservationDate"]', t.el).next('img').show();
                    $('[argumentid="ContractDate"]', t.el).next('img').show();
                    $('[argumentid="DeliveryDate"]', t.el).next('img').show();
                    $('[argumentid="DocType"]', t.el).prop('disabled', false);

                }

                $('[argumentid="CustomerRecCode"]', t.el).prop('disabled', true);
                $('[argumentid="CustomerRecCode"]', t.el).addClass('ElemDisabled');

                if ($('[argumentid="StateId"]', t.el).text() == 'RRCContractCancelled')
                {
                    $('.btnSave,.QuotationBtn,.PrintBtn,.Statement,.CloseContract,.CancelContract  ', t.el).attr('disabled', 'disabled');

                    $('.CommonDisableClass,.DisableOnClose', t.el).attr('disabled', 'disabled');
                    $('.CloseContract,.CancelContract,.btnSave,.QuotationBtn,.PrintBtn,.Statement,.CloseContract,.CancelContract,.CommonDisableClass', t.el).addClass('ElemDisabled');
                    $('[argumentid="ContractStartDate"]', t.el).next('img').hide();
                    $('[argumentid="ReservationDate"]', t.el).next('img').hide();
                    $('[argumentid="ContractDate"]', t.el).next('img').hide();
                    $('[argumentid="DeliveryDate"]', t.el).next('img').hide();
                    $('[argumentid="DocType"]', t.el).prop('disabled', true);
                }
                
            }

             
                //else
                //{

                //    $('.CloseContract,.CancelContract', t.el).removeAttr('disabled');
                //    $('.CloseContract,.CancelContract,.btnSave,.QuotationBtn,.PrintBtn', t.el).removeClass('ElemDisabled');
                //    $('.btnSave,.QuotationBtn,.PrintBtn', t.el).removeAttr('disabled', 'disabled');

                //}



            //if ($('[argumentid="StateId"]', t.el).text() == 'RRCContractClosed')
            //{
            //    $('.btnSave,.QuotationBtn,.PrintBtn,.Statement,.CloseContract,.CancelContract  ', t.el).attr('disabled', 'disabled');
            //    $('.CommonDisableClass,.DisableOnClose', t.el).attr('disabled', 'disabled');
            //    $('[argumentid="ContractStartDate"]', t.el).next('img').hide();
            //    $('[argumentid="ReservationDate"]', t.el).next('img').hide();
            //    $('[argumentid="ContractDate"]', t.el).next('img').hide();
            //    $('[argumentid="DeliveryDate"]', t.el).next('img').hide();
            //    $('[argumentid="DocType"]', t.el).prop('disabled', true);
            //    $('.CloseContract,.CancelContract,.btnSave,.QuotationBtn,.PrintBtn,.Statement,.CloseContract,.CancelContract', t.el).addClass('ElemDisabled');
            //}

            ///decimal
            
            var CarPrice = $('[argumentid="Price"]', t.el).val();
            var CarPriceInFloat = parseFloat(CarPrice);
            $('[argumentid="Price"]', t.el).val(CarPriceInFloat.toFixed(3));

            var AdditionalAmount = $('[argumentid="AdditionalAmount"]', t.el).val();
            var AdditionalAmountInFloat = parseFloat(AdditionalAmount);
            $('[argumentid="AdditionalAmount"]', t.el).val(AdditionalAmountInFloat.toFixed(3));

            var Discount = $('[argumentid="Discount"]', t.el).val();
            var DiscountFloat = parseFloat(Discount);
            $('[argumentid="Discount"]', t.el).val(DiscountFloat.toFixed(3));

            var TotalAmount = $('[argumentid="TotalAmount"]', t.el).val();
            var TotalAmountInFloat = parseFloat(TotalAmount);
            $('[argumentid="TotalAmount"]', t.el).val(TotalAmountInFloat.toFixed(3));

            //var PaymentAmount = $('[argumentid="PaymentAmount"]', t.el).text();
            //var PaymentAmountInFloat = parseFloat(PaymentAmount);
            //$('[argumentid="PaymentAmount"]', t.el).text(PaymentAmountInFloat.toFixed(3));

            var AmountDue = $('[argumentid="AmountDue"]', t.el).text();

            var AmountDueInFloat = parseFloat(AmountDue);
            $('[argumentid="AmountDue"]', t.el).text(AmountDueInFloat.toFixed(3));
            var SalesContractTab = $('[tabid="SalesContractDetails"]', t.el);

            var decAmountReceived = parseFloat(val('PaymentAmount', SalesContractTab));
            if (isNaN(decAmountReceived)) {
                setField('PaymentAmount', '0.000', SalesContractTab);
                //$('[argumentid="PaymentAmount"]', t.el).text('0.000');
            }
            else {
                setField('PaymentAmount', decAmountReceived.toFixed(3), SalesContractTab);
                // $('[argumentid="PaymentAmount"]',t.el).text();
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

//calculate contract date of weekday


AsyncWidgets.WidgetScripts.frmSalesContracts.BindUploadHandlers = function (t)
{

 
    $(".upload-button",t.el).click(function (e)
    {
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
     
        formData.append("DocType", val('DocType', t.el));
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
                    var msg = (`File [${fileName}] uploaded successfully.`);
                    $(".file-input", t.el).val('');
                    $('[argumentid = "DocType"]').val('');

                }
                
                AsyncWidgets.WidgetScripts.frmSalesContracts.GenerateUploadFiles(objRes, t);
                $.showMessage(msg);
               
                
               // $('.message', t.el).text(response);
            },
            error: function (error)
            {
                $(".message", t.el).html("Error uploading file(s): " + error.statusText);
            }
        }); //end of Ajax
    });

    // Remove a file from the list
    $(document).on("click", ".remove-button", function ()
    {
        $(this).closest('tr').remove();
        $(".file-input", t.el).val('');
        

    });

  

  //   Handle file selection and display in the list
    var loggedUser = $('.LoggedUser').text();
    $(".file-input", t.el).change(function ()
    {
       /* var fileList = $(".file-list", t.el);*/
        var linkFile = $('.ItemTableRow td>.linkFileName', t.el);
        var fileName = $('.ItemTableRow td>.fileName', t.el);
        var allowedFileExt = $('.allowedFile').text();
       
        var files = this.files;
        for (var i = 0; i < files.length; i++)
        {
            var orignalFileName = files[i].name;
            var RfileName = files[i].name.replace(/[^a-zA-Z0-9]/g, '-');
          
            var fileItem = $(`<div class='file-item ${RfileName}'></div>`);
            var fileName = $("<div class='file-name'></div>").text(orignalFileName);
           /* var removeButton = $("<div class='remove-file'>X</div>");*/


           //check allowed files function in common.js

            checkAllowedFileExtensions(allowedFileExt, fileName);
         
            // End check allowed files

            // Check for duplicate file names
           

            checkDublicateFiles(fileName, linkFile, orignalFileName, t);
            

            //End Check for duplicate file names

            

           
            
   
                //fileItem.css('background-color', 'lightcoral');
                //fileItem.append(fileName);
                //fileItem.append(removeButton);
                //fileList.append(fileItem);
            
           
        }
    //    $('.ItemTR tbody', t.el).html('');
        //$('.ItemTR tbody', t.el).append(genHtml);
        //var curTable = $('tr.beforeUplaodFileList', t.el);
        //curTable.remove();
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

  
        
   
    t.on('onLoadedValues', function (p)
    {

        console.log(p);
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
AsyncWidgets.WidgetScripts.frmSalesContracts.GenerateUploadFiles = function (res, t) {
    if (res.status == 'OK') {
        if (res.Response.Rows.length > 0) {
            var rows = res.Response.Rows;

            var $fileList = $(".file-list", t.el);
            var loggedUser = $('.LoggedUser').text();
            var tblRowsHTML = "";
            $('.ItemTR', tblUFL).show();
            $('.NoRecordsTR', tblUFL).hide();
            for (var i = 0; i < rows.length; i++) {

                var row = rows[i];
                var fileName = row.FileName;
                var recId = row.RecId;
                var fileGuid = row.FileGuid;
                var fileSize = row.FileSize;
                var fileType = row.DocType;
                var createdBy = row.$CreatedBy;
                var dateCreated = row.DateModified;

                var RfileName = row.FileName.replace(/[^a-zA-Z0-9]/g, '-');

                $("." + RfileName, t.el).remove();

                if ($(`.file-list a:contains("${fileName}")`).length > 0) {
                    continue;
                }
                //var fileLink = `<a class='file-link' href='Uploads/${recId}_${fileGuid}_${fileName}' target='_blank'>${fileName}</a>`;

                var fileLink = `<a class='file-link' href='Uploads/${recId}_${fileGuid}_${fileName}' target='_blank' rel='noopener noreferrer'>${fileName}</a>`;



                var fileItem = $('<div class="file-item"></div>');
                //
                var fileNameElement = `<span class="file-name">${fileLink}</span>`;
              
                var genHtml = ` <tr class="ItemTableRow" style="white-space: nowrap" evenrowcss="w-grid-row-odd" oddrowcss="w-grid-row-odd" hoverrowcss="">


                                                    <td class="ColTemplate w-grid-cell-border colIndex-3" style="white-space: nowrap; overflow: hidden; cursor: pointer; padding: 0px; " colid="FileName">
                                                        <div class="ColValue w-grid-label linkFileName" style="white-space: nowrap; cursor: pointer; overflow: hidden; margin-left: 10px; ">${fileLink}</div>
                                                    </td>
                                                    <td class="ColTemplate w-grid-cell-border colIndex-4" style="white-space: nowrap; overflow: hidden; cursor: pointer; padding: 0px; width: 110px;" colid="FileSize">
                                                        <div class="ColValue w-grid-label" style="white-space: nowrap; cursor: pointer; overflow: hidden; margin-left: 10px; width: 100px;">${fileSize}</div>
                                                    </td>
                                                     <td class="ColTemplate w-grid-cell-border colIndex-4" style="white-space: nowrap; overflow: hidden; cursor: pointer; padding: 0px; width: 110px;" colid="FileType">
                                                        <div class="ColValue w-grid-label" style="white-space: nowrap; cursor: pointer; overflow: hidden; margin-left: 10px; width: 100px;">${fileType}</div>
                                                    </td>
                                                    <td class="ColTemplate w-grid-cell-border colIndex-4" style="white-space: nowrap; overflow: hidden; cursor: pointer; padding: 0px; width: 110px;" colid="CreatedBy">
                                                        <div class="ColValue w-grid-label" style="white-space: nowrap; cursor: pointer; overflow: hidden; margin-left: 10px; width: 100px;">${loggedUser}</div>
                                                    </td>
                                                    <td class="ColTemplate w-grid-cell-border colIndex-4" style="white-space: nowrap; overflow: hidden; cursor: pointer; padding: 0px; width: 110px;" colid="DateCreated">
                                                        <div class="ColValue w-grid-label" style="white-space: nowrap; cursor: pointer; overflow: hidden; margin-left: 10px; width: 100px;">${dateCreated}</div>
                                                    </td>
                                                     <td class="ColTemplate w-grid-cell-border colIndex-4" style="white-space: nowrap; overflow: hidden; cursor: pointer; padding: 0px; width: 45px;" colid="Delete">
                                                            <div class="ColValue w-grid-label" style="white-space: nowrap; cursor: pointer; overflow: hidden; margin-left: 10px; width: 35px;">
                                                             <span class="remove-button" recid="${recId}" filename="${fileName}">X</span>
                                                            </div>
                                                        </td>

                                                </tr>`;

                tblRowsHTML += genHtml;

             

            }  // for loop;

            var tblUFL = $('table.uploadedFileList', t.el); // get the main table

            $('.ItemTR tbody', tblUFL).html(tblRowsHTML); //inject html of the download file list table
            $('.remove-button', tblUFL).click(function () {
                var btn = $(this);
                var recId = btn.attr("recId");
                var fileName = btn.attr("fileName");

                var DeleteUploadFile = AsyncWidgets.WidgetScripts.frmSalesContracts.DeleteUploadFile;
                DeleteUploadFile(t, recId, fileName);

                // Remove the row from the table
                var curTR = btn.closest('tr');//.remove();

                if ($('tr', curTR.parent()).length == 1) {
                    // curTR.remove();
                    $('.ItemTR', tblUFL).hide();
                    $('.NoRecordsTR', tblUFL).show();
                    //return;
                } 
                curTR.remove();

            }); // end of click of close button event


        } // if length>0
        else {
            var tblUFL = $('table.uploadedFileList', t.el);
            $('.ItemTR', tblUFL).hide();
            $('.NoRecordsTR', tblUFL).show();
        }
    } //  if (res.status == 'OK')

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
            $.showMessage(`File [${fileName}] ${msg[2]}`);
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
    var decCarPrice = parseFloat($('[argumentid="Price"]',t.el).val());
    if (isNaN(decCarPrice))
    {
        $('[argumentid="Price"]').val('0.000')
    }
    
    else
    {
     $('[argumentid="Price"]', t.el).val(decCarPrice.toFixed(3));
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


    var decTotalAmount = parseFloat($('[argumentid="TotalAmount"]',t.el).val());
    if (isNaN(decTotalAmount))
    {
        $('[argumentid="TotalAmount"]', t.el).val('0.000');
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

    var engineWarrenty = parseFloat($('[argumentid="EngineWarranty"]', t.el).val());
    if (isNaN(engineWarrenty)) {
        $('[argumentid="EngineWarranty"]', t.el).val(0);
    }
    //else {
    //    $('[argumentid="EngineWarranty"]', t.el).text(engineWarrenty.toFixed(3));
    //}


    var gearWarranty = parseFloat($('[argumentid="GearWarranty"]', t.el).val());
    if (isNaN(gearWarranty)) {
        $('[argumentid="GearWarranty"]', t.el).val(0);
    }
    //else {
    //    $('[argumentid="GearWarranty"]', t.el).text(gearWarranty.toFixed(3));
    //}

    var carWarranty = parseFloat($('[argumentid="CarWarranty"]', t.el).val());
    if (isNaN(carWarranty)) {
        $('[argumentid="CarWarranty"]', t.el).val(0);
    }
    //else {
    //    $('[argumentid="CarWarranty"]', t.el).text(carWarranty.toFixed(3));
    //}
};
AsyncWidgets.WidgetScripts.frmSalesContracts.ConvertToDecimalIfNotIsNAN = function ()
{

    var t = AsyncWidgets.WidgetScripts.frmSalesContracts.t;
    //convert to decimal
    var decCarPrice = parseFloat($('[argumentid="Price"]', t.el).val());
    if (!isNaN(decCarPrice)) {
        var convDecCarPrice = decCarPrice.toFixed(3);
        $('[argumentid="Price"]', t.el).val(convDecCarPrice);
    }

    var deAdditionalAmount = parseFloat($('[argumentid="AdditionalAmount"]', t.el).val());
    if (!isNaN(deAdditionalAmount)) {
        var convDecAdditionalAmount = deAdditionalAmount.toFixed(3);
        $('[argumentid="AdditionalAmount"]', t.el).val(convDecAdditionalAmount);
    }

    var deDiscount = parseFloat($('[argumentid="Discount"]', t.el).val());
    if (!isNaN(deDiscount)) {
        var convDecDiscount = deDiscount.toFixed(3);
        $('[argumentid="Discount"]', t.el).val(convDecDiscount);
    }

    var deTotalAmount = parseFloat($('[argumentid="TotalAmount"]', t.el).val());
    if (!isNaN(deTotalAmount)) {
        var convDecTotalAmount = deTotalAmount.toFixed(3);
        $('[argumentid="TotalAmount"]', t.el).val(convDecTotalAmount);
    }


    var SalesContractTab = $('[tabid="SalesContractDetails"]', t.el);

    var decAmountReceived = parseFloat(val('PaymentAmount', SalesContractTab));
    if (isNaN(decAmountReceived)) {
        setField('PaymentAmount', '0.000', SalesContractTab);
        //$('[argumentid="PaymentAmount"]', t.el).text('0.000');
    }
    else {
        setField('PaymentAmount', decAmountReceived.toFixed(3), SalesContractTab);
        // $('[argumentid="PaymentAmount"]',t.el).text();
    }

    var dePaymentAmount = parseFloat($('[argumentid="PaymentAmount"]', t.el).text());
    if (!isNaN(dePaymentAmount)) {
        var convDecPaymentAmount = dePaymentAmount.toFixed(3);
        $('[argumentid="PaymentAmount"]', t.el).text(convDecPaymentAmount);
    }

    var deAmountDue = parseFloat($('[argumentid="AmountDue"]', t.el).text());
    if (!isNaN(deAmountDue)) {
        var convDeAmountDue = deAmountDue.toFixed(3);
        $('[argumentid="AmountDue"]', t.el).text(convDeAmountDue);
    }

};

//cash select or finance 
AsyncWidgets.WidgetScripts.frmSalesContracts.toggleDropdown = function () {
    var t = AsyncWidgets.WidgetScripts.frmSalesContracts.t;
    if ($(".cash").is(":checked")) {
       /* $('[argumentid="FinanceCompany"]', t.el).prop('disabled', true);*/
        $('[argumentid="FinanceCompany"]', t.el).hide();
        $('[argumentid="FinanceCompany"]', t.el).val('');
        $(".financeCompany").removeClass("required"); 
        $('.ftitle.lb nobr').hide();
        $('td.financeCompanyTD span').hide();
        $('.LPONumberTitle nobr', t.el).hide();
        $('[argumentid="LPONumber"]', t.el).hide();
        $('[argumentid="LPODate"]', t.el).hide();
        $('.LPONumberDateField>img',t.el).hide();
        /*$(".trOnHideFinaceSelect",t.el).hide();*/
   
    } else {
      /*  $('[argumentid="FinanceCompany"]', t.el).prop('disabled', false);*/
        $('[argumentid="FinanceCompany"]', t.el).show();
        $(".financeCompany").addClass("required");
        $('.ftitle.lb nobr').show();
        $('.LPONumberTitle nobr', t.el).show();
        $('[argumentid="LPONumber"]', t.el).show();
        $('[argumentid="LPODate"]', t.el).show();
        $('.LPONumberDateField>img', t.el).show();
    //    $(".trOnHideFinaceSelect", t.el).show();
    }
};

AsyncWidgets.WidgetScripts.frmSalesContracts.UpdateTotalAmount = function () {

    var t = AsyncWidgets.WidgetScripts.frmSalesContracts.t;
    var price = parseFloat($('[argumentid="Price"]',t.el).val());
    var totalAmount = parseFloat($('[argumentid="TotalAmount"]',t.el).val());

    if (!!price) {

        totalAmount.setField(price);
    }

};


