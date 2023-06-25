<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GridViewer.aspx.cs" Inherits="WebProject.ReportsEngine.GridViewerWebForm" %>

<%@ Import Namespace="PWC.PresentationServices.Web.UI.Common" %>
<%@ Register Assembly="EO.Web" Namespace="EO.Web" TagPrefix="eo" %>
<%@ Register TagPrefix="dotnetcharting" Namespace="dotnetCHARTING" Assembly="dotnetCHARTING" %>
<!--
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Drilldown Data</title>

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
		        function ShowNewExportDataPopup(Link)
                {
                  //  window.open(Link,null,'left=300, top=150, height=400, width= 600, status=n o, resizable= no, scrollbars= no, toolbar= no,location= no, menubar= no'); return false;
                     window.open(Link,null,''); return false;

                }
    </script>

    <style type="text/css">
        .GridHead
        {
            color: Navy;
            text-decoration: none;
            font-family: Verdana;
            font-size: 11px;
            padding-left: 3px;
        }
        .GridLink
        {
            color: blue;
            text-decoration: none;
            font-family: Verdana;
            font-size: 11px;
            padding-left: 3px;
        }
        .GridLink:active
        {
            color: blue;
            text-decoration: none;
            font-family: Verdana;
            font-size: 11px;
            padding-left: 3px;
        }
        .GridLink:visited
        {
            color: Navy;
            text-decoration: none;
            font-family: Verdana;
            font-size: 11px;
            padding-left: 3px;
        }
        .GridLink:hover
        {
            color: #blue;
            text-decoration: underline;
            font-family: Verdana;
            font-size: 11px;
            padding-left: 3px;
        }
    </style>
    <style type="text/css">
        .GridHeader a:hover
        {
            color: #ff6355;
            text-decoration: underline;
            font-family: Verdana;
            font-size: 11px;
        }
        .GridHeader a
        {
            color: Navy;
            text-decoration: none;
            font-family: Verdana;
            font-size: 11px;
        }
        .GridHeader a:visited
        {
            color: Navy;
            text-decoration: none;
            font-family: Verdana;
            font-size: 11px;
        }
        .GridHeader a:active
        {
            color: Navy;
            text-decoration: none;
            font-family: Verdana;
            font-size: 11px;
        }
        .GridHeader th
        {
            padding-left: 1px;
            padding-right: 10px;
            vertical-align: middle;
            text-align: left;
            white-space: nowrap;
        }
        .pagelink a
        {
            font: bold 8pt/20px Tahoma;
            color: blue;
            text-decoration: none;
        }
        .pagelink a:hover
        {
            font: bold 8pt/20px Tahoma;
            color: blue;
            text-decoration: underline;
        }
        .pagelink a:visited
        {
            font: bold 8pt/20px Tahoma;
            color: navy;
            text-decoration: none;
        }
        .pagelink span
        {
            font: bold 8pt/20px Tahoma;
            color: navy;
            text-decoration: underline;
        }
        .ColumnStyle td
        {
            padding-right: 10px;
            white-space: nowrap;
        }
    </style>
    <link href="../../App_Themes/Blue/StyleSheets/StyleSheet_eng.css" rel="stylesheet"
        type="text/css" />
</head>
<body style="margin: 0 0 0 0">
    <form id="form1" runat="server">
        <eo:Splitter ID="Splitter1" runat="server"  BorderColor="#A0A0A0"
            BorderStyle="Solid" BorderWidth="1px" CollapseButtonHoverImage="00080103" CollapseButtonImage="00080102"
            ControlSkinID="None" DividerImage="00080101" DividerSize="8" ExpandButtonHoverImage="00080105"
            ExpandButtonImage="00080104" >
            <eo:SplitterPane ID="SplitterPane1" runat="server" ScrollBars="None" >
                <div>
                    <table cellpadding="1" cellspacing="1" width="100%">
                        <tr valign="top">
                            <td>
                                <asp:Panel ID="Panel1" runat="server" Visible="True" Width="100%">
                                    <table id="Table10" cellpadding="1" cellspacing="0" width="100%">
                                        <tr valign="top">
                                            <td valign="top">
                                                <table background="../../App_Themes/Blue/TemplateImages/cellback_SectionHeading.gif"
                                                    cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td style="height: 24px">
                                                            <img src="../../App_Themes/Blue/TemplateImages/clip_payment_LTR.gif" />
                                                        </td>
                                                        <td style="white-space: nowrap; height: 24px" width="10%">
                                                            &nbsp;
                                                            <asp:Label ID="Label4" runat="server" CssClass="PWCSubTitleHeader">&nbsp;Search</asp:Label>
                                                        </td>
                                                        <td align="right" style="height: 24px" width="3%">
                                                            <img src="../../App_Themes/Blue/TemplateImages/curve_SectionHeading_LTR.gif" /></td>
                                                        <td align="right" background="../../App_Themes/Blue/TemplateImages/CellBack_sectionHeading1.gif"
                                                            valign="bottom" width="90%">
                                                        </td>
                                                        <td style="height: 24px">
                                                            <img src="../../App_Themes/Blue/TemplateImages/RightEnd_SectionHeading_LTR.gif" /></td>
                                                    </tr>
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
                </div>
            </eo:SplitterPane>
            <eo:SplitterPane ID="SplitterPane2" runat="server" ScrollBars="Horizontal">
                <asp:Panel ID="PanalOverall" runat="server" Height="100%" Width="100%" Visible="True">
                    <table id="Table6" cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tr>
                            <td>
                                <table cellspacing="0" cellpadding="0" width="100%" background="../../App_Themes/Blue/TemplateImages/cellback_SectionHeading.gif">
                                    <tbody>
                                        <tr>
                                            <td style="height: 24px">
                                                <img src="../../App_Themes/Blue/TemplateImages/clip_payment_LTR.gif" />
                                            </td>
                                            <td style="white-space: nowrap; height: 24px" width="10%">
                                                &nbsp;&nbsp;&nbsp;
                                                <asp:Label ID="lblReportHead" runat="server" CssClass="PWCSubTitleHeader">Reports & Dashboards (Beta)</asp:Label>
                                            </td>
                                            <td style="height: 24px" align="right" width="3%">
                                                <img src="../../App_Themes/Blue/TemplateImages/curve_SectionHeading_LTR.gif" /></td>
                                            <td valign="bottom" align="right" width="90%" background="../../App_Themes/Blue/TemplateImages/CellBack_sectionHeading1.gif">
                                                <asp:Label ID="txtError" runat="server" Text="" CssClass="PWCLabelValueRed"></asp:Label></td>
                                            <td style="height: 24px">
                                                <img src="../../App_Themes/Blue/TemplateImages/RightEnd_SectionHeading_LTR.gif" /></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table id="tblGrid" runat="server" border="0" cellpadding="0" cellspacing="0" style="width: 100%"
                                    class="PWCTemplateTable">
                                    <tr>
                                        <td valign="top">
                                            <asp:Panel ID="PanelDGVMain" runat="server" Width="100%">
                                                <input id="btnExportDataPopup" class="PWCButton" onclick="ShowNewExportDataPopup()"
                                                    style="margin-bottom: 5px; margin-top: 5px; margin-left: 5px" type="button" value="Export" />
                                                <asp:Label ID="lblErrorDetail" runat="server" Visible="False"></asp:Label>
                                                <asp:GridView ID="gvMain" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                    CellPadding="1" CellSpacing="1" GridLines="None" PageSize="20" Visible="true"
                                                    Width="100%">
                                                    <HeaderStyle CssClass="AgilitySubPanelHeader GridHead GridHeader" />
                                                    <RowStyle CssClass="PWCOddRow PWCLabel" Font-Names="Verdana" Font-Size="7.5pt" />
                                                    <PagerStyle BackColor="#F7F0D6" CssClass="pagelink" Font-Bold="True" />
                                                    <AlternatingRowStyle CssClass="PWCEvenRow PWCLabel" Font-Names="Verdana" Font-Size="7.5pt" />
                                                </asp:GridView>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                </table>
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
            </eo:SplitterPane>
        </eo:Splitter>

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

    </form>
</body>
</html>