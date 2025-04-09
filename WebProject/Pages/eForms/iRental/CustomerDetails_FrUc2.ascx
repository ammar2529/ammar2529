<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomerDetails_FrUc2.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.CustomerDetails_FrUc2" %>
<div class="">
    <form >
        <div class="row my-3 justify-content-md-center">
            <div class="alert alert-info mt-3" role="alert">
                Use the form below to update the details, fields marked with an asterisk (*) are mandatory
            </div>
        </div>
        <div class="row ">
            <div class="col-12 col-sm-6 col-lg-3 ">
            </div>
            <div class="col-12 col-sm-6 col-lg-3 text-start">
                <label for="floatingKM">
                    <small><b >Customer Code:</b></small>
                </label>
            </div>
            <div class="col-12 col-sm-6 col-lg-3 text-start ">
                <div style="display: none">
                    <span groupid="CustomersForm" argumentid="RecId"></span>
                </div>
                <div>
                    <span groupid="CustomersForm" argumentid="RecCode" style="font-style: italic; font-weight: bold;">New customer code will be generated on saving</span>
                </div>
            </div>
            <div class="col-12 col-sm-6 col-lg-3 ">
            </div>
        </div>


        <div class="row my-3 ">
            <div class="col-12 col-sm-6 col-lg-3 ">
            </div>
            <div class="col-12 col-sm-6 col-lg-3 text-start">
                <label for="floatingKM">
                    <small><b >Customer Type:</b></small>
                </label>
            </div>
            <div class="col-12 col-sm-6 col-lg-6 text-start">
                <div class="form-check form-check-inline ">
                    <input class="form-check-input" type="radio"  checked="checked" default="default" value="Local" name="CustomerType" groupid="CustomersForm" argumentid="CustomerType">
                    <label class="form-check-label" for="inlineRadio1">Local Residence</label>
                </div>
                <div class="form-check form-check-inline ">
                    <input class="form-check-input" type="radio"  value="International" name="CustomerType" groupid="CustomersForm" argumentid="CustomerType">
                    <label class="form-check-label" for="inlineRadio2">International - On Visit</label>
                </div>
            </div>
 

        </div>

        <div class="row my-3 ">
            <div class="col-12 col-sm-6 col-lg-3 ">

            </div>
            <div class="col-12 col-sm-3 col-lg-3 text-start ">
                <label for="floatingKM">
                    <small><b>Gender:</b></small>
                </label>
            </div>
            <div class="col-12 col-sm-3 col-lg-3 text-left text-start">
                <div class="form-check form-check-inline text-left">
                    <input class="form-check-input" type="radio"  checked="checked" default="default" value="Male" name="Gender" groupid="CustomersForm" argumentid="Gender">
                    <label class="form-check-label" for="inlineRadio3">Male</label>
                </div>
                <div class="form-check form-check-inline text-left">
                    <input class="form-check-input" type="radio"  value="Female" name="Gender" groupid="CustomersForm" argumentid="Gender">
                    <label class="form-check-label" for="inlineRadio4">Female</label>
                </div>

            </div>
            <div class="col-12 col-sm-6 col-lg-3 ">
            </div>
        </div>

 
        <div class="row justify-content-md-center mt-2">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <input type="text" class="form-control form-control-sm required" id="CustomerName" placeholder="Customer Name*" groupid="CustomersForm" argumentid="CustomerName">
                    <label for="CustomerName">Customer Name*</label>
                </div>
            </div>
        </div>
        <div class="row justify-content-md-center mt-2">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <select class="form-select form-select-sm required" id="Nationality" groupid="CustomersForm" argumentid="Nationality" loadon="FirstVisible" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'1'}]}">
                        <option value="" selected>Select Nationality</option>
                    </select>
                    <label for="Nationality">Nationality*</label>
                </div>
            </div>
        </div>

                <div class="row justify-content-md-center mt-2">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <input type="text" class="form-control form-control-sm" id="PassportNo" placeholder="Passport No." groupid="CustomersForm" argumentid="PassportNo">
                    <label for="PassportNo">Passport No.</label>
                </div>
            </div>
        </div>


        <div class="row justify-content-md-center mt-2">
            <div class="col-6 col-sm-3 col-lg-3">
                <div class="form-floating">
                    <input type="text" class="form-control form-control-sm" id="NationalIDNo" placeholder="National ID No." groupid="CustomersForm" argumentid="NationalIDNo">
                    <label for="NationalIDNo">National ID No.</label>
                </div>
            </div>

            <div class="col-6 col-sm-3 col-lg-3">
                <div class="form-floating">
                    <input type="date" class="form-control form-control-sm date" id="NationalIDExpiryDate" placeholder="National ID No." groupid="CustomersForm" argumentid="NationalIDExpiryDate">
                    <label for="NationalIDExpiryDate">National ID Expiry Date</label>
                </div>
            </div>
        </div>

        <div class="row justify-content-md-center mt-2">
            <div class="col-6 col-sm-3 col-lg-3">
                <div class="form-floating">
                    <input type="text" class="form-control form-control-sm" id="DrivingLicenseNo" placeholder="Driving License No." groupid="CustomersForm" argumentid="DrivingLicenseNo">
                    <label for="DrivingLicenseNo">Driving License No.</label>
                </div>
            </div>

            <div class="col-6 col-sm-3 col-lg-3">
                <div class="form-floating">
                    <input type="date" class="form-control form-control-sm date" id="DrivingLicenseExpiry" placeholder="Driving License Expiry" groupid="CustomersForm" argumentid="DrivingLicenseExpiry">
                    <label for="DrivingLicenseExpiry">Driving License Expiry</label>
                </div>
            </div>
        </div>

        <div class="row justify-content-md-center mt-2">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <input type="text" class="form-control form-control-sm" id="WorkTelephone" placeholder="Work Telephone" groupid="CustomersForm" argumentid="WorkTelephone">
                    <label for="WorkTelephone">Work Telephone</label>
                </div>
            </div>
        </div>

        <div class="row justify-content-md-center mt-2">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <input type="text" class="form-control form-control-sm" id="ResidenceTelephone" placeholder="Residence Telephone" groupid="CustomersForm" argumentid="ResidenceTelephone">
                    <label for="Residence Telephone">Residence Telephone</label>
                </div>
            </div>
        </div>

               <div class="row justify-content-md-center mt-2">
           <div class="col-6 col-sm-3 col-lg-3">
               <div class="form-floating">
                   <input type="text" class="form-control form-control-sm" id="MobileTelephone1" placeholder="Mobile Telephone1" groupid="CustomersForm" argumentid="MobileTelephone1">
                   <label for="MobileTelephone1">Mobile Telephone1</label>
               </div>
           </div>

           <div class="col-6 col-sm-3 col-lg-3">
               <div class="form-floating">
                   <input type="text" class="form-control form-control-sm" id="MobileTelephone2" placeholder="Mobile Telephone2" groupid="CustomersForm" argumentid="MobileTelephone2">
                   <label for="MobileTelephone2">Mobile Telephone2</label>
               </div>
           </div>
       </div>

        <div class="row justify-content-md-center mt-2">
            <div class="col-12 col-sm-6 col-lg-6">
                <span> Enter the phone number without country code, E.g. <b>24045607</b></span>
            </div>

        </div>

        <div class="row justify-content-md-center mt-2">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <input type="text" class="form-control form-control-sm" id="EmailAddress" placeholder="Email Address" groupid="CustomersForm" argumentid="EmailAddress">
                    <label for="EmailAddress">Email Address</label>
                </div>
            </div>
        </div>

            <div class="row my-3 justify-content-md-center">
        <div class="col-12 col-sm-6 col-lg-3 ">
            <label for="floatingKM">
                <small><b style="margin-left:35px">Customer Status:</b></small>
            </label>
        </div>
        <div class="col-12 col-sm-6 col-lg-5 text-left">
            <div class="form-check form-check-inline text-left">
                <input class="form-check-input" type="radio" id="inlineRadio5"  checked="checked" default="default" value="Active" name="CustomerStatus" groupid="CustomersForm" argumentid="CustomerStatus">
                <label class="form-check-label" for="inlineRadio5">Active</label>
            </div>
            <div class="form-check form-check-inline text-left">
                <input class="form-check-input" type="radio" id="inlineRadio6" value="Blacklisted" name="CustomerStatus" groupid="CustomersForm" argumentid="CustomerStatus">
                <label class="form-check-label" for="inlineRadio6">Blacklisted</label>
            </div>
        </div>
    </div>

        <div class="row justify-content-md-center mt-2">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <textarea class="form-control form-control-sm" id="Address" rows="6" placeholder="Customer Address" groupid="CustomersForm" argumentid="Address"></textarea>
                    <label for="Address">Customer Address</label>
                </div>
            </div>
            </div>
            <div class="row justify-content-md-center mt-2">
            <div class="col-12 col-sm-6 col-lg-6">
                <div class="form-floating">
                    <textarea class="form-control form-control-sm" id="CustomerNotes" rows="6" placeholder="Customer Notes" groupid="CustomersForm" argumentid="CustomerNotes"></textarea>
                    <label for="CustomerNotes">Customer Notes</label>
                </div>
            </div>
        </div>
        <div class="row mt-2 justify-content-md-center mb-2">
            <div class="col-12 col-sm-2 col-lg-2">
                <input type="hidden" class="btn btn-primary w-100 DataAction  btnMainForm" groupid="CustomersForm" argumentid="action" value="new" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Customers',HideOnSuccess:true,Requery:false}"/>
                <button type="button" class="btn btn-primary w-100 DataAction  btnPopupForm" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Customers',HideOnSuccess:true,Requery:true}">Save</button>
            </div>
            <div class="col-12 col-sm-2 col-lg-2">
                <button type="button" class="btn btn-secondary w-100 CloseForm">Cancel</button>
            </div>
        </div>
    </form>
</div>