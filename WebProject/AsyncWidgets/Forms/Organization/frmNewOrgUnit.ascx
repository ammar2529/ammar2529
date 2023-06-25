<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmNewOrgUnit.ascx.cs" Inherits="WebProject.AsyncWidgets.Forms.Organization.frmNewOrgUnit" %>

<div  style="width:100%;vertical-align:middle;text-align:center;padding-top:4px" >
<br />
    <table style="width:50%;text-align:center;vertical-align:middle;border:1px solid black"  border="0" cellpadding="0" cellspacing="0" align="center" >
        <tr style="padding-top:5px;">
        <td   > &nbsp;</td>
            <td  class="PWCSubTitleHeader" style="text-align:left;">
                Add new organizational unit</td>
        </tr>
        <tr style="padding-top:5px;display:none">
            <td style="text-align:right;width:30%" class="PWCLabel" >
                &nbsp;</td>
            <td  style="text-align:left;"> 
                <input id="txtName0" type="text" class="PWCTextBox required"  
                    storeid="Organizations" argumentid="OrganizationId"  groupid="NewOrganizationalUnit" 
                    /></td>
        </tr>
        <tr style="padding-top:5px;">
            <td style="text-align:right;width:30%;white-space:nowrap" class="PWCLabel" >
                Organizational Unit Name</td>
            <td  style="text-align:left;"> 
                <input id="txtName" type="text" class="PWCTextBox required validateunique"  
                    storeid="OrganizationalUnits" argumentid="Name"  groupid="NewOrganizationalUnit" 
                    uniquefound="{en:'&amp;nbsp;Organizational Unit already exists!',color:'red'}" 
                    uniquenotfound="{en:'&amp;nbsp;Organizational Unit is valid',color:'green'}" 
                    uniquekeys='OrganizationId'
                    /></td>
        </tr>
        <tr style="padding-top:5px;">
            <td style="text-align:right;" class="PWCLabel" >
                Description</td>
            <td class="PWCLabel" style="width:200;text-align:left;">
                <input id="txtDescription" type="text"  class="PWCTextBox required "  argumentid="Description"  groupid="NewOrganizationalUnit"  /></td>
        </tr>
        <tr style="padding-top:5px;padding-bottom:5px">
            <td>
                &nbsp;</td>
            <td style="text-align:left;" >
    <input type="button" value="  Save  " class="DataAction PWCButton"  conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'ADM_Add_OrganizationalUnit'}"  />&nbsp;&nbsp;<input type="button" value="  Cancel  " class="CloseForm PWCButton" /></td>
        </tr>
        </table>

</div>
<br />
<br />