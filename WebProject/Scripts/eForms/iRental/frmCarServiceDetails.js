AsyncWidgets.WidgetScripts.frmCarServiceDetails = function (obj)
{
    var t = obj;

    AsyncWidgets.WidgetScripts.frmCarServiceDetails.t = t;

    

    var previousValue = ""; // Global variable to store the previous valid time

    // Capture the previous valid time when any of the target inputs gains focus
    $('[argumentid="ServiceStartTime"], [argumentid="CarToBeDeliverStartTime"], [argumentid="CarDeliverdStartTime"], [argumentid="NextServiceStartTime"]').on('focus', function () {
        previousValue = $(this).val(); // Store the previous value of the focused input
    });

    // Validate the time on blur for any of the target inputs
    $('[argumentid="ServiceStartTime"], [argumentid="CarToBeDeliverStartTime"], [argumentid="CarDeliverdStartTime"], [argumentid="NextServiceStartTime"]').on('blur', function () {
        var time = $(this).val();  // Get the current value of the blurred input
        var isValidTime = /^([01]?[0-9]|2[0-3]):[0-5][0-9]$/.test(time);  // Validate the time format

        if (!isValidTime) {
            // If previousValue is empty, set the time to '12:00'
            if (previousValue === "") {
                $(this).val('12:00'); // Set default time to '12:00'
            } else {
                $(this).val(previousValue); // Restore the previous valid time if available
            }
        }
    });

 

    AsyncWidgets.WidgetScripts.frmCarServiceDetails.handleBlurOnDates('CarRecivedDate', 'ServiceStartTime', 'ServiceStartDay', t);
    AsyncWidgets.WidgetScripts.frmCarServiceDetails.handleBlurOnDates('CarToBeDeliverdDate', 'CarToBeDeliverStartTime', 'CarToBeDeliverStartDay', t);
    AsyncWidgets.WidgetScripts.frmCarServiceDetails.handleBlurOnDates('CarDeliverdDate', 'CarDeliverdStartTime', 'CarDeliverdStartDay', t);
    AsyncWidgets.WidgetScripts.frmCarServiceDetails.handleBlurOnDates('NextServiceDate', 'NextServiceStartTime', 'NextServiceStartDay', t);
    AsyncWidgets.WidgetScripts.frmCarServiceDetails.AllowedFiles(t);
    AsyncWidgets.WidgetScripts.frmCarServiceDetails.BindUploadHandlers(t);
   
    $('.PrintJobCard', t.el).click(function ()
    { //

        AsyncWidgets.WidgetScripts.frmCarServiceDetails.PrintJobCard(t);

    });




    $('.CarServiceButton_Edit', t.el).click(function ()
    {
   

        AsyncWidgets.WidgetScripts.frmCarServiceDetails.CarServiceButton_Edit(t)

    });

   
 
  

    t.on('show', function (args)
    {
   

     

        if (t.FormMode == 'new')
        {

            $('.grgbtnSave2', t.el).hide();
            $('.grgbtnSave', t.el).show();
            $('.OnNewForm', t.el).hide();

            var tblUFL = $('table.UploadFileListForJC', t.el);
            $('table.UploadFileListForJC .ItemTableRow', t.el).remove();
            $('.NoRecordsTR', tblUFL).show();
 

            setTimeout(function () {
                $('[argumentid="DocType"]', t.el).val($('[argumentid="DocType"] option').eq(3).val());

            }, 1000);

          

            

            // On blur event for CurrentServiceKm input
            $('[argumentid="CurrentServiceKm"]', t.el).on('blur', function () {
                ;
                CurrentServiceKm = parseInt($(this).val()) || 0;
                // Get the value of LastServiceKm (text content)
                var LastServiceKm = parseInt($('[argumentid="LastServiceKm"]', t.el).text()) || 0;

                // Check if CurrentServiceKm is less than LastServiceKm
                if (CurrentServiceKm <= LastServiceKm) {

                  



                    // Increment the LastServiceKm by 1 and set it as the value of CurrentServiceKm
                    /* CurrentServiceKm = LastServiceKm + 1;*/
                    CurrentServiceKm = 0;
                   
                    // Update the input field with the new value
                    $(this).val(CurrentServiceKm);
                    $.showMessage('In KM cannot be less than or equal to Last Service KM.')
                }
                
            });



            $('[argumentid="CarToBeDeliverdDate"]',t.el).on('blur', function ()
            {
                
                var receivedDate = $('[argumentid="CarRecivedDate"]',t.el).val();
                var deliverDate = $(this).val();

                // Parse the date values into Date objects (assuming the format is DD/MM/YYYY)
                var receivedDateParts = receivedDate.split('/');
                var deliverDateParts = deliverDate.split('/');

                // Create Date objects for comparison
                var receivedDateObj = new Date(receivedDateParts[2], receivedDateParts[1] - 1, receivedDateParts[0]);
                var deliverDateObj = new Date(deliverDateParts[2], deliverDateParts[1] - 1, deliverDateParts[0]);

                // Check if the Deliver Date is greater than the Received Date
                if (deliverDateObj < receivedDateObj) {
                    $.showMessage('The delivery date must be greater than the received date.');
                    $(this).val(''); // Clear the invalid date value
                    $('[argumentid = "CarToBeDeliverStartDay"]',t.el).val('');
                    $('[argumentid ="CarToBeDeliverStartTime"]',t.el).val(''); 
                }

            });


            AsyncWidgets.WidgetScripts.frmCarServiceDetails.SetCurrentDateAndWeekDaysOnCarRecivedDateAndCarToBeDeliverdDate(t);
            AsyncWidgets.WidgetScripts.frmCarServiceDetails.IfStateIdIsNll(t);
            t.GetField('CarRecivedDate').datepicker("option", "minDate", new Date());
            t.GetField('CarToBeDeliverdDate').datepicker("option", "minDate", new Date());
        }
     
    });

    //On Change of Payment Mode  $('option:selected', elem)

    t.on('onLoadedValues', function (res)
    {
      

    debugger


        if (t.FormMode == 'update') {


            $('.grgbtnSave2', t.el).show();
            $('.grgbtnSave', t.el).hide();
            $('.StatusTR', t.el).show();
            $('.OnNewForm', t.el).show();


 

     
           


            t.GetField('CarRecivedDate').datepicker("option", "minDate", $('[argumentid="CarRecivedDate"]',t.el).val());
            t.GetField('CarToBeDeliverdDate').datepicker("option", "minDate", $('[argumentid="CarToBeDeliverdDate"]', t.el).val());

            t.GetField('CarDeliverdDate').datepicker("option", "minDate", $('[argumentid="CarDeliverdDate"]', t.el).val());
            t.GetField('NextServiceDate').datepicker("option", "minDate", $('[argumentid="NextServiceDate"]', t.el).val());


            var CurrentServiceKm1 = 0;
            $('[argumentid="CurrentServiceKm"]').on('focus', function () {
                CurrentServiceKm1 = parseInt($(this).val()) || 0;
            });
            $('[argumentid="CurrentServiceKm"]', t.el).on('blur', function () {
                
                CurrentServiceKm = parseInt($(this).val()) || 0;
                // Get the value of LastServiceKm (text content)
                var LastServiceKm = parseInt($('[argumentid="LastServiceKm"]', t.el).text()) || 0;

                // Check if CurrentServiceKm is less than LastServiceKm
                if (CurrentServiceKm <= LastServiceKm) {





                    // Increment the LastServiceKm by 1 and set it as the value of CurrentServiceKm
                    /* CurrentServiceKm = LastServiceKm + 1;*/
                  /*  CurrentServiceKm = 0;*/

                    // Update the input field with the new value
                    $(this).val(CurrentServiceKm1);
                    $.showMessage('In KM cannot be less than or equal to Last Service KM.')
                }

            });

            $('[argumentid="OutKm"]', t.el).on('blur', function () {



                OutKm = parseInt($(this).val()) || 0;

                var LastServiceKm = parseInt($('[argumentid="LastServiceKm"]', t.el).text()) || 0;
                var CurrentServiceKm = parseInt($('[argumentid="CurrentServiceKm"]', t.el).val()) || 0;


                // Check if CurrentServiceKm is less than LastServiceKm
                if (OutKm <= CurrentServiceKm || OutKm <= LastServiceKm  ) {





                    // Increment the LastServiceKm by 1 and set it as the value of CurrentServiceKm
                    /*OutKm = CurrentServiceKm + 1;*/
                    OutKm = 0;
                    // Update the input field with the new value
                    $(this).val(OutKm);
                    $.showMessage('Out KM cannot be less than or equal to Last Service KM & In KM .')
                }

            });


            $('[argumentid="NextServiceKm"]', t.el).on('blur', function ()
            {



                NextServiceKm = parseInt($(this).val()) || 0;

                var LastServiceKm = parseInt($('[argumentid="LastServiceKm"]', t.el).text()) || 0;
                var CurrentServiceKm = parseInt($('[argumentid="CurrentServiceKm"]', t.el).val()) || 0;
                var OutKm = parseInt($('[argumentid="OutKm"]', t.el).val()) || 0;

                // Check if CurrentServiceKm is less than LastServiceKm
                if (NextServiceKm <= OutKm || NextServiceKm <= CurrentServiceKm || NextServiceKm <= LastServiceKm)
                {





                    // Increment the LastServiceKm by 1 and set it as the value of CurrentServiceKm
                    /* NextServiceKm = OutKm + 1;*/
                    NextServiceKm = 0;

                    // Update the input field with the new value
                    $(this).val(NextServiceKm);
                    $.showMessage('NextServiceKM KM cannot be less than or equal to Last Service KM & In KM & Out KM.')
                }

            });

            $('[argumentid="CarToBeDeliverdDate"]', t.el).on('blur', function () {
                
                var receivedDate = $('[argumentid="CarRecivedDate"]', t.el).val();
                var deliverDate = $(this).val();

                // Parse the date values into Date objects (assuming the format is DD/MM/YYYY)
                var receivedDateParts = receivedDate.split('/');
                var deliverDateParts = deliverDate.split('/');

                // Create Date objects for comparison
                var receivedDateObj = new Date(receivedDateParts[2], receivedDateParts[1] - 1, receivedDateParts[0]);
                var deliverDateObj = new Date(deliverDateParts[2], deliverDateParts[1] - 1, deliverDateParts[0]);

                // Check if the Deliver Date is greater than the Received Date
                if (deliverDateObj < receivedDateObj) {
                    $.showMessage('The delivery date must be equal or greater than the received date.');
                    $(this).val(''); // Clear the invalid date value
                    $('[argumentid = "CarToBeDeliverStartDay"]', t.el).val('');
                    $('[argumentid ="CarToBeDeliverStartTime"]', t.el).val('');
                }

            });

            AsyncWidgets.WidgetScripts.frmCarServiceDetails.FileUploadForCarServiceDetails(t);
            AsyncWidgets.WidgetScripts.frmCarServiceDetails.IfStateIdIsClosedState(t);
            AsyncWidgets.WidgetScripts.frmCarServiceDetails.IfStateIdIsOpenState(t);
            AsyncWidgets.WidgetScripts.frmCarServiceDetails.IfStateIdIsCanceledState(t);

        }



      
    });

};



AsyncWidgets.WidgetScripts.frmCarServiceDetails.BindUploadHandlers = function (t) {


    $(".upload-button", t.el).click(function (e) {
        var isGUIDUpdateNeeded = false;
        ;
        if (val('FileGuid', t.el).trim() == "") {
            var guid = generateGuid();
            setField('FileGuid', guid, t.el);
            if (t.FormMode == 'update') {
                isGUIDUpdateNeeded = true;
            }
        }

        e.preventDefault();
        var fileInput = $(".file-input", t.el)[0];

        var files = fileInput.files;


        if (files.length === 0) {
            var errorMsg = $(".message", t.el).html("Please select a file.");
            $.showMessage(errorMsg);
            return;
        }


        var formData = new FormData();
        for (var i = 0; i < files.length; i++) {

            formData.append("file" + i, files[i]);

        }

        formData.append("DocType", val('DocType', t.el));
        formData.append("FileGuid", val("FileGuid", t.el));
        if (isGUIDUpdateNeeded) {
            formData.append("SalesRecId", val("RecId"));
        }
        $('.progress-bar', t.el).show();
        $.ajax({

            type: "POST",
            url: "UploadFileForCarServiceDetails/UploadFilesForJC", // Replace with your server-side handler URL
            data: formData,
            dataType: 'text',
            processData: false,
            contentType: false,
            xhr: function () {
                var xhr = new window.XMLHttpRequest();
                xhr.upload.addEventListener("progress", function (evt) {
                    if (evt.lengthComputable) {
                        var percentComplete = (evt.loaded / evt.total) * 100;
                        $(".progress-bar", t.el).width(percentComplete + "%");

                        if (percentComplete > 95) {
                            setTimeout(function () { $('.progress-bar', t.el).hide(); }, 3000);
                        }
                    }
                }, false);
                return xhr;

            },
            success: function (response) {
                objRes = JSON.parse(response)
                var rows = objRes.Response.Rows;
                for (var i = 0; i < rows.length; i++) {
                    var row = rows[i];
                    var fileName = row.FileName;
                    var msg = (`File [${fileName}] uploaded successfully.`);
                    $(".file-input", t.el).val('');
                    $('[argumentid = "DocType"]').val('');

                }

                AsyncWidgets.WidgetScripts.frmCarServiceDetails.GenerateUploadFiles(objRes, t);
                $.showMessage(msg);


                // $('.message', t.el).text(response);
            },
            error: function (error) {
                $(".message", t.el).html("Error uploading file(s): " + error.statusText);
            }
        }); //end of Ajax
    });

    // Remove a file from the list
    $(document).on("click", ".remove-button", function () {
        $(this).closest('tr').remove();
        $(".file-input", t.el).val('');


    });



    //   Handle file selection and display in the list
    var loggedUser = $('.LoggedUser').text();
    $(".file-input", t.el).change(function () {
        
        /* var fileList = $(".file-list", t.el);*/
        var linkFile = $('.ItemTableRow td>.linkFileName', t.el);
        var fileName = $('.ItemTableRow td>.fileName', t.el);
        var allowedFileExt = $('.allowedFile').text();

        var files = this.files;
        for (var i = 0; i < files.length; i++) {
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


    function generateGuid() {

        return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
            var r = Math.random() * 16 | 0,
                v = c == 'x' ? r : (r & 0x3 | 0x8);
            return v.toString(16);
        });

    }




  
};

AsyncWidgets.WidgetScripts.frmCarServiceDetails.GenerateUploadFiles = function (res, t) {
    if (res.status == 'OK') {
        if (res.Response.Rows.length > 0) {
            var rows = res.Response.Rows;

            var $fileList = $(".file-list", t.el);
            var loggedUser = $('.LoggedUser').text();
            var tblRowsHTML = "";
            $('table.UploadFileListForJC .ItemTableRow').show();
            $('table.UploadFileListForJC .NoRecordsTR').hide();
            
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

                var genHtml = `
                                  
                                <tr class="ItemTableRow" style="white-space: nowrap" evenrowcss="w-grid-row-odd" oddrowcss="w-grid-row-odd" hoverrowcss="">
                               <td class="ColTemplate w-grid-cell-border colIndex-4 linkFileName" style="padding: 5px; background: white; color: black;">${fileLink}</td>
                              <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;"> ${fileSize}</td>
                              <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${fileType}</td>
                              <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${loggedUser}</td>
                              <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;"> ${dateCreated}</td>
                             <td class="ColTemplate w-grid-cell-border colIndex-4  remove-button" style="text-align: center;display:block;" recid="${recId}" filename="${fileName}">X</td>
                              </tr>
                                                `;

                tblRowsHTML += genHtml;



            }  // for loop;

            var tblUFL = $('table.UploadFileListForJC', t.el); // get the main table

            $('tbody', tblUFL).html(tblRowsHTML); //inject html of the download file list table
            $('.remove-button', tblUFL).click(function ()
            {
                var btn = $(this);
                var recId = btn.attr("recId");
                var fileName = btn.attr("fileName");

                var DeleteUploadFile = AsyncWidgets.WidgetScripts.frmCarServiceDetails.DeleteUploadFile;
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
        else
        {
            var tblUFL = $('table.uploadedFileList', t.el);
            $('.ItemTR', tblUFL).hide();
            $('.NoRecordsTR', tblUFL).show();

            $('table.UploadFileListForJC .ItemTableRow').hide();
            $('table.UploadFileListForJC .NoRecordsTR').show();
        }
    } //  if (res.status == 'OK')

};
AsyncWidgets.WidgetScripts.frmCarServiceDetails.DeleteUploadFile = function (t, recId, fileName) {

    var params = { Command: 'FX_UPD_FileUploadForCarServiceDetails', RecId: recId, DBAction: 'DeleteFile' };
    SInfo = getForm(null, null, params);
    var inv = new AsyncWidgets.RAInvoker();
    inv.on('onSuccess', function (res) {
        var res = decJSON(res);
        if (res.status == 'OK') {
            var response = res.Response || '';
            var msg = response.split('||');
            $.showMessage(`File [${fileName}] ${msg[2]}`);
        } else {
            $.showMessage(`File [${fileName}] not Delete `);

        }
        $(t.el).unmask();
    });
    inv.invokeRA({ params: ["ActorId", "DataHelper", "ActionId", "DataAction", "ServiceInfo", SInfo] });
};

//calculate weekday of start date
AsyncWidgets.WidgetScripts.frmCarServiceDetails.CalculateDayOfWeekCsDate = function (csDate)
{

    if (!!csDate)
    {
        var oDate = csDate.convertDate();
        if (!isNaN(oDate))
        {
            var weekdays = [ 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday' ];
            return weekdays[ oDate.getDay() ];



        }
        return "";
    }
};

AsyncWidgets.WidgetScripts.frmCarServiceDetails.FileUploadForCarServiceDetails = function (t)
{
    var params = { Command: 'FX_UPD_FileUploadForCarServiceDetails', FileGuid: val('FileGuid', t.el), DBAction: 'GetUploadedFiles' };

    SInfo = getForm(null, null, params);
    var inv = new AsyncWidgets.RAInvoker();
    inv.on('onSuccess', function (res) {
        var res = decJSON(res);
        AsyncWidgets.WidgetScripts.frmCarServiceDetails.GenerateUploadFiles(res, t);
        $(t.el).unmask();
    });
    inv.invokeRA({ params: ["ActorId", "DataHelper", "ActionId", "GetData", "ServiceInfo", SInfo] });
};

AsyncWidgets.WidgetScripts.frmCarServiceDetails.handleBlurOnDates = function (dateFieldId, timeFieldId, dayFieldId, t)
{
    
 
    $('[argumentid="' + dateFieldId + '"]').on('blur', function () {
        debugger
        var cDate = new Date();
        var cH = cDate.getHours();
        var cM = cDate.getMinutes();

        // Add leading zeros if necessary
        cH = cH < 10 ? '0' + cH : cH;
        cM = cM < 10 ? '0' + cM : cM;

        // Set the time in the corresponding time field
        $('[argumentid="' + timeFieldId + '"]', t.el).val(cH + ':' + cM);

        // Get the date value
        var csDate = val(dateFieldId, t.el);

        // Calculate day of the week
        var dow = AsyncWidgets.WidgetScripts.frmCarServiceDetails.CalculateDayOfWeekCsDate(csDate);

        // Set the day of the week
        setField(dayFieldId, dow, t.el);
    });
};

AsyncWidgets.WidgetScripts.frmCarServiceDetails.AllowedFiles = function (t)
{
    var params = { Command: 'FX_SEL_Common_LOV_AutoFill', textcol: 'Name', valcol: 'ChildId', isparentstr: "false", parenttypeid: "35" };
    function Success(res) {

        var res = decJSON(res);
        if (res.status == 'OK') {
            if (res.Response.Rows.length > 0) {
                var rows = res.Response.Rows;
                console.log(`Rows: ${rows}`);
                for (var i = 0; i < rows.length; i++) {

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
};

AsyncWidgets.WidgetScripts.frmCarServiceDetails.PrintJobCard = function (t) {
    var strlink = ROOT_PATH + "Pages/eForms/iRental/Reports/PrintCarServiceDetails.aspx?FormCode=" + $('[argumentid="RecCode"]', t.el).text(); // +'&amp;FormId=' + pm.SelectedKey;
    console.log(strlink);
    var width = 920;
    var height = 600;
    var left = parseInt((screen.availWidth / 2) - (width / 2)) - 15;
    var top = parseInt((screen.availHeight / 2) - (height / 2));
    window.open(strlink, '_blank', "'titlebar=no,resizable=1,scrollbars=yes,height=" + height + ",width=" + width + ",left=" + left + ",top=" + top + "screenX=" + left + ",screenY=" + top + "'");
    console.log('Click on Print Button');

    return false;


};

AsyncWidgets.WidgetScripts.frmCarServiceDetails.CarServiceButton_Edit = function (t)
{
    $('.common-button,.CommonDisableClass, .Problem, .ActionTaken, .CarCondition,.PrintJobCard,.OnStartState ', t.el).removeAttr('disabled', 'disabled');

    $('.common-button,.CommonDisableClass, .Problem, .ActionTaken, .CarCondition,.PrintJobCard,.OnStartState ', t.el).removeClass('ElemDisabled');
    $('[argumentid="CarRecivedDate"]', t.el).next('img').show();
    $('[argumentid="CarToBeDeliverdDate"]', t.el).next('img').show();
    $('[argumentid="CarDeliverdDate"]', t.el).next('img').show();
    $('[argumentid="NextServiceDate"]', t.el).next('img').show();


    $('[argumentid="CarRecivedDate"]', t.el).removeAttr('disabled', 'disabled');
    $('[argumentid="CarNumber"]', t.el).attr('disabled', 'disabled');


    $('[argumentid="CarRecivedDate"]', t.el).removeClass('ElemDisabled');
    $('[argumentid="CarNumber"]', t.el).addClass('ElemDisabled');
    $('[argumentid="CarRecivedDate"]', t.el).next('img').show();
};

AsyncWidgets.WidgetScripts.frmCarServiceDetails.SetCurrentDateAndWeekDaysOnCarRecivedDateAndCarToBeDeliverdDate = function (t)
{

    var dt = new Date();
    $('[argumentid="CarRecivedDate"]', t.el).val(dt.getDate() + '/' + (dt.getMonth() + 1) + '/' + dt.getFullYear());
    $('[argumentid="CarToBeDeliverdDate"]', t.el).val(dt.getDate() + '/' + (dt.getMonth() + 1) + '/' + dt.getFullYear());

    var cH = dt.getHours();
    var cM = dt.getMinutes();

    cH = cH < 10 ? '0' + cH : cH;
    cM = cM < 10 ? '0' + cM : cM;



    var csDate = val('CarRecivedDate', t.el);

    var dow = AsyncWidgets.WidgetScripts.frmCarServiceDetails.CalculateDayOfWeekCsDate(csDate);


    setField('ServiceStartDay', dow, t.el);


    var esDate = val('CarToBeDeliverdDate', t.el);

    var dowe = AsyncWidgets.WidgetScripts.frmCarServiceDetails.CalculateDayOfWeekCsDate(esDate);


    setField('CarToBeDeliverStartDay', dowe, t.el);


    $('[argumentid="ServiceStartTime"]', t.el).val(cH + ':' + cM);
    $('[argumentid="CarToBeDeliverStartTime"]', t.el).val(cH + ':' + cM);


};

AsyncWidgets.WidgetScripts.frmCarServiceDetails.IfStateIdIsNll = function (t)
{
    if ($('[argumentid="StateId"]', t.el).text() == '') {

        $('[argumentid="StateId"]', t.el).text('OpenState');
        $('[argumentid="StateName"]', t.el).text('Start State');

        $('.common-button,.CommonDisableClass, .Problem, .ActionTaken, .CarCondition,.ServiceStartTime', t.el).removeAttr('disabled', 'disabled');

        $('.common-button,.CommonDisableClass, .Problem, .ActionTaken, .CarCondition,.ServiceStartTime', t.el).removeClass('ElemDisabled');
        $('[argumentid="CarRecivedDate"]', t.el).next('img').show();
        $('[argumentid="CarToBeDeliverdDate"]', t.el).next('img').show();
        $('[argumentid="CarDeliverdDate"]', t.el).next('img').show();
        $('[argumentid="NextServiceDate"]', t.el).next('img').show();
        $('.StatusTR', t.el).hide();

        $('[argumentid="CarRecivedDate"]', t.el).removeAttr('disabled', 'disabled');
        $('[argumentid="CarNumber"]', t.el).removeAttr('disabled', 'disabled');

        $('[argumentid="CarRecivedDate"]', t.el).removeClass('ElemDisabled');
        $('[argumentid="CarNumber"]', t.el).removeAttr('ElemDisabled');
        $('[argumentid="CarRecivedDate"]', t.el).next('img').show();
        $('.grgbtnClosed,.grgbtnCanceled,.PrintJobCard,.grgbtnSave3,.OnStartState,.AlwaysDisableJC', t.el).attr('disabled', 'disabled');
        $('.grgbtnClosed,.grgbtnCanceled,.PrintJobCard,.grgbtnSave3,.OnStartState,.AlwaysDisableJC', t.el).addClass('ElemDisabled');
        $('[argumentid="CarDeliverdDate"]', t.el).next('img').hide();
        $('[argumentid="NextServiceDate"]', t.el).next('img').hide();

    }
};

AsyncWidgets.WidgetScripts.frmCarServiceDetails.IfStateIdIsClosedState = function (t)
{
    if ($('[argumentid="StateId"]', t.el).text() == 'ClosedState') {


        $('.common-button,.CommonDisableClass', t.el).attr('disabled', 'disabled');


        //$(',.Problem, .ActionTaken, .CarCondition', t.el).removeAttr('disabled', 'disabled');
        //$('.Problem, .ActionTaken, .CarCondition', t.el).removeClass('ElemDisabled');

        $('.common-button,.CommonDisableClass,.PrintJobCard,.AlwaysDisableJC,.CarDeliverdStartTime,.NextServiceStartTime', t.el).attr('disabled', 'disabled');
        $('.common-button,.CommonDisableClass,.PrintJobCard,.AlwaysDisableJC,.CarDeliverdStartTime,.NextServiceStartTime', t.el).addClass('ElemDisabled');
        $('[argumentid="CarRecivedDate"]', t.el).next('img').hide();
        $('[argumentid="CarToBeDeliverdDate"]', t.el).next('img').hide();
        $('[argumentid="CarDeliverdDate"]', t.el).next('img').hide();

        $('[argumentid="NextServiceDate"]', t.el).next('img').hide();
        $('[argumentid="DocType"]').val($('[argumentid="DocType"] option').eq(3).val());

    }
};
AsyncWidgets.WidgetScripts.frmCarServiceDetails.IfStateIdIsOpenState = function (t)
{
    if ($('[argumentid="StateId"]', t.el).text() == 'OpenState') {


        $('[argumentid="CarRecivedDate"],.common-button,.CommonDisableClass,.Problem, .ActionTaken, .CarCondition,.PrintJobCard,.CarDeliverdStartTime,.NextServiceStartTime', t.el).removeAttr('disabled', 'disabled');
        $('[argumentid="CarRecivedDate"],.common-button,.CommonDisableClass,.Problem, .ActionTaken, .CarCondition,.PrintJobCard,.CarDeliverdStartTime,.NextServiceStartTime', t.el).removeClass('ElemDisabled');
        $('[argumentid="CarRecivedDate"]', t.el).next('img').show();
        $('[argumentid="CarToBeDeliverdDate"]', t.el).next('img').show();
        $('[argumentid="CarDeliverdDate"]', t.el).next('img').show();
        $('[argumentid="NextServiceDate"]', t.el).next('img').show();

        $('[argumentid="CarNumber"],.grgbtnSave3,.AlwaysDisableJC', t.el).attr('disabled', 'disabled');

        $('.grgbtnSave3,.AlwaysDisableJC', t.el).addClass('ElemDisabled');
        $('[argumentid="CarNumber"]', t.el).addClass('ElemDisabled');
        $('[argumentid="DocType"]').val($('[argumentid="DocType"] option').eq(3).val());

        //var CarRecivedDate = $('[argumentid="CarRecivedDate"]',t.el).val();
        //var CarToBeDeliverdDate = $('[argumentid="CarToBeDeliverdDate"]', t.el).val();



        //const daysDifference = compareDates(CarRecivedDate, CarToBeDeliverdDate);
        //console.log(daysDifference); // Outputs: The difference is 9 days.





    }
};
AsyncWidgets.WidgetScripts.frmCarServiceDetails.IfStateIdIsCanceledState = function (t)
{
    if ($('[argumentid="StateId"]', t.el).text() == 'CanceledState') {
        debugger

        $('.common-button,.CommonDisableClass, .Problem, .ActionTaken, .CarCondition,.PrintJobCard,.AlwaysDisableJC,.CarDeliverdStartTime,.NextServiceStartTime', t.el).attr('disabled', 'disabled');


        $('.common-button,.CommonDisableClass, .Problem, .ActionTaken, .CarCondition,.PrintJobCard,.AlwaysDisableJC,.CarDeliverdStartTime,.NextServiceStartTime', t.el).addClass('ElemDisabled');
        $('[argumentid="CarRecivedDate"]', t.el).next('img').hide();
        $('[argumentid="CarToBeDeliverdDate"]', t.el).next('img').hide();
        $('[argumentid="CarDeliverdDate"]', t.el).next('img').hide();
        $('[argumentid="CarRecivedDate"]', t.el).next('img').hide();
        $('[argumentid="NextServiceDate"]', t.el).next('img').hide();
        $('[argumentid="DocType"]').val($('[argumentid="DocType"] option').eq(3).val());

        //$('[argumentid="StateName"]',t.el).filter(function () {
        //    return $(this).text().trim() === 'Canceled';
        //}).css('color', 'red');


    }
};

















