/// <reference path="../../../jquery/common.js" />


AsyncWidgets.WidgetScripts.frmSparePartInventory = function (obj) 
{
    var t = obj;

    AsyncWidgets.WidgetScripts.frmSparePartInventory.t = t;

    $('.delete-button').on('click', function ()
    {
        
        $.showMessage('The delete functionality is currently under development. Please check back later.')
    })

    t.on('show', function (args)
    {
       


        $('[argumentid = "SparePartName"],[argumentid = "SparePartQuantity"],[argumentid = "SparePartUnitPrice"]', t.el).prop('disabled', false).removeClass('ElemDisabled');
      
        $('.thumbnail').attr('src', '../../../App_Themes/Blue/images/default_image.png');
        $('[argumentid="SparePartImage"]').val('');

    });
 

    $('.file-input', t.el).change(function ()
    {
        
        AsyncWidgets.WidgetScripts.frmSparePartInventory.showImageThumbnail(this,t);
    });


    AsyncWidgets.WidgetScripts.frmSparePartInventory.BindUploadImageHandlers(t);




};//end of AsyncWidgets.WidgetScripts.frmSparePartInventory = function (obj)

//show image on form,
AsyncWidgets.WidgetScripts.frmSparePartInventory.showImageThumbnail = function (fileInput, t)
{
    //var file = fileInput.file[ 0 ];
    $('.thumbnail', t.el).css('border', '1px solid green');
    var file = fileInput.files ? fileInput.files[ 0 ] : fileInput[ 0 ].files[ 0 ];

    var reader = new FileReader();
    reader.onload = function (e)
    {
        $('.thumbnail', t.el).attr('src', e.target.result);
    };
    reader.readAsDataURL(file);

};///end


AsyncWidgets.WidgetScripts.frmSparePartInventory.BindUploadImageHandlers = function (t)
{
    $(".upload-button", t.el).click(function (e)
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
        var fileInput = $(".file-input", t.el)[ 0 ];
        var loggedUser = $('.LoggedUser').text()
        setField('UserName', loggedUser, t.el);
        var files = fileInput.files;
        
        if (files.length === 0)
        {
            //var errorMsg = $(".message", t.el).html("Please select a file.");
            $.showMessage("Please select a file.");
            return;
        }


        var formData = new FormData();
        for (var i = 0; i < files.length; i++)
        {

            formData.append("file" + i, files[ i ]);

        }

        formData.append("UserName", val('UserName', t.el));
        formData.append("FileGuid", val("FileGuid", t.el));
        if (isGUIDUpdateNeeded)
        {
            formData.append("SalesRecId", val("RecId"));
        }
      
        $.ajax({

            type: "POST",
            url: "UploadSparePartImages/UploadSparePartImage", // Replace with your server-side handler URL
            data: formData,
            dataType: 'text',
            processData: false,
            contentType: false,
           
            success: function (response)
            {
                objRes = JSON.parse(response)
                var rows = objRes.Response.Rows;
                for (var i = 0; i < rows.length; i++)
                {
                    var row = rows[ i ];
                    var fileName = row.FileName;
                    $('.thumbnail', t.el).css('border', '3px solid green');
                    var msg = (`File [${fileName}] uploaded successfully.`);
                    //$(".file-input", t.el).val('');


                }

                AsyncWidgets.WidgetScripts.frmSparePartInventory.GenerateUploadImageFiles(objRes, t);
                $.showMessage(msg);


                // $('.message', t.el).text(response);
            },
            error: function (error)
            {
                $(".message", t.el).html("Error uploading file(s): " + error.statusText);
            }
        }); //end of Ajax
    });



    //generate guid 
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
        var params = { Command: 'FX_UPD_SparePartImageUpload', FileGuid: val('FileGuid', t.el), DBAction: 'GetUploadedFiles' };

        SInfo = getForm(null, null, params);
        var inv = new AsyncWidgets.RAInvoker();
        inv.on('onSuccess', function (res)
        {
            var res = decJSON(res);
            AsyncWidgets.WidgetScripts.frmSparePartInventory.GenerateUploadImageFiles(res, t);
            $(t.el).unmask();
        });
        inv.invokeRA({ params: [ "ActorId", "DataHelper", "ActionId", "GetData", "ServiceInfo", SInfo ] });

    });
};


AsyncWidgets.WidgetScripts.frmSparePartInventory.GenerateUploadImageFiles = function (res, t)
{
    var folderPath = "../../../UploadSparePartImage/";

    if (res.status == 'OK')
    {
        if (res.Response.Rows.length > 0)
        {
            var rows = res.Response.Rows;
            for (var i = 0; i < rows.length; i++)
            {
                var row = rows[ i ];
                var recId = row.RecId;
                var fileGuid = row.FileGuid;
                var fileName = row.FileName;

                var newFileName = folderPath + `${recId}_${fileGuid}_${fileName}`;
                var imgElement = $('img.thumbnail').eq(i);

                // Check if the <img> element exists
                if (imgElement.length > 0)
                {
                    // Set the src attribute of the <img> element
                    imgElement.attr('src', newFileName);
                } else
                {
                    console.error("Image element not found.");
                }


            }
        }
    }
};