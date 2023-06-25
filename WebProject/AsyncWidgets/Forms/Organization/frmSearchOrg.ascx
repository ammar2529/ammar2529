<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmSearchOrg.ascx.cs" Inherits="WebProject.AsyncWidgets.Forms.Organization.frmSearchOrg" %>

<div  style="width:100%;vertical-align:middle;text-align:center;padding-top:4px;" >
<table style="width: 100%;" cellpadding="0" cellspacing="0">
    <tr>
        <td >
            <span class="PWCLabel">Organization Id</span></td>
        <td >
            &nbsp;
            <input id="Text1" type="text" class="PWCTextBox" groupid="SearchOrg" argumentid="OrganizationId"  /></td>
        <td >
            &nbsp;<span class="PWCLabel">Organization Name</span>
        </td>
        <td >
            <input id="Text2" type="text"  class="PWCTextBox"   groupid="SearchOrg" argumentid="OrganizationName"  />
       </td>
       <td >
            &nbsp;<span class="PWCLabel">User Id</span>
        </td>
        <td >
            <input id="Text3" type="text"  class="PWCTextBox AutoComplete"  conf="{ActorId:'DataHelper',ActionId:'AutoComplete',StoreId:'ADM_AutoComplete',ACParams:{multiple:true,width:225},ParamFields:['OrganizationName']}"   groupid="SearchOrg" argumentid="UsersId"  />
            </td>
        <td>

            <input id="btnOrgSearch" type="button" value="Search" 
                class="search PWCButton" /></td>
    </tr>
    </table>

    </div><hr size="1" width="100%" noshade 
    style="border: 0; color: #A2CDEE; background-color: #A2CDEE; height: 1px;width: 100%;text-align: left;margin:3px 0px 3px 0px"   /> 
    