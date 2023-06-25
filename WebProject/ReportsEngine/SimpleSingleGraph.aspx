<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/DummyMaster.master" AutoEventWireup="true" CodeBehind="SimpleSingleGraph.aspx.cs" Inherits="WebProject.ReportsEngine.SimpleSingleGraph" %>
<%@ Import Namespace="PWC.PresentationServices.Web.UI.Common" %>
<%@ Register Assembly="EO.Web" Namespace="EO.Web" TagPrefix="eo" %>
<%@ Register TagPrefix="dotnetcharting" Namespace="dotnetCHARTING" Assembly="dotnetCHARTING" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
   <%--<script language="JavaScript" type="text/javascript" src="../../JQuery/jquery.js"></script>--%>
    <script src="../../JQuery/wz_tooltip.js" type="text/javascript"></script>
    <script src="../../JQuery/tip_centerwindow.js" type="text/javascript"></script>
    <script src="../../JQuery/tip_followscroll.js" type="text/javascript"></script>
<script src="../../JQuery/AutoComplete/jquery.autocomplete.js" type="text/javascript"></script>
 


    <script type="text/javascript">
       // Create the tooltips only on document load
       //<![CDATA[
       Ext = { version: '2.3.0' };

       // for old browsers
       window["undefined"] = window["undefined"];
       Ext.apply = function(o, c, defaults) {
           if (defaults) {
               // no "this" reference for friendly out of scope calls
               Ext.apply(o, defaults);
           }
           if (o && c && typeof c == 'object') {
               for (var p in c) {
                   o[p] = c[p];
               }
           }
           return o;
       };

       Ext.apply(Function.prototype, {
           createDelegate: function(obj, args, appendArgs) {
               var method = this;
               return function() {
                   var callArgs = args || arguments;
                   if (appendArgs === true) {
                       callArgs = Array.prototype.slice.call(arguments, 0);
                       callArgs = callArgs.concat(args);
                   } else if (typeof appendArgs == "number") {
                       callArgs = Array.prototype.slice.call(arguments, 0); // copy arguments first
                       var applyArgs = [appendArgs, 0].concat(args); // create method call params
                       Array.prototype.splice.apply(callArgs, applyArgs); // splice them in
                   }
                   return method.apply(obj || window, callArgs);
               };
           }
       });
       function formatItem(row) {
            
           var FormattedRow = "";
           for (var iLoop = 0; iLoop < row.length; iLoop++) {
               FormattedRow += (typeof row[iLoop] == 'undefined' ? " " : row[iLoop]) + (iLoop == (row.length - 1) ? "" : " , ");
           }
           return FormattedRow;
       }
       function selectItem(event, selectedData, formattedData) {
           //debugger;
          // if (!selectedData) return;
           if (this.parentNode.tagName == 'TD') {
               var col = this.parentNode;
               var row = col.parentNode;
               var tbl = row.parentNode.parentNode;
               var cellNo = $(col).attr('ColumnIndex');
               var cell = tbl.rows[0].cells[cellNo];
               if (typeof $(cell).attr('FillOnAutoComp') != 'undefined') {
                   var arrColIds = $(cell).attr('FillOnAutoComp').split(',');
                   for (var iLoop = 0; iLoop < arrColIds.length; iLoop++) {
                       (!!selectedData) ?
                        $("[ColumnId='" + arrColIds[iLoop] + "'] .ColumnEditor", row).val(selectedData[iLoop + 1]) :
                        $("[ColumnId='" + arrColIds[iLoop] + "'] .ColumnEditor", row).val("");
                       ;
                   }
               }
           }
       }
       function onBlur() {
           if (this.parentNode.tagName == 'TD') {
               if ($.trim($(this).val()) == '') {
                   var col = this.parentNode;
                   var row = col.parentNode;
                   var tbl = row.parentNode.parentNode;
                   var cellNo = $(col).attr('ColumnIndex');
                   var cell = tbl.rows[0].cells[cellNo];
                   if (typeof $(cell).attr('FillOnAutoComp') != 'undefined') {
                       var arrColIds = $(cell).attr('FillOnAutoComp').split(',');
                       for (var iLoop = 0; iLoop < arrColIds.length; iLoop++) {
                           $("[ColumnId='" + arrColIds[iLoop] + "'] .ColumnEditor", row).val('');
                       }
                   }
               }
           }
       }
       
       function executeWidgetWebService(webMethod, parameters, successFn, failedFn) {
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
           onFailureFn = typeof failedFn == 'undefined' ? function() { alert("Error Occured While Executing web service\t\n" + msg.responseText) } : failedFn;

           paramList = '{' + paramList + '}';
           //Call the page method

           $.ajax({
               type: "POST",
               url: webMethod,
               contentType: "application/json; charset=utf-8",
               data: paramList,
               dataType: "json",
               success: successFn,
               error: onFailureFn
           });

       }
       var GridTables={};


       $(document).ready(function() {
           
                      /*************************Export Code************************************/
           //  $('body').append($('#ExportMenu'));
           $('#btnExportDataPopup').unbind().click(function () {
               //var t = this; t$ = $(this); top = t$.
               // $('#ExportMenu').show()
               //
               $('#ExportMenu').css('position', 'absolute');
               var bt = this, opened = parseInt(bt.getAttribute('opened')),
             pos = getElementAbsolutePos($(bt)[0], "");
               if (!opened) {
                   $('#ExportMenu').css({
                       'top': pos.y + $('#btnExportDataPopup').height() + 2,
                       'left': pos.x
                   }).show('fast');

                   $(bt).attr('opened', '1').css('background-image', 'url("../../App_Themes/Blue/Images/DashBoard/MenuButtonArrowDown.gif")');
               }
               else {

                   $(bt).attr('opened', '0').css('background-image', 'url("../../App_Themes/Blue/Images/DashBoard/MenuButtonArrow.gif")');
                   $('#ExportMenu').hide('fast');
               }
           }).attr('opened', '0').css({ 'background-image': 'url("../../App_Themes/Blue/Images/DashBoard/MenuButtonArrow.gif")', 'background-repeat': 'no-repeat', 'background-position': 'right center' });
           //debugger;
           $('[export]').click(function () {
             //  debugger;
               ShowNewExportDataPopup($(this).attr('export'));
           });
           var tbl = $('table[sumcols]');
           //   debugger;
           if (!!tbl.attr('sumcols')) {
               var sumRow = $("tr:eq(1)", tbl).clone().addClass('sumrow');
               $('td', sumRow).css({ 'font-weight': 'bold', 'background-color': '#D2CEC6', 'color': '#0000ff', 'border': '1px dotted black', 'border-top': '1px solid black', 'border-bottom': '1px solid black' });
               $("td", sumRow).html('&nbsp;').first().html('Total');

               $(" tbody tr ~ tr:last", tbl).before(sumRow);
               var cols = tbl.attr('sumcols').split('||');
               //  var colH = $("th[columnid]", tbl);
               for (var i = 0; i < cols.length - 1; i += 2) {
                   if (cols[i] != "") {
                       var col = $('th[columnid="' + cols[i] + '"]', tbl);
                       $('td:eq(' + col[0].cellIndex + ')', sumRow).html(cols[i + 1]);
                   }
               }

           }

           /*************************End Export Code************************************/

            
           $('table[GridId]').each(function() {
             
               var theTable = $(this);
               var cellsCollectionById = {};
               var cellsCollectionByIndex = {};
               var theRow = this.rows[0];
               for (var iLoop = 0; iLoop < theRow.cells.length; iLoop++) {
                   var theCell = $(theRow.cells[iLoop]);
                   cellsCollectionById[theCell.attr('ColumnId')] = { index: iLoop, headerCell: theCell };
                   cellsCollectionByIndex[iLoop] = { columnId: theCell.attr('ColumnId'), headerCell: theCell };
                   for (var iRow = 1; iRow < this.rows.length; iRow++) {
                       $(this.rows[iRow].cells[iLoop]).attr('ColumnIndex', iLoop);
                       $(this.rows[iRow].cells[iLoop]).attr('ColumnId', theCell.attr('ColumnId'));
                   }
               }
               GridTables[theTable.attr("GridId")] = {
                   table: theTable,
                   columnsById: cellsCollectionById,
                   columnsByIndex: cellsCollectionByIndex
               };

           });

           $('.ShowToolTip').each(function() {
               $(this).mouseover(function() {
                   if (typeof $(this).attr('SmartText') != 'undefined')
                       Tip($(this).attr('SmartText'), CENTERMOUSE, true, OFFSETX, 0, ABOVE, true, JUMPHORZ, true, JUMPVERT, true);

                   var gridId = $(this.parentNode.parentNode.parentNode).attr("GridId");
                   var objHeadCell = GridTables[gridId].columnsByIndex[$(this).attr('ColumnIndex')];
                   var ToolTipTemplate = objHeadCell.headerCell.attr('ToolTipTemplate');
                   var CellRow = this.parentNode;

                   if (typeof ToolTipTemplate != 'undefined') {
                       if (typeof $(this).attr('ToolTip') == 'undefined') {
                           for (ColId in GridTables[gridId].columnsById) {
                               if (ToolTipTemplate.indexOf('::' + ColId + '::') > -1) {
                                   cellIndex = GridTables[gridId].columnsById[ColId].index;
                                   var RE = new RegExp('::' + ColId + '::', "ig");
                                   ToolTipTemplate = ToolTipTemplate.replace(RE, $(CellRow.cells[cellIndex], 'SPAN')[0].innerText);

                               }
                           }
                           $(this).attr('ToolTip', ToolTipTemplate);

                       }
                       Tip($(this).attr('ToolTip'), CENTERMOUSE, false, OFFSETX, 0, OFFSETY, 20, ABOVE, true, JUMPHORZ, true, JUMPVERT, true);

                   }

               });
               $(this).mouseleave(function() { UnTip() });
           });
           if(typeof(tblfooter) != "undefined")
            {
                if(tblfooter!=null)
                {
                    tblfooter.style.display='none';  
                }
            }
       });
       
       function getParentTag(obj,parentTag){
            var objParentElement={}; obj.parentNode;
            
            while(!!objParentElement ||objParentElement.tagName!=parentTag)
            {
                objParentElement= obj.parentNode;
            }
            return objParentElement;
       }
       
var __isIE =  navigator.appVersion.match(/MSIE/);
var __userAgent = navigator.userAgent;
var __isFireFox = __userAgent.match(/firefox/i);
var __isFireFoxOld = __isFireFox && (__userAgent.match(/firefox\/2./i) || __userAgent.match(/firefox\/1./i));
var __isFireFoxNew = __isFireFox && !__isFireFoxOld;

function __parseBorderWidth(width) {
    var res = 0;
    if (typeof(width) == "string" && width != null && width != "" ) {
        var p = width.indexOf("px");
        if (p >= 0) {
            res = parseInt(width.substring(0, p));
        }
        else {
     		//do not know how to calculate other values (such as 0.5em or 0.1cm) correctly now
    		//so just set the width to 1 pixel
            res = 1; 
        }
    }
    return res;
}


//returns border width for some element
function __getBorderWidth(element) {
	var res = new Object();
	res.left = 0; res.top = 0; res.right = 0; res.bottom = 0;
	if (window.getComputedStyle) {
		//for Firefox
		var elStyle = window.getComputedStyle(element, null);
		res.left = parseInt(elStyle.borderLeftWidth.slice(0, -2));  
		res.top = parseInt(elStyle.borderTopWidth.slice(0, -2));  
		res.right = parseInt(elStyle.borderRightWidth.slice(0, -2));  
		res.bottom = parseInt(elStyle.borderBottomWidth.slice(0, -2));  
	}
	else {
		//for other browsers
		res.left = __parseBorderWidth(element.style.borderLeftWidth);
		res.top = __parseBorderWidth(element.style.borderTopWidth);
		res.right = __parseBorderWidth(element.style.borderRightWidth);
		res.bottom = __parseBorderWidth(element.style.borderBottomWidth);
	}
   
	return res;
}
function getElementAbsolutePos(element, offsetParentObject) {
    var res = new Object();
    res.x = 0; res.y = 0;
    if (element !== null) {
        res.x = element.offsetLeft;
        res.y = element.offsetTop;

        var offsetParent = element.offsetParent;
        var parentNode = element.parentNode;
        var borderWidth = null;
        
        var test = "";
        while (offsetParent != null && !(offsetParent === offsetParentObject)) {//&& offsetParent.id != 'MainPanel') { //&& parentNode.id != 'MainPanel') {
            res.x += offsetParent.offsetLeft;
            res.y += offsetParent.offsetTop;
            test += "ID: " + offsetParent.id + " - offSetLeft: " + offsetParent.offsetLeft + " - Position: " + offsetParent.style.position + "\t\n";
            var parentTagName = offsetParent.tagName.toLowerCase();

            if ((__isIE && parentTagName != "table") || (__isFireFoxNew && parentTagName == "td")) {
                borderWidth = __getBorderWidth(offsetParent);
                res.x += borderWidth.left;
                res.y += borderWidth.top;
            }
            if (!__isIE) {
                while (offsetParent != parentNode && parentNode !== null) {
                    res.x -= parentNode.scrollLeft;
                    res.y -= parentNode.scrollTop;

                    if (__isFireFoxOld) {
                        borderWidth = __getBorderWidth(parentNode);
                        res.x += borderWidth.left;
                        res.y += borderWidth.top;
                    }
                    parentNode = parentNode.parentNode;
                }
            }

            parentNode = offsetParent.parentNode;
            offsetParent = offsetParent.offsetParent;
        }
    }
    return res;
}
function setupEditableGrid(GridId) {

    Context = this;
    var ToolBarPanel = 'ToolBarPanel_' + GridId;

    objTable = $('table[GridId="' + GridId + '"]')[0];
    if (typeof objTable == 'undefined') {
        $('div[PanelId*="ToolBarPanel_"]').css('display', 'none');
        return;
    };
    JQTable = $('table[GridId="' + GridId + '"]');
    JQTableColEditor = $(' .ColumnEditor', JQTable);
    this.tableResize = function() {
        objPos = getElementAbsolutePos(objTable);
        objToolBarPanel = $('div[PanelId="' + ToolBarPanel + '"]');
        objToolBarPanel.css({ position: 'absolute', top: objPos.y - 24, left: objPos.x + 68 });
    }
    this.tableResize();
    onResize = this.tableResize.createDelegate(Context);
    JQTable.resize(onResize);
    $(" [AutoComplete='true']", JQTable).each(function() {
        txtBoxContext = Context = this;

        var objColHead = $(objTable.rows[0].cells[$(this.parentNode).attr('ColumnIndex')]);
        var ColumnId = 'GCT' + objColHead.attr("ColumnId");

        //        $(this).autocomplete(
        //		                        "../../JQuery/AutoComplete/AutoComplete.aspx",
        //		                        {
        //		                            delay: 400,
        //		                            minChars: 4,
        //		                            matchSubset: 1,
        //		                            matchContains: 1,
        //		                            cacheLength: 10,
        //		                            extraParams: {GridId:GridId,ColumnId:ColumnId},
        //		                            onItemSelect: selectItem.createDelegate(txtBoxContext),
        //		                            onFindValue: findValue.createDelegate(txtBoxContext),
        //		                            onBlur: onBlur.createDelegate(txtBoxContext),
        //		                            formatItem: formatItem,
        //		                            autoFill: false,
        //		                            selectOnly: true,
        //		                            selectFirst: false,
        //		                            mustMatch: 1,
        //		                            //width: 400,
        //		                            // formValues: formValues,
        //		                            cellSeparator: '||'
        //		                        });
        $(this).autocomplete("../../JQuery/AutoComplete/AutoComplete.aspx", {
        width: 260,
        minChars: 3,
            extraParams: { GridId: GridId, ColumnId: ColumnId },
            selectFirst: false,
            formatItem: formatItem,
            //           onItemSelect: selectItem.createDelegate(txtBoxContext),
            //            onFindValue: findValue.createDelegate(txtBoxContext),
            //            onBlur: onBlur.createDelegate(txtBoxContext),
            cacheLength: 10,
            autoFill: false,
            mustMatch: 1,
            cellSeparator: '||',
            max: 500
        });
        $(this).result(selectItem);
    });
    $('> [ButtonAction="CancelEdit"]', objToolBarPanel).click(function() {
        $(this).css('display', 'none');
        JQTableColEditor.css('display', 'none');
        $('~ span', JQTableColEditor).css('display', '');
        $('> [ButtonAction="EditGrid"]', objToolBarPanel).val(' Edit ');
    });
    $('> [ButtonAction="EditGrid"]', objToolBarPanel).click(function() {
        if ($(this).val() == ' Edit ') {
            $(this).val(' Save ');
            $('> [ButtonAction="CancelEdit"]', objToolBarPanel).css('display', '');
            JQTableColEditor.each(function() {
                $('~ span', this).css('display', 'none');
                $(this).css('display', '');
                $(this).val($('~ span', this)[0].innerText);
                this.lastSelected = $('~ span', this)[0].innerText; //required for auto complete plug
            });
        }
        else {

            var AnyRowChanged = false;
            var RecordsToUpdate = $('<DataRows />');

            $('tr', JQTable).each(function() {
                var CurRow = $("<DataRow  />");
                var IsRowChanged;
                IsRowChanged = false;
                $('.ColumnEditor', this).each(function() {
                    var objColHead = $(objTable.rows[0].cells[$(this.parentNode).attr('ColumnIndex')]);

                    var ColumnId = objColHead.attr("ColumnId");
                    if (!IsRowChanged) IsRowChanged = $(this).val() != $("~ span", this)[0].innerText;


                    if (typeof objColHead.attr("updatekeyname") != 'undefined') {
                        CurRow.attr(objColHead.attr("updatekeyname"), $("~ span", this)[0].innerText)
                    }
                    var FieldValue = $.trim($(this).val()) == '' ? "@EV" : $(this).val();
                    CurRow.attr(ColumnId, FieldValue);

                    //objTable.rows[0]
                });
                if (IsRowChanged) {
                    RecordsToUpdate.append(CurRow);
                    if (!AnyRowChanged) AnyRowChanged = IsRowChanged;
                }
            });
            this.onWebServiceResponse = function(msg) {

                if (msg[0] == 'Ok') {
                    // Ext.Msg.alert('Widget Saved', '    Widget Saved Successfully!   ');
                    JQTableColEditor.each(function() {
                        $('~ span', this).css('display', '');
                        $(this).css('display', 'none');
                        $('~ span', this)[0].innerText = $(this).val();
                    });
                    $(this).val(' Edit ');
                    $('> [ButtonAction="CancelEdit"]', objToolBarPanel).css('display', 'none');
                    $("body").unmask();
                }
                else {
                    $("body").unmask();
                    alert("Unable to Save Data");
                }
            }
            if (AnyRowChanged) {
                var Context = this;
                var WebServiceResponse = this.onWebServiceResponse.createDelegate(Context);
                var doc = RecordsToUpdate[0].document;
                ServiceInfo = "GridId||" + GridId + "||DataToUpdate||" + RecordsToUpdate[0].outerHTML.replace(/"/g, '\\\"')

                $("body").mask("Wait while saving data");
                executeWidgetWebService("./WebServices/SimpleSingleGraphWS.aspx/ReportDesignerServiceRequest",
                    ['ServiceActionId', 'UpdateGridData', 'ServiceInfo', ServiceInfo], WebServiceResponse, function(msg) { $("body").unmask(); alert("Unable to connect to the server"); });
            }
            else {
                alert("There are no changes to be saved");
            }

        }
    });
}  
</script>

    <script language="javascript" type="text/javascript">
        var imgPlusPath = "../../App_Themes/Blue/Images/plus.gif";
        var imgMinusPath ="../../App_Themes/Blue/Images/minus.gif";
        
        var lastExpandedTableId=null;
        var lastExpandedImgId=null;
        
        function ShowHidSubCondition(img,tableId)
        {
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
    	                e=$('div');
    	                for(i=0;i< e.length;i++)								
    	                {														
    	               	       if(e[i].id!='undefined')
    	               	       {							
                                   if( e[i].id.indexOf('_trial') != -1) 
                                   {
                                        lastDiv=e[i];
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
		        function ShowNewExportDataPopup_old(Link)
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
                                <tr>
                                    <td align="center">
                                        <asp:Image ID="Image1" runat="server" ImageUrl="~/App_Themes/Silver/Images/eformsHome.gif"></asp:Image>
                                    </td>
                                    <td>
                                        <table width="100%">
                                            <tr>
                                                <td align="left">
                                                    <asp:Label ID="Label6" runat="server" CssClass="PWCLabelValue" ForeColor="#CC6600">Agility Corporate >> eForms MIS Portal</asp:Label><br />
                                                    <asp:Label ID="lblReportGroup" runat="server" CssClass="PWCSubTitleHeader" Font-Bold="True"
                                                        Font-Italic="True" Font-Size="10pt" ForeColor="#CC6600"></asp:Label>
                                                </td>
                                                <td align="right">
                                                    <asp:Label ID="txtError" runat="server" Text="" CssClass="PWCLabelValueRed"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr valign="top">
                                    <td width="200px">
                                        <table cellspacing="1" cellpadding="1" width="100%">
                                            <tr valign="top">
                                                <td>
                                                    <asp:Panel ID="SearchPanel" runat="server" Width="100%" Visible="True">
                                                        <table id="Table9" cellspacing="0" cellpadding="0" width="100%" border="0">
                                                            <tr valign="top">
                                                                <td>
                                                                    <table id="Table4" cellspacing="0" cellpadding="1" width="100%">
                                                                        <tr>
                                                                            <td colspan="2">
                                                                                <table cellspacing="0" cellpadding="0" width="100%" background="../../App_Themes/Blue/TemplateImages/cellback_SectionHeading.gif"
                                                                                    style="display: none">
                                                                                    <tr>
                                                                                        <td width="5%" style="height: 24px">
                                                                                            <img src="../../App_Themes/Blue/TemplateImages/clip_payment_LTR.gif" />
                                                                                        </td>
                                                                                        <td style="width: 35%">
                                                                                            <asp:Label ID="Label1" runat="server" CssClass="PWCSubTitleHeader">Categories</asp:Label>
                                                                                        </td>
                                                                                        <td align="right" width="3%">
                                                                                            <asp:ImageButton ID="Imagebutton1" runat="server" ImageUrl="../../App_Themes/Blue/TemplateImages/curve_sectionHeading_LTR.gif">
                                                                                            </asp:ImageButton>
                                                                                        </td>
                                                                                        <td valign="bottom" align="right" width="53%" background="../../App_Themes/Blue/TemplateImages/CellBack_sectionHeading1.gif">
                                                                                        </td>
                                                                                        <td>
                                                                                            <asp:ImageButton ID="Imagebutton3" runat="server" ImageUrl="../../App_Themes/Blue/TemplateImages/rightend_sectionHeading_LTR.gif">
                                                                                            </asp:ImageButton>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
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
                                                                                <%-- <eo:SlideMenu ID="SlideMenu1" runat="server" ControlSkinID="None" SlidePaneHeight="170"
                                                                                    Width="100%" >
                                                                                    <LookItems>
                                                                                        <eo:MenuItem ItemID="_TopGroup">
                                                                                            <SubMenu Style-CssText="BORDER-RIGHT: tan 1px solid; BORDER-TOP: tan 1px solid; FONT-WEIGHT: bold; FONT-SIZE: 11px; BORDER-LEFT: tan 1px solid; CURSOR: hand; FONT-FAMILY: tahoma">
                                                                                            </SubMenu>
                                                                                        </eo:MenuItem>
                                                                                        <eo:MenuItem Height="31" HoverStyle-CssText="border-bottom: tan 1px solid" Image-ExpandedUrl="~/App_Themes/Blue/images/MenuSelected.gif"
                                                                                            Image-HoverUrl="~/App_Themes/Blue/images/MenuHover.gif" Image-Mode="ItemBackground" Image-Url="~/App_Themes/Blue/images/MenuNormal.gif"
                                                                                            ItemID="_TopLevelItem" LeftIcon-Padding-Left="6" NormalStyle-CssText="border-bottom: tan 1px solid">
                                                                                            <SubMenu Style-CssText="padding-right: 10px; padding-left: 10px; font-size: 11px; padding-bottom: 2px; padding-top: 2px; border-bottom: tan 1px solid; font-family: tahoma">
                                                                                            </SubMenu>
                                                                                        </eo:MenuItem>
                                                                                        <eo:MenuItem Height="20" HoverStyle-CssText="font-weight: normal; text-decoration: underline"
                                                                                            ItemID="_Default" LeftIcon-Padding-Right="5" NormalStyle-CssText="font-weight: normal; text-decoration: none">
                                                                                        </eo:MenuItem>
                                                                                        <eo:MenuItem Height="20" ItemID="plain_text" LeftIcon-Padding-Right="5" NormalStyle-CssText="font-weight: normal;"
                                                                                            Text-NoWrap="False">
                                                                                        </eo:MenuItem>
                                                                                    </LookItems>
                                                                                </eo:SlideMenu>--%>
                                                                                <!-------------Demo---------- -->
                                                                                <!-------------/Demo---------- -->
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr valign="top">
                                                <td>
                                                    <asp:Panel ID="Panel1" runat="server" Visible="True" Width="100%">
                                                        <table id="Table10" cellpadding="1" cellspacing="0" width="100%">
                                                            <tr valign="top">
                                                                <td valign="top">
                                                                    <table style="background-image: url(<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetTemplateImagePath("cellback_sectionHeading.gif")%>)"
                                                                        cellspacing="0" cellpadding="0" width="100%" border="0">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td valign="top">
                                                                                    <img src="<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetTemplateImagePath("clip_payment_"+ ImageDirection("positive") + ".gif")%>" /></td>
                                                                                <td nowrap width="27%">
                                                                                    <img height="1" src="<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetImagePath("spacer.gif")%>"
                                                                                        width="5" border="0" />
                                                                                    <asp:Label ID="Label4" runat="server" CssClass="PWCSubTitleHeader" Text="Search"></asp:Label></td>
                                                                                <td>
                                                                                    <img src="<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetTemplateImagePath("curve_sectionHeading_"+ ImageDirection("positive") + ".gif")%>" /></td>
                                                                                <td width="100%" style="background-image: url(<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetTemplateImagePath("cellback_sectionHeading1.gif")%>)">
                                                                                </td>
                                                                                <td>
                                                                                    <img src="<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetTemplateImagePath("rightend_sectionHeading_"+ ImageDirection("positive") + ".gif")%>" /></td>
                                                                            </tr>
                                                                        </tbody>
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
                                    </td>
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
                                                                                            <table style="background-image: url(<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetTemplateImagePath("cellback_sectionHeading.gif")%>)"
                                                                        cellspacing="0" cellpadding="0" width="100%" border="0">
                                                                        <tbody>
                                                                            <tr>
                                                                                <td valign="top">
                                                                                    <img src="<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetTemplateImagePath("clip_payment_"+ ImageDirection("positive") + ".gif")%>" /></td>
                                                                                <td nowrap width="27%">
                                                                                    <img height="1" src="<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetImagePath("spacer.gif")%>"
                                                                                        width="5" border="0" />
                                                                                    <asp:Label ID="lblReportHead" runat="server" CssClass="PWCSubTitleHeader" Text="Reports & Dashboards (Beta)"></asp:Label></td>
                                                                                <td>
                                                                                    <img src="<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetTemplateImagePath("curve_sectionHeading_"+ ImageDirection("positive") + ".gif")%>" /></td>
                                                                                <td width="100%" style="background-image: url(<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetTemplateImagePath("cellback_sectionHeading1.gif")%>)">
                                                                                </td>
                                                                                <td>
                                                                                    <img src="<%=PWC.PresentationServices.Web.UI.Common.CommonUtils.GetTemplateImagePath("rightend_sectionHeading_"+ ImageDirection("positive") + ".gif")%>" /></td>
                                                                            </tr>
                                                                        </tbody>
                                                                    </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <asp:Panel ID="pnlLowerBody" runat="server" Height="100%" Width="100%" Visible="True">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" class="PWCTemplateTable" style="width: 100%">
                                                                                                    <tr>
                                                                                                        <td colspan="1" style="padding-left: 10px; padding-top: 10px; padding-bottom: 10px;">
                                                                                                            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%">
                                                                                                                <tr>
                                                                                                                    <td valign="bottom">
                                                                                                                        &nbsp;
                                                                                                                        <asp:Label ID="lblReportShortDetail" runat="server" Font-Bold="True" Font-Names="Verdana"
                                                                                                                            Font-Size="8pt" ForeColor="#CC6600" Text="Please select a report from left navigation panel."></asp:Label>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                                <tr>
                                                                                                                    <td style="height: 10px">
                                                                                                                        <img src="../../App_Themes/Blue/Images/spacer.gif" height="5" />
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                                <tr>
                                                                                                                    <td style="height: 10px">
                                                                                                                        <asp:Label ID="lblReportLongDetail" runat="server" Font-Names="Verdana" Font-Size="8pt"
                                                                                                                            ForeColor="Black" CssClass="PWCLabelWrapped" Font-Italic="True"></asp:Label>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td colspan="1">
                                                                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-top: tan 1px dotted;">
                                                                                                                <tr>
                                                                                                                    <td style="width: 90px; text-align: left">
                                                                                                                    </td>
                                                                                                                    <td style="text-align: left">
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="border-bottom: tan 1px dotted">
                                                                                                                <tr>
                                                                                                                    <td style="padding-left: 10px; padding-bottom: 2px;" colspan="2">
                                                                                                                        <asp:Label ID="lblReportDepth" runat="server" Font-Bold="True" Font-Names="Verdana"
                                                                                                                            Font-Size="8pt" ForeColor="#CC6600"></asp:Label>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td style="padding-top: 5px;">
                                                                                                            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%" id="tblGraph"
                                                                                                            runat="server">
                                                                                                            <tr>
                                                                                                                <td valign="top">
                                                                                                                </td>
                                                                                                                <td style="padding-left: 25px" valign="top">
                                                                                                                    <asp:Table ID="Table5" runat="server">
                                                                                                                        <asp:TableRow>
                                                                                                                            <asp:TableCell>
                                                                                                                                <asp:Panel ID="panelGraph" runat="server">
                                                                                                                                    <asp:Label ID="lblErrorDetail" runat="server" Visible="False"></asp:Label>
                                                                                                                                </asp:Panel>
                                                                                                                            </asp:TableCell>
                                                                                                                        </asp:TableRow>
                                                                                                                    </asp:Table>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                            <table border="0" cellpadding="0" cellspacing="0" style="width: 100%" id="tblGrid"
                                                                                                                runat="server">
                                                                                                                <tr>
                                                                                                                    <td valign="top">
                                                                                                                    </td>
                                                                                                                    <td valign="top">
                                                                                                                        <asp:Panel ID="PanelDGVMain" runat="server" Width="100%">
                                                                                                                            <input id="btnExportDataPopup" class="PWCButton" type="button" value="Export" 
                                                                                                                                style="margin-bottom: 5px; margin-left: 5px;width:70px" />
                                                                                                                            <asp:GridView ID="gvMain" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                                                                                CellPadding="1" CellSpacing="1" GridLines="None" Width="100%" Visible="true"
                                                                                                                                PageSize="20">
                                                                                                                                <HeaderStyle CssClass="AgilitySubPanelHeader GridHead GridHeader" />
                                                                                                                                <RowStyle CssClass="PWCOddRow PWCLabel" Font-Names="Verdana" Font-Size="7.5pt" />
                                                                                                                                <PagerStyle BackColor="#F7F0D6" CssClass="pagelink" Font-Bold="True" />
                                                                                                                                <AlternatingRowStyle CssClass="PWCEvenRow PWCLabel" Font-Names="Verdana" Font-Size="7.5pt" />
                                                                                                                            </asp:GridView>
                                                                                                                        </asp:Panel>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </asp:Panel>
                                                                                            <asp:Panel ID="pnlWelcome" runat="server" Height="100%" Width="100%" Visible="True">
                                                                                                <table border="0" cellpadding="0" cellspacing="0" class="PWCTemplateTable" style="width: 100%;">
                                                                                                    <tr>
                                                                                                        <td valign="top">
                                                                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%" height="100%">
                                                                                                                <tr>
                                                                                                                    <td width="50%" style="padding-right: 10px; padding-left: 10px; padding-top: 10px;">
                                                                                                                        <asp:Label ID="Label3" runat="server" CssClass="PWCListTitle" Font-Bold="True" Font-Italic="False"
                                                                                                                            Font-Size="12pt" Font-Underline="False">Reports & Dashboards (Beta Version)</asp:Label></td>
                                                                                                                    <td width="50%" style="padding-right: 20px; padding-top: 20px; padding-left: 20px;
                                                                                                                        padding-bottom: 20px;" align="right" rowspan="3" valign="top">
                                                                                                                        <asp:Image ID="Image2" runat="server" ImageUrl="~/App_Themes/Blue/Images/WelcomeGraph.gif" /></td>
                                                                                                                </tr>
                                                                                                                <tr>
                                                                                                                    <td style="padding-right: 10px; padding-left: 10px; padding-top: 10px;" valign="top"
                                                                                                                        rowspan="2">
                                                                                                                        <asp:Label ID="Label2" runat="server" Font-Bold="True" CssClass="PWCListTitle" ForeColor="Black">The system provides wide range of analytical and graphical reports inbuilt with the extended capability of generating custom reports.  Its dashboard provides KPI monitoring and graphical presentation of analytical data, that can be monitored online and contribute towards Decision Making</asp:Label><br />
                                                                                                                        <br />
                                                                                                                        <asp:Label ID="Label5" runat="server" CssClass="PWCListTitle" Font-Bold="False" ForeColor="DimGray"
                                                                                                                            Font-Italic="False" Font-Size="10pt">We aim to simplify the visibility over the Business Processes across Agility Enterprise</asp:Label></td>
                                                                                                                </tr>
                                                                                                                <tr>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </asp:Panel>
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
    <table id="ExportMenu" style="display:none;font-family: verdana; font-size: 11px;width:145px;border:1px solid silver" border="0" cellpadding="0" cellspacing="0" >
    <tr style="">
        <td  style="background-image: url('../../App_Themes/Blue/Images/DashBoard/ExportStartMenuBack.gif');height:26px;width:15px;border-bottom:1px solid silver" >
            <img alt="" src="../../App_Themes/Blue/Images/DashBoard/SubArrow.gif" 
                style="margin-left: 7px; margin-right: 7px;" /></td>
        <td export="excel"  style="cursor:pointer; background-image: url('../../App_Themes/Blue/Images/DashBoard/ExportMenuBack.gif');border-bottom:1px solid silver;  text-indent: 3px;">
            To Excel
        </td>
    </tr>
        <tr >
        <td  style="background-image: url('../../App_Themes/Blue/Images/DashBoard/ExportStartMenuBack.gif');height:25px;width:15px;" >
            <img alt="" src="../../App_Themes/Blue/Images/DashBoard/SubArrow.gif" 
                style="margin-left: 7px; margin-right: 7px;" /></td>
        <td export="pdf" style="cursor:pointer;background-image: url('../../App_Themes/Blue/Images/DashBoard/ExportMenuBack.gif'); text-indent: 3px;">
            To PDF
        </td>

    </tr>
    <tr><td colspan="2" >
                       
                    <table  border="0" cellpadding="0" cellspacing="0" style="padding:3px;width:100%;border:1px solid black;font-family: verdana; font-size: 8.5pt;background-color:White">
                    <tr>
                        <td style="background-color:#F2F2F2">
                        Page Size:

                        </td>
                    </tr>
                     <tr>
                        <td style="background-color:#E2E2E2">

                            <input  checked="checked" name="rdoPDFSize" type="radio" value="A4" />&nbsp; A4
                            <input   name="rdoPDFSize" type="radio" value="Auto" />&nbsp; Auto
                            </td>
                    </tr>
                    <tr>
                        <td  style="background-color:#F2F2F2">
                        Single Page:
                           
                        </td>
                                            </tr>
                     <tr>
                        <td style="background-color:#E2E2E2">
                            <input id="chkSinglePagePDF" type="checkbox"   />&nbsp; Single Page</td>
                        
                    </tr>
                    </table>
    
    
    </td></tr>

 </table>
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

</asp:Content>

