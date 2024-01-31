<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserManagement_FrUc.ascx.cs" Inherits="WebProject.Pages.Common.Administration.UserManagement_FrUc1" %>
<table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">

    <tr id="trNote">
        <td colspan="2" style="padding-top: 10px; padding-bottom: 10px">Use the form below to update the details, fields marked with an asterisk (*) are mandatory
        </td>
    </tr>

    <tr>
        <td class="ftitle">
            <nobr>User Name*:</nobr>
        </td>
        <td>

            <input type="text" style="text-align: center; width: 150px;" maxlength="10" class="text required number"
                groupid="UserManagmentForm" argumentid="Name" />


        </td>
    </tr>

    <tr>
        <td class="ftitle">
            <nobr>User Email*:</nobr>
        </td>
        <td>

            <input type="text" style="text-align: center; width: 150px;" maxlength="10" class="text required number"
                groupid="UserManagmentForm" argumentid="UserEmail" />


        </td>
    </tr>


    <tr>
        <td class="ftitle">
            <nobr>Password*:</nobr>
        </td>
        <td>

            <input type="password" style="text-align: center; width: 150px;" maxlength="10" class="text required number"
                groupid="UserManagmentForm" argumentid="Password" />


        </td>
    </tr>
    <tr>
        <td class="ftitle" rowspan="5">
            <nobr>Roles*:</nobr>
        </td>
        <td>

            <label for="showDashboard">Show_iDashboard</label>
            <input type="checkbox" id="showDashboard" name="showDashboard" value="Show_iDashboard" />

            <label for="empDBMenu">Emp_DB_Menu</label>
            <input type="checkbox" id="empDBMenu" name="empDBMenu" value="Emp_DB_Menu" />



            <label for="empDBMenu">iRen_Lease_Contracts_Menu</label>
            <input type="checkbox" id="iRenLeaseContractsMenu" name="iRenLeaseContractsMenu" value="iRen_Lease_Contracts_Menu" />
            <!-- Similarly, add checkboxes for other roles -->



        </td>
    </tr>



    <tr>
        <td>
            <label for="empDBMenu">iRen_Contracts_Admin</label>
            <input type="checkbox" id="iRenContractsAdmin" name="iRenContractsAdmin" value="iRen_Contracts_Admin" />

            <label for="empDBMenu">iRen_Contracts_Menu</label>
            <input type="checkbox" id="iRenContractsMenu" name="iRenContractsMenu" value="iRen_Contracts_Menu" />
        </td>
    </tr>



    <tr>
        <td>
            <label for="empDBMenu">iRen_Cust_Mgt_Menu</label>
            <input type="checkbox" id="iRenCustMgtMenu" name="iRenCustMgtMenu" value="iRen_Cust_Mgt_Menu" />

            <label for="empDBMenu">iRen_Car_Details_Menu:</label>
            <input type="checkbox" id="iRenCarDetailsMenu" name="iRenCarDetailsMenu" value="iRen_Car_Details_Menu" />
        </td>
    </tr>





    <tr>
        <td>
            <label for="empDBMenu">iRen_Rate_Management_Menu</label>
            <input type="checkbox" id="iRenRateManagementMenu" name="iRenRateManagementMenu" value="iRen_Rate_Management_Menu" />

            <label for="empDBMenu">iRen_Car_Transfer_Menu</label>
            <input type="checkbox" id="iRenCarTransferMenu" name="iRenCarTransferMenu" value="iRen_Car_Transfer_Menu" />
        </td>
    </tr>

    <tr>
        
        <td>
            <input type="text" style="display: none" groupid="UserManagmentForm" argumentid="action" value="new" class="noautoreset" />
            <input type="button" id="onUpdate" value="  Save  " class="DataAction ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_CarsForSales',HideOnSuccess:true}" />
            <input type="button" value="  Cancel  " class="CloseForm ButtonStyle" />

        </td>
    </tr>
</table>
