<%@ Page Title="" Language="C#" MasterPageFile="~/BuDastoor.Master" AutoEventWireup="true" CodeBehind="BudastoorHome.aspx.cs" Inherits="WebProject.BudastoorHome" %>
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
<%@ Register Src="~/Pages/eForms/iRental/Modules/SalesContracts.ascx" TagPrefix="AW" TagName="SalesContracts" %>
<%@ Register Src="~/Pages/eForms/iRental/Modules/CarForSales.ascx" TagPrefix="AW" TagName="CarForSales" %>
<%@ Register Src="~/Pages/eForms/iRental/Modules/SalesCarPrice.ascx" TagPrefix="AW" TagName="SalesCarPrice" %>
<%@ Register Src="~/Pages/eForms/iRental/Modules/SparePartInventory.ascx" TagPrefix="AW" TagName="SparePartInventory" %>
<%@ Register Src="~/Pages/eForms/iRental/Modules/SparePartInventoryInvoice.ascx" TagPrefix="AW" TagName="SparePartInventoryInvoice" %>
<%@ Register Src="~/Pages/eForms/iRental/Modules/GarageCarServiceDetails.ascx" TagPrefix="AW" TagName="GarageCarServiceDetails" %>
<%@ Register Src="~/Pages/eForms/iRental/Modules/CarAndCustomerDetails.ascx" TagPrefix="AW" TagName="CarAndCustomerDetails" %>
<%@ Register Src="~/Pages/eForms/iRental/Modules/LeaseContracts.ascx" TagPrefix="AW" TagName="LeaseContracts" %>




<asp:Content ID="Content1" ContentPlaceHolderID="BuDastoorHome" runat="server">
    <asp:TextBox ID="RndNo" runat="server" class="rndno" Style="display: none" />

    <div id="MainDiv">
        <div id="mainpanel">
            <AW:Form ID="frmHome" Hidden="false" runat="server" AsyncForm="~/Pages/Common/Home.ascx" />
            <AW:Form ID="frmTerms" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/Common/Terms.ascx" />
            <AW:Form ID="frmPrivacy" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/Common/Privacy.ascx" />
            <AW:Form ID="frmAccessDenied" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/Common/AccessDenied.ascx" />
            <AW:Form ID="frmComingSoon" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/Common/ComingSoon.ascx" />
            <AW:Form ID="frmiDashboard" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/Common/iDashboard/Home_iDashboard.ascx">
                <Scripts>
                    <script type="text/javascript">


                        var fn = function () {
                            t.on('show', function () {
                                console.log('showing iframe');
                                var iframe = $('iframe');
                                iframe.attr('src', iframe.attr('src2'));
                            });
                        };

                    </script>
                </Scripts>
            </AW:Form>

            <AW:Form ID="frmLogout" Hidden="true" runat="server" AsyncForm="~/Pages/Common/Logout.ascx" />

            <AW:Form ID="frmInbox" Hidden="true" LoadOnInit="false" ShowOnLoad="false" runat="server" DataSource="SEL_Employee_DB_Inbox" AsyncForm="~/Pages/Common/Inbox.ascx" />


            <AW:Form ID="frmChangePassword" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/Common/ChangePassword.ascx">
                <Scripts>
                    <script type="text/javascript"></script>
                </Scripts>

            </AW:Form>

            <AW:Administration ID="Administration" runat="server" />

            <AW:EmployeeDatabase ID="EmployeeDatabase" runat="server" />
            <AW:CustomerDetails ID="CustomerDetails" runat="server" />
            <AW:CarDetails ID="CarDetails" runat="server" />
            <AW:CarRateDetails ID="CarRateDetails" runat="server" />
            <AW:CarTransfers ID="CarTransfers" runat="server" />
            <AW:RentalContracts ID="RentalContracts" runat="server" />

            <AW:SalesCarPrice runat="server" ID="SalesCarPrice" />
            <AW:CarForSales runat="server" ID="CarForSales" />
            <AW:SparePartInventory runat="server" ID="SparePartInventory" />
            <AW:SparePartInventoryInvoice runat="server" ID="SparePartInventoryInvoice" />
            <AW:GarageCarServiceDetails runat="server" ID="GarageCarServiceDetails" />
            <AW:CarAndCustomerDetails runat="server" ID="CarAndCustomerDetails" />
            <AW:LeaseContracts runat="server" ID="LeaseContracts" />

            <AW:SalesContracts runat="server" ID="SalesContracts" />




        </div>
    </div>

    
  <script type="text/javascript">
      var onReady = () => {

          console.log("finding menu...");
         
          if ($('[showwidget="conInvoice"]').length > 0) {
              $('[showwidget="conInvoice"]').trigger('click');
          }

          else {
              //var outterFun = arguments.callee;
              setTimeout(onReady, 3000);
          }
      };



      $().ready(setTimeout(onReady,1000));

  </script>

</asp:Content>
