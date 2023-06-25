<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/DummyMaster.master" AutoEventWireup="true" CodeBehind="iDashboard.aspx.cs" Inherits="WebProject.ReportsEngine.iDashboard" %>
<%@ Register Assembly="EO.Web" Namespace="EO.Web" TagPrefix="eo" %>
<%@ Register TagPrefix="dotnetcharting" Namespace="dotnetCHARTING" Assembly="dotnetCHARTING" %>
<%@ Register  Namespace="WebProject.eForms.Web.UI"  TagPrefix="eForms" Assembly="WebProject" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

<%-- <script language="JavaScript" type="text/javascript" src="../../JQuery/jquery.js"></script>--%>
  <script language="JavaScript" type="text/javascript" src="../../JQuery/DomElemAbsPosition.js"></script>
   <script language="JavaScript" type="text/javascript" src="../../JQuery/fisheye-iutil.js"></script>
    <script language="JavaScript" type="text/javascript" src="../../JQuery/dock-example1.js"></script>
   
  
    <script language="JavaScript" type="text/javascript" src="../../DotNetPages/ReportsEngine/FusionCharts/FusionCharts.js"></script>

    <script language="javascript" type="text/javascript">
    

    
    function changeCurrWin()
{

var offset = 4;
var iWinHeight= screen.availHeight-(offset*12); //muliply factor 12 if taskbar should be visible else 4
var iWinWidth = screen.availWidth-(offset*2);								
if(window.name!='form1')
{						
var Nwindow=window.open(window.location,'form1','directories=no,height='+iWinHeight+',width='+iWinWidth+',left=0,top=0,screeny='+offset+',screenx='+offset+',scrollbars=1,menubar=0,toolbar=0,location=0,resizable=0,status=1');
//Nwindow.opener=null; //For making ThisWindowObj function to work properly for base windows
  
  if (!Nwindow || Nwindow == null ) 
  {    
    alert("A popup blocker was detected, Allow Pop-ups from This Site...");
  } 
  else 
  {
    Nwindow.opener=null; 
    CloseCurrWin();
    //alert("No popup blocker was detected.");
  }   
}
}
function CloseCurrWin()
{
//This function uses tricks to avoid close window dialog prompt 
window.opener=null; //For IE 6 
window.open('','_self',''); //For IE 7 
window.close();
}
 
    </script>

  

<%--     <telerik:RadSplitter ID="RadSplitter1"  runat="server" Height="100%" Width="100%">
        <telerik:RadPane ID="LeftPane" runat="server" Width="25%" Collapsed="true" > --%>

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
 <%--       </telerik:RadPane>
        
        <telerik:RadSplitBar ID="RadSplitbar1"   CollapseMode="Forward" runat="server"></telerik:RadSplitBar>
        
        <telerik:RadPane ID="MainPane" CssClass="MainPanel" runat="server" 
            Scrolling="Both" Height="100%" Width="75%"> --%>
            <div id="MainPanel" style="position:absolute;WIDTH: 100%; HEIGHT: 100%;overflow:visible">
                <asp:Panel ID="pnlReportBody" Width="100%" Height="100%" style="overflow:visible" runat="server">
                
                </asp:Panel>
               <%-- <textarea id="TextArea1" cols="120" rows="10"></textarea>--%>
            </div>
 <%--        </telerik:RadPane>
    </telerik:RadSplitter> --%>
    <asp:Panel ID="Panel1" runat="server">
    </asp:Panel>
    <asp:Panel ID="pnlUnAuthrized" runat="server">
        </asp:Panel>

    <asp:Panel ID="pnlLowerBody" runat="server">
    </asp:Panel>
    
<%--    <telerik:RadXmlHttpPanel runat="server" ID="XmlHttpPanelWS" OnClientResponseEnd="OnClientResponseEnd"
        WebMethodPath="XmlHttpPanelWebService.asmx" WebMethodName="GetProperties">
    </telerik:RadXmlHttpPanel>--%>
    
    
<%--    <telerik:RadXmlHttpPanel runat="server" ID="XmlHttpPanelCB" OnServiceRequest="XmlHttpPanelCB_ServiceRequest">
        <asp:GridView ID="gvMain" runat="server" AutoGenerateColumns="False" CellPadding="1"
            CellSpacing="1" GridLines="None" Width="100%" Visible="true">
            <HeaderStyle CssClass="AgilitySubPanelHeader GridHead GridHeader" />
            <RowStyle CssClass="PWCOddRow PWCLabel" Font-Names="Verdana" Font-Size="7.5pt" />
            <PagerStyle BackColor="#F7F0D6" CssClass="pagelink" Font-Bold="True" />
            <AlternatingRowStyle CssClass="PWCEvenRow PWCLabel" Font-Names="Verdana" Font-Size="7.5pt" />
        </asp:GridView>
    </telerik:RadXmlHttpPanel>--%>

    <eForms:ScriptBlock ID="tst" runat="Server">
		<script type="text/javascript">
            function executeWebService(webMethod, parameters, successFn) {
                //var pagePath = window.location.pathname;
                //Create list of parameters in the form:   
                //{"paramName1":"paramValue1","paramName2":"paramValue2"}   
                var paramList = '';
                if (parameters.length > 0) {
                    for (var i = 0; i < parameters.length; i += 2) {
                        if (paramList.length > 0) paramList += ',';
                        paramList += '"' + parameters[i] + '":"' + parameters[i + 1] + '"';
                    }
                }
                paramList = '{' + paramList + '}';
                //Call the page method
                $.ajax({
                    type: "POST",
                    url: webMethod,
                    contentType: "application/json; charset=utf-8",
                    data: paramList,
                    dataType: "json",
                    success: successFn,
                    error: function(msg) {
                        debugger;
                        alert("Error Occured While Executing web service\t\n" + msg.responseText)
                    }
                })
;
            }  
            
            var App_ThemesPath = '<%=Page.ResolveUrl("~/App_Themes/") %>';
            imgPlusPath = App_ThemesPath + "Blue/Images/plus.gif";
            imgMinusPath = App_ThemesPath + "Blue/Images/minus.gif";
            function getLoadingImage(imageId) {
                var CaseCadeLoadingImg = new Image();
                CaseCadeLoadingImg.src = App_ThemesPath + "Blue/Images/CascadeLoading.gif";
                CaseCadeLoadingImg.id = imageId;
                return CaseCadeLoadingImg;
            }
            function OnClientSelectedIndexChanged(SearchFieldId) {
                objSearchField = getSearchFieldByClientId(SearchFieldId);

                if (objSearchField.childComboId != "") {
                   
                    var value = document.getElementById(SearchFieldId).value;

                    var ChildSF = objSearchPanels.getSearchPanel(objSearchField.searchPanelId).getSearchField(objSearchField.searchPanelId + '_' + objSearchField.childComboId);


                    if ($('#' + objSearchField.searchPanelId + '_' + objSearchField.childComboId + '_LoadingIMG').length == 0) {
                        ChildSF.searchFieldControl.parentNode.appendChild(getLoadingImage(objSearchField.searchPanelId + '_' + objSearchField.childComboId + '_LoadingIMG'));
                        //$('#' + objSearchField.searchPanelId + '_' + objSearchField.childComboId + '_LoadingIMG').css({ display: 'none' });
                        $(ChildSF.searchFieldControl).css({ display: 'none' });
                    }
                    else {
                        $(ChildSF.searchFieldControl).css({ display: 'none' });
                        $('#' + objSearchField.searchPanelId + '_' + objSearchField.childComboId + '_LoadingIMG').css({ display: '' });
                    }
                    var ctxParams;
                   
                    //$('#TextArea1').val($('#TextArea1').val() + "\t\nCalling Web Service: " + value + "|" + objSearchField.searchFieldId + "|" + objSearchField.childComboId);
                    ctxParams = value + '|' + objSearchField.searchFieldId + '|' + objSearchField.childComboId;
                    executeWebService('XmlHttpPanelWebService.asmx/GetProperties', ["CasecadeParams", ctxParams], OnClientResponseEnd);
                }
            }
            function OnClientResponseEnd(response) {
                if (typeof (response) != undefined || response != null || response != "") {
                    var Resultantarray = response;
                    var _ChildComboId = Resultantarray[0];
                    var _SearchPanelId = Resultantarray[0].split('_')[0];
                    var _objSearchPanel = objSearchPanels.getSearchPanel(_SearchPanelId);
                    
                    var _ChildCombo = _objSearchPanel.getSearchField(_ChildComboId).searchFieldControl;

                    cleardropdownlist(_ChildCombo); //clear the child combo
                    _objSearchPanel.resetChildern(_ChildComboId);
                    if (Resultantarray.length != 0) {
                        _ChildCombo.options[0] = new Option('---- Select Value ----', '-1');
                        for (var j = 1; j < Resultantarray.length; j++) {
                            _ChildCombo.options[j] = new Option(Resultantarray[j], Resultantarray[j]);
                        }
                    }
                    else {

                    }
                    $('#' + _ChildComboId + '_LoadingIMG').css({ display: 'none' });
                    $(_ChildCombo).css({ display: '' });
                }
                
            }




            function cleardropdownlist(id) {
                var dropdownid = id;
                if (dropdownid.length != 0) {
                    dropdownid.options.length = 0;
                }
            }
        </script>

    </eForms:ScriptBlock>
     <div id='Logger' style="display:none;height:20px;z-index: 999;width: 0px;  border: 1px solid #808080;
        background-color: #EFEFEF;overflow:visible;left:0px;
        top: expression(eval(document.compatMode && document.compatMode==  'CSS1Compat' ) ? document.documentElement.scrollTop :document.body.scrollTop)">
        <div id='loggerTitle' style='border: 1px solid #666666; background-color: #C8EEEC;width:300px' >
            <div style='float: left;'>
                <a href='#' onclick='hidebody();return false;'>
                    Hide</a></div>
            <div>
            </div>
        </div>
        <div id='loggerBody' style='width: 300px; height: 369px;overflow:auto'>
		            <ul id='lst'>
                
            </ul>
        </div>
    </div>
	<script type="text/javascript">
	    function hidebody() {
	        if ($("#loggerBody").css("display") != "none") {
	            $("#loggerBody").css("display", "none")
	            $("#loggerTitle").css('width', '0');
	        }
	        else {
	            $("#loggerBody").css("display", "");
	            $("#loggerTitle").css('width', '300');
	        }
	    }
    </script>
</asp:Content>
