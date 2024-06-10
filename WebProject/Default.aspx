<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/eForms.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebProject.Default" %>

<%@ Register Src="AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="AW" %>
<%@ Register Src="AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="AW" %>
<%@ Register Src="AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="AW" %>

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









<%--<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] != null)//user logged in
        {
            frmHome.Hidden = true;
            frmInbox.Hidden = false;
        }

        else
        {
            frmHome.Hidden = false;
            frmInbox.Hidden = true;
        }
    }
</script>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
                    <script>


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

            <AW:Form ID="frmInbox" Hidden="true" LoadOnInit="false" ShowOnLoad="false" runat="server" DataSource="SEL_Employee_DB_Inbox"  AsyncForm="~/Pages/Common/Inbox.ascx"/>
                   <%--     <Scripts>
                      <script></script>
                        </Scripts>
              
            </AW:Form>--%>  
           

            <AW:Form ID="frmChangePassword" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/Common/ChangePassword.ascx" >
            <Scripts>
                <script></script>
            </Scripts>
            
            </AW:Form>

            <AW:Administration ID="Administration" runat="server" />

            <AW:EmployeeDatabase ID="EmployeeDatabase" runat="server" />
            <AW:CustomerDetails ID="CustomerDetails" runat="server" />
            <AW:CarDetails ID="CarDetails" runat="server" />
            <AW:CarRateDetails ID="CarRateDetails" runat="server" />
            <AW:CarTransfers ID="CarTransfers" runat="server" />
            <AW:RentalContracts ID="RentalContracts" runat="server" />
            <AW:LeaseContracts ID="LeaseContracts" runat="server" />
            <AW:SalesContracts runat="server" ID="SalesContracts" />
            <AW:CarForSales runat="server" ID="CarForSales" />
            <AW:SalesCarPrice runat="server" ID="SalesCarPrice" />
            <AW:SparePartInventory runat="server" ID="SparePartInventory" />
            <AW:GarageCarServiceDetails runat="server" id="GarageCarServiceDetails" />
            <AW:SparePartInventoryInvoice runat="server" id="SparePartInventoryInvoice" />
        </div>
    </div>

   <%-- <script>

        document.addEventListener("visibilitychange", function () {
            if (document.visibilityState === 'hidden') {
                // Tab or window is hidden (user switched to a different tab or window)
                // Perform logout action here
                logoutUser();
            }
        });

        function logoutUser() {
            // Your logout logic here
            alert('You have been logged out due to inactivity.');
            // Redirect to logout page or perform other logout actions
            window.location.href = `${location.protocol}//${location.host}`; // Replace with your logout URL
        }
    </script>--%>

<%--<script type="text/javascript">
    var onReady = () => {
        //console.log("finding menu...");
        if ($('[showwidget="conSalesContracts"]').length > 0) {
            $('[showwidget="conSalesContracts"]').trigger('click');
        }

        else {
            //var outterFun = arguments.callee;
            setTimeout(onReady, 3000);
        }
    };



    $().ready(onReady);

</script>--%>
    <script>

        //setInterval(function () {
        //    location.reload();
        //}, 5000);
        // 5000 milliseconds = 5 seconds

        //if (!sessionStorage.getItem('hasReloaded')) {
        //    sessionStorage.setItem('hasReloaded', 'true');
        //    window.location.reload();
        //}

        //if (sessionStorage.getItem('hasLoggedIn')) {
        //    sessionStorage.removeItem('hasLoggedIn');
        //    window.location.reload();
        //}

        $(document).ready(function () {
        //    location.reload();
            $('.LoginButton').click(function () {

                console.log('clicked login button')
            })
            AsyncWidgets.Widgets.on("initialized", function () {
               // alert("Widgets Initialized");
            });
        });

    </script>
</asp:Content>

