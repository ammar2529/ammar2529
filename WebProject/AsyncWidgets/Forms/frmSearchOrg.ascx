<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmSearchOrg.ascx.cs" Inherits="WebProject.AsyncWidgets.Forms.frmSearchOrg" %>

<style type="text/css">
    .style1
    {
        width: 102px;
    }
    .style2
    {
        width: 151px;
    }
    .style3
    {
        width: 134px;
    }
    .style4
    {
        width: 165px;
    }
</style>
<div  style="width:100%;vertical-align:middle;text-align:center;padding-top:4px" >
<table style="width: 73%;" cellpadding="0" cellspacing="0">
    <tr>
        <td class="style1">
            <span class="PWCLabel">Organization Id</span></td>
        <td class="style2">
            &nbsp;
            <input id="Text1" type="text" class="PWCTextBox" groupid="SearchOrg" argumentid="OrganizationId"  /></td>
        <td class="style3">
            &nbsp;<span class="PWCLabel">Organization Name</span>
        </td>
        <td class="style4">
            <input id="Text2" type="text"  class="PWCTextBox"   groupid="SearchOrg" argumentid="OrganizationName"  /></td>
        <td>
            <input id="btnOrgSearch" type="button" value="Search" 
                class="search PWCButton" /></td>
    </tr>
    </table>
<div style="width:100%;border:0px;border-top:1px solid black;margin-top:5px"></div>
    </div>