<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmSearchRoles.ascx.cs" Inherits="WebProject.AsyncWidgets.Forms.frmSearchRoles" %>

<div  style="width:100%;vertical-align:middle;text-align:center;padding-top:4px;" >
<table style="width: 100%;" cellpadding="0" cellspacing="0" border="0">
    <tr>
           <td >
            <span class="PWCLabel">Process Name</span></td>
        <td style="text-align:left">
            <input id="Text3" type="text"  class="PWCTextBox AutoComplete"   
                conf="{ActorId:'DataHelper',ActionId:'AutoComplete',StoreId:'ADM_AutoComplete',QueryId:'ProcessName',ACParams:{minChars:1,mustMatch:false,autoFill:false,width:225}}" 
                groupid="SearchRoles" argumentid="ProcessName"  /></td>
        <td >
            <span class="PWCLabel">Role Id</span></td>
        <td style="text-align:left">
           
            <input id="Text1" type="text" class="PWCTextBox "   conf="{ActorId:'DataHelper',ActionId:'AutoComplete',StoreId:'ADM_AutoComplete',QueryId:'RoleIds',ACParams:{minChars:1,width:225}}" groupid="SearchRoles" argumentid="RoleId"  /></td>
        <td >
            &nbsp;<span class="PWCLabel">Role Name</span>
        </td>
        <td style="text-align:left">
            <input id="Text2" type="text"  class="PWCTextBox "   conf="{ActorId:'DataHelper',ActionId:'AutoComplete',StoreId:'ADM_AutoComplete',QueryId:'RoleNames',ACParams:{minChars:1,mustMatch:false,autoFill:false,width:225}}" groupid="SearchRoles" argumentid="RoleName"  />
       </td>

        <td>

            <input id="btnOrgSearch" type="button" value="Search" 
                class="search PWCButton" /></td>
    </tr>
    </table>

    </div><hr size="1" width="100%" noshade 
    style="border: 0; color: #A2CDEE; background-color: #A2CDEE; height: 1px;width: 100%;text-align: left;margin:3px 0px 3px 0px"   />