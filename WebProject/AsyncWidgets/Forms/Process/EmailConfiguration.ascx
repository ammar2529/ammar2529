<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EmailConfiguration.ascx.cs" Inherits="WebProject.AsyncWidgets.Forms.Process.EmailConfiguration" %>

<table style="width:98%;">
    <tr>
        <td>
          <span class="PWCLabel">Service Action Id </span></td>
        <td>

                        <input type="text" groupid="EmailConf" argumentid="ServiceActionId" style="width: 175px"
                        requirederr="&amp;nbsp;*"     class="PWCTextBox required" alt="" /></td>
        <td>
           <span class="PWCLabel">From Email</span></td>
        <td>
           <input type="text" groupid="EmailConf" argumentid="FromEmail" style="width: 175px"
                        requirederr="&amp;nbsp;*"     class="PWCTextBox required" alt="" /></td>
    </tr>
    <tr>
        <td>
             <span class="PWCLabel">To Email</span></td>
        <td>
           <input type="text" groupid="EmailConf" argumentid="ToEmail" style="width: 175px"
                        requirederr="&amp;nbsp;*"     class="PWCTextBox required" alt="" /></td>
        <td>
            <span class="PWCLabel">CC Email</span></td>
        <td>
          <input type="text" groupid="EmailConf" argumentid="CCEmail" style="width: 175px"
                        requirederr="&amp;nbsp;*"     class="PWCTextBox required" alt="" /></td>
    </tr>
    <tr>
  <td>
             <span class="PWCLabel">BCC Email</span></td>
        <td>
           <input type="text" groupid="EmailConf" argumentid="BCCEmail" style="width: 175px"
                        requirederr="&amp;nbsp;*"     class="PWCTextBox required" alt="" /></td>
        <td>
            <span class="PWCLabel">To Role</span></td>
        <td>
          <input type="text" groupid="EmailConf" argumentid="ToRole" style="width: 175px"
                        requirederr="&amp;nbsp;*"     class="PWCTextBox required" alt="" /></td>
    </tr>
    <tr>
  <td>
             <span class="PWCLabel">Subject</span> </td>
        <td colspan="3">
           <input type="text" groupid="EmailConf" argumentid="Subject" style="width: 98%"
                        requirederr="&amp;nbsp;*"     class="PWCTextBox required" alt="" /></td>
    </tr>
    <tr>
  <td>
             <span class="PWCLabel">Comments</span> </td>
        <td colspan="3">
           <textarea rows="3" style="width: 98%" cols="20" name="S1" groupid="EmailConf" argumentid="Comments"></textarea></td>
    </tr>
    <tr>
  <td>
            <span class="PWCLabel">Criteria Attribute</span> </td>
        <td>
          <input type="text" groupid="EmailConf" argumentid="CriteriaAttribute" style="width: 175px"
                        requirederr="&amp;nbsp;*"     class="PWCTextBox required" alt="" /></td>
        <td>
            <span class="PWCLabel">Attribute Value</span> </td>
        <td>
          <input type="text" groupid="EmailConf" argumentid="AttributeValue" style="width: 175px"
                        requirederr="&amp;nbsp;*"     class="PWCTextBox required" alt="" /></td>
    </tr>
    <tr>
  <td>
            <span class="PWCLabel">Criteria Email</span></td>
        <td>
          <input type="text" groupid="EmailConf" argumentid="CriteriaEmail" style="width: 175px"
                        requirederr="&amp;nbsp;*"     class="PWCTextBox required" alt="" /></td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
  <td>
             &nbsp;</td>
        <td colspan="3">
            <input argumentid="IsEnabled" groupid="EmailConf" 
                style="position: relative; top: 2px; left: 0px;" type="checkbox" />
            <span class="PWCLabel">Enabled</span>  &nbsp; &nbsp;&nbsp; <input argumentid="IsQuickView" groupid="EmailConf" 
                style="position: relative; top: 2px; left: 0px;" type="checkbox" />
            <span class="PWCLabel">Quick View</span>&nbsp; &nbsp;&nbsp; <input argumentid="IsDocsAttach" groupid="EmailConf" 
                style="position: relative; top: 2px; left: 0px;" type="checkbox" />
            <span class="PWCLabel">Documents Attached</span>&nbsp; &nbsp;&nbsp;<input argumentid="IsLinkNeeded" groupid="EmailConf" 
                style="position: relative; top: 2px; left: 0px;" type="checkbox" />
            <span class="PWCLabel">Link Needed</span>&nbsp; &nbsp;&nbsp;<input argumentid="IsHistoryEntry" groupid="EmailConf" 
                style="position: relative; top: 2px; left: 0px;" type="checkbox" />
            <span class="PWCLabel">History Entry</span>&nbsp; &nbsp;&nbsp;<input argumentid="IsCreatedBy" groupid="EmailConf" 
                style="position: relative; top: 2px; left: 0px;" type="checkbox" />
            <span class="PWCLabel">Created By</span>&nbsp; &nbsp;&nbsp;</td>
    </tr>
    <tr>
  <td>
             &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
  <td>
             &nbsp;</td>
        <td>
        </td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>