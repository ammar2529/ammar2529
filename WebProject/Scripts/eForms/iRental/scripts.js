$(document).ready(function ()
{
    var guid = generateGuid();
    $('#FileGuid').val(guid);
    $("#upload-button").click(function ()
    {
        var fileInput = $("#file-input")[0];
        var files = fileInput.files;

        if (files.length === 0)
        {
            $("#message").html("Please select a file.");
            return;
        }


        var formData = new FormData();
        for (var i = 0; i < files.length; i++)
        {   1
            formData.append("file" + i, files[i]);
        }

        formData.append("FileGuid", $('#FileGuid').val());

        $.ajax({
            type: "POST",
            url: "UploadFile/UploadFile", // Replace with your server-side handler URL
            data: formData,
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
                        $("#progress-bar").width(percentComplete + "%");
                    }
                }, false);
                return xhr;
            },
            success: function (response)
            {
                $("#message").html("File(s) uploaded successfully.");
            },
            error: function (error)
            {
                $("#message").html("Error uploading file(s): " + error.statusText);
            }
        });
    });

    // Remove a file from the list
    $(document).on("click", ".remove-file", function ()
    {
        $(this).closest(".file-item").remove();
    });

    // Handle file selection and display in the list
    $("#file-input").change(function ()
    {
        var fileList = $("#file-list");
        fileList.empty();

        var files = this.files;
        for (var i = 0; i < files.length; i++)
        {
            var fileItem = $("<div class='file-item'></div>");
            var fileName = $("<div class='file-name'></div>").text(files[i].name);
            var removeButton = $("<div class='remove-file'>X</div>");

            fileItem.append(fileName);
            fileItem.append(removeButton);
            fileList.append(fileItem);
        }
    });
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