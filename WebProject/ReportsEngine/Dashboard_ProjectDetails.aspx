<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/DummyMaster.master" AutoEventWireup="true" CodeBehind="Dashboard_ProjectDetails.aspx.cs" Inherits="WebProject.ReportsEngine.Dashboard_ProjectDetails1" %>
<%@ Import Namespace="PWC.PresentationServices.Web.UI.Common" %>
<%@ Register Assembly="EO.Web" Namespace="EO.Web" TagPrefix="eo" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <script language="Javascript" src="FusionCharts/FusionCharts.js"></script>
    <script language="Javascript" src="FusionCharts/default.js"></script>
    <script language="Javascript" src="FusionMaps/FusionMaps.js"></script>

    <script language="javascript" type="text/javascript">
    
        if(typeof(trMasterPageHeader) != "undefined")
    {
        if(trMasterPageHeader!=null)
        {
            trMasterPageHeader.style.display='none';  
        }
    }
    
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
		        function ShowNewExportDataPopup(Link)
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
                                                                                            <table cellspacing="0" cellpadding="0" width="100%" background="../../App_Themes/Blue/TemplateImages/cellback_SectionHeading.gif">
                                                                                                <tr>
                                                                                                    <td style="height: 24px">
                                                                                                        <img src="../../App_Themes/Blue/TemplateImages/clip_payment_LTR.gif" />
                                                                                                    </td>
                                                                                                    <td width="25%" style="height: 24px; white-space: nowrap; text-align: left; padding-bottom: 3px">
                                                                                                        &nbsp;
                                                                                                        <asp:Label ID="lblReportHead" runat="server" CssClass="PWCSubTitleHeader">Management Dashboard</asp:Label>
                                                                                                    </td>
                                                                                                    <td align="right" width="3%" style="height: 24px">
                                                                                                        <img src="../../App_Themes/Blue/TemplateImages/curve_SectionHeading_LTR.gif" /></td>
                                                                                                    <td valign="bottom" align="right" width="90%" background="../../App_Themes/Blue/TemplateImages/CellBack_sectionHeading1.gif">
                                                                                                        <asp:Label ID="txtError" runat="server" Text="" CssClass="PWCLabelValueRed"></asp:Label></td>
                                                                                                    <td style="height: 24px">
                                                                                                        <img src="../../App_Themes/Blue/TemplateImages/RightEnd_SectionHeading_LTR.gif" /></td>
                                                                                                </tr>
                                                                                            </table>
                                                                                                      <table width="100%" border="0" cellspacing="0" cellpadding="0" class='bordertop' style="border-right: #eeeeee 1px solid; border-left: #eeeeee 1px solid">
          <tr>
                      <td width="130" class="tab"><div align="center"><a href="Home.aspx">Home</a></div></td>
            <td width="130" class="tab"><div align="center"><a href="Dashboard_ProcessUsage.aspx">Process Usage</a></div></td>
            <td width="130" class="tabselected"><div align="center"><a href="Dashboard_ProjectDetails.aspx">Project Details</a></div></td>
            <td width="130" class="tab"><div align="center"><a href="Dashboard_eFormsUserDetails.aspx">eForms User Details</a></div></td>
            <td width="130" class="tab" style="DISPLAY :none"><div align="center"><a href="Dashboard_SSDTeamDetails.aspx">SSD Team Details</a></div></td>
            <td>&nbsp;</td>
          </tr>
        </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <asp:Panel ID="pnlLowerBody" runat="server" Height="100%" Width="100%" Visible="True">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" class="PWCTemplateTable" style="width: 100%">
                                                                                                    <tr>
                                                                                                        <td >
                                                                                                            
                                                                                                                        
                                                                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                                            <tr>
                                                                                                                                <td align="left" style="padding-right: 5px; padding-left: 5px; height: 30px; background-color: #eeeeee"
                                                                                                                                    valign="middle">
                                                                                                                                                            <asp:Label ID="Label3" runat="server" CssClass="PWCLabelValue" Text="Business Group :" Width="111px"></asp:Label><asp:RadioButtonList ID="rblBusinessGroup" runat="server" CssClass="PWCLabelValue"
                                                                                                                                                                ForeColor="Black" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                                                                                                                                <asp:ListItem Selected="True" Value="All">All</asp:ListItem>
                                                                                                                                                                <asp:ListItem Value="Corporate">Corporate</asp:ListItem>
                                                                                                                                                                <asp:ListItem Value="GIL">GIL</asp:ListItem>
                                                                                                                                                                <asp:ListItem Value="DGS">DGS</asp:ListItem>
                                                                                                                                                                <asp:ListItem Value="Infrastructure">Infrastructure</asp:ListItem>
                                                                                                                                                            </asp:RadioButtonList>
                                                                                                                                                            <asp:DropDownList ID="ddlInfrastructure" runat="server">
                                                                                                                                                            </asp:DropDownList></td>
                                                                                                                                <td align="left" style="padding-right: 5px; padding-left: 5px; height: 30px; background-color: #eeeeee"
                                                                                                                                    valign="middle">
                                                                                                                                </td>
                                                                                                                                <td align="left" style="padding-right: 5px; padding-left: 5px; height: 30px; background-color: #eeeeee"
                                                                                                                                    valign="middle">
                                                                                                                                                            <asp:Label ID="Label2" runat="server" CssClass="PWCLabelValue" Text="Project Category :"></asp:Label>
                                                                                                                                                            <asp:RadioButtonList ID="rblBusinessCategory" runat="server" CssClass="PWCLabelValue"
                                                                                                                                                                ForeColor="Black" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                                                                                                                                                <asp:ListItem Selected="True">Both</asp:ListItem>
                                                                                                                                                                <asp:ListItem Value="Business Process Automation">BPA</asp:ListItem>
                                                                                                                                                                <asp:ListItem Value="Shared Services Development">SSD</asp:ListItem>
                                                                                                                                                            </asp:RadioButtonList></td>
                                                                                                                            </tr>
                                                                                                                            <tr>
                                
                                                                                                                                
                                                                                                                                     <td valign="top" style="padding-right: 5px; padding-left: 5px; padding-bottom: 5px; padding-top: 5px;" align="center">
                                                                                                                                 <%=LoadChart_S_2()%>
                                                                                                                                </td>
                                                                                                                                <td style="padding-top: 5px; padding-bottom: 5px; padding-right: 5px; padding-left: 5px;">
                                                                                                                                    <table border="0" cellpadding="0" cellspacing="0">
                                                                                                                                        <tr>
                                                                                                                                            <td style="background-color: #eeeeee;">
                                                                                                                                                <img src="../../App_Themes/Blue/Images/spacer.gif" width="1" height="300" />
                                                                                                                                            </td>
                                                                                                                                        </tr>
                                                                                                                                    </table>
                                                                                                                                </td>
                                                                                                                                
                                                                                                                                                                                                                                <td valign="top" style="padding-right: 5px; padding-left: 5px; padding-bottom: 5px; padding-top: 5px;" align="center" width="100%">
                                                                                                                                                                                                                                    <%=LoadChart_S_1()%>
                                                                                                                                                                                                                                    <table border="0" cellpadding="0" cellspacing="0" width="400" style="display: none">
                                                                                                                                        <tr>
                                                                                                                                            <td style="padding-left: 8px; width: 114px; height: 26px; background-color: #ffc20f">
                                                                                                                                                <span style="font-size: 8pt; font-family: Arial"><strong>More Charts...</strong></span></td>
                                                                                                                                            <td colspan="2">
                                                                                                                                            </td>
                                                                                                                                        </tr>
                                                                                                                                        <tr>
                                                                                                                                            <td style="background-color: #ffc20f" colspan="3">
                                                                                                                                                <img height="2" src="../../App_Themes/Blue/Images/spacer.gif"></td>
                                                                                                                                        </tr>
                                                                                                                                    </table>
                                                                                                                                    <table border="0" cellpadding="0" cellspacing="0" width="400" style="display: none">
                                                                                                                                        <tr>
                                                                                                                                            <td colspan="5">
                                                                                                                                                <img height="4" src="../../App_Themes/Blue/Images/spacer.gif"></td>
                                                                                                                                        </tr>
                                                                                                                                        <tr style="height: 27px">
                                                                                                                                            <td id="Link1" onclick="Home()" style="background-image: url(../../App_Themes/Blue/Images/ReportViewer/ReportLinkBack.jpg);
                                                                                                                                                width: 150px; background-repeat: no-repeat; vertical-align: middle; cursor: hand; text-align: center; font-family:Verdana; font-size:11px; font-weight:bold;">
                                                                                                                                                Under Dev</td>
                                                                                                                                            <td>
                                                                                                                                            </td>
                                                                                                                                            <td id="Td1" onclick="ProjectDetails()" style="background-image: url(../../App_Themes/Blue/Images/ReportViewer/ReportLinkBack.jpg);
                                                                                                                                                width: 150px; background-repeat: no-repeat; vertical-align: middle; cursor: hand; text-align: center; font-family:Verdana; font-size:11px; font-weight:bold;">
                                                                                                                                                Under Dev</td>
                                                                                                                                            <td>
                                                                                                                                            </td>
                                                                                                                                            <td id="Td2" onclick="eFormsUserDetails()" style="background-image: url(../../App_Themes/Blue/Images/ReportViewer/ReportLinkBack.jpg);
                                                                                                                                                width: 150px; background-repeat: no-repeat; vertical-align: middle; cursor: hand; text-align: center; font-family:Verdana; font-size:11px; font-weight:bold;">
                                                                                                                                                Under Dev</td>
                                                                                                                                        </tr>
                                                                                                                                        <tr>
                                                                                                                                            <td colspan="5">
                                                                                                                                                <img height="4" src="../../App_Themes/Blue/Images/spacer.gif" /></td>
                                                                                                                                        </tr>
                                                                                                                                        <tr style="height: 27px">
                                                                                                                                            <td id="Td3" onclick="SSDTeamDetails()" style="background-image: url(../../App_Themes/Blue/Images/ReportViewer/ReportLinkBack.jpg);
                                                                                                                                                width: 150px; background-repeat: no-repeat; vertical-align: middle; cursor: hand; text-align: center; font-family:Verdana; font-size:11px; font-weight:bold;">
                                                                                                                                                Under Dev</td>
                                                                                                                                            <td>
                                                                                                                                            </td>
                                                                                                                                            <td id="Td4" onclick="alert(this)" style="background-image: url(../../App_Themes/Blue/Images/ReportViewer/ReportLinkBack.jpg);
                                                                                                                                                width: 150px; background-repeat: no-repeat; vertical-align: middle; cursor: hand; text-align: center; font-family:Verdana; font-size:11px; font-weight:bold;">
                                                                                                                                                Under Dev</td>
                                                                                                                                            <td>
                                                                                                                                            </td>
                                                                                                                                            <td id="Td5" onclick="ServiceRequests()" style="background-image: url(../../App_Themes/Blue/Images/ReportViewer/ReportLinkBack.jpg);
                                                                                                                                                width: 150px; background-repeat: no-repeat; vertical-align: middle; cursor: hand; text-align: center; font-family:Verdana; font-size:11px; font-weight:bold;">
                                                                                                                                                Under Dev</td>
                                                                                                                                        </tr>
                                                                                                                                    </table>
                                                                                                                                    
                                                                                                                                </td>
                                                                                                                           
                                                                                                                            </tr>
                                                                                                                            <tr>
                                                                                                                                <td align="center" style="padding-right: 5px; padding-left: 5px" valign="top">
                                                                                                                                <%=LoadChart_S_3()%>
                                                                                                                                </td>
                                                                                                                                <td style="padding-bottom: 10px; padding-top: 10px">
                                                                                                                                </td>
                                                                                                                                <td align="center" style="padding-right: 5px; padding-left: 5px" valign="top">
                                                                                                                                <%=LoadChart_S_4()%>
                                                                                                                                </td>
                                                                                                                            </tr>
                                                                                                                         
                                                                                                                            <tr>
                                                                                                                                <td colspan="3" style="padding-left:10px;padding-right:10px"  height="1" >
                                                                                                                                <hr style="border-top: #eeeeee 1px solid; border-left-width: 1px; border-left-color: black; border-bottom-width: 1px; border-bottom-color: black; height: 1px; border-right-width: 1px; border-right-color: black"  />
                                                                                                                                
                                                                                                                                
                                                                                                                                </td>
                                                                                                                            </tr>
                                                                                                                            <tr>
                                                                                                                                <td colspan="3" style="padding-right: 5px; padding-left: 5px" valign="top" align="left">
                                                                                                                                     
                                                                                                                                </td>
                                                                                                                            </tr>
                                                                                                                            <tr>
                                                                                                                            <td style="padding-left:10px;padding-right:10px" valign="top">
                                                                                                                            <%=LoadChart_B_1()%>
                                                                                                                            <%=LoadChart_B_5()%>
                                                                                                                            </td>
                                                                                                                             <td style="padding-top: 10px; padding-bottom: 10px">
                                                                                                                                    <table border="0" cellpadding="0" cellspacing="0">
                                                                                                                                        <tr>
                                                                                                                                            <td style="background-color: #eeeeee;">
                                                                                                                                                <img src="../../App_Themes/Blue/Images/spacer.gif" width="1" height="300" />
                                                                                                                                            </td>
                                                                                                                                        </tr>
                                                                                                                                    </table>
                                                                                                                                </td>
                                                                                                                            <td style="padding-left:10px;padding-right:10px" valign="top">
                                                                                                                             <%=LoadChart_B_2()%>
                                                                                                                             <%=LoadChart_B_4()%>
                                                                                                                            </td>
                                                                                                                               <tr>
                                                                                                                                <td colspan="3" style="padding-left:10px;padding-right:10px"  height="1" >
                                                                                                                                <hr style="border-top: #eeeeee 1px solid; border-left-width: 1px; border-left-color: black; border-bottom-width: 1px; border-bottom-color: black; height: 1px; border-right-width: 1px; border-right-color: black"  />
                                                                                                                                <%=LoadChart_B_3()%>
                                                                                                                                
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
