<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserManagement_FrUc.aspx.cs" Inherits="WebProject.Pages.Common.Administration.UserManagement_FrUc" %>
<%@ Register Src="~/AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="AW" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   
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
      <td class="ftitle">
            <nobr>Roles*:</nobr>
        </td>
        <td>

            <input type="text" style="text-align: center; width: 150px;" maxlength="10" class="text required number"
                groupid="UserManagmentForm" argumentid="CurrentMileage" />

           
        </td>
    </tr>
 
   
 
    <tr>
        <td colspan="2">
            <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
        </td>
    </tr>






    <tr>
        <td colspan="2">
            <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
        </td>
    </tr>

   
 
    <tr>
        <td class="ftitle">
            <nobr>Car Status*:</nobr>
        </td>
        <td>
            <select loadon="FirstVisible" class="dropdownlist required" style="width: 155px;"
                groupid="UserManagmentForm" argumentid="CarStatusId" storeinfo="{Command:'FX_SEL_SimpleMenu_Role_LOV_S',TextCol:'Name',ValCol:'RoleId',Params:[{Name:'ParentTypeId',Value:'42'}]}">
                <option value="" selected="selected">Select Status</option>
            </select>

            <span class="ftitle" groupid="UserManagmentForm" argumentid="ContractNo" style="padding-left: 20px; color: red"></span>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
        </td>
    </tr>
    <tr>
        <td class="ftitle" valign="top">
            <nobr>Comments:</nobr>
        </td>
        <td width="100%">
            <textarea class="textarea" rows="6" wrap="1" cols="37" argumentid="CurrentCondition" groupid="UserManagmentForm"></textarea>
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
            <input type="text" style="display: none" groupid="UserManagmentForm" argumentid="action" value="new" class="noautoreset" />
            <input type="button" id="onUpdate" value="  Save  " class="DataAction ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_CarsForSales',HideOnSuccess:true}" />
            <input type="button" value="  Cancel  " class="CloseForm ButtonStyle" />

        </td>
    </tr>
</table>

</body>
</html>
