<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testpage.aspx.cs" Inherits="WebProject.testpage" %>
<%@ Register Assembly="EO.Web" Namespace="EO.Web" TagPrefix="eo" %>
<%@ Register Src="~/AsyncWidgets/Widgets/HelloWorldWidget.ascx" TagPrefix="uc1" TagName="HelloWorldWidget" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <script>
        Widgets = [];
    </script>
    <uc1:HelloWorldWidget runat="server" id="hwFirst"
       YourName="Ammar" />

    <uc1:HelloWorldWidget runat="server" id="hwSecond"
       YourName="Qasim" />
</body>
</html>
