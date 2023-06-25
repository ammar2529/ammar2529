<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="iFrameHome.aspx.cs" Inherits="WebProject.ReportsEngine.iFrameHome" %>

<%@ Register Assembly="EO.Web" Namespace="EO.Web" TagPrefix="eo" %>
<%@ Register TagPrefix="dotnetcharting" Namespace="dotnetCHARTING" Assembly="dotnetCHARTING" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <link id="layoutStylesheet" href="../App_Themes/eForms_Theme/StyleSheets/StyleSheet_eng.css" type="text/css" rel="stylesheet" /> 
    <link id="Link1" href="../AsyncWidgets/Widgets/resources/css/common.standard.css" type="text/css" rel="stylesheet" />
   
</head>
<body>
    <form id="form1" runat="server">

     <script language="javascript" type="text/javascript">
         var imgPlusPath = "../../Images/plus.gif";
         var imgMinusPath = "../../Images/minus.gif";

         var lastExpandedTableId = null;
         var lastExpandedImgId = null;

         function ShowHidSubCondition(img, tableId) {
             //debugger
             //alert(img.src)
             // typeof(myFrm) != "undefined"
             if (typeof (document.getElementById(tableId)) && document.getElementById(tableId) != null) {

                 if (document.getElementById(tableId).style.display == 'none') // expand
                 {

                     document.getElementById(tableId).style.display = ''; //SHOW THE HIDDEN TABLE
                     img.src = imgMinusPath; //SET THE PATH TO THE MINUS IMAGE

                     if (lastExpandedTableId != null && lastExpandedTableId != tableId) {

                         document.getElementById(lastExpandedTableId).style.display = 'none'
                         document.getElementById(lastExpandedImgId).src = imgPlusPath;
                     }
                     lastExpandedTableId = tableId;
                     lastExpandedImgId = img.id;
                 }
                 else//collapse
                 {
                     document.getElementById(tableId).style.display = 'none'
                     img.src = imgPlusPath;
                 }
             }
         }
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
                             //debugger;
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
         function ShowNewExportDataPopupOld(Link) {
             //  window.open(Link,null,'left=300, top=150, height=400, width= 600, status=n o, resizable= no, scrollbars= no, toolbar= no,location= no, menubar= no'); return false;
             window.open(Link, null, ''); return false;

         }
    </script>

    <table id="Table1" cellspacing="0" cellpadding="0" width="100%" align="left" style="float: none">
        <tr>
            <td valign="top">
                <table id="Table2" cellspacing="0" cellpadding="1" width="100%" align="center">
                    <tr>
                        <td colspan="2">
                            <table id="Table3" cellspacing="2" cellpadding="0" width="100%">
                                <tr valign="top">
                                    <td width="200px">
                                        <table cellspacing="1" cellpadding="1" width="100%">
                                            <tr valign="top">
                                                <td>
                                                    <asp:Panel ID="SearchPanel" runat="server" Width="100%" Visible="True">
                                                        <table id="Table9" cellspacing="0" cellpadding="0" width="100%" border="0">
                                                            <tr valign="top">
                                                                <td>
                                                                    <table id="Table4" cellspacing="0" cellpadding="1" width="100%">
                                                                        <tr>
                                                                            <td colspan="2">
                                                                                <eo:SlideMenu ID="SlideMenu1" runat="server" ControlSkinID="None" SlidePaneHeight="170"  Width="100%">
                                                                                    <LookItems>
                                                                                        <eo:MenuItem ItemID="_TopGroup">
                                                                                            <SubMenu Style-CssText="BORDER-RIGHT: tan 1px solid; BORDER-TOP: tan 1px solid; FONT-WEIGHT: bold; FONT-SIZE: 11px; BORDER-LEFT: tan 1px solid; CURSOR: hand; FONT-FAMILY: Verdana;border-bottom-color:gray;border-left-color:gray;border-right-color:gray;border-top-color:gray;">
                                                                                            </SubMenu>
                                                                                        </eo:MenuItem>
                                                                                        <eo:MenuItem Height="30" HoverStyle-CssText="border-bottom: tan 1px solid;border-bottom-color:gray;border-left-color:gray;border-right-color:gray;border-top-color:gray;"
                                                                                            Image-Mode="ItemBackground" Image-Url="~/App_Themes/eForms_Theme/images/SliverMenu.gif"
                                                                                            ItemID="_TopLevelItem" LeftIcon-Padding-Left="6" NormalStyle-CssText="border-bottom: tan 1px solid;border-bottom-color:gray;border-left-color:gray;border-right-color:gray;border-top-color:gray;">
                                                                                            <SubMenu Style-CssText=" padding-right: 10px; padding-left: 10px; font-size: 11px; padding-bottom: 2px; padding-top: 2px; border-bottom: tan 1px solid; font-family: Verdana;background-color:#F6F8F9;border-bottom-color:gray;border-left-color:gray;border-right-color:gray;border-top-color:gray ">
                                                                                            </SubMenu>
                                                                                        </eo:MenuItem>
                                                                                        <eo:MenuItem Height="20" HoverStyle-CssText="font-weight: normal; text-decoration: none"
                                                                                            ItemID="_Default" LeftIcon-Padding-Right="5" NormalStyle-CssText="font-weight: normal; text-decoration: none">
                                                                                        </eo:MenuItem>
                                                                                        <eo:MenuItem Height="20" ItemID="plain_text" LeftIcon-Padding-Right="5" NormalStyle-CssText="font-weight: normal;"
                                                                                            Text-NoWrap="False">
                                                                                        </eo:MenuItem>
                                                                                    </LookItems>
                                                                                    <TopGroup Style-CssText="border-bottom-color:gray;border-left-color:gray;border-right-color:gray;border-top-color:gray;">
                                                                                    </TopGroup>
                                                                                </eo:SlideMenu>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            </table>
                                    </td>
                                    <td>
                                        <table cellspacing="0" cellpadding="0" width="100%">
                                            <tr valign="top">
                                                <td height="100%">
                                                    <table height="100%" cellspacing="0" cellpadding="0" width="100%" align="center">
                                                        <tr valign="top">
                                                            <td>
                                                                <table height="100%" width="100%">
                                                                    <tr valign="top">
                                                                        <td>
                                                                        <div class="w-panel-head w-top-corner">
                                                                            <table style="width: 100%;" border="0" cellspacing="0" cellpadding="0">
                                                                                <tbody>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <table style="width: 100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td class="w-head-text">
                                                                                                            <asp:Label ID="lblReportHead" runat="server" CssClass="PWCSubTitleHeader" Text="Reports & Dashboards"></asp:Label>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </td>
                                                                                        <td style="width: 100%">
                                                                                            &nbsp;
                                                                                        </td>
                                                                                        <td>
                                                                                            <span class="w-ui-icon w-ui-panel-icon-opened w-ui-panel-icon" >&nbsp;</span>
                                                                                        </td>
                                                                                    </tr>
                                                                                </tbody>
                                                                            </table>
                                                                            </div>
                                                                            
                                                                              <table class="w-form-table" cellspacing="0" cellpadding="0" align="center" border="0" width="100%">                       
                                                                                <tr valign="top">
                                                                                    <td align="left">
                                                                                      <table cellspacing="0" cellpadding="0" width="100%"  border="0" class="listpanelbuttons">
                                                                                        <tr>
                                                                                              <td>     
                                                                                                 <asp:Panel ID="PanalOverall" runat="server" Height="100%" Width="100%" Visible="True">
                                                                                <table id="Table6" cellspacing="0" cellpadding="0" width="100%" border="0">
                                                                                    <tr>
                                                                                        <td>
                                                                                            <asp:Panel ID="pnlLowerBody" runat="server" Height="100%" Width="100%" Visible="True">
                                                                                            </asp:Panel>
                                                                                            <asp:Panel ID="pnlWelcome" runat="server" Height="100%" Width="100%" Visible="True">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" class="" style="width: 100%;">
                                                                                                    <tr>
                                                                                                        <td valign="top">
                                                                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%">
                                                                                                                <tr>
                                                                                                                    <td width="100%" 
                                                                                                                        style="padding-right: 10px; padding-left: 10px; padding-top: 10px; padding-bottom: 10px;">
                                                                                                                        <asp:Label ID="Label3" runat="server" CssClass="PWCLabelValue" Font-Bold="True" Font-Italic="False"
                                                                                                                            Font-Size="10pt" Font-Underline="False" ForeColor="Peru">Welcome to Reports & Dashboards</asp:Label>
                                                                                                                        
                                                                                                                        <br />
                                                                                                                        <br />    
                                                                                                                                <asp:Label ID="Label1" runat="server" Font-Bold="True" CssClass="PWCLabelValue" Font-Size="8pt" ForeColor="Peru">The system provides wide range of analytical and graphical reports inbuilt with the extended capability of generating custom reports. It provides KPI monitoring and graphical presentation of analytical data, that can be monitored online and contribute towards Decision Making.</asp:Label><br />
                                                                                                                        <br />
                                                                                                                          <br />
                                                                                                                         <asp:Label ID="Label5" runat="server" CssClass="PWCLabelValue" Font-Bold="True" 
                                                                                                                            Font-Italic="False" Font-Size="8pt" ForeColor="DimGray">We aim to simplify visibility over Business Processes across Enterprise</asp:Label>
                                                                                                                              <br />

                                                                                                                            </td>
                                                                                                                    
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </asp:Panel>
                                                                                              <asp:Panel ID="pnlUnAuthrized" runat="server" Height="100%" Width="100%" Visible="false">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" class="PWCTemplateTable" style="width: 100%;
                                                                                                    height: 400px;">
                                                                                                    <tr>
                                                                                                        <td valign="top">
                                                                                                            Not Authorised.
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </asp:Panel>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </asp:Panel> 
                                                                                              </td>
                                                                                          </tr>
                                                                                       </table>
                                                                                     </td>
                                                                                 </tr>
                                                                                </table>         
                                                                            
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>

        <script language="javascript" type="text/javascript">

            if (typeof (myFrm) != "undefined") {
                if (myFrm != null) {
                    initScript();
                }
            }
            setTimer();
        </script>
    </form>
</body>
</html>

