window.$get = window.$get || function (id) { return $('#' + id).length ? $('#' + id)[0] : null; };
var __isIE =  navigator.appVersion.match(/MSIE/);
var __userAgent = navigator.userAgent;
var __isFireFox = __userAgent.match(/firefox/i);
var __isFireFoxOld = __isFireFox && (__userAgent.match(/firefox\/2./i) || __userAgent.match(/firefox\/1./i));
var __isFireFoxNew = __isFireFox && !__isFireFoxOld;
var TimersCollection= new Object();
var enableOutTimer=true;

var __DEBUG__ = false;
var timeInterval;
var lastDiv=null;
function Stack() {
    this.elements = new Array();
    this.reset = function() { this.elements = new Array(); };
    this.push = function(obj) { this.elements.push(obj); };
    this.pop = function() { return this.elements.pop(); };
    this.empty = function() { return !this.elements.length; };
    this.size = function() { return this.elements.length; };
    this.top = function() { return this.elements[this.elements.length - 1]; };
}

function Queue() {
    this.elements = new Array();
    this.clear = function() { this.elements = new Array(); };
    this.enqueue = function(obj) { this.elements.push(obj); };
    this.dequeue = function() { return this.elements.shift(); };
    this.hasElements = function() { return !this.elements.length; };
    this.count = function() { return this.elements.length; };
    this.pop = function() { return (this.elements.length >0 ? this.elements[0]: null); };
}

function DocumentMouseMove1(e) {
    var pageCoords = "( " + e.pageX + ", " + e.pageY + " )- " + e.target.id; //+ ' - Class -' + e.target.className + ' - Tag -'+e.target.tagName;
    var clientCoords = "( " + e.clientX + ", " + e.clientY + " )";
    pelems = $(e.target).parents().map(function() {
    return this.id;

    }).get().join(',');
    document.getElementById("fixme1").innerText = "( e.pageX, e.pageY ) - " + pageCoords + ' - ' +pelems;//; + " palams: " + pelems;

}
function DocumentMouseMove(e)
{
    var pageCoords = "( " + e.pageX + ", " + e.pageY + " )- " + e.target.id;
    var clientCoords = "( " + e.clientX + ", " + e.clientY + " )";
   
    pelems = $(e.target).parents().map(function() {
   

        a = 10;
        b = a;
        if (this.className == 'spPanel') {//this.id.indexOf("_Panel") != -1 && this.tagName != 'div') {
            return this.id;
        }
        else if (this.id=='eo_root' ){ //|| this.id.indexOf('_eo_ctl') != -1) {
            return this.id;
        }
        else return '';
    }).get().join(',');      //pelems.replace(new RegExp(pelems,'g') ,'')
    //debugger;
    var pelemsRep = pelems.replace(new RegExp(',', 'g'), '');
   
    if (pelemsRep == '') {
        setTimeout(function() {
            $('.spPanel').hide()
        }, 500);
        $(document).unbind('mousemove', DocumentMouseMove);
    }


}
function debugSetup() {

    var cookieDebug = $.cookie("EnableDebug");
    if (!window.__DEBUG__) {
        if (!!cookieDebug) {
            __DEBUG__ = true;
        }
        else {
            if (!!$.url.param("EnableDebug")) {
                __DEBUG__ = true;
                $.cookie("EnableDebug", "true", { expires: 1 });
            }
            
        }
    }
    var debugSetupSK = function() {
        if (!window.__DEBUG__) {
            __DEBUG__ = true;
            $.cookie("EnableDebug", "true");
        }
        else {
            __DEBUG__ = false;
            $.cookie("EnableDebug", null);
        }
        !!window.__DEBUG__ ? $('#Logger').css('display', '') : $('#Logger').css('display', 'none')
    }
    $(document).bind('keydown', 'Ctrl+d', debugSetupSK);
    !!window.__DEBUG__ ? $('#Logger').css('display', '') : $('#Logger').css('display', 'none')
    //debugger;
    //$(document).unbind('keydown', 'Ctrl+Shift+d', debugSetupSK);
}

$(document).ready(function() {
    debugSetup();
    /* Add by Prakash*/
        if(typeof(trMasterMenu) != "undefined")
        {
            if(trMasterMenu!=null)
            {
                trMasterMenu.style.display='none';  
            }

        }
        if(typeof(trMasterPageHeader) != "undefined")
        {
            if(trMasterPageHeader!=null)
            {
                trMasterPageHeader.style.display='none';  
            }
        }
        if(typeof(tblfooter) != "undefined")
        {
            if(tblfooter!=null)
            {
                tblfooter.style.display='none';  
            }
        }
        setTimer();
    
    //-----------Hover  on Search Image-------------//
    $("img[class=dummyImage]").hover(function(e) { // Image Hover In
        var divId = this.id.replace('_img', '_Panel');
        
        if (TimersCollection[divId] !== null) {
            clearTimeout(TimersCollection[divId]);
            TimersCollection[divId] = null;
        }
        ShowSearchPanel(this, e);
    }, function(e) {// Image Hover out 
        var imgId = this.id;
        var divId = this.id.replace('_img', '_Panel');
        TimersCollection[divId] =
		    setTimeout(function() {
		        if (divId != '')
		            $('#' + divId).hide();
		    }, 500)
    });

    //----------Hover on Search Div tag--------------//
    $("div[class=spPanel]").hover(function(e) {// Div Hover In

        $(document).unbind('mousemove', DocumentMouseMove);
        if (TimersCollection[this.id] !== null) {


            var divId = this.id;
            clearTimeout(TimersCollection[divId]);
            TimersCollection[divId] = null;

        }
    }, function(e) {// Div Hover out 
        var divId = this.id;
        $(document ).bind('mousemove', DocumentMouseMove);

    });
    InitWidgets();
    setTimeout(function() { objSearchPanels.updateWidgets(); },4000);

});


// Function for hiding the License
function setTimer()
{
   // clearInterval(timeInterval);
    timeInterval=window.setInterval('HideLicenceDiv()',0)
    //alert('time is set');
}
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
//

function DrillUpArrow_Click(ParentWidgetId, ChildWidgetId) {
    hideElement(objWidgets.getWidgetById(ChildWidgetId).ContainerClientId);
    showElement(objWidgets.getWidgetById(ParentWidgetId).ContainerClientId);


}
function DrillDownArrow_Click(ParentWidgetId, ChildWidgetId) {
    hideElement(objWidgets.getWidgetById(ParentWidgetId).ContainerClientId);
    showElement(objWidgets.getWidgetById(ChildWidgetId).ContainerClientId);
}
/* Function to show Search Panel */
function showMnu(mnu, elem, cf) {
    //p is the offset parent to elem
    var _cf = { mnuLeftOff: 0, mnuTopOff: 0 };
    cf = cf || {};
    //Ext.applyIf(cf, { mnuLeftOff: 0, mnuTopOff: 0 });
    $.extend(_cf, cf);
    cf = _cf;
    if (!mnu || !elem) return;
    var p, isBody, isIE6 = false, bVer, jMnu, jElem, pTop, pLeft, eBot, eRig, eLeft, ePos, eH, eW = 0;
    if (mnu instanceof jQuery) {
        jMnu = mnu;
        mnu = mnu[0]
    }
    else
        jMnu = $(mnu);
    if (elem instanceof jQuery) {
        jElem = elem;
        elem = elem[0]
    }
    else
        jElem = $(elem);
    jMnu.css({ 'position': 'absolute' });
    if ($.browser.msie && parseInt($.browser.version, 10) == 6)
        isIE6 = parseInt($.browser.version, 10);
    p = jMnu.offsetParent();
    isBody = p[0].tagName == 'BODY';
    ePos = jElem.offset();
    eH = jElem.height();
    //(eTop+eHeight + OPTopBorderWidth(if body elem)) -  (POffsetTop + OPTopBorderWidth(if IE6 OR body elem)

    //if the offsetparent is body it's offsettop will be 0; if browser is IE6 or offsetparent is body  don't add width
    eBot = (ePos.top + eH + (isBody ? parseInt(p.css('border-top-width')) || 0 : 0))
		                                                - ((isBody ? 0 : p.offset().top) + (isIE6 || isBody ? 0 : parseInt(p.css('border-top-width')) || 0));

    eLeft = (ePos.left + (isBody ? parseInt(p.css('border-left-width')) || 0 : 0))
		                                                - ((isBody ? 0 : p.offset().left) + (isIE6 || isBody ? 0 : parseInt(p.css('border-left-width')) || 0));
    //eLeft = eRig; // -jMnu.outerWidth(); -jElem.width();

    jMnu.css({ "left": (eLeft + cf.mnuLeftOff) + "px", "top": (eBot + cf.mnuTopOff) + "px" }).show();
}
function ShowSearchPanel(SearchIco,event)
{

        if(typeof(SearchIco.id)!='undefined' && SearchIco.id!=null)
        {
            var  SearchPnl = $('#' + SearchIco.id.replace('_img', '_Panel'));
          //  var tblSearchPanel = $get(SearchIco.id.replace('_img','_Panel'));
          //  var JQSearchPanelId = '#' + SearchIco.id.replace('_img','_Panel');
           // var elemPos = getElementAbsolutePos(SearchIco, tblSearchPanel.offsetParent.id);
           // var newLeft = elemPos.x //btnPosition.left;
           // var IsSearchPanelHidden = false;
            // $(JQSearchPanelId).css({position: 'absolute','z-index': 9009});
            //debugger;
            showMnu(SearchPnl, SearchIco, { mnuTopOff: -((SearchPnl.height() || 0) + ($(SearchIco).height() || 0)) });
            $(SearchIco).parent
            
            var bgColor = SearchIco.parentElement.parentElement.parentElement.parentElement.style.backgroundColor;
            bgColor = bgColor == "" ? 'tan' : bgColor;
            $('table', SearchPnl).css('background-Color', bgColor);

            /*
             $(JQSearchPanelId + ' table').css({
                 backgroundColor: bgColor
             });
            if (tblSearchPanel.style.display == 'none') {
                $(JQSearchPanelId).css({
                    display: '', left: -10000, position: 'absolute'
                });
            }
        
            var newTop = elemPos.y - tblSearchPanel.offsetHeight;  
            if (IsSearchPanelHidden) {
                $(JQSearchPanelId).css({
                    display: 'none'
                });
            }
            else {
                $(JQSearchPanelId).css({
                    display: ''
                });
            }
            $(JQSearchPanelId).css({
                marginLeft: 0, marginTop: 0,
                top: newTop, left: newLeft
            });
            */
        }
}

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

//returns the absolute position of some element within document
function getElementAbsolutePos(element,offsetParentId) {
	    var res = new Object();
	    res.x = 0; res.y = 0;
	    if (element !== null) {
		    res.x = element.offsetLeft;
		    res.y = element.offsetTop;
        	
		    var offsetParent = element.offsetParent;
		    var parentNode = element.parentNode;
		    var borderWidth = null;
		   // debugger;
		    var test = "";
		    while (offsetParent != null && offsetParent.id != offsetParentId) {//&& offsetParent.id != 'MainPanel') { //&& parentNode.id != 'MainPanel') {
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

 function getObjectClass(obj) {  
     if (obj && obj.constructor && obj.constructor.toString) {  
         var arr = obj.constructor.toString().match(  
             /function\s*(\w+)/);  
   
         if (arr && arr.length == 2) {  
             return arr[1];  
         }  
     }  
   
     return undefined;  
 } 
function WidgetCollection() {
    this.WidgetsById = new Object();
    this.WidgetsByClientId = new Object();

    this.addWidget = function(objWidget, strWidgetId){//, strWidgetClientId) {
        this.WidgetsById[strWidgetId] = objWidget;
        // this.WidgetsByWidgetsByClientIdyId[strWidgetClientId] = objWidget;

    }
    this.getWidgetById = function(strWidgetId) {
        return this.WidgetsById[strWidgetId];
    }
     this.updateWidget = function(strWidgetId) {
        //debugger;
        this.WidgetsById[strWidgetId].updateWidget();
    }
    /*
    this.getWidgetsByClientId = function(strWidgetClientId) {
        return this.WidgetsByClientId[strWidgetClientId];
    }*/
}
var objWidgets = new WidgetCollection();
function executeWidgetWebService(webMethod, parameters, successFn,errorFN) {
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
    var errHnadler = errorFN || function(msg) {alert("Error Occured While Executing web service\t\n" + msg.responseText)};
    paramList = '{' + paramList + '}';
    //Call the page method

    $.ajax({
        type: "POST",
        url: webMethod,
        contentType: "application/json; charset=utf-8",
        data: paramList,
        dataType: "json",
        success: successFn,
        error: errHnadler
    })
;
} 

        /*
string.Format(@"executeWebService('XmlHttpPanelWebService.asmx/GetASPGridHTML', 
['ReportId', '{0}','WidgetId','{1}','PageIndex',$('#{2}').val(),'SortBy','{3}','Parameters','{4}'], OnClientResponseEnd);
$('#" + GridContainer.ClientID + "').html('Wait while retrieving data!');return false;"
        */
function UpdateableWidget(strWidgetId, strWidgetType, objWidgetControl, strSearchPanelId) {
    this.WidgetId = strWidgetId;
    this.WidgetType = strWidgetType;
    this.WidgetControl = objWidgetControl;
    this.SearchPanelId = strSearchPanelId;
    this.DrillDownWidgetId = "";
    this.SearchPanelsToUpdate = "";
    this.ParentWidgetId = "";
    this.ChildWidgetId = "";
    this.ContainerClientId = "";
    this.NoOfTries = 0;
    
    this.showError = function(err,ErrMsg) {
        if (typeof (__DEBUG__) != "undefined" && __DEBUG__ != null) {
            alert(ErrMsg + err.description);
        }
    }
    this.showMask = function(msg) {
        try {
            var shMask = function(msg) {
                if (this.maskVisible) {
                    $('#' + this.ContainerClientId).closest('td').mask(msg);
                }
            }
            this.maskVisible = true;
            shMask.defer(200, this, [msg]);
        }
        catch (err) { this.showError(err, "Error occured while showing mask\n\nDescription: ") };
    }
    this.hideMask = function() {
        var Container = $('#' + this.ContainerClientId).closest('td');
        this.maskVisible = false;
        $('#' + this.ContainerClientId).closest('td').unmask();

    }
    this.updateWidget =
        function() {






            if (parseInt(document.getElementById(this.ContainerClientId).style.left) != -1000) {
                var searchParams = objSearchPanels.getSearchPanel(this.SearchPanelId).getFieldNameValuesWithPipe();
                if (this.WidgetType == 'FusionChart') {
                    thisWidget = this;
                    var QueryWidgetsDataWebService='WebServices/QueryWidgetsData.asmx';
                    //var WebMethod = 'http://eformsmis.agilitylogistics.com/DotNetPages/reportsengine/webservices/QueryWidgetsData.asmx/GetChartData'
                    var WebMethod= QueryWidgetsDataWebService + '/GetChartData';
                    
                    $('.spPanel') .hide()
                    $(document).unbind('mousemove', DocumentMouseMove);
                    
                    this.showMask('Wait while retrieving data...');
                    executeWidgetWebService(WebMethod,
                    ["NextReportId", strNextReportId, "WidgetId", this.WidgetId, "SearchParameters", searchParams],
                     this.OnChartDataUpdate.createDelegate(thisWidget),
                     this.OnChartDataUpdateError.createDelegate(thisWidget)
                    );

                }
                else if (this.WidgetType == 'ASPGrid') {
                    this.UpdateGrid(searchParams);
                }
            }
        }
         this.OnChartDataUpdate = function(XMLData) {
            this.NoOfTries = 0;
            try {
                this.hideMask();
                objWidgets.getWidgetById(this.WidgetId).WidgetControl.setDataXML(XMLData[1]);
            }
            catch (err) {
                this.hideMask();
                if (!window.__DEBUG__) alert($.format('Unable to  load chart data:{0}', this.WidgetId));
                logmsg($.format('"Unable to load chart data!\n ChartId:{0}\nDescription:\n{1}"', this.WidgetId, err.description));
            }
        }
        this.OnChartDataUpdateError = function(msg) {
        logmsg($.format('Chart WS Call Failed Try No({2}): \n WidgetId: {0} \n Response Text:\n{1}', this.WidgetId, msg.responseText, this.NoOfTries));
            if (this.NoOfTries > 5) {
                this.NoOfTries = 0;
                this.hideMask();
                if (!window.__DEBUG__) alert($.format('Unable to update chart:{0}',this.WidgetId));
                return;
            }
            this.NoOfTries++;
            var Context = this;
            setTimeout(this.updateWidget.createDelegate(Context), 1000);
        }
        this.UpdateGrid =
        function(Params) {
            thisWidget = this;
            var QueryWidgetsDataWebService = 'WebServices/QueryWidgetsData.asmx';
            //var WebMethod = 'http://eformsmis.agilitylogistics.com/DotNetPages/reportsengine/webservices/QueryWidgetsData.asmx/GetChartData'
            var WebMethod = QueryWidgetsDataWebService + '/GetASPGridHTML';

            executeWidgetWebService(WebMethod,
                ["ReportId", strNextReportId, "WidgetId", this.WidgetId, 
                "PageIndex", (!!$('.' + this.WidgetId + '__txtPageIndex').val()?$('.' + this.WidgetId + '__txtPageIndex').val(): '0'), 
                "SortBy", (!!$('.' + this.WidgetId + '__txtSortBy').val() ? $('.' + this.WidgetId + '__txtSortBy').val() :''),
                "Parameters", Params], thisWidget.OnGridUpdated, thisWidget.OnGridUpdateError.createDelegate(thisWidget));
            divHeight = $("#" + this.ContainerClientId + '_GridDiv').get(0).offsetHeight;
            $("#" + this.ContainerClientId + '_GridDiv')[0].innerHTML = '<table style="width:100%;font-family:Verdana;font-size:8pt;Height:' + divHeight + 'px;text-align: center; vertical-align: middle"><tr valign="middle"><td><img src="../../App_Themes/Blue/Images/CascadeLoading.gif" style="vertical-align:middle" /><br/>Loading data...</td></tr></table>';
        }
        this.OnGridUpdateError = function(msg) {
            logmsg($.format('Grid WS Call Failed Try No({2}): \n WidgetId: {0} \n Response Text:\n{1}', this.WidgetId, msg.responseText, this.NoOfTries));

            if (this.NoOfTries > 5) {
                this.NoOfTries = 0;
                if (!window.__DEBUG__) alert($.format('Unable to update grid:{0}', this.WidgetId));

            }
            this.NoOfTries++;
            var Context = this;
            setTimeout(this.updateWidget.createDelegate(Context), 1000);
        }
        this.OnGridUpdated = function(msg) {
            $("#" + objWidgets.getWidgetById(msg[0]).ContainerClientId + '_GridDiv')[0].innerHTML = msg[1];

            ////////////////////////////-- Start Grid Tool Tip Code --//////////////////
            $('.ShowToolTip').each(function() {
                $(this).unbind('mouseover');
                $(this).unbind('mouseleave');
            });

            $('.ShowToolTip').each(function() {
                $(this).bind('mouseover', function() { Tip($(this).attr('SmartText'), CENTERMOUSE, true, OFFSETX, 0, ABOVE, true, JUMPHORZ, true, JUMPVERT, true) });
                $(this).bind('mouseleave', function() { UnTip() });

            });
            ////////////////////////////-- End Grid Tool Tip Code --//////////////////

        }
    this.getDrillDownArrow =
        function() {
        return $('#' + this.ContainerClientId+ "_DrillDown").length > 0 ?
           $(this.ContainerClientId+ "_DrillDown")[0] : null;
        }
    this.getDrillUpArrow =
        function() {
        return $('#' + this.ContainerClientId+ "_DrillUp").length > 0 ?
           $(this.ContainerClientId+ "_DrillUp")[0] : null;
    }

    this.ShowDrillDownArrow =
        function() {

            $('#' + this.ContainerClientId  +   "_DrillDown").show();
            $('[relatedid="' + this.ContainerClientId + '_DrillDown_RelId"]').show();

        }
    this.ShowDrillUpArrow =
        function() {
            $('#' + this.ContainerClientId + "_DrillUp").show();
            $('[relatedid="' + this.ContainerClientId + '_DrillUp_RelId"]').show();
       }
       this.drillDown =
        function(ChildWidget) {
            this.ShowDrillDownArrow();
            ChildWidget.ShowDrillUpArrow();

            
            hideElement(this.ContainerClientId);
            showElement(ChildWidget.ContainerClientId);
        }
}
function SearchField(strSearchFieldId, objSearchFieldControl, strSearchFieldType, strParentComboId, strChildComboId, strFieldValueType, strEmptyValue, strWhenEmptyValue) {
    this.searchFieldType = strSearchFieldType;
    this.parentComboId = strParentComboId;
    this.searchFieldId = strSearchFieldId;
    this.searchFieldControl = objSearchFieldControl;
    this.childComboId = strChildComboId;
    this.searchPanelId = '';
    this.FieldValueType = strFieldValueType;
    this.emptyValue = strEmptyValue;
    this.whenEmptyValue = strWhenEmptyValue;
    this.searchFieldId.searchFieldClientId = this.searchFieldControl.id;
    this.isSettingValue = false; // Flag if the Casecade Combo value is waiting to be set
    this.getSearchFieldValue =
        function() {
            var ReturnValue = '';
            if (this.searchFieldType == "TextBox") {
                ReturnValue = this.searchFieldControl.value;
            }
            else if (this.searchFieldType == "ComboBox" || this.searchFieldType == "ComboBoxValues"
                    || this.searchFieldType == "LookUpComboBox" || this.searchFieldType == "LookUpComboBoxCascade") {
                if (this.FieldValueType == 'Value') {
                    ReturnValue = this.searchFieldControl.options[this.searchFieldControl.selectedIndex].value
                }
                else {
                    ReturnValue = this.searchFieldControl.options[this.searchFieldControl.selectedIndex].text
                }

            }
            else if (this.searchFieldType == "DateControl") {
                objDateFieldValue = this.searchFieldControl.getSelectedDate();
                if (objDateFieldValue != undefined) {
                    ReturnValue = this.searchFieldControl.formatDate(objDateFieldValue, 'yyyy-MM-dd');
                }
                else {
                    alert("Date Value Couldn't Be Read");

                }
            }
            else {
                return '';
            }
            if (ReturnValue == this.emptyValue) {
                return this.whenEmptyValue;
            }
            else {
                return ReturnValue;
            }
        }

        this.setSearchFieldValueCaller = function(strValueToSet) {

            var SF = this; //Required For Deffered(Delayed) Calls
            var SP = objSearchPanels.getSearchPanel(this.searchPanelId);
            var IsCurSFBeingSet = SP.valueSetQueue.pop() == this.searchFieldId;
            
            if ($(this.searchFieldControl).css('display') == 'none' || !IsCurSFBeingSet) {
                setSearchFieldValueCallerer = function() { SF.setSearchFieldValueCaller(strValueToSet); }
                setTimeout(setSearchFieldValueCallerer, 200);
                return;
            }
            this.setSearchFieldValue(strValueToSet);
        }
        this.setSearchFieldValue =
        function(strValueToSet) {
            if (this.searchFieldType == "TextBox") {
                this.searchFieldControl.value = strValueToSet;
            }
            else if (this.searchFieldType == "ComboBox" || this.searchFieldType == "ComboBoxValues"
                    || this.searchFieldType == "LookUpComboBox" || this.searchFieldType == "LookUpComboBoxCascade") {
                var IsItemFound = false;

                //------------------------Start Deffered Calling ---------------------------------//
                var SF = this; //Required For Deffered(Delayed) Calls
                var SP = objSearchPanels.getSearchPanel(this.searchPanelId);
                var IsCurSFBeingSet = SP.valueSetQueue.pop() == this.searchFieldId;

                //First call for the combo box

                if (this.searchFieldType == "LookUpComboBoxCascade") {
                    if (!this.isSettingValue) {

                        SP.valueSetQueue.enqueue(this.searchFieldId);
                        this.isSettingValue = true;
                    }
                    if ($(this.searchFieldControl).css('display') == 'none' || !IsCurSFBeingSet) {
                        var setSearchFieldValueTimer = function() { SF.setSearchFieldValueCaller(strValueToSet); }
                        setTimeout(setSearchFieldValueTimer, 200);
                        return;
                    }
                }

                //------------------------End Deffered Calling ---------------------------------//
                if (strValueToSet == this.whenEmptyValue) {
                    strValueToSet = this.emptyValue;
                }

                if (this.FieldValueType == 'Value') {

                    //this.searchFieldControl.value = strValueToSet;
                    for (var i = 0; i < this.searchFieldControl.options.length; i++) {
                        if (this.searchFieldControl.options[i].value == strValueToSet) {
                            this.searchFieldControl.options[i].selected = true;
                            IsItemFound = true;
                            break;
                        }
                    }
                    if (!IsItemFound) {
                        for (var i = 0; i < this.searchFieldControl.options.length; i++) {
                            if (this.searchFieldControl.options[i].text == strValueToSet) {
                                this.searchFieldControl.options[i].selected = true;
                                IsItemFound = true;
                                break;
                            }
                        }
                    }
                }
                else {
                    this.searchFieldControl.text = strValueToSet;
                    for (var i = 0; i < this.searchFieldControl.options.length; i++) {
                        if (this.searchFieldControl.options[i].text == strValueToSet) {
                            this.searchFieldControl.options[i].selected = true;
                            IsItemFound = true;
                            break;
                        }
                    }
                    if (!IsItemFound) {
                        for (var i = 0; i < this.searchFieldControl.options.length; i++) {
                            if (this.searchFieldControl.options[i].value == strValueToSet) {
                                this.searchFieldControl.options[i].selected = true;
                                IsItemFound = true;
                                break;
                            }
                        }
                    }
                }
                if (this.searchFieldType == "LookUpComboBoxCascade"  ) {
                    if (IsItemFound && this.childComboId !="" ) OnClientSelectedIndexChanged(this.searchFieldControl.id);
                    SP.valueSetQueue.dequeue();
                    this.isSettingValue = false;
                }

            }
            else if (this.searchFieldType == "DateControl") {
                var arrDate = strValueToSet.split('-')
                var aDate = new Date(arrDate[0], arrDate[1] - 1, arrDate[2])
                this.searchFieldControl.setSelectedDate(aDate);
            }
        }
    }


/////////////////////////////////////////--- Search Panel Class ---//////////////////////////
function SearchPanel(searchPanelId) {
    this.searchPanelId = searchPanelId;
    this.searchFields = new Object();
    this.searchFieldsByClientId = new Object();
    this.widgetsToUpdate = new Object();
    this.count = 0;
    this.valueSetQueue = new Queue();
    objWidgets.addWidget(this, searchPanelId);
    this.tryUpdateWidgetsCaller = function() {
        this.tryUpdateWidgets();
    }
    this.tryUpdateWidgets =
        function() {
            var thisSP = this;
            //debugger;

            if (this.valueSetQueue.count() <= 0) {
             //   $('#TextArea1').val($('#TextArea1').val() + "\nStart Update Casecades:" + this.searchPanelId);
                this.updateWidgets();
            }
            else {
             //   $('#TextArea1').val($('#TextArea1').val() + "\nWait Casecades:" + this.searchPanelId + " - NoOf" + this.noOfCaseCadesToUpdate + " - DDLsInWait" + this.DDLsInWait.length);
                tryUpdateWidgetsTimer = function() { thisSP.tryUpdateWidgetsCaller(); }
                setTimeout(tryUpdateWidgetsTimer, 1000);
            }
        }
        
    this.updateWidgets =
        function() {
    //debugger;
            //objSearchPanel =objSearchPanels.getSearchPanel(searchPanelId)
            //debugger;
            for (var widgetToUpdate in this.widgetsToUpdate) {
                this.widgetsToUpdate[widgetToUpdate].updateWidget();
            }
        }
    this.addWidget =
        function(strWidgetId, strWidgetType, objWidgetControl) 
        {
            this.widgetsToUpdate[strWidgetId] = new UpdateableWidget(strWidgetId, strWidgetType, objWidgetControl, searchPanelId);
            objWidgets.addWidget(this.widgetsToUpdate[strWidgetId], strWidgetId);
        }

    this.addField =
        function(strSearchFieldId, objSearchFieldControl, strSearchFieldType, strParentComboId, strChildComboId, strFieldValueType, strEmptyValue, strWhenEmptyValue) {
            this.searchFields[strSearchFieldId] = new SearchField(strSearchFieldId, objSearchFieldControl, strSearchFieldType, strParentComboId, strChildComboId, strFieldValueType, strEmptyValue, strWhenEmptyValue);
            this.searchFields[strSearchFieldId].searchPanelId = this.searchPanelId;
            this.searchFieldsByClientId[objSearchFieldControl.id] = this.searchFields[objSearchFieldControl.id];
            this.count++;
        }

    this.getSearchField =
        function(strSearchFieldId) {
            return this.searchFields[strSearchFieldId]
        }

    this.resetChildern =
        function(strSearchFieldId) {

            currentField = this.searchFields[strSearchFieldId];

            currentFieldonchangeEvent = currentField.searchFieldControl.onchange;

            currentField.searchFieldControl.onchange = null;
            cleardropdownlist(currentField.searchFieldControl);
            currentField.searchFieldControl.options[0] = new Option('---- Select Value ----', '-1');
            //  alert(currentField.searchFieldControl.id + ' - ' + currentField.childComboId);

            currentField.searchFieldControl.onchange = currentFieldonchangeEvent;
            if (trim(currentField.childComboId) == '') {
                return;
            }
            this.resetChildern(this.searchPanelId + '_' + currentField.childComboId);
        }
        this.getFieldNameValuesWithPipe =
        function() {
            ParamValues = '';
            for (var SF in this.searchFields)
            {
                var SField = this.searchFields[SF]
                ParamValues += SField.searchFieldId.split('_')[1] + '|' + SField.getSearchFieldValue() + '|';
                if (SField.searchFieldType.indexOf('ComboBox')!= -1 && SField.FieldValueType == 'Value') 
                {
                    var TextValue = SField.searchFieldControl.options[SField.searchFieldControl.selectedIndex].text;
                    ParamValues += SField.searchFieldId.split('_')[1] + 'Text|' + TextValue + '|';
                }
            }
            return ParamValues.substr(0, ParamValues.length - 1);
        }
        this.setFieldValues =
        function(strValuesToSet) {
            arrValuesToSet = strValuesToSet.split('||');
            if ((arrValuesToSet.length % 2)) {
                alert("Value to set are not in correct format!\t\n Please check DrillDownTemalates");
                return;
            }
            var SPId = this.searchPanelId;
            //this.noOfCaseCadesToUpdate = 0;
            for (var iLoop = 0; iLoop < arrValuesToSet.length; iLoop += 2) {

                //this.getSearchField(SPId+'_'+arrValuesToSet[iLoop]).setSearchFieldValue(arrValuesToSet[iLoop + 1])
                if (typeof (this.getSearchField(SPId + '_' + arrValuesToSet[iLoop])) != 'undefined') {
                    SF = this.getSearchField(SPId + '_' + arrValuesToSet[iLoop]);
//                    if (SF.searchFieldType == "LookUpComboBoxCascade" && SF.childComboId!="") {

//                        this.noOfCaseCadesToUpdate++;
//                    }
//                    SF.setSearchFieldValue(arrValuesToSet[iLoop + 1]);
                    var Val = arrValuesToSet[iLoop + 1], jVal;
                    try {
                        jVal = $(Val);
                    } catch (ex) {
                        jVal = {};
                        jVal.length = 0;
                    }
                    if (jVal.length > 0) {
                        SF.setSearchFieldValue($('.param', $(Val)).html());
                    }
                    else
                        SF.setSearchFieldValue(Val);
                }
            }
        }
}

function SearchPanelCollection() {
    this.searchPanels = new Object();

    this.addSearchPanel = function(strSearchPanelId, objSearchPanel) {
    this.searchPanels[strSearchPanelId] = objSearchPanel;
        
    }
    this.getSearchPanel = function(strSearchPanelId) {
        return this.searchPanels[strSearchPanelId];
    }
    this.addWidgetToSearchPanel = function(strWidgetId, strWidgetType, objWidgetControl, strSearchPanelId) {
        this.searchPanels[strSearchPanelId].addWidget(strWidgetId, strWidgetType, objWidgetControl, strSearchPanelId);
    }
    this.updateWidgets = function() {
        // debugger;
        for (var searchPanel in this.searchPanels) {
            this.searchPanels[searchPanel].updateWidgets();
        }
    }
    this.getSearPanleFieldValues = function(strSearchPanelId) {
        return this.searchPanels[searchPanel].getFieldValues();
    }
    this.updateSearchPanleWidgets = function(strSearchPanel) {
        // debugger;
        this.searchPanels[strSearchPanel].updateWidgets();
    }
}

var objSearchPanels = new SearchPanelCollection();

function getSearchFieldByClientId(SearchFieldClientId) {
    arrSearchFeildIdSplited = SearchFieldClientId.split('_');

    searchPanelId = arrSearchFeildIdSplited[arrSearchFeildIdSplited.length - 2];
    SearchFieldId = arrSearchFeildIdSplited[arrSearchFeildIdSplited.length - 1];

    objSP = objSearchPanels.getSearchPanel(searchPanelId);
    return objSP.getSearchField(searchPanelId + '_' + SearchFieldId);
}

function InitWidgets() {
    //debugger ;
    for (var widgetId in objWidgets.WidgetsById) {
        var widget = objWidgets.getWidgetById(widgetId);

        if (getObjectClass(widget) == 'UpdateableWidget') {
            if (widget.ParentWidgetId != "") {




                hideElement(widget.ContainerClientId);
            }
        }
    }
}
function showElement(elementId) {
    document.getElementById(elementId).style.left = 0;
    document.getElementById(elementId).style.top = 0;
    document.getElementById(elementId).style.position = '';

}
function hideElement(elementId) {
    document.getElementById(elementId).style.position = 'absolute';
    document.getElementById(elementId).style.left = -1000;
    document.getElementById(elementId).style.top = -1000;
}
function updateWidget(WidgetId) {
    var objWidget = objWidgets.getWidgetById(WidgetId); 
    objWidget.updateWidget();
}
function DrillDownWidget(Params, SearchPanelsToUpdate) {
    var WidgetId = '';
    

    var arrParams = Params.split('|||');
    //alert(arrParams);
    WidgetId = arrParams[0]; //First Element Is The chart which will DrillDown(Parent chart)
    //debugger;
    var ParentWidget = objWidgets.getWidgetById(WidgetId); //

  //  debugger;
    if (ParentWidget.DrillDownWidgetId!= "" ) {
        var ChildWidget = objWidgets.getWidgetById(ParentWidget.DrillDownWidgetId)

        if (ChildWidget != null) {
            var objSearchPanel = objSearchPanels.getSearchPanel(ChildWidget.SearchPanelId);
            objSearchPanel.setFieldValues(arrParams[1]);
            ParentWidget.drillDown(ChildWidget);
            //objSearchPanel.updateWidgets();
            objSearchPanel.tryUpdateWidgets();
        }
    }
    if (ParentWidget.SearchPanelsToUpdate != "") {
    
        var arrSearchPanelsToUpdate = ParentWidget.SearchPanelsToUpdate.split('||');
        for (var iLoop = 0; iLoop < arrSearchPanelsToUpdate.length; iLoop++) {

            var SP = objSearchPanels.getSearchPanel(arrSearchPanelsToUpdate[iLoop]);
            if (SP != null) {

                SP.setFieldValues(arrParams[1]);
               // SP.updateWidgets();
                SP.tryUpdateWidgets();
            }
        }
    }
    if (typeof SearchPanelsToUpdate != "undefined") {
        if (SearchPanelsToUpdate != "") {
            var arrSearchPanelsToUpdate = SearchPanelsToUpdate.split('||');
            for (var iLoop = 0; iLoop < arrSearchPanelsToUpdate.length; iLoop++) {

                var SP = objSearchPanels.getSearchPanel(arrSearchPanelsToUpdate[iLoop]);
                if (SP != null) {

                    SP.setFieldValues(arrParams[1]);
                    SP.tryUpdateWidgets();
                }
            }
        }
    }
}
function UpdateSearchPanels(Params) {
    var WidgetId = '';
    var arrParams = Params.split('|||');
    WidgetId = arrParams[0]; //First Element Is The chart which will DrillDown(Parent chart)
    //debugger;
    var ParentWidget = objWidgets.getWidgetById(WidgetId); //
    
    if (ParentWidget.SearchPanelsToUpdate != "") {
        var arrSearchPanelsToUpdate = ParentWidget.SearchPanelsToUpdate.split('||');
        for (var iLoop = 0; iLoop < arrSearchPanelsToUpdate.length; iLoop++) {
            var SP = objSearchPanels.getSearchPanel(arrSearchPanelsToUpdate[iLoop]);
            if (SP != null) {
                SP.setFieldValues(arrParams[1]);
                SP.tryUpdateWidgets();
            }
        }
    }
}
function trim(stringToTrim) {
    return stringToTrim.replace(/^\s+|\s+$/g, "");
}
function ltrim(stringToTrim) {
    return stringToTrim.replace(/^\s+/, "");
}
function rtrim(stringToTrim) {
    return stringToTrim.replace(/\s+$/, "");
}
function logmsg(msg, msgid) {
    // debugger;
    if (!!window.__DEBUG__) {
        //alert('hi');
        $('#Logger').css("display", "");
        if (!!msgid) {
            if ($('#' + msgid).length > 0) {
                $('#' + msgid).text(msg);
            }
            else {
                $('#lst').append('<li id="' + msgid + '" style="font-size: 8.5pt; font-family: verdana">' + msg + '</li>');

            }
        }
        else {
            $('#lst').append('<li style="font-size: 8.5pt; font-family: verdana">' + msg + '</li>');
        }
    }
}

var imgPlusPath ;
var imgMinusPath ;

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
 
//---------JQuery Mask Plugin------------------------//

(function(a) { a.fn.mask = function(c, b) { a(this).each(function() { if (b !== undefined && b > 0) { var d = a(this); d.data("_mask_timeout", setTimeout(function() { a.maskElement(d, c) }, b)) } else { a.maskElement(a(this), c) } }) }; a.fn.unmask = function() { a(this).each(function() { a.unmaskElement(a(this)) }) }; a.fn.isMasked = function() { return this.hasClass("masked") }; a.maskElement = function(d, c) { if (d.data("_mask_timeout") !== undefined) { clearTimeout(d.data("_mask_timeout")); d.removeData("_mask_timeout") } if (d.isMasked()) { a.unmaskElement(d) } if (d.css("position") == "static") { d.addClass("masked-relative") } d.addClass("masked"); var e = a('<div class="loadmask"></div>'); if (navigator.userAgent.toLowerCase().indexOf("msie") > -1) { e.height(d.height() + parseInt(d.css("padding-top")) + parseInt(d.css("padding-bottom"))); e.width(d.width() + parseInt(d.css("padding-left")) + parseInt(d.css("padding-right"))) } if (navigator.userAgent.toLowerCase().indexOf("msie 6") > -1) { d.find("select").addClass("masked-hidden") } d.append(e); if (c !== undefined) { var b = a('<div class="loadmask-msg" style="display:none;"></div>'); b.append("<div>" + c + "</div>"); d.append(b); b.css("top", Math.round(d.height() / 2 - (b.height() - parseInt(b.css("padding-top")) - parseInt(b.css("padding-bottom"))) / 2) + "px"); b.css("left", Math.round(d.width() / 2 - (b.width() - parseInt(b.css("padding-left")) - parseInt(b.css("padding-right"))) / 2) + "px"); b.show() } }; a.unmaskElement = function(b) { if (b.data("_mask_timeout") !== undefined) { clearTimeout(b.data("_mask_timeout")); b.removeData("_mask_timeout") } b.find(".loadmask-msg,.loadmask").remove(); b.removeClass("masked"); b.removeClass("masked-relative"); b.find("select").removeClass("masked-hidden") } })(jQuery);
//---------Ext.apply and createDelegate Functions------------------------//
Ext = { version: "2.3.0" }; window["undefined"] = window["undefined"]; Ext.apply = function(d, e, b) { if (b) { Ext.apply(d, b) } if (d && e && typeof e == "object") { for (var a in e) { d[a] = e[a] } } return d }; Ext.apply(Function.prototype, { createDelegate: function(c, b, a) { var d = this; return function() { var f = b || arguments; if (a === true) { f = Array.prototype.slice.call(arguments, 0); f = f.concat(b) } else { if (typeof a == "number") { f = Array.prototype.slice.call(arguments, 0); var e = [a, 0].concat(b); Array.prototype.splice.apply(f, e) } } return d.apply(c || window, f) } } });
Ext.apply(Function.prototype, {
defer : function(millis, obj, args, appendArgs){
        var fn = this.createDelegate(obj, args, appendArgs);
        if(millis){
            return setTimeout(fn, millis);
        }
        fn();
        return 0;
    }});
//---------URL Plugin-------------------
jQuery.url = function() { var segments = {}; var parsed = {}; var options = { url: window.location, strictMode: false, key: ["source", "protocol", "authority", "userInfo", "user", "password", "host", "port", "relative", "path", "directory", "file", "query", "anchor"], q: { name: "queryKey", parser: /(?:^|&)([^&=]*)=?([^&]*)/g }, parser: { strict: /^(?:([^:\/?#]+):)?(?:\/\/((?:(([^:@]*):?([^:@]*))?@)?([^:\/?#]*)(?::(\d*))?))?((((?:[^?#\/]*\/)*)([^?#]*))(?:\?([^#]*))?(?:#(.*))?)/, loose: /^(?:(?![^:@]+:[^:@\/]*@)([^:\/?#.]+):)?(?:\/\/)?((?:(([^:@]*):?([^:@]*))?@)?([^:\/?#]*)(?::(\d*))?)(((\/(?:[^?#](?![^?#\/]*\.[^?#\/.]+(?:[?#]|$)))*\/?)?([^?#\/]*))(?:\?([^#]*))?(?:#(.*))?)/} }; var parseUri = function() { str = decodeURI(options.url); var m = options.parser[options.strictMode ? "strict" : "loose"].exec(str); var uri = {}; var i = 14; while (i--) { uri[options.key[i]] = m[i] || "" } uri[options.q.name] = {}; uri[options.key[12]].replace(options.q.parser, function($0, $1, $2) { if ($1) { uri[options.q.name][$1] = $2 } }); return uri }; var key = function(key) { if (!parsed.length) { setUp() } if (key == "base") { if (parsed.port !== null && parsed.port !== "") { return parsed.protocol + "://" + parsed.host + ":" + parsed.port + "/" } else { return parsed.protocol + "://" + parsed.host + "/" } } return (parsed[key] === "") ? null : parsed[key] }; var param = function(item) { if (!parsed.length) { setUp() } return (parsed.queryKey[item] === null) ? null : parsed.queryKey[item] }; var setUp = function() { parsed = parseUri(); getSegments() }; var getSegments = function() { var p = parsed.path; segments = []; segments = parsed.path.length == 1 ? {} : (p.charAt(p.length - 1) == "/" ? p.substring(1, p.length - 1) : path = p.substring(1)).split("/") }; return { setMode: function(mode) { strictMode = mode == "strict" ? true : false; return this }, setUrl: function(newUri) { options.url = newUri === undefined ? window.location : newUri; setUp(); return this }, segment: function(pos) { if (!parsed.length) { setUp() } if (pos === undefined) { return segments.length } return (segments[pos] === "" || segments[pos] === undefined) ? null : segments[pos] }, attr: key, param: param} } ();

//----------------Cookies Plugin-----------------------
jQuery.cookie = function(name, value, options) {
    if (typeof value != 'undefined') { // name and value given, set cookie
        options = options || {};
        if (value === null) {
            value = '';
            options.expires = -1;
        }
        var expires = '';
        if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {
            var date;
            if (typeof options.expires == 'number') {
                date = new Date();
                date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
            } else {
                date = options.expires;
            }
            expires = '; expires=' + date.toUTCString(); // use expires attribute, max-age is not supported by IE
        }
        // CAUTION: Needed to parenthesize options.path and options.domain
        // in the following expressions, otherwise they evaluate to undefined
        // in the packed version for some reason...
        var path = options.path ? '; path=' + (options.path) : '';
        var domain = options.domain ? '; domain=' + (options.domain) : '';
        var secure = options.secure ? '; secure' : '';
        document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
    } else { // only name given, get cookie
        var cookieValue = null;
        if (document.cookie && document.cookie != '') {
            var cookies = document.cookie.split(';');
            for (var i = 0; i < cookies.length; i++) {
                var cookie = jQuery.trim(cookies[i]);
                // Does this cookie string begin with the name we want?
                if (cookie.substring(0, name.length + 1) == (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }
};

//--------------------------C# style format plugin-----------------------------
(function($) {
    var strings = {
        strConversion: {
            // tries to translate any objects type into string gracefully
            __repr: function(i) {
                switch (this.__getType(i)) {
                    case 'array': case 'date': case 'number':
                        return i.toString();
                    case 'object':
                        var o = [];
                        for (x = 0; x < i.length; i++) { o.push(i + ': ' + this.__repr(i[x])); }
                        return o.join(', ');
                    case 'string':
                        return i;
                    default:
                        return i;
                }
            },
            // like typeof but less vague
            __getType: function(i) {
                if (!i || !i.constructor) { return typeof (i); }
                var match = i.constructor.toString().match(/Array|Number|String|Object|Date/);
                return match && match[0].toLowerCase() || typeof (i);
            },
            //+ Jonas Raoni Soares Silva
            //@ http://jsfromhell.com/string/pad [v1.0]
            __pad: function(str, l, s, t) {
                var p = s || ' ';
                var o = str;
                if (l - str.length > 0) {
                    o = new Array(Math.ceil(l / p.length)).join(p).substr(0, t = !t ? l : t == 1 ? 0 : Math.ceil(l / 2)) + str + p.substr(0, l - t);
                }
                return o;
            },
            __getInput: function(arg, args) {
                var key = arg.getKey();
                switch (this.__getType(args)) {
                    case 'object': // Thanks to Jonathan Works for the patch
                        var keys = key.split('.');
                        var obj = args;
                        for (var subkey = 0; subkey < keys.length; subkey++) {
                            obj = obj[keys[subkey]];
                        }
                        if (typeof (obj) != 'undefined') {
                            if (strings.strConversion.__getType(obj) == 'array') {
                                return arg.getFormat().match(/\.\*/) && obj[1] || obj;
                            }
                            return obj;
                        }
                        else {
                            // TODO: try by numerical index                    
                        }
                        break;
                    case 'array':
                        key = parseInt(key, 10);
                        if (arg.getFormat().match(/\.\*/) && typeof args[key + 1] != 'undefined') { return args[key + 1]; }
                        else if (typeof args[key] != 'undefined') { return args[key]; }
                        else { return key; }
                        break;
                }
                return '{' + key + '}';
            },
            __formatToken: function(token, args) {
                var arg = new Argument(token, args);
                return strings.strConversion[arg.getFormat().slice(-1)](this.__getInput(arg, args), arg);
            },

            // Signed integer decimal.
            d: function(input, arg) {
                var o = parseInt(input, 10); // enforce base 10
                var p = arg.getPaddingLength();
                if (p) { return this.__pad(o.toString(), p, arg.getPaddingString(), 0); }
                else { return o; }
            },
            // Signed integer decimal.
            i: function(input, args) {
                return this.d(input, args);
            },
            // Unsigned octal
            o: function(input, arg) {
                var o = input.toString(8);
                if (arg.isAlternate()) { o = this.__pad(o, o.length + 1, '0', 0); }
                return this.__pad(o, arg.getPaddingLength(), arg.getPaddingString(), 0);
            },
            // Unsigned decimal
            u: function(input, args) {
                return Math.abs(this.d(input, args));
            },
            // Unsigned hexadecimal (lowercase)
            x: function(input, arg) {
                var o = parseInt(input, 10).toString(16);
                o = this.__pad(o, arg.getPaddingLength(), arg.getPaddingString(), 0);
                return arg.isAlternate() ? '0x' + o : o;
            },
            // Unsigned hexadecimal (uppercase)
            X: function(input, arg) {
                return this.x(input, arg).toUpperCase();
            },
            // Floating point exponential format (lowercase)
            e: function(input, arg) {
                return parseFloat(input, 10).toExponential(arg.getPrecision());
            },
            // Floating point exponential format (uppercase)
            E: function(input, arg) {
                return this.e(input, arg).toUpperCase();
            },
            // Floating point decimal format
            f: function(input, arg) {
                return this.__pad(parseFloat(input, 10).toFixed(arg.getPrecision()), arg.getPaddingLength(), arg.getPaddingString(), 0);
            },
            // Floating point decimal format (alias)
            F: function(input, args) {
                return this.f(input, args);
            },
            // Floating point format. Uses exponential format if exponent is greater than -4 or less than precision, decimal format otherwise
            g: function(input, arg) {
                var o = parseFloat(input, 10);
                return (o.toString().length > 6) ? Math.round(o.toExponential(arg.getPrecision())) : o;
            },
            // Floating point format. Uses exponential format if exponent is greater than -4 or less than precision, decimal format otherwise
            G: function(input, args) {
                return this.g(input, args);
            },
            // Single character (accepts integer or single character string). 	
            c: function(input, args) {
                var match = input.match(/\w|\d/);
                return match && match[0] || '';
            },
            // String (converts any JavaScript object to anotated format)
            r: function(input, args) {
                return this.__repr(input);
            },
            // String (converts any JavaScript object using object.toString())
            s: function(input, args) {
                return input.toString && input.toString() || '' + input;
            }
        },

        format: function(str, args) {
            var end = 0;
            var start = 0;
            var match = false;
            var buffer = [];
            var token = '';
            var tmp = (str || '').split('');
            for (start = 0; start < tmp.length; start++) {
                if (tmp[start] == '{' && tmp[start + 1] != '{') {
                    end = str.indexOf('}', start);
                    token = tmp.slice(start + 1, end).join('');
                    if (tmp[start - 1] != '{' && tmp[end + 1] != '}') {
                        var tokenArgs = (typeof arguments[1] != 'object') ? arguments2Array(arguments, 2) : args || [];
                        buffer.push(strings.strConversion.__formatToken(token, tokenArgs));
                    }
                    else {
                        buffer.push(token);
                    }
                }
                else if (start > end || buffer.length < 1) { buffer.push(tmp[start]); }
            }
            return (buffer.length > 1) ? buffer.join('') : buffer[0];
        },

        calc: function(str, args) {
            return eval(format(str, args));
        },

        repeat: function(s, n) {
            return new Array(n + 1).join(s);
        },

        UTF8encode: function(s) {
            return unescape(encodeURIComponent(s));
        },

        UTF8decode: function(s) {
            return decodeURIComponent(escape(s));
        },

        tpl: function() {
            var out = '';
            var render = true;
            // Set
            // $.tpl('ui.test', ['<span>', helloWorld ,'</span>']);
            if (arguments.length == 2 && $.isArray(arguments[1])) {
                this[arguments[0]] = arguments[1].join('');
                return $(this[arguments[0]]);
            }
            // $.tpl('ui.test', '<span>hello world</span>');
            if (arguments.length == 2 && $.isString(arguments[1])) {
                this[arguments[0]] = arguments[1];
                return $(this[arguments[0]]);
            }
            // Call
            // $.tpl('ui.test');
            if (arguments.length == 1) {
                return $(this[arguments[0]]);
            }
            // $.tpl('ui.test', false);
            if (arguments.length == 2 && arguments[1] == false) {
                return this[arguments[0]];
            }
            // $.tpl('ui.test', {value:blah});
            if (arguments.length == 2 && $.isObject(arguments[1])) {
                return $($.format(this[arguments[0]], arguments[1]));
            }
            // $.tpl('ui.test', {value:blah}, false);
            if (arguments.length == 3 && $.isObject(arguments[1])) {
                return (arguments[2] == true)
                    ? $.format(this[arguments[0]], arguments[1])
                    : $($.format(this[arguments[0]], arguments[1]));
            }
        }
    };

    var Argument = function(arg, args) {
        this.__arg = arg;
        this.__args = args;
        this.__max_precision = parseFloat('1.' + (new Array(32)).join('1'), 10).toString().length - 3;
        this.__def_precision = 6;
        this.getString = function() {
            return this.__arg;
        };
        this.getKey = function() {
            return this.__arg.split(':')[0];
        };
        this.getFormat = function() {
            var match = this.getString().split(':');
            return (match && match[1]) ? match[1] : 's';
        };
        this.getPrecision = function() {
            var match = this.getFormat().match(/\.(\d+|\*)/g);
            if (!match) { return this.__def_precision; }
            else {
                match = match[0].slice(1);
                if (match != '*') { return parseInt(match, 10); }
                else if (strings.strConversion.__getType(this.__args) == 'array') {
                    return this.__args[1] && this.__args[0] || this.__def_precision;
                }
                else if (strings.strConversion.__getType(this.__args) == 'object') {
                    return this.__args[this.getKey()] && this.__args[this.getKey()][0] || this.__def_precision;
                }
                else { return this.__def_precision; }
            }
        };
        this.getPaddingLength = function() {
            var match = false;
            if (this.isAlternate()) {
                match = this.getString().match(/0?#0?(\d+)/);
                if (match && match[1]) { return parseInt(match[1], 10); }
            }
            match = this.getString().match(/(0|\.)(\d+|\*)/g);
            return match && parseInt(match[0].slice(1), 10) || 0;
        };
        this.getPaddingString = function() {
            var o = '';
            if (this.isAlternate()) { o = ' '; }
            // 0 take precedence on alternate format
            if (this.getFormat().match(/#0|0#|^0|\.\d+/)) { o = '0'; }
            return o;
        };
        this.getFlags = function() {
            var match = this.getString().matc(/^(0|\#|\-|\+|\s)+/);
            return match && match[0].split('') || [];
        };
        this.isAlternate = function() {
            return !!this.getFormat().match(/^0?#/);
        };
    };

    var arguments2Array = function(args, shift) {
        var o = [];
        for (l = args.length, x = (shift || 0) - 1; x < l; x++) { o.push(args[x]); }
        return o;
    };
    $.extend(strings);
})(jQuery);
//--------------HotKeyPlugIn-----------------------
(function(jQuery){jQuery.fn.__bind__=jQuery.fn.bind;jQuery.fn.__unbind__=jQuery.fn.unbind;jQuery.fn.__find__=jQuery.fn.find;var hotkeys={version:'0.7.9',override:/keypress|keydown|keyup/g,triggersMap:{},specialKeys:{27:'esc',9:'tab',32:'space',13:'return',8:'backspace',145:'scroll',20:'capslock',144:'numlock',19:'pause',45:'insert',36:'home',46:'del',35:'end',33:'pageup',34:'pagedown',37:'left',38:'up',39:'right',40:'down',109:'-',112:'f1',113:'f2',114:'f3',115:'f4',116:'f5',117:'f6',118:'f7',119:'f8',120:'f9',121:'f10',122:'f11',123:'f12',191:'/'},shiftNums:{"`":"~","1":"!","2":"@","3":"#","4":"$","5":"%","6":"^","7":"&","8":"*","9":"(","0":")","-":"_","=":"+",";":":","'":"\"",",":"<",".":">","/":"?","\\":"|"},newTrigger:function(type,combi,callback){var result={};result[type]={};result[type][combi]={cb:callback,disableInInput:false};return result;}};hotkeys.specialKeys=jQuery.extend(hotkeys.specialKeys,{96:'0',97:'1',98:'2',99:'3',100:'4',101:'5',102:'6',103:'7',104:'8',105:'9',106:'*',107:'+',109:'-',110:'.',111:'/'});jQuery.fn.find=function(selector){this.query=selector;return jQuery.fn.__find__.apply(this,arguments);};jQuery.fn.unbind=function(type,combi,fn){if(jQuery.isFunction(combi)){fn=combi;combi=null;}
if(combi&&typeof combi==='string'){var selectorId=((this.prevObject&&this.prevObject.query)||(this[0].id&&this[0].id)||this[0]).toString();var hkTypes=type.split(' ');for(var x=0;x<hkTypes.length;x++){delete hotkeys.triggersMap[selectorId][hkTypes[x]][combi];}}
return this.__unbind__(type,fn);};jQuery.fn.bind=function(type,data,fn){var handle=type.match(hotkeys.override);if(jQuery.isFunction(data)||!handle){return this.__bind__(type,data,fn);}
else{var result=null,pass2jq=jQuery.trim(type.replace(hotkeys.override,''));if(pass2jq){result=this.__bind__(pass2jq,data,fn);}
if(typeof data==="string"){data={'combi':data};}
if(data.combi){for(var x=0;x<handle.length;x++){var eventType=handle[x];var combi=data.combi.toLowerCase(),trigger=hotkeys.newTrigger(eventType,combi,fn),selectorId=((this.prevObject&&this.prevObject.query)||(this[0].id&&this[0].id)||this[0]).toString();trigger[eventType][combi].disableInInput=data.disableInInput;if(!hotkeys.triggersMap[selectorId]){hotkeys.triggersMap[selectorId]=trigger;}
else if(!hotkeys.triggersMap[selectorId][eventType]){hotkeys.triggersMap[selectorId][eventType]=trigger[eventType];}
var mapPoint=hotkeys.triggersMap[selectorId][eventType][combi];if(!mapPoint){hotkeys.triggersMap[selectorId][eventType][combi]=[trigger[eventType][combi]];}
else if(mapPoint.constructor!==Array){hotkeys.triggersMap[selectorId][eventType][combi]=[mapPoint];}
else{hotkeys.triggersMap[selectorId][eventType][combi][mapPoint.length]=trigger[eventType][combi];}
this.each(function(){var jqElem=jQuery(this);if(jqElem.attr('hkId')&&jqElem.attr('hkId')!==selectorId){selectorId=jqElem.attr('hkId')+";"+selectorId;}
jqElem.attr('hkId',selectorId);});result=this.__bind__(handle.join(' '),data,hotkeys.handler)}}
return result;}};hotkeys.findElement=function(elem){if(!jQuery(elem).attr('hkId')){if(jQuery.browser.opera||jQuery.browser.safari){while(!jQuery(elem).attr('hkId')&&elem.parentNode){elem=elem.parentNode;}}}
return elem;};hotkeys.handler=function(event){var target=hotkeys.findElement(event.currentTarget),jTarget=jQuery(target),ids=jTarget.attr('hkId');if(ids){ids=ids.split(';');var code=event.which,type=event.type,special=hotkeys.specialKeys[code],character=!special&&String.fromCharCode(code).toLowerCase(),shift=event.shiftKey,ctrl=event.ctrlKey,alt=event.altKey||event.originalEvent.altKey,mapPoint=null;for(var x=0;x<ids.length;x++){if(hotkeys.triggersMap[ids[x]][type]){mapPoint=hotkeys.triggersMap[ids[x]][type];break;}}
if(mapPoint){var trigger;if(!shift&&!ctrl&&!alt){trigger=mapPoint[special]||(character&&mapPoint[character]);}
else{var modif='';if(alt)modif+='alt+';if(ctrl)modif+='ctrl+';if(shift)modif+='shift+';trigger=mapPoint[modif+special];if(!trigger){if(character){trigger=mapPoint[modif+character]||mapPoint[modif+hotkeys.shiftNums[character]]||(modif==='shift+'&&mapPoint[hotkeys.shiftNums[character]]);}}}
if(trigger){var result=false;for(var x=0;x<trigger.length;x++){if(trigger[x].disableInInput){var elem=jQuery(event.target);if(jTarget.is("input")||jTarget.is("textarea")||jTarget.is("select")||elem.is("input")||elem.is("textarea")||elem.is("select")){return true;}}
result=result||trigger[x].cb.apply(this,[event]);}
return result;}}}};window.hotkeys=hotkeys;return jQuery;})(jQuery);
