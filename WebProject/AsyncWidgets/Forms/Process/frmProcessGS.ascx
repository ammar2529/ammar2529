<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmProcessGS.ascx.cs" Inherits="WebProject.AsyncWidgets.Forms.Process.frmProcessGS" %>

<script runat="server">

</script>
<div style="padding:10px">
<table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
    <tr>
        <td colspan="4" class="AgilityRowSpacerTop">
         </td>
    </tr>
    <tr>
        <td style="width: 25%">
          <span class="PWCLabel"> Process Name</span>  </td>
        <td style="width: 25%">
            &nbsp;</td>
        <td style="width: 25%">
          <span class="PWCLabel"> Business Function</span></td>
        <td style="width: 25%">
            <input type="text"   style="width:175px;display:none"  argumentid="FormType" groupid="ProcessGS"  />
            <input type="text"    style="width:175px;display:none"  argumentid="DataProfileId" groupid="ProcessGS"  />
            <input type="text"   style="width:175px;display:none"  argumentid="FormNameCode" groupid="ProcessGS"  />
            </td>
    </tr>
    <tr>
        <td colspan="2">
            <input  type="text"  class="PWCTextBox required" style="width:275px" 
                argumentid="ProcessName" groupid="ProcessGS" /></td>
        <td colspan="2">
            <input  type="text"  class="PWCTextBox AutoComplete required" style="width:130px" argumentid="BusinessFunction" groupid="ProcessGS" 
           conf="{ActorId:'DataHelper',ActionId:'AutoComplete',StoreId:'ADM_AutoComplete',QueryId:'BusinessFunctions' ,ACParams:{mustMatch:false,minChars:1,width:225}}"
            /></td>
    </tr>
    <tr>
        <td colspan="4" class="AgilityRowSpacer">
         </td>
    </tr>
    <tr>
        <td>
             <input  type="checkbox" style="position: relative; top: 2px; left: 0px;"  argumentid="IsCommonInfo" groupid="ProcessGS"  />
                        &nbsp;<span class="PWCLabel">Common Profile</span></td>
        <td>
             <input  type="checkbox" style="position: relative; top: 2px"  argumentid="IsInboxEnabled" groupid="ProcessGS"  />
                        <span class="PWCLabel">Inbox Enabled</span></td>
        <td>
            <input type="checkbox" style="position: relative; top: 2px; left: -1px;" argumentid="Inboxoverride" groupid="ProcessGS" />
                        <span class="PWCLabel">Inbox Override</span></td>
                                <td>
            <input  type="checkbox" style="position: relative; top: 2px" argumentid="enablecache" groupid="ProcessGS" />
                        <span class="PWCLabel">Enable Cache </span></td>
    </tr>
        <tr>
        <td colspan="4" class="AgilityRowSpacer">
         </td>

    </tr>
    <tr>
        <td>
            <input type="button" disabled="disabled" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'ADM_UPD_Process',ActionType:'RowUpdate'}"
 class="PWCButton DataAction UpdateProcess" value="Update"></td>
        <td>
        </td>
        <td> &nbsp;</td>
        <td>
        </td>
    </tr>
</table>
<br />
<br />
<br />
</div>