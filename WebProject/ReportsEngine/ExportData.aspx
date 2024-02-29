<%@ Page Title="" Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="ExportData.aspx.cs" Inherits="WebProject.ReportsEngine.ExportData"   %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
        <link href="../../EForms.css" type="text/css" rel="stylesheet" />
    <link href="../../StyleSheets/StyleSheet_eng.css" type="text/css" rel="stylesheet" />
    <style type="text/css">
  /*  
     .GridHeader a  {color:Navy; text-decoration:none;font-family:Verdana; font-size:11px; padding-left:3px }
     .GridHeader a:active {color:Navy; text-decoration:none;font-family:Verdana; font-size:11px; padding-left:3px }
     .GridHeader a:visited {color:Navy; text-decoration:none;font-family:Verdana; font-size:11px; padding-left:3px }
     .GridHeader  a:hover{color:#ff6355;text-decoration:underline;font-family:Verdana; font-size:11px;padding-left:3px }
    */ 
     .GridHead
      {
        color:Navy; 
        text-decoration:none;
        font-family:Verdana; 
        font-size:11px;
        padding-left:3px 
      }
     .GridLink{color:blue; text-decoration:none;font-family:Verdana; font-size:11px; padding-left:3px }
     .GridLink:active {color:blue; text-decoration:none;font-family:Verdana; font-size:11px; padding-left:3px }
     .GridLink:visited {color:Navy; text-decoration:none;font-family:Verdana; font-size:11px; padding-left:3px }
     .GridLink:hover{color:#blue;text-decoration:underline;font-family:Verdana; font-size:11px;padding-left:3px }

    </style>
    
        <style type="text/css">

 .GridHeader a:hover{color:#ff6355;text-decoration:underline;font-family:Verdana; font-size:11px; } 

 .GridHeader a{color:Navy; text-decoration:none;font-family:Verdana; font-size:11px; }

 .GridHeader a:visited{color:Navy; text-decoration:none;font-family:Verdana; font-size:11px; }

 .GridHeader a:active {color:Navy; text-decoration:none;font-family:Verdana; font-size:11px; }

 .GridHeader th{padding-left: 1px; padding-right:10px;VERTICAL-ALIGN: middle;text-align: left;white-space:nowrap} 

 .pagelink a

{

    FONT: bold 8pt/20px Tahoma;

    COLOR: blue;

    text-decoration:none

} 
.pagelink a:hover
{
    FONT: bold 8pt/20px Tahoma;

    COLOR: blue;

    text-decoration:underline
}
.pagelink a:visited

{

    FONT: bold 8pt/20px Tahoma;

    COLOR: navy;

    text-decoration:none

} 

  .pagelink span 

{

    FONT: bold 8pt/20px Tahoma;
    COLOR: navy;
    text-decoration:underline

} 

.ColumnStyle td{ padding-right:10px;white-space:nowrap}

 

</style>
<script type="text/javascript" language="javascript" >
    var timeInterval;
    var lastDiv = null;
    function HideLicenceDiv() {
        clearInterval(timeInterval);
        if (lastDiv == null) {
            e = document.all.tags('div');
            for (i = 0; i < e.length; i++) {
                if (e[i].id != 'undefined') {
                    if (e[i].id.indexOf('_trial') != -1) {
                        lastDiv = e[i];
                        lastDiv.style.cssText = "";
                        lastDiv.innerText = "";
                        timeInterval = window.setInterval('HideLicenceDiv()', 1000)
                        // e[i].style.display='none';
                        // alert('it\' made hidden')
                        break;
                    }
                }
            }
        }
        else {
            lastDiv.style.display = 'none'
            // alert( lastDiv.id);
        }
    }
    function setTimer() {
        // clearInterval(timeInterval);
        timeInterval = window.setInterval('HideLicenceDiv()', 0)
        //  alert('time is set');
    }

</script>
</head>
<body>
   <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div>
            &nbsp;<table id="tblGrid" runat="server" border="0" cellpadding="0" cellspacing="0"
                style="width: 100%">
                <tr>
                    <td valign="top">
                    </td>
                    <td valign="top">
                        <asp:UpdatePanel ID="UpdGrid" runat="server" UpdateMode="Conditional">
                            <ContentTemplate>
                                <asp:Panel ID="PanelDGVMain" runat="server" Width="100%">
                                    <asp:GridView ID="gvMain" runat="server" AutoGenerateColumns="False" Width="100%">
                                        <HeaderStyle BackColor="#FFE0C0" />
                                        <RowStyle Font-Names="Verdana" Font-Size="11pt" BackColor="WhiteSmoke" Font-Overline="False" />
                                        <PagerStyle BackColor="#F7F0D6" CssClass="pagelink" Font-Bold="True" />
                                        <AlternatingRowStyle BackColor="#EEEEEE" />
                                    </asp:GridView>

                                  <%--  <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                        CellPadding="1" CellSpacing="1" GridLines="None" Width="100%" Visible="true"
                                        PageSize="20">
                                        <HeaderStyle CssClass="AgilitySubPanelHeader GridHead GridHeader" />
                                        <RowStyle CssClass="PWCOddRow PWCLabel" Font-Names="Verdana" Font-Size="7.5pt" />
                                        <PagerStyle BackColor="#F7F0D6" CssClass="pagelink" Font-Bold="True" />
                                        <AlternatingRowStyle CssClass="PWCEvenRow PWCLabel" Font-Names="Verdana" Font-Size="7.5pt" />
                                    </asp:GridView>--%>

                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
        </div>
        <asp:Table ID="tblSearchPanel" runat="server" BorderStyle="Solid" BorderWidth="1px"
            CssClass="PWCSearchTableBG" Width="100%">
            <asp:TableRow ID="TableRow1" runat="server">
                <asp:TableCell ID="TableCell1" runat="server" Width="10px"></asp:TableCell>
                <asp:TableCell ID="TableCell2" runat="server"></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    </form>
</body>
</html>
