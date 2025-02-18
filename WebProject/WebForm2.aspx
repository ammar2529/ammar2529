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

          <AW:SalesContracts runat="server" id="SalesContracts" />
<%--            <AW:CarForSales runat="server" id="CarForSales" />--%>

<%--            <AW:CarDetails runat="server" ID="CarDetails" />--%>

<%--            <AW:SalesCarPrice runat="server" ID="SalesCarPrice" />--%>
    </div>
            </div>
    <script type="text/javascript">
        async function delay(duration) {
            return new Promise((resolve, reject) => setTimeout(() => resolve(duration), duration));
        };
        $().ready(function () {

            delay(500).then(() => AsyncWidgets.get(StartupWidgetId).show() );
        });
  
            function handleSubmit(event) {
                // Prevent the form from submitting
                event.preventDefault();

                // Custom JS code here
                const username = document.getElementById('username').value;
                const password = document.getElementById('password').value;

                // Example of using the values (you can replace with your own logic)
                console.log("Username:", username);
                console.log("Password:", password);

                // You can also show an alert or perform other actions
                alert('Form submitted! But using custom JS.');
            }
    </script>


<%--    <h2>Login Form</h2>
    <form id="loginForm" onsubmit="handleSubmit(event)">
        <label for="username">Username:</label><br>
        <input type="text" id="username" name="username" required><br><br>

        <label for="password">Password:</label><br>
        <input type="password" id="password" name="password" required><br><br>

        <button type="submit">Submit</button>
    </form>--%>


</asp:Content>

