AsyncWidgets.WidgetScripts.frmCarServiceDetails = function (obj)
{
    var t = obj;

    AsyncWidgets.WidgetScripts.frmCarServiceDetails.t = t;


    $(".ServiceCHK, .ProblemCHK,.BothCHK").click(function () {
        debugger;
        AsyncWidgets.WidgetScripts.frmCarServiceDetails.AddAsterisk(t);



    });



    const problemTextArea = document.querySelector('[argumentid="Problem"]',t.el);
    const ActionTakenTextArea = document.querySelector('[argumentid="ActionTaken"]', t.el);
    problemTextArea.addEventListener('keypress', function (event) {
        // Check if the Enter key (key code 13) is pressed
        if (event.key === 'Enter') {
            event.preventDefault(); // Prevent the default action (form submission)
            this.value += '\n'; // Append a new line character
        }
    });

    ActionTakenTextArea.addEventListener('keypress', function (event) {
        // Check if the Enter key (key code 13) is pressed
        if (event.key === 'Enter') {
            event.preventDefault(); // Prevent the default action (form submission)
            this.value += '\n'; // Append a new line character
        }
    });

    $('[argumentid="CurrentServiceKm"]', t.el).on('input', function () {

        $('[argumentid="NextServiceKm"]', t.el).val('');
        $('[argumentid="OutKm"]', t.el).val('');
    });
    $('.btn5KD', t.el).on('click', function () {

        var CurrentServiceKm = parseFloat($('[argumentid="CurrentServiceKm"]', t.el).val()) || 0;
        var NextServiceKm = parseFloat($('[argumentid="NextServiceKm"]', t.el).val()) || 0;
        if ($('.WarrentyNo').is(':checked')) {
        

            // Code to execute if .WarrentyNo is checked
            $('[argumentid="NextServiceKm"]', t.el).val('');
         
            if (CurrentServiceKm == 0) {
                $.showMessage('In-Km cannot be empty or zero')
                return false;
            }
            var result = CurrentServiceKm + 5000

            $('[argumentid="NextServiceKm"]', t.el).val(result)

        }
        else if ($('.WarrentyYes').is(':checked')) {
            debugger
            $('[argumentid="NextServiceKm"]', t.el).val('');

            if (CurrentServiceKm == 0) {
                $.showMessage('In-Km cannot be empty or zero')
                return false;
            }
            var result = Math.ceil(CurrentServiceKm / 5000) * 5000;
            $('[argumentid="NextServiceKm"]', t.el).val(result);

           /* $('[argumentid="NextServiceKm"]', t.el).val(res)*/

        }


    });

    $('.btn10KD', t.el).on('click', function () {
        var CurrentServiceKm = parseFloat($('[argumentid="CurrentServiceKm"]', t.el).val()) || 0;
        var NextServiceKm = parseFloat($('[argumentid="NextServiceKm"]', t.el).val()) || 0;
        if ($('.WarrentyNo').is(':checked')) {
            $('[argumentid="NextServiceKm"]', t.el).val('')
            // Code to execute if .WarrentyNo is checked
        

            if (CurrentServiceKm == 0) {
                $.showMessage('In-Km cannot be empty or zero')
                return false;
            }
            var result = CurrentServiceKm + 10000;

            $('[argumentid="NextServiceKm"]', t.el).val(result)

        }
        else if ($('.WarrentyYes').is(':checked')) {
            debugger
            $('[argumentid="NextServiceKm"]', t.el).val('');

            if (CurrentServiceKm == 0) {
                $.showMessage('In-Km cannot be empty or zero')
                return false;
            }
            var result = Math.ceil(CurrentServiceKm / 10000) * 10000;
            $('[argumentid="NextServiceKm"]', t.el).val(result);

            /* $('[argumentid="NextServiceKm"]', t.el).val(res)*/

        }


    });
    $('.btnGetNewDateD').click(function () {
        let dt = new Date(); // Correctly define Date object

        // Format date as YYYY-MM-DD for a date input field
        let today = dt.toISOString().split('T')[0];
        $('[argumentid="CarDeliverdDate"]',t.el).val(today); 
      //  $('[argumentid="CarDeliverdDate"]', t.el).val(dt.getDate() + '/' + (dt.getMonth() + 1) + '/' + dt.getFullYear());
        /*$('[argumentid="CarToBeDeliverdDate"]', t.el).val(dt.getDate() + '/' + (dt.getMonth() + 1) + '/' + dt.getFullYear());*/

        var cH = dt.getHours();
        var cM = dt.getMinutes();

        cH = cH < 10 ? '0' + cH : cH;
        cM = cM < 10 ? '0' + cM : cM;



        var csDate = val('CarDeliverdDate', t.el);

        var dow = AsyncWidgets.WidgetScripts.frmCarServiceDetails.CalculateDayOfWeekCsDate(csDate);


        setField('CarDeliverdStartDay', dow, t.el);

        $('[argumentid="CarDeliverdStartTime"]', t.el).val(cH + ':' + cM);
        //$('[argumentid="CarToBeDeliverStartTime"]', t.el).val(cH + ':' + cM);
    });

    $('.btnGetNewDateR').click(function () {
        let dt = new Date(); // Correctly define Date object

        // Format date as YYYY-MM-DD for a date input field
        let today = dt.toISOString().split('T')[0];
        $('[argumentid="CarRecivedDate"]').val(today); // Set date correctly

        // Get time in HH:MM formatd
        debugger
        let cH = dt.getHours().toString().padStart(2, '0');
        let cM = dt.getMinutes().toString().padStart(2, '0');

        // Calculate day of the week from selected date
        let csDate = $('[argumentid="CarRecivedDate"]').val();
        let dow = AsyncWidgets.WidgetScripts.frmCarServiceDetails.CalculateDayOfWeekCsDate(csDate);

        // Set fields
        $('#ServiceStartDay').val(dow);
        $('#ServiceStartTime').val(cH + ':' + cM);
    });

    $('.btn3').click(function () {
        debugger
       var a =  AsyncWidgets.WidgetScripts.frmCarServiceDetails.handleDateCalculation(3,t); // 3 months
    });

    $('.btn6').click(function () {
       var a= AsyncWidgets.WidgetScripts.frmCarServiceDetails.handleDateCalculation(6,t); // 6 months
    });

    $('.btn12').click(function () {
       var a = AsyncWidgets.WidgetScripts.frmCarServiceDetails.handleDateCalculation(12,t); // 12 months
    });
 
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
    /*AsyncWidgets.WidgetScripts.frmCarServiceDetails.handleBlurOnDates('CarToBeDeliverdDate', 'CarToBeDeliverStartTime', 'CarToBeDeliverStartDay', t);*/
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
            $('.hideOnNoExpirayDate', t.el).show();
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

            $('.AddRequired', t.el).removeClass('required').removeAttr('requirederr', '*');

            $('.AddRequiredOnNXKM', t.el).removeClass('required').removeAttr('requirederr', '*');
         
            AsyncWidgets.WidgetScripts.frmCarServiceDetails.RemoveAsterisk(t);

            $('table.ItemsModifyListt tfoot tr').show();
            $('table.ItemsModifyListt tbody tr').remove();


            var zero = 0;
            $('[argumentid="totalTotalPrice"]', t.el).val(zero.toFixed(3)).css('color', 'red');
            $('[argumentid="totalDiscount"]', t.el).val(zero.toFixed(3)).css('color', 'red');
            $('[argumentid="totalGrandTotalRes"]', t.el).val(zero.toFixed(3)).css('color', 'red');
        }
     
    });

    //On Change of Payment Mode  $('option:selected', elem)

    t.on('onLoadedValues', function (args)
    {
      

        $('table.ItemsModifyListt tfoot tr').show();
        $('table.ItemsModifyListt tbody tr').remove();


        if (t.FormMode == 'update')
        {


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

            //$('[argumentid="CurrentServiceKm"]', t.el).on('input', function () {

            //    var CurrentServiceKm = $(this).val();
            //    $('[argumentid="OutKm"]', t.el).val(CurrentServiceKm);

            //});

            $('.btnCurrentServiceKm', t.el).on('click', function () {
                
                var CurrentServiceKm = $('[argumentid="CurrentServiceKm"]',t.el).val();
                $('[argumentid="OutKm"]', t.el).val(CurrentServiceKm);

            });

            
            $('[argumentid="CurrentServiceKm"]', t.el).on('blur', function () {
                
                CurrentServiceKm = parseInt($(this).val()) || 0;
                // Get the value of LastServiceKm (text content)
                var LastServiceKm = parseInt($('[argumentid="LastServiceKm"]', t.el).text()) || 0;

                // Check if CurrentServiceKm is less than LastServiceKm
                if (CurrentServiceKm < LastServiceKm) {





                    // Increment the LastServiceKm by 1 and set it as the value of CurrentServiceKm
                    /* CurrentServiceKm = LastServiceKm + 1;*/
                  /*  CurrentServiceKm = 0;*/

                    // Update the input field with the new value
                    $(this).val('');
                    $.showMessage('In-KM cannot be less than to Last Service-KM.')
                }

            });

            $('[argumentid="OutKm"]', t.el).on('blur', function () {



                OutKm = parseInt($(this).val()) || 0;

                var LastServiceKm = parseInt($('[argumentid="LastServiceKm"]', t.el).text()) || 0;
                var CurrentServiceKm = parseInt($('[argumentid="CurrentServiceKm"]', t.el).val()) || 0;


                // Check if CurrentServiceKm is less than LastServiceKm
                if (OutKm < CurrentServiceKm || OutKm < LastServiceKm  ) {





                    // Increment the LastServiceKm by 1 and set it as the value of CurrentServiceKm
                    /*OutKm = CurrentServiceKm + 1;*/
                    OutKm = 0;
                    // Update the input field with the new value
                    $(this).val('');
                    $.showMessage('Out-KM cannot be less than  to Last Service KM & In-KM .')
                }

            });


            //$('[argumentid="NextServiceKm"]', t.el).on('blur', function ()
            //{



            //    NextServiceKm = parseInt($(this).val()) || 0;

            //    var LastServiceKm = parseInt($('[argumentid="LastServiceKm"]', t.el).text()) || 0;
            //    var CurrentServiceKm = parseInt($('[argumentid="CurrentServiceKm"]', t.el).val()) || 0;
            //    var OutKm = parseInt($('[argumentid="OutKm"]', t.el).val()) || 0;

            //    // Check if CurrentServiceKm is less than LastServiceKm
            //    if (NextServiceKm < OutKm || NextServiceKm < CurrentServiceKm || NextServiceKm < LastServiceKm)
            //    {





            //        // Increment the LastServiceKm by 1 and set it as the value of CurrentServiceKm
            //        /* NextServiceKm = OutKm + 1;*/
            //        NextServiceKm = 0;

            //        // Update the input field with the new value
            //        $(this).val('');
            //        $.showMessage('NextServiceKM-KM cannot be less than  to Last Service-KM & In-KM & Out-KM.')
            //    }

            //});

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

            
            var FullInsuranceExpiry = $('[argumentid="FullInsuranceExpiry"]', t.el).text();
            if (FullInsuranceExpiry === '' | FullInsuranceExpiry == null) {
                $('.hideOnNoExpirayDate', t.el).hide();
            } else {
                $('.hideOnNoExpirayDate', t.el).show();
            }


            
            
            if (args.res.status == 'OK') {

                if (args.res.Response.Rows.length > 0) {

                    var rows = args.res.Response.Rows;
                    console.log(row);

                    for (var i = 0; i < rows.length; i++) {

                        var row = rows[i];
                        var recId = row.RecId;
                        var RecCode = row.RecCode
                       /* var InvRecCode = row.InvRecCode;*/

                        var params = {
                            Command: 'UPD_InvoiceDetails',
                            DBAction: 'GetLinesItemsInJobCard',
                            ServiceNo: `${RecCode}`,
                           /* InvRecCode: `${InvRecCode}`*/


                        };

                        /*  Assuming ServerCall is a function to make an API call*/
                        ServerCall(params, function (res) {

                           // var res = decJSON(res)


                            if (res.status === 'OK') {


                                setTimeout(function () {
                                    AsyncWidgets.WidgetScripts.frmCarServiceDetails.showItemsList(res, t)

                                    AsyncWidgets.WidgetScripts.frmCarServiceDetails.ChangeColor(t)
                                }, 1000)


                            }





                        }, 'GetData');


                    }//end for loop




                }


            }

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
                
                var fileLink = `<a class='file-link' href='UploadsFilesForCarServiceDetails/${recId}_${fileGuid}_${fileName}' target='_blank' rel='noopener noreferrer'>${fileName}</a>`;



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
                             <td class="ColTemplate w-grid-cell-border colIndex-4  remove-button" style="text-align: center;" recid="${recId}" filename="${fileName}">X</td>
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
    let convertedDate = new Date(csDate);

    if (!!convertedDate)
    {
      //  var oDate = csDate.convertDate();
        if (!isNaN(convertedDate))
        {
            var weekdays = [ 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday' ];
            return weekdays[convertedDate.getDay() ];



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
    var strlink = ROOT_PATH + "Pages/eForms/iRental/Reports/PrintCarServiceDetails.aspx?FormCode=" + $('[argumentid="RecCode"]', t.el).val(); // +'&amp;FormId=' + pm.SelectedKey;
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
    $('[argumentid="ManualID"],.common-button,.CommonDisableClass, .Problem, .ActionTaken, .CarCondition,.PrintJobCard,.OnStartState ', t.el).removeAttr('disabled', 'disabled');

    $('[argumentid="ManualID"],.common-button,.CommonDisableClass, .Problem, .ActionTaken, .CarCondition,.PrintJobCard,.OnStartState ', t.el).removeClass('ElemDisabled');
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
    debugger
    var dt = new Date();
    $('[argumentid="CarRecivedDate"]', t.el).val(dt.getDate() + '/' + (dt.getMonth() + 1) + '/' + dt.getFullYear());
    /*$('[argumentid="CarToBeDeliverdDate"]', t.el).val(dt.getDate() + '/' + (dt.getMonth() + 1) + '/' + dt.getFullYear());*/

    var cH = dt.getHours();
    var cM = dt.getMinutes();

    cH = cH < 10 ? '0' + cH : cH;
    cM = cM < 10 ? '0' + cM : cM;



    var csDate = val('CarRecivedDate', t.el);

    var dow = AsyncWidgets.WidgetScripts.frmCarServiceDetails.CalculateDayOfWeekCsDate(csDate);
    

    setField('ServiceStartDay', dow, t.el);


    //var esDate = val('CarToBeDeliverdDate', t.el);

    //var dowe = AsyncWidgets.WidgetScripts.frmCarServiceDetails.CalculateDayOfWeekCsDate(esDate);


    //setField('CarToBeDeliverStartDay', dowe, t.el);


    $('[argumentid="ServiceStartTime"]', t.el).val(cH + ':' + cM);
    //$('[argumentid="CarToBeDeliverStartTime"]', t.el).val(cH + ':' + cM);


};

AsyncWidgets.WidgetScripts.frmCarServiceDetails.IfStateIdIsNll = function (t)
{
    if ($('[argumentid="StateId"]', t.el).text() == '') {

        $('[argumentid="StateId"]', t.el).text('OpenState');
        $('[argumentid="StateName"]', t.el).text('Start State');

        $('[argumentid="ManualID"],.common-button,.CommonDisableClass, .Problem, .ActionTaken, .CarCondition,.ServiceStartTime', t.el).removeAttr('disabled', 'disabled');

        $('[argumentid="ManualID"],.common-button,.CommonDisableClass, .Problem, .ActionTaken, .CarCondition,.ServiceStartTime', t.el).removeClass('ElemDisabled');
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


        $('.AddRequired', t.el).removeClass('required').removeAttr('requirederr', '*');
        $('.AddRequiredOnNXKM', t.el).removeClass('required').removeAttr('requirederr', '*');


        AsyncWidgets.WidgetScripts.frmCarServiceDetails.RemoveAsterisk(t);
    }
};

AsyncWidgets.WidgetScripts.frmCarServiceDetails.IfStateIdIsClosedState = function (t)
{
    setTimeout(function () {
        if ($('[argumentid="StateId"]', t.el).text() == 'ClosedState') {


            $('.common-button,.CommonDisableClass', t.el).attr('disabled', 'disabled');


            //$(',.Problem, .ActionTaken, .CarCondition', t.el).removeAttr('disabled', 'disabled');
            //$('.Problem, .ActionTaken, .CarCondition', t.el).removeClass('ElemDisabled');

            $('[argumentid="ManualID"],.common-button,.CommonDisableClass,.AlwaysDisableJC,.CarDeliverdStartTime,.NextServiceStartTime', t.el).attr('disabled', 'disabled');
            $('[argumentid="ManualID"],.common-button,.CommonDisableClass,.AlwaysDisableJC,.CarDeliverdStartTime,.NextServiceStartTime', t.el).addClass('ElemDisabled');
            $('[argumentid="CarRecivedDate"]', t.el).next('img').hide();
            $('[argumentid="CarToBeDeliverdDate"]', t.el).next('img').hide();
            $('[argumentid="CarDeliverdDate"]', t.el).next('img').hide();

            $('[argumentid="NextServiceDate"]', t.el).next('img').hide();
            $('[argumentid="DocType"]').val($('[argumentid="DocType"] option').eq(3).val());
            $('.grgbtnSave3,.CarServiceButton_Edit ', t.el).show();
            $('.AddRequired', t.el).removeClass('required').removeAttr('requirederr', '*');

            $('.AddRequiredOnNXKM', t.el).removeClass('required').removeAttr('requirederr', '*');


            AsyncWidgets.WidgetScripts.frmCarServiceDetails.RemoveAsterisk(t);
        }
    }, 2000);
};
AsyncWidgets.WidgetScripts.frmCarServiceDetails.IfStateIdIsOpenState = function (t)
{
    if ($('[argumentid="StateId"]', t.el).text() == 'OpenState') {


        $('[argumentid="ManualID"],[argumentid="CarRecivedDate"],.common-button,.CommonDisableClass,.Problem, .ActionTaken, .CarCondition,.PrintJobCard,.CarDeliverdStartTime,.NextServiceStartTime', t.el).removeAttr('disabled', 'disabled');
        $('[argumentid="ManualID"],[argumentid="CarRecivedDate"],.common-button,.CommonDisableClass,.Problem, .ActionTaken, .CarCondition,.PrintJobCard,.CarDeliverdStartTime,.NextServiceStartTime', t.el).removeClass('ElemDisabled');
        $('[argumentid="CarRecivedDate"]', t.el).next('img').show();
        $('[argumentid="CarToBeDeliverdDate"]', t.el).next('img').show();
        $('[argumentid="CarDeliverdDate"]', t.el).next('img').show();
        $('[argumentid="NextServiceDate"]', t.el).next('img').show();

        $('[argumentid="CarNumber"],.grgbtnSave3,.AlwaysDisableJC', t.el).attr('disabled', 'disabled');

        $('.grgbtnSave3,.AlwaysDisableJC', t.el).addClass('ElemDisabled');
        $('[argumentid="CarNumber"]', t.el).addClass('ElemDisabled');
        $('[argumentid="DocType"]').val($('[argumentid="DocType"] option').eq(3).val());

        $('.grgbtnSave3,.CarServiceButton_Edit ', t.el).hide();
        $('.AddRequired', t.el).addClass('required').attr('requirederr', '*');

        AsyncWidgets.WidgetScripts.frmCarServiceDetails.AddAsterisk(t);
        
      
        //var CarRecivedDate = $('[argumentid="CarRecivedDate"]',t.el).val();
        //var CarToBeDeliverdDate = $('[argumentid="CarToBeDeliverdDate"]', t.el).val();



        //const daysDifference = compareDates(CarRecivedDate, CarToBeDeliverdDate);
        //console.log(daysDifference); // Outputs: The difference is 9 days.

        if ($('.ServiceCHK').is(':checked') || $('.BothCHK').is(':checked')) {

            $('.AddRequiredOnNXKM', t.el).addClass('required').attr('requirederr', '*');
            


        } else if ($('.ProblemCHK').is(':checked')) {

            $('.AddRequiredOnNXKM', t.el).removeClass('required').removeAttr('requirederr', '*');
            
        }




    }
};
AsyncWidgets.WidgetScripts.frmCarServiceDetails.IfStateIdIsCanceledState = function (t)
{
    setTimeout(function () {
        if ($('[argumentid="StateId"]', t.el).text() == 'CanceledState') {


            $('[argumentid="ManualID"],.common-button,.CommonDisableClass, .Problem, .ActionTaken, .CarCondition,.AlwaysDisableJC,.CarDeliverdStartTime,.NextServiceStartTime', t.el).attr('disabled', 'disabled');


            $('[argumentid="ManualID"],.common-button,.CommonDisableClass, .Problem, .ActionTaken, .CarCondition,.AlwaysDisableJC,.CarDeliverdStartTime,.NextServiceStartTime', t.el).addClass('ElemDisabled');
            $('[argumentid="CarRecivedDate"]', t.el).next('img').hide();
            $('[argumentid="CarToBeDeliverdDate"]', t.el).next('img').hide();
            $('[argumentid="CarDeliverdDate"]', t.el).next('img').hide();
            $('[argumentid="CarRecivedDate"]', t.el).next('img').hide();
            $('[argumentid="NextServiceDate"]', t.el).next('img').hide();
            $('[argumentid="DocType"]').val($('[argumentid="DocType"] option').eq(3).val());
            $('.grgbtnSave3,.CarServiceButton_Edit ', t.el).show();

            $('.AddRequired', t.el).removeClass('required').removeAttr('requirederr', '*');


            AsyncWidgets.WidgetScripts.frmCarServiceDetails.RemoveAsterisk(t);


        }
    }, 2000);
};

AsyncWidgets.WidgetScripts.frmCarServiceDetails.RemoveAsterisk = function (t) {
    const labels = ["Deliverd Date", "Next Service Date", "Out KM", "Action Taken", "Next Service KM"]; // Labels without colons
    $("td.AddAsterisk", t.el).each(function () {
        // Pehle text ko retrieve karo aur trim kar lo
        let text = $(this).text().trim();

        // Sab kuch jo label ke baad hai (jaise * ya :), hata do
        labels.forEach(label => {
            if (text.startsWith(label)) {
                // Agar label match karta hai, to baad ka sab kuch remove karo
                $(this).text(label + ":"); // Sirf colon wapas add karo
            }
        });
    });
}


AsyncWidgets.WidgetScripts.frmCarServiceDetails.AddAsterisk = function (t) {
    // Labels with colons to be modified
    const labels = ["Delivered Date", "Next Service Date", "Out KM", "Action Taken", "Next Service KM"];
    // Specific labels without colons to target when "Problem" is checked
    const labelss = ["Next Service Date", "Next Service KM"];
    
    // Check if either the "Service" or "Both" radio button is checked
    if ($('.ServiceCHK').is(':checked') || $('.BothCHK').is(':checked')) {
        // Filter and modify labels for asterisks
        $("label.AddAsterisk").filter(function () {
            const text = $(this).text().trim();

            // If the text matches one of the defined labels
            if (labels.includes(text)) {
                // Replace the colon with an asterisk
               // const newText = text.replace(":", "*:");
                $(this).text(text + "*");

                return true; // Continue processing
            }
            $('.AddRequiredOnNXKM', t.el).addClass('required').attr('requirederr', '*');
            return false; // Stop processing this item
        });
    }

    // Check if the "Problem" radio button is checked
    if ($('.ProblemCHK').is(':checked')) {
        // Iterate over each label in AddAsterisk
        $("label.AddAsterisk", t.el).each(function () {
            // Retrieve the text and trim it
            let text = $(this).text().trim();

            // Check if the text starts with any of the specified labels
            labelss.forEach(label => {
                if (text.startsWith(label)) {
                    // If there's a match, revert to the original label with a colon
                    $(this).text(label + "");
                }
            });
            $('.AddRequiredOnNXKM', t.el).removeClass('required').removeAttr('requirederr', '*');
        });
    }

    return false; // End of the function
};



// Function to handle date calculation based on button click
//AsyncWidgets.WidgetScripts.frmCarServiceDetails.handleDateCalculation = function (monthsToAdd,t) {
//        // Current date field value
//    var currentDateValue = $('[argumentid="CarRecivedDate"]', t.el).val();
    
//        // Validate and parse the date
//   // var currentDate = AsyncWidgets.WidgetScripts.frmCarServiceDetails.validateAndParseDate(currentDateValue);
//    let currentDate = new Date(currentDateValue);
//        if (currentDate) {
//            // Add specified months
//            currentDate.setMonth(currentDate.getMonth() + monthsToAdd);
//            // Check if the resulting date is a Friday
//            if (currentDate.getDay() === 5) { // 5 represents Friday
//                // Increment by one day to set to Saturday
//                currentDate.setDate(currentDate.getDate() + 1);
//            }

//            // Format the date to DD/MM/YYYY
//            var nextServiceDate = currentDate.toLocaleDateString('en-GB');
//            let currenConverttDate = new Date(nextServiceDate);
//            // Save in the NextServiceDate field
//            $('[argumentid="NextServiceDate"]', t.el).val(currenConverttDate);
//            var a =$('[argumentid="NextServiceDate"]', t.el).val();
//            var dow = AsyncWidgets.WidgetScripts.frmCarServiceDetails.CalculateDayOfWeekCsDate(a);


//            setField('NextServiceStartDay', dow, t.el);
//        } else {
//            $.showMessage("Please first select a valid <strong>Car Recived Date</strong> in the format DD/MM/YYYY.");

//        }
//    }

    // Event handlers for buttons
AsyncWidgets.WidgetScripts.frmCarServiceDetails.handleDateCalculation = function (monthsToAdd, t) {
    var currentDateValue = $('[argumentid="CarRecivedDate"]', t.el).val();

    // Convert input date from YYYY-MM-DD format
    let currentDate = new Date(currentDateValue);

    if (!isNaN(currentDate.getTime())) { // Ensure it's a valid date
        // Add specified months
        currentDate.setMonth(currentDate.getMonth() + monthsToAdd);

        // Adjust if the new date falls on a Friday (set to Saturday)
        if (currentDate.getDay() === 5) { // 5 = Friday
            currentDate.setDate(currentDate.getDate() + 1);
        }

        // Format date properly for input[type="date"]
        let nextServiceDate = currentDate.toISOString().split('T')[0];

        // Set the value correctly in the date input field
        $('[argumentid="NextServiceDate"]', t.el).val(nextServiceDate);

        // Fetch formatted date for day calculation
        var a = $('[argumentid="NextServiceDate"]', t.el).val();
        var dow = AsyncWidgets.WidgetScripts.frmCarServiceDetails.CalculateDayOfWeekCsDate(a);

        setField('NextServiceStartDay', dow, t.el);

    } else {
        $.showMessage("Please first select a valid <strong>Car Recived Date</strong> in the format YYYY-MM-DD.");
    }
};

AsyncWidgets.WidgetScripts.frmCarServiceDetails.validateAndParseDate = function (dateString) {
        // Split the date string into day, month, and year
        var parts = dateString.split('-');
        if (parts.length !== 3) {
            return null; // Invalid format
        }

        var day = parseInt(parts[0], 10);
        var month = parseInt(parts[1], 10) - 1; // Months are 0-based in JavaScript
        var year = parseInt(parts[2], 10);

        // Create a new Date object
        var date = new Date(year, month, day);

        // Check if the date is valid
        if (date.getFullYear() === year && date.getMonth() === month && date.getDate() === day) {
            return date; // Valid date
        }

        return null; // Invalid date
}


//AsyncWidgets.WidgetScripts.frmCarServiceDetails.showItemsList = function (res, t) {



//    if (res.status == 'OK') {
//        if (res.Response.Rows.length > 0) {
//            var rows = res.Response.Rows;
//            //var tblUFL = $('table.CustomerModifyList', t.el);
//            //$('.ItemTR', tblUFL).show();
//            //$('.NoRecordsTR', tblUFL).hide();


//            var tblUFL = $('table.ItemsModifyListt', t.el);
//            $('table.ItemsModifyListt tfoot tr').hide();
//            $('table.ItemsModifyListt tbody tr').show();

//            /*invoiceno,warrantytype*/

//            var tblRowsHTML = "";

//            var serialMap = {};  // To store the serial number for each unique InvRecCode
//            var serialCounter = 1;  // Starting serial number

//            for (var i = 0; i < rows.length; i++) {

//                var row = rows[i];
//                var InvRecCode = row.InvRecCode;
//                var ItemId = row.ItemId;
//                var PurchasingFrom = row.PurchasingFrom;
//                var SelectQuantity = row.SelectQuantity;
//                var SparePartName = row.SparePartName;
//                var SparePartUnitPrice = row.SparePartUnitPrice;
//                var TotalPrice = row.TotalPrice;
//                var SparePartSerialNo = row.SparePartSerialNo;
//                var PurchasingFrom = row.PurchasingFrom;
//                var InvoiceType = row.InvoiceType;


//                // Check if this InvRecCode already exists in the serialMap
//                if (serialMap[InvRecCode]) {
//                    serialCounter = serialMap[InvRecCode];  // Use the existing serial number
//                } else {
//                    serialCounter = 1;  // Start a new serial count for this InvRecCode
//                }

//                var genHtml = `



//                            <tr class='TableTr'>
//                            <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${serialCounter}</td>
//                            <td class="ColTemplate w-grid-cell-border colIndex-4 ChangeColor" style="padding: 5px; background: white; color: black;">${InvRecCode}</td>
//                         <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${InvoiceType}</td>
//                              <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${ItemId}</td>
//                              <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;"> ${SparePartSerialNo}</td>
//                              <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${SparePartName}</td>
//                              <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${PurchasingFrom}</td>
//                              <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;"> ${SelectQuantity}</td>
//                             <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;"> ${SparePartUnitPrice.toFixed(3)}</td>
//                              <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${TotalPrice.toFixed(3)}</td>
//                            </tr>

//                                                `;

//                tblRowsHTML += genHtml;



//            }  // for loop;



//            $('tbody ', tblUFL).html(tblRowsHTML);
//            serialMap[InvRecCode] = serialCounter + 1;
//        } else {
//            //var tblUFL = $('table.CustomerModifyListt', t.el);
//            //$('tbody', tblUFL).hide();
//            ///* $('.NoRecordsTR', tblUFL).show();*/
//            //$('table.CustomerModifyListt tfoot tr').show();

//            $('table.ItemsModifyListt tfoot tr').show();
//            $('table.ItemsModifyListt tbody tr').hide();
//        }
//    } //  if (res.status == 'OK')

//};

AsyncWidgets.WidgetScripts.frmCarServiceDetails.showItemsList = function (res, t) {
    if (res.status == 'OK')
    {debugger
        if (res.Response.Rows.length > 0)
        {
            var rows = res.Response.Rows;
            var tblUFL = $('table.ItemsModifyListt', t.el);
            $('table.ItemsModifyListt tfoot tr').hide();
            $('table.ItemsModifyListt tbody tr').show();

            var tblRowsHTML = "";
            var serialMap = {};  // To store the serial number for each unique InvRecCode
            var serialCounter = 1;  // Starting serial number

            var totalSubTotal = 0;
            var totalDiscount = 0;
            var totalGrandTotal = 0;
            var totalTotalPrice = 0

            // Create a Set to track unique InvRecCode
            var uniqueInvRecCodes = new Set();

            for (var i = 0; i < rows.length; i++) {
                
                var row = rows[i];
                var InvRecCode = row.InvRecCode;
                var ItemId = row.ItemId;
                var PurchasingFrom = row.PurchasingFrom;
                var SelectQuantity = row.SelectQuantity;
                var SparePartName = row.SparePartName;
                var SparePartUnitPrice = row.SparePartUnitPrice;
                var TotalPrice = row.TotalPrice;
                var SparePartSerialNo = row.SparePartSerialNo;
                var InvoiceType = row.InvoiceType;

                var SubTotal = row.SubTotal;
                var Discount = row.Discount;
                var GrandTotal = row.GrandTotal;

                // Add to accumulators

                /* Check if the InvRecCode is already in the Set*/
                if (!uniqueInvRecCodes.has(InvRecCode)) {
                    // If InvRecCode is unique, add its values to the sums
                    totalSubTotal += SubTotal;
                    totalDiscount += Discount;
                    totalGrandTotal += GrandTotal;

                    // Add the InvRecCode to the Set to track it as counted
                    uniqueInvRecCodes.add(InvRecCode);
                }
                totalTotalPrice += TotalPrice
                // Check if the InvRecCode already exists in serialMap
                if (serialMap[InvRecCode]) {
                    // If InvRecCode exists, use the existing serial number
                    var serialNumber = serialMap[InvRecCode];
                } else {
                    // If InvRecCode is new, assign the current serial number and increment for the next one
                    var serialNumber = serialCounter;
                    serialMap[InvRecCode] = serialNumber;
                    serialCounter++;
                }

                var genHtml =
                `
                    <tr class='TableTr'>
                        <!-- Serial Number Column -->
                        <td class="ColTemplate w-grid-cell-border colIndex-1" style="padding: 5px; background: white; color: black;text-align: center;">${serialNumber}</td>
                        
                        <!-- Other Columns -->
                        <td class="ColTemplate w-grid-cell-border colIndex-4 ChangeColor" style="padding: 5px; background: white; color: black;">${InvRecCode}</td>
                        <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${InvoiceType}</td>
                        <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${ItemId}</td>
                        <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${SparePartSerialNo}</td>
                        <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${SparePartName}</td>
                        <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${PurchasingFrom}</td>
                        <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${SelectQuantity}</td>
                        <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${SparePartUnitPrice.toFixed(3)}</td>
                        <td class="ColTemplate w-grid-cell-border colIndex-4" style="padding: 5px; background: white; color: black;">${TotalPrice.toFixed(3)}</td>
                    </tr>
                ` ;

                tblRowsHTML += genHtml;

               
            }

            $('tbody', tblUFL).html(tblRowsHTML);
            var zero = 0;
            //console.log("Total SubTotal:", totalSubTotal.toFixed(3));
            //console.log("Total Discount:", totalDiscount.toFixed(3));
            //console.log("Total GrandTotal:", totalGrandTotal.toFixed(3));
            //console.log("Total Price:", totalTotalPrice.toFixed(3));

            // Setting the text in the elements and converting to numbers
            var totalTotalPriceRes = parseFloat($('[argumentid="totalTotalPrice"]', t.el).val(totalTotalPrice.toFixed(3)).css('color', 'green')) || zero;
            var totalDiscountRes = parseFloat($('[argumentid="totalDiscount"]', t.el).val(totalDiscount.toFixed(3)).css('color', 'green')) || zero;

            // Calculating the result
            var Result = totalTotalPrice - totalDiscount;

            // Displaying the result
            $('[argumentid="totalGrandTotalRes"]', t.el).val(Result.toFixed(3)).css('color','green') || zero.toFixed(3);
        } else {
            var zero = 0;
            $('table.ItemsModifyListt tfoot tr').show();
            $('table.ItemsModifyListt tbody tr').hide();
            $('[argumentid="totalTotalPrice"]', t.el).val(zero.toFixed(3)).css('color', 'red');
            $('[argumentid="totalDiscount"]', t.el).val(zero.toFixed(3)).css('color', 'red');
            $('[argumentid="totalGrandTotalRes"]', t.el).val(zero.toFixed(3)).css('color', 'red');
        }
    }
};



AsyncWidgets.WidgetScripts.frmCarServiceDetails.ChangeColor = function (t) {

    const colors = ["maroon", "darkblue"]; // Alternate between red and blue
    let colorMap = {}; // Store assigned color for each unique text
    let colorIndex = 0; // Start with the first color

    $('.ChangeColor').each(function () {
        let text = $(this).text().trim(); // Get text of the item

        // Check if this number already has a color assigned
        if (!colorMap[text]) {
            colorMap[text] = colors[colorIndex % 2]; // Assign a color
            colorIndex++; // Alternate to the next color for next unique text
        }

        $(this).css("color", colorMap[text]); // Apply the assigned color
    });

    //const colors = ["red", "blue"]; // Alternate colors
    //let colorMap = {}; // Store color status for each unique text

    //$('.ChangeColor').each(function () {
    //    let text = $(this).text().trim(); // Get text of the item

    //    // Check if this number already has a color assigned
    //    if (!colorMap[text]) {
    //        colorMap[text] = 0; // Start with the first color (red)
    //    }

    //    $(this).css("color", colors[colorMap[text] % 2]); // Apply color

    //    // Toggle color for the next occurrence of the same text
    //    colorMap[text] = (colorMap[text] + 1) % 2;
    //});

    //const colors = ["#FF5733", "#33FF57", "#3357FF", "#FF33A1", "#FF8F33"]; // Color list
    //let colorMap = {}; // Object to store number-color mapping
    //let colorIndex = 0;

    //    $('.ChangeColor').each(function () {
    //    let text = $(this).text().trim(); // Get text of the item

    //    // Check if this number already has a color assigned
    //    if (!colorMap[text]) {
    //        colorMap[text] = colors[colorIndex % colors.length]; // Assign a color
    //        colorIndex++; // Move to the next color
    //    }

    //    $(this).css("color", colorMap[text]); // Apply color to the item
    //});

};

AsyncWidgets.WidgetScripts.frmCarServiceDetails.SetDynamicallySerielNo = function (t) {
    var serialMap = {};  // To store the serial number for each unique InvRecCode
    var serialCounter = 1;  // Starting serial number

    $('tr').each(function () {
        var invRecCode = $(this).find('td:nth-child(2)').text().trim();  // Get InvRecCode from the second column

        if (invRecCode) {
            // Check if this InvRecCode already exists in the serialMap
            if (serialMap[invRecCode]) {
                serialCounter = serialMap[invRecCode];  // Use the existing serial number
            } else {
                serialCounter = 1;  // Start a new serial count for this InvRecCode
            }

            // Assign the serial number to the first column (serialNo)
            $(this).find('td:nth-child(1)').text(serialCounter);

            // Increment the serial counter for this InvRecCode
            serialMap[invRecCode] = serialCounter + 1;
        }
    });


};
















