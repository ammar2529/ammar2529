<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmUpdateOrg.ascx.cs" Inherits="WebProject.AsyncWidgets.Forms.Organization.frmUpdateOrg" %>

<div  style="padding-top:30px;padding-bottom:30px;background:#F4F4FF;" >
<center>
<table style="width:75%;" cellspacing="2" >
<tr class="AgilityCellPadding">
							<td valign="top" class="MTTD1" colspan="3" style="vertical-align:middle;background:#E1E9EC;text-align:left;height:38;padding:0px;padding-left:10px;padding-right:10px;height:38px;border-bottom:1px solid black;margin-bottom:5px;">
							  <span class="PWCSubTitleHeader">Update Organization</span></td>
						</tr>
    <tr>
        <td class="PWCLabel" style="border: 1px solid #B4B7D9;padding: 4px;text-align: left;">
            Organization Id</td>
        <td class="PWCLabel" style="border: 1px solid #B4B7D9;padding: 4px;text-align: left;">
            Name</td>
        <td  class="PWCLabel" style="border: 1px solid #B4B7D9;padding: 4px;text-align: left;">
            Description</td>
    </tr>
    <tr>
        <td class="PWCLabel" style="border: 1px solid #B4B7D9;padding: 4px;text-align: left;">
            <input  type="text" class="PWCTextBox number required" argumentid="OrganizationId" groupid="Organization" /></td>
        <td style="border: 1px solid #B4B7D9;padding: 4px;text-align: left;">
            <input  type="text"  class="PWCTextBox required"  argumentid="Name" groupid="Organization"  /></td>
        <td  class="PWCLabel" style="border: 1px solid #B4B7D9;padding: 4px;text-align: left;">
            <input type="text" class="PWCTextBox required" argumentid="Description" groupid="Organization"  /></td>
    </tr>

    <tr>
                            <td class="AgilityTemplateTableBG" style="text-align: center;" colspan="3">
                            <input id="btnUpdate" style="width:70px" type="button" value="Update" class="PWCButton DataAction" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'ADM_UpdateOrganization',ActionType:'RowUpdate'}" />
                            
                            <input id="btnCancel" style="width:70px" type="button" value="Cancel" class="PWCButton WidgetAction" conf="{ActionId:'HideForm'}" />

                            </td>
                        </tr>
  </table>
  </center>
</div>