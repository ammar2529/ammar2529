<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test2.aspx.cs" Inherits="WebProject.test2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>File Upload Example</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <script type="text/javascript"  >

        $(document).ready(function ()
        {

            console.log('Document ready');
            $('#uploadButton').click(function (e)
            {
                e.preventDefault();
                console.log('Button clicked');


                var input = $('#fileInput')[0];
                var file = input.files[0];
                var formData = new FormData();
                formData.append("file", file);
                formData.append();

                var formFields = [
                    { name: "inputField1", value: $('#inputField1').val() },
                    { name: "inputField2", value: $('#inputField2').val() }
                    // Add more form fields as needed
                ];

                for (var i = 0; i < formFields.length; i++)
                {
                    formData.append(formFields[i].name, formFields[i].value);
                }

                if (!file)
                {
                    $('#status').text('Please select a file.');
                    return; // Exit the function if no file is selected
                } else
                {
                    $('#status').text('File upload successfully.');
                }

                $.ajax({
                    url: 'test2.aspx/UploadFile',
                    type: 'POST',
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function (data)
                    {
                        console.log('Success response:', data);

                        $('#status').text(data.d);
                    },
                    error: function (xhr, status, error)
                    {
                        console.log('Error:', error);

                        $('#status').text('Error: ' + error);
                    }

                });
            });
            $("#test").html("<h1>hello there~</h1>");
        });

    </script>
   
</head>
<body>
<form id="form1" runat="server">
    <div>
        <input type="file" id="fileInput" />
        <button id="uploadButton">Upload</button>
        <div id="status"></div>
    </div>
</form>

<%--<script type="text/javascript" src="scripts/scripts.js" ></script>--%>
<div id="test"></div>
</body>
</html>
