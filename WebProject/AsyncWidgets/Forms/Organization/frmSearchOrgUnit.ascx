<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmSearchOrgUnit.ascx.cs" Inherits="WebProject.AsyncWidgets.Forms.Organization.frmSearchOrgUnit" %>

<div  style="padding-top:4px;padding-bottom:4px;background:#E1E9EC;" >
<center>
<table style="width: 73%;" cellpadding="0" cellspacing="0">
    <tr>
        <td style="white-space:nowrap ;text-align:left" >
            <span class="PWCLabel">Organizational Unit Id</span></td>
        <td style="white-space:nowrap ;text-align:left">
            <span class="PWCLabel">Organizational Unit Name</span>
        </td>
                    <td style="white-space:nowrap;text-align:left">
            <span class="PWCLabel">User Id</span>
        </td>
                    <td style="white-space:nowrap">
                        &nbsp;</td>
    </tr>
    <tr>
        <td style="white-space:nowrap">
            <input  type="text" class="PWCTextBox" groupid="SearchOrg" argumentid="OrganizationalUnitId"  style="width:170px;margin-right:10px"  /></td>
        <td style="white-space:nowrap">
            <input  type="text"  class="PWCTextBox"   groupid="SearchOrg" argumentid="Name"   style="width:170px;margin-right:10px"  /></td>
                    <td style="white-space:nowrap">
            <input  type="text"  class="PWCTextBox"   groupid="SearchOrg" argumentid="UsersId"  style="width:170px;margin-right:10px"   /></td>
                    <td style="white-space:nowrap">
            <input id="btnOrgSearch" type="button" value="Search" 
                class="search PWCButton"  style="width:70px;"/>&nbsp;&nbsp;<input type="button" class="reset PWCButton" value="Reset" style="width:70px;"></td>
    </tr>
   
    </table>
    </center>

       <%-- <div style="width:100%;border:0px;border-top:1px solid black;margin-top:5px"></div>--%>
    </div>