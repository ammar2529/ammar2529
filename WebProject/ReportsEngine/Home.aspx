<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/eForms.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebProject.ReportsEngine.Home" %>
<%@ Register Assembly="EO.Web" Namespace="EO.Web" TagPrefix="eo" %>
<%@ Register TagPrefix="dotnetcharting" Namespace="dotnetCHARTING" Assembly="dotnetCHARTING" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder4" runat="Server">
 
    <script language="Javascript" src="FusionCharts/FusionCharts.js"></script>
    <script language="Javascript" src="FusionCharts/default.js"></script>

    <script language="javascript" type="text/javascript">
    /*
        <link href="../../JSCalendar/menu.css" rel="stylesheet" />
    <link href="../../EForms.css" type="text/css" rel="stylesheet" />
    
    < % =InitScript % >
    */
    </script>

    <script language="javascript" type="text/javascript">
        var imgPlusPath = "../../Images/plus.gif";
        var imgMinusPath ="../../Images/minus.gif";
        
        var lastExpandedTableId=null;
        var lastExpandedImgId=null;
        
        function ShowHidSubCondition(img,tableId)
        {
        //debugger
         //alert(img.src)
        // typeof(myFrm) != "undefined"
            if (typeof(document.getElementById(tableId)) && document.getElementById(tableId)!=null )
            {

                if(document.getElementById(tableId).style.display=='none' ) // expand
                {
               
                   document.getElementById(tableId).style.display='' ; //SHOW THE HIDDEN TABLE
                   img.src=imgMinusPath; //SET THE PATH TO THE MINUS IMAGE

                  if(lastExpandedTableId!=null && lastExpandedTableId!=tableId)
                  {
                    
                    document.getElementById(lastExpandedTableId).style.display='none'
                    document.getElementById(lastExpandedImgId).src=imgPlusPath;
                  }
                   lastExpandedTableId=tableId;
                   lastExpandedImgId=img.id;
                } 
                else//collapse
                {
                   document.getElementById(tableId).style.display='none' 
                   img.src=imgPlusPath;
                }
            }
        }   
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
			      //  alert('time is set');
		        }
		        function ShowNewExportDataPopupOld(Link)
                {
                  //  window.open(Link,null,'left=300, top=150, height=400, width= 600, status=n o, resizable= no, scrollbars= no, toolbar= no,location= no, menubar= no'); return false;
                     window.open(Link,null,''); return false;

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
                                                                                <table cellspacing="0" cellpadding="0" width="100%" background="../../App_Themes/Blue/TemplateImages/cellback_SectionHeading.gif"
                                                                                    style="display: none">
                                                                                    <tr>
                                                                                        <td width="5%" style="height: 24px">
                                                                                            <img src="../../App_Themes/Blue/TemplateImages/clip_payment_LTR.gif" />
                                                                                        </td>
                                                                                        <td style="width: 35%">
                                                                                            <asp:Label ID="Label1" runat="server" CssClass="PWCSubTitleHeader">Categories</asp:Label>
                                                                                        </td>
                                                                                        <td align="right" width="3%">
                                                                                            <asp:ImageButton ID="Imagebutton1" runat="server" ImageUrl="../../App_Themes/Blue/TemplateImages/curve_sectionHeading_LTR.gif">
                                                                                            </asp:ImageButton>
                                                                                        </td>
                                                                                        <td valign="bottom" align="right" width="53%" background="../../App_Themes/Blue/TemplateImages/CellBack_sectionHeading1.gif">
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:ImageButton ID="Imagebutton3" runat="server" ImageUrl="../../App_Themes/Blue/TemplateImages/rightend_sectionHeading_LTR.gif">
                                                                                            </asp:ImageButton>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
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
                                                                                <%-- <eo:SlideMenu ID="SlideMenu1" runat="server" ControlSkinID="None" SlidePaneHeight="170"
                                                                                    Width="100%" >
                                                                                    <LookItems>
                                                                                        <eo:MenuItem ItemID="_TopGroup">
                                                                                            <SubMenu Style-CssText="BORDER-RIGHT: tan 1px solid; BORDER-TOP: tan 1px solid; FONT-WEIGHT: bold; FONT-SIZE: 11px; BORDER-LEFT: tan 1px solid; CURSOR: hand; FONT-FAMILY: tahoma">
                                                                                            </SubMenu>
                                                                                        </eo:MenuItem>
                                                                                        <eo:MenuItem Height="31" HoverStyle-CssText="border-bottom: tan 1px solid" Image-ExpandedUrl="~/App_Themes/Blue/images/MenuSelected.gif"
                                                                                            Image-HoverUrl="~/App_Themes/Blue/images/MenuHover.gif" Image-Mode="ItemBackground" Image-Url="~/App_Themes/Blue/images/MenuNormal.gif"
                                                                                            ItemID="_TopLevelItem" LeftIcon-Padding-Left="6" NormalStyle-CssText="border-bottom: tan 1px solid">
                                                                                            <SubMenu Style-CssText="padding-right: 10px; padding-left: 10px; font-size: 11px; padding-bottom: 2px; padding-top: 2px; border-bottom: tan 1px solid; font-family: tahoma">
                                                                                            </SubMenu>
                                                                                        </eo:MenuItem>
                                                                                        <eo:MenuItem Height="20" HoverStyle-CssText="font-weight: normal; text-decoration: underline"
                                                                                            ItemID="_Default" LeftIcon-Padding-Right="5" NormalStyle-CssText="font-weight: normal; text-decoration: none">
                                                                                        </eo:MenuItem>
                                                                                        <eo:MenuItem Height="20" ItemID="plain_text" LeftIcon-Padding-Right="5" NormalStyle-CssText="font-weight: normal;"
                                                                                            Text-NoWrap="False">
                                                                                        </eo:MenuItem>
                                                                                    </LookItems>
                                                                                </eo:SlideMenu>--%>
                                                                                <!-------------Demo---------- -->
                                                                                <!-------------/Demo---------- -->
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
                                                                   <%-- <table style="background-image: url(<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetTemplateImagePath("cellback_sectionHeading.gif")%>)"
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
                                                                    </table>--%>
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
                                                                             <table id="SiteControlHeader" class="PWC SiteControlHeader" cellSpacing="0" cellPadding="0" width="100%"  border="0" style="border-right: #8298B0 1px solid;border-left: #8298B0 1px solid;border-bottom:0px; border-top: #8298B0 1px solid;">
                                                                                    <tr>
                                                                                        <td align="left" style="padding: 3px 10px;font-family:Calibri;font-size: 12px;height:30px;color: black;position: relative;background: url('../../../App_Themes/Silver/Images/row_1.JPG') repeat-x top;vertical-align:middle;" id="ListCounters_title" nowrap="nowrap" width="100%">
                                                                                        <asp:Label ID="lblReportHead" runat="server" CssClass="PWCSubTitleHeader" Text="Reports & Dashboards"></asp:Label>
                                                                                        </td>
                                                                                    </tr>
                                                                                    
                                                                              </table>  
                                                                              <table class="ListBorderTemplate_EPG" cellspacing="0" cellpadding="0" align="center" border="0" width="100%">                       
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
                                                                                                <table border="0" cellpadding="0" cellspacing="0" class="PWCTemplateTable" style="width: 100%">
                                                                                                    <tr>
                                                                                                        <td colspan="1" style="padding-left: 10px; padding-top: 10px; padding-bottom: 10px;">
                                                                                                            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
                                                                                                                <tr>
                                                                                                                    <td valign="bottom">
                                                                                                                        &nbsp;
                                                                                                                        <asp:Label ID="lblReportShortDetail" runat="server" Font-Bold="True" Font-Names="Verdana"
                                                                                                                            Font-Size="8pt" ForeColor="#CC6600" Text="Please select a report from left navigation panel."></asp:Label>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                                <tr>
                                                                                                                    <td style="height: 10px">
                                                                                                                        <img src="../../App_Themes/Blue/Images/spacer.gif" height="5" />
                                                                                                                    </td>
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
                                                                                                                        <asp:Panel ID="PanelDGVMain" runat="server" Width="100%">
                                                                                                                            <input id="btnExportDataPopup" class="PWCButton" type="button" value="Export" onclick='ShowNewExportDataPopup()'
                                                                                                                                style="margin-bottom: 5px; margin-left: 5px" />
                                                                                                                            <asp:GridView ID="gvMain" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                                                                                CellPadding="1" CellSpacing="1" GridLines="None" Width="100%" Visible="true"
                                                                                                                                PageSize="20">
                                                                                                                                <HeaderStyle CssClass="AgilitySubPanelHeader GridHead GridHeader" />
                                                                                                                                <RowStyle CssClass="PWCOddRow PWCLabel" Font-Names="Verdana" Font-Size="7.5pt" />
                                                                                                                                <PagerStyle CssClass="pagelink" Font-Bold="True" />
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
                                                                                            <asp:Panel ID="pnlWelcome" runat="server" Height="100%" Width="100%" Visible="True">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" class="" style="width: 100%;">
                                                                                                    <tr>
                                                                                                        <td valign="top">
                                                                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%">
                                                                                                                <tr>
                                                                                                                    <td width="50%" style="padding-right: 10px; padding-left: 10px; padding-top: 10px; padding-bottom: 10px;">
                                                                                                                        <asp:Label ID="Label3" runat="server" CssClass="PWCLabelValue" Font-Bold="True" Font-Italic="False"
                                                                                                                            Font-Size="10pt" Font-Underline="False" ForeColor="Peru">Welcome to Reports & Dashboards</asp:Label></td>
                                                                                                                    <td width="50%" style="padding-right: 10px; padding-top: 0px; padding-left: 10px;
                                                                                                                        padding-bottom: 0px; " align="center" rowspan="3" valign="top">
                                                                                                                        <%--<%=LoadChart_S_1()%>--%>
                                                                                                                        
                                                                                                                        </td>
                                                                                                                </tr>
                                                                                                                <tr>
                                                                                                                    <td style="padding-right: 10px; padding-left: 10px; padding-top: 10px; padding-bottom: 0px;" valign="top"
                                                                                                                        rowspan="2" colspan="2">
                                                                                                                        <asp:Label ID="Label2" runat="server" Font-Bold="True" CssClass="PWCLabelValue" Font-Size="8pt" ForeColor="Peru">The system provides wide range of analytical and graphical reports inbuilt with the extended capability of generating custom reports. It provides KPI monitoring and graphical presentation of analytical data, that can be monitored online and contribute towards Decision Making.</asp:Label><br />
                                                                                                                        <br />
                                                                                                                        </td>
                                                                                                                </tr>
                                                                                                                <tr>
                                                                                                                </tr>
                                                                                                                <tr>
                                                                                                                    <td colspan="2" rowspan="1" style="padding-right: 10px; padding-left: 10px; padding-bottom: 10px;
                                                                                                                        padding-top: 0px;" valign="top">
                                                                                                                        <asp:Label ID="Label5" runat="server" CssClass="PWCLabelValue" Font-Bold="True" ForeColor="DimGray"
                                                                                                                            Font-Italic="False" Font-Size="8pt">We aim to simplify visibility over Business Processes across Enterprise</asp:Label>
                                                                                                                        &nbsp; &nbsp;<asp:Label ID="Label7" runat="server" CssClass="PWCLabelValue" Font-Bold="True" Font-Italic="False"
                                                                                                                            Font-Size="10pt" Font-Underline="False" ForeColor="Peru">(Driving Business Decisions)</asp:Label></td>
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

if(typeof(myFrm) != "undefined")
{
    if(myFrm!=null)
    {
        initScript();
    }
}
setTimer();
    </script>

</asp:Content>