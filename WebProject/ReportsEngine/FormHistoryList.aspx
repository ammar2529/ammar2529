<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/DummyMaster.master" AutoEventWireup="true" CodeBehind="FormHistoryList.aspx.cs" Inherits="WebProject.ReportsEngine.FormHistoryList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
        <title>Agility eForms</title>
</head>


<body>
      <form class="Accent" id="ListPaymentRequestForm" method="post" runat="server">
       <table style="margin:10px" cellspacing="0" cellpadding="0" width="820" border="0">
           <tr>
               <td align="center">
                 <table  cellspacing="0" cellpadding="0" width="100%"  border="0">
                 <tr>
                <td>
                    <table id="SiteControlHeader" class="PWC SiteControlHeader" cellSpacing="0" cellPadding="0" width="100%"  border="0" style="border-right: #8298B0 1px solid;border-left: #8298B0 1px solid;border-bottom:0px; border-top: #8298B0 1px solid;">
                        <tr>
                            <td align="left" style="padding: 3px 10px;font-family:Calibri;font-size: 12px;height:30px;color: black;position: relative;background: url('../../../App_Themes/Silver/Images/row_1.JPG') repeat-x top;vertical-align:middle;" id="ListCounters_title" nowrap="nowrap" width="100%">
                            <asp:Label ID="lblFormName" runat="server" CssClass="PWCSubTitleHeader" Text="Projects List"></asp:Label>
                            </td>
                        </tr>
                        
                    </table>            
                    <table border="0" cellspacing="0" cellpadding="0" width="100%" class="ListBorderTemplate_EPG">
                       <tr valign="top">
                                        <td>
                                            <table id="Table4" cellspacing="1" cellpadding="2" width="820" border="0" class="listpanelbuttons">
                                                <tr>
                                                    <td width="25%" align="left">
                                                        <asp:Label ID="Label2" runat="server" CssClass="PWCFormLabel" Font-Bold="True">Form Code</asp:Label></td>
                                                    <td width="25%" align="left">
                                                        <asp:Label ID="Label3" runat="server" CssClass="PWCFormLabel" Font-Bold="True">Created By</asp:Label></td>
                                                    <td width="25%" align="left">
                                                        <asp:Label ID="label27" runat="server" CssClass="PWCFormLabel" Font-Bold="True">Current Status</asp:Label></td>
                                                    <td width="25%" rowspan="2" align="left">
<%--                                                                                        <script src='<%=ResolveUrl("http://eFormsServices.agilitylogistics.com/livechat/CuteSoft_Client/CuteChat/")%>Support-Image-Button.js.aspx?UserName=<%=Session["UserDisplayName"]%>'></script>
--%>                                                                                            </td>
                                                </tr>
                                                <tr valign="top">
                                                    <td align="left">
                                                        <asp:Label ID="lblFormCode" runat="server" Font-Bold="True" CssClass="PWCLabelValue"
                                                            ForeColor="Red">Form Name</asp:Label></td>
                                                    <td align="left">
                                                        <asp:Label ID="lblCreatedBy" runat="server" Font-Bold="True" CssClass="PWCLabelValue"
                                                            ForeColor="DarkBlue">Form Name</asp:Label></td>
                                                    <td align="left">
                                                        <asp:Label ID="lblCurrentStatus" runat="server" Font-Bold="True" CssClass="PWCLabelValue"
                                                            ForeColor="DarkBlue">Form Name</asp:Label></td>
                                                </tr>
                                                <tr valign="top">
                                                    <td class="AgilityRowSpacerTop" colspan="4">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        <asp:Label ID="Label11" runat="server" CssClass="PWCFormLabel" Font-Bold="True">Sender Name</asp:Label></td>
                                                    <td align="left">
                                                        <asp:Label ID="Label12" runat="server" CssClass="PWCFormLabel" Font-Bold="True">Recipient Name</asp:Label></td>
                                                    <td align="left">
                                                        <asp:Label ID="label222" runat="server" CssClass="PWCFormLabel" Font-Bold="True">Date Created</asp:Label></td>
                                                    <td align="left">
                                                        <asp:Label ID="Label1" runat="server" CssClass="PWCFormLabel" Font-Bold="True">Last Action Date</asp:Label><asp:Label ID="lblCreatedFor" runat="server" CssClass="SearchText1" Font-Bold="True"
                                                            ForeColor="DarkBlue" Visible="False">Form Name</asp:Label>
                                                        <asp:Label ID="Label10" runat="server" CssClass="PWCFormLabel" Visible="False" Font-Bold="True">Created For</asp:Label></td>
                                                </tr>
                                                <tr valign="top">
                                                    <td align="left">
                                                        <asp:Label ID="lblSenderName" runat="server" Font-Bold="True" CssClass="PWCLabelValue"
                                                            ForeColor="DarkBlue">Form Name</asp:Label></td>
                                                    <td align="left">
                                                        <asp:Label ID="lblRecipientName" runat="server" Font-Bold="True" CssClass="PWCLabelValue"
                                                            ForeColor="DarkBlue">Form Name</asp:Label></td>
                                                    <td align="left">
                                                        <asp:Label ID="lblDateCreated" runat="server" Font-Bold="True" CssClass="PWCLabelValue"
                                                            ForeColor="DarkBlue">Form Name</asp:Label></td>
                                                    <td align="left">
                                                        <asp:Label ID="lblReceivedDate" runat="server" CssClass="PWCLabelValue" Font-Bold="True"
                                                            ForeColor="DarkBlue"></asp:Label></td>
                                                </tr>
                                            </table>
                                                        </td>
                                    </tr>
                                </table>
                            
                </td>
            </tr>
            <tr><td class="AgilityRowSpacer"></td></tr>
            <tr>
                <td>
                   <table id="Table1" class="PWC SiteControlHeader" cellSpacing="0" cellPadding="0" width="100%"  border="0" style="border-right: #8298B0 1px solid;border-left: #8298B0 1px solid;border-bottom:0px; border-top: #8298B0 1px solid;">
                        <tr>
                            <td style="padding: 3px 10px;font-family:Calibri;font-size: 12px;height:30px;color: black;position: relative;background: url('../../../App_Themes/Silver/Images/row_1.JPG') repeat-x top;vertical-align:middle;" id="ListCounters_title" colspan="4" valign="top" align="left">
                                        <asp:Label ID="Label6" runat="server" CssClass="PWCSubTitleHeader" Text="Submission History"></asp:Label>
                            </td>
                        </tr>
                    </table>      
                    <table class="ListBorderTemplate_EPG" cellspacing="0" cellpadding="0" align="center" border="0" width="100%">                       
                        <tr valign="top">
                            <td align="left">
                              <table cellspacing="0" cellpadding="0" width="100%"  border="0" class="listpanelbuttons">
                                <tr>
                                  <td>                                
                                    <asp:DataGrid ID="DataGrid1" runat="server" ForeColor="Black" BackColor="White" PageSize="20"
                                        GridLines="None" CellSpacing="1" AutoGenerateColumns="False"
                                        CellPadding="3" Width="100%">
                                        <AlternatingItemStyle CssClass="PWCOddRow" Font-Bold="False" Font-Italic="False" Font-Names="verdana" Font-Overline="False" Font-Strikeout="False" Font-Underline="False"></AlternatingItemStyle>
                                        <ItemStyle CssClass="PWCEvenRow" VerticalAlign="Top" Font-Bold="False" Font-Italic="False" Font-Names="verdana" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Font-Size="10px"></ItemStyle>
                                        <HeaderStyle CssClass="DataGridHeader_BGImage" ForeColor="Navy" Font-Names="Verdana" Font-Size="11px"></HeaderStyle>
                                        <Columns>
                                            <asp:BoundColumn Visible="False" DataField="FormCode" SortExpression="FormCode" HeaderText="Form Code">
                                                <HeaderStyle Wrap="False" ></HeaderStyle>
                                                <ItemStyle Font-Bold="False" Font-Italic="False" Font-Names="verdana" Font-Overline="False"
                                                    Font-Strikeout="False" Font-Underline="True"  />
                                                    
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="SenderId" SortExpression="SenderId" HeaderText="From"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="RecipientId" SortExpression="RecipientId" HeaderText="To">
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="StateName" SortExpression="StateName" HeaderText="Status">
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="DateCreated" SortExpression="DateCreated" HeaderText="Date Time"
                                                DataFormatString="{0:dd/MM/yyyy hh:mm:ss tt}"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="Comments" SortExpression="Comments" HeaderText="Submission Comments">
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="IP" SortExpression="IP" HeaderText="IP ADDRESS" Visible="False"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="UserId" SortExpression="UserId" HeaderText="USER" Visible="False"></asp:BoundColumn>
                                        </Columns>
                                        <PagerStyle NextPageText="Next" Font-Size="Smaller" PrevPageText="Prev " HorizontalAlign="Left"
                                            ForeColor="ActiveCaption" BackColor="White" PageButtonCount="5" CssClass="normal">
                                        </PagerStyle>
                                    </asp:DataGrid>
                                    
                                    </td></tr>
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
    </form>
</body>
</html>
