<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmDocumentLib.ascx.cs" Inherits="WebProject.AsyncWidgets.Forms.Process.frmDocumentLib" %>

<script runat="server">

</script>
<table style="width:98%;margin-left:7px"  border="0" cellpadding="0" cellspacing="0">
    <tr>
        <td style="width:100px">
            <span class="PWCLabel">Document Code</span></td>
        <td style="width:190px"  >
           <input type="text" groupid="DocLibConfig" argumentid="DocumentCode" style="width: 150px"
                class="PWCTextBox required" requirederr="&amp;nbsp;*"></td>
        <td style="width:90px">
            <span class="PWCLabel">Library Name</span></td>
        <td style="width:190px">
           <input type="text" groupid="DocLibConfig" argumentid="DocumentLibraryName" style="width: 150px"
                class="PWCTextBox required" requirederr="&amp;nbsp;*"></td>
        <td>
            <input type="button" value=" Save " class="PWCButton DataAction UpdateProcess SaveDocLib" disabled="disabled"
             conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'ADM_Ins_DocLibConfig',ActionType:'RowIns'}" style="width: 50px" /> 
             &nbsp;
            <input type="button" value=" Delete " class="PWCButton DataAction UpdateProcess DeleteDocLib" disabled="disabled"
             conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'ADM_Del_DocLibConfig',ActionType:'RowIns'}"  style="width: 50px"  /> 
                  
        </td>
    </tr>
</table>
<center>
    <div style="width:98%;padding-top:2px"><hr noshade="noshade" style="height:1px;"></div>
</center>