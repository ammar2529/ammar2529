<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmAddUser.ascx.cs" Inherits="WebProject.AsyncWidgets.Forms.UserManagment.frmAddUser" %>

<style>
    table.FormCellPadding td
    {
        padding-top:5px;
    }
</style>
<div style="width: 100%; vertical-align: middle; text-align: center; padding-top: 4px;
    padding-bottom: 4px;">
    <br />
    <br />
    <br />
    <br />
    <br />
    <table cellspacing="0" cellpadding="0" border="1" align="center" style="width: 50%;
        text-align: center; vertical-align: middle; border: 1px solid black" class="FormCellPadding">
        <tbody>
            <tr >
                <td >
                    &nbsp;
                </td>
                <td style="text-align: left;" class="PWCSubTitleHeader">
                    Add new user
                </td>
            </tr>
            <tr >
                <td class="PWCLabel" style="text-align: right; width: 30%;padding-top: 5px;">
                    User Id
                </td>
                <td style="text-align: left;">
                    <input type="text" groupid="NewUser" argumentid="UserId" class="PWCTextBox alphanum required validateunique AutoComplete" 
                       storeid="Users" uniquefound="{en:'&amp;nbsp;User already exists!',color:'red'}" 
                       uniquenotfound="{en:'&amp;nbspUser Id is valid',color:'green'}"
                    style="width:175px" alphconf="{allow:'.'}"
                    conf="{ActorId:'DataHelper',ActionId:'AutoComplete',StoreId:'ADM_AutoComplete',QueryId:'UsersList',ACParams:{mustMatch:false,minChars:1,autoFill:false,width:250}}"
                    />
                </td>
            </tr>
            <tr >
                <td class="PWCLabel" style="text-align: right; width: 30%;padding-top: 5px;">
                    User Name
                </td>
                <td style="text-align: left;">
                    <input type="text" groupid="NewUser" argumentid="UserName" class="PWCTextBox required" style="width:175px"> 
                </td>
            </tr>
            <tr >
                <td class="PWCLabel" style="text-align: right; width: 30%;padding-top: 5px">
                    Organization
                </td>
                <td style="text-align: left;">
                    <input type="text" groupid="NewUser" argumentid="Organization" class="PWCTextBox required AutoComplete" style="width:175px"
                    conf="{ActorId:'DataHelper',ActionId:'AutoComplete',StoreId:'ADM_AutoComplete',QueryId:'NewUserOrgIds',ACParams:{minChars:1,autoFill:false,width:250},ArgToSet:[{Index:1,Name:'OrgId'}]}"/>
                    <input type="text" groupid="NewUser" argumentid="OrgId" class="PWCTextBox " style="display:none" />
                </td>
            </tr>
            <tr >
                <td class="PWCLabel" style="text-align: right; width: 30%;padding-top: 5px" >
                    Department
                </td>
                <td style="text-align: left;">
                    <input type="text" groupid="NewUser" argumentid="department" class="PWCTextBox required AutoComplete" style="width:175px" 
                    conf="{ActorId:'DataHelper',ActionId:'AutoComplete',StoreId:'ADM_AC_OrgUnits',QueryId:'NewUserOUIds',ACParams:{minChars:1,autoFill:false,width:250},ParamFields:['Organization'],ArgToSet:[{Index:1,Name:'Dept'}]}"  />
                     <input type="text" groupid="NewUser" argumentid="Dept" class="PWCTextBox" style="display:none" />
                </td>
            </tr>
            <tr >
                <td class="PWCLabel" style="text-align: right; width: 30%;padding-top: 5px">
                    User Role
                </td>
                <td style="text-align: left;">
                    <input type="text" groupid="NewUser" argumentid="UserRole" class="PWCTextBox AutoComplete" style="width:175px"
                    conf="{ActorId:'DataHelper',ActionId:'AutoComplete',StoreId:'ADM_AutoComplete',QueryId:'GetRoles',ACParams:{minChars:3,autoFill:false,width:400},ArgToSet:[{Index:1,Name:'RoleId'}]}"/>
                      <input type="text" groupid="NewUser" argumentid="RoleId" class="PWCTextBox " style="display:none" />
                </td>
            </tr>
            <tr style="padding-top: 5px;">
                <td class="PWCLabel" style="text-align: right; width: 30%">
                    &nbsp;
                </td>
                <td style="text-align: left;" class="PWCLabel">
                    <input type="checkbox" style="position: relative; top: 2px; left: 0px;" argumentid="IsSecretary"
                        groupid="NewUser" />
                    Is Secretary &nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="checkbox" style="position: relative; top: 2px; left: 0px;" argumentid="IsManager"
                        groupid="NewUser" />
                    Is Manager
                </td>
            </tr>
            <tr style="padding-top: 5px; ">
                <td>
                    &nbsp;
                </td>
                <td style="text-align: left;">
                    <input type="button" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'ADM_Ins_eFormUser',ResetOnSuccess:true}"
                        class="DataAction PWCButton" value="Save" style="width: 80px" />&nbsp;&nbsp;<input
                            type="button" class="CloseForm PWCButton" value="Cancel" style="width: 80px" />
                </td>
            </tr>
               <tr >
                <td colspan="2">
                   <div style="height:10px"> </div>
                </td>
                
            </tr>
        </tbody>
    </table>
</div>