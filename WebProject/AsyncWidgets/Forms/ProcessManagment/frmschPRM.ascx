<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmschPRM.ascx.cs" Inherits="WebProject.AsyncWidgets.Forms.ProcessManagment.frmschPRM" %>

<div class="fitelem" style="border: 1px solid lightgrey; background-color: #E4E4E4">
    <table style="width: 100%;">
        <tr>
            <td class="PWCLabel" colspan="3">
                <b>
                    <div style="white-space: nowrap">
                        Process Role Management</div>
                </b>
            </td>
            <td style="width: 100%">
                &nbsp;
            </td>
        </tr>
        <tr>
            <td class="PWCLabel" colspan="4" valign="bottom">
                Organization
                <select style="width: 200px; margin-left: 20px" class="PWCListBox" name="ddlOrganizationId"
                    valtype="val" groupid="SearchCars" argumentid="OrganizationId" loadoninit="true"
                    childcombo="FormType" storeinfo="{Command:'ADM_Sel_UserOrganizationRights',TextCol:'Name',ValCol:'OrganizationId',Params:[{Name:'OrganizationId',Value:'0'}]}">
                    <option selected="selected" value="">Select Organization</option>
                </select><%--            <input id="Text1" type="text" class="PWCTextBox number required" argumentid="OrganizationId" groupid="Organization" />--%>
                &nbsp;

            </td>
        </tr>
        <tr style="display: none">
            <td class="PWCLabel">
                Processes
            </td>
            <td colspan="2">
                <select style="width: 200px" class="PWCListBox" name="ddlProcess" valtype="val" groupid="SearchCars"
                    argumentid="FormType" childcombo="RoleId,InitiatorRoles" storeinfo="{Command:'ADM_Sel_UserOrgProcessesRights',TextCol:'FormName',ValCol:'FormType',Params:[{Name:'OrganizationId'}]}">
                    <option selected="selected" value="">Select Process</option>
                </select>
            </td>
            <td>
                <select style="width: 200px" size="5" class="PWCListBox" name="ddlInitiatorRoles"
                    valtype="val" groupid="SearchCars" argumentid="InitiatorRoles" storeinfo="{Command:'ADM_Sel_ProcessRoleInitiatorRoles',TextCol:'Name',ValCol:'RoleId',Params:[{Name:'OrganizationId'},{Name:'FormType'}]}">
                </select><select style="width: 200px" size="5" class="PWCListBox" name="ddlRoles"
                    valtype="val" groupid="SearchCars" argumentid="RoleId" storeinfo="{Command:'ADM_Sel_UserOrgProcessRoles',TextCol:'Name',ValCol:'RoleId',Params:[{Name:'OrganizationId'},{Name:'FormType'}]}">
                </select><input id="btnSearch" type="button" value="Search" class="PWCButton search" />
            </td>
        </tr>
        <tr class="ProcessNamesRow">
            <td class="PWCLabel" colspan="4">
                <table id="tbProcessNames" style="width: 100%" cellpadding="0" cellpadding="0" border="0">
                    <tr class="rowDepts">
                        <%--            <td style="padding-left:10px">
                 <span class="PWCLabel"><u><b>HR</b></u></span>
            </td>
                       <td style="padding-left:10px">
                 <span class="PWCLabel"><u><b>Finance</b></u></span>
            </td>--%>
                        <td class="FullWidth" style="width: 100%;">
                        </td>
                    </tr>
                    <tr class='rowProcessNames'>
                        <%--                   <td valign="top" nowrap="nowrap" style="padding-right:20px;">
                        <ul type="disc">
                            <li class="PWCLabel">Employee Certificate</li>
                            <li class="PWCLabel">Leave Request</li>
                        </ul>
                    </td>
                    <td valign="top" nowrap="nowrap" style="padding-right:20px">
                        <ul type="disc">
                            <li class="PWCLabel">Payment Request</li>
                            <li class="PWCLabel">Investment Request</li>
                            <li class="PWCLabel">iTravel</li>
                        </ul>
                    </td>--%>
                        <td class="FullWidth" valign="top" nowrap="nowrap" style="width: 100%;">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr class="RolesRow" style="display: none">
            <td class="PWCLabel" valign="top" style="white-space: nowrap; padding-left: 10px"
                colspan="2">
                <span class="PWCLabel"><b><u>Process Roles</u></b></span>
            </td>
            <td valign="top" nowrap="nowrap">
                <span class="PWCLabel"><b>Initiator Roles - </b>Can be updated only from workflow engine</span>
            </td>
            <td valign="bottom">
            </td>
        </tr>
        <tr class="RolesRow" style="display: none">
            <td class="PWCLabel" valign="top" style="white-space: nowrap; padding-right: 25px"
                colspan="2">
                <ul type="disc" class="ListProcessRoles">
                    <%--                            <li class="PWCLabel">Payment Request</li>
                            <li class="PWCLabel">Investment Request</li>
                            <li class="PWCLabel">iTravel</li>--%>
                </ul>
            </td>
            <td valign="top" nowrap="nowrap">
                <ul type="circle" class="ListInitRoles">
                    <%--                            <li class="PWCLabel">Admin</li>
                            <li class="PWCLabel">PWC Secretary</li>
                            <li class="PWCLabel">Directors</li>--%>
                </ul>
            </td>
            <td valign="bottom">
                &nbsp;
            </td>
        </tr>
        <tr style="display: none">
            <td>
                &nbsp;
            </td>
            <td>
                <%--<input id="btnCancel" type="button" value="Cancel" class="PWCButton WidgetAction" conf="{ActionId:'HideForm'}" />--%>
            </td>
            <td>
                hi&nbsp;
            </td>
            <td>
                &nbsp;
            </td>
        </tr>
    </table>
</div>
