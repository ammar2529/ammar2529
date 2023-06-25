<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmNewOrg.ascx.cs" Inherits="WebProject.AsyncWidgets.Forms.Organization.frmNewOrg" %>

<div  style="width:100%;vertical-align:middle;text-align:center;padding-top:4px" >
<br />
<br />
<br />
<br />
<br />
    <table style="width:50%;text-align:center;vertical-align:middle;border:1px solid black"  border="0" cellpadding="0" cellspacing="0" align="center" >
        <tr style="padding-top:5px;">
        <td   > &nbsp;</td>
            <td  class="PWCSubTitleHeader" style="text-align:left;">
                Add new organization</td>
        </tr>
        <tr style="padding-top:5px;">
            <td style="text-align:right;width:30%" class="PWCLabel" >
                Organization Name</td>
            <td  style="text-align:left;"> 
                <input id="txtName" type="text" class="PWCTextBox required validateunique"  
                    storeid="Organizations" argumentid="Name"  groupid="NewOrganization" 
                    uniquefound="{en:'&amp;nbsp;Organization already exists!',color:'red'}" 
                    uniquenotfound="{en:'&amp;nbsp;Organization is valid',color:'green'}" 
                    /></td>
        </tr>
        <tr style="padding-top:5px;">
            <td style="text-align:right;" class="PWCLabel" >
                Description</td>
            <td class="PWCLabel" style="width:200;text-align:left;">
                <input id="txtDescription" type="text"  class="PWCTextBox required "  argumentid="Description"  groupid="NewOrganization"  /></td>
        </tr>
        <tr style="padding-top:5px;padding-bottom:5px">
            <td>
                &nbsp;</td>
            <td style="text-align:left;" >
    <input type="button" value="  Save  " class="DataAction PWCButton"  conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'ADM_Add_Organization'}"  />&nbsp;&nbsp;<input type="button" value="  Cancel  " class="CloseForm PWCButton" /></td>
        </tr>
        </table>
</div>