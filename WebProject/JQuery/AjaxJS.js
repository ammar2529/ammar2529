// JScript File
function findValue(li) {
	if( li == null ) return alert("No match!");

	// if coming from an AJAX call, let's use the CityId as the value
	if( !!li.extra ) var sValue = li.extra[0];

	// otherwise, let's just display the value in the text box
	else var sValue = li.selectValue;

	//alert("The value you selected was: " + sValue);
}
function selectItem(li) {
	findValue(li);
}

function formatItem(row) {

    if(!(typeof row[1] ==='undefined') && row[1]!='')
    {
	return row[0] + " , " + row[1] + "";
	}
	else
	{
	    return row[0];
	}
}
var surlACIPADUsersList = location.href.substring(0, location.href.indexOf("pages/")) + "pages/home/ACIPADUsers.aspx";
var surlCurrList = location.href.substring(0, location.href.indexOf("pages/")) + "pages/home/CommonCurrencyAutoComplete.aspx";
var surlAESSCountries = location.href.substring(0,location.href.indexOf("pages/")) + "pages/home/AESEmpSkillSetCountries.aspx";
var surlCur = location.href.substring(0,location.href.indexOf("pages/")) + "pages/home/AjaxPageCurrency.aspx";
var surlAirLines=location.href.substring(0,location.href.indexOf("pages/")) + "pages/home/AjaxPageAirlines.aspx";
var surlServices=location.href.substring(0,location.href.indexOf("pages/")) + "pages/home/AjaxPageForServices.aspx";
var surlServiceDetails=location.href.substring(0,location.href.indexOf("pages/")) + "pages/home/AjaxPageForServiceDetails.aspx";
var surlProjects=location.href.substring(0,location.href.indexOf("pages/")) + "pages/home/AjaxPageForProjects.aspx";
var surlHotel=location.href.substring(0,location.href.indexOf("pages/")) + "pages/home/AjaxPrefferedHotelList.aspx";
var surlAirPort=location.href.substring(0,location.href.indexOf("pages/")) + "pages/home/AjaxTRFRouteDetails.aspx";
var surlSDRNames = location.href.substring(0,location.href.indexOf("pages/")) + "pages/home/SDRNamesAutoComplete.aspx";
var surlSDRStaffNames = location.href.substring(0,location.href.indexOf("pages/")) + "pages/home/SDRStaffNamesAutoComplete.aspx";
var surlIC=location.href.substring(0,location.href.indexOf("pages/")) + "pages/home/AjaxPageIC.aspx";
var surlBRANCH=location.href.substring(0,location.href.indexOf("pages/")) + "pages/home/AjaxPageUSBRANCH.aspx";
var surlDEPT=location.href.substring(0,location.href.indexOf("pages/")) + "pages/home/AjaxPageUSDEPT.aspx";
var surlPRODLINE=location.href.substring(0,location.href.indexOf("pages/")) + "pages/home/AjaxPageUSPRODLINE.aspx";
var surlPROJECTS=location.href.substring(0,location.href.indexOf("pages/")) + "pages/home/AjaxPageUSPROJECTS.aspx";
var surlGITCur = location.href.substring(0,location.href.indexOf("pages/")) + "pages/home/GITAutoCurrency.aspx";

var surlGICTCountry = location.href.substring(0,location.href.indexOf("pages/")) + "pages/home/GICTAutoCountry.aspx";
var surlGICTDepartment = location.href.substring(0,location.href.indexOf("pages/")) + "pages/home/GICTAutoDepartment.aspx";
var surlGICTSubBusinessGroup = location.href.substring(0,location.href.indexOf("pages/")) + "pages/home/GICTAutoSubGroup.aspx";
var surlGICTBusinessGroup = location.href.substring(0,location.href.indexOf("pages/")) + "pages/home/GICTAutoBusinessGroup.aspx";
var surlGICTEstCurrency = location.href.substring(0,location.href.indexOf("pages/")) + "pages/home/GICTAutoCompleteCurrency.aspx";
var surlGICTUsers = location.href.substring(0,location.href.indexOf("pages/")) + "pages/home/GICTAutoUsers.aspx";
var surlADUsers = location.href.substring(0,location.href.indexOf("pages/")) + "pages/home/ADUsersAutoComplete.aspx";
var surlAdmInfoUsers = location.href.substring(0,location.href.indexOf("pages/")) + "pages/home/AdmUserInfoAutoComplete.aspx";
var surlCountry = location.href.substring(0,location.href.indexOf("pages/")) + "pages/home/CountryAutoComplete.aspx";
var surlPosition = location.href.substring(0,location.href.indexOf("pages/")) + "pages/home/PositionAutoComplete.aspx";

//For Canada
var surlBRANCHCN=location.href.substring(0,location.href.indexOf("pages/")) + "pages/home/AjaxPageCNBRANCH.aspx";
var surlDEPTCN=location.href.substring(0,location.href.indexOf("pages/")) + "pages/home/AjaxPageCNDEPT.aspx";
var surlPRODLINECN=location.href.substring(0,location.href.indexOf("pages/")) + "pages/home/AjaxPageCNPRODLINE.aspx";
var surlC = location.href.substring(0,location.href.indexOf("pages/")) + "pages/home/AjaxPageCountryCurrency.aspx";

// For EPG
var surlAdmInfoUsers = location.href.substring(0,location.href.indexOf("pages/")) + "pages/home/AdmUserInfoAutoComplete.aspx";

//autocomplete_ajax.cfm
var surl = location.href.substring(0,location.href.indexOf("pages/")) + "pages/home/AjaxPage.aspx";
//$(document).ready(function() {
//    
//	$("#PWCMasterPage_PWCWebPartManager_gwpAgCorpServiceRequestFrUc_AgCorpServiceRequestFrUc_BriefDescription").autocomplete(
//		surl,
//		{
//			delay:10,
//			minChars:1,
//			matchSubset:1,
//			matchContains:1,
//			cacheLength:10,
//			onItemSelect:selectItem,
//			onFindValue:findValue,
//			formatItem:formatItem,
//			cellSeparator:'||',
//			autoFill:false,
//			selectOnly:true,
//			selectFirst:true,
//			mustMatch:1
//			
//		}
//	);
//	$("#PWCMasterPage_PWCWebPartManager_gwpAgCorpServiceRequestFrUc_AgCorpServiceRequestFrUc_BriefDescription").blur(function(){
//  /* Callback goes here */
//        onleave();
//    }); 
//	});
	
	function onleave()
	{
	 var s='';
	}
	
	


function AutoComplete(controlid,ctrlwidth)
{
    var CtrlId="#"+controlid;
    $(CtrlId).autocomplete(
		surl,
		{
			delay:10,
			minChars:1,
			matchSubset:1,
			matchContains:1,
			cacheLength:10,
			onItemSelect:selectItem,
			onFindValue:findValue,
			formatItem:formatItem,
			cellSeparator:'||',
			autoFill:false,
			selectOnly:true,
			selectFirst:false,
			mustMatch:1,
			width:ctrlwidth
			
		}
	);
}
//Custom version for populating Currencies in TravelRequest.
function AutoCompleteCurrencies(controlid,ctrlwidth)
{
    var CtrlId="#"+controlid;
    $(CtrlId).autocomplete(
		surlCur,
		{
			delay:10,
			minChars:1,
			matchSubset:1,
			matchContains:1,
			cacheLength:10,
			onItemSelect:selectItem,
			onFindValue:findValue,
			formatItem:formatItem,
			cellSeparator:',',
			lineSeparator:'||',
			autoFill:false,
			selectOnly:true,
			selectFirst:false,
			mustMatch:1,
			width:ctrlwidth
			
		}
	);
}

//Custom version for populating Currencies in TravelRequest.
function AutoTRFCompleteCurrencies(controlid,ctrlwidth,dependentCtrls)
{
    var CtrlId="#"+controlid;
    $(CtrlId).autocomplete(
		surlCur,
		{
			delay:10,
			minChars:1,
			matchSubset:1,
			matchContains:1,
			cacheLength:10,
			onItemSelect:selectItem,
			onFindValue:findValue,
			formatItem:formatItem,
			cellSeparator:',',
			lineSeparator:'||',
			autoFill:false,
			selectOnly:true,
			selectFirst:false,
			mustMatch:1,
			dependentCtrls:dependentCtrls,
			width:ctrlwidth
			
		}
	);
}

//Custom version for populating Airlines in TravelRequest.
function AutoCompleteAirLines(controlid,ctrlwidth)
{
    var CtrlId="#"+controlid;
    $(CtrlId).autocomplete(
		surlAirLines,
		{
			delay:10,
			minChars:1,
			matchSubset:1,
			matchContains:1,
			cacheLength:10,
			onItemSelect:selectItem,
			onFindValue:findValue,
			formatItem:formatItem,
			cellSeparator:',',
			lineSeparator:'||',
			autoFill:false,
			selectOnly:true,
			selectFirst:false,
			mustMatch:1,
			width:ctrlwidth
			
		}
	);
	}
	
	
//this is to be used in EffortTracking for Services Name.
function AutoCompleteServices(controlid,ctrlwidth,formValues,dependentCtrls)
{
 
    var CtrlId="#"+controlid;
    $(CtrlId).autocomplete(
		surlServices,
		{
			delay:10,
			minChars:0,
			matchSubset:1,
			matchContains:1,
			cacheLength:10,
			onItemSelect:selectItem,
			onFindValue:findValue,
			formatItem:formatItem,
			autoFill:false,
			selectOnly:true,
			selectFirst:false,
			mustMatch:1,
			width:ctrlwidth,
			formValues:formValues,
			dependentCtrls:dependentCtrls,
			cellSeparator:'||'
		}
	);
	
}

//this is to be used in EffortTracking for Services Details.
function AutoCompleteServiceDetails(controlid,ctrlwidth,formValues) 
{
    
    var CtrlId="#"+controlid;
    $(CtrlId).autocomplete(
		surlServiceDetails,
		{
			delay:10,
			minChars:1,
			matchSubset:1,
			matchContains:1,
			cacheLength:10,
			onItemSelect:selectItem,
			onFindValue:findValue,
			formatItem:formatItem,
			autoFill:false,
			selectOnly:true,
			selectFirst:false,
			mustMatch:1,
			width:ctrlwidth,
			formValues:formValues,
			cellSeparator:'||'
		}
	);
}


//this is to be used in EffortTracking for Services Name.
//AutoCompleteProjects
function AutoCompleteProjects(controlid,ctrlwidth,formValues)
{

    var CtrlId="#"+controlid;
    $(CtrlId).autocomplete(
		surlProjects,
		{
			delay:10,
			minChars:1,
			matchSubset:1,
			matchContains:1,
			cacheLength:10,
			onItemSelect:selectItem,
			onFindValue:findValue,
			formatItem:formatItem,
			autoFill:false,
			selectOnly:true,
			selectFirst:false,
			mustMatch:1,
			width:ctrlwidth,
			formValues:formValues,
			cellSeparator:'||'
		}
	);
}



//function formatItemSingle(row)
//{
//    var code;
//    if(row[1]!='')
//    {
//    row[0].split(",");
//	return row[0] + " , " + row[1] + "";
//	}
//	else
//	{
//	    code=row[0].split(",");
//	    return code[1];
//	}
//}