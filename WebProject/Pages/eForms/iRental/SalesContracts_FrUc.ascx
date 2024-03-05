<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalesContracts_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.SalesContracts_FrUc" %>
<%@ Register Src="~/AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="AW" %>
<%@ Register Src="~/Pages/eForms/iRental/CustomerDetails_FrUc.ascx" TagPrefix="AW" TagName="CustomerDetails_FrUc" %>

<script>
    // American Numbering System
    var th = ['', 'thousand', 'million', 'billion', 'trillion'];
    // uncomment this line for English Number System
    // var th = ['','thousand','million', 'milliard','billion'];

    var dg = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'];
    var tn = ['ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen'];
    var tw = ['twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety'];
    function toWords(s) {
        s = s.toString(); s = s.replace(/[\, ]/g, '');
        if (s != parseFloat(s)) return 'not a number'; var x = s.indexOf('.');
        if (x == -1) x = s.length; if (x > 15) return 'too big'; var n = s.split(''); var str = '';
        var sk = 0;
        for (var i = 0; i < x; i++) {
            if ((x - i) % 3 == 2) {
                if (n[i] == '1') { str += tn[Number(n[i + 1])] + ' '; i++; sk = 1; }
                else if (n[i] != 0) { str += tw[n[i] - 2] + ' '; sk = 1; }
            } else if (n[i] != 0) { str += dg[n[i]] + ' '; if ((x - i) % 3 == 0) str += 'hundred '; sk = 1; }
            if ((x - i) % 3 == 1) { if (sk) str += th[(x - i - 1) / 3] + ' '; sk = 0; }
        }
        if (x != s.length) { var y = s.length; str += 'point '; for (var i = x + 1; i < y; i++) str += dg[n[i]] + ' '; }
        return str.replace(/\s+/g, ' ');
    }
</script>



<link href="../../../Scripts/eForms/iRental/Upload.css" rel="stylesheet" />
<link href="../../../Scripts/eForms/iRental/RemoveButton.css" rel="stylesheet" />
<script type="text/javascript" language="javascript" src="Scripts/eForms/iRental/SalesContracts.js"></script>
<script src="../../../Scripts/eForms/iRental/frmSalesContracts.js"></script>
<table cellspacing="0" cellpadding="0" border="0" style="width: 100%;" class="myTable">
    <tr>
        <td style="padding-top: 0px; padding-left: 2px;">
            <ul class="SimpleTab" style="margin: 0px;">
                <li class="active" tabid="SalesContractDetails">
                    <div>Contract Details </div>
                </li>
                <li tabid="SalesPaymentDetails" style="border-right: 1px solid #8298B0;">
                    <div>Payment Details </div>
                </li>

            </ul>
        </td>
    </tr>
    <tr tabid="SalesContractDetails">
        <td style="padding-top: 1px;">
            <table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">
                <tr id="trNote">
                    <td colspan="4" style="padding-top: 10px; padding-bottom: 10px">Use the form below to update the details, fields marked with an asterisk (*) are mandatory </td>
                </tr>
            <%--    <tr>
                    <td colspan="4" class="auto-style1" style="display:none">
                        <input type="hidden" groupid="SalesContractsForm" argumentid="RecCode" />
                    </td>
                </tr>--%>
                  <tr class="OnNewHide">
                    <td class="ftitle" width="18%">
                        <nobr>Sales Contract No.</nobr>
                    </td>
                    <td class="ftitle" width="32%">
                        <span class="ftitle" style="color: red;" groupid="SalesContractsForm" argumentid="RecCode">New contract no. will be generated on saving</span>
                    </td>
                    <td class="ftitle" width="20%">
                        <nobr>Contract Status</nobr>
                    </td>
                    <td class="ftitle" width="30%">
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="StateName"></span>
                    </td>
                </tr>
                <tr>

                    <td class="ftitle" width="18%">
                        <nobr>Payment Method*:</nobr></td>
                    <td class="ftitle" width="32%">

                        <input type="radio" class="CommonDisableClass ElemDisabled  cash  " checked="checked" default="default" value="Cash" name="PaymenteMethod" groupid="SalesContractsForm" argumentid="PaymenteMethod" /><label>Cash</label>
                        <input type="radio" class="CommonDisableClass ElemDisabled finance  " value="Finance" name="PaymenteMethod" groupid="SalesContractsForm" argumentid="PaymenteMethod" /><label>Finance </label>
                        <%-- CommonDisableClass ElemDisabled default="default" --%>
                    </td>
                    <td class="ftitle lb">
                        <nobr>Finance Company*:</nobr>
                    </td>
                    <td class="financeCompanyTD">

                        <%--   <select class="financeCompany " loadon="FirstVisible" 
               groupid="SalesContractsForm" argumentid="FinanceCompany" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'36'}]}">
                <option value="" selected="selected">Select Finance Company</option>
            </select>--%>
                        <select loadon="FirstVisible" valtype="value" class="dropdownlist required financeCompany CommonDisableClass  " style="width: 270px;" groupid="SalesContractsForm" argumentid="FinanceCompany" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'36'}]}">
                            <option value="" selected="selected">Select Finance Company</option>
                        </select>


                    </td>
                </tr>
           <%--     <tr class="trOnHideFinaceSelect">
                           <td class="ftitle" width="18%">
                        <nobr> Number:</nobr></td>
                    
                    <td >
                        <input type="text" style="text-align: center; width: 150px;" maxlength="100" class="text number CommonDisableClass ElemDisabled"
                            groupid="SalesContractsForm" argumentid="LPONumber" />
                    </td>

                        <td class="ftitle" width="18%">
                        <nobr>LPO Date:</nobr>

                        </td>
                    <td>
                        <input type="text" groupid="SalesContractsForm" maxlength="10"
                            style="width: 75px;" class="text  date CommonDisableClass ElemDisabled"  argumentid="LPODate" />
                    </td>
                    
                    

                </tr>--%>
                <tr>

                    <td class="ftitle" width="18%">
                        <nobr>Car Type*:</nobr></td>
                    <td class="ftitle" width="32%">

                        <input type="radio" class="CommonDisableClass ElemDisabled  " default="default" value="N" name="CarType" groupid="SalesContractsForm" argumentid="CarType" /><label>New Car</label>
                        <input type="radio" class="CommonDisableClass ElemDisabled  " value="U" name="CarType" groupid="SalesContractsForm" argumentid="CarType" /><label>Used Car</label>



                    </td>
                    <td class="ftitle LPONumberTitle"  width="18%">
                        <nobr>LPO Number & Date:</nobr>

                    </td>
                    <td class="LPONumberDateField">
                   <input type="text" style="text-align: center; width: 150px;" maxlength="10" class="text PriceC number CommonDisableClass   "
                            groupid="SalesContractsForm" argumentid="LPONumber" />  
                        
                        <input type="text" groupid="SalesContractsForm" maxlength="10"
                            style="width: 75px;" class="text  date CommonDisableClass  "  argumentid="LPODate" />
                   </td>
                </tr>


                <%--/////////////////////// Select Car and Customer popup //////////////////////////////////--%>
                <tr>
                    <td class="ftitle" style="width: 170px">
                        <nobr>Chassis No.:</nobr>
                    </td>
                    <td >
                        <input type="hidden" name="RecId" groupid="SalesContractsForm" argumentid="RecId" />

                        <div style="display: none">
                            <span groupid="SalesContractsForm" argumentid="RecId1"></span>
                            <span groupid="SalesContractsForm" argumentid="StateId"></span>
                            <input type="text" style="text-align: center; width: 400px; background-color: #F1F1F1" maxlength="255" class="text AlwaysDisable " argumentid="AmountInWordsSalesContract"  groupid="SalesContractsForm"/>


                        </div>
                        <div>
                            <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="10" class="LOVPopup text  CommonDisableClass  "
                                groupid="SalesContractsForm" lovpopupid="carPopup" argumentid="ChassisNo"   />
                        </div>
                    </td>
                    <td class="ftitle" style="width: 140px">
                        <nobr>Customer Code*:</nobr></td>
                    <td>
                        <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="10" class="LOVPopup required text  CommonDisableClass  "
                            groupid="SalesContractsForm" lovpopupid="customerPopup" argumentid="CustomerRecCode" requirederr=' *Required'  />
<%--                        <div class="ftitle w-ui-icon w-ui-panel-icon-closed unselectable contDetailsIcon" style="float: right; padding-right: 0px; height: 15px; cursor: pointer;">&nbsp;</div>--%>
                        <%--                        <div class="ftitle w-ui-icon w-ui-panel-icon-closed unselectable contDetailsIcon" style="float: right; padding-right: 0px; height: 15px; cursor: pointer;">&nbsp;</div>--%>

                    </td>
                </tr>

                <%--///////////////////// End: Select Car and Customer popup ///////////////////////////////////////--%>





                <tr>
                    <td class="ftitle">
                        <nobr>Car No:</nobr>
                    </td>
                    <td >
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="CarNumber"></span>
                    </td>
                    <td class="ftitle">
                        <nobr>Name:</nobr>
                    </td>
                    <td style="text-align: center">
                        <span class="ftitle" style="font-size: 16px;" groupid="SalesContractsForm" argumentid="CustomerName"></span>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Brand:</nobr>
                    </td>
                    <td >
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="BrandId"></span>
                    </td>
                    <td class="ftitle">
                        <nobr>Nationality:</nobr>
                    </td>
                    <td>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="Nationality"></span>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Model:</nobr>
                    </td>
                    <td >
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="ModelId"></span>
                    </td>
                   <td class="ftitle">
                        <nobr>National ID No.:</nobr>
                    </td>
                    <td>
                        <div style="float: left; width: 135px" class="ftitle" groupid="SalesContractsForm" argumentid="NationalIDNo"></div>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="NationalIDExpiryDate"></span>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Year:</nobr>
                    </td>
                    <td >
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="CarYear"></span>
                    </td>
                    <td class="ftitle">
                        <nobr>Gender:</nobr>
                    </td>
                    <td>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="Gender"></span>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Color:</nobr>
                    </td>
                    <td >
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="Color"></span>
                    </td>
                     <td class="ftitle">
                        <nobr>Mobile Telephone:</nobr>
                    </td>
                    <td class="ftitle">
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="MobileTelephone1"></span>
                        <nobr class="CommaM12">, </nobr>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="MobileTelephone2"></span>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Type</nobr>
                    </td>
                    <td >
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="TypeId"></span>
                    </td>
                    <td class="ftitle">Car Owner Name:</td>
                    <td>
                        <input type="text" style="text-align: center; width: 262px;" maxlength="10" class="text  CommonDisableClass ElemDisabled"
                            groupid="SalesContractsForm" argumentid="CarOwnerName" />
                    </td>
                </tr>
               
               
               
               

                <tr>
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
                    </td>
                </tr>

                <tr>
                    <td class="ftitle">
                        <nobr>Reservation Date:</nobr>
                    </td>
                    <td >
                        <input type="text" groupid="SalesContractsForm" maxlength="10"
                            style="width: 75px;"  class="text  date CommonDisableClass  "  argumentid="ContractStartDate" />

                        <input type="text" style="text-align: center; width: 80px;" maxlength="10" class="text AlwaysDisable"
                            groupid="SalesContractsForm" argumentid="ContractStartDay" />

                        <input type="text" style="text-align: center; width: 55px;" maxlength="10" class="text AlwaysDisable"
                            groupid="SalesContractsForm" argumentid="ContractStartTime" />

                    </td>

                    <td class="ftitle">
                        <nobr>Reservation End Date:</nobr>
                    </td>
                    <td>
                        <input type="text" groupid="SalesContractsForm" maxlength="10"
                            style="width: 75px;" class="text  date DisableOnClose CommonDisableClass  "  argumentid="ReservationDate" />

                        <input type="text" style="text-align: center; width: 80px;" maxlength="10" class="text AlwaysDisable"
                            groupid="SalesContractsForm" argumentid="ReservationWeekDays" />

                        <%--<input type="text" style="text-align: center; width: 55px;" maxlength="10" class="text AlwaysDisable"
                            groupid="SalesContractsForm" argumentid="ReservationExpireTime" />--%>

                        <input type="text" style="text-align: center; width: 30px;" maxlength="10" class="text AlwaysDisable"
                            groupid="SalesContractsForm" argumentid="ReservationDays" />

                    </td>


                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Contract Date:</nobr>
                    </td>
                    <td >
                        <input type="text" groupid="SalesContractsForm" maxlength="10"
                            style="width: 75px;" class="text  date CommonDisableClass  "  argumentid="ContractDate" />

                        <input type="text" style="text-align: center; width: 80px;" maxlength="10" class="text AlwaysDisable"
                            groupid="SalesContractsForm" argumentid="ContractWeekDay" />

                        <input type="text" style="text-align: center; width: 55px;" maxlength="10" class="text AlwaysDisable"
                            groupid="SalesContractsForm" argumentid="ContractTime" />

                    </td>

                    <td class="ftitle">
                        <nobr>Delivery Date:</nobr>
                    </td>
                    <td>
                        <input type="text" groupid="SalesContractsForm" maxlength="10"
                            style="width: 75px;" class="text  date DisableOnClose CommonDisableClass  " requirederr='  ' argumentid="DeliveryDate" />

                        <input type="text" style="text-align: center; width: 80px;" maxlength="10" class="text AlwaysDisable"
                            groupid="SalesContractsForm" argumentid="DeliveryWeekDays" />

                        <%--<input type="text" style="text-align: center; width: 55px;" maxlength="10" class="text AlwaysDisable"
                            groupid="SalesContractsForm" argumentid="DeliveryTime" />--%>

                        <%--<input type="text" style="text-align: center; width: 30px;" maxlength="10" class="text AlwaysDisable"
                            groupid="SalesContractsForm" argumentid="ReservationDays" />--%>

                    </td>


                </tr>

                <tr>
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
                    </td>
                </tr>

                <tr>
                    <td class="ftitle">
                        <nobr>Engine Warranty:</nobr>
                    </td>
                    <td >KM:
                        <input type="text" style="text-align: center; width: 150px;" maxlength="100" class="text number CommonDisableClass  "
                            groupid="SalesContractsForm" argumentid="EngineWarranty" />
                    </td>
                    <td class="ftitle">
                        <nobr>OR</nobr>
                    </td>
                    <td>Years:  <%--<select class="financeCompany auto-style3" loadon="FirstVisible" 
               groupid="SalesContractsForm" argumentid="EnginYearsWarranty" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'37'}]}">
                <option value="" selected="selected">Select Years</option>
            </select>--%>
                        <select loadon="FirstVisible" valtype="value"  class="dropdownlist CommonDisableClass  "   style="width: 155px;" groupid="SalesContractsForm" argumentid="EnginYearsWarranty" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'37'}]}">
                            <option value="" selected="selected">Select Years</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Gear Warranty:</nobr>
                    </td>
                    <td >KM:
                        <input type="text" style="text-align: center; width: 150px;" maxlength="10" class="text number CommonDisableClass  "
                            groupid="SalesContractsForm" argumentid="GearWarranty" />
                    </td>
                    <td class="ftitle">
                        <nobr>OR</nobr>
                    </td>
                    <td>Years:  <%--<select class="financeCompany auto-style3" loadon="FirstVisible" 
               groupid="SalesContractsForm" argumentid="GearYearsWarranty" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'37'}]}">
                <option value="" selected="selected">Select Years</option>
            </select>--%>
                        <select loadon="FirstVisible" valtype="value" class="dropdownlist CommonDisableClass   " style="width: 155px;" groupid="SalesContractsForm" argumentid="GearYearsWarranty" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'37'}]}">
                            <option value="" selected="selected">Select Years</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Car Warranty:</nobr>
                    </td>
                    <td >KM:
                        <input type="text" style="text-align: center; width: 150px;" maxlength="10" class="text number CommonDisableClass  "
                            groupid="SalesContractsForm" argumentid="CarWarranty" />
                    </td>
                    <td class="ftitle">
                        <nobr>OR</nobr>
                    </td>
                    <td>Years:  <%--<select class="financeCompany auto-style3" loadon="FirstVisible" 
               groupid="SalesContractsForm" argumentid="CarYearsWarranty" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'37'}]}">
                <option value="" selected="selected">Select Years</option>
            </select>--%>
                        <select loadon="FirstVisible" valtype="value"  class="dropdownlist CommonDisableClass   " style="width: 155px;" groupid="SalesContractsForm" argumentid="CarYearsWarranty" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'37'}]}">
                            <option value="" selected="selected">Select Years</option>
                        </select>


                    </td>
                </tr>

                <tr>
                    <td class="ftitle">48 Hrs Car Replacement:</td>
                    <td class="ftitle" width="32%">
                         <input type="radio" class="CommonDisableClass   " checked="checked" default="default" value="No" name="CarReplacement" groupid="SalesContractsForm" argumentid="CarReplacement" /><label>No </label>
                        <input type="radio" class=" CommonDisableClass  "  value="Yes" name="CarReplacement" groupid="SalesContractsForm" argumentid="CarReplacement" /><label>Yes</label>
                                               <%-- CommonDisableClass ElemDisabled default="default" --%>
                    </td>
                    <td colspan="2"></td>
                </tr>

                <tr>
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
                    </td>
                </tr>

                <tr>
                    <td class="ftitle">

                        <nobr>Car Price:</nobr>
                    </td>
                    <td>
                        <%-- <span class="ftitle" groupid="SalesContractsForm" argumentid="Price" style="text-align: center;" requirederr=' Car Price  Required'></span>--%>
                        <%--<input type="text" style="text-align: center; width: 150px;" maxlength="10" class="text number CommonDisableClass ElemDisabled AlwaysDisable"
                            groupid="SalesContractsForm" argumentid="Price" disabled="disabled" />--%>
                        <%--<input type="text" style="text-align: center; width: 150px;" maxlength="10" step="0.01"   class="text AlwaysDisable   ElemDisabled number   bgr  "
                            groupid="SalesContractsForm PriceC" argumentid="Price" requirederr=' *Required' disabled="disabled"/>--%>
                        <%--<input type="text" style="text-align: center; width: 150px;" maxlength="10"  class="text PriceC number bgr "
                            groupid="SalesContractsForm " argumentid="Price" requirederr=' *Required' />--%>

                        <input type="text" style="text-align: center; width: 150px;" maxlength="10" class="text PriceC number CommonDisableClass  "
                            groupid="SalesContractsForm" argumentid="Price" />
                        
                    </td>
                    <td colspan="2" class="ftitle" >
                        
                        <nobr>Comments:</nobr>
                    
                     </td>


                </tr>


                <tr>


                    <td class="ftitle">

                        <nobr>Additional Amount:</nobr>
                    </td>
                    <td >
                        <input type="text" style="text-align: center; width: 150px;" maxlength="10" class="text number CommonDisableClass  "
                            groupid="SalesContractsForm" argumentid="AdditionalAmount" />

                    </td>
                    <td colspan="2" rowspan="2" style="padding: 0; width: 100%; height: 100%;"">

<%--                        style="width: 367px; height:37px" --%>

                        <textarea class="textarea CommonDisableClass  " style="width: 100%; height: 50px; box-sizing: border-box; border: 0.5px solid black; resize: none;"
                            argumentid="fComments" groupid="SalesContractsForm"></textarea>
                                        
                        

                    </td>
                   

                </tr>


                <tr>

                    <td class="ftitle">

                        <nobr>Discount:</nobr>

                    </td>
                    <td >
                        <input type="text" style="text-align: center; width: 150px;" maxlength="10" class="text number CommonDisableClass  "
                            groupid="SalesContractsForm" argumentid="Discount" />
                    
                    </td>
                </tr>



                <tr>

                    <td class="ftitle">
                        <nobr>Grand Total:</nobr>
                    </td>
                    <td >
                        <%-- <span class="ftitle" groupid="SalesContractsForm" argumentid="TotalAmount"></span>--%>
                        <%--<input type="text" style="text-align: center; width: 150px;" maxlength="10" class="text number CommonDisableClass ElemDisabled AlwaysDisable"
                            groupid="SalesContractsForm" argumentid="TotalAmount" disabled="disabled" />--%>
                        <input type="text" style="text-align: center; width: 150px;" maxlength="10" class="text number AlwaysDisable bgr"
                            groupid="SalesContractsForm" argumentid="TotalAmount" />
                    </td>
                      <td class="ftitle">
                        <nobr>Salesman:</nobr>
                    </td>
                    <td>
                           <select loadon="FirstVisible" valtype="value" class="dropdownlist CommonDisableClass  "   style="width: 204px;" groupid="SalesContractsForm" argumentid="Salesman" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'39'}]}">
                            <option value="" selected="selected">Select Salesman</option>
                        </select>
                    </td>

                </tr>



                <tr>
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
                    </td>
                </tr>




                <tr>
                    <td class="ftitle">
                        <nobr style="color: Green; font-size: 12px">Amount Received (KD):</nobr>
                    </td>
                    <td style="text-align: center;" >
                        <span class="ftitle PaymentAmountC" style="color: Green; font-size: 12px" groupid="SalesContractsForm" argumentid="PaymentAmount"></span>
                    </td>
                    <td class="ftitle">

                        <nobr style="color: Red; font-size: 12px">Amount Due:</nobr>
                    </td>
                    <td style="text-align: center;">
                        <span class="ftitle AmountDueC" style="color: Red; font-size: 12px" groupid="SalesContractsForm" argumentid="AmountDue"></span>
                    </td>
                </tr>


                <tr>
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
                    </td>
                </tr>

                <tr>
                    <td colspan="4">
                      
                        <div class="file-upload-drop-area">
                            <select loadon="FirstVisible" valtype="value" class="dropdownlist required CommonDisableClass  " style="width: 155px;"
                                groupid="SalesContractsForm" argumentid="DocType" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'34'}]}">
                                <option value="" selected="selected">Select Doc Type</option>
                            </select>


                            <input type="file" class="file-input CommonDisableClass   " accept=".pdf,.jpg,.png,.txt,.docx" />
                            <span class="allowedFile" style="display:none;"></span>
                          

                            <button class="upload-button CommonDisableClass">Upload</button>

                        </div>




                        <%-- <div class="progress-bar"></div>
                            <div class="message"></div>--%>

                        <input type="hidden" groupid="SalesContractsForm" argumentid="FileGuid" readonly="readonly" />

                        <%-- Data Grid  --%>
                        <div style="width: 100%;" class="CommonDisableClass">
                        <table cellspacing:"0" cellpadding:"0" border="0" style: 5%; style="width:100%;"  text-align: left" class="uploadedFileList">
                            <tbody>
                                <tr class="HeaderTR">
                                    <td class="Header w-grid-border">
                                        <table cellspacing="0" cellpadding="0" width="100%" border="0" class="w-grid-header">
                                            <tbody>
                                                <tr class="w-grid-head-back">

                                                    <td class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-3" colindex="3" colid="FileName" style="padding-left: 0px; padding-right: 0px;">
                                                        <div style="white-space: nowrap; overflow: hidden; margin-left: 10px;">
                                                            <span href="#" class="w-grid-head ColName sort">File Name</span>
                                                        </div>
                                                    </td>
                                                    <td class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" colindex="4" colid="FileSize" style="padding-left: 0px; padding-right: 0px; width: 110px;">
                                                        <div style="white-space: nowrap; overflow: hidden; margin-left: 10px; width: 100px;">
                                                            <span href="#" class="w-grid-head ColName sort">File Size</span>
                                                        </div>
                                                    </td>
                                                    <td class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" colindex="4" colid="FileType" style="padding-left: 0px; padding-right: 0px; width: 110px;">
                                                        <div style="white-space: nowrap; overflow: hidden; margin-left: 10px; width: 100px;">
                                                            <span href="#" class="w-grid-head ColName sort">File Type</span>
                                                        </div>
                                                    </td>
                                                    <td class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" colindex="4" colid="CreatedBy" style="padding-left: 0px; padding-right: 0px; width: 110px;">
                                                        <div style="white-space: nowrap; overflow: hidden; margin-left: 10px; width: 100px;">
                                                            <span href="#" class="w-grid-head ColName sort">Uploaded By</span>
                                                        </div>
                                                    </td>
                                                    <td class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" colindex="4" colid="CreatedDate" style="padding-left: 0px; padding-right: 0px; width: 110px;">
                                                        <div style="white-space: nowrap; overflow: hidden; margin-left: 10px; width: 100px;">
                                                            <span href="#" class="w-grid-head ColName sort">Uploade Date</span>
                                                        </div>
                                                    </td>
                                                    <td class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" colindex="4" colid="FileSize" style="padding-left: 0px; padding-right: 0px; width: 45px;">
                                                        <div style="white-space: nowrap; overflow: hidden; margin-left: 10px; width: 35px;">
                                                            <span href="#" class="w-grid-head ColName sort"></span>
                                                        </div>
                                                    </td>


                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr class="ItemTR">
                                    <td class="Item w-grid-border">
                                        <table cellspacing="0" cellpadding="0" border="0" style="width: 100%; table-layout: fixed" itemno="10" class="w-grid-row-odd">
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr class="NoRecordsTR" style="display: none;">
                                    <td class="NoRecords w-grid-norecords-msg">
                                        <div style="padding: 10px; background-color: transparent" class="PWCNoDataMessage">No records available.</div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                            </div>
                        <%--<%-- End Data Grid --%>
                   
                        
                    </td>
                </tr>

                <tr>
                    <td colspan="4" style="text-align: center;">
                        <div style="padding-top: 10px;">
<%--                            <input type="button" style="width: 225px;" value="Close Contract - Pending Payment" class="DataAction ButtonStyle btn_3" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Contracts',Params:{NewStateId:'RRCContractClosedPendingPayment'}, HideOnSuccess:false, Requery:true}" />--%>
                            <input type="button" value="  Reserve  " ignorevalidate="DocType" class="DataAction ButtonStyle C  btnReserve common-button" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts',HideOnSuccess:true,GroupId:'SalesContractsForm',Requery:false}" />
                            
                            <input type="button" ignorevalidate="DocType" style="width: 225px;  color: Green" value="Close Contract - Payment Cleared" class="DataAction CloseContract ButtonStyle " conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts', Params:{NewStateId:'RRCContractClosed'}, HideOnSuccess:true,GroupId:'SalesContractsForm', Requery:true}" />
                            <input type="button" ignorevalidate="DocType" style="width: 225px" value="Cancel Contract" class="DataAction CancelContract ButtonStyle " conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts', Params:{NewStateId:'RRCContractCancelled'}, HideOnSuccess:true,GroupId:'SalesContractsForm', Requery:true}" />
                            
                        </div>
                       
                    
                        <div style="padding-top: 10px; padding-bottom: 10px">
                             <input type="button" roles="iRen_Contracts_Admin" value="  Edit  " class="ButtonStyle SalesButton_Edit" />
                            <input type="button" value="  Save  " ignorevalidate="ReservationDate DocType" class="DataAction ButtonStyle  btnSave common-button" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts',HideOnSuccess:true, Requery:false,GroupId:'SalesContractsForm'}" />
                             
<%--                            ,Params:{DBAction:'SCReserved'}--%>
                            <input type="button" value="  Quotation  " class="ButtonStyle QuotationBtn common-button" />

                            <input type="button" value="  Contract  " class="ButtonStyle PrintBtn common-button" />
                            <input type="button" value="  Bill  " class="ButtonStyle BillsBtn common-button" />
                            <input type="button"  value="Statement" class=" ButtonStyle Statement" />
<%--                            <input type="button" value="  Bills  " class="ButtonStyle BillsBtn common-button" />--%>
                            <input type="button" value="  Close  " class="CloseForm ButtonStyle btnCancel common-button" />
                        </div>
                    </td>
                </tr>

            </table>
        </td>
    </tr>

    <tr tabid="SalesPaymentDetails" style="display: none;">
        <td style="padding-top: 1px;">

            <AW:DataGrid ID="grdSalesContractsPaymentDetails" LoadOnInit="true" ShowOnLoad="false" runat="server"
                Hidden="true" Columns="1" EmptyHeight="201px" AllowNew="true" SelectableRow="true"
                PageSize="20" DataSource="SEL_iRental_SalesContracts_Payments" ContainerMargin="2px"
                GridTemplate="jQueryUI" GridHeadText="Payment Details" GridButtons="{\'delete\':{conf:{Command:\'UPD_iRental_SalesContracts_Payments\',KeysCol:\'RecId\'}}}">
                <GridConfig>
                    <script>
                        cf = {
                            cols: {
                                Sequence: { width: '0px' },
                                RecId: { width: '0px', caption: 'ID' },
                                LocationReceiptId: { width: '130px', caption: 'ID' },
                                PrintId: { width: '30px', caption: '' },
                                ParentRecId: { width: '0px' },
                                PaymentType: { width: '65px', caption: 'Type' },
                                PaymentDate: { caption: 'Date', width: '90px' },
                                PaymentMode: { caption: 'Mode', width: '75px' },
                                ChequeNo: { width: '0px' },
                                PaymentAmount: { caption: 'Amount', width: '80px' },
                                ReceiptId: { caption: 'Manual ID' },
                                DateCreated: { caption: 'Date Created', width: '130px' },
                                CreatedBy: { caption: 'Created By', width: '150px' },
                                StateId: { width: '0px' }
                            },
                            forms: {
                                NewFormId: 'frmSalesContactsPaymentDetails',
                                EditFormId: 'frmSalesContactsPaymentDetails',
                                Keys: 'RecId'
                            }
                        };
                    </script>
                </GridConfig>
                <Scripts>
                    <script>
                        var fn = Sales.SalesContracts.grdSalesContractsPaymentDetails;
                    </script>
                </Scripts>
                <RowDetail>
                    <pre class="" colindex="4">
                    <AW:container id="conSalesPaymentDetails_Audit" hidden="true" runat="server">
                    <childern>
                    <div style="padding:15px">
                         <AW:DataGrid ID="grdSalesPaymentDetails_Audit" LoadOnInit="true" ShowOnLoad="false" runat="server"
                Hidden="true" Columns="1" EmptyHeight="201px" AllowNew="true" SelectableRow="false" RelativeKeys="RecId"
                PageSize="30" DataSource="SEL_iRental_SalesContracts_Payments_Audit" ContainerMargin="2px"  ShowGridHead="false"
                GridTemplate="jQueryUI" GridHeadText="Sales Payment Details" GridButtons="{\'delete\':{visible:false},\'new\':{visible:false}}" >
                           <GridConfig>
                    <script>
                        cf = {
                            cols: {
                                AuditTrailId: { width: '0px', caption: 'Audit ID' },
                                StateId: { caption: 'Status', width: '182px' },
                                RecId: { width: '0px', caption: 'System ID' },
                                ParentRecId: { width: '0px' },
                                PaymentType_Audit: { width: '65px', caption: 'Type' },
                                PaymentDate: { caption: 'Date', width: '90px' },
                                PaymentMode: { caption: 'Mode', width: '75px' },
                                ChequeNo: { width: '0px' },
                                PaymentAmount: { caption: 'Amount', width: '80px' },
                                ReceiptId: { caption: 'Manual ID' },
                                DateCreated: { caption: 'Date Created', width: '130px' },
                                CreatedBy: { caption: 'Action By', width: '132px' }
                            }
                        };
                    </script></GridConfig>
                    <Scripts>
                    <script>
                        var fn = function () {
                            t.on('rowsRendered', function () {
                                $('[colid="PaymentType_Audit"]:not(".w-grid-head-cell")').each(function () {
                                    var ptr = $(this).closest('tr');
                                    if ($(this).text().toLowerCase() == "return") {
                                        $('[colid="PaymentAmount"] div', ptr).css({ 'font-weight': 'bold', 'color': 'red' });
                                        $('[colid="PaymentAmount"] div', ptr).text('-' + $('[colid="PaymentAmount"] div', ptr).text());
                                    }
                                    $('[colid="PaymentAmount"] div', ptr).text(parseFloat($('[colid="PaymentAmount"] div', ptr).text()).fix(3));
                                });
                            });
                            t.on('onNoRecords', function () {
                                $('.BottomTR', t.Repeater).hide();
                            });
                        }
                   </script></Scripts></AW:DataGrid>
                </div></Childern></AW:container>
                     </pre>
                </RowDetail>

            </AW:DataGrid>

            <AW:Form ID="frmSalesContactsPaymentDetails" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/eForms/iRental/SalesContracts_PD_FrUc.ascx">
                <WidgetConfig>
                    <script>
                        cf = {

                            header: {
                                Style: {},
                                Visible: true,
                                Collapsed: false,
                                HeadText: 'Sales Payment Details'
                            }
                        }
                    </script>
                </WidgetConfig>
                <Scripts>
                    <script>

                        var fn = Sales.SalesContracts.frmSalesContactsPaymentDetails;

                    </script>
                </Scripts>
            </AW:Form>

        </td>
    </tr>

</table>
