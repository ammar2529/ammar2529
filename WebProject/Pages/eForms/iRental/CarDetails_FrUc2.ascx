<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CarDetails_FrUc2.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.CarDetails_FrUc2" %>

<div class="">

    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-sm-12 ">
                    <div class="form-header">

                        <span class=" h5 fw-bold ink-bar">Car Details</span>
                        <i class="fa-regular fa-rectangle-xmark CloseForm"
                            tabid="CloseBtn" title="Close Form"
                            style="font-size: 20px; color: black; cursor: pointer; transition: color 0.3s ease; position: absolute; right: 10px;"
                            onmouseover="this.style.color='red';"
                            onmouseout="this.style.color='black';"></i>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12">
                    <div class="row my-3 justify-content-md-center">
                        <div class="alert alert-info mt-3" role="alert">
                            Use the form below to update the details, fields marked with an asterisk (*) are mandatory
                        </div>
                    </div>

                    <!-- Car For -->
                    <div class="row mt-2 ">
                        <div class="col-12 col-sm-none col-lg-3"></div>
                        <div class="col-12 col-sm-12 col-lg-2 text-start">
                            <label for="floatingKM">
                                <small><b>Car For:</b></small>
                            </label>
                        </div>
                        <div class="col-12 col-sm-12 col-lg-3 text-start">

                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="CarFor" id="CarForRental" value="Rental" groupid="CarsForm" argumentid="CarFor" checked>
                                <label class="form-check-label" for="CarForRental">Rental</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="CarFor" id="CarForLease" value="Lease" groupid="CarsForm" argumentid="CarFor">
                                <label class="form-check-label" for="CarForLease">Lease</label>
                            </div>
                        </div>
                        <div class="col-12 col-sm-none col-lg-4"></div>
                        <div style="display: none">
                            <span groupid="CarsForm" argumentid="RecId"></span>
                        </div>
                    </div>

                    <!-- Car Number -->
                    <div class="row mt-2 justify-content-md-center">
                        <div class="col-12 col-sm-12 col-lg-6">
                            <div class="form-floating">
                                <input type="text" class="form-control form-control-sm text required validateunique" id="CDCarNumber"
                                    placeholder="Car Number*" maxlength="10" primarykey="RecId" storeid="iRental_Cars"
                                    uniquenotfound="{en:'Car Number is valid...',color:'green'}" uniquefound="{en:'Duplicate Car Number...',color:'red'}"
                                    groupid="CarsForm" argumentid="CarNumber">
                                <label for="CDCarNumber">Car Number*</label>
                            </div>
                        </div>
                    </div>

                    <!-- Chassis Number -->
                    <div class="row mt-2 justify-content-md-center">
                        <div class="col-12 col-sm-12 col-lg-6">
                            <div class="form-floating">
                                <input type="text" class="form-control form-control-sm text required validateunique" id="ChassisNo"
                                    placeholder="Chassis Number*" maxlength="50" primarykey="RecId" storeid="iRental_Cars"
                                    uniquenotfound="{en:'Chassis Number is valid...',color:'green'}" uniquefound="{en:'Duplicate Chassis Number...',color:'red'}"
                                    groupid="CarsForm" argumentid="ChassisNo">
                                <label for="ChassisNo">Chassis Number*</label>
                            </div>
                        </div>
                    </div>

                    <!-- Dropdown Fields -->
                    <div class="row mt-2 justify-content-md-center">
                        <div class="col-12 col-sm-12 col-lg-6">
                            <div class="form-floating">
                                <select class="form-select form-select-sm dropdownlist required" id="CRBrandId" groupid="CarsForm"
                                    argumentid="BrandId" loadon="FirstVisible" childcombo="ModelId"
                                    storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}">
                                    <option value="" selected>Select Brand</option>
                                </select>
                                <label for="CRBrandId">Brand*</label>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-2 justify-content-md-center">
                        <div class="col-12 col-sm-12 col-lg-6">
                            <div class="form-floating">
                                <select class="form-select form-select-sm dropdownlist required" id="ModelId" groupid="CarsForm"
                                    argumentid="ModelId"
                                    storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'}, {SPParamName:'SubParentTypeId',Name:'BrandId'}]}">
                                    <option value="" selected>Select Model</option>
                                </select>
                                <label for="ModelId">Model*</label>
                            </div>
                        </div>
                    </div>

                    <!-- Year -->
                    <div class="row mt-2 justify-content-md-center">
                        <div class="col-12 col-sm-12 col-lg-6">
                            <div class="form-floating">
                                <select class="form-select form-select-sm dropdownlist required" id="CarYear" groupid="CarsForm"
                                    argumentid="CarYear" loadon="FirstVisible"
                                    storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill', TextCol:'Name', ValCol:'ChildId', Params:[{Name:'ParentTypeId',Value:'4'}]}">
                                    <option value="" selected>Select Year</option>
                                </select>
                                <label for="CarYear">Year*</label>
                            </div>
                        </div>
                    </div>

                    <!-- Color -->
                    <div class="row mt-2 justify-content-md-center">
                        <div class="col-12 col-sm-12 col-lg-6">
                            <div class="form-floating">
                                <select class="form-select form-select-sm dropdownlist required" id="ColorId" groupid="CarsForm"
                                    argumentid="ColorId" loadon="FirstVisible"
                                    storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill', TextCol:'Name', ValCol:'ChildId', Params:[{Name:'ParentTypeId',Value:'6'}]}">
                                    <option value="" selected>Select Color</option>
                                </select>
                                <label for="ColorId">Color*</label>
                            </div>
                        </div>
                    </div>

                    <!-- Type -->
                    <div class="row mt-2 justify-content-md-center">
                        <div class="col-12 col-sm-12 col-lg-6">
                            <div class="form-floating">
                                <select class="form-select form-select-sm dropdownlist required" id="TypeId" groupid="CarsForm"
                                    argumentid="TypeId" loadon="FirstVisible"
                                    storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill', TextCol:'Name', ValCol:'ChildId', Params:[{Name:'ParentTypeId',Value:'5'}]}">
                                    <option value="" selected>Select Type</option>
                                </select>
                                <label for="TypeId">Type*</label>
                            </div>
                        </div>
                    </div>

                    <!-- Example: Current Mileage -->
                    <div class="row mt-2 ">
                        <div class="col-12 col-sm-none col-lg-3"></div>
                        <div class="col-12 col-sm-12 col-md-6 col-lg-6">
                            <div class="form-floating">
                                <input type="text" class="form-control form-control-sm text required number" id="CurrentMileage"
                                    placeholder="Current Mileage*" maxlength="10" groupid="CarsForm" argumentid="CurrentMileage">
                                <label for="CurrentMileage">Current Mileage*</label>
                            </div>


                        </div>
                        <div class="col-12 col-sm-12 col-md-6 col-lg-3">
                            <small class="text-muted">Enter "0" for Brand New Car</small>
                        </div>
                    </div>




                    <!-- Normal Insurance -->
                    <div class="row mt-2 justify-content-md-center">
                        <!-- Normal Insurance Select -->
                        <div class="col-12 col-sm-12 col-md-12 col-lg-2">
                            <div class="form-floating">
                                <select class="form-select form-select-sm " id="InsuranceCompanyId" groupid="CarsForm"
                                    argumentid="InsuranceCompanyId" loadon="FirstVisible"
                                    storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill', TextCol:'Name', ValCol:'ChildId', Params:[{Name:'ParentTypeId',Value:'8'}]}">
                                    <option value="" selected>Select Insurance</option>
                                </select>
                                <label for="InsuranceCompanyId">Normal Insurance</label>
                            </div>
                        </div>

                        <!-- Expiry Date -->
                        <div class="col-12 col-sm-12 col-md-12 col-lg-2">
                            <div class="form-floating">
                                <input type="date" class="form-control form-control-sm text  date" id="InsuranceExpiry"
                                    placeholder="Expiry Date" maxlength="10" groupid="CarsForm" argumentid="InsuranceExpiry">
                                <label for="InsuranceExpiry">Expiry Date</label>
                            </div>
                        </div>

                        <!-- Policy No -->
                        <div class="col-12 col-sm-12 col-md-12 col-lg-2">
                            <div class="form-floating">
                                <input type="text" class="form-control form-control-sm text" id="InsurancePolicyNo"
                                    placeholder="Policy No." maxlength="50" style="text-align: center; font-weight: bold; color: red;"
                                    groupid="CarsForm" argumentid="InsurancePolicyNo">
                                <label for="InsurancePolicyNo">Policy No.</label>
                            </div>
                        </div>

                        <!-- Value -->
                        <div class="col-12 col-sm-12 col-md-12 col-lg-2">
                            <div class="form-floating">
                                <input type="text" class="form-control form-control-sm text number" id="InsurancePolicyValue"
                                    placeholder="Value" maxlength="10" style="text-align: center;"
                                    groupid="CarsForm" argumentid="InsurancePolicyValue">
                                <label for="InsurancePolicyValue">Value</label>
                            </div>
                        </div>

                        <!-- Amount Paid -->
                        <div class="col-12 col-sm-12 col-md-12 col-lg-2">
                            <div class="form-floating">
                                <input type="text" class="form-control form-control-sm text number" id="InsurancePolicyAmount"
                                    placeholder="Amount Paid" maxlength="10" style="text-align: center;"
                                    groupid="CarsForm" argumentid="InsurancePolicyAmount">
                                <label for="InsurancePolicyAmount">Amount Paid</label>
                            </div>
                        </div>
                    </div>


                    <!-- Full Insurance -->
                    <div class="row mt-2 justify-content-md-center">
                        <!-- Full Insurance Select -->
                        <div class="col-12 col-sm-12 col-md-12 col-lg-2">
                            <div class="form-floating">
                                <select class="form-select form-select-sm dropdownlist" id="FullInsuranceCompanyId" groupid="CarsForm"
                                    argumentid="FullInsuranceCompanyId" loadon="FirstVisible"
                                    storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill', TextCol:'Name', ValCol:'ChildId', Params:[{Name:'ParentTypeId',Value:'7'}]}">
                                    <option value="" selected>Select Insurance</option>
                                </select>
                                <label for="FullInsuranceCompanyId">Full Insurance</label>
                            </div>
                        </div>

                        <!-- Expiry Date -->
                        <div class="col-12 col-sm-12 col-md-12 col-lg-2">
                            <div class="form-floating">
                                <input type="date" class="form-control form-control-sm text" id="FullInsuranceExpiry"
                                    placeholder="Expiry Date" maxlength="10" groupid="CarsForm" argumentid="FullInsuranceExpiry">
                                <label for="FullInsuranceExpiry">Expiry Date</label>
                            </div>
                        </div>

                        <!-- Policy No -->
                        <div class="col-12 col-sm-12 col-md-12 col-lg-2">
                            <div class="form-floating">
                                <input type="text" class="form-control form-control-sm text" id="FullInsurancePolicyNo"
                                    placeholder="Policy No." maxlength="50" style="text-align: center; font-weight: bold; color: red;"
                                    groupid="CarsForm" argumentid="FullInsurancePolicyNo">
                                <label for="FullInsurancePolicyNo">Policy No.</label>
                            </div>
                        </div>

                        <!-- Value -->
                        <div class="col-12 col-sm-12 col-md-12 col-lg-2">
                            <div class="form-floating">
                                <input type="text" class="form-control form-control-sm text number" id="FullInsurancePolicyValue"
                                    placeholder="Value" maxlength="10" style="text-align: center;"
                                    groupid="CarsForm" argumentid="FullInsurancePolicyValue">
                                <label for="FullInsurancePolicyValue">Value</label>
                            </div>
                        </div>

                        <!-- Amount Paid -->
                        <div class="col-12 col-sm-12 col-md-12 col-lg-2">
                            <div class="form-floating">
                                <input type="text" class="form-control form-control-sm text number" id="FullInsurancePolicyAmount"
                                    placeholder="Amount Paid" maxlength="10" style="text-align: center;"
                                    groupid="CarsForm" argumentid="FullInsurancePolicyAmount">
                                <label for="FullInsurancePolicyAmount">Amount Paid</label>
                            </div>
                        </div>
                    </div>


                    <div class="row mt-2 justify-content-md-center">
                        <!-- Car Location -->
                        <div class="col-12 col-sm-12 col-md-12 col-lg-6">
                            <div class="form-floating">
                                <select class="form-select form-select-sm required" id="CarDCarLocationId" groupid="CarsForm"
                                    argumentid="CarLocationId" loadon="FirstVisible"
                                    storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill', TextCol:'Name', ValCol:'ChildId', Params:[{Name:'ParentTypeId', Value:'11'}]}">
                                    <option value="" selected>Select Location</option>
                                </select>
                                <label for="CarDCarLocationId">Car Location*</label>
                            </div>
                        </div>
                    </div>

                    <div class="row mt-2 justify-content-md-center">
                        <!-- Car Status -->
                        <div class="col-6 col-sm-6 col-md-12 col-lg-4">
                            <div class="form-floating">
                                <select class="form-select form-select-sm required" id="CarStatusId" groupid="CarsForm"
                                    argumentid="CarStatusId" loadon="FirstVisible"
                                    storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill', TextCol:'Name', ValCol:'ChildId', Params:[{Name:'ParentTypeId', Value:'9'}]}">
                                    <option value="" selected>Select Status</option>
                                </select>
                                <label for="CarStatusId">Car Status*</label>
                            </div>
                        </div>
                        <div class="col-6 col-sm-6 col-lg-2 mt-3">
                            <span id="ContractNo" class="form-text text-danger" groupid="CarsForm" argumentid="ContractNo"></span>
                        </div>
                    </div>



                    <!-- Save and Cancel Buttons -->
                    <div class="row mt-2 justify-content-md-center mb-2">
                        <div class="col-12 col-sm-6 col-lg-2">
                            <button type="button" class="btn btn-primary w-100 DataAction"
                                conf="{ActorId:'DataHelper', ActionId:'DataAction', Command:'UPD_iRental_Cars', HideOnSuccess:true}">
                                Save</button>
                        </div>
                        <div class="col-12 col-sm-6 col-lg-2">
                            <button type="button" class="btn btn-secondary w-100 CloseForm">Cancel</button>
                        </div>
                    </div>


                </div>
            </div>
        </div>

    </div>
</div>
