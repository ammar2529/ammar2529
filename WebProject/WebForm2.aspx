<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/eForms.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WebProject.WebForm2" %>

<%@ Register Src="AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="AW" %>
<%@ Register Src="AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="AW" %>
<%@ Register Src="AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="AW" %>
<%@ Register Src="~/Pages/eForms/iRental/Modules/RentalContracts.ascx" TagPrefix="AW" TagName="RentalContracts" %>
<%@ Register Src="~/Pages/eForms/iRental/Modules/SalesContracts.ascx" TagPrefix="AW" TagName="SalesContracts" %>
<%@ Register Src="~/Pages/eForms/iRental/Modules/CarForSales.ascx" TagPrefix="AW" TagName="CarForSales" %>
<%@ Register Src="~/Pages/eForms/iRental/Modules/SalesCarPrice.ascx" TagPrefix="AW" TagName="SalesCarPrice" %>
<%@ Register Src="~/Pages/eForms/iRental/Modules/CarDetails.ascx" TagPrefix="AW" TagName="CarDetails" %>








<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
     <asp:TextBox ID="RndNo" runat="server" class="rndno" Style="display: none" />
    <div id="MainDiv"> 

        <div id="mainpanel">

<%--            <AW:RentalContracts runat="server" ID="RentalContracts" />--%>

<%--          <AW:SalesContracts runat="server" id="SalesContracts" />--%>
<%--            <AW:CarForSales runat="server" id="CarForSales" />--%>

<%--            <AW:CarDetails runat="server" ID="CarDetails" />--%>

<%--            <AW:SalesCarPrice runat="server" ID="SalesCarPrice" />--%>
    </div>
            </div>
    <script type="text/javascript">

        $().ready(function () {
            setTimeout(function () { AsyncWidgets.get(StartupWidgetId).show(); }, 500);


        });
    </script>
</asp:Content>

