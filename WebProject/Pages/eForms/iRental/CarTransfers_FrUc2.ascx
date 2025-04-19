<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CarTransfers_FrUc2.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.CarTransfers_FrUc2" %>

<div class="">
 
        <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-sm-12 ">
                    <div class="form-header">

                        <span class=" h5 fw-bold ink-bar">Car Transfers</span>
						                    <i class="fa-regular fa-rectangle-xmark CloseForm"
                        tabid="CloseBtn" title="Close Form"
                        style="font-size: 20px; color: black; cursor: pointer; 
                               transition: color 0.3s ease; position: absolute; 
                               right: 10px;"
                        onmouseover="this.style.color='red';" 
                        onmouseout="this.style.color='black';">
                    </i>
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

 <div class="row mt-2 ">
     <div class="col-12 col-sm-6 col-lg-3">
     </div>


     <div class="col-12 col-sm-12 col-lg-6">
         <div class="form-floating">
             <input type="date" class="form-control form-control-sm date required" id="floatingTransferDate" placeholder="Transfer Date*" groupid="CarsTransferForm" argumentid="TransferDate">
             <label for="floatingTransferDate">Transfer Date*</label>
         </div>
     </div>

     <div class="col-12 col-sm-6 col-lg-3">
     </div>

     <div style="display: none">
         <span groupid="CarsTransferForm" argumentid="RecId"></span>
     </div>
 </div>

 <div class="row mt-2 ">
     <div class="col-12 col-sm-6 col-lg-3">
     </div>
     <div class="col-12 col-sm-12 col-lg-6">
         <div class="form-floating">
             <input type="text" class="form-control form-control-sm text required AutoComplete" placeholder="Car Number*" id="floatingCarNumber" maxlength="10" groupid="CarsTransferForm" argumentid="CarNumber" conf="{ActorId:'DataHelper',ActionId:'AutoComplete',StoreId:'FX_SEL_Common_LOV_AutoComplete',QueryId:'iRental_Cars_Transfers',ACParams:{minChars:2,autoFill:false,width:350},ArgToSet:[{Index:4,Name:'CurrentMileage'},{Index:4,Name:'OutMileage'},{Index:5,Name:'OutLocationId'}]}">
             <label for="floatingCarNumber">Car Number*</label>
         </div>
     </div>
     <div class="col-12 col-sm-6 col-lg-3">
     </div>
 </div>

 <div class="row mt-2 ">
     <div class="col-12 col-sm-12 col-lg-3">
     </div>
     <div class="col-12 col-sm-12 col-lg-6">
         <div class="form-floating">
             <input type="text" class="form-control form-control-sm text required number" placeholder="Current Mileage*" id="floatingCurrentMileage" maxlength="10" groupid="CarsTransferForm" argumentid="CurrentMileage" disabled="disabled">
             <label for="floatingCurrentMileage">Current Mileage*</label>
         </div>
     </div>
     <div class="col-12 col-sm-6 col-lg-3">
     </div>
 </div>

 <div class="row mt-2 ">
     <div class="col-12 col-sm-12 col-lg-3">
     </div>
     <div class="col-12 col-sm-6 col-lg-3">
         <div class="form-floating">
             <select class="form-select form-select-sm dropdownlist required" placeholder="" id="OutLocationId" loadon="FirstVisible" groupid="CarsTransferForm" argumentid="OutLocationId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill', TextCol:'Name', ValCol:'ChildId', Params:[{Name:'ParentTypeId',Value:'11'}]}">
                 <option value="" selected="selected">Select Location</option>
             </select>
             <label for="OutLocationId">Out Location*</label>
         </div>
     </div>
     <div class="col-12 col-sm-6 col-lg-3">
         <div class="form-floating">
             <select class="form-select form-select-sm dropdownlist required" placeholder="" id="InLocationId" loadon="FirstVisible" groupid="CarsTransferForm" argumentid="InLocationId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill', TextCol:'Name', ValCol:'ChildId', Params:[{Name:'ParentTypeId',Value:'11'}]}">
                 <option value="" selected="selected">Select Location</option>
             </select>
             <label for="InLocationId">In Location*</label>
         </div>
     </div>
     <div class="col-12 col-sm-12 col-lg-3">
     </div>
 </div>

 <div class="row mt-2 ">
     <div class="col-12 col-sm-12 col-lg-3">
     </div>
     <div class="col-12 col-sm-6 col-lg-3">
         <div class="form-floating">
             <input type="text" class="form-control form-control-sm text required number" placeholder="Out Mileage*" id="floatingOutMileage" maxlength="10" groupid="CarsTransferForm" argumentid="OutMileage">
             <label for="floatingOutMileage">Out Mileage*</label>
         </div>
     </div>
     <div class="col-12 col-sm-6 col-lg-3">
         <div class="form-floating">
             <input type="text" class="form-control form-control-sm text number" placeholder="In Mileage" id="floatingInMileage" maxlength="10" groupid="CarsTransferForm" argumentid="InMileage">
             <label for="floatingInMileage">In Mileage</label>
         </div>
     </div>
     <div class="col-12 col-sm-12 col-lg-3">
     </div>
 </div>

 <div class="row mt-2 ">
     <div class="col-12 col-sm-12 col-lg-3">
     </div>
     <div class="col-12 col-sm-6 col-lg-3">
         <div class="form-floating">
             <input type="text" class="form-control form-control-sm text required number" placeholder="Out Time" id="TimeOut" groupid="CarsTransferForm" argumentid="TimeOut">
             <label for="TimeOut">Out Time</label>
         </div>
     </div>
     <div class="col-12 col-sm-6 col-lg-3">
         <div class="form-floating">
             <input type="text" class="form-control form-control-sm text number" placeholder="In Time" id="TimeIn" maxlength="10" groupid="CarsTransferForm" argumentid="TimeIn">
             <label for="TimeIn">In Time</label>
         </div>
     </div>
     <div class="col-12 col-sm-12 col-lg-3">
     </div>
 </div>



 <div class="row mt-2 justify-content-md-center mb-2">
     <div class="col-12 col-sm-12 col-lg-2">
         <button type="button" class="btn btn-primary w-100 DataAction  " conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Cars_Transfers',HideOnSuccess:true}">Save</button>
     </div>
     <div class="col-12 col-sm-12 col-lg-2">
         <button type="button" class="btn btn-secondary w-100 CloseForm">Cancel</button>
     </div>
 </div>


                </div>
            </div>
        </div>
    </div>

       
</div>
