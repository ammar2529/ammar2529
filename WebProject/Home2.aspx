<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/BuDastoor.Master" AutoEventWireup="true" CodeBehind="Home2.aspx.cs" Inherits="WebProject.Home" %>
<%@ Register Src="AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="AW" %>
<%@ Register Src="AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="AW" %>
<%@ Register Src="AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="AW" %>
<%@ Register Src="~/Pages/Common/Home.ascx" TagPrefix="AW" TagName="Home" %>

<%@ Register Src="Pages/Common/Administration/Modules/Administration.ascx" TagName="Administration" TagPrefix="AW" %>


<%@ Register Src="Pages/eForms/Employee/Modules/EmployeeDatabase.ascx" TagName="EmployeeDatabase" TagPrefix="AW" %>
<%@ Register Src="Pages/eForms/iRental/Modules/CustomerDetails.ascx" TagName="CustomerDetails" TagPrefix="AW" %>
<%@ Register Src="Pages/eForms/iRental/Modules/CarDetails.ascx" TagName="CarDetails" TagPrefix="AW" %>
<%@ Register Src="Pages/eForms/iRental/Modules/CarRateDetails.ascx" TagName="CarRateDetails" TagPrefix="AW" %>
<%@ Register Src="Pages/eForms/iRental/Modules/CarTransfers.ascx" TagName="CarTransfers" TagPrefix="AW" %>
<%@ Register Src="Pages/eForms/iRental/Modules/RentalContracts.ascx" TagName="RentalContracts" TagPrefix="AW" %>
<%@ Register Src="Pages/eForms/iRental/Modules/LeaseContracts.ascx" TagName="LeaseContracts" TagPrefix="AW" %>
<%@ Register Src="~/Pages/eForms/iRental/Modules/SalesContracts.ascx" TagPrefix="AW" TagName="SalesContracts" %>
<%@ Register Src="~/Pages/eForms/iRental/Modules/CarForSales.ascx" TagPrefix="AW" TagName="CarForSales" %>
<%@ Register Src="~/Pages/eForms/iRental/Modules/SalesCarPrice.ascx" TagPrefix="AW" TagName="SalesCarPrice" %>
<%@ Register Src="~/Pages/eForms/iRental/Modules/SparePartInventory.ascx" TagPrefix="AW" TagName="SparePartInventory" %>
<%@ Register Src="~/Pages/eForms/iRental/Modules/GarageCarServiceDetails.ascx" TagPrefix="AW" TagName="GarageCarServiceDetails" %>
<%@ Register Src="~/Pages/eForms/iRental/Modules/SparePartInventoryInvoice.ascx" TagPrefix="AW" TagName="SparePartInventoryInvoice" %>
<%@ Register Src="~/Pages/eForms/iRental/Modules/CarAndCustomerDetails.ascx" TagPrefix="AW" TagName="CarAndCustomerDetails" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:TextBox ID="RndNo" runat="server" class="rndno" Style="display: none" />

    <div id="MainDiv"> 
        <div id="mainpanel">
 
        <%--    <AW:Form ID="frmHome" Hidden="false" runat="server" AsyncForm="~/Pages/Common/Home.ascx" />
            <AW:Form ID="frmTerms" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/Common/Terms.ascx" />
            <AW:Form ID="frmPrivacy" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/Common/Privacy.ascx" />
            <AW:Form ID="frmAccessDenied" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/Common/AccessDenied.ascx" />
            <AW:Form ID="frmComingSoon" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/Common/ComingSoon.ascx" />
            

            <AW:Administration ID="Administration" runat="server" />

            <AW:EmployeeDatabase ID="EmployeeDatabase" runat="server" />
            <AW:CustomerDetails ID="CustomerDetails" runat="server" />
            <AW:CarDetails ID="CarDetails" runat="server" />
            <AW:CarRateDetails ID="CarRateDetails" runat="server" />
            <AW:CarTransfers ID="CarTransfers" runat="server" />
            <AW:RentalContracts ID="RentalContracts" runat="server" />
            <AW:LeaseContracts ID="LeaseContracts" runat="server" />--%>
            <AW:Form ID="frmInbox" Hidden="true" LoadOnInit="false" ShowOnLoad="false" runat="server" DataSource="SEL_Employee_DB_Inbox"  AsyncForm="~/Pages/Common/Inbox.ascx"/>
                 <AW:EmployeeDatabase ID="EmployeeDatabase" runat="server" />
            <AW:SalesContracts runat="server" ID="SalesContracts" />
           <%-- <AW:CarForSales runat="server" ID="CarForSales" />
            <AW:SalesCarPrice runat="server" ID="SalesCarPrice" />
            <AW:SparePartInventory runat="server" ID="SparePartInventory" />
            <AW:GarageCarServiceDetails runat="server" id="GarageCarServiceDetails" />
            <AW:SparePartInventoryInvoice runat="server" id="SparePartInventoryInvoice" />
            <AW:CarAndCustomerDetails runat="server" id="CarAndCustomerDetails" />--%>

        </div>
    </div>

</asp:Content>