AsyncWidgets.WidgetScripts.frmCarServiceDetails = function (obj)
{
    var t = obj;

    AsyncWidgets.WidgetScripts.frmCarServiceDetails.t = t;

    AsyncWidgets.WidgetScripts.frmCarServiceDetails.BindUploadHandlers(t);


    var CalculateDayOfWeekCsDate = AsyncWidgets.WidgetScripts.frmCarServiceDetails.CalculateDayOfWeekCsDate;
    $('[argumentid="CarRecivedDate"]').on('blur', function ()
    {

        var cDate = new Date();
        var cH = cDate.getHours();
        var cM = cDate.getMinutes();

        cH = cH < 10 ? '0' + cH : cH;
        cM = cM < 10 ? '0' + cM : cM;

        $('[argumentid="ServiceStartTime"]', t.el).val(cH + ':' + cM);

        
        var csDate = val('CarRecivedDate', t.el);

        var dow = CalculateDayOfWeekCsDate(csDate);


        setField('ServiceStartDay', dow, t.el);



    });

    $('[argumentid="CarToBeDeliverdDate"]').on('blur', function ()
    {

        var cDate = new Date();
        var cH = cDate.getHours();
        var cM = cDate.getMinutes();

        cH = cH < 10 ? '0' + cH : cH;
        cM = cM < 10 ? '0' + cM : cM;

        $('[argumentid="CarToBeDeliverStartTime"]', t.el).val(cH + ':' + cM);


        var csDate = val('CarToBeDeliverdDate', t.el);

        var dow = CalculateDayOfWeekCsDate(csDate);


        setField('CarToBeDeliverStartDay', dow, t.el);



    });

    $('[argumentid="CarDeliverdDate"]').on('blur', function ()
    {

        var cDate = new Date();
        var cH = cDate.getHours();
        var cM = cDate.getMinutes();

        cH = cH < 10 ? '0' + cH : cH;
        cM = cM < 10 ? '0' + cM : cM;

        $('[argumentid="CarDeliverdStartTime"]', t.el).val(cH + ':' + cM);


        var csDate = val('CarDeliverdDate', t.el);

        var dow = CalculateDayOfWeekCsDate(csDate);


        setField('CarDeliverdStartDay', dow, t.el);



    });

    $('[argumentid="NextServiceDate"]').on('blur', function ()
    {

        var cDate = new Date();
        var cH = cDate.getHours();
        var cM = cDate.getMinutes();

        cH = cH < 10 ? '0' + cH : cH;
        cM = cM < 10 ? '0' + cM : cM;

        $('[argumentid="NextServiceStartTime"]', t.el).val(cH + ':' + cM);


        var csDate = val('NextServiceDate', t.el);

        var dow = CalculateDayOfWeekCsDate(csDate);


        setField('NextServiceStartDay', dow, t.el);



    });

    $('.PrintJobCard', t.el).click(function ()
    { //
        var strlink = ROOT_PATH + "Pages/eForms/iRental/Reports/PrintCarServiceDetails.aspx?FormCode=" + $('[argumentid="RecCode"]', t.el).text(); // +'&amp;FormId=' + pm.SelectedKey;
        console.log(strlink);
        var width = 920;
        var height = 600;
        var left = parseInt((screen.availWidth / 2) - (width / 2)) - 15;
        var top = parseInt((screen.availHeight / 2) - (height / 2));
        window.open(strlink, '_blank', "'titlebar=no,resizable=1,scrollbars=yes,height=" + height + ",width=" + width + ",left=" + left + ",top=" + top + "screenX=" + left + ",screenY=" + top + "'");
        console.log('Click on Print Button');

        return false;
    });

    //$('.PrintJobCard', t.el).click(function ()
    //{
    //    $('#popupModal').fadeIn(); // Show the modal
    //});

    //// When the user clicks on the close button (x), close the modal
    //$('.close').click(function ()
    //{
    //    $('#popupModal').fadeOut(); // Hide the modal
    //});

    //// When the user clicks anywhere outside the modal, close it
    //$(window).click(function (event)
    //{
    //    if ($(event.target).is('#popupModal'))
    //    {
    //        $('#popupModal').fadeOut(); // Hide the modal
    //    }
    //});


    $('.CarServiceButton_Edit', t.el).click(function ()
    {
        //debugger;
        //if ($('[argumentid="StateId"]', t.el).text() == 'ClosedState')
        //{
        //    $('[argumentid="StateId"]', t.el).text('ClosedState');
        //} else if ($('[argumentid="StateId"]', t.el).text() == 'OpenState')
        //{
        //    $('[argumentid="StateId"]', t.el).text('OpenState');
        //}

        //else
        //{
        //    $('[argumentid="StateId"]', t.el).text('CanceledState');
        //}

        
        /*$('[argumentid="StateName"]', t.el).text('Open');*/

        $('.common-button,.CommonDisableClass, .Problem, .ActionTaken, .CarCondition,.PrintJobCard', t.el).removeAttr('disabled', 'disabled');

        $('.common-button,.CommonDisableClass, .Problem, .ActionTaken, .CarCondition,.PrintJobCard', t.el).removeClass('ElemDisabled');
        $('[argumentid="CarRecivedDate"]', t.el).next('img').show();
        $('[argumentid="CarToBeDeliverdDate"]', t.el).next('img').show();
        $('[argumentid="CarDeliverdDate"]', t.el).next('img').show();
        $('[argumentid="NextServiceDate"]', t.el).next('img').show();
       

        $('[argumentid="CarRecivedDate"]', t.el).removeAttr('disabled', 'disabled');
        $('[argumentid="CarNumber"]', t.el).attr('disabled', 'disabled');
       

        $('[argumentid="CarRecivedDate"]', t.el).removeClass('ElemDisabled');
        $('[argumentid="CarNumber"]', t.el).addClass('ElemDisabled');
        $('[argumentid="CarRecivedDate"]', t.el).next('img').show();


    });

 
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


    t.on('show', function (args)
    {
        var dt = new Date();
        $('[argumentid="CarRecivedDate"]', t.el).val(dt.getDate() + '/' + (dt.getMonth() + 1) + '/' + dt.getFullYear());
        $('[argumentid="CarToBeDeliverdDate"]', t.el).val(dt.getDate() + '/' + (dt.getMonth() + 1) + '/' + dt.getFullYear());
       
        var cH = dt.getHours();
        var cM = dt.getMinutes();

        cH = cH < 10 ? '0' + cH : cH;
        cM = cM < 10 ? '0' + cM : cM;

        var CalculateDayOfWeekCsDate = AsyncWidgets.WidgetScripts.frmCarServiceDetails.CalculateDayOfWeekCsDate;
       
        
            var csDate = val('CarRecivedDate', t.el);

            var dow = CalculateDayOfWeekCsDate(csDate);


            setField('ServiceStartDay', dow, t.el);


        var esDate = val('CarToBeDeliverdDate', t.el);

        var dowe = CalculateDayOfWeekCsDate(esDate);


        setField('CarToBeDeliverStartDay', dowe, t.el);
        

        $('[argumentid="ServiceStartTime"]', t.el).val(cH + ':' + cM);
        $('[argumentid="CarToBeDeliverStartTime"]', t.el).val(cH + ':' + cM);
      
        if (t.FormMode == 'new')
        {

            $('.grgbtnSave2', t.el).hide();
            $('.grgbtnSave', t.el).show();
            $('.OnNewForm', t.el).hide();

            var tblUFL = $('table.UploadFileListForJC', t.el);
            $('table.UploadFileListForJC .ItemTableRow', t.el).remove();
            $('.NoRecordsTR', tblUFL).show();
            if ($('[argumentid="StateId"]', t.el).text() == '')
            {

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
        }
     
    });

    //On Change of Payment Mode  $('option:selected', elem)

    t.on('onLoadedValues', function (res)
    {
      

    


        if (t.FormMode == 'update')
        {
            

            $('.grgbtnSave2', t.el).show();
            $('.grgbtnSave', t.el).hide();
            $('.StatusTR', t.el).show();
            $('.OnNewForm', t.el).show();

            if ($('[argumentid="StateId"]', t.el).text() == 'ClosedState')
            {


                $('.common-button,.CommonDisableClass', t.el).attr('disabled', 'disabled');


                //$(',.Problem, .ActionTaken, .CarCondition', t.el).removeAttr('disabled', 'disabled');
                //$('.Problem, .ActionTaken, .CarCondition', t.el).removeClass('ElemDisabled');

                $('.common-button,.CommonDisableClass,.PrintJobCard,.AlwaysDisableJC,.CarDeliverdStartTime,.NextServiceStartTime', t.el).attr('disabled', 'disabled');
                $('.common-button,.CommonDisableClass,.PrintJobCard,.AlwaysDisableJC,.CarDeliverdStartTime,.NextServiceStartTime', t.el).addClass('ElemDisabled');
                $('[argumentid="CarRecivedDate"]', t.el).next('img').hide();
                $('[argumentid="CarToBeDeliverdDate"]', t.el).next('img').hide();
                $('[argumentid="CarDeliverdDate"]', t.el).next('img').hide();
                $('[argumentid="CarRecivedDate"]', t.el).next('img').hide();
                $('[argumentid="NextServiceDate"]', t.el).next('img').hide();

            }

            if ($('[argumentid="StateId"]', t.el).text() == 'OpenState')
            {
                
                $('.common-button,.CommonDisableClass,.Problem, .ActionTaken, .CarCondition,.PrintJobCard,.CarDeliverdStartTime,.NextServiceStartTime', t.el).removeAttr('disabled', 'disabled');
                $('.common-button,.CommonDisableClass,.Problem, .ActionTaken, .CarCondition,.PrintJobCard,.CarDeliverdStartTime,.NextServiceStartTime', t.el).removeClass('ElemDisabled');
                $('[argumentid="CarRecivedDate"]', t.el).next('img').show();
                $('[argumentid="CarToBeDeliverdDate"]', t.el).next('img').show();
                $('[argumentid="CarDeliverdDate"]', t.el).next('img').show();
                $('[argumentid="NextServiceDate"]', t.el).next('img').show();

                $('[argumentid="CarRecivedDate"]', t.el).attr('disabled', 'disabled');
                $('[argumentid="CarNumber"],.grgbtnSave3,.AlwaysDisableJC', t.el).attr('disabled', 'disabled');

                $('[argumentid="CarRecivedDate"],.grgbtnSave3,.AlwaysDisableJC', t.el).addClass('ElemDisabled');
                $('[argumentid="CarNumber"]', t.el).addClass('ElemDisabled');

                $('[argumentid="CarRecivedDate"]', t.el).next('img').hide();

            }

            if ($('[argumentid="StateId"]', t.el).text() == 'CanceledState') {


                $('.common-button,.CommonDisableClass, .Problem, .ActionTaken, .CarCondition,.PrintJobCard,.AlwaysDisableJC,.CarDeliverdStartTime,.NextServiceStartTime', t.el).attr('disabled', 'disabled');

              
                $('.common-button,.CommonDisableClass, .Problem, .ActionTaken, .CarCondition,.PrintJobCard,.AlwaysDisableJC,.CarDeliverdStartTime,.NextServiceStartTime', t.el).addClass('ElemDisabled');
                $('[argumentid="CarRecivedDate"]', t.el).next('img').hide();
                $('[argumentid="CarToBeDeliverdDate"]', t.el).next('img').hide();
                $('[argumentid="CarDeliverdDate"]', t.el).next('img').hide();
                $('[argumentid="CarRecivedDate"]', t.el).next('img').hide();
                $('[argumentid="NextServiceDate"]', t.el).next('img').hide();

                //$('[argumentid="StateName"]',t.el).filter(function () {
                //    return $(this).text().trim() === 'Canceled';
                //}).css('color', 'red');


            }

            var params = { Command: 'FX_UPD_FileUploadForCarServiceDetails', FileGuid: val('FileGuid', t.el), DBAction: 'GetUploadedFiles' };

            SInfo = getForm(null, null, params);
            var inv = new AsyncWidgets.RAInvoker();
            inv.on('onSuccess', function (res)
            {
                var res = decJSON(res);
                AsyncWidgets.WidgetScripts.frmCarServiceDetails.GenerateUploadFiles(res, t);
                $(t.el).unmask();
            });
            inv.invokeRA({ params: [ "ActorId", "DataHelper", "ActionId", "GetData", "ServiceInfo", SInfo ] });
        }

      
    });

};



AsyncWidgets.WidgetScripts.frmCarServiceDetails.BindUploadHandlers = function (t) {


    $(".upload-button", t.el).click(function (e) {
        var isGUIDUpdateNeeded = false;
        debugger;
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
        debugger
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
            $('.remove-button', tblUFL).click(function () {
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
        else {
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