<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RentalContracts_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.RentalContracts_FrUc" %>

<%@ Register Src="~/AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="AW" %>

<table cellspacing="0" cellpadding="0" border="0" style="width: 100%;">
    <tr>
        <td style="padding-top: 10px; padding-left: 2px;">
            <ul class="SimpleTab" style="margin: 0px;">
                <li class="active" tabid="ContractDetails">
                    <div>
                        Contract Details
                    </div>
                </li>
                <%--                <li tabid="AdditionalDrivers" >
                    <div> 
                        Additional Drivers</div>
                </li> --%>
                <li tabid="PaymentDetails">
                    <div>
                        Payment Details
                    </div>
                </li>
                <li tabid="OtherCharges">
                    <div>
                        Other Charges
                    </div>
                </li>
                <li tabid="ContractComments" style="border-right: 1px solid #8298B0;">
                    <div>
                        Comments
                    </div>
                </li>
            </ul>
        </td>
    </tr>
    <tr tabid="ContractDetails">
        <td style="padding-top: 1px;">

            <table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">

                <tr id="trNote">
                    <td colspan="4" style="padding-top: 10px; padding-bottom: 10px">Use the form below to update the details, fields marked with an asterisk (*) are mandatory
                    </td>
                </tr>
                <tr class="OnNewHide">
                    <td class="ftitle" width="18%">
                        <nobr>Contract No.</nobr>
                    </td>
                    <td class="ftitle" width="32%">
                        <span class="ftitle" style="color: red;" groupid="RentalContractsForm" argumentid="RecCode">New contract no. will be generated on saving</span>
                    </td>
                    <td class="ftitle" width="20%">
                        <nobr>Contract Status</nobr>
                    </td>
                    <td class="ftitle" width="30%">
                        <span class="ftitle" groupid="RentalContractsForm" argumentid="StateName"></span>
                    </td>
                </tr>

                <tr>
                    <td class="ftitle" width="18%">
                        <nobr>Contract Mileage Type*:</nobr></td>
                    <td class="ftitle" width="32%">

                        <input type="radio" class="CommonDisable" checked="checked" default="default" value="Limited" name="ContractTypeOL" groupid="RentalContractsForm" argumentid="ContractTypeOL" /><label>Limited</label>
                        <input type="radio" class="CommonDisable" value="Open" name="ContractTypeOL" groupid="RentalContractsForm" argumentid="ContractTypeOL" /><label>Open</label>


                    </td>
                    <td class="ftitle" width="20%">
                        <nobr>Contract Out Location*:</nobr></td>
                    <td width="30%">
                        <select loadon="FirstVisible" class="dropdownlist required CommonDisable" style="width: 155px;"
                            groupid="RentalContractsForm" argumentid="OutLocationId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'11'}]}">
                            <option value="" selected="selected">Select Location</option>
                        </select></td>
                </tr>
                <tr>
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1"/>
                    </td>
                </tr>

                <tr style="display: none">
                    <td class="ftitle">
                        <nobr>Contract Type:</nobr>
                    </td>
                    <td class="ftitle">
                        <input type="radio" checked="checked" default="default" value="Rental" name="ContractType" groupid="RentalContractsForm" argumentid="ContractType" /><label>Rental</label>
                        <input type="radio" value="Lease" name="ContractType" groupid="RentalContractsForm" argumentid="ContractType" /><label>Lease</label>
                    </td>
                    <td></td>
                    <td></td>
                </tr>

                <tr>
                    <td class="ftitle">
                        <nobr>Car Number*:</nobr>
                    </td>
                    <td>
                        <div style="display: none"><span groupid="RentalContractsForm" argumentid="RecId"></span><span groupid="RentalContractsForm" argumentid="StateId"></span></div>
                        <div>
                            <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="10" class="text required CommonDisable"
                                groupid="RentalContractsForm" argumentid="CarNumber" />
                        </div>
                    </td>
                    <td class="ftitle">
                        <nobr>Customer Code*:</nobr></td>
                    <td>
                        <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="10" class="text required CommonDisable"
                            groupid="RentalContractsForm" argumentid="CustomerRecCode" />
                        <div class="ftitle w-ui-icon w-ui-panel-icon-closed unselectable contDetailsIcon" style="float: right; padding-right: 0px; height: 15px; cursor: pointer;">&nbsp;</div>
                    </td>
                </tr>


                <tr>
                    <td class="ftitle">
                        <nobr>Chassis Number</nobr>
                    </td>
                    <td>

                        <span class="ftitle" groupid="RentalContractsForm" argumentid="ChassisNo"></span>
                    </td>
                    <td class="ftitle">
                        <nobr>Name</nobr>
                    </td>
                    <td style="text-align: center">
                        <span class="ftitle" style="font-size: 16px;" groupid="RentalContractsForm" argumentid="CustomerName"></span></td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Brand</nobr>
                    </td>
                    <td>

                        <span class="ftitle" groupid="RentalContractsForm" argumentid="Brand"></span>

                    </td>
                    <td class="ftitle">
                        <nobr>Type</nobr></td>
                    <td>
                        <span class="ftitle" groupid="RentalContractsForm" argumentid="CustomerType"></span>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Model</nobr>
                    </td>
                    <td>
                        <span class="ftitle" groupid="RentalContractsForm" argumentid="Model"></span>
                    </td>
                    <td class="ftitle">
                        <nobr>Nationality</nobr></td>
                    <td><span class="ftitle" groupid="RentalContractsForm" argumentid="Nationality"></span>
                    </td>
                </tr>
                <tr class="OnLoadHideCarCust">
                    <td class="ftitle">
                        <nobr>Year</nobr>
                    </td>
                    <td>
                        <span class="ftitle" groupid="RentalContractsForm" argumentid="CarYear"></span>
                    </td>
                    <td class="ftitle">
                        <nobr>Gender</nobr></td>
                    <td>
                        <span class="ftitle" groupid="RentalContractsForm" argumentid="Gender"></span></td>
                </tr>

                <tr class="OnLoadHideCarCust">
                    <td class="ftitle">
                        <nobr>Color</nobr>
                    </td>
                    <td>
                        <span class="ftitle" groupid="RentalContractsForm" argumentid="Color"></span>
                    </td>
                    <td class="ftitle">
                        <nobr>Passport No.</nobr></td>
                    <td>
                        <div style="float: left; width: 135px" class="ftitle" groupid="RentalContractsForm" argumentid="PassportNo"></div>
                        <span class="ftitle" groupid="RentalContractsForm" argumentid="PassportExpiry"></span>

                    </td>
                </tr>
                <tr class="OnLoadHideCarCust">
                    <td class="ftitle">
                        <nobr>Type</nobr>
                    </td>
                    <td>
                        <span class="ftitle" groupid="RentalContractsForm" argumentid="Type"></span>
                    </td>
                    <td class="ftitle">
                        <nobr>National ID No.</nobr></td>
                    <td>
                        <div style="float: left; width: 135px" class="ftitle" groupid="RentalContractsForm" argumentid="NationalIDNo"></div>
                        <span class="ftitle" groupid="RentalContractsForm" argumentid="NationalIDExpiryDate"></span>
                    </td>
                </tr>
                <tr class="OnLoadHideCarCust">
                    <td class="ftitle">
                        <nobr>Insurance</nobr></td>
                    <td class="ftitle">
                        <span class="ftitle" groupid="RentalContractsForm" argumentid="InsuranceExpiry"></span>
                        <nobr style="padding-left: 15px;"></nobr>
                        <span class="ftitle" groupid="RentalContractsForm" argumentid="FullInsuranceExpiry"></span>

                    </td>
                    <td class="ftitle">
                        <nobr>Driving License No.</nobr></td>
                    <td>
                        <div style="float: left; width: 135px" class="ftitle" groupid="RentalContractsForm" argumentid="DrivingLicenseNo"></div>
                        <span class="ftitle" groupid="RentalContractsForm" argumentid="DrivingLicenseExpiry"></span></td>
                </tr>
                <tr class="OnLoadHideCarCust">
                    <td class="ftitle">
                        <nobr>Previous Mileage (KM)</nobr></td>
                    <td>
                        <span class="ftitle" groupid="RentalContractsForm" argumentid="CarPreviousKM"></span>
                    </td>
                    <td class="ftitle">
                        <nobr>Work & Res. Telephone</nobr></td>
                    <td class="ftitle">
                        <span class="ftitle" groupid="RentalContractsForm" argumentid="WorkTelephone"></span>
                        <nobr class="CommaWR">, </nobr>
                        <span class="ftitle" groupid="RentalContractsForm" argumentid="ResidenceTelephone"></span></td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Car Out Mileage*:</nobr></td>
                    <td>
                        <input type="text" style="text-align: center; width: 150px;" maxlength="10" class="text required number CommonDisable"
                            groupid="RentalContractsForm" argumentid="ContractKMOut" /></td>
                    <td class="ftitle">
                        <nobr>Mobile Telephone</nobr></td>
                    <td class="ftitle">
                        <span class="ftitle" groupid="RentalContractsForm" argumentid="MobileTelephone1"></span>
                        <nobr class="CommaM12">, </nobr>
                        <span class="ftitle" groupid="RentalContractsForm" argumentid="MobileTelephone2"></span>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1"/>
                    </td>
                </tr>

                <tr>
                    <td class="ftitle">
                        <nobr>Contract Start Date*:</nobr>
                    </td>
                    <td>
                        <input type="text" groupid="RentalContractsForm" maxlength="10"
                            style="width: 75px;" class="text required date CommonDisable" requirederr=' *' argumentid="ContractStartDate" />

                        <input type="text" style="text-align: center; width: 80px;" maxlength="10" class="text AlwaysDisable"
                            groupid="RentalContractsForm" argumentid="ContractStartDay" />

                        <input type="text" style="text-align: center; width: 40px;" maxlength="10" class="text AlwaysDisable"
                            groupid="RentalContractsForm" argumentid="ContractStartTime" />

                    </td>
                    <td class="ftitle">
                        <nobr>Rate Type*:</nobr></td>
                    <td>
                        <select class="dropdownlist required CommonDisable" style="width: 155px;"
                            groupid="RentalContractsForm" argumentid="CarRateType" storeinfo="{Command:'SEL_iRental_Contracts_RateTypes',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'Brand',SPParamName:'Brand'},{Name:'Model',SPParamName:'Model'},{Name:'CarYear',SPParamName:'CarYear'}],ItemExtraAttrs:['CarRate','CarAllowedKM','CarExtraKMRate']}">
                            <option value="" selected="selected">Select Rate Type</option>
                        </select></td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Contract Expiry Date*:</nobr>
                    </td>
                    <td>
                        <input type="text" groupid="RentalContractsForm" maxlength="10"
                            style="width: 75px;" class="text required date DisableOnClose" requirederr=' *' argumentid="ContractExpiryDate" />

                        <input type="text" style="text-align: center; width: 80px;" maxlength="10" class="text AlwaysDisable"
                            groupid="RentalContractsForm" argumentid="ContractExpiryDay" />

                        <input type="text" style="text-align: center; width: 40px;" maxlength="10" class="text AlwaysDisable"
                            groupid="RentalContractsForm" argumentid="ContractExpiryTime" />

                        <input type="text" style="text-align: center; width: 30px;" maxlength="10" class="text AlwaysDisable"
                            groupid="RentalContractsForm" argumentid="ContractDays" />

                    </td>
                    <td class="ftitle">
                        <nobr>Daily Rental Rate (KD)*:</nobr></td>
                    <td>
                        <input type="text" style="text-align: center; width: 150px;" maxlength="10" class="text required number AlwaysDisable"
                            groupid="RentalContractsForm" alphconf="{allow:'.'}" argumentid="CarRate" />
                    </td>
                </tr>

                <tr>
                    <td class="ftitle">
                        <nobr class="OnLoadHide">Contract End Date:</nobr>
                    </td>
                    <td>
                        <input type="text" groupid="RentalContractsForm" maxlength="10"
                            style="width: 75px;" class="text date OnLoadHide AlwaysDisable SuperUserEdit" argumentid="ContractEndDate" />

                        <input type="text" style="text-align: center; width: 80px;" maxlength="10" class="text OnLoadHide AlwaysDisable"
                            groupid="RentalContractsForm" argumentid="ContractEndDay" />

                        <input type="text" style="text-align: center; width: 40px;" maxlength="10" class="text OnLoadHide AlwaysDisable"
                            groupid="RentalContractsForm" argumentid="ContractEndTime" />

                        <input type="text" style="text-align: center; width: 30px;" maxlength="10" class="text OnLoadHide AlwaysDisable"
                            groupid="RentalContractsForm" argumentid="ActualContractDays" />

                    </td>
                    <td class="ftitle">
                        <nobr class="MileageType">Daily Mileage (KM) Limit*:</nobr></td>
                    <td>
                        <input type="text" style="text-align: center; width: 150px;" maxlength="10" class="text required number MileageType AlwaysDisable"
                            groupid="RentalContractsForm" argumentid="CarAllowedKM" />&nbsp; 
                    </td>
                </tr>

                <tr class="MileageType">
                    <td class="ftitle">
                        <nobr></nobr>
                    </td>
                    <td>&nbsp;</td>
                    <td class="ftitle">
                        <nobr class="MileageType">Rate/KM (Extra Mileage)*:</nobr></td>
                    <td>
                        <input type="text" style="text-align: center; width: 150px;" maxlength="10" class="text required number MileageType AlwaysDisable"
                            groupid="RentalContractsForm" alphconf="{allow:'.'}" argumentid="CarExtraKMRate" />
                    </td>
                </tr>

                <tr class="OnLoadHide">
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1"/>
                    </td>
                </tr>

                <tr class="OnLoadHide">
                    <td class="ftitle">
                        <nobr>Car In Mileage*:</nobr>
                    </td>
                    <td style="text-align: center;">
                        <input type="text" style="text-align: center; width: 150px;" maxlength="10" class="text number DisableOnClose dependent"
                            groupid="RentalContractsForm" requirederr=' *' deperr='Contract KM In should be greater than Contract KM Out...' blurvalidate="false" argumentid="ContractKMIn" operator=">" depchildid="ContractKMOut" />
                    </td>
                    <td class="ftitle">
                        <nobr>Rental Charges</nobr></td>
                    <td style="text-align: center;">
                        <span class="ftitle" groupid="RentalContractsForm" argumentid="ContractPeriodCharges"></span></td>
                </tr>
                <tr class="MileageTypeCharges">
                    <td class="ftitle">
                        <nobr>Extra Mileage</nobr>
                    </td>
                    <td style="text-align: center;">
                        <span class="ftitle" groupid="RentalContractsForm" argumentid="ContractExtraKM"></span>
                    </td>
                    <td class="ftitle">
                        <nobr>Extra Mileage Charges</nobr></td>
                    <td style="text-align: center;">
                        <span class="ftitle" groupid="RentalContractsForm" argumentid="ContractExtraKMCharges"></span></td>
                </tr>
                <tr class="OnLoadHide">
                    <td class="ftitle">
                        <nobr>Discount:</nobr>

                    </td>
                    <td style="text-align: center;">
                        <input type="text" style="text-align: center; width: 150px;" maxlength="10" class="text number AlwaysDisable SuperUserEdit"
                            groupid="RentalContractsForm" alphconf="{allow:'.'}" argumentid="ContractDiscount" />

                    </td>
                    <td class="ftitle">
                        <nobr>Other Charges</nobr></td>
                    <td style="text-align: center;">
                        <span class="ftitle" groupid="RentalContractsForm" argumentid="ContractOtherCharges"></span></td>
                </tr>
                <tr class="OnLoadHide">
                    <td class="ftitle">
                        <nobr>Contract In Location:</nobr>
                    </td>
                    <td style="text-align: center;">
                        <select loadon="FirstVisible" class="dropdownlist AlwaysDisable SuperUserEdit" style="width: 155px;"
                            groupid="RentalContractsForm" argumentid="InLocationId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'11'}]}">
                            <option value="" selected="selected">Select Location</option>
                        </select>
                    </td>
                    <td class="ftitle">
                        <nobr>Grand Total</nobr>
                    </td>
                    <td style="text-align: center;">
                        <span class="ftitle" groupid="RentalContractsForm" argumentid="ContractTotalCharges"></span>
                    </td>
                </tr>

                <tr class="OnLoadHide">
                    <td class="ftitle">
                        <nobr style="color: Green; font-size: 12px">Amount Received (KD)</nobr>
                    </td>
                    <td style="text-align: center;">
                        <span class="ftitle" style="color: Green; font-size: 12px" groupid="RentalContractsForm" argumentid="TotalPaidByCustomer"></span>
                    </td>
                    <td class="ftitle">

                        <nobr style="color: Red; font-size: 12px">Amount Due</nobr>
                    </td>
                    <td style="text-align: center;">
                        <span class="ftitle" style="color: Red; font-size: 12px" groupid="RentalContractsForm" argumentid="TotalAmountDue"></span>
                    </td>
                </tr>

                <tr>
                    <td colspan="4" style="text-align: center;">
                        <div style="padding-top: 10px;">
                            <input type="button" style="width: 175px;" value="Open Contract - Car Out" class="DataAction ButtonStyle btn_1" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Contracts', Params:{NewStateId:'RRCContractOpen'},HideOnSuccess:false,Requery:true}" />
                            <input type="button" style="width: 175px;" value="Open Contract - Car In" class="DataAction ButtonStyle btn_2" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Contracts', Params:{NewStateId:'RRCContractOpenCarIn'},HideOnSuccess:false,Requery:true}" />
                        </div>
                        <div style="padding-top: 10px;">
                            <input type="button" style="width: 225px;" value="Close Contract - Pending Payment" class="DataAction ButtonStyle btn_3" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Contracts',Params:{NewStateId:'RRCContractClosedPendingPayment'}, HideOnSuccess:false, Requery:true}" />
                            <input type="button" style="width: 225px; color: Green" value="Close Contract - Payment Cleared" class="DataAction ButtonStyle btn_4" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Contracts', Params:{NewStateId:'RRCContractClosed'}, HideOnSuccess:false, Requery:true}" />
                            <input type="button" style="width: 225px" value="Cancel Contract" class="DataAction ButtonStyle btn_5" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Contracts', Params:{NewStateId:'RRCContractCancelled'}, HideOnSuccess:false, Requery:true}" />
                        </div>
                        <div style="padding-top: 10px;">
                            <input type="button" style="width: 225px; color: red" value="To Legal - Contract Open - Car Out" ignorevalidate="all" class="DataAction ButtonStyle btn_6" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Contracts', Params:{NewStateId:'RRCWithLegalContractOpenCarOut'}, HideOnSuccess:false, Requery:true}" />
                            <input type="button" style="width: 225px; color: red" value="To Legal - Contract Open - Car In" class="DataAction ButtonStyle btn_7" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Contracts', Params:{NewStateId:'RRCWithLegalContractOpenCarIn'}, HideOnSuccess:false, Requery:true}" />
                            <input type="button" style="width: 225px; color: red" value="To Legal - Contract Closed" class="DataAction ButtonStyle btn_8" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Contracts', Params:{NewStateId:'RRCWithLegalContractClosedPendingPayment'}, HideOnSuccess:false, Requery:true }" />
                        </div>
                        <div style="padding-top: 10px; padding-bottom: 10px">
                            <input type="button" style="width: 50px" roles="iRen_Contracts_Admin" value="  Edit  " class="ButtonStyle Button_Edit" />
                            <input type="button" style="width: 50px" value="  Save  " class="DataAction ButtonStyle btn_11" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Contracts',HideOnSuccess:true, Requery:false, GroupId:'RentalContractsForm'}" />
                            <input type="button" style="width: 50px" value="  Save  " class="DataAction ButtonStyle btn_10" ignorevalidate="ContractKMIn" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Contracts',HideOnSuccess:false, Requery:false, GroupId:'RentalContractsForm'}" />
                            <input type="button" style="width: 70px" value="  Print  " class="ButtonStyle btn_9" />
                            <input type="button" style="width: 70px" value="  Statement  " class="ButtonStyle PrintStatementRental" />
                            <input type="button" style="width: 50px" value="  Close  " class="CloseForm ButtonStyle" />
                        </div>
                    </td>
                </tr>

                <tr class="OnLoadHide">
                    <td class="ftitle" style="font-style: italic" colspan="2">Note: Contract can be closed only if amount due is KD 0.000/-
                    </td>
                    <td class="ftitle">
                        <nobr>Contract Created By</nobr></td>
                    <td>
                        <span class="ftitle" groupid="RentalContractsForm" argumentid="CreatedBy"></span>&nbsp;&nbsp;On&nbsp;&nbsp;<span class="ftitle" groupid="RentalContractsForm" argumentid="DateCreated"></span></td>
                </tr>
            </table>

        </td>
    </tr>

    <%-- <tr tabid="AdditionalDrivers" style="display: none;">
        <td style="padding-top: 1px;">
        <AW:DataGrid ID="grdAdditionalDrivers" LoadOnInit="true" ShowOnLoad="false" runat="server" Hidden="true" Columns="1"
            EmptyHeight="201px" AllowNew="true" SelectableRow="true" 
            PageSize="10" DataSource="SEL_iRental_Contracts_Drivers" ContainerMargin="2px" GridTemplate="jQueryUI"
            GridHeadText="Additional Drivers"  GridButtons="{\'delete\':{conf:{Command:\'UPD_iRental_Customers\',KeysCol:\'RecId\'}}}">
          
            <GridConfig>
            <script>
                cf = {
                    cols: {
                        Sequence: { width: '0px' },
                        RecId: { width: '0px'},
                        ParentRecId: { width: '0px' },
                        CustomerRecCode: { caption: 'Code', width: '100px' },
                        CustomerName: { caption: 'Name'},
                        Nationality: { caption: 'Nationality', width: '150px' },
                        DrivingLicenseNo: { caption: 'Driving License No.', width: '150px' },
                        DrivingLicenseExpiry: { caption: 'Expiry Date', width: '150px' },
                        DateCreated: { caption: 'Date Created', width: '0px' },
                        CreatedBy: { caption: 'Created By', width: '0px' }
                    },
                    forms: {
                        NewFormId: 'frmPaymentDetails',
                        EditFormId: 'frmPaymentDetails',
                        Keys: 'RecId'
                    }
                };
            </script>
            </GridConfig>
            <Scripts>
                <script>
                    var fn = function () {
                        t.on('beforeSearchGetForm', function (P) {
                            var frm = AsyncWidgets.get('frmRentalContracts');
                            P.ParentRecId = frm.GetArgVal('RecId');
                        });
                    }
                </script>
            </Scripts>
            </AW:DataGrid>
                      </td>
                    </tr>--%>
    <script src="Scripts/eForms/iRental/frmiRentalPaymentsDetail.js"></script>

    <tr tabid="PaymentDetails" style="display: none;">
        <td style="padding-top: 1px;">

            <AW:DataGrid ID="grdPaymentDetails" LoadOnInit="true" ShowOnLoad="false" runat="server"
                Hidden="true" Columns="1" EmptyHeight="201px" AllowNew="true" SelectableRow="true"
                PageSize="20" DataSource="SEL_iRental_Contracts_Payments" ContainerMargin="2px"
                GridTemplate="jQueryUI" GridHeadText="Payment Details" GridButtons="{\'delete\':{conf:{Command:\'UPD_iRental_Contracts_Payments\',KeysCol:\'RecId\'}}}">
                <GridConfig>
                    <script>
                        cf = {
                            cols: {
                                Sequence: { width: '0px' },
                                RecId: { width: '0px', caption: 'ID' },
                                LocationReceiptId: { width: '110px', caption: 'ID' },
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
                                NewFormId: 'frmPaymentDetails',
                                EditFormId: 'frmPaymentDetails',
                                Keys: 'RecId'
                            }
                        };
                    </script>
                </GridConfig>
                <RowDetail>
                    <pre class="" colindex="4">
                    <AW:container id="conPaymentDetails_Audit" hidden="true" runat="server">
                    <childern>
                    <div style="padding:15px">
                         <AW:DataGrid ID="grdPaymentDetails_Audit" LoadOnInit="true" ShowOnLoad="false" runat="server"
                Hidden="true" Columns="1" EmptyHeight="201px" AllowNew="true" SelectableRow="false" RelativeKeys="RecId"
                PageSize="30" DataSource="SEL_iRental_Contracts_Payments_Audit" ContainerMargin="2px"  ShowGridHead="false"
                GridTemplate="jQueryUI" GridHeadText="Payment Details" GridButtons="{\'delete\':{visible:false},\'new\':{visible:false}}" >
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
                    </script>
                </GridConfig>
                                <Scripts>
                    <script>
                        var fn = function ()
                        {
                            t.on('rowsRendered', function ()
                            {
                                $('[colid="PaymentType_Audit"]:not(".w-grid-head-cell")').each(function ()
                                {
                                    var ptr = $(this).closest('tr');
                                    if ($(this).text().toLowerCase() == "return")
                                    {
                                        $('[colid="PaymentAmount"] div', ptr).css({ 'font-weight': 'bold', 'color': 'red' });
                                        $('[colid="PaymentAmount"] div', ptr).text('-' + $('[colid="PaymentAmount"] div', ptr).text());
                                    }
                                    $('[colid="PaymentAmount"] div', ptr).text(parseFloat($('[colid="PaymentAmount"] div', ptr).text()).fix(3));
                                });
                            });
                            t.on('onNoRecords', function ()
                            {
                                $('.BottomTR', t.Repeater).hide();
                            });
                        }
                    </script>
                </Scripts>
                </AW:DataGrid>
                </div>
                    </Childern>
                    </AW:container>
                     </pre>
                </RowDetail>

            </AW:DataGrid>

            <script src="../../../Scripts/eForms/iRental/frmiRentalPaymentsDetail.js"></script>

            <AW:Form ID="frmPaymentDetails" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/eForms/iRental/RentalContracts_PD_FrUc.ascx">
                <WidgetConfig>
                    <script>
                        cf = {

                            header: {
                                Style: {},
                                Visible: true,
                                Collapsed: false,
                                HeadText: 'Payment Details'
                            }
                        }
                    </script>
                </WidgetConfig>
                <Scripts>
                    <script>
                        var fn = function ()
                        {

                            //On Change of Amount Update Amount in Words
                        }
                    </script>
                </Scripts>
            </AW:Form>

        </td>
    </tr>

    <tr tabid="OtherCharges" style="display: none;">
        <td style="padding-top: 1px;">
            <AW:DataGrid ID="grdOtherCharges" LoadOnInit="true" ShowOnLoad="false" runat="server" Hidden="true" Columns="1"
                EmptyHeight="201px" AllowNew="true" SelectableRow="true"
                PageSize="10" DataSource="SEL_iRental_Contracts_OtherCharges" ContainerMargin="2px" GridTemplate="jQueryUI"
                GridHeadText="Other Charges" GridButtons="{\'delete\':{conf:{Command:\'UPD_iRental_Contracts_OtherCharges\',KeysCol:\'RecId\'}}}">

                <GridConfig>
                    <script>
                        cf = {
                            cols: {
                                Sequence: { width: '0px' },
                                RecId: { width: '70px', caption: 'ID' },
                                ParentRecId: { width: '0px' },
                                Description: { caption: 'Description' },
                                Charges: { caption: 'Amount', width: '90px' },
                                DateCreated: { caption: 'Date Created', width: '130px' },
                                CreatedBy: { caption: 'Created By', width: '150px' },
                                StateId: { width: '0px' }
                            },
                            forms: {
                                NewFormId: 'frmOtherCharges',
                                EditFormId: 'frmOtherCharges',
                                Keys: 'RecId'
                            }
                        };
                    </script>
                </GridConfig>
                <Scripts>
                    <script>
                        var fn = function ()
                        {
                            t.on('beforeSearchGetForm', function (P)
                            {
                                var frm = AsyncWidgets.get('frmRentalContracts');
                                P.ParentRecId = frm.GetArgVal('RecId');
                            });
                            t.on('beforeRowDelete', function (P)
                            {
                                var fRow = $('td.Item table .chkRowSelect:first', t.Repeater).closest('tr'), pVal;
                                pVal = $('[colid="ParentRecId"] .ColValue', fRow).text();
                                P.cf['ParentRecId'] = pVal;
                            });
                            t.on('rowsRendered', function ()
                            {

                                var frm = AsyncWidgets.get('frmRentalContracts');
                                var strMainStateId = frm.GetArgVal('StateId');

                                $('[colid="Charges"]:not(".w-grid-head-cell")').each(function ()
                                {
                                    var ptr = $(this).closest('tr');
                                    $('[colid="Charges"] div', ptr).text(parseFloat($('[colid="Charges"] div', ptr).text()).fix(3));
                                });

                                $('[colid="StateId"]:not(".w-grid-head-cell")').each(function ()
                                {
                                    var ptr = $(this).closest('tr');
                                    if ($(this).text().toLowerCase() == "deleted")
                                    {
                                        ptr.css('background', '#F1F1F1').attr('disabled', 'disabled');
                                        $('[colid="Charges"] div', ptr).css({ 'text-decoration': 'line-through' });
                                        $('.chkRowSelect', ptr).attr('disabled', 'disabled');
                                        $('td:nth-child(3)', ptr).css('cursor', '').unbind();

                                        var cur = {
                                            'background-image': 'url(' + ROOT_PATH + 'AsyncWidgets/Widgets/resources/images/RowEditForm_Disabled.png)',
                                            'background-repeat': 'no-repeat',
                                            'background-position': 'center center'
                                        };
                                        $('td:nth-child(3)', ptr).css(cur);
                                    }
                                });

                                //If Main State ID = RRCContractClosed or RRCContractCancelled
                                if (strMainStateId == 'RRCContractClosed' || strMainStateId == 'RRCContractCancelled')
                                {
                                    $('[itemno] td:nth-child(1) input', t.Repeater).attr('disabled', 'disabled');
                                    $('[itemno] td:nth-child(3)', t.Repeater).css('cursor', '').unbind();
                                    $('[buttonid="new"],[buttonid="delete"],.w-grid-buttons-top-container', t.Repeater).hide();
                                }
                                else
                                {
                                    $('[buttonid="new"],[buttonid="delete"],.w-grid-buttons-top-container', t.Repeater).show();
                                }
                                //End If Main State ID = RRCContractClosed or RRCContractCancelled
                            });

                            t.on('onNoRecords', function ()
                            {
                                t.fireEvent('rowsRendered');
                            });
                        }
                    </script>
                </Scripts>
                <RowDetail>
                    <pre class="" colindex="3">
                    <AW:container id="conOtherCharges_Audit" hidden="true" runat="server">
                    <childern>
                    <div style="padding:15px">
                         <AW:DataGrid ID="grdOtherCharges_Audit" LoadOnInit="true" ShowOnLoad="false" runat="server"
                Hidden="true" Columns="1" EmptyHeight="201px" AllowNew="true" SelectableRow="false" RelativeKeys="RecId"
                PageSize="30" DataSource="SEL_iRental_Contracts_OtherCharges_Audit" ContainerMargin="2px"  ShowGridHead="false"
                GridTemplate="jQueryUI" GridHeadText="Payment Details" GridButtons="{\'delete\':{visible:false},\'new\':{visible:false}}" >
                           <GridConfig>
                    <script>
                        cf = {
                            cols: {
                                AuditTrailId: { width: '0px', caption: 'Audit ID' },
                                StateId: { caption: 'Status', width: '111px' },
                                RecId: { width: '0px' },
                                ParentRecId: { width: '0px' },
                                Description: { caption: 'Description' },
                                Charges: { caption: 'Amount', width: '90px' },
                                DateCreated: { caption: 'Date Created', width: '130px' },
                                CreatedBy: { caption: 'Created By', width: '132px' }
                            }
                        };
                    </script>
                </GridConfig>
                                <Scripts>
                    <script>
                        var fn = function ()
                        {
                            t.on('rowsRendered', function ()
                            {
                                $('[colid="Charges"]:not(".w-grid-head-cell")').each(function ()
                                {
                                    var ptr = $(this).closest('tr');
                                    $('[colid="Charges"] div', ptr).text(parseFloat($('[colid="Charges"] div', ptr).text()).fix(3));
                                });
                            });
                            t.on('onNoRecords', function ()
                            {
                                $('.BottomTR', t.Repeater).hide();
                            });
                        }
                    </script>
                </Scripts>
                </AW:DataGrid>
                </div>
                    </Childern>
                    </AW:container>
                     </pre>
                </RowDetail>
            </AW:DataGrid>

            <AW:Form ID="frmOtherCharges" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server"
                AsyncForm="~/Pages/eForms/iRental/RentalContracts_OC_FrUc.ascx">
                <WidgetConfig>
                    <script>
                        cf = {

                            header: {
                                Style: {},
                                Visible: true,
                                Collapsed: false,
                                HeadText: 'Other Charges'
                            }
                        }
                    </script>
                </WidgetConfig>
                <Scripts>
                    <script>
                        var fn = function ()
                        {

                            t.on('show', function (args)
                            {
                                var frm = AsyncWidgets.get('frmRentalContracts');
                                $('[argumentid="ParentRecId"]', t.el).text(frm.GetArgVal('RecId'));
                            });
                        }
                    </script>
                </Scripts>
            </AW:Form>

        </td>
    </tr>

    <tr tabid="ContractComments" style="display: none;">
        <td style="padding-top: 1px;">

            <AW:DataGrid ID="grdContractComments" LoadOnInit="true" ShowOnLoad="false" runat="server"
                Hidden="true" Columns="1" EmptyHeight="201px" AllowNew="true" SelectableRow="true"
                PageSize="10" DataSource="SEL_iRental_Contracts_Comments" ContainerMargin="2px"
                GridTemplate="jQueryUI" GridHeadText="Comments" GridButtons="{\'delete\':{conf:{Command:\'UPD_iRental_Contracts_Comments\',KeysCol:\'RecId\'}}}">
                <GridConfig>
                    <script>
                        cf = {
                            cols: {
                                Sequence: { width: '0px' },
                                RecId: { width: '0px' },
                                ParentRecId: { width: '0px' },
                                Comments: { caption: 'Comments' },
                                DateCreated: { caption: 'Date Created', width: '130px' },
                                CreatedBy: { caption: 'Created By', width: '150px' }
                            },
                            forms: {
                                NewFormId: 'frmComments',
                                EditFormId: 'frmComments',
                                Keys: 'RecId'
                            }
                        };
                    </script>
                </GridConfig>
                <Scripts>
                    <script>
                        var fn = function ()
                        {
                            t.on('beforeSearchGetForm', function (P)
                            {
                                var frm = AsyncWidgets.get('frmRentalContracts');
                                P.ParentRecId = frm.GetArgVal('RecId');
                            });
                        }
                    </script>
                </Scripts>
            </AW:DataGrid>

            <AW:Form ID="frmComments" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server"
                AsyncForm="~/Pages/eForms/iRental/RentalContracts_CS_FrUc.ascx">
                <WidgetConfig>
                    <script>
                        cf = {

                            header: {
                                Style: {},
                                Visible: true,
                                Collapsed: false,
                                HeadText: 'Comments'
                            }
                        }
                    </script>
                </WidgetConfig>
                <Scripts>
                    <script>
                        var fn = function ()
                        {

                            t.on('show', function (args)
                            {
                                var frm = AsyncWidgets.get('frmRentalContracts');
                                $('[argumentid="ParentRecId"]', t.el).text(frm.GetArgVal('RecId'));
                            });
                        }
                    </script>
                </Scripts>
            </AW:Form>

        </td>
    </tr>


</table>
