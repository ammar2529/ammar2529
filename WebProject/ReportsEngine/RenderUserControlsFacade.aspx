<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RenderUserControlsFacade.aspx.cs" Inherits="WebProject.ReportsEngine.RenderUserControlsFacade" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <%--<script type="text/javascript" src="../../jquery/jquery.js"></script>--%>
    <script type="text/javascript">



                // debugger;
                // If it doesn't look like a zip code, don't even bother with the request
        //  if (/^\d{5}(-\d{4})?$/.test($(this).val()))
        function callservice() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "RenderUserControlsFacade.aspx/HellowWorld",
                data: "{'zip': '1112212'}",
                dataType: "json",
                success: function(msg) {
                    //$("#CityStateLabel").text("Zip Code Entered Corresponds To: " + msg.d.City + ", " + msg.d.State);
                    alert(msg);
                }
                        ,
                error: function(msg) {

                    alert("Error Occured While Executing web service\t\n" + msg.responseText)
                }

            });
        }
    </script>
    <script type="text/javascript">

     //   string ReportId, string WidgetId, int PageIndex, string SortBy, string Parameters
        function btnOnClick() {
        
            $("#girddiv")[0].innerHTML = "<div style='width:100%;text-align:center'>Retreiving Data ...";
            //  executeWebService('XmlHttpPanelWebService.asmx/GetASPGridHTML', grdTRF_PWCServicesMonthly
            executeWebService('RenderUserControlsFacade.aspx/GetASPGridHTML',
                ["ReportId", "WidgetId", "WidgetId", "grdAttendance", "PageIndex", 0, "SortBy", "", "Parameters", "UserId|skumarvenkat|FromDate|2009/12/01|ToDate|2009/12/16"], OnClientResponseEnd);
        }
        function OnClientResponseEnd(msg) {
            // alert(msg);
           // debugger;
            $("#girddiv")[0].innerHTML = msg[1];
            //setTimeout(afterCall, 100);
           // afterCall();
        }
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
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager" runat="server" EnablePageMethods="true" />
        <p>
        <input id="testjson" type="button" value="Test JSON Call" onclick="callservice()" />
        <input id="testxml" type="button" value="Test XML Call" onclick="testXml()" />
         <input id="Button1" type="button" value="Test Grid Call" onclick="btnOnClick()" />       
    </p>
    <div>
            <div id="girddiv" style="display:block;">
    
    </div>
    </div>
    </form>
</body>
</html>
