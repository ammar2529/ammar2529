<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GarageCarServiceDetails_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.GarageCarServiceDetails_FrUc" %>




<%--<link href="../../../Scripts/eForms/iRental/Upload.css" rel="stylesheet" />
<link href="../../../Scripts/eForms/iRental/RemoveButton.css" rel="stylesheet" />--%>




<div class="container">

    <div class="row my-3 justify-content-md-center">
      <div class="alert alert-info mt-3" role="alert">
        Use the form below to update the details, fields marked with an asterisk (*) are mandatory
      </div>
      <div style="display: none">
        <span groupid="GarageCarServiceDetails" argumentid="RecId"></span>
        <span groupid="GarageCarServiceDetails" argumentid="FileGuid"></span>
        <span groupid="GarageCarServiceDetails" argumentid="StateId"></span>
      </div>
    </div>

    <!-- Service No. and Service Status -->
<div class="container">
  <div class="row mb-3 justify-content-center">
    <div class="col-12 col-md-6 col-lg-4 mb-3 mb-md-0">
      <div class="form-floating">
        <input type="text" class="form-control-plaintext text-center fw-bold text-danger" id="RecCode"  argumentid="RecCode"
               placeholder="Service No." readonly value="New contract no. will be generated on saving">
        <label for="RecCode">Service No.</label>
      </div>
    </div>
    
    <div class="col-12 col-md-6 col-lg-4">
      <div class="form-floating">
        <input type="text" class="form-control-plaintext text-center" id="StateName" argumentid="StateName"
               placeholder="Service Status" readonly>
        <label for="StateName">Service Status</label>
      </div>
    </div>
  </div>
</div>

    <!-- Car No. and Customer Code -->
    <div class="row mb-3">
      <div class="col-12 col-md-none col-sm-none col-lg-2"></div>
      <div class="col-12 col-md-6 col-lg-4 mb-3 mb-md-0">
        <div class="form-floating">
          <input type="text" class="form-control text LOVPopup required CommonDisableClass" id="CarNumber" 
                 placeholder="Car No.*" style="text-align: center; font-weight: bold; color: red;" 
                 maxlength="10" groupid="GarageCarServiceDetails" lovpopupid="carPopupGarage" argumentid="CarNumber">
          <label for="CarNumber">Car No.*</label>
        </div>
      </div>
      <div class="col-12 col-md-6 col-lg-4">
        <div class="form-floating">
          <input type="text" class="form-control-plaintext text fw-bold" id="CustomerRecCode" placeholder="Customer Code*" 
                 style="text-align: center;" readonly groupid="GarageCarServiceDetails" argumentid="CustomerRecCode">
          <label for="CustomerRecCode">Customer Code*</label>
        </div>
      </div>
      <div class="col-12 col-md-none col-sm-none col-lg-2"></div>
    </div>

    <!-- Chassis No. and Name -->
    <div class="row mb-3">
      <div class="col-12 col-md-none col-sm-none col-lg-2"></div>
      <div class="col-12 col-md-6 col-lg-4 mb-3 mb-md-0">
        <div class="form-floating">
          <input type="text" class="form-control-plaintext text fw-bold" id="ChassisNo" placeholder="Chassis No." 
                 style="text-align: center;" readonly groupid="GarageCarServiceDetails" argumentid="ChassisNo">
          <label for="ChassisNo">Chassis No.</label>
        </div>
      </div>
      <div class="col-12 col-md-6 col-lg-4">
        <div class="form-floating">
          <input type="text" class="form-control-plaintext fw-bold text" id="CustomerName" placeholder="Name" 
                 style="text-align: center; font-size: 16px;" readonly groupid="GarageCarServiceDetails" argumentid="CustomerName">
          <label for="CustomerName">Name</label>
        </div>
      </div>
      <div class="col-12 col-md-none col-sm-none col-lg-2"></div>
    </div>

    <!-- Brand and National ID No. -->
    <div class="row mb-3">
      <div class="col-12 col-md-none col-sm-none col-lg-2"></div>
      <div class="col-12 col-md-6 col-lg-4 mb-3 mb-md-0">
        <div class="form-floating">
          <input type="text" class="form-control-plaintext fw-bold text" id="Brand" placeholder="Brand" 
                 style="text-align: center;" readonly groupid="GarageCarServiceDetails" argumentid="Brand">
          <label for="Brand">Brand</label>
        </div>
      </div>
      <div class="col-12 col-md-6 col-lg-4">
        <div class="form-floating">
          <input type="text" class="form-control-plaintext fw-bold text" id="NationalIDNo" placeholder="National ID No." 
                 style="text-align: center;" readonly groupid="GarageCarServiceDetails" argumentid="NationalIDNo">
          <label for="NationalIDNo">National ID No.</label>
        </div>
      </div>
      <div class="col-12 col-md-none col-sm-none col-lg-2"></div>
    </div>

    <!-- Model and Mobile Telephone -->
    <div class="row mb-3">
      <div class="col-12 col-md-none col-sm-none col-lg-2"></div>
      <div class="col-12 col-md-6 col-lg-4 mb-3 mb-md-0">
        <div class="form-floating">
          <input type="text" class="form-control-plaintext fw-bold text" id="Model" placeholder="Model" 
                 style="text-align: center;" readonly groupid="GarageCarServiceDetails" argumentid="Model">
          <label for="Model">Model</label>
        </div>
      </div>
      <div class="col-12 col-md-6 col-lg-4 ">
        <div class="form-floating">
          <input type="text" class="form-control-plaintext fw-bold text" id="MobileTelephone1" placeholder="Mobile Telephone" 
                 style="text-align: center;" readonly groupid="GarageCarServiceDetails" argumentid="MobileTelephone1">
          <label for="MobileTelephone1">Mobile Telephone</label>
        </div>
      </div>
      <div class="col-12 col-md-none col-sm-none col-lg-2"></div>
    </div>

    <!-- Year and Temp Telephone -->
    <div class="row mb-3">
      <div class="col-12 col-md-none col-sm-none col-lg-2"></div>
      <div class="col-12 col-md-6 col-lg-4 mb-3 mb-md-0">
        <div class="form-floating">
          <input type="text" class="form-control-plaintext fw-bold text" id="CarYear" placeholder="Year" 
                 style="text-align: center;" readonly groupid="GarageCarServiceDetails" argumentid="CarYear">
          <label for="CarYear">Year</label>
        </div>
      </div>
      <div class="col-12 col-md-6 col-lg-4">
        <div class="form-floating">
          <input type="text" class="form-control-plaintext fw-bold text CommonDisableClass" id="TempMobile" placeholder="Temp Telephone" 
                 style="text-align: center;" maxlength="100" groupid="GarageCarServiceDetails" argumentid="TempMobile">
          <label for="TempMobile">Temp Telephone</label>
        </div>
      </div>
      <div class="col-12 col-md-none col-sm-none col-lg-2"></div>
    </div>

    <!-- Color and Manual ID -->
    <div class="row mb-3">
      <div class="col-12 col-md-none col-sm-none col-lg-2"></div>
      <div class="col-12 col-md-6 col-lg-4 mb-3 mb-md-0">
        <div class="form-floating">
          <input type="text" class="form-control-plaintext fw-bold text" id="Color" placeholder="Color" 
                 style="text-align: center;" readonly groupid="GarageCarServiceDetails" argumentid="Color">
          <label for="Color">Color</label>
        </div>
      </div>
      <div class="col-12 col-md-6 col-lg-4">
        <div class="form-floating">
          <input type="text" class="form-control text CommonDisableClass" id="ManualID" placeholder="Manual ID" 
                 style="text-align: center;" maxlength="100" groupid="GarageCarServiceDetails" argumentid="ManualID">
          <label for="ManualID">Manual ID</label>
        </div>
      </div>
      <div class="col-12 col-md-none col-sm-none col-lg-2"></div>
    </div>

    <!-- Type -->
    <div class="row mb-3">
      <div class="col-12 col-md-none col-sm-none col-lg-2"></div>
      <div class="col-12 col-md-6 col-lg-4">
        <div class="form-floating">
          <input type="text" class="form-control-plaintext fw-bold  text" id="Type" placeholder="Type" 
                 style="text-align: center;" readonly groupid="GarageCarServiceDetails" argumentid="Type">
          <label for="Type">Type</label>
        </div>
      </div>
              <div class="col-12 col-md-none col-sm-none col-lg-4"></div>
      <div class="col-12 col-md-none col-sm-none col-lg-6"></div>
    </div>

    <!-- Full Insurance and Policy No. -->
    <div class="row mb-3 hideOnNoExpirayDate">
      <div class="col-12 col-md-none col-sm-none col-lg-2"></div>
      <div class="col-12 col-md-6 col-lg-4 mb-3 mb-md-0">
        <div class="form-floating">
          <input type="text" class="form-control-plaintext fw-bold text CommonDisable" id="FullInsuranceCompanyId" 
                 placeholder="Full Insurance" style="text-align: center;" readonly 
                 groupid="GarageCarServiceDetails" argumentid="FullInsuranceCompanyId">
          <label for="FullInsuranceCompanyId">Full Insurance</label>
        </div>
      </div>
      <div class="col-12 col-md-6 col-lg-4">
        <div class="form-floating">
          <input type="text" class="form-control-plaintext fw-bold text CommonDisable" id="FullInsurancePolicyNo" 
                 placeholder="Policy No." style="text-align: center;" readonly 
                 groupid="GarageCarServiceDetails" argumentid="FullInsurancePolicyNo">
          <label for="FullInsurancePolicyNo">Policy No.</label>
        </div>
      </div>
      <div class="col-12 col-md-none col-sm-none col-lg-2"></div>
    </div>

    <!-- Expiry Date -->
    <div class="row mb-3 hideOnNoExpirayDate">
      <div class="col-12 col-md-none col-sm-none col-lg-2"></div>
      <div class="col-12 col-md-6 col-lg-4">
        <div class="form-floating">
          <input type="text" class="form-control-plaintext fw-bold text CommonDisable" id="FullInsuranceExpiry" 
                 placeholder="Expiry Date" style="text-align: center;" readonly 
                 groupid="GarageCarServiceDetails" argumentid="FullInsuranceExpiry">
          <label for="FullInsuranceExpiry">Expiry Date</label>
        </div>
      </div>
              <div class="col-12 col-md-none col-sm-none col-lg-4"></div>
      <div class="col-12 col-md-none col-sm-none col-lg-6"></div>
    </div>

    <!-- Last Service Date and Last Service KM -->
    <div class="row mb-3">
      <div class="col-12 col-md-none col-sm-none col-lg-2"></div>
      <div class="col-12 col-md-6 col-lg-4 mb-3 mb-md-0">
        <div class="form-floating">
          <input type="text" class="form-control-plaintext fw-bold text dateLabel onDisable" id="LastCarServiceDate" 
                 placeholder="Last Service Date" style="text-align: center;" readonly 
                 groupid="GarageCarServiceDetails" argumentid="LastCarServiceDate">
          <label for="LastCarServiceDate">Last Service Date</label>
        </div>
      </div>
      <div class="col-12 col-md-6 col-lg-4">
        <div class="form-floating">
          <input type="text" class="form-control-plaintext fw-bold  text CommonDisable CommonCommaText" id="LastServiceKm" 
                 placeholder="Last Service KM" style="text-align: center;" readonly 
                 groupid="GarageCarServiceDetails" argumentid="LastServiceKm">
          <label for="LastServiceKm">Last Service KM</label>
        </div>
      </div>
      <div class="col-12 col-md-none col-sm-none col-lg-2"></div>
    </div>

    <!-- Service Type and Adviser Name -->
    <div class="row mb-3">
      <div class="col-12 col-md-none col-sm-none col-lg-2"></div>
      <div class="col-12 col-md-6 col-lg-4 mb-3 mb-md-0">
       <%-- <label><small><b>Service Type:</b></small></label>--%>
        <div class="form-check form-check-inline">
          <input class="form-check-input ServiceCHK CommonDisableClass" type="radio" id="Service" 
                 checked="checked" value="Service" name="ServiceType" groupid="GarageCarServiceDetails" argumentid="ServiceType">
          <label class="form-check-label fw-bold" for="Service">Service</label>
        </div>
        <div class="form-check form-check-inline">
          <input class="form-check-input ProblemCHK CommonDisableClass" type="radio" id="Problems" 
                 value="Problem" name="ServiceType" groupid="GarageCarServiceDetails" argumentid="ServiceType">
          <label class="form-check-label fw-bold" for="Problem">Problem</label>
        </div>
        <div class="form-check form-check-inline">
          <input class="form-check-input BothCHK CommonDisableClass" type="radio" id="Both" 
                 value="Both" name="ServiceType" groupid="GarageCarServiceDetails" argumentid="ServiceType">
          <label class="form-check-label fw-bold" for="Both">Both</label>
        </div>
      </div>
      <div class="col-12 col-md-6 col-lg-4">
        <div class="form-floating">
          <select class="form-select dropdownlist CommonDisableClass fw-bold" id="AdviserName" 
                  loadon="FirstVisible" groupid="GarageCarServiceDetails" argumentid="AdviserName" 
                  storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'44'}]}">
            <option value="" selected="selected">Select Adviser Name</option>
          </select>
          <label for="AdviserName">Adviser Name</label>
        </div>
      </div>
      <div class="col-12 col-md-none col-sm-none col-lg-2"></div>
    </div>

    <!-- Warranty and Mechanic Name -->
    <div class="row mb-3">
      <div class="col-12 col-md-none col-sm-none col-lg-2"></div>
      <div class="col-12 col-md-6 col-lg-4 mb-3 mb-md-0">
      <%--  <label><small><b>Warranty:</b></small></label>--%>
        <div class="form-check form-check-inline">
          <input class="form-check-input WarrentyYes CommonDisableClass" type="radio" id="WarrantyYes" 
                 checked="checked" value="Yes" name="Warranty" groupid="GarageCarServiceDetails" argumentid="Warranty">
          <label class="form-check-label fw-bold" for="WarrantyYes">In Warranty</label>
        </div>
        <div class="form-check form-check-inline">
          <input class="form-check-input WarrentyNo CommonDisableClass" type="radio" id="WarrantyNo" 
                 value="No" name="Warranty" groupid="GarageCarServiceDetails" argumentid="Warranty">
          <label class="form-check-label fw-bold" for="WarrantyNo">Out of Warranty </label>
        </div>
      </div>
      <div class="col-12 col-md-6 col-lg-4">
        <div class="form-floating">
          <select class="form-select dropdownlist CommonDisableClass fw-bold"  id="MechanicName" 
                  loadon="FirstVisible" groupid="GarageCarServiceDetails" argumentid="MechanicName" 
                  storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'43'}]}">
            <option value="" selected="selected">Select Mechanic Name</option>
          </select>
          <label for="MechanicName">Mechanic Name</label>
        </div>
      </div>
      <div class="col-12 col-md-none col-sm-none col-lg-2"></div>
    </div>

    <!-- Service Date and In KM -->
<%--    <div class="row mb-3">
      <div class="col-12 col-md-none col-sm-none col-lg-2"></div>
      <div class="col-12 col-md-6 col-lg-4 mb-3 mb-md-0">
        <div class="form-floating">
          <input type="date" class="form-control text date CommonDisableClass required fw-bold" id="CarRecivedDate" 
                 placeholder="Service Date*" maxlength="10" groupid="GarageCarServiceDetails" argumentid="CarRecivedDate">
          <label for="CarRecivedDate">Service Date*</label>
        </div>
      </div>
      <div class="col-12 col-md-6 col-lg-4">
        <div class="form-floating">
          <input type="text" class="form-control text number1 required CommonDisableClass CommonCommaVal fw-bold" id="CurrentServiceKm" 
                 placeholder="In KM*" style="text-align: center;" maxlength="100" groupid="GarageCarServiceDetails" argumentid="CurrentServiceKm">
          <label for="CurrentServiceKm">In KM*</label>
        </div>
      </div>
      <div class="col-12 col-md-none col-sm-none col-lg-2"></div>
    </div>--%>

    <div class="container mt-3">
  <div class="row mb-3 justify-content-center">
    
    <!-- Service Date -->
    <div class="col-12 col-md-6 col-lg-2">
      <div class="form-floating">
        <input type="date" class="form-control text date CommonDisableClass required fw-bold text-center" 
               id="CarRecivedDate" placeholder="Service Date*" maxlength="10" 
               groupid="GarageCarServiceDetails" argumentid="CarRecivedDate">
        <label for="CarRecivedDate">Service Date*</label>
      </div>
    </div>

    <!-- Service Start Day -->
    <div class="col-12 col-md-6 col-lg-2">
      <div class="form-floating">
        <input type="text" class="form-control text AlwaysDisableJC text-center fw-bold" 
               id="ServiceStartDay" placeholder="Start Day" maxlength="10" readonly
               groupid="GarageCarServiceDetails" argumentid="ServiceStartDay">
        <label for="ServiceStartDay">Start Day</label>
      </div>
    </div>

    <!-- Form Group for Service Start Time -->
    <div class="col-12 col-md-4 col-lg-2">
      <div class="form-group d-flex align-items-center">
        <div class="form-floating flex-grow-1">
          <input type="text" class="form-control text timePick CommonDisableClass text-center fw-bold" 
                 id="ServiceStartTime" placeholder="Start Time" maxlength="10" readonly 
                 groupid="GarageCarServiceDetails" argumentid="ServiceStartTime">
          <label for="ServiceStartTime">Time</label>
        </div>
        <i title="Set current date & time" class="fa-regular fa-clock ms-2 CommonDisableClass btnGetNewDateR"></i>
      </div>
    </div>

    <!-- In KM -->
    <div class="col-12 col-md-6 col-lg-4">
      <div class="form-floating">
        <input type="text" class="form-control text number1 required CommonDisableClass CommonCommaVal fw-bold text-center" 
               id="CurrentServiceKm" placeholder="In KM*" maxlength="100" 
               groupid="GarageCarServiceDetails" argumentid="CurrentServiceKm">
        <label for="CurrentServiceKm">In KM*</label>
      </div>
    </div>

  </div>
</div>

        <div class="container mt-3">
  <div class="row mb-3 justify-content-center">
    
    <!-- Service Date -->
    <div class="col-12 col-md-6 col-lg-2">
      <div class="form-floating">
          <input type="date" class="form-control text date AddRequired CommonDisableClass OnStartState fw-bold" id="CarDeliverdDate" 
                 placeholder="Delivered Date" maxlength="10" groupid="GarageCarServiceDetails" argumentid="CarDeliverdDate">
          <label for="CarDeliverdDate" class="AddAsterisk">Delivered Date</label>
      </div>
    </div>

    <!-- Service Start Day -->
    <div class="col-12 col-md-6 col-lg-2">
      <div class="form-floating">
        <input type="text" class="form-control text AlwaysDisableJC text-center fw-bold" 
               id="CarDeliverdStartDay" placeholder="Start Day" maxlength="10" readonly
               groupid="GarageCarServiceDetails" argumentid="CarDeliverdStartDay">
        <label for="CarDeliverdStartDay">Start Day</label>
      </div>
    </div>

    <!-- Form Group for Service Start Time -->
    <div class="col-12 col-md-4 col-lg-2">
      <div class="form-group d-flex align-items-center">
        <div class="form-floating flex-grow-1">
          <input type="text" class="form-control text timePick CommonDisableClass text-center fw-bold" 
                 id="CarDeliverdStartTime" placeholder="Start Time" maxlength="10" readonly 
                 groupid="GarageCarServiceDetails" argumentid="CarDeliverdStartTime">
          <label for="CarDeliverdStartTime">Time</label>
        </div>
        <i title="Set current date & time" class="fa-regular fa-clock ms-2 OnStartState CommonDisableClass btnGetNewDateD"></i>
      </div>
    </div>

            <!-- out KM -->
            <div class="col-12 col-md-6 col-lg-4">
                <div class="form-group d-flex align-items-center">
                    <div class="form-floating flex-grow-1">
                        <input type="text" class="form-control text number AddRequired CommonDisableClass OnStartState CommonCommaVal fw-bold" id="OutKm"
                            placeholder="Out KM" style="text-align: center;" maxlength="100" groupid="GarageCarServiceDetails" argumentid="OutKm">
                        <label for="OutKm" class="AddAsterisk">Out KM</label>
                    </div>
                            <i title="Set current date & time" class="fa-solid fa-file-arrow-down ms-2 CommonDisableClass OnStartState btnCurrentServiceKm"></i>

                </div>
            </div>
        </div>
        </div>

    <!-- Delivered Date and Out KM -->
<%--    <div class="row mb-3">
      <div class="col-12 col-md-none col-sm-none col-lg-2"></div>
      <div class="col-12 col-md-6 col-lg-4 mb-3 mb-md-0">
        <div class="form-floating">
          <input type="date" class="form-control text date AddRequired CommonDisableClass OnStartState fw-bold" id="CarDeliverdDate" 
                 placeholder="Delivered Date" maxlength="10" groupid="GarageCarServiceDetails" argumentid="CarDeliverdDate">
          <label for="CarDeliverdDate" class="AddAsterisk">Delivered Date</label>
        </div>
      </div>
      <div class="col-12 col-md-6 col-lg-4">
        <div class="form-floating">
          <input type="text" class="form-control text number AddRequired CommonDisableClass OnStartState CommonCommaVal fw-bold" id="OutKm" 
                 placeholder="Out KM" style="text-align: center;" maxlength="100" groupid="GarageCarServiceDetails" argumentid="OutKm">
          <label for="OutKm" class="AddAsterisk">Out KM</label>
        </div>
      </div>
      <div class="col-12 col-md-none col-sm-none col-lg-2"></div>
    </div>--%>


            <div class="container mt-3">
  <div class="row mb-3 justify-content-center">
    
    <!-- Service Date -->
    <div class="col-12 col-md-6 col-lg-2">
      <div class="form-floating">
          <input type="date" class="form-control text date CommonDisableClass OnStartState AddRequiredOnNXKM fw-bold" id="NextServiceDate" 
                 placeholder="Next Service Date" maxlength="10" groupid="GarageCarServiceDetails" argumentid="NextServiceDate">
          <label for="NextServiceDate" class="AddAsterisk">Next Service Date</label>
      </div>
    </div>

    <!-- Service Start Day -->
            <div class="col-12 col-md-6 col-lg-3">
                <div class="form-group d-flex align-items-center">

                    <div class="form-floating flex-grow-1">
                        <input type="text" class="form-control text AlwaysDisableJC text-center fw-bold"
                            id="NextServiceStartDay" placeholder="Start Day" maxlength="10" readonly
                            groupid="GarageCarServiceDetails" argumentid="NextServiceStartDay">
                        <label for="NextServiceStartDay">Start Day</label>
                    </div>
                    <i  class="fa-solid fa-3 ms-2 OnStartState CommonDisableClass btn3 btn btn-primary"></i>
                    <i  class="fa-solid fa-6 ms-2 OnStartState CommonDisableClass btn6 btn btn-primary"></i>
                    <i  class="fa-solid fa-12 ms-2 OnStartState CommonDisableClass btn12 btn btn-primary">12</i>

                    
                </div>
            </div>

    <!-- Form Group for Service Start Time -->
    <div class="col-12 col-md-4 col-lg-1">
 <%--     <div class="form-group d-flex align-items-center">
        <div class="form-floating flex-grow-1">
          <input type="text" class="form-control text timePick CommonDisableClass text-center fw-bold" 
                 id="CarDeliverdStartTime" placeholder="Start Time" maxlength="10" readonly 
                 groupid="GarageCarServiceDetails" argumentid="CarDeliverdStartTime">
          <label for="CarDeliverdStartTime">Time</label>
        </div>
        <i title="Set current date & time" class="fa-regular fa-clock ms-2 OnStartState CommonDisableClass btnGetNewDateD"></i>
      </div>--%>
    </div>

            <!-- out KM -->
            <div class="col-12 col-md-6 col-lg-4">
                <div class="form-group d-flex align-items-center">
                    <div class="form-floating flex-grow-1">
          <input type="text" class="form-control text number CommonDisableClass OnStartState AddRequiredOnNXKM CommonCommaVal fw-bold" id="NextServiceKm"
              placeholder="Next Service KM" style="text-align: center;" maxlength="100" groupid="GarageCarServiceDetails" argumentid="NextServiceKm">
                        <label for="NextServiceKm" class="AddAsterisk">Next Service KM</label>
                    </div>
                    <i title="Set current date & time" class="fa-solid fa-10 ms-2 btn btn-primary CommonDisableClass OnStartState btn5KD">5K</i>
                    <i title="Set current date & time" class="fa-solid fa-10 ms-2 btn btn-primary CommonDisableClass OnStartState btn10KD">10K</i>
                  

                </div>
            </div>
            </div>
            </div>

    <!-- Next Service Date and Next Service KM -->
<%--        <div class="container mt-3">
  <div class="row mb-3 justify-content-center">
     
      <div class="col-12 col-md-6 col-lg-2 mb-3 mb-md-0">
        <div class="form-floating">
          <input type="date" class="form-control text date CommonDisableClass OnStartState AddRequiredOnNXKM fw-bold" id="NextServiceDate" 
                 placeholder="Next Service Date" maxlength="10" groupid="GarageCarServiceDetails" argumentid="NextServiceDate">
          <label for="NextServiceDate" class="AddAsterisk">Next Service Date</label>
        </div>
      </div>
            <div class="col-12 col-md-6 col-lg-2">
                <div class="form-group d-flex align-items-center">

                    <div class="form-floating flex-grow-1">
                        <input type="text" class="form-control text AlwaysDisableJC text-center fw-bold"
                            id="NextServiceStartDay" placeholder="Start Day" maxlength="10" readonly
                            groupid="GarageCarServiceDetails" argumentid="NextServiceStartDay">
                        <label for="NextServiceStartDay">Start Day</label>
                    </div>
                    <i  class="fa-solid fa-3 ms-2 OnStartState CommonDisableClass btn3 btn btn-primary"></i>
                    <i  class="fa-solid fa-6 ms-2 OnStartState CommonDisableClass btn6 btn btn-primary"></i>
                    <i  class="fa-solid fa-12 ms-2 OnStartState CommonDisableClass btn12 btn btn-primary"></i>

                    
                </div>
            </div>


            <div class="col-12 col-md-6 col-lg-4">
        <div class="form-floating">
          <input type="text" class="form-control text number CommonDisableClass OnStartState AddRequiredOnNXKM CommonCommaVal fw-bold" id="NextServiceKm" 
                 placeholder="Next Service KM" style="text-align: center;" maxlength="100" groupid="GarageCarServiceDetails" argumentid="NextServiceKm">
          <label for="NextServiceKm" class="AddAsterisk">Next Service KM</label>
        </div>
      </div>
     
    </div>
            </div>--%>
    
    <!-- Problem -->
    <div class="row mb-3">
      <div class="col-12 col-md-none col-sm-none col-lg-2"></div>
      <div class="col-12 col-md-12 col-lg-8">
        <div class="form-floating">
          <textarea class="form-control textarea required Problem CommonDisableClass" id="Problem" 
                    placeholder="Problem*" style="height: 100px; resize: none;" groupid="GarageCarServiceDetails" argumentid="Problem"></textarea>
          <label for="Problem">Problem*</label>
        </div>
      </div>
      <div class="col-12 col-md-none col-sm-none col-lg-2"></div>
    </div>

    <!-- Action Taken -->
    <div class="row mb-3">
      <div class="col-12 col-md-none col-sm-none col-lg-2"></div>
      <div class="col-12 col-md-12 col-lg-8">
        <div class="form-floating">
          <textarea class="form-control textarea ActionTaken CommonDisableClass AddRequired OnStartState" id="ActionTaken" 
                    placeholder="Action Taken" style="height: 100px; resize: none;" groupid="GarageCarServiceDetails" argumentid="ActionTaken"></textarea>
          <label for="ActionTaken">Action Taken</label>
        </div>
      </div>
      <div class="col-12 col-md-none col-sm-none col-lg-2"></div>
    </div>

    <!-- Buttons -->
    <div class="row mt-4 justify-content-md-center mb-3">
      <div class="col-12 col-md-2 mb-3 mb-md-0 OnNewForm OnCreateInvoice grgbtnSave3">
        <button type="button" class="btn btn-primary w-100 DataAction ButtonStyle grgbtnSave3 common-button OnNewForm OnCreateInvoice" 
                conf="{ActorId:'DataHelper',ActionId:'DataAction',Params:{NewStateId:'OpenState'},Command:'UPD_iRental_CarServiceDetails',HideOnSuccess:false,Requery:true,GroupId:'GarageCarServiceDetails'}">
          Open
        </button>
      </div>
      <div class="col-12 col-md-2 mb-3 mb-md-0 grgbtnClosed OnNewForm OnCreateInvoice">
        <button type="button" class="btn btn-success w-100 DataAction ButtonStyle grgbtnClosed common-button OnNewForm OnCreateInvoice" 
                conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_CarServiceDetails',Params:{NewStateId:'ClosedState'},HideOnSuccess:true,Requery:false,GroupId:'GarageCarServiceDetails'}">
          Close
        </button>
      </div>
      <div class="col-12 col-md-2 grgbtnCanceled OnNewForm OnCreateInvoice">
        <button type="button" class="btn btn-danger w-100 DataAction ButtonStyle grgbtnCanceled common-button OnNewForm OnCreateInvoice" 
                conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_CarServiceDetails',Params:{NewStateId:'CanceledState'},HideOnSuccess:true,Requery:false,GroupId:'GarageCarServiceDetails'}">
          Cancel
        </button>
      </div>
    </div>


    <div class="row mt-2 justify-content-md-center mb-3">
      <div class="col-12 col-md-1 mb-3 mb-md-0 CarServiceButton_Edit OnNewForm OnCreateInvoice">
        <button type="button" class="btn btn-secondary w-100 ButtonStyle CarServiceButton_Edit OnNewForm OnCreateInvoice" roles="iRen_Contracts_Admin">
          Edit
        </button>
      </div>
      <div class="col-12 col-md-1 mb-3 mb-md-0 grgbtnSave common-button">
        <button type="button" class="btn btn-primary w-100 DataAction ButtonStyle grgbtnSave common-button" 
                conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_CarServiceDetails',HideOnSuccess:true,Requery:true,GroupId:'GarageCarServiceDetails'}">
          Open
        </button>
      </div>
      <div class="col-12 col-md-1 mb-3 mb-md-0 grgbtnSave2 common-button">
        <button type="button" class="btn btn-primary w-100 DataAction ButtonStyle grgbtnSave2 common-button" 
                conf="{ActorId:'DataHelper',ActionId:'DataAction',Params:{DBAction:'NoStateId'},Command:'UPD_iRental_CarServiceDetails',HideOnSuccess:false,Requery:true,GroupId:'GarageCarServiceDetails'}">
          Save
        </button>
      </div>
      <div class="col-12 col-md-1 mb-3  OnNewForm">
        <button type="button" class="btn btn-secondary w-100 ButtonStyle PrintJobCard OnNewForm">
          Print
        </button>
      </div>
      <div class="col-12 col-md-1 btnCancel">
        <button type="button" class="btn btn-secondary w-100 CloseForm ButtonStyle btnCancel">
          Close
        </button>
      </div>
    </div>

    <!-- Total Amount, Discount, Grand Total -->
    <div class="row mb-3 justify-content-md-center">
      <div class="col-12 col-md-2 col-lg-4 mb-3 mb-md-0">
        <div class="form-floating">
          <input type="text" class="form-control text" id="totalTotalPrice" placeholder="Total Amount" 
                 style="text-align: center;" readonly groupid="GarageCarServiceDetails" argumentid="totalTotalPrice">
          <label for="totalTotalPrice">Total Amount</label>
        </div>
      </div>
      <div class="col-12 col-md-2 col-lg-4 mb-3 mb-md-0">
        <div class="form-floating">
          <input type="text" class="form-control text" id="totalDiscount" placeholder="Discount" 
                 style="text-align: center;" readonly groupid="GarageCarServiceDetails" argumentid="totalDiscount">
          <label for="totalDiscount">Discount</label>
        </div>
      </div>
      <div class="col-12 col-md-2 col-lg-4">
        <div class="form-floating">
          <input type="text" class="form-control text" id="totalGrandTotalRes" placeholder="Grand Total" 
                 style="text-align: center;" readonly groupid="GarageCarServiceDetails" argumentid="totalGrandTotalRes">
          <label for="totalGrandTotalRes">Grand Total</label>
        </div>
      </div>
    </div>

    <!-- Items Table -->
    <div class="container mt-3">
  <div class="table-responsive">
    <table class="table table-bordered table-hover ItemsModifyListt">
      <thead class="table-dark">
        <tr>
          <th scope="col">Sr.</th>
          <th scope="col">Invoice No.</th>
          <th scope="col">Type</th>
          <th scope="col">ItemID</th>
          <th scope="col">Item Code</th>
          <th scope="col">Description</th>
          <th scope="col">From</th>
          <th scope="col">Qty</th>
          <th scope="col">Unit Price</th>
          <th scope="col">Total Price</th>
        </tr>
      </thead>
      <tbody>
        <tr class="ItemTRR">
          <!-- Add dynamic rows here -->
        </tr>
      </tbody>
      <tfoot>
        <tr class="NoRecordsTR">
          <td colspan="10" class="text-center">
            <div class="p-3 bg-light text-muted">No records available.</div>
          </td>
        </tr>
      </tfoot>
    </table>
  </div>
</div>

    <!-- Contract Created By and Date -->
    <div class="row mb-3">
      <div class="col-12 col-md-6 col-lg-6 mb-3 mb-md-0">
        <div class="form-floating">
          <input type="text" class="form-control text" id="CreatedBy" placeholder="Contract Created By" 
                 style="text-align: center;" readonly groupid="GarageCarServiceDetails" argumentid="CreatedBy">
          <label for="CreatedBy">Contract Created By</label>
        </div>
      </div>
      <div class="col-12 col-md-6 col-lg-6">
        <div class="form-floating">
          <input type="text" class="form-control text" id="DateCreated" placeholder="Contract Date & Time" 
                 style="text-align: center;" readonly groupid="GarageCarServiceDetails" argumentid="DateCreated">
          <label for="DateCreated">Contract Date & Time</label>
        </div>
      </div>
    </div>
  </div>

 



<!--<table cellspacing="0" cellpadding="0" border="0" style="width: 100%;" class="myTable">

    <tr tabid="GarageCarServiceDetails">
        <td style="padding-top: 1px;">
            <table cellspacing="1" cellpadding="0" width="100%" border="0" class="w-form-table">

                <tr>
                    <td colspan="4">
                        <table cellspacing="0.5" cellpadding="0" width="100%" border="0" class="w-form-table">
                            <tr class="StatusTR">
                                <td class="ftitle">
                                    <nobr>Service No.:</nobr>
                                </td>
                                <td class="ftitle">
                                    <span class="ftitle" style="color: red;" groupid="GarageCarServiceDetails" argumentid="RecCode">New contract no. will be generated on saving</span>
                                </td>
                                <td class="ftitle">
                                    <nobr>Service Status:</nobr>
                                </td>
                                <td class="ftitle" width="30%">
                                    <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="StateName"></span>

                                    <div style="display: none">
                                        <span groupid="GarageCarServiceDetails" argumentid="StateId"></span>

                                    </div>

                                </td>
                            </tr>
              




                            <%--/////////////////////// Select Car and Customer popup //////////////////////////////////--%>
                            <tr>
                                <td class="ftitle" style="width: 20%">
                                    <nobr>Car No.*:</nobr>
                                </td>
                                <td style="width: 30%;">
                                    <input type="hidden" name="RecId" groupid="GarageCarServiceDetails" argumentid="RecId" />
                                    <input type="hidden" name="FileGuid" groupid="GarageCarServiceDetails" argumentid="FileGuid" />



                                    <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="10" class="text LOVPopup required CommonDisableClass"
                                        groupid="GarageCarServiceDetails" lovpopupid="carPopupGarage" argumentid="CarNumber" />

                                    <%--<input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="30" class="LOVPopup text  CommonDisableClass  "
                                groupid="GarageCarServiceDetails" lovpopupid="carPopupGarage" argumentid="ChassisNo"   />--%>
                        
                                </td>
                                <td class="ftitle" style="width: 20%">
                                    <nobr>Customer Code*:</nobr></td>
                                <td class="ftitle" style="text-align: center; width: 30%">
                                    <span  groupid="GarageCarServiceDetails" argumentid="CustomerRecCode"></span>
                                </td>
                            </tr>

                            <%--///////////////////// End: Select Car and Customer popup ///////////////////////////////////////--%>





                            <tr>
                                <td class="ftitle">
                                    <nobr>Chassis No.:</nobr>
                                </td>
                                <td>
                                    <%--                        <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="CarNumber"></span>--%>
                                    <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="ChassisNo"></span>

                                </td>
                                <td class="ftitle">
                                    <nobr>Name:</nobr>
                                </td>
                                <td class="ftitle" style="text-align: center">
                                    <span  groupid="GarageCarServiceDetails" argumentid="CustomerName" style="font-size: 16px;"></span>
                                </td>
                            </tr>
                            <tr>
                                <td class="ftitle">
                                    <nobr>Brand:</nobr>
                                </td>
                                <td>
                                    <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="Brand"></span>
                                </td>
                                <td class="ftitle">

                                    <nobr>National ID No.:</nobr>

                                </td>
                                <td>
                                    <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="NationalIDNo"></span>
                                    <input type="hidden" argumentid="NationalityID" />
                                </td>
                            </tr>
                            <tr>
                                <td class="ftitle">
                                    <nobr>Model:</nobr>
                                </td>
                                <td>
                                    <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="Model"></span>
                                </td>
                                <td class="ftitle">
                                    <nobr>Mobile Telephone:</nobr>

                                </td>
                                <td>
                                    <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="MobileTelephone1"></span>
                                </td>
                            </tr>
                            <tr>
                                <td class="ftitle">
                                    <nobr>Year:</nobr>
                                </td>
                                <td>
                                    <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="CarYear"></span>
                                </td>
                                <td class="ftitle">
                                    <nobr>Temp Telephone:</nobr>
                                </td>
                                <td>
                                    <input type="text" style="text-align: center; width: 150px;" maxlength="100" class="text CommonDisableClass " groupid="GarageCarServiceDetails" argumentid="TempMobile" />
                                </td>
                            </tr>
                            <tr>
                                <td class="ftitle">
                                    <nobr>Color:</nobr>
                                </td>
                                <td>
                                    <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="Color"></span>
                                </td>
                                <td class="ftitle">Manual ID:</td>
                                <td class="ftitle">


                                    <input type="text" style="text-align: center; width: 150px;" maxlength="100" class="text CommonDisableClass " groupid="GarageCarServiceDetails" argumentid="ManualID" /></td>
                            </tr>


                            <tr>
                                <td class="ftitle">
                                    <nobr>Type:</nobr>
                                </td>
                                <td class="">
                                    <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="Type"></span>
                                </td>
                                <td class="ftitle">&nbsp;</td>
                                <td>&nbsp;</td>



                            </tr>

                        </table>
                    </td>
                </tr>




                   <tr class="hideOnNoExpirayDate">
       <td colspan="4">
           <table cellspacing="0.5" cellpadding="0" width="100%" border="0" class="w-form-table">

                <tr class="hideOnNoExpirayDate">


                    <td class="ftitle" style="width: 20%">
                        <nobr>Full Insurance:</nobr>
                    </td>

                    <td style="width: 30%">
                        <span class="ftitle CommonDisable " groupid="GarageCarServiceDetails" argumentid="FullInsuranceCompanyId" ></span>
                    </td>



                    <td class="ftitle" style="width: 20%">
                        <nobr class=""></nobr>
                    </td>
                    <td style="width: 30%">
                        <%--   <input type="text" class="ftitle CommonDisableClass " style="text-align: center; width: 150px;"  groupid="GarageCarServiceDetails" argumentid="ManualID" />--%>
                        
                    </td>
                </tr>

                <tr class="hideOnNoExpirayDate">
                    <td class="ftitle">
                        <nobr>PolicyNo.:</nobr>
                    </td>
                    <td>
                        <span class="ftitle CommonDisable " groupid="GarageCarServiceDetails" argumentid="FullInsurancePolicyNo"></span>
                    </td>
                    <td class="ftitle">
                        <nobr>Expiry Date:</nobr></td>
                    <td><span class="ftitle CommonDisable" groupid="GarageCarServiceDetails" argumentid="FullInsuranceExpiry"></span></td>
                </tr>

               </table>
           </td>
                       </tr>

               <%-- <tr>--%>
                   

                        <%--                        style="border-top: 2px solid orange;border-bottom: 2px solid orange;border-left: 2px solid orange;border-right: 2px solid orange;height: 1px;padding: 0px;"--%>

            <%--        <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
                    </td>
                </tr>--%>

                <tr>
    <td colspan="4">
        <table cellspacing="0.5" cellpadding="0" width="100%" border="0" class="w-form-table">
                <tr>
                    <td class="ftitle" style="width: 20%">
                        <nobr>Last Service Date:</nobr>
                    </td>
                    <td style="width: 30%">

                        <span class="ftitle dateLabel onDisable" groupid="GarageCarServiceDetails" argumentid="LastCarServiceDate"></span>
                    </td>
                    <td class="ftitle" style="width: 20%">Last Service KM:</td>
                    <td style="width: 30%">

                        <span class="ftitle CommonDisable CommonCommaText" groupid="GarageCarServiceDetails" argumentid="LastServiceKm"></span>
                    </td>

                </tr>
                
                <tr>
                    <td class="ftitle">Service Type</td>
                    <td class="ftitle">
                        <input type="radio" class="   ServiceCHK CommonDisableClass  " checked="checked" default="default" value="Service" name="ServiceType" groupid="GarageCarServiceDetails" argumentid="ServiceType" /><label>Service</label>
                        <input type="radio" class="  ProblemCHK CommonDisableClass  " value="Problem" name="ServiceType" groupid="GarageCarServiceDetails" argumentid="ServiceType" /><label>Problem</label>
                        <input type="radio" class="  BothCHK CommonDisableClass  " value="Both" name="ServiceType" groupid="GarageCarServiceDetails" argumentid="ServiceType" /><label>Both</label>
                    </td>
                    <td class="ftitle">Adviser Name:</td>
                    <td>
                        <select loadon="FirstVisible" class="dropdownlist  CommonDisableClass" style="width: 155px;"
                            groupid="GarageCarServiceDetails" argumentid="AdviserName" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'44'}]}">
                            <option value="" selected="selected">Select Adviser Name</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td class="ftitle">Warranty</td>
                    <td class="ftitle">
                        <input type="radio" class="   WarrentyYes CommonDisableClass  " checked="checked" default="default" value="Yes" name="Warranty" groupid="GarageCarServiceDetails" argumentid="Warranty" /><label>Yes</label>
                        <input type="radio" class="  WarrentyNo CommonDisableClass  " value="No" name="Warranty" groupid="GarageCarServiceDetails" argumentid="Warranty" /><label>No</label>
                    </td>
                    <td class="ftitle">Mechanic Name:</td>
                    <td>
                        <select loadon="FirstVisible" class="dropdownlist  CommonDisableClass" style="width: 155px;"
                            groupid="GarageCarServiceDetails" argumentid="MechanicName" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'43'}]}">
                            <option value="" selected="selected">Select Mechanic Name</option>
                        </select>
                    </td>
                </tr>

       

                <tr>
                    <td class="ftitle">
                        <nobr>Service Date*:</nobr>
                    </td>
                    <%-- <td>
                        <input type="text" groupid="GarageCarServiceDetails" maxlength="10"
                            style="width: 75px;" class="text  date CommonDisableClass required " requirederr="*" argumentid="CarRecivedDate" />
                        
                        <input type="text" style="text-align: center; width: 80px;" maxlength="10" class="text AlwaysDisableJC"
                            groupid="GarageCarServiceDetails" argumentid="ServiceStartDay" />

                        <input type="text" style="text-align: center; width: 55px;" maxlength="10" class="text timePick CommonDisableClass"
                            groupid="GarageCarServiceDetails" argumentid="ServiceStartTime" />


                    </td>--%>

                    <td>
                        <input type="text" groupid="GarageCarServiceDetails" maxlength="10"
                            style="width: 67px;" class="text  date CommonDisableClass required " argumentid="CarRecivedDate" />

                        <input type="text" style="text-align: center; width: 67px;" maxlength="10" class="text AlwaysDisableJC"
                            groupid="GarageCarServiceDetails" argumentid="ServiceStartDay" />

                        <input type="text" style="text-align: center; width: 40px; margin-right: 0.5px;" maxlength="10" class="text timePick CommonDisableClass"
                            groupid="GarageCarServiceDetails" argumentid="ServiceStartTime" />
                        <input type="button" title="Set current date & time" value="⏲" style="width: 20px; margin-right: 0px; cursor: pointer;" class="ButtonStyle  CommonDisableClass btnGetNewDateR" />

                    </td>

                    <td class="ftitle">In KM*:</td>
                    <td>

                        <input type="text" style="text-align: center; width: 150px;" maxlength="100" class="text number1 required  CommonDisableClass CommonCommaVal"
                            groupid="GarageCarServiceDetails" argumentid="CurrentServiceKm" />


                    </td>

                </tr>
                <tr>
                    <td class="ftitle AddAsterisk">Deliverd Date:
                    </td>

                    <td>

                        <input type="text" groupid="GarageCarServiceDetails" maxlength="10"
                            style="width: 67px;" class="text  date AddRequired CommonDisableClass OnStartState " argumentid="CarDeliverdDate" />

                        <input type="text" style="text-align: center; width: 67px;" maxlength="10" class="text AlwaysDisableJC"
                            groupid="GarageCarServiceDetails" argumentid="CarDeliverdStartDay" />

                        <input type="text" style="text-align: center; width: 40px; margin-right: 0.5px;" maxlength="10" class="text  OnStartState CarDeliverdStartTime"
                            groupid="GarageCarServiceDetails" argumentid="CarDeliverdStartTime" />
                        <input type="button" title="Set current date & time" value="⏲" style="width: 20px; margin-right: 0px; cursor: pointer;" class="ButtonStyle OnStartState CommonDisableClass btnGetNewDateD" />


                    </td>

                    <td class="ftitle AddAsterisk">Out KM:</td>
                    <td>



                        <input type="text" style="text-align: center; width: 150px;" maxlength="100" class="text number AddRequired  CommonDisableClass OnStartState CommonCommaVal"
                            groupid="GarageCarServiceDetails" argumentid="OutKm" />
                        <input type="button" style="width: 40px; cursor: pointer;" value="📋" class="ButtonStyle CommonDisableClass OnStartState btnCurrentServiceKm" />
                    </td>

                </tr>

                <tr>
                    <td class="ftitle AddAsterisk ">Next Service Date: </td>



                    <td>
                        <input type="text" groupid="GarageCarServiceDetails" maxlength="10"
                            style="width: 67px;" class="text  date  CommonDisableClass  OnStartState AddRequiredOnNXKM" argumentid="NextServiceDate" />

                        <input type="text" style="text-align: center; width: 67px;" maxlength="10" class="text AlwaysDisableJC"
                            groupid="GarageCarServiceDetails" argumentid="NextServiceStartDay" />
                        <input type="button" value="3" style="width: 20px; margin-right: 1px; cursor: pointer;" class="ButtonStyle OnStartState CommonDisableClass btn3" />
                        <input type="button" value="6" style="width: 20px; margin-right: 1px; cursor: pointer;" class="ButtonStyle OnStartState CommonDisableClass btn6" />
                        <input type="button" value="12" style="width: 20px; margin-right: 0px; cursor: pointer;" class="ButtonStyle OnStartState CommonDisableClass btn12" />
                        <%--<input type="text" style="text-align: center; width: 55px;" maxlength="10" class="text  OnStartState NextServiceStartTime"
                        groupid="GarageCarServiceDetails" argumentid="NextServiceStartTime" />--%>

                    </td>


                    <td class="ftitle AddAsterisk">Next Service KM:</td>
                    <td>
                        <input type="text" style="text-align: center; width: 150px;" maxlength="100" class="text number   CommonDisableClass OnStartState AddRequiredOnNXKM CommonCommaVal"
                            groupid="GarageCarServiceDetails" argumentid="NextServiceKm" />
                        <input type="button" style="width: 40px; margin-right: 0px; cursor: pointer;" value="5K" class="ButtonStyle CommonDisableClass OnStartState btn5KD" />
                        <input type="button" style="width: 40px; cursor: pointer;" value="10K" class="ButtonStyle CommonDisableClass OnStartState btn10KD" />

                    </td>

                </tr>

      

               <%-- <tr>
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
                    </td>
                </tr>--%>

                

                            <tr>
                                <td valign="center" class="ftitle" style="width: 20%">
                                    <nobr>Problem*:</nobr>
                                </td>
                                <td colspan="3" style="width: 30%">
                                    <textarea class="textarea required Problem CommonDisableClass" rows="4" style="width: 84.5%; height: 60px; box-sizing: border-box; resize: none;"
                                        argumentid="Problem" groupid="GarageCarServiceDetails"></textarea>

                                </td>

                            </tr>




                            <%--  <tr>
                    <td valign="center" class="ftitle">
                        <nobr>Car Condition:</nobr>
                    </td>
                    <td colspan="3">
                        <textarea class="textarea CarCondition CommonDisableClass" rows="4" wrap="1" style="width: 100%; height: 50px; box-sizing: border-box;  resize: none;"
                            argumentid="CarCondition" groupid="GarageCarServiceDetails"></textarea>
                    </td>

                </tr>--%>



                            <tr>
                                <td valign="center" class="AddAsterisk ftitle" style="width: 20%">Action Taken:</td>
                                <td colspan="3" style="width: 30%">
                                    <textarea class="textarea ActionTaken CommonDisableClass AddRequired OnStartState"
                                        rows="4"
                                        style="width: 84.5%; height: 60px; box-sizing: border-box; resize: none;"
                                        argumentid="ActionTaken"
                                        groupid="GarageCarServiceDetails"></textarea>


                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>



                <tr>
                    <td colspan="4" style="text-align: center;">



                        <div style="padding-top: 10px; padding-bottom: 10px">
                            <input type="button" style="width: 95px; color: blue;" ignorevalidate="DocType" value="  Open  " class="DataAction ButtonStyle  grgbtnSave3 common-button OnNewForm OnCreateInvoice" conf="{ActorId:'DataHelper',ActionId:'DataAction',Params:{NewStateId:'OpenState'},Command:'UPD_iRental_CarServiceDetails',HideOnSuccess:false, Requery:true,GroupId:'GarageCarServiceDetails'}" />
                            <input type="button" style="width: 95px; color: Green" ignorevalidate="DocType" value="  Close  " class="DataAction ButtonStyle  grgbtnClosed common-button OnNewForm OnCreateInvoice" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_CarServiceDetails',Params:{NewStateId:'ClosedState'},HideOnSuccess:true, Requery:false,GroupId:'GarageCarServiceDetails'}" />
                            <input type="button" style="width: 95px; color: Red" ignorevalidate="DocType CurrentServiceKm NextServiceKm CarDeliverdDate NextServiceDate ActionTaken" value="  Cancel  " class="DataAction ButtonStyle  grgbtnCanceled common-button OnNewForm OnCreateInvoice" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_CarServiceDetails',Params:{NewStateId:'CanceledState'},HideOnSuccess:true, Requery:false,GroupId:'GarageCarServiceDetails'}" />

                        </div>

                        <div style="padding-top: 10px; padding-bottom: 10px">

                            <input type="button" style="width: 50px" roles="iRen_Contracts_Admin" value="  Edit  " class="ButtonStyle CarServiceButton_Edit OnNewForm OnCreateInvoice" />
                            <input type="button" style="width: 50px; color: blue;" ignorevalidate="DocType" value="  Open  " class="DataAction ButtonStyle  grgbtnSave common-button" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_CarServiceDetails',HideOnSuccess:true, Requery:true,GroupId:'GarageCarServiceDetails'}" />
                            <input type="button" style="width: 50px" ignorevalidate="DocType" value="  Save  " class="DataAction ButtonStyle  grgbtnSave2 common-button" conf="{ActorId:'DataHelper',ActionId:'DataAction',Params:{DBAction:'NoStateId'},Command:'UPD_iRental_CarServiceDetails',HideOnSuccess:false, Requery:true,GroupId:'GarageCarServiceDetails'}" />
                            <input type="button" value="  Print " style="width: 50px" class="ButtonStyle PrintJobCard  OnNewForm" />

                            <input type="button" style="width: 50px" value="  Close  " class="CloseForm ButtonStyle btnCancel " />
                        </div>
                    </td>
                </tr>


                <%--<tr>
                    <td colspan="4">


                        <div class="file-upload-drop-area" style="padding: 5px;">
                            <select loadon="FirstVisible" valtype="value" class="dropdownlist required   " style="width: 155px; display: none"
                                groupid="GarageCarServiceDetails" argumentid="DocType" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'34'}]}">
                                <option value="" selected="selected">Select Doc Type</option>
                            </select>


                            <input type="file" class="file-input    " accept=".pdf,.jpg,.png,.txt,.docx,.garage" />
                            <span class="allowedFile" style="display: none;"></span>


                            <button class="upload-button ">Upload</button>

                        </div>


                        <div style="width: 100%; padding: 4px;">

                            <table cellspacing="0" cellpadding="0" border="0" style="width: 99%;" class="UploadFileListForJC">
                                <thead>
                                    <tr>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black; width: 40%;">File Name</th>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">File Size</th>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">File Type</th>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">Uploaded By</th>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">Upload Date</th>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4"></th>

                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                                <tfoot>
                                    <tr class="NoRecordsTR">

                                        <td class="NoRecords w-grid-norecords-msg" colspan="7">
                                            <div style="padding: 10px; background-color: transparent" class="PWCNoDataMessage">No records available.</div>
                                        </td>
                                    </tr>

                                </tfoot>

                            </table>
                        </div>



                    </td>
                </tr>--%>

                <tr>
                    <td colspan="4">
                        <table cellspacing="2" cellpadding="0" width="100%" border="1" class="w-form-table">

                            <tr style="background-color: navajowhite;">

                                <td class="ftitle" style="width: 100px">Total Amount:
                                </td>
                                <td>

                                    <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="totalTotalPrice" style="width: 100px"></span>
                                </td>
                                <td class="ftitle" style="width: 100px">Discount:
                                </td>


                                <td>
                                    <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="totalDiscount" style="width: 100px"></span>
                                </td>
                                <td class="ftitle" style="width: 100px">Grand Total:
                                </td>
                                <td>
                                    <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="totalGrandTotalRes" style="width: 100px"></span>
                                </td>



                            </tr>



                        </table>


                    </td>



                </tr>
                        <%-- Data Grid  --%>
               
                <tr>
                    <td colspan="4">



                        <div style="width: 100%;">

                            <table cellspacing="0" cellpadding="0" border="0" style="width: 100%;" class="ItemsModifyListt">
                                <thead>
                                    <tr>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;width: 4%;text-align: center;">Sr.</th>

                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;width: 12%">Invoice No.</th>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;width: 5%"">Type</th>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;width: 7%">ItemID</th>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black; width: 15%">Item Code</th>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;width: 31.5%"">Description</th>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;width: 5%"">From</th>
                                       <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;width: 4%"">Qty</th>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;width: 8%"">Unit Price</th>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;width: 9%"">Total Price</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <tr class="ItemTRR">
                                    </tr>

                                </tbody>
                                <tfoot>
                                    <tr class="NoRecordsTR">

                                        <td class="NoRecords w-grid-norecords-msg" colspan="10">
                                            <div style="padding: 10px; background-color: transparent" class="PWCNoDataMessage">No records available.</div>
                                        </td>
                                    </tr>

                                </tfoot>

                            </table>
                        </div>



                    </td>
                </tr>

         
               
                <%--<%-- End Data Grid --%>


                <tr>
                    <td colspan="4">
                        <table cellspacing="0.5" cellpadding="0" width="100%" border="0" class="w-form-table">

                            <tr>
                                <td class="ftitle" style="width:20%">
                                    <nobr>Contract Created By:</nobr>
                                </td>
                                <td style="text-align: center;width:30%">
                                    <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="CreatedBy"></span>
                                </td>

                                <td class="ftitle" style="width:20%">
                                    <nobr>Contract Date & Time:</nobr>
                                </td>
                                <td style="text-align: center;width:30%">
                                    <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="DateCreated"></span>
                                    <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="DateCreatedTime"></span>
                                </td>
                            </tr>

                        </table>
                    </td>
                </tr>



            </table>

        </td>
    </tr>


</table>
--->