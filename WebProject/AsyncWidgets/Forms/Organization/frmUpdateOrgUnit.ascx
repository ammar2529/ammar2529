<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmUpdateOrgUnit.ascx.cs" Inherits="WebProject.AsyncWidgets.Forms.Organization.frmUpdateOrgUnit" %>

<div class="fitelem" margin="20px" style="border:1px solid lightgrey;background-color:#E4E4E4" >
<table style="width:100%;" >
    <tr>
        <td class="PWCLabel">
            Organization Id</td>
        <td>
            <input id="Text1" type="text" class="PWCTextBox number required" argumentid="OrganizationalUnitId" groupid="OrganizationUnit" /></td>
        <td  class="PWCLabel">
            Name</td>
        <td> 
            <input id="Text2" type="text"  class="PWCTextBox required"  argumentid="Name" groupid="OrganizationUnit"  /></td>
        <td class="PWCLabel">
            Description</td>
        <td>
            <input id="Text3" type="text" class="PWCTextBox required" argumentid="Description" groupid="OrganizationUnit"  /></td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            <input id="btnUpdate" type="button" value="Update" class="PWCButton DataAction" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'ADM_Update_OrganizationalUnit',ActionType:'RowUpdate'}" /><input id="btnCancel" type="button" value="Cancel" class="PWCButton WidgetAction" conf="{ActionId:'HideForm'}" /></td>
        <td>
             &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>

</div>
