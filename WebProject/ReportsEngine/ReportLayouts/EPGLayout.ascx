<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EPGLayout.ascx.cs" Inherits="WebProject.ReportsEngine.ReportLayouts.EPGLayout" %>

<table id="HeaderLayout" width="100%" height="100%" runat="server" border="0" cellspacing="0"
    cellpadding="0">
    <tr style="background-color: Gray">
        <td></td>
        <td align="right" style="padding-right: 20px">
        </td>
    </tr>
    <tr style="height: 100%">
        <td colspan="2">
            <table id="SimpleLayout" runat="server" border="0" width="100%" height="100%" cellpadding="0"
                style=" background-color:White;" cellspacing="2"  >
                <tr valign="bottom" align="center" style="height: 2%;">
                    <td style="background-color: #E1E9EC" colspan="2">
                    </td>
                    <td style="background-color: #E1E9EC" colspan="2">
                    </td>
                    <td style="background-color: #E1E9EC" colspan="2">
                    </td>
                </tr>
                <tr valign="bottom" align="center" style="height: 10%">
                    <td style="background-color: #F9F9F9" colspan="3">
                    </td>
                    <td style="background-color: #F9F9F9" colspan="3">
                    </td>                    
                </tr>
                <tr valign="bottom" align="center" style="height:0px;">
                    <td></td><td></td><td></td><td></td><td></td><td></td>                  
                </tr>                
            </table>
        </td>
    </tr>
</table>