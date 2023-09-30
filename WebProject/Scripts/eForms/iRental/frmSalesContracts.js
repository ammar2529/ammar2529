﻿/// <reference path="/JQuery/Common.js" />


    AsyncWidgets.WidgetScripts.frmSalesContracts = function (obj) {
        var t = obj;
       
    AsyncWidgets.WidgetScripts.frmSalesContracts.t = t;

        t.on('beforeDataAction', function (params)
        {

            // Ext.apply(params, frmProcGS.GetArgs([{ Name: 'FormType' }, { Name: 'FormNameCode' }]));

        });
        t.on('LOVPopupClosed', (args) =>
        {
              //debugger;

            
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

        //calculatr AdditionalAmount - Discount = TotalAmount
        var TotalAmount = AsyncWidgets.WidgetScripts.frmSalesContracts.TotalAmount;
        $('[argumentid="AdditionalAmount"], [argumentid="Discount"]').blur(TotalAmount);

  
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
            }


        var CurrentDate = new Date(); //Get Current Date to set Start Date On New for particular states
        var WeekDay = AsyncWidgets.WidgetScripts.frmSalesContracts.getWeekdayName(CurrentDate);
        var setTime = AsyncWidgets.WidgetScripts.frmSalesContracts.formateTime(CurrentDate);
        var cD = CurrentDate.getDate() < 10 ? '0' + CurrentDate.getDate() : CurrentDate.getDate();
        var cM = (CurrentDate.getMonth() + 1) < 10 ? '0' + (CurrentDate.getMonth() + 1) : (CurrentDate.getMonth() + 1);
        var cY = CurrentDate.getFullYear();

        if ($('[argumentid="StateId"]', t.el).text() == '') {
            $('[argumentid="StateId"]', t.el).text('SCSCreatedState');
            $('[argumentid="StateName"]', t.el).text('Created State');
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


            //when value on loaded 
            AsyncWidgets.WidgetScripts.frmSalesContracts.ConvertToDecimal();

            var getFileUploadWidg = AsyncWidgets.get('grdSalesFileUpload');
            if (!!getFileUploadWidg) {
                getFileUploadWidg.show();
            } else {

                $.showMessage(`Widget  not found`);
            }

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

        //calculatr AdditionalAmount - Discount = TotalAmount
AsyncWidgets.WidgetScripts.frmSalesContracts.TotalAmount = function (t)
{


};


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
        var linkFile = $('.file-list .file-link', t.el);
        var fileName = $('.file-list .file-item > .file-name', t.el);
        const fileSizeElement = $('fileSize',t.el);

        var files = this.files;
        for (var i = 0; i < files.length; i++)
        {
            var orignalFileName = files[i].name;
            var RfileName = files[i].name.replace(/[^a-zA-Z0-9]/g, '-');
            var fileSizeKb = (files[i].size / 1024).toFixed(2); // Convert to KB with two decimal places
            var fileSizeMB = (files[i].size / (1024 * 1024)).toFixed(2); // Size in MB with two decimal places

            console.log(`File Size in KB: ${fileSizeKb} Kb`);
            console.log(`File Size in MB: ${fileSizeMB} Mb`);

            var fileItem = $(`<div class='file-item ${RfileName}'></div>`);
            var fileName = $("<div class='file-name'></div>").text(orignalFileName);
            var removeButton = $("<div class='remove-file'>X</div>");
           

                 // Check for duplicate file names
            for (var i = 0; i < fileName.length; i++) {

                var findToFile = $(fileName[i]);
                console.log("file: "+findToFile.text());
                for (var j = 0; j < linkFile.length; j++) {


                    var findToLinkFile = $(linkFile[j]);
                    console.log("Link Files: " + findToLinkFile.text());

                    if (findToFile.text() == findToLinkFile.text()) {
                        console.log("dublicate file found");
                        $.showMessage(`File [${orignalFileName}] is already uploaded`);
                        findToFile.remove();
                        $('.file-input', t.el).val('');
                        return;
                    } else
                    {
                        console.log("not dublicate");
                    }
                }


            }
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
          
            var $fileList = $(".file-list", t.el);
            for (var i = 0; i < rows.length; i++)
            {
                var row = rows[i];
                var fileName = row.FileName;
                var recId = row.RecId;
                var fileGuid = row.FileGuid;
                var RfileName = row.FileName.replace(/[^a-zA-Z0-9]/g, '-');

                $("." + RfileName, t.el).remove();

                if ($(`.file-list a:contains("${fileName}")`).length > 0)
                {
                    continue;
                }
                var fileLink = `<a class='file-link' href='Uploads/${recId}_${fileGuid}_${fileName}'>${fileName}</a>`;

            

                var fileItem = $('<div class="file-item"></div>');

                var fileNameElement = `<span class="file-name">${fileLink}</span>`;
                var removeButton = $('<span class="remove-button">X</span>');

                // Attach a click event to the remove button to handle removal
                removeButton.data('recId', recId);

                removeButton.data('fileName', fileName); // Store the file name in a data attribute

                ///Remove File 
                removeButton.on('click', function ()
                {
                    var DeleteUploadFile = AsyncWidgets.WidgetScripts.frmSalesContracts.DeleteUploadFile;
                    var clickedRecId = $(this).data('recId'); // Get the recId from the data attribute
                    var clickedFileName = $(this).data('fileName'); // Get the file name from the data attribute

                    DeleteUploadFile(t, clickedRecId, clickedFileName);
                    $(this).closest('.file-item').remove();

                    console.log('Remove button clicked for file: ' + fileName);
                });
                fileItem.css('background-color', '#98FB98');

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

