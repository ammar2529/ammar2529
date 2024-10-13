/// <reference path="../../../jquery/common.js" />


AsyncWidgets.WidgetScripts.frmSparePartInventory = function (obj) 
{
    var t = obj;

    AsyncWidgets.WidgetScripts.frmSparePartInventory.t = t;

    $('[argumentid="ItemId" ]', t.el).on('blur', function () {

        var ItemId = $(this).val();


        var params = {
            Command: 'SEL_iRental_SparePartInventory',
            ItemId: `${ItemId}`,
            DBAction: 'SearchItemID'
        };

        // Assuming ServerCall is a function to make an API call
        ServerCall(params, function (res) {
            var res = decJSON(res);
           

            if (res.status === 'OK') {
                var rows = res.Response.Rows || [];

                if (rows.length > 0) {
                    var row = rows[0]; // Assuming only the first row is needed

                    t.setParams({ params: rows[0], isRow: true });

                    $('[argumentid="SparePartName"]', t.el).attr('disabled', 'disabled');
                    $('[argumentid="SparePartName"]', t.el).addClass('ElemDisabled');

                    $('[argumentid="SparePartSerialNo" ]', t.el).attr('disabled', 'disabled');
                    $('[argumentid="SparePartSerialNo" ]', t.el).addClass('ElemDisabled');

                    setTimeout(function () {

                        $('[argumentid="BrandId" ]', t.el).attr('disabled', 'disabled');
                        $('[argumentid="BrandId" ]', t.el).addClass('ElemDisabled');

                        $('[argumentid="ModelId" ]', t.el).attr('disabled', 'disabled');
                        $('[argumentid="ModelId" ]', t.el).addClass('ElemDisabled');
                    }, 1000)
                    
                    //setTimeout(function () {
                    //    $('[argumentid="ModelId" ]', t.el).val(ModelId);
                    //    $('[argumentid="ModelId" ]', t.el).attr('disabled', 'disabled');

                    /*var fields = ['SparePartName', 'SparePartSerialNo', 'BrandId','ModelId'];*/
                   
                    // Set values for text fields
                    //fields.forEach(function (field)
                    //{
                    //    debugger
                    //    var value = row[field];
                    //    /*setField($('[argumentid="' + field + '"]', value, t.el));*/

                    //    t.setParams({ params: value, isRow: true });

                    //    //$('[argumentid="' + field + '"]', t.el).val(value)
                    //    //.attr('disabled', 'disabled')
                    //    //    .addClass('ElemDisabled');
                      
                    //});

                   

                    $('.GenerateItemIDBtn', t.el).hide();
                } else {
                 

                    $('[argumentid="SparePartName"]', t.el).removeAttr('disabled');
                    $('[argumentid="SparePartName"]', t.el).removeClass('ElemDisabled');

                    $('[argumentid="SparePartSerialNo" ]', t.el).removeAttr('disabled');
                    $('[argumentid="SparePartSerialNo" ]', t.el).removeClass('ElemDisabled');

                    $('[argumentid="BrandId" ]', t.el).removeAttr('disabled');
                    $('[argumentid="BrandId" ]', t.el).removeClass('ElemDisabled');

                    $('[argumentid="ModelId" ]', t.el).removeAttr('disabled');
                    $('[argumentid="ModelId" ]', t.el).removeClass('ElemDisabled');

                    $('[argumentid="SparePartName" ]', t.el).val('');
                    $('[argumentid="SparePartSerialNo" ]', t.el).val('');
                    $('[argumentid="BrandId" ]', t.el).val('');
                     $('[argumentid="ModelId" ]', t.el).val('');



                    if ($('[argumentid="ItemId"]', t.el).val() === '')
                    {
                        $('.GenerateItemIDBtn', t.el).show();

                    }
                }
            }
        }, 'GetData');



    });
    t.on('afterDataAction', function (params) {
        // This will pause execution for debugging if the developer tools are open
        if (params.res.status === 'OK') {

            

            var myMessage = "Generate New ItemID Successfully";
            var trimMyMessage = myMessage.trim();
            var parts = params.res.Response.split('||');
            var code = parts[0];
            var messageStatus = parts[1];
            var message = parts[2];
          

            if (message !== undefined) {
                var trimMessage = message.trim();
                // Further processing with trimMessage
            }



            if (trimMessage.toLowerCase() === trimMyMessage.toLowerCase()) {

                $('[argumentid="ItemId"]', t.el).val(code);
                $('.GenerateItemIDBtn', t.el).hide();
           
            } else {
                console.log("Line of item");
            }
        } else {
            console.error("Unexpected status:", params.res.status);
        }


    });

    $('[argumentid="SparePartUnitPrice"], [argumentid="SparePartCostPrice"]', t.el).on('blur', function ()
    {
        var price = parseFloat($(this).val()) || 0; // Ensure the price is a number
        $(this).val(price.toFixed(3)); // Only update the field that triggered the event
    });

   
   

    $('.delete-button').on('click', function () {
        /*var FileGuid = $('[argumentid="FileGuid"]', t.el);*/
       
        var params = {
            Command: 'FX_UPD_SparePartImageUpload',
            FileGuid: val('FileGuid', t.el),
            DBAction: 'DeleteFile'


        };

        // Assuming ServerCall is a function to make an API call
        ServerCall(params, function (res) {

            var res = decJSON(res)


            if (res.status === 'OK')
            {
                $('.thumbnail').attr('src', '../../../App_Themes/Blue/images/default_image.png');
                $('[argumentid="SparePartImage"]', t.el).val('');
                $('[argumentid="SparePartImage"],.upload-button', t.el).prop('disabled', false).removeClass('ElemDisabled').show();
                $('.delete-button', t.el).hide();
                $('.thumbnail', t.el).hide();
                $.showMessage('Image delete successfully.');
            }

            
        });

      
    })

    t.on('show', function (args)
    {
       


        $('[argumentid = "SparePartName"],[argumentid = "SparePartQuantity"],[argumentid = "SparePartUnitPrice"],[argumentid="SparePartImage"],.upload-button', t.el).prop('disabled', false).removeClass('ElemDisabled').show();
        $('.delete-button', t.el).hide();
        $('.thumbnail').attr('src', '../../../App_Themes/Blue/images/default_image.png').hide();
        $('[argumentid="SparePartImage"]').val('');
        $('.GenerateItemIDBtn', t.el).show();

     
        var unitPrice = parseFloat($('[argumentid="SparePartUnitPrice"]', t.el).val()) || 0;
        $('[argumentid="SparePartUnitPrice"]', t.el).val(unitPrice.toFixed(3));

        var costPrice = parseFloat($('[argumentid="SparePartCostPrice"]', t.el).val()) || 0;
        $('[argumentid="SparePartCostPrice"]', t.el).val(costPrice.toFixed(3));

        $('[argumentid="SparePartName"]', t.el).removeAttr('disabled');
        $('[argumentid="SparePartName"]', t.el).removeClass('ElemDisabled');

        $('[argumentid="SparePartSerialNo" ]', t.el).removeAttr('disabled');
        $('[argumentid="SparePartSerialNo" ]', t.el).removeClass('ElemDisabled');

        $('[argumentid="BrandId" ]', t.el).removeAttr('disabled');
        $('[argumentid="BrandId" ]', t.el).removeClass('ElemDisabled');

        $('[argumentid="ModelId" ]', t.el).removeAttr('disabled');
        $('[argumentid="ModelId" ]', t.el).removeClass('ElemDisabled');
    });
 

    $('.file-input', t.el).change(function ()
    {
        
        AsyncWidgets.WidgetScripts.frmSparePartInventory.showImageThumbnail(this,t);
    });


    AsyncWidgets.WidgetScripts.frmSparePartInventory.BindUploadImageHandlers(t);




};//end of AsyncWidgets.WidgetScripts.frmSparePartInventory = function (obj)

//show image on form,
//AsyncWidgets.WidgetScripts.frmSparePartInventory.showImageThumbnail = function (fileInput, t)
//{

//    debugger
//    $('.thumbnail', t.el).show();
//    //var file = fileInput.file[ 0 ];
//    $('.thumbnail', t.el).css('border', '1px solid green');
//    var file = fileInput.files ? fileInput.files[ 0 ] : fileInput[ 0 ].files[ 0 ];

//    var reader = new FileReader();
//    reader.onload = function (e)
//    {
//        $('.thumbnail', t.el).attr('src', e.target.result);
       
//    };
//    reader.readAsDataURL(file);
   

//};///end
AsyncWidgets.WidgetScripts.frmSparePartInventory.showImageThumbnail = function (fileInput, t)
{
    debugger;
    $('.thumbnail', t.el).show();
    $('.thumbnail', t.el).css('border', '1px solid green');

    var file = fileInput.files ? fileInput.files[ 0 ] : fileInput[ 0 ].files[ 0 ];

    if (file)
    {
        var reader = new FileReader();
        reader.onload = function (e)
        {
            $('.thumbnail', t.el).attr('src', e.target.result);
        };
        reader.readAsDataURL(file);
    } else
    {
        console.error("No file selected or file input is incorrect.");
    }
};


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
                    var msg = (`Image uploaded successfully.`);
                    $('[argumentid="SparePartImage"],.upload-button', t.el).prop('disabled', true).addClass('ElemDisabled').hide();
                    $('.delete-button', t.el).show();
                    $('[argumentid="SparePartImage"]', t.el).val('');


                }
                debugger
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


        var unitPrice = parseFloat($('[argumentid="SparePartUnitPrice"]', t.el).val()) || 0;
        $('[argumentid="SparePartUnitPrice"]', t.el).val(unitPrice.toFixed(3));

        var costPrice = parseFloat($('[argumentid="SparePartCostPrice"]', t.el).val()) || 0;
        $('[argumentid="SparePartCostPrice"]', t.el).val(costPrice.toFixed(3));
        $('.GenerateItemIDBtn', t.el).hide();

    });
};


AsyncWidgets.WidgetScripts.frmSparePartInventory.GenerateUploadImageFiles = function (res, t)
{
    /*var baseFolderPath = "../../../UploadSparePartImage/";*/
    var baseFolderPath = "/UploadSparePartImage/";


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

                /*var newFileName = folderPath + `${recId}_${fileGuid}_${fileName}`;*/
               /* .split('.')[ 0 ]*/
                 var folderName = `${recId}_${fileGuid}_${fileName}`;
                var fullFileName = `${recId}_${fileGuid}_${fileName}`;
                var filePath = `${baseFolderPath}${folderName}/${fullFileName}`;

                if (!!fullFileName) {
                    /* thumbnail.src = URL.createObjectURL(filePath);*/

                    $('.thumbnail', t.el).attr('src', filePath);
                    $('[argumentid="SparePartImage"],.upload-button', t.el).prop('disabled', true).addClass('ElemDisabled').hide();
                    $('.delete-button', t.el).show();
                    $('.thumbnail', t.el).show();
                }
                else {
                    $('[argumentid="SparePartImage"],.upload-button', t.el).prop('disabled', false).removeClass('ElemDisabled').show();
                    $('.delete-button', t.el).hide();
                    $('.thumbnail', t.el).hide();
                }

                //console.log("Full File Path:", filePath);
                //var imgElement = $('img.thumbnail').eq(i);

                //// Check if the <img> element exists
                //if (imgElement.length > 0)
                //{
                //    // Set the src attribute of the <img> element
                //    imgElement.attr('src', filePath);
                //} else
                //{
                //    console.error("Image element not found.");
                //}


            }
        }
    }
};