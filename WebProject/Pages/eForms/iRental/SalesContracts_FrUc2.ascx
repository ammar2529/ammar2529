<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalesContracts_FrUc2.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.SalesContracts_FrUc" %>

<%@ Register Src="~/AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="AW" %>
<%@ Register Src="~/Pages/eForms/iRental/CustomerDetails_FrUc.ascx" TagPrefix="AW" TagName="CustomerDetails_FrUc" %>
<script src="../../../Scripts/eForms/iRental/grdSalesContractComments.js"></script>



<link href="../../../Scripts/eForms/iRental/Upload.css" rel="stylesheet" />
<link href="../../../Scripts/eForms/iRental/RemoveButton.css" rel="stylesheet" />
<script type="text/javascript" language="javascript" src="Scripts/eForms/iRental/SalesContracts.js"></script>
<script src="../../../Scripts/eForms/iRental/frmSalesContracts.js"></script>
<script src="../../../JQuery/Common.js"></script>

<style>
    .form-group {
        position: relative;
        margin-bottom: 1.5rem;
    }

    .form-label {
        position: absolute;
        top: 50%;
        left: 10px;
        transform: translateY(-50%);
        transition: all 0.2s ease-out;
        color: #999;
        pointer-events: none;
    }

    .form-control:focus + .form-label,
    .form-control:not(:placeholder-shown) + .form-label {
        top: -10px;
        left: 10px;
        font-size: 0.85rem;
        color: #000;
        background: #fff;
        padding: 0 5px;
    }

    .form-control {
        padding: 1rem 0.5rem 0.5rem 0.5rem;
        border: 1px solid #ccc;
    }

        .form-control:focus {
            border-color: #000;
        }

    .nav-tabs {
        border-bottom: 2px solid #dee2e6;
    }

        .nav-tabs .nav-link {
            border: 1px solid transparent;
            border-top-left-radius: 0.25rem;
            border-top-right-radius: 0.25rem;
        }

            .nav-tabs .nav-link:hover {
                border-color: #e9ecef #e9ecef #dee2e6;
            }

            .nav-tabs .nav-link.active {
                color: #495057;
                background-color: #fff;
                border-color: #dee2e6 #dee2e6 #fff;
            }

    .SimpleTab {
        margin-top: 10px;
    }

    .auto-style1 {
        position: relative;
        margin-bottom: 1.5rem;
        left: 0px;
        top: 0px;
    }
</style>

<div class="container mt-3" style="background-color: white; border: 0.1px solid #0000001c;">
    <h2>Sales Contracts</h2>


    <div>
        <!-- Horizontal Tabs for Medium and Larger Screens -->
        <ul class="SimpleTab nav nav-tabs d-none d-md-flex" id="myTab" role="tablist">
            <li class="nav-item active" tabid="SalesContractDetails">
                <div class="nav-link active" data-bs-toggle="tab">Contract Details</div>
            </li>
            <li class="nav-item" tabid="AdditionalAmount">
                <div class="nav-link" data-bs-toggle="tab">Additional Amount</div>
            </li>
            <li class="nav-item" tabid="SalesPaymentDetails">
                <div class="nav-link" data-bs-toggle="tab">Payment Details</div>
            </li>
            <li class="nav-item" tabid="SalesContractComments">
                <div class="nav-link" data-bs-toggle="tab">Comments</div>
            </li>
        </ul>

        <!-- Vertical Tabs for Small Screens -->
        <ul class="nav flex-column nav-pills d-flex d-md-none SimpleTab" id="myTabVertical" role="tablist">
            <li class="nav-item active" tabid="SalesContractDetails">
                <div class="nav-link active" data-bs-toggle="tab">Contract Details</div>
            </li>
            <li class="nav-item" tabid="AdditionalAmount">
                <div class="nav-link" data-bs-toggle="tab">Additional Amount</div>
            </li>
            <li class="nav-item" tabid="SalesPaymentDetails">
                <div class="nav-link" data-bs-toggle="tab">Payment Details</div>
            </li>
            <li class="nav-item" tabid="SalesContractComments">
                <div class="nav-link" data-bs-toggle="tab">Comments</div>
            </li>
        </ul>
    </div>


    <%--start row--%>
    <div class="container">
        <div class="row mt-5">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-group form-floating">
                    <input type="text" readonly class="form-control form-control-sm" id="SalesContractNo" placeholder=" " groupid="SalesContractsForm" argumentid="RecCode" required disabled="disabled">
                    <label for="SalesContractNo" class="form-label">Contract No.</label>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-group">
                    <input type="text" class="form-control form-control-sm" id="ContractStatus" placeholder=" " groupid="SalesContractsForm" argumentid="StateName" required disabled="disabled">
                    <label for="ContractStatus" class="form-label">Contract Status</label>
                </div>
            </div>
        </div>

        <div class="row mt-5 justify-content-start">
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="form-check form-check-inline">
                    <input class="form-check-input CommonDisableClass ElemDisabled cash" type="radio" id="inlineRadio1" checked="checked" default="default" value="Cash" name="PaymenteMethod" groupid="SalesContractsForm" argumentid="PaymenteMethod">
                    <label class="form-check-label" for="inlineRadio1">Cash</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input CommonDisableClass ElemDisabled finance" type="radio" id="inlineRadio2" value="Finance" name="PaymenteMethod" groupid="SalesContractsForm" argumentid="PaymenteMethod">
                    <label class="form-check-label" for="inlineRadio2">Finance</label>
                </div>

            </div>
            <div class="col-12 col-sm-6 col-lg-3">
                <div class="form-group">
                    <select loadon="FirstVisible" valtype="value" class="form-select form-select-sm dropdownlist required financeCompany CommonDisableClass" aria-label="Small select example" groupid="SalesContractsForm" argumentid="FinanceCompany" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'36'}]}" requirederr='*'>
                        <option value="" selected>Select Finance Company</option>
                    </select>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-2">
                <div class="form-group">
                    <input type="number" class="form-control form-control-sm PriceC  CommonDisableClass     " id="LPOAmount" placeholder=" " groupid="SalesContractsForm" argumentid="LPOAmount">
                    <label for="LPOAmount" class="form-label">LPO Amount</label>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-2">
                <div class="form-group">
                    <input type="text" class="form-control form-control-sm PriceC  CommonDisableClass     " id="LPONumber" placeholder=" " groupid="SalesContractsForm" argumentid="LPONumber">
                    <label for="LPONumber" class="form-label">LPO Number</label>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-2">
                <div class="form-group">
                    <input type="date" class="form-control form-control-sm PriceC  CommonDisableClass     " id="LPODate" placeholder=" " groupid="SalesContractsForm" argumentid="LPODate">
                    <label for="LPONumber" class="form-label">LPO Date</label>
                </div>
            </div>
        </div>




        <%--end row--%>
        <div style="display: none">
            <span groupid="SalesContractsForm" argumentid="RecId1"></span>
            <span groupid="SalesContractsForm" argumentid="StateId"></span>
            <input type="text" style="text-align: center; width: 400px; background-color: #F1F1F1" maxlength="255" class="text AlwaysDisable " argumentid="AmountInWordsSalesContract" groupid="SalesContractsForm" />
            <input type="text" style="text-align: center; width: 400px; background-color: #F1F1F1" maxlength="255" class="text AlwaysDisable " argumentid="AmountInWordsGrandSalesContract" groupid="SalesContractsForm" />
            <%--                            <input type="text" style="text-align: center; width: 400px; background-color: #F1F1F1" maxlength="255" class="text AlwaysDisable " argumentid="AmountDueInWordsSalesContract"  groupid="SalesContractsForm"/>--%>
            <input type="text" style="text-align: center; width: 400px; background-color: #F1F1F1" maxlength="255" class="text AlwaysDisable " argumentid="AmountDueInWordsSalesContract" groupid="SalesContractsForm" />
        </div>
        <input type="hidden" name="RecId" groupid="SalesContractsForm" argumentid="RecId" />
        <%--------------------------------------------------------------------------------------------%>

        <div class="row mt-3">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-group">
                    <div class="form-check form-check-inline">
                        <input class="form-check-input  CommonDisableClass ElemDisabled" type="radio" id="inlineRadio3" default="default" value="N" name="CarType" groupid="SalesContractsForm" argumentid="CarType">
                        <label class="form-check-label" for="inlineRadio3">New Car</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input CommonDisableClass ElemDisabled" type="radio" id="inlineRadio4" value="U" name="CarType" groupid="SalesContractsForm" argumentid="CarType">
                        <label class="form-check-label" for="inlineRadio4">Used Car</label>
                    </div>
                </div>
            </div>


            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-group">
                    <div class="form-check form-check-inline">
                        <input class="form-check-input  CommonDisableClass ElemDisabled  Arrive " type="radio" id="inlineRadio5" default="default" checked="checked" value="CarArrived" name="CarReservationMode" groupid="SalesContractsForm" argumentid="CarReservationMode">
                        <label class="form-check-label" for="inlineRadio5">Car Arrived</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <div class="form-group">
                            <input class="form-check-input CommonDisableClass ElemDisabled NotArrive" type="radio" id="inlineRadio6" value="CarNotArrive" name="CarReservationMode" groupid="SalesContractsForm" argumentid="CarReservationMode">
                            <label class="form-check-label" for="inlineRadio6">Car Not Arrive</label>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <hr>
        <!-- Divider -->
        <div class="row mt-4">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-group">
                    <input type="text" class="form-control form-control-sm   CommonDisableClass   LOVPopup  " id="ChassisNo" placeholder=" " groupid="SalesContractsForm" argumentid="ChassisNo" lovpopupid="carPopup">
                    <label for="ChassisNo" class="form-label">Chassis No.</label>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="auto-style1">
                    <input type="text" class="form-control form-control-sm   CommonDisableClass   LOVPopup  " id="CustomerCode" placeholder=" " groupid="SalesContractsForm" argumentid="CustomerRecCode" lovpopupid="customerPopup" requirederr=' *'>
                    <label for="CustomerCode" class="form-label">Customer Code*</label>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-group CommonSP">
                    <input readonly="readonly" type="text" class="form-control form-control-sm  CommonSP " placeholder=" " groupid="SalesContractsForm" argumentid="CarNumber" disabled="disabled">
                    <label class="form-label">Car No</label>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-group">
                    <input type="text" class="form-control form-control-sm  " placeholder=" " groupid="SalesContractsForm" argumentid="CustomerName" disabled="disabled">
                    <label class="form-label">Name</label>

                </div>
            </div>
        </div>


        <div class="row mt-3">
            <div class=" col-12 col-sm-6 col-lg-6">
                <div class="form-group CommonSP">
                    <input type="text" class="form-control form-control-sm " placeholder=" " groupid="SalesContractsForm" argumentid="Brand" disabled="disabled">
                    <label class="form-label">Brand</label>
                </div>
                <div class="form-group CommonDD">
                    <select loadon="FirstVisible" class="form-control form-control-sm  CommonDisableClass" groupid="SalesContractsForm" argumentid="SalesBrandId" childcombo="SalesModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}">
                        <option value="" selected="selected">Select Brand</option>
                    </select>
                    <label class="form-label">Select Brand</label>
                </div>
            </div>

            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-group">
                    <input type="text" class="form-control form-control-sm" placeholder=" " groupid="SalesContractsForm" argumentid="Nationality" disabled="disabled">
                    <label class="form-label">Nationality</label>
                </div>
            </div>
        </div>



        <div class="row mt-3">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-group CommonSP">
                    <input type="text" class="form-control form-control-sm " placeholder=" " groupid="SalesContractsForm" argumentid="Model" disabled="disabled">
                    <label class="form-label">Model</label>
                </div>
                <div class="form-group CommonDD">
                    <select loadon="FirstVisible" class="form-control form-control-sm  CommonDisableClass" groupid="SalesContractsForm" argumentid="SalesModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'SalesBrandId'}]}">
                        <option value="" selected="selected">Select Model</option>
                    </select>
                    <label class="form-label">Select Model</label>
                </div>
            </div>

            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-group">
                    <input type="text" class="form-control form-control-sm" placeholder=" " groupid="SalesContractsForm" argumentid="NationalIDNo" disabled="disabled">
                    <label class="form-label">National ID No.</label>
                </div>
            </div>
            <%--    <div class="col-12 col-sm-6 col-lg-6">
        <div class="form-group">
            <input type="text" class="form-control form-control-sm" placeholder=" " groupid="SalesContractsForm" argumentid="NationalIDExpiryDate">
            <label class="form-label">National ID Expiry Date</label>
        </div>
    </div>--%>
        </div>

        <div class="row mt-3">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-group CommonSP">
                    <input type="text" class="form-control form-control-sm " placeholder=" " groupid="SalesContractsForm" argumentid="CarYear" disabled="disabled">
                    <label class="form-label">Year</label>
                </div>
                <div class="form-group CommonDD">
                    <select loadon="FirstVisible" class="form-control form-control-sm  CommonDisableClass" groupid="SalesContractsForm" argumentid="SalesYearId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'4'}]}">
                        <option value="" selected="selected">Select Year</option>
                    </select>
                    <label class="form-label">Select Year</label>
                </div>
            </div>

            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-group">
                    <input type="text" class="form-control form-control-sm" placeholder=" " groupid="SalesContractsForm" argumentid="Gender" disabled="disabled">
                    <label class="form-label">Gender</label>
                </div>
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-group CommonSP">
                    <input type="text" class="form-control form-control-sm " placeholder=" " groupid="SalesContractsForm" argumentid="Color" disabled="disabled">
                    <label class="form-label">Color</label>
                </div>
                <div class="form-group CommonDD">
                    <select loadon="FirstVisible" class="form-control form-control-sm  CommonDisableClass" groupid="SalesContractsForm" argumentid="SalesColorId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'6'}]}">
                        <option value="" selected="selected">Select Color</option>
                    </select>
                    <label class="form-label">Select Color</label>
                </div>
            </div>

            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-group">
                    <input type="text" class="form-control form-control-sm" placeholder=" " groupid="SalesContractsForm" argumentid="MobileTelephone1" disabled="disabled">
                    <label class="form-label">Mobile Telephone 1</label>
                </div>
                <%--        <div class="form-group">
            <input type="text" class="form-control form-control-sm" placeholder=" " groupid="SalesContractsForm" argumentid="MobileTelephone2">
            <label class="form-label">Mobile Telephone 2</label>
        </div>--%>
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-group CommonSP">
                    <input type="text" class="form-control form-control-sm " placeholder=" " groupid="SalesContractsForm" argumentid="InteriorColor" disabled="disabled">
                    <label class="form-label">Interior Color</label>
                </div>
                <div class="form-group CommonDD">
                    <select loadon="FirstVisible" class="form-control form-control-sm  CommonDisableClass" groupid="SalesContractsForm" argumentid="SalesInteriorColorId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'45'}]}">
                        <option value="" selected="selected">Select Interior Color</option>
                    </select>
                    <label class="form-label">Select Interior Color</label>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-group">
                    <input type="text" class="form-control form-control-sm text number CommonDisableClass ElemDisabled" maxlength="12" placeholder="Enter 12 Digits" groupid="SalesContractsForm" argumentid="CarOwnerNationalIdNumber" disabled="disabled">
                    <label class="form-label">Car Owner National ID No.</label>
                </div>
            </div>

        </div>

        <div class="row mt-3">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-group CommonSP">
                    <input type="text" class="form-control form-control-sm " placeholder=" " groupid="SalesContractsForm" argumentid="Type" disabled="disabled">
                    <label class="form-label">Type</label>
                </div>
                <div class="form-group CommonDD">
                    <select loadon="FirstVisible" class="form-control form-control-sm  CommonDisableClass" groupid="SalesContractsForm" argumentid="SalesTypeId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'5'}]}">
                        <option value="" selected="selected">Select Type</option>
                    </select>
                    <label class="form-label">Select Type</label>
                </div>
            </div>

            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-group">
                    <input type="text" class="form-control form-control-sm text CommonDisableClass ElemDisabled" style="font-weight: bold;" maxlength="199" placeholder=" " groupid="SalesContractsForm" argumentid="CarOwnerName" disabled="disabled">
                    <label class="form-label">Car Owner Name</label>
                </div>
            </div>


        </div>
        <hr>
        <!-- Divider -->


        <div class="row mt-4">
            <div class="col-12 col-sm-6 col-lg-6">
                <!-- Full Insurance Field (Edit Mode) -->
                <div class="form-group CommonEdit">
                    <input type="text" class="form-control form-control-sm" placeholder=" " groupid="SalesContractsForm" argumentid="FullInsuranceCompanyId" disabled="disabled">
                    <label class="form-label">Full Insurance</label>
                </div>
                <!-- Full Insurance Field (Update Mode) - Initially Hidden -->
                <div class="form-group CommonUpdate" style="display: none;">
                    <select loadon="FirstVisible" class="form-control form-control-sm dropdownlist" groupid="SalesContractsForm" argumentid="FullInsuranceCompanyId2" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'7'}]}">
                        <option value="" selected="selected">Select Insurance</option>
                    </select>
                    <label class="form-label">Select Insurance</label>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-6">
                <!-- Expiry Date Field (Edit Mode) -->
                <div class="form-group FullInsuranceExpiry2 CommonEdit">
                    <input type="date" class="form-control form-control-sm" placeholder=" " groupid="SalesContractsForm" argumentid="FullInsuranceExpiry" disabled="disabled">
                    <label class="form-label">Expiry Date</label>
                </div>
                <!-- Expiry Date Field (Update Mode) - Initially Hidden -->
                <div class="form-group FullInsuranceExpiry CommonUpdate" style="display: none;">
                    <input type="date" class="form-control form-control-sm" maxlength="10" placeholder=" " groupid="SalesContractsForm" argumentid="FullInsuranceExpiry2">
                    <%--<label class="form-label">Expiry Date</label>--%>
                </div>
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-12 col-sm-6 col-lg-6">
                <!-- Policy No. Field (Edit Mode) -->
                <div class="form-group FullInsurance CommonEdit">
                    <input type="text" class="form-control form-control-sm" placeholder=" " groupid="SalesContractsForm" argumentid="FullInsurancePolicyNo" disabled="disabled">
                    <label class="form-label">Edit Policy No.</label>
                </div>
                <!-- Policy No. Field (Update Mode) - Initially Hidden -->
                <div class="form-group CommonUpdate" style="display: none;">
                    <input type="text" class="form-control form-control-sm text" maxlength="10" placeholder=" " groupid="SalesContractsForm" argumentid="FullInsurancePolicyNo2">
                    <label class="form-label">Edit Policy No.</label>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-6">
                <!-- Action Buttons -->
                <div class="form-group">
                    <button type="button" class="btn btn-primary btn-sm Edit_Insrance common-disable-button" style="cursor: pointer;">Edit</button>
                    <button type="button" class="btn btn-success btn-sm Update_Insurance common-disable-button" style="display: none; cursor: pointer;" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts', Params:{Action:'UpdateInsurance'},HideOnSuccess:false, Requery:true,GroupId:'SalesContractsForm'}">Save</button>
                    <button type="button" class="btn btn-danger btn-sm Clear_Insrance common-disable-button" style="display: none; cursor: pointer;">Close</button>
                </div>
            </div>
        </div>

        <hr>
        <!-- Divider -->

        <div class="row mt-4">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-group">
                    <input type="date" class="form-control form-control-sm  CommonDisableClass" placeholder=" " groupid="SalesContractsForm" argumentid="ContractStartDate">
                    <label class="form-label">Reservation Date</label>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-group">
                    <input type="date" class="form-control form-control-sm  DisableOnClose CommonDisableClass" placeholder=" " groupid="SalesContractsForm" argumentid="ReservationDate">
                    <label class="form-label">Reservation End Date</label>
                </div>
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-group">
                    <input type="date" class="form-control form-control-sm  CommonDisableClass" placeholder=" " groupid="SalesContractsForm" argumentid="ContractDate">
                    <label class="form-label">Contract Date</label>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-group">
                    <input type="date" class="form-control form-control-sm DisableOnClose CommonDisableClass" placeholder=" " groupid="SalesContractsForm" argumentid="DeliveryDate">
                    <label class="form-label">Delivery Date</label>
                </div>
            </div>
        </div>
        <hr>
        <!-- Divider -->

        <div class="row mt-4">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-group">
                    <input type="text" class="form-control form-control-sm text number CommonDisableClass" placeholder=" " groupid="SalesContractsForm" argumentid="EngineWarranty">
                    <label class="form-label">Engine Warranty - KM</label>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-group">
                    <select loadon="FirstVisible" class="form-control form-control-sm dropdownlist CommonDisableClass" groupid="SalesContractsForm" argumentid="EnginYearsWarranty" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'37'}]}">
                        <option value="" selected="selected">Select Years</option>
                    </select>
                    <label class="form-label">Years</label>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-group">
                    <input type="text" class="form-control form-control-sm text number CommonDisableClass" placeholder=" " groupid="SalesContractsForm" argumentid="GearWarranty">
                    <label class="form-label">Gear Warranty - KM</label>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-group">
                    <select loadon="FirstVisible" class="form-control form-control-sm dropdownlist CommonDisableClass" groupid="SalesContractsForm" argumentid="GearYearsWarranty" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'37'}]}">
                        <option value="" selected="selected">Select Years</option>
                    </select>
                    <label class="form-label">Years</label>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-group">
                    <input type="text" class="form-control form-control-sm text number CommonDisableClass" placeholder=" " groupid="SalesContractsForm" argumentid="CarWarranty">
                    <label class="form-label">Car Warranty - KM</label>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-group">
                    <select loadon="FirstVisible" class="form-control form-control-sm dropdownlist CommonDisableClass" groupid="SalesContractsForm" argumentid="CarYearsWarranty" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'37'}]}">
                        <option value="" selected="selected">Select Years</option>
                    </select>
                    <label class="form-label">Years</label>
                </div>
            </div>
       

            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-group">
                    <input type="text" class="form-control form-control-sm  CommonDisableClass" placeholder=" " groupid="SalesContractsForm" argumentid="FreeServiceKM">
                    <label class="form-label">Free Service - KM</label>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-group">
                    <input type="text" class="form-control form-control-sm  CommonDisableClass" placeholder=" " groupid="SalesContractsForm" argumentid="ServiceBookNo">
                    <label class="form-label">Service Book No.</label>
                </div>
            </div>

    <div class="col-12 col-sm-6 col-lg-6">
        <fieldset class="form-group">
            
            <div class="form-check form-check-inline">
                <input class="form-check-input CommonDisableClass" type="radio" name="CarReplacement" id="CarReplacementNo" value="No" checked="checked" default="default" groupid="SalesContractsForm" argumentid="CarReplacement">
                <label class="form-check-label" for="CarReplacementNo">No</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input CommonDisableClass" type="radio" name="CarReplacement" id="CarReplacementYes" value="Yes" groupid="SalesContractsForm" argumentid="CarReplacement">
                <label class="form-check-label" for="CarReplacementYes">Yes</label>
            </div>
        </fieldset>
    </div>
                <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-group">
                    <input type="text" class="form-control form-control-sm text CommonDisableClass" placeholder=" " groupid="SalesContractsForm" argumentid="RoadServiceNo">
                    <label class="form-label">Road Service Card No.</label>
                </div>
            </div>
</div>


        
        <hr>
        <!-- Divider -->

<div class="row mt-3">
    <div class="col-12 col-sm-6 col-lg-6">
        <div class="form-group">
            <label class="form-label text-danger" style="font-size: 12px;">Amount Due:</label>
<%--            <span class="form-control-plaintext ftitle AmountDueC text-danger" groupid="SalesContractsForm" argumentid="AmountDue" style="display: block; margin-top: 5px;"></span>--%>
                      <input type="text" readonly="" class="form-control-plaintext" id="staticEmail" groupid="SalesContractsForm" argumentid="AmountDue" >

        </div>
    </div>
    <div class="col-12 col-sm-6 col-lg-6">
        <div class="form-group">
            <label class="form-label text-success" style="font-size: 12px;">Amount Received (KD):</label>
<%--            <span class="form-control-plaintext ftitle PaymentAmountC text-success" groupid="SalesContractsForm" argumentid="PaymentAmount" style="display: block; margin-top: 5px;"></span>--%>
                                  <input type="text" readonly="" class="form-control-plaintext" id="staticEmail2" groupid="SalesContractsForm" argumentid="PaymentAmount" >

        </div>
    </div>
</div>


           <hr>
        <!-- Divider -->

<%--                    <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-group">
                    <label class="form-label">Bill Amt:</label>
                    <input type="text" class="form-control form-control-sm text number CommonDisableClass" maxlength="10" style="text-align: center;" groupid="SalesContractsForm" argumentid="BillAmount">
                    <button type="button" title="Set Current Car Price" class="btn btn-secondary btn-sm ftitle CommonDisableClass btnGetCarPrice">↓</button>
                </div>
            </div>--%>
<div class="row mt-3">
    <div class="col-12 col-sm-6 col-lg-6 mx-auto">
        <div class="d-flex justify-content-center flex-wrap" style="gap: 10px;">
            <button type="button" class="btn btn-primary btn-sm DataAction btnReserve" ignorevalidate="DocType" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts',HideOnSuccess:true,GroupId:'SalesContractsForm',Requery:false}">Reserve</button>
            <button type="button" class="btn btn-success btn-sm DataAction CloseContract" ignorevalidate="DocType" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts', Params:{NewStateId:'RRCContractClosed'}, HideOnSuccess:false,GroupId:'SalesContractsForm', Requery:true}">Close Contract - Payment Cleared</button>
            <button type="button" class="btn btn-danger btn-sm DataAction CancelContract" ignorevalidate="DocType" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts', Params:{NewStateId:'RRCContractCancelled'}, HideOnSuccess:false,GroupId:'SalesContractsForm', Requery:true}">Cancel Contract</button>
            <button type="button" class="btn btn-warning btn-sm DataAction PendingPaymentCarOut" ignorevalidate="DocType" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts', Params:{NewStateId:'RRCPendingPaymentCarOut'},HideOnSuccess:false,Requery:true,GroupId:'SalesContractsForm'}">Pending Payment - Car Out</button>
            <button type="button" class="btn btn-warning btn-sm DataAction PendingPaymentCarIn" ignorevalidate="DocType" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts', Params:{NewStateId:'RRCPendingPaymentCarIn'},HideOnSuccess:false,Requery:true,GroupId:'SalesContractsForm'}">Pending Payment - Car In</button>
            <button type="button" class="btn btn-dark btn-sm SalesButton_Edit" roles="iRen_Contracts_Admin">Edit</button>
            <button type="button" class="btn btn-info btn-sm DataAction btnSave" ignorevalidate="ReservationDate DocType" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts',Params:{DBAction:'RRCCreatedState'},HideOnSuccess:false, Requery:true,GroupId:'SalesContractsForm'}">Reserve</button>
            <button type="button" class="btn btn-info btn-sm DataAction SaveBtn" ignorevalidate="ReservationDate DocType" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts',Params:{DBAction:'NoStateId'},HideOnSuccess:false, Requery:true,GroupId:'SalesContractsForm'}">Save</button>
            <button type="button" class="btn btn-primary btn-sm QuotationBtn">Quotation</button>
            <button type="button" class="btn btn-primary btn-sm ContractPrintBtn">Contract</button>
            <button type="button" class="btn btn-secondary btn-sm Statement">Statement</button>
            <button type="button" class="btn btn-secondary btn-sm CloseForm btnCancel">Close</button>
        </div>
    </div>
</div>




        <div class="row mt-3 border border-dark">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-group">
                    <label class="form-label">Bill Date:</label>
                    <input type="date" class="form-control form-control-sm  CommonDisableClass" maxlength="10" style="text-align: center;" groupid="SalesContractsForm" argumentid="BillDate">
                </div>
            </div>
        </div>
        <div class="row mt-3 border border-dark">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-group">
                    <button type="button" class="btn btn-primary btn-sm ButtonStyle BillsBtn common-button" ignorevalidate="ReservationDate DocType" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts',Params:{DBAction:'NoStateId'},HideOnSuccess:false,ShowActionMsg:false, Requery:true,GroupId:'SalesContractsForm'}">Bill</button>
                </div>
            </div>
        </div>

        <input type="hidden" groupid="SalesContractsForm" argumentid="FileGuid" readonly="readonly" />


        <div class="row mt-3">
            <div class="col-12">
                <div class="form-group file-upload-drop-area" style="padding: 5px;">
                    <select class="form-control form-control-sm dropdownlist required" groupid="SalesContractsForm" argumentid="DocType" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'34'}]}">
                        <option value="" selected="selected">Select Doc Type</option>
                    </select>
                    <input type="file" class="form-control-file file-input" accept=".pdf,.jpg,jpeg,.png,.txt,.docx">
                    <span class="allowedFile" style="display: none;"></span>
                    <button class="btn btn-primary btn-sm upload-button DataAction" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts',Params:{DBAction:'FileUpload'},HideOnSuccess:false, Requery:false,ShowActionMsg:false,GroupId:'SalesContractsForm'}">Upload</button>
                </div>
                <input type="hidden" groupid="SalesContractsForm" argumentid="FileGuid" readonly="readonly">
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-12">
                <div class="table-responsive">
                    <table class="table table-bordered uploadedFileList">
                        <thead>
                            <tr>
                                <th style="width: 40%;">File Name</th>
                                <th>File Size</th>
                                <th>File Type</th>
                                <th>Uploaded By</th>
                                <th>Upload Date</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                        <tfoot>
                            <tr class="NoRecordsTR">
                                <td colspan="7" class="text-center">No records available.</td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-12">
                <div class="form-group">
                    <label class="form-label">Contract Created By:</label>
                    <span class="form-control-plaintext ftitle" groupid="SalesContractsForm" argumentid="CreatedBy"></span>
                </div>
            </div>
            <div class="col-12">
                <div class="form-group">
                    <label class="form-label">Contract Date & Time:</label>
                    <span class="form-control-plaintext ftitle" groupid="SalesContractsForm" argumentid="DateCreated"></span>
                    <span class="form-control-plaintext ftitle" groupid="SalesContractsForm" argumentid="DateCreatedTime"></span>
                </div>
            </div>
        </div>



    </div>

</div>



</div>







