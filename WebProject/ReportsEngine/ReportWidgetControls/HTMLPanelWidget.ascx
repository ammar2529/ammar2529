<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HTMLPanelWidget.ascx.cs" Inherits="WebProject.ReportsEngine.ReportWidgetControls.HTMLPanelWidget" %>

<asp:Panel ID="pnlMain"  runat="server" >
   
        <table id="Table6" cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td colspan="1">
                    <table cellspacing="0" cellpadding="0" width="100%" 
                                                                                                
                        background="/eFormsMISNew/App_Themes/Blue/Images/cellback_SectionHeading.gif">
                        <tr>
                            <td  style="height: 24px">
                                <img src="/eFormsMISNew/App_Themes/Blue/Images/clip_payment.gif" />
                            </td>
                            <td width="10%" style="height: 24px; white-space: nowrap;text-align:left">
                                &nbsp;
                                <asp:Label ID="lblPanelHeading" runat="server" CssClass="PWCSubTitleHeader" ></asp:Label>
                            </td>
                            <td align="right" width="3%" style="height: 24px">
                                <img src="/eFormsMISNew/App_Themes/Blue/Images/curve_SectionHeading.gif" /></td>
                            <td valign="bottom" align="right" width="90%" 
                                                                                                        
                                background="/eFormsMISNew/App_Themes/Blue/Images/CellBack_sectionHeading1.gif">
                            </td>
                            <td style="height: 24px">
                                <img src="/eFormsMISNew/App_Themes/Blue/Images/RightEnd_SectionHeading.gif" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" class="PWCTemplateTable" style="width: 100%"
                        id="tblLowerPanelArea" runat="server">
                        <tr id="tblRowDescription" >
                            <td colspan="1" style="padding-left: 10px; padding-top: 10px; padding-bottom: 10px;">
                                <table id="tblDescription" border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%" runat="server">
                                    <tr id="tblRowShortDetail">
                                        <td valign="bottom">
                                            <asp:Label ID="lblPanelShortDetail" runat="server" Font-Bold="True" Font-Names="Verdana"
                                                Font-Size="8pt" ForeColor="#CC6600"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr id= "tblRowDescriptionSpacer">
                                        <td>
                                            <img src="/eFormsMISNew/App_Themes/Blue/Images/spacer.gif" height="10px" />
                                        </td>
                                    </tr>
                                    <tr id="tblRowLongDetail">
                                        <td style="height: 10px" >
                                            <asp:Label ID="lblPanelLongDetail" runat="server" Font-Names="Verdana" Font-Size="8pt"
                                                ForeColor="Black" CssClass="PWCLabelWrapped" Font-Italic="True"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="tblRowDottedLine">
                            <td colspan="1">
                                <hr style="color: #fff; background-color: #fff; border: 1px dotted tan; border-style: none none dotted;" 
                                    width="100%" />
                            </td>
                        </tr>
                        <tr id="tblRowPanelBodyHeading">
                            <td colspan="1">
                                <table border="0" cellpadding="0" cellspacing="0" 
                                    style="border-top: tan 1px dotted;" width="100%">
                                    <tr>
                                        <td style="width: 90px; text-align: left">
                                        </td>
                                        <td style="text-align: left">
                                        </td>
                                    </tr>
                                </table>
                                <table border="0" cellpadding="0" cellspacing="0" 
                                    style="border-bottom: tan 1px dotted" width="100%">
                                    <tr>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="padding-left: 10px; padding-bottom: 2px;">
                                            <asp:Label ID="lblPanelBodyHeading" runat="server" Font-Bold="True" 
                                                Font-Names="Verdana" Font-Size="8pt" ForeColor="#CC6600"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="tblRowPanelBody">
                            <td>
                                <asp:Panel ID="pnlPanelBody" runat="server" BorderColor="#003300">
                                    <table id="tblPanelBody" style="width:100%;" runat="server">
                                        <tr>

                                            <td>
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
    
</asp:Panel>
