<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CarForSales_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.CarForSales_ShUc" %>

    <div class="card">


        <div class="card-body">
            <div class="col-sm-12 ">
                <div class="form-header">

                    <span class=" h5 fw-bold ink-bar">Search</span>
                    <i class="fa-regular fa-rectangle-xmark CloseForm"
                        tabid="CloseBtn" title="Close Form"
                        style="font-size: 20px; color: black; cursor: pointer; transition: color 0.3s ease; position: absolute; right: 10px;"
                        onmouseover="this.style.color='red';"
                        onmouseout="this.style.color='black';"></i>

                </div>
            </div>

            <div class="row">
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="CFS_ShUcCarNumber" argumentid="CarNumber" groupid="schCarForSalesDetails" placeholder="Enter Car Number">
                        <label for="CFS_ShUcCarNumber">Car Number</label>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-2">
                    <div class="form-floating mb-3">
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="ChassisNo" argumentid="ChassisNo" groupid="schCarForSalesDetails" placeholder="Enter Chassis No">
                        <label for="ChassisNo">Chassis No.</label>
                    </div>
                </div>

                <div class="col-sm-6 col-lg-2">


                    <div class="custom-floating">
                        <select loadon="FirstVisible" class="form-select  dropdownlist" id="CFSBrandId" aria-label="Custom floating label select" groupid="schCarForSalesDetails" argumentid="BrandId" childcombo="ModelId" 
                            storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}" name="D2">
                            <option value="" selected></option>

                        </select>
                        <label for="CFSBrandId">Brand</label>
                    </div>
                </div>


                <div class="col-sm-6 col-lg-2">
                    <div class="custom-floating">
                        <select loadon="FirstVisible" class="form-select" id="ModelId" aria-label="Custom floating label select" groupid="schCarForSalesDetails" argumentid="ModelId"
                             storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}" name="D3">
                            <option value="" selected></option>

                        </select>
                        <label for="ModelId">Model</label>
                    </div>
                </div>

   
               <div class="col-sm-6 col-lg-2">
                   <div class="custom-floating">
                       <select loadon="FirstVisible" class="form-select" id="CarYear" aria-label="Custom floating label select" groupid="schCarForSalesDetails" argumentid="CarYear"
                            storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'4'}]}" name="D5">
                           <option value="" selected></option>

                       </select>
                       <label for="CarYear">Year</label>
                   </div>
               </div>               
                
                <div class="col-sm-6 col-lg-2">
                   <div class="custom-floating">
                       <select loadon="FirstVisible" class="form-select" id="TypeId" aria-label="Custom floating label select" groupid="schCarForSalesDetails" argumentid="TypeId"
                           storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'5'}]}" name="D6">
                           <option value="" selected></option>

                       </select>
                       <label for="TypeId">Type</label>
                   </div>
               </div>
                </div>
                <div class="row ">
                <div class="col-sm-6 col-lg-2">
                   <div class="custom-floating">
                       <select loadon="FirstVisible" class="form-select" id="CFSCarLocationId" aria-label="Custom floating label select" groupid="schCarForSalesDetails" argumentid="CarLocationId"
                          storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'11'}]}" name="D7">
                           <option value="" selected></option>

                       </select>
                       <label for="CFSCarLocationId">Location</label>
                   </div>
               </div>

                <div class="col-sm-6 col-lg-2">
                   <div class="custom-floating">
                       <select loadon="FirstVisible" class="form-select" id="CSF_ShUcCarStatusId" aria-label="Custom floating label select" groupid="schCarForSalesDetails" argumentid="CarStatusId"
                          storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'42'}]}" name="D8">
                           <option value="" selected></option>

                       </select>
                       <label for="CSF_ShUcCarStatusId">Status</label>
                   </div>
               </div>



                <!-- Empty cells for spacing -->
                <div class="col-sm-6 col-lg-2"></div>
                <div class="col-sm-6 col-lg-2"></div>
                <div class="col-sm-6 col-lg-2"></div>
                <div class="col-sm-6 col-lg-2 d-flex align-items-center mt-3">
                    <button class="btn btn-primary btn-sm me-2 search ViewButton">Search</button>
                    <button class="btn btn-secondary btn-sm reset ClearButton">Clear</button>
<%--                    <button class="btn btn-primary btn-sm  ClosePopup CloseLOVPopup">Close</button>--%>

                </div>
            </div>
        </div>
    </div>




