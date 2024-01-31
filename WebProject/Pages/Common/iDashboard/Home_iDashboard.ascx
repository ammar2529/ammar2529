<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Home_iDashboard.ascx.cs" Inherits="WebProject.Pages.Common.iDashboard.Home_iDashboard" %>

<script>
    //debugger
    var fn = function () {
        t.on('show', function () {
            alert('click')
            $('#iFrame').attr('src', 'ReportsEngine/iFrameHome.aspx');
        });
    }
    
</script>

<table cellspacing="0" cellpadding="0" width="100%" border="0" style="padding-left: 0px; padding-right: 0px; padding-bottom: 0px; padding-top: 0px;">
    <tr> 
        <td valign="top" nowrap="nowrap">
            <iframe class="iFrameDashboard" id="iFrame" width="100%" height="500px" src="ReportsEngine/iFrameHome.aspx" src2="ReportsEngine/iFrameHome.aspx" frameborder="0"></iframe>
        </td>
    </tr>
</table>
