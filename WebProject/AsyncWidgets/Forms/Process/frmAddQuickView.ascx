<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="frmAddQuickView.ascx.cs" Inherits="WebProject.AsyncWidgets.Forms.Process.frmAddQuickView" %>

<script runat="server">

</script>
<table border="0" cellpadding="0" cellspacing="0" style="width: 98%;margin-left:7px">
    <tr>
        <td style="width:60px">
            <span class="PWCLabel">Column</span>
        </td>
        <td>
<%--            <input type="text" groupid="AddQVCol" argumentid="ColumnName" style="width: 150px"
                class="PWCTextBox required">--%>
            <select storeinfo="{Command:'ADM_Sel_FormTypeCols',TextCol:'Name',ValCol:'value'}"
                loadoninit="true" argumentid="ColumnName" groupid="AddQVCol" valtype="text" name="ColumnName"
                class="PWCListBox required" style="width: 200px; margin-left: 20px">
                <option value="" selected="selected">Select Column</option>
            </select>
        </td>
        <td>
            <span class="PWCLabel" style="width:60px">Caption</span>
        </td>
        <td style="width:200px">
            <input type="text" groupid="AddQVCol" argumentid="Caption" style="width: 150px"
                class="PWCTextBox required" requirederr="&amp;nbsp;*">
        </td>
        <td style="display:none">
            <input type="checkbox" groupid="AddQVCol" argumentid="IsDate" style="position: relative;
                top: 2px; left: -1px;" ><span class="PWCLabel">Is Date</span>
        </td>
        <td>
            <input type="button" value="Save" class="PWCButton DataAction UpdateProcess" style="width:70px"
             conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'ADM_Ins_GlobalInboxPopConf',ActionType:'RowIns'}" /> 
            <input type="button" value="Cancel" class="PWCButton ActionButton" style="width:70px"
             conf="{Action:'hide'}" /> 
        </td>
    </tr>
</table>
<center>
<div style="width:98%"><hr noshade="noshade" style="height:1px;" /></div></center>