<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmAddUser.ascx.cs" Inherits="WebProject.AsyncWidgets.Forms.UserManagment.frmAddUser" %>

<style>
    .arrow-icon {
        transition: transform 0.3s ease;
        transform-origin: center;
    }

    .arrow-icon.up {
        transform: rotate(0deg);
    }

    .arrow-icon.down {
        transform: rotate(180deg);
    }
</style>

<script>
    function toggleRoles() {
        var content = document.getElementById('rolesContent');
        var arrow = document.getElementById('arrowIcon');

        content.style.display = content.style.display === 'none' ? 'block' : 'none';
        arrow.classList.toggle('up');
        arrow.classList.toggle('down');
    }
</script>

  
<table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">

    <tr id="trNote">
        <td colspan="2" style="padding-top:10px;padding-bottom:10px">
            Use the form below to update the details, fields marked with an asterisk (*) are mandatory
        </td>
    </tr>

    <tr>
        <td class="ftitle">
            <nobr>User Id*:</nobr>
        </td>
        <td>
            <input type="hidden"  groupid="SalesCarsPriceForm" argumentid="UserId" />
          <input type="text" style="text-align: center; width: 175px;" maxlength="50" class="text required validateunique" primarykey="UserId"
                storeid="FX_Users" uniquenotfound="{en:' User Id is valid...',color:'green'}"
                uniquefound="{en:' User Id is already exist...',color:'red'}" groupid="NewUser" argumentid="UserId" />
        </td>
    </tr>
    <tr>
        <td class="ftitle">
            <nobr>User Name*:</nobr>
        </td>
        <td>
            <input type="text" groupid="NewUser" argumentid="UserName" class="PWCTextBox required" style="width:175px" />
        </td>
    </tr>
    <%--<tr>
        <td class="ftitle">
            Organization<nobr>*:</nobr>
        </td>
        <td>
            <input type="text" groupid="NewUser" argumentid="Organization" class="PWCTextBox required AutoComplete" style="width:175px"
                    conf="{ActorId:'DataHelper',ActionId:'AutoComplete',StoreId:'ADM_AutoComplete',QueryId:'NewUserOrgIds',ACParams:{minChars:1,autoFill:false,width:250},ArgToSet:[{Index:1,Name:'OrgId'}]}"/>
        </td>
    </tr>--%>
   <%-- <tr>
         <td class="ftitle">
            Department<nobr>*:</nobr>
        </td>
        <td>
            <input type="text" groupid="NewUser" argumentid="department" class="PWCTextBox required AutoComplete" style="width:175px" 
                    conf="{ActorId:'DataHelper',ActionId:'AutoComplete',StoreId:'ADM_AC_OrgUnits',QueryId:'NewUserOUIds',ACParams:{minChars:1,autoFill:false,width:250},ParamFields:['Organization'],ArgToSet:[{Index:1,Name:'Dept'}]}"  />
        </td>
    </tr>--%>

    
     <tr>
        <td class="ftitle">
            <nobr>User Email:</nobr>
        </td>
        <td>
            <input type="text" groupid="NewUser" argumentid="UserEmail" class="PWCTextBox " style="width:175px" />
        </td>
    </tr>

<%--    <tr>
        <td class="ftitle">
            <nobr>User Roles*:</nobr>
        </td>
        <td>

            <input type="text" groupid="NewUser" argumentid="UserRole" class="PWCTextBox AutoComplete " style="width:175px"
                    conf="{ActorId:'DataHelper',ActionId:'AutoComplete',StoreId:'ADM_AutoComplete',QueryId:'GetRoles',ACParams:{minChars:3,autoFill:false,width:400},ArgToSet:[{Index:1,Name:'RoleId'}]}"/>


        </td>
    </tr>--%>
    <tr>
    <td class="ftitle">
        <nobr>User Roles*:</nobr>
    </td>
    <td>
        
 
            <button type="button" class="collapsible" onclick="toggleRoles()">
                Select Roles
                <span id="arrowIcon" class="arrow-icon up">&#9650;</span>
            </button>

            <div id="rolesContent" class="content" style="display: none;">

            <!-- Add your roles checkboxes here -->
            <div>
                <input type="checkbox" id="showAdministration" name="userRoles" value="Show_Administration"/>
                <label for="showAdministration">Show Administration</label>
            </div>
            <div>
                <input type="checkbox" id="showiDashboard" name="userRoles" value="Show_iDashboard"/>
                <label for="showiDashboard">Show iDashboard</label>
            </div>
            <div>
                <input type="checkbox" id="empDBMenu" name="userRoles" value="Emp_DB_Menu"/>
                <label for="empDBMenu">Emp DB Menu</label>
            </div>
            <div>
                <input type="checkbox" id="iRenContractsAdmin" name="userRoles" value="iRen_Contracts_Admin"/>
                <label for="iRenContractsAdmin">iRen Contracts Admin</label>
            </div>
            <div>
                <input type="checkbox" id="iRenContractsMenu" name="userRoles" value="iRen_Contracts_Menu"/>
                <label for="iRenContractsMenu">iRen Contracts Menu</label>
            </div>
            <div>
                <input type="checkbox" id="iRenCustMgtMenu" name="userRoles" value="iRen_Cust_Mgt_Menu"/>
                <label for="iRenCustMgtMenu">iRen Cust Mgt Menu</label>
            </div>
            <div>
                <input type="checkbox" id="iRenCarDetailsMenu" name="userRoles" value="iRen_Car_Details_Menu"/>
                <label for="iRenCarDetailsMenu">iRen Car Details Menu</label>
            </div>
            <div>
                <input type="checkbox" id="iRenRateManagementMenu" name="userRoles" value="iRen_Rate_Management_Menu">
                <label for="iRenRateManagementMenu">iRen Rate Management Menu</label>
            </div>
            <div>
                <input type="checkbox" id="iRenLeaseContractsMenu" name="userRoles" value="iRen_Lease_Contracts_Menu"/>
                <label for="iRenLeaseContractsMenu">iRen Lease Contracts Menu</label>
            </div>
            <div>
                <input type="checkbox" id="iRenCarTransferMenu" name="userRoles" value="iRen_Car_Transfer_Menu"/>
                <label for="iRenCarTransferMenu">iRen Car Transfer Menu</label>
            </div>
            <div>
                <input type="checkbox" id="salesContractMenu" name="userRoles" value="Sales_Contract_Menu"/>
                <label for="salesContractMenu">Sales Contract Menu</label>
            </div>
        </div>
    </td>
</tr>
      <tr>
        <td class="ftitle">
            <nobr>Password*:</nobr>
        </td>
        <td>

            <input type="password" value="" style="width: 175px" class="text required" tabindex="2" argumentid="Password"
                        groupid="NewUser" blurvalidate="false" requirederr=' *' />

        </td>
    </tr>
     <tr>
        <td colspan="2">
            <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
        </td>
    </tr>

<%--    <tr>
        <td class="ftitle">
          
        </td>
        <td>

              <input type="checkbox" style="position: relative; top: 2px; left: 0px;" argumentid="IsSecretary"
                        groupid="NewUser" />
                    Is Secretary &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="checkbox" style="position: relative; top: 2px; left: 0px;" argumentid="IsManager"
                        groupid="NewUser" />
                    Is Manager
        </td>
    </tr>--%>
                        <tr>
                    <td class="ftitle">
                        <nobr>Is Disabled:</nobr>
                    </td>
                    <td class="ftitle">
                                        <input type="radio" checked="checked" default="default" value="0" name="IsDisabled"
                                            groupid="NewUser" argumentid="IsDisabled"/><label>No</label>
                                        <input type="radio" value="1" name="IsDisabled" groupid="NewUser" argumentid="IsDisabled"/><label>Yes</label>
                    </td>
                </tr>



    <tr>
        <td colspan="2">
            <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
        </td>
    </tr>

    <tr>
        <td>
            <img src="App_Themes/eForms_Theme/Images/spacer.gif" />
        </td>
        <td>

            <input type="button" value="  Save  " class="DataAction ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesPriceCar',HideOnSuccess:true}" />
            <input type="button" value="  Cancel  " class="CloseForm ButtonStyle" />

        </td>
    </tr>
</table>