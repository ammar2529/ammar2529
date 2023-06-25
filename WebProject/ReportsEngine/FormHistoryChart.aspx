<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormHistoryChart.aspx.cs" Inherits="WebProject.ReportsEngine.FormHistoryChart" %>


<%@ Register Assembly="dotnetCHARTING" Namespace="dotnetCHARTING" TagPrefix="dotnetCHARTING" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PWC eForms 4.0</title>
  <link rel="stylesheet" type="text/css" href="../../App_Themes/Styles Templates/PWCMenu_eng.css" />
    <link href="../../App_Themes/Blue/StyleSheets/StyleSheet_eng.css" type="text/css"
        rel="stylesheet">
        <style type="text/css" >
        
   
        .DataGridHeader_BGImage
            {
                /*
                font-family: Arial,Verdana, Helvetica, sans-serif;
                font-size: 11px;
                     
                */
                font-weight:bold;
                background-image: url(../../App_Themes/Blue/images/cellback_SubSectionHead1.gif);
                
             }
         .DataGridHeader_BGImage a,a:active,a:visited{text-decoration:none;font-family:Verdana; font-size:11px;  }
         .DataGridHeader_BGImage  a:hover{text-decoration:underline;font-family:Verdana; font-size:11px; }
                          

            Body
            {
	            margin-left : 0;
	            margin-top : 0;
	            margin-right : 0;
                background-color: white;
            }
            .SearchText1
            {
	            font-family: Arial,Verdana, Arial;
                font-size:11px;
                font-weight:bold;
                color :Black;      
            }

            .SearchText2
            {
	            font-family: Arial,Verdana, Arial;
                font-size:11px;
                font-weight:normal;  
                color : #757575;
                text-decoration: none;
            }
            .SearchText3
            {
	            font-family: Arial,Verdana, Arial;
                font-size:11px;
                font-weight:bold;
                color :#003399;      
            }

            .SearchTextBold
            {
	            color :Black ;
	            font-family: Arial,Verdana, Arial;
                font-size:11px;
                font-weight:bold ;   
            }
            .RemovePadding
            {
                padding:-1px;
               
            }
        </style>
</head>
<body>
    <form class="Accent" id="ListPaymentRequestForm" method="post" runat="server">
        <table id="Table1" height="500" cellspacing="0" cellpadding="0" width="820" align="left"
            border="0">
            <tr valign="top">
                <td width="591">
                    <table id="Table2" height="579" cellspacing="0" cellpadding="1" width="546" align="center"
                        border="0">
                        <tr valign="top">
                            <td colspan="2">
                                <table id="Table3" height="500" cellspacing="2" cellpadding="0" width="820" border="0">
                                    <tr valign="top">
                                        <td width="82%">
                                            <table height="580" cellspacing="0" cellpadding="0" width="820">
                                                <tr valign="top">
                                                    <td >
                                                        <table style="background-image: url(../../App_Themes/Blue/TemplateImages/cellback_sectionHeading.gif)"
                                                            cellspacing="0" cellpadding="0" width="100%" border="0">
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                        <img src="../../App_Themes/Blue/TemplateImages/clip_payment_LTR.gif" /></td>
                                                                    <td nowrap width="27%" style="padding-bottom: 3px">
                                                                        <img height="1" src="../../App_Themes/Blue/Images/spacer.gif" width="5" border="0" />
                                                                        <asp:Label ID="lblFormName" runat="server" CssClass="PWCSubTitleHeader" Text="Projects List"></asp:Label></td>
                                                                    <td>
                                                                        <img src="../../App_Themes/Blue/TemplateImages/curve_sectionHeading_LTR.gif" /></td>
                                                                    <td width="100%" background="../../App_Themes/Blue/TemplateImages/cellback_sectionHeading1.gif">
                                                                    </td>
                                                                    <td>
                                                                        <img src="../../App_Themes/Blue/TemplateImages/rightend_sectionHeading_LTR.gif" /></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                        <table class="PWCTemplateTable" height="100%" cellspacing="0" cellpadding="0" width="820"
                                                            align="left" background="../images/img_inbox.gif" border="0">
                                                            <tr valign="top">
                                                                <td>
                                                                    <table height="100%" width="820">
                                                                        <tr valign="top">
                                                                            <td height="100%">
                                                                                <table id="Table4" border="0" cellpadding="0" cellspacing="1" height="80" width="820">
                                                                                    <tr>
                                                                                        <td height="10" width="25%">
                                                                                            <asp:Label ID="Label2" runat="server" CssClass="PWCFormLabel">Form Code</asp:Label></td>
                                                                                        <td height="10" width="25%">
                                                                                            <asp:Label ID="Label3" runat="server" CssClass="PWCFormLabel">Created By</asp:Label></td>
                                                                                        <td height="10" width="25%">
                                                                                            <asp:Label ID="label27" runat="server" CssClass="PWCFormLabel">Current Status</asp:Label></td>
                                                                                        <td align="center" rowspan="2" width="25%">

                                                                                            <script src='<%=ResolveUrl("http://eFormsServices.agilitylogistics.com/livechat/CuteSoft_Client/CuteChat/")%>Support-Image-Button.js.aspx?UserName=<%=Session["UserDisplayName"]%>'></script>

                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr valign="top">
                                                                                        <td height="23">
                                                                                            <asp:Label ID="lblFormCode" runat="server" CssClass="PWCLabelValue" Font-Bold="True"
                                                                                                ForeColor="Red">Form Name</asp:Label></td>
                                                                                        <td height="23">
                                                                                            <asp:Label ID="lblCreatedBy" runat="server" CssClass="PWCLabelValue" Font-Bold="True"
                                                                                                ForeColor="DarkBlue">Form Name</asp:Label></td>
                                                                                        <td height="23">
                                                                                            <asp:Label ID="lblCurrentStatus" runat="server" CssClass="PWCLabelValue" Font-Bold="True"
                                                                                                ForeColor="DarkBlue">Form Name</asp:Label></td>
                                                                                    </tr>
                                                                                    <tr valign="top">
                                                                                        <td class="AgilityRowSpacerTop" colspan="4" height="23">
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <asp:Label ID="Label11" runat="server" CssClass="PWCFormLabel">Sender Name</asp:Label></td>
                                                                                        <td>
                                                                                            <asp:Label ID="Label12" runat="server" CssClass="PWCFormLabel">Recipient Name</asp:Label></td>
                                                                                        <td>
                                                                                            <asp:Label ID="label222" runat="server" CssClass="PWCFormLabel">Date Created</asp:Label></td>
                                                                                        <td>
                                                                                            <asp:Label ID="Label1" runat="server" CssClass="PWCFormLabel">Last Action Date</asp:Label><asp:Label
                                                                                                ID="lblCreatedFor" runat="server" CssClass="SearchText1" Font-Bold="True" ForeColor="DarkBlue"
                                                                                                Visible="False">Form Name</asp:Label>
                                                                                            <asp:Label ID="Label10" runat="server" CssClass="PWCFormLabel" Visible="False">Created For</asp:Label></td>
                                                                                    </tr>
                                                                                    <tr valign="top">
                                                                                        <td>
                                                                                            <asp:Label ID="lblSenderName" runat="server" CssClass="PWCLabelValue" Font-Bold="True"
                                                                                                ForeColor="DarkBlue">Form Name</asp:Label></td>
                                                                                        <td>
                                                                                            <asp:Label ID="lblRecipientName" runat="server" CssClass="PWCLabelValue" Font-Bold="True"
                                                                                                ForeColor="DarkBlue">Form Name</asp:Label></td>
                                                                                        <td>
                                                                                            <asp:Label ID="lblDateCreated" runat="server" CssClass="PWCLabelValue" Font-Bold="True"
                                                                                                ForeColor="DarkBlue">Form Name</asp:Label></td>
                                                                                        <td>
                                                                                            <asp:Label ID="lblReceivedDate" runat="server" CssClass="PWCLabelValue" Font-Bold="True"
                                                                                                ForeColor="DarkBlue"></asp:Label></td>
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
                                                <tr valign="top">
                                                    <td height="453">
                                                        <table style="background-image: url(../../App_Themes/Blue/TemplateImages/cellback_sectionHeading.gif)"
                                                            cellspacing="0" cellpadding="0" width="100%" border="0">
                                                            <tbody>
                                                                <tr>
                                                                    <td>
                                                                        <img src="../../App_Themes/Blue/TemplateImages/clip_payment_LTR.gif" /></td>
                                                                    <td nowrap width="27%" style="padding-bottom: 3px">
                                                                        <img height="1" src="../../App_Themes/Blue/Images/spacer.gif" width="5" border="0" />
                                                                        <asp:Label ID="Label6" runat="server" Text="Submission History" CssClass="PWCSubTitleHeader"></asp:Label></td>
                                                                    <td>
                                                                        <img src="../../App_Themes/Blue/TemplateImages/curve_sectionHeading_LTR.gif" /></td>
                                                                    <td valign="bottom" align="right" width="100%" background="../../App_Themes/Blue/TemplateImages/cellback_sectionHeading1.gif">
                                                                        <table id="Table6" height="16" cellspacing="0" cellpadding="0" border="0">
                                                                            <tbody>
                                                                                <tr valign="bottom">
                                                                                    <td align="right">
                                                                                        <img src="../../App_Themes/Blue/TemplateImages/TabCurveLeft.gif" /></td>
                                                                                    <td background="../../App_Themes/Blue/TemplateImages/Tab.gif" style="display:none">
                                                                                        <asp:LinkButton ID="LinkButton1" OnClick="lbtnGraph_Click" runat="server" CssClass="SearchText2"
                                                                                            Font-Bold="True">Graph &nbsp </asp:LinkButton></td>
                                                                                    <td align="center" style="display:none">
                                                                                        <img src="../../App_Themes/Blue/TemplateImages/TabCenter.gif" /></td>
                                                                                    <td background="../../App_Themes/Blue/TemplateImages/Tab.gif">
                                                                                        <asp:LinkButton ID="LinkButton2" OnClick="lbtnList_Click" runat="server" CssClass="SearchText2" Font-Bold="True"> &nbsp Click for Details &nbsp </asp:LinkButton></td>
                                                                                    <td align="center" style="display:none">
                                                                                        <img src="../../App_Themes/Blue/TemplateImages/TabCenter.gif" /></td>
                                                                                    <td background="../../App_Themes/Blue/TemplateImages/Tab.gif"  style="display:none">
                                                                                        <asp:LinkButton ID="LinkButton3" OnClick="lbtnFlowDiagram_Click" runat="server" CssClass="SearchText2"
                                                                                            Font-Bold="True"> &nbsp Detailed List &nbsp </asp:LinkButton></td>
                                                                                    <td align="center"  style="display:none">
                                                                                        <img src="../../App_Themes/Blue/TemplateImages/tabcenter.gif" /></td>
                                                                                    <td background="../../App_Themes/Blue/TemplateImages/Tab.gif"  style="display:none">
                                                                                        <asp:LinkButton ID="LinkButton4" OnClick="lbtnEmail_Click" runat="server" CssClass="SearchText2"
                                                                                            Font-Bold="True"> &nbsp Reminder EMail &nbsp </asp:LinkButton></td>
                                                                                    <td align="left">
                                                                                        <img src="../../App_Themes/Blue/TemplateImages/tabcurveright.gif" /></td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </td>
                                                                    <td>
                                                                        <img src="../../App_Themes/Blue/TemplateImages/rightend_sectionHeading_LTR.gif" /></td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                        <table class="PWCTemplateTable" height="324" cellspacing="0" cellpadding="0" width="820"
                                                            align="center" background="../images/img_inbox.gif" border="0">
                                                            <tr valign="top">
                                                                <td>
                                                                    <table height="315" width="820">
                                                                        <tr valign="top">
                                                                            <td height="311">
                                                                                <asp:Panel ID="Panel1" runat="server" Width="100%" Visible="True" Height="58.09%">
                                                                                    &nbsp;&nbsp;
                                                                                    <dotnetCHARTING:Chart ID="dncFormHistoryChart" runat="server" Height="300px" MarginBottom="0"
                                                                                        MarginLeft="0" MarginRight="0" MarginTop="0" Width="820px" TempDirectory="temp">
                                                                                        <DefaultTitleBox>
                                                                                            <Label GlowColor="" Type="UseFont">
                                                                                            </Label>
                                                                                            <HeaderLabel GlowColor="" Type="UseFont">
                                                                                            </HeaderLabel>
                                                                                            <Background ShadingEffectMode="None" />
                                                                                            <HeaderBackground ShadingEffectMode="None" />
                                                                                        </DefaultTitleBox>
                                                                                        <DefaultLegendBox Padding="4" Visible="True" CornerBottomRight="Cut">
                                                                                            <LabelStyle Font="Arial, 8pt, style=Bold" />
                                                                                            <Background ShadingEffectMode="None" />
                                                                                            <DefaultEntry ShapeType="None">
                                                                                                <LabelStyle GlowColor="" Type="UseFont" />
                                                                                                <Background ShadingEffectMode="None" />
                                                                                            </DefaultEntry>
                                                                                            <HeaderLabel GlowColor="" Type="UseFont">
                                                                                            </HeaderLabel>
                                                                                            <HeaderEntry ShapeType="None" Visible="False">
                                                                                                <LabelStyle GlowColor="" Type="UseFont" />
                                                                                                <Background ShadingEffectMode="None" />
                                                                                            </HeaderEntry>
                                                                                            <HeaderBackground ShadingEffectMode="None" />
                                                                                        </DefaultLegendBox>
                                                                                        <SmartForecast Start="" TimeSpan="00:00:00" />
                                                                                        <NoDataLabel GlowColor="" Type="UseFont">
                                                                                        </NoDataLabel>
                                                                                        <DefaultElement ShapeType="None">
                                                                                            <SmartLabel GlowColor="" Type="UseFont">
                                                                                            </SmartLabel>
                                                                                            <DefaultSubValue Name="">
                                                                                            </DefaultSubValue>
                                                                                            <LegendEntry ShapeType="None">
                                                                                                <LabelStyle GlowColor="" Type="UseFont" />
                                                                                                <Background ShadingEffectMode="None" />
                                                                                            </LegendEntry>
                                                                                        </DefaultElement>
                                                                                       
                                                                                        <ChartArea CornerTopLeft="Square" StartDateOfYear="">
                                                                                            <Label Font="Tahoma, 8pt" GlowColor="" Type="UseFont">
                                                                                            </Label>
                                                                                            <DefaultElement ShapeType="None">
                                                                                                <SmartLabel GlowColor="" Type="UseFont">
                                                                                                </SmartLabel>
                                                                                                <DefaultSubValue Name="">
                                                                                                <Line Color="93, 28, 59" Length="4"></Line>
                                                                                                </DefaultSubValue>
                                                                                                <LegendEntry ShapeType="None">
                                                                                                    <LabelStyle GlowColor="" Type="UseFont" />
                                                                                                    <Background ShadingEffectMode="None" />
                                                                                                </LegendEntry>
                                                                                            </DefaultElement>
                                                                                            <Background ShadingEffectMode="None" />
                                                                                            <TitleBox Position="Left">
                                                                                                <Label Color="Black" GlowColor="" Type="UseFont">
                                                                                                </Label>
                                                                                                <HeaderLabel GlowColor="" Type="UseFont">
                                                                                                </HeaderLabel>
                                                                                                <Background ShadingEffectMode="None" />
                                                                                                <HeaderBackground ShadingEffectMode="None" />
                                                                                            </TitleBox>
                                                                                            <LegendBox CornerBottomRight="Cut" Padding="4" Orientation="TopRight">
                                                                                                <LabelStyle GlowColor="" Type="UseFont" />
                                                                                                <Background ShadingEffectMode="None" />
                                                                                                <DefaultEntry ShapeType="None">
                                                                                                    <LabelStyle GlowColor="" Type="UseFont" />
                                                                                                    <Background ShadingEffectMode="None" />
                                                                                                </DefaultEntry>
                                                                                                <HeaderLabel GlowColor="" Type="UseFont">
                                                                                                </HeaderLabel>
                                                                                                <HeaderEntry Name="Name" ShapeType="None" SortOrder="-1" Value="Value" Visible="False">
                                                                                                    <LabelStyle GlowColor="" Type="UseFont" Font="Arial, 8pt, style=Bold" />
                                                                                                    <Background ShadingEffectMode="None" />
                                                                                                </HeaderEntry>
                                                                                                <HeaderBackground ShadingEffectMode="None" />
                                                                                            </LegendBox>
                                                                                            <XAxis GaugeLabelMode="Default" GaugeNeedleType="One" SmartScaleBreakLimit="2" TimeInterval="Minutes">
                                                                                                <TimeScaleLabels MaximumRangeRows="4">
                                                                                                </TimeScaleLabels>
                                                                                                <ScaleBreakLine Color="Gray" />
                                                                                                <ZeroTick>
                                                                                                    <Line Length="3" />
                                                                                                    <Label GlowColor="" Type="UseFont">
                                                                                                    </Label>
                                                                                                </ZeroTick>
                                                                                                <MinorTimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                                                                                                <Label Alignment="Center" Font="Arial, 9pt, style=Bold" GlowColor="" LineAlignment="Center"
                                                                                                    Type="UseFont">
                                                                                                </Label>
                                                                                                <TimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                                                                                                <AlternateGridBackground ShadingEffectMode="None" />
                                                                                                <DefaultTick>
                                                                                                    <Line Length="3" />
                                                                                                    <Label GlowColor="" Text="%Value" Type="UseFont">
                                                                                                    </Label>
                                                                                                </DefaultTick>
                                                                                            </XAxis>
                                                                                            <YAxis GaugeLabelMode="Default" GaugeNeedleType="One" SmartScaleBreakLimit="2" TimeInterval="Minutes">
                                                                                                <TimeScaleLabels MaximumRangeRows="4">
                                                                                                </TimeScaleLabels>
                                                                                                <ScaleBreakLine Color="Gray" />
                                                                                                <ZeroTick>
                                                                                                    <Line Length="3" />
                                                                                                    <Label GlowColor="" Type="UseFont">
                                                                                                    </Label>
                                                                                                </ZeroTick>
                                                                                                <MinorTimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                                                                                                <Label Alignment="Center" Font="Arial, 9pt, style=Bold" GlowColor="" LineAlignment="Center"
                                                                                                    Type="UseFont">
                                                                                                </Label>
                                                                                                <TimeIntervalAdvanced Start="" TimeSpan="00:00:00" />
                                                                                                <AlternateGridBackground ShadingEffectMode="None" />
                                                                                                <DefaultTick>
                                                                                                    <Line Length="3" />
                                                                                                    <Label GlowColor="" Text="%Value" Type="UseFont">
                                                                                                    </Label>
                                                                                                </DefaultTick>
                                                                                            </YAxis>
                                                                                        </ChartArea>
                                                                                        <TitleBox Position="Left">
                                                                                            <Label Color="Black" GlowColor="" Type="UseFont">
                                                                                            </Label>
                                                                                            <HeaderLabel GlowColor="" Type="UseFont">
                                                                                            </HeaderLabel>
                                                                                            <Background ShadingEffectMode="None" />
                                                                                            <HeaderBackground ShadingEffectMode="None" />
                                                                                        </TitleBox>
                                                                                    </dotnetCHARTING:Chart>
                                                                                </asp:Panel>
                                                                                
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td height="1">
                                                        <table cellspacing="0" cellpadding="0" width="100%" background="../images/cellback_SectionHeading.gif">
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
    </form>
</body>
</html>

