<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/eForms.Master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="WebProject.Logout" %>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder5" runat="server">

     <script type="text/javascript" language="javascript">

         $(document).ready(function () {
             $('.OnLogoutHide td:not(:first):not(:last)').hide();
             $('.HeaderMenuPanel,.HeaderTitlePanel').hide();
             setTimer();
         });

         var timeInterval;
         var nvalue;

//         function Loadpage() {
//             setTimer();
//         }

         function setTimer() {
             nvalue = 9;
             document.getElementById('sp2').innerText = nvalue + ' seconds...';
             timeInterval = window.setInterval('ClearWindow()', 1000) 
         }

         function ClearWindow() {

             document.getElementById('sp2').innerText = nvalue + ' seconds...';
             if (parseInt(nvalue) == 0) {
                 clearInterval(timeInterval);
                 CloseForm();
             }
             nvalue = parseInt(nvalue) - 1;
         }

         function CloseForm() {

             var ver = getInternetExplorerVersion();

             if (ver >= 7.0) {
                 window.open('', '_self', '');
                 window.close();
             }
             else {
                 window.opener = null;
                 window.close();
             }

         }

         function getInternetExplorerVersion()
         // Returns the version of Windows Internet Explorer or a -1
         // (indicating the use of another browser).
         {
             var rv = -1; // Return value assumes failure.
             if (navigator.appName == 'Microsoft Internet Explorer') {
                 var ua = navigator.userAgent;
                 var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");
                 if (re.exec(ua) != null)
                     rv = parseFloat(RegExp.$1);
             }
             return rv;
         }

     </script>
    <div>
        <table id="Table1" cellspacing="0" cellpadding="0" width="100%" align="left" border="0">
            <tr>
                <td height="20">
                </td>
            </tr>
            <tr>
                <td>
                    <table width="541" border="0" align="center" cellpadding="1" cellspacing="1" 
                        id="Table2">
                        <tr>
                                     <td bgcolor="#FFFFFF" class="Normal " align="center">

                                            <strong><span style="font-size: 14px; color: #BF2e1A; font-family: Verdana;">Session Timed Out or Logged Out Successfully</span></strong>
                                             
                                            <p align="center">
                                            
                                                <span id="sp1" style="text-align: center;">Thank you for using the system, </span><span class="SLabel" style="color: #BF2e1A;font-weight: bold;">this window will close in </span><span class="SLabel" id="sp2" style="color: #BF2e1A;font-weight: bold;"></span>
                                                <span><a href="javascript:CloseForm()" id="A3" style="font: 10pt/20px Verdana;
                                                                            padding-right: 10px;padding-left: 10px;">Close Now</a></span>  </p>
                                            <br />
                                            <strong><font face="Arial">
                                                <img src="App_Themes/eForms_Theme/Images/workflow.jpg" /></font></strong>
                                                <br /> <br />

                                                     <span>
                                                            <asp:Button ID="btnReLogin" runat="server" OnClick="btnReLogin_Click" Text="Re-Login" Width="120px"
                                                                CssClass="ButtonStyle" />
                                                         </span>
                                                         <br /> <br /><br />
                                       
                                                      
                                </td>
                        </tr>

                    </table>
                </td>
            </tr>
        </table>
    </div>

</asp:Content>
