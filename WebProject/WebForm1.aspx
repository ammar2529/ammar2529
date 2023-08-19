<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebProject.WebForm1" %>

<%@ Register Src="~/AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="uc6" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="uc8" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="uc5" %>
<%--<%@ Register Src="~/Pages/eForms/iRental/Modules/SaleContracts.ascx" TagPrefix="uc5" TagName="SaleContracts" %>--%>
<%@ Register Src="~/Pages/eForms/iRental/Modules/RentalContracts.ascx" TagPrefix="uc5" TagName="RentalContracts" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link id="layoutStylesheet" href="../App_Themes/eForms_Theme/StyleSheets/StyleSheet_eng.css" type="text/css" rel="stylesheet" /> 
    <link id="Link1" href="../AsyncWidgets/Widgets/resources/css/common.standard.css" type="text/css" rel="stylesheet" />
    <link id="Link2" href="../AsyncWidgets/Widgets/resources/css/jquery-ui/ui-lightness/jquery-ui.css" type="text/css" rel="stylesheet" />
    <script language='javascript' type='text/javascript' > ROOT_PATH = ''; BASE_PATH = "";</script>
    <script src="AsyncWidgets/Scripts/jquery.js" type="text/javascript"></script>
    <script src="AsyncWidgets/Scripts/Custom-Ext.js" type="text/javascript" ></script>
    <script src="AsyncWidgets/Scripts/jquery.alphanumeric.js" type="text/javascript"></script>
    <script src="AsyncWidgets/Scripts/WidgetBase.js" type="text/javascript"></script>
    <script src="AsyncWidgets/Scripts/jquery.jclock.js" type="text/javascript"></script>
    <script src="AsyncWidgets/Scripts/jQueryUI/jquery-ui.js" type="text/javascript"></script>
    <script src="AsyncDashboards/FusionCharts/FusionCharts.js" type="text/javascript"></script>
    <script src="Scripts/Common/SessionExpired.js" type="text/javascript"></script>
</head>
<body> 
    <form id="form1" runat="server">
        <div>
            <%--<uc5:SalesContracts runat="server" ID="SaleContracts" />
            <uc5:RentalContracts runat="server" ID="RentalContracts" />--%>
        </div>
    </form>
    <script>

        $().ready(function () {
            setTimeout(function () { AsyncWidgets.get("conRentalContracts").show();},500);
            

        });
    </script>
    
</body>
</html>
