<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/DummyMaster.master" AutoEventWireup="true" CodeBehind="FeedbackThanks.aspx.cs" Inherits="WebProject.ReportsEngine.FeedbackThanks" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Agility eForms</title>
    
    <style type="text/css">
    Body
    {
        margin-left : 0;
        margin-top : 0;
        margin-right : 0;
        background-color: white;
    }
    </style>
    
    <script type="text/javascript" language="javascript">
   
    
    top.resizeTo(452,253);

    function ResizeNMove()
    {
      //top.resizeTo(452,253);
    }
    </script>
     
</head>
<body onload="ResizeNMove();">
    <form id="form1" runat="server">
    <div>
        <table cellpadding="0" cellspacing="0" width="450">
            <tr valign="top">
                <td>
                    <table border="0" cellpadding="0" cellspacing="0" style="background-image: url(<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetTemplateImagePath("cellback_sectionHeading.gif")%>)"
                        width="100%">
                        <tbody>
                            <tr>
                                <td valign="top">
                                    <img src="<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetTemplateImagePath("clip_payment_"+ImageDirection("positive")+".gif")%>" /></td>
                                <td nowrap="" style="padding-bottom: 3px" width="27%">
                                    <img border="0" height="1" src="<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetImagePath("spacer.gif")%>" width="5" />
                                    <asp:Label ID="Label1" runat="server" CssClass="PWCSubTitleHeader" Text="User Feedback"></asp:Label></td>
                                <td style="font-weight: bold; font-size: 10pt; color: #696969">
                                    <img src="<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetTemplateImagePath("curve_sectionHeading_"+ImageDirection("positive")+".gif")%>" /></td>
                                <td background="<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetTemplateImagePath("cellback_sectionHeading1.gif")%>"
                                    style="font-weight: bold; font-size: 10pt; color: #696969" width="100%">
                                </td>
                                <td style="font-weight: bold; font-size: 10pt; color: #696969">
                                    <img src="<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetTemplateImagePath("cellback_sectionHeading.gif")%>" /></td>
                            </tr>
                        </tbody>
                    </table>
                    <table align="left" border="0" cellpadding="0"
                        cellspacing="0" class="PWCTemplateTable" style="font-weight: bold; font-size: 10pt;
                        color: #696969" width="100%">
                        <tr valign="top">
                            <td>
                                <table id="Table4" border="0" cellpadding="0" cellspacing="1" width="100%">
                                    <tr>
                                        <td height="10" style="padding-left: 30px" colspan="2" valign="bottom">
                                            <asp:Label ID="Label2" runat="server" CssClass="PWCFormLabel">Process/Module Name</asp:Label></td>
                                        <td align="right" rowspan="2" style="width:25%;height:55px;padding-right: 20px; font-size: 9pt; padding-bottom: 10px;
                                            color: #696969; padding-top: 10px;" >

                                            

                                            <span style="color: #696969">&nbsp;</span>
                                        </td>
                                    </tr>
                                    <tr valign="top">
                                        <td height="23" style="padding-left: 30px" colspan="2" valign="top">
                                            <asp:Label ID="lblProcessName" runat="server" CssClass="PWCLabelValue" Font-Bold="True"
                                                Font-Size="11px" ForeColor="Red"></asp:Label></td>
                                    </tr>
                                    <tr valign="top">
                                        <td class="AgilityRowSpacerTop" colspan="3" height="23">
                                            <table border="0" cellpadding="20" cellspacing="0" width="100%">
                                                <tr>
                                                    <td cellpadding="0" cellspacing="0" style="background-image: url(<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetImagePath("Feedback/feedback_back.jpg")%>);
                                                        text-align: center">
                                                        <br />
                                                        <table 
style="BORDER-RIGHT: tan 1px solid; BORDER-TOP: tan 1px solid; BORDER-LEFT: tan 1px solid; BORDER-BOTTOM: tan 1px solid; BACKGROUND-COLOR: #f6be95" width="100%"><tbody><tr><td align=left style="height: 21px">
    <span class="PWCLabelValue" style="padding-right: 5px; padding-left: 5px; font-size: 12px; color: dimgray">Dear User, you're helping to improve eForms. Thank You &nbsp;</span></td></tr></tbody></table>
                                                        <br />
                                    <input id="Button1" type="button" class="PWCButton" value="   Close   " onclick="opener=self;window.close()" /></td>
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
    
    </div>
    </form>
</body>
</html>

