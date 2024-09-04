﻿AsyncWidgets.WidgetScripts.frmCarServiceDetails = function (obj)
{
    var t = obj;

    AsyncWidgets.WidgetScripts.frmCarServiceDetails.t = t;

    AsyncWidgets.WidgetScripts.frmCarServiceDetails.BindUploadHandlers(t);

    $('.CarServiceButton_Edit', t.el).click(function ()
    {
        

        $('[argumentid="StateId"]', t.el).text('OpendState');
        $('[argumentid="StateName"]', t.el).text('Start State');

        $('.common-button,.CommonDisableClass', t.el).removeAttr('disabled', 'disabled');

        $('.common-button,.CommonDisableClass', t.el).removeClass('ElemDisabled');
        $('[argumentid="CarRecivedDate"]', t.el).next('img').show();
        $('[argumentid="CarToBeDeliverdDate"]', t.el).next('img').show();
        $('[argumentid="CarDeliverdDate"]', t.el).next('img').show();

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
       /* $('[argumentid="LastCarServiceDate"]', t.el).text(dt.getDate() + '/' + (dt.getMonth() + 1) + '/' + dt.getFullYear());*/
        if (t.FormMode == 'new')
        {

            $('.grgbtnSave2', t.el).hide();
            $('.grgbtnSave', t.el).show();

            if ($('[argumentid="StateId"]', t.el).text() == '')
            {

                $('[argumentid="StateId"]', t.el).text('OpenState');
                $('[argumentid="StateName"]', t.el).text('Start State');

                $('.common-button,.CommonDisableClass, .Problem, .ActionTaken, .CarCondition', t.el).removeAttr('disabled', 'disabled');

                $('.common-button,.CommonDisableClass, .Problem, .ActionTaken, .CarCondition', t.el).removeClass('ElemDisabled');
                $('[argumentid="CarRecivedDate"]', t.el).next('img').show();
                $('[argumentid="CarToBeDeliverdDate"]', t.el).next('img').show();
                $('[argumentid="CarDeliverdDate"]', t.el).next('img').show();
                $('.StatusTR', t.el).hide();

                $('[argumentid="CarRecivedDate"]', t.el).removeAttr('disabled', 'disabled');
                $('[argumentid="CarNumber"]', t.el).removeAttr('disabled', 'disabled');

                $('[argumentid="CarRecivedDate"]', t.el).removeClass('ElemDisabled');
                $('[argumentid="CarNumber"]', t.el).removeAttr('ElemDisabled');
                $('[argumentid="CarRecivedDate"]', t.el).next('img').show();
              

            }
        }
     
    });

    //On Change of Payment Mode  $('option:selected', elem)

    t.on('onLoadedValues', function (res)
    {
      

        if (res.res.status === 'OK')
        {
            if (res.res.Response.Rows.length > 0)
            {
                var rows = res.res.Response.Rows;
               
                //for (var row of rows)
                //{
                //    var keys = Object.keys(row);
                //    console.log(keys);
                //    $()
                //}

                //for (var i = 0; i < rows.length; i++)
                //{
                //    var row = rows[ i ];

                //    var RecId = row.RecId;
                //    var CarRecivedDate = row.CarRecivedDate;
                //    var LastServiceKM = row.LastServiceKM;
                //}

                //if (!!CarRecivedDate || !!LastServiceKm)
                //{
                //    $('[argumentid="LastCarServiceDate"]', t.el).text(CarRecivedDate);
                //    $('[argumentid="LastServiceKm"]', t.el).text(LastServiceKM);
                //} else
                //{
                //    $('[argumentid="LastCarServiceDate"]', t.el).text('');
                //    $('[argumentid="LastServiceKm"]', t.el).text('');
                //}
            }

        }


        if (t.FormMode == 'update')
        {
            

            $('.grgbtnSave2', t.el).show();
            $('.grgbtnSave', t.el).hide();
            $('.StatusTR', t.el).show();

            if ($('[argumentid="StateId"]', t.el).text() == 'ClosedState')
            {


                $('.common-button,.CommonDisableClass', t.el).attr('disabled', 'disabled');


                $(',.Problem, .ActionTaken, .CarCondition', t.el).removeAttr('disabled', 'disabled');
                $('.Problem, .ActionTaken, .CarCondition', t.el).removeClass('ElemDisabled');

                $('.common-button,.CommonDisableClass', t.el).attr('disabled', 'disabled');
                $('.common-button,.CommonDisableClass', t.el).addClass('ElemDisabled');
                $('[argumentid="CarRecivedDate"]', t.el).next('img').hide();
                $('[argumentid="CarToBeDeliverdDate"]', t.el).next('img').hide();
                $('[argumentid="CarDeliverdDate"]', t.el).next('img').hide();
                $('[argumentid="CarRecivedDate"]', t.el).next('img').hide();

            }

            if ($('[argumentid="StateId"]', t.el).text() == 'OpenState')
            {
                
                $('.common-button,.CommonDisableClass,.Problem, .ActionTaken, .CarCondition', t.el).removeAttr('disabled', 'disabled');
                $('.common-button,.CommonDisableClass,.Problem, .ActionTaken, .CarCondition', t.el).removeClass('ElemDisabled');
                $('[argumentid="CarRecivedDate"]', t.el).next('img').show();
                $('[argumentid="CarToBeDeliverdDate"]', t.el).next('img').show();
                $('[argumentid="CarDeliverdDate"]', t.el).next('img').show();

                $('[argumentid="CarRecivedDate"]', t.el).attr('disabled', 'disabled');
                $('[argumentid="CarNumber"]', t.el).attr('disabled', 'disabled');

                $('[argumentid="CarRecivedDate"]', t.el).addClass('ElemDisabled');
                $('[argumentid="CarNumber"]', t.el).addClass('ElemDisabled');

                $('[argumentid="CarRecivedDate"]', t.el).next('img').hide();

            }

            if ($('[argumentid="StateId"]', t.el).text() == 'CanceledState') {


                $('.common-button,.CommonDisableClass, .Problem, .ActionTaken, .CarCondition', t.el).attr('disabled', 'disabled');

                $('.common-button,.CommonDisableClass', t.el).attr('disabled', 'disabled');
                $('.common-button,.CommonDisableClass, .Problem, .ActionTaken, .CarCondition', t.el).addClass('ElemDisabled');
                $('[argumentid="CarRecivedDate"]', t.el).next('img').hide();
                $('[argumentid="CarToBeDeliverdDate"]', t.el).next('img').hide();
                $('[argumentid="CarDeliverdDate"]', t.el).next('img').hide();
                $('[argumentid="CarRecivedDate"]', t.el).next('img').hide();

                //$('[argumentid="StateName"]',t.el).filter(function () {
                //    return $(this).text().trim() === 'Canceled';
                //}).css('color', 'red');


            }
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
            url: "UploadFile/UploadFiles", // Replace with your server-side handler URL
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




    t.on('onLoadedValues', function (p) {

        console.log(p);
        var params = { Command: 'FX_UPD_FileUpload', FileGuid: val('FileGuid', t.el), DBAction: 'GetUploadedFiles' };

        SInfo = getForm(null, null, params);
        var inv = new AsyncWidgets.RAInvoker();
        inv.on('onSuccess', function (res) {
            var res = decJSON(res);
            AsyncWidgets.WidgetScripts.frmCarServiceDetails.GenerateUploadFiles(res, t);
            $(t.el).unmask();
        });
        inv.invokeRA({ params: ["ActorId", "DataHelper", "ActionId", "GetData", "ServiceInfo", SInfo] });

    });
};

AsyncWidgets.WidgetScripts.frmCarServiceDetails.GenerateUploadFiles = function (res, t) {
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
        }
    } //  if (res.status == 'OK')

};
AsyncWidgets.WidgetScripts.frmCarServiceDetails.DeleteUploadFile = function (t, recId, fileName) {

    var params = { Command: 'FX_UPD_FileUpload', RecId: recId, DBAction: 'DeleteFile' };
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