<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmAddEditAssignRoles.ascx.cs" Inherits="WebProject.AsyncWidgets.Forms.Process.frmAddEditAssignRoles" %>

<script runat="server">

</script>
<table style="width: 98%; height: 100%; margin-left: 7px" border="0">
    <tr>
        <!-- ,Params:[{Name:'OrganizationId'},{Name:'FormType'}] -->
        <td valign="top" style="height:20px">
         <span class="PWCLabel">New Role Name</span>
            <table cellpadding="0" cellspacing="0" border="0" style="width: 100%">
                <tr>
                    <td style="white-space:nowrap">

                        <input type="text" groupid="AddEditAssignRoles" argumentid="RoleToAdd" style="width: 175px"
                        requirederr="&amp;nbsp;*"     class="PWCTextBox required" alt="">
                    </td>
                </tr>
                <tr>
                    <td>
                     <div style="height:5px" ></div>
                    <table  cellpadding="0" cellspacing="0" border="0" style="width: 100%">
                    <tr>
                    <td style="text-align:left" > <input type="button" class="DataAction PWCButton"  value="   Delete   " /></td>
                    <td style="text-align:right" ><input type="button" value="     Save     " class="PWCButton DataAction" 
                               conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'ADM_Ins_NewProcessRole',ActionType:'RowIns',ResetOnSuccess:true}" /></td>
                    </tr>
                    </table>
                         <div style="height:5px" ></div>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td style="vertical-align:top">
        <span class="PWCLabel">Roles</span>
            <select argumentid="RoleId" groupid="AddEditAssignRoles" valtype="val" name="ddlRoles"
                class="PWCListBox" size="5" style="width: 200px; height: 325px" storeinfo="{Command:'ADM_Sel_ProcessRoles',TextCol:'Name',ValCol:'RoleId',ItemExtraAttrs:['testattrib1','test2']}">
                <option value="" selected="selected">Select Column</option>
            </select>

            <input id="btnSearch" type="button" style="display:none" value="Search" class="PWCButton search" />
        </td>
    </tr>
</table>