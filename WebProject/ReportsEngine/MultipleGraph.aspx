<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/DummyMaster.master" AutoEventWireup="true" CodeBehind="MultipleGraph.aspx.cs" Inherits="WebProject.ReportsEngine.MultipleGraph" %>
<%@ Register Assembly="EO.Web" Namespace="EO.Web" TagPrefix="eo" %>
<%@ Register TagPrefix="dotnetcharting" Namespace="dotnetCHARTING" Assembly="dotnetCHARTING" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

   <%-- <script language="JavaScript" type="text/javascript" src="../../JQuery/jquery.js"></script>--%>
    <script language="JavaScript" type="text/javascript" src="../../DotNetPages/ReportsEngine/FusionCharts/FusionCharts.js"></script>
    
       <script language="javascript" type="text/javascript">
         $(document).ready(function()
 {

        if(typeof(tblfooter) != "undefined")
        {
            if(tblfooter!=null)
            {
                tblfooter.style.display='none';  
            }
        }
        setTimer();
        });
         
                var timeInterval;
                var lastDiv=null;
                
        		function HideLicenceDiv()
		        {
		            clearInterval(timeInterval);
		            if(lastDiv==null)
		            {
    	                e=document.all.tags('div');
    	                for(i=0;i< e.length;i++)								
    	                {														
    	               	       if(e[i].id!='undefined')
    	               	       {							
                                   if( e[i].id.indexOf('_trial') != -1) 
                                   {
                                        lastDiv=e[i];
                                        //debugger;
                                        lastDiv.style.cssText="";
                                        lastDiv.innerText="";
                                        timeInterval=window.setInterval('HideLicenceDiv()',1000)
                                       // e[i].style.display='none';
                                       // alert('it\' made hidden')
                                        break;
                                   }
                               }
        	            }
        	        }
        	        else
        	        {
        	           lastDiv.style.display='none'
        	          // alert( lastDiv.id);
        	        }	
        	    }
                function setTimer()
		        {
			       // clearInterval(timeInterval);
			        timeInterval=window.setInterval('HideLicenceDiv()',0)
			        //alert('time is set');
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
                                                                                <eo:SlideMenu ID="SlideMenu1" runat="server" ControlSkinID="None" SlidePaneHeight="170"
                                                                                    Width="100%">
                                                                                    <LookItems>
                                                                                        <eo:MenuItem ItemID="_TopGroup">
                                                                                            <SubMenu Style-CssText="BORDER-RIGHT: tan 1px solid; BORDER-TOP: tan 1px solid; FONT-WEIGHT: bold; FONT-SIZE: 11px; BORDER-LEFT: tan 1px solid; CURSOR: hand; FONT-FAMILY: Verdana;border-bottom-color:gray;border-left-color:gray;border-right-color:gray;border-top-color:gray;">
                                                                                            </SubMenu>
                                                                                        </eo:MenuItem>
                                                                                        <eo:MenuItem Height="30" HoverStyle-CssText="border-bottom: tan 1px solid;border-bottom-color:gray;border-left-color:gray;border-right-color:gray;border-top-color:gray;"
                                                                                            Image-Mode="ItemBackground" Image-Url="~/App_Themes/Blue/images/SliverMenu.gif"
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
                                            <tr valign="top">
                                                <td>
                                                    <asp:Panel ID="Panel1" runat="server" Visible="True" Width="100%">
                                                        <table id="Table10" cellpadding="1" cellspacing="0" width="100%">
                                                            <tr valign="top">
                                                                <td valign="top">
                                                                    <table style="background-image: url(<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetTemplateImagePath("cellback_sectionHeading.gif")%>)"
                                                                        cellspacing="0" cellpadding="0" width="100%" border="0">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td valign="top">
                                                                                    <img src="<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetTemplateImagePath("clip_payment_"+ ImageDirection("positive") + ".gif")%>" /></td>
                                                                                <td nowrap width="27%">
                                                                                    <img height="1" src="<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetImagePath("spacer.gif")%>"
                                                                                        width="5" border="0" />
                                                                                    <asp:Label ID="Label4" runat="server" CssClass="PWCSubTitleHeader" Text="Search"></asp:Label></td>
                                                                                <td>
                                                                                    <img src="<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetTemplateImagePath("curve_sectionHeading_"+ ImageDirection("positive") + ".gif")%>" /></td>
                                                                                <td width="100%" style="background-image: url(<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetTemplateImagePath("cellback_sectionHeading1.gif")%>)">
                                                                                </td>
                                                                                <td>
                                                                                    <img src="<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetTemplateImagePath("rightend_sectionHeading_"+ ImageDirection("positive") + ".gif")%>" /></td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                    <asp:Table ID="tblSearchPanel" runat="server" BorderStyle="Solid" BorderWidth="1px"
                                                                        CssClass="PWCSearchTableBG" Width="100%">
                                                                        <asp:TableRow ID="TableRow1" runat="server">
                                                                            <asp:TableCell ID="TableCell1" runat="server" Width="10px"></asp:TableCell>
                                                                            <asp:TableCell ID="TableCell2" runat="server"></asp:TableCell>
                                                                        </asp:TableRow>
                                                                    </asp:Table>
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
                                                                            <asp:Panel ID="PanalOverall" runat="server" Height="100%" Width="100%" Visible="True">
                                                                                <table id="Table6" cellspacing="0" cellpadding="0" width="100%" border="0">
                                                                                    <tr>
                                                                                        <td colspan="1">
                                                                                            <table style="background-image: url(<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetTemplateImagePath("cellback_sectionHeading.gif")%>)"
                                                                                                cellspacing="0" cellpadding="0" width="100%" border="0">
                                                                                                <tbody>
                                                                                                    <tr>
                                                                                                        <td valign="top">
                                                                                                            <img src="<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetTemplateImagePath("clip_payment_"+ ImageDirection("positive") + ".gif")%>" /></td>
                                                                                                        <td nowrap width="27%">
                                                                                                            <img height="1" src="<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetImagePath("spacer.gif")%>"
                                                                                                                width="5" border="0" />
                                                                                                            <asp:Label ID="lblReportHead" runat="server" CssClass="PWCSubTitleHeader" Text=""></asp:Label></td>
                                                                                                        <td>
                                                                                                            <img src="<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetTemplateImagePath("curve_sectionHeading_"+ ImageDirection("positive") + ".gif")%>" /></td>
                                                                                                        <td width="100%" style="background-image: url(<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetTemplateImagePath("cellback_sectionHeading1.gif")%>)">
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <img src="<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetTemplateImagePath("rightend_sectionHeading_"+ ImageDirection("positive") + ".gif")%>" /></td>
                                                                                                    </tr>
                                                                                                </tbody>
                                                                                            </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <asp:Panel ID="pnlLowerBody" runat="server" Height="100%" Width="100%" Visible="True">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" class="PWCTemplateTable" style="width: 100%">
                                                                                                    <tr>
                                                                                                        <td colspan="1" style="padding-left: 10px; padding-top: 10px; padding-bottom: 10px;">
                                                                                                            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
                                                                                                                <tr>
                                                                                                                    <td valign="bottom">
                                                                                                                        <asp:Label ID="lblReportShortDetail" runat="server" Font-Bold="True" Font-Names="Verdana"
                                                                                                                            Font-Size="8pt" ForeColor="#CC6600" Text="Please select a report from left navigation panel."></asp:Label>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                                <tr>
                                                                                                                    <td>
                                                                                                                        <img src="<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetImagePath("spacer.gif")%>"
                                                                                                                            height="10px" /></td>
                                                                                                                </tr>
                                                                                                                <tr>
                                                                                                                    <td style="height: 10px">
                                                                                                                        <asp:Label ID="lblReportLongDetail" runat="server" Font-Names="Verdana" Font-Size="8pt"
                                                                                                                            ForeColor="Black" CssClass="PWCLabelWrapped" Font-Italic="True"></asp:Label>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td colspan="1">
                                                                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-top: tan 1px dotted;">
                                                                                                                <tr>
                                                                                                                    <td style="width: 90px; text-align: left">
                                                                                                                    </td>
                                                                                                                    <td style="text-align: left">
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-bottom: tan 1px dotted">
                                                                                                                <tr>
                                                                                                                    <td style="padding-left: 10px; padding-bottom: 2px;" colspan="2">
                                                                                                                        <asp:Label ID="lblReportDepth" runat="server" Font-Bold="True" Font-Names="Verdana"
                                                                                                                            Font-Size="8pt" ForeColor="#CC6600"></asp:Label>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="padding-top: 5px;">
                                                                                                            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%" id="tblGraph"
                                                                                                                runat="server">
                                                                                                                <tr>
                                                                                                                    <td valign="top">
                                                                                                                    </td>
                                                                                                                    <td style="padding-left: 25px" valign="top">
                                                                                                                        <asp:Panel ID="panelGraph" runat="server">
                                                                                                                            <asp:Label ID="lblErrorDetail" runat="server" Visible="False"></asp:Label>
                                                                                                                            <asp:Table ID="Table5" runat="server" Width="100%">
                                                                                                                                <asp:TableRow ID="TableRow11" runat="server" VerticalAlign="Top">
                                                                                                                                    <asp:TableCell ID="TableCell11" runat="server" Width="10px"></asp:TableCell>
                                                                                                                                    <asp:TableCell ID="TableCell21" runat="server"></asp:TableCell>
                                                                                                                                </asp:TableRow>
                                                                                                                            </asp:Table>
                                                                                                                        </asp:Panel>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%" id="tblGrid"
                                                                                                                runat="server">
                                                                                                                <tr>
                                                                                                                    <td valign="top">
                                                                                                                    </td>
                                                                                                                    <td valign="top">
                                                                                                                        <asp:Panel ID="PanelDGVMain" runat="server" Width="100%" Visible="false">
                                                                                                                            <input id="btnExportDataPopup" class="PWCButton" type="button" value="Export" onclick='ShowNewExportDataPopup()'
                                                                                                                                style="margin-bottom: 5px; margin-left: 5px" />
                                                                                                                            <asp:GridView ID="gvMain" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                                                                                CellPadding="1" CellSpacing="1" GridLines="None" Width="100%" Visible="true"
                                                                                                                                PageSize="20">
                                                                                                                                <HeaderStyle CssClass="AgilitySubPanelHeader GridHead GridHeader" />
                                                                                                                                <RowStyle CssClass="PWCOddRow PWCLabel" Font-Names="Verdana" Font-Size="7.5pt" />
                                                                                                                                <PagerStyle BackColor="#F7F0D6" CssClass="pagelink" Font-Bold="True" />
                                                                                                                                <AlternatingRowStyle CssClass="PWCEvenRow PWCLabel" Font-Names="Verdana" Font-Size="7.5pt" />
                                                                                                                            </asp:GridView>
                                                                                                                        </asp:Panel>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </asp:Panel>
                                                                                            &nbsp;
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
</asp:Content>

