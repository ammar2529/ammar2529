<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmNewDocLibType.ascx.cs" Inherits="WebProject.AsyncWidgets.Forms.Process.frmNewDocLibType" %>

<div style="width:100%;vertical-align:middle;text-align:center;padding-top:4px;padding-bottom:4px;">
<br />
<br />
<br />
<br />
<br />
    <table cellspacing="0" cellpadding="0" border="0" align="center" style="width:50%;text-align:center;vertical-align:middle;border:1px solid black">
        <tbody><tr style="padding-top:5px;">
        <td> &nbsp;</td>
            <td style="text-align:left;" class="PWCSubTitleHeader">
                Add new document library type </td>
        </tr>
        <tr style="padding-top:5px;">
            <td class="PWCLabel" style="text-align:right;width:30%">
                Document Type</td>
            <td style="text-align:left;"> 
                <input type="text" groupid="AdmSPDocType" argumentid="DocType"  class="PWCTextBox required"></td>
        </tr>
        <tr style="padding-top:5px;padding-bottom:5px">
            <td>
                &nbsp;</td>
            <td style="text-align:left;">
    <input type="button" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'ADM_Ins_AdmSPDocType',ResetOnSuccess:true}" class="DataAction PWCButton" value="  Save  ">&nbsp;&nbsp;<input type="button" class="CloseForm PWCButton" value="  Cancel  ">
    <br />
    </td>
        </tr>
        </tbody></table>
</div>