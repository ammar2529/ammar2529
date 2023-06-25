<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeedBack.aspx.cs" Inherits="WebProject.ReportsEngine.FeedBack" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
        <script language="javascript" type="text/javascript">
        function OnBodyLoad()
        {
        
            ProcessName = document.getElementById("lblProcessName");
            
            spn = document.getElementById("spnUserQuestion");
            if(ProcessName.innerText=="Global Inbox")
            {
                spn.innerText ="How do you feel about eForms?";
            }
            else
            {
                spn.innerText ="How do you feel about the process?";

            }
           SelectedImagePath="url("+document.getElementById("hdfBackSelected").value+")";
           document.getElementById('btnCompliment').style.backgroundImage=SelectedImagePath;
           
           
        }
        function imageMouseOver(img)
        {
            txtbox=document.getElementById("txtSelectedImage");

            if(img.id==txtbox.value)
            {
                img.style.cssText = "border: red 1px dotted";
            }
            else
            {
                //img.style.borderStyle="border: red 1px dotted";
                 img.style.cssText = "border: black 1px dotted";
            }
        }
        function imageMouseOut(img)
        {
            txtbox=document.getElementById("txtSelectedImage");
            if(img.id==txtbox.value)
            {
                 img.style.cssText =  "border: red 1px solid";
            }
            else
            {
                img.style.cssText = "padding: 1px";
            }
        }
        function  imageClick(img)
        {
            txtbox=document.getElementById("txtSelectedImage");
            if(txtbox.value=="") //if rating is not selected
            {
                txtbox.value=img.id;
                img.style.cssText =  "border: red 1px solid";

            }
            else //if rating is already selected
            {
                if( txtbox.value==img.id) //if the current rating is already selected clear it
                {
                   // debugger;
                    txtbox.value="";
                    img.style.cssText="border: black 1px dotted";
                }
                else
                {
                    //make the last selected rating inactive
                    document.getElementById(txtbox.value).style.cssText ="padding: 1px";// "border: black 1px dotted";
                    //make the new selected rating active
                    txtbox.value=img.id;
                    img.style.cssText =  "border: red 1px solid";
                }
              //  txt.value=img.id;

            }
        }
        function FeedbackSelection(btnFeedback)
        {
            //debugger;
            NormalImagePath="url("+document.getElementById("hdfbackButton").value+")";
            SelectedImagePath="url("+document.getElementById("hdfBackSelected").value+")";
            CommentsText ="Comments";
            txtbox=document.getElementById("txtFeedBackTopicSelected");
            lblComments = document.getElementById("lblFeedbackComments");
            document.getElementById('btnCompliment').style.backgroundImage=NormalImagePath;

//            var leftPosition = parseInt((screen.availWidth/2) - (452/2)); 
//            self.moveTo(leftPosition,0);
//            top.resizeTo(452,540);             
//            var topPosition = parseInt((screen.availHeight/2) - (540/2));
//            self.moveTo(leftPosition,topPosition);


            if (txtbox.value=="")// No Selection was made before
            {
               txtbox.value= btnFeedback.id;
               btnFeedback.style.backgroundImage=SelectedImagePath;
             //  document.getElementById("tblComments").style.display="";
            
            }
            else
            {
                document.getElementById(txtbox.value).style.backgroundImage=NormalImagePath;
                txtbox.value= btnFeedback.id;
                btnFeedback.style.backgroundImage=SelectedImagePath;

            }
            lblComments.innerText= CommentsText + " (" + btnFeedback.id.substr(3) +")";
            
        }
        </script>
</head>
<body onload="OnBodyLoad()">
    <form class="Accent" id="ListPaymentRequestForm" method="post" runat="server">
           <table cellpadding="0" cellspacing="0"  width="450">
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
                                                <asp:Label ID="lblFormName" runat="server" CssClass="PWCSubTitleHeader" Text="User Feedback"></asp:Label></td>
                                            <td>
                                                <img src="<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetTemplateImagePath("curve_sectionHeading_"+ImageDirection("positive")+".gif")%>" /></td>
                                            <td background="<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetTemplateImagePath("cellback_sectionHeading1.gif")%>"
                                                width="100%">
                                            </td>
                                            <td>
                                                <img src="<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetTemplateImagePath("rightend_sectionHeading_"+ImageDirection("positive")+".gif")%>" /></td>
                                        </tr>
                                    </tbody>
                                </table>
                                <table align="left" border="0" cellpadding="0"
                                    cellspacing="0" class="PWCTemplateTable" width="100%" >
                                    <tr valign="top">
                                        <td>
                                             <table id="Table4" border="0" cellpadding="0" cellspacing="1" >
                                                            <tr>
                                                                <td height="10" colspan="2" style="padding-left: 30px" valign="bottom">
                                                                    <asp:Label ID="Label2" runat="server" CssClass="PWCFormLabel">Process/Module Name</asp:Label></td>
                                                                <td align="right" rowspan="2" width="25%" style="padding-right: 20px; padding-bottom: 10px; padding-top: 10px;height:49px">
                                                                    <asp:HiddenField ID="txtSelectedImage" runat="server" />

                                                                    <%--<script src='<%=ResolveUrl("http://eFormsService.pwclogistics.com/livechat/CuteSoft_Client/CuteChat/")%>Support-Image-Button.js.aspx?UserName=<%=Session["UserDisplayName"]%>'></script>--%>
                                                                    <asp:HiddenField ID="txtFeedBackTopicSelected" runat="server" />

                                                                </td>
                                                            </tr>
                                                            <tr valign="top">
                                                                <td height="23" colspan="2" style="padding-left: 30px" valign="top">
                                                                    <asp:Label ID="lblProcessName" runat="server" CssClass="PWCLabelValue" Font-Bold="True"
                                                                        ForeColor="Red" Font-Size="11px"></asp:Label></td>
                                                            </tr>
                                                            <tr valign="top">
                                                                <td class="AgilityRowSpacerTop" colspan="3" height="23">
                                                                    <table border="0" cellpadding="20" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td cellpadding="0" cellspacing="0" style="background-image: url(<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetImagePath("Feedback/feedback_back.jpg")%>)">
                                                                                <table width="100%" style="border-right: tan 1px solid; border-top: tan 1px solid; border-left: tan 1px solid; border-bottom: tan 1px solid; background-color: #ffffff;" border="0" cellpadding="0" cellspacing="0">
                                                                                    <tr>
                                                                                        <td style="padding-right: 1px; padding-left: 10px; white-space:nowrap; font-weight: bold;">
                                                                                            <span id="spnUserQuestion" style="font-size: 11px; color: dimgray" class="PWCLabelValue">
                                                                                            How do you feel about eForms?</span></td>
                                                                                        <td   align="right" style="padding-right: 5px; padding-left: 1px; padding-bottom: 5px; padding-top: 5px;">
                                                                                            <table  border="0" cellpadding="0" cellspacing="0">
                                                                                                <tr >
                                                                                                    <td style="cursor: hand;"  >
                                                                                                        <img id="Emoticon1" src="<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetImagePath("Feedback/Emoticon1.gif")%>" onclick="imageClick(this)" onmouseover="imageMouseOver(this)" onmouseout="imageMouseOut(this)" style="padding: 1px" /></td>
                                                                                                    <td style="cursor: hand">
                                                                                                        <img  id="Emoticon2" src="<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetImagePath("Feedback/Emoticon2.gif")%>" onclick="imageClick(this)"  onmouseover="imageMouseOver(this)" onmouseout="imageMouseOut(this)"  style="padding: 1px" /></td>
                                                                                                    <td style="cursor: hand">
                                                                                                        <img id="Emoticon3"  src="<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetImagePath("Feedback/Emoticon3.gif")%>" onclick="imageClick(this)" onmouseover="imageMouseOver(this)" onmouseout="imageMouseOut(this)"  style="padding: 1px" /></td>
                                                                                                    <td style="cursor: hand">
                                                                                                        <img id="Emoticon4"  src="<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetImagePath("Feedback/Emoticon4.gif")%>"  onclick="imageClick(this)" onmouseover="imageMouseOver(this)" onmouseout="imageMouseOut(this)" style="padding: 1px" /></td>
                                                                                                    <td style="cursor: hand">
                                                                                                        <img id="Emoticon5"  src="<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetImagePath("Feedback/Emoticon5.gif")%>"  onclick="imageClick(this)" onmouseover="imageMouseOver(this)" onmouseout="imageMouseOut(this)"  style="padding: 1px" /></td>
                                                                                                </tr>
                                                                                                
                                                                                            </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                                <br />
                                                                                            <table style="border-right: tan 1px solid; border-top: tan 1px solid; border-left: tan 1px solid; border-bottom: tan 1px solid; background-color: #f6be95">
                                                                                                <tr>
                                                                                                    <td style="height: 130px; width: 397px;" align="left">
                                                                                                        <span style="color: dimgray">
                                                                                            
                                                                                                <span style="font-size: 14px; padding-left: 10px;"></span>
                                                                                                            <table border="0" cellpadding="0" cellspacing="0" style="font-weight: bold">
                                                                                                                <tr>
                                                                                                                    <td style="padding-left: 10px; text-align: left; width: 406px; height: 15px;">
                                                                                                                        <span style="font-size: 11px; color: dimgray;" class="PWCLabelValue">Select your feedback topic</span></td>
                                                                                                     
                                                                                                                </tr>
                                                                                                                <tr>
                                                                                                                    <td align="left">
                                                                                            
                                                                                                
                                                                                                    <table cellspacing="10" style="height: 102px; " border="0" cellpadding="0">
                                                                                                        <tr>
                                                                                                            <td id="btnBug" onclick="FeedbackSelection(this)" style="background-image: url(<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetImagePath("Feedback/buttonBack.gif")%>); width: 106px; height: 15px; padding-right: 2px; padding-left: 10px; cursor: hand; background-repeat: no-repeat;" align="left" valign="middle">
                                                                                                                <table cellpadding="0" border="0" cellspacing="0" height="33px">
                                                                                                                    <tr>
                                                                                                                        <td>
                                                                                                                        <img src="<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetImagePath("Feedback/bug.gif")%>" /></td>
                                                                                                                        <td style="padding-left: 5px; width: 100%">
                                                                                                                            <span style="font-size: 10px; color: dimgray" class="PWCLabelValue">Bug</span></td>
                                                                                                                       
                                                                                                                    </tr>
                                                                                                                   
                                                                                                                </table>
                                                                                                            </td>
                                                                                                            <td id="btnContent" onclick="FeedbackSelection(this)" style="background-image: url(<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetImagePath("Feedback/buttonBack.gif")%>); width: 106px; height: 15px; padding-right: 2px; padding-left: 10px; cursor: hand; border-top-width: 2px; border-left-width: 2px; border-left-color: lime; border-bottom-width: 2px; border-bottom-color: lime; border-top-color: lime; background-repeat: no-repeat; border-right-width: 2px; border-right-color: lime;" align="left" valign="middle">
                                                                                                                <table cellpadding="0" border="0" cellspacing="0">
                                                                                                                    <tr>
                                                                                                                        <td>
                                                                                                                        <img src="<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetImagePath("Feedback/content.gif")%>" /></td>
                                                                                                                        <td style="padding-left: 5px; width: 100%">
                                                                                                                            <span style="font-size: 10px; color: dimgray" class="PWCLabelValue">Site Content</span></td>
                                                                                                                       
                                                                                                                    </tr>
                                                                                                                   
                                                                                                                </table>
                                                                                                            </td>
                                                                                                            <td id="btnSuggesion" onclick="FeedbackSelection(this)" style="background-image: url(<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetImagePath("Feedback/buttonBack.gif")%>); width: 106px; height: 15px; padding-right: 2px; padding-left: 10px; cursor: hand; background-repeat: no-repeat;" align="left" valign="middle">
                                                                                                                <table cellpadding="0" border="0" cellspacing="0">
                                                                                                                    <tr>
                                                                                                                        <td>
                                                                                                                        <img src="<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetImagePath("Feedback/suggestion.gif")%>" /></td>
                                                                                                                        <td style="padding-left: 5px; width: 100%">
                                                                                                                            <span style="font-size: 10px; color: dimgray" class="PWCLabelValue">Suggestion</span></td>
                                                                                                                       
                                                                                                                    </tr>
                                                                                                                   
                                                                                                                </table>
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                        <tr>
                                                                                                            <td id="btnCompliment" onclick="FeedbackSelection(this)" style="background-image: url(<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetImagePath("Feedback/buttonBack.gif")%>); width: 106px; height: 15px; padding-right: 2px; padding-left: 10px; cursor: hand; background-repeat: no-repeat;" align="left" valign="middle">
                                                                                                                <table cellpadding="0" border="0" cellspacing="0" height="33px">
                                                                                                                    <tr>
                                                                                                                        <td>
                                                                                                                        <img src="<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetImagePath("Feedback/compliment.gif")%>" /></td>
                                                                                                                        <td style="padding-left: 5px; width: 100%">
                                                                                                                            <span style="font-size: 10px; color: dimgray" class="PWCLabelValue">Compliment</span></td>
                                                                                                                       
                                                                                                                    </tr>
                                                                                                                   
                                                                                                                </table>
                                                                                                            </td>
                                                                                                            <td id="btnOther" onclick="FeedbackSelection(this)" style="background-image: url(<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetImagePath("Feedback/buttonBack.gif")%>); width: 106px; height: 15px; padding-right: 2px; padding-left: 10px; cursor: hand; background-repeat: no-repeat;" align="left" valign="middle">
                                                                                                                <table cellpadding="0" border="0" cellspacing="0">
                                                                                                                    <tr>
                                                                                                                        <td>
                                                                                                                        <img src="<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetImagePath("Feedback/other.gif")%>" /></td>
                                                                                                                        <td style="padding-left: 5px; width: 100%">
                                                                                                                            <span style="font-size: 10px; color: dimgray" class="PWCLabelValue">Other</span></td>
                                                                                                                       
                                                                                                                    </tr>
                                                                                                                   
                                                                                                                </table>
                                                                                                            </td>
                                                                                                            <td style="width: 106px; height: 15px; padding-right: 2px; padding-left: 10px;" align="left" valign="middle">
                                                                                                            </td>
                                                                                                        </tr>
                                                                                                    </table>
                                                                                                                        <table width="100%" id="tblComments" >
                                                                                                                            <tr>
                                                                                                                                <td style="padding-right: 10px; padding-left: 10px; padding-bottom: 10px; padding-top: 10px">
                                                                                                                                <table width="100%">
                                                                                                                                    <tr>
                                                                                                                                        <td style="border-right: tan 1px solid; padding-right: 10px; border-top: tan 1px solid; padding-left: 10px; padding-bottom: 10px; border-left: tan 1px solid; padding-top: 10px; border-bottom: tan 1px solid; background-color: #ffffff">
                                                                                                                                            <asp:Label ID="lblFeedbackComments" runat="server" Font-Bold="True"  CssClass="PWCLabelValue" Font-Size="11px" Text="Comments ( Compliment )" ForeColor="DimGray"></asp:Label>
                                                                                                                                            <asp:RequiredFieldValidator ID="FeedbackCommentsValidator" runat="server" ControlToValidate="txtFeedBackComments"
                                                                                                                                                ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator><br />
                                                                                                                                            <asp:TextBox ID="txtFeedBackComments" runat="server" Height="83px" TextMode="MultiLine"
                                                                                                                                                Width="100%"></asp:TextBox><br />
                                                                                                                                            <asp:Button ID="btnSendFeedback" runat="server" CssClass="PWCButton" Text="Submit" Width="75px" OnClick="btnSendFeedback_Click" />&nbsp;
                                                                                                                                            <input id="btnCancel" class="PWCButton" onclick="opener=self;window.close()" type="button" value=" Cancel "  /></td>
                                                                                                                                    </tr>
                                                                                                                                </table>
                                                                                                                                </td>
                                                                                                                                
                                                                                                                            </tr>
                                                                                                                            
                                                                                                                        </table>
                                                                                                                    </td>
                                                                                                          
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                        </span>
                                                                                                    </td>
                                                                                                    
                                                                                                </tr>
                                                                                                
                                                                                            </table>
                                                                                <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" Text="Unable to submit feedback."
                                                                                    Visible="False"></asp:Label></td>
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
                    <asp:HiddenField ID="hdfbackButton" runat="server" />
                    <asp:HiddenField ID="hdfBackSelected" runat="server" />

    </form>
</body>
</html>

