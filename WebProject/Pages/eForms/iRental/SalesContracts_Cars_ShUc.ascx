<div class="container my-4">
    <div class="card shadow-sm">
      <div class="card-body">
        <div class="col-12">
          <div class="form-header mb-3">
            <span class="h5 fw-bold ink-bar">Search</span>
          </div>
        </div>

        <div class="row g-3">
          <div class="col-sm-6 col-lg-2">
            <div class="form-floating">
              <input type="text" class="form-control form-control-sm CommonEmpty" id="Sales_ShUcCarNumber" argumentid="CarNumber" groupid="schCarForSalesDetails" placeholder="Enter Car Number">
              <label for="Sales_ShUcCarNumber">Car Number</label>
            </div>
          </div>
          <div class="col-sm-6 col-lg-2">
            <div class="form-floating">
              <input type="text" class="form-control form-control-sm CommonEmpty" id="ChassisNo" argumentid="ChassisNo" groupid="schCarForSalesDetails" placeholder="Enter Chassis No">
              <label for="ChassisNo">Chassis No.</label>
            </div>
          </div>

            <div class="col-sm-6 col-lg-2">

                <div class="custom-floating">
                    <select  class="form-select" aria-label="Custom floating label select" loadon="FirstVisible" groupid="schCarForSalesDetails" argumentid="BrandId" childcombo="ModelId" 
                        storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}" name="D12" loaded="true" id="CFSBrandId">
                        <option value="" selected=""></option>


                    </select>
                    <label for="CFSBrandId">Brand</label>
                </div>
            </div>

            
            <div class="col-sm-6 col-lg-2">

                <div class="custom-floating">
                    <select  class="form-select" aria-label="Custom floating label select" loadon="FirstVisible" groupid="schCarForSalesDetails" argumentid="ModelId" 
                       storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}" name="D3" loaded="true" id="ModelId">
                        <option value="" selected=""></option>


                    </select>
                    <label for="ModelId">Model</label>
                </div>
            </div>

                        <div class="col-sm-6 col-lg-2">

                <div class="custom-floating">
                    <select  class="form-select" aria-label="Custom floating label select" loadon="FirstVisible" groupid="schCarForSalesDetails" argumentid="CarYear" 
                      storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'4'}]}" name="D5" loaded="true" id="CarYear">
                        <option value="" selected=""></option>


                    </select>
                    <label for="CarYear">Year</label>
                </div>
            </div>

            <div class="col-sm-6 col-lg-2">

                <div class="custom-floating">
                    <select class="form-select" aria-label="Custom floating label select" loadon="FirstVisible" groupid="schCarForSalesDetails" argumentid="TypeId" 
                    storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'5'}]}" name="D6" loaded="true" id="TypeId">
                        <option value="" selected=""></option>


                    </select>
                    <label for="TypeId">Type</label>
                </div>
            </div>


        </div>

        <div class="row g-3 mt-2">

                        <div class="col-sm-6 col-lg-2">
                                        <input type="hidden" value="SearchChassisNo" groupid="schCarForSalesDetails" argumentid="SearchChassisN">

                <div class="custom-floating">
                    <select class="form-select" aria-label="Custom floating label select" loadon="FirstVisible" groupid="schCarForSalesDetails" argumentid="CarLocationId" 
                    storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'11'}]}" id="CarLocationId">
                        <option value="" selected=""></option>


                    </select>
                    <label for="CarLocationId">Location</label>
                </div>
            </div>


                                    <div class="col-sm-6 col-lg-2">
                                        <input type="hidden" value="SearchChassisNo" groupid="schCarForSalesDetails" argumentid="SearchChassisN">

                <div class="custom-floating">
                    <select class="form-select" aria-label="Custom floating label select" loadon="FirstVisible" groupid="schCarForSalesDetails" argumentid="CarStatusId" 
                     storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'42'}]}" name="D4" id="SC_ShUc_CarStatusId">
                        <option value="" selected=""></option>


                    </select>
                    <label for="SC_ShUc_CarStatusId">Status</label>
                </div>
            </div>


          <!-- Empty cells for spacing -->
          <div class="col-sm-6 col-lg-2"></div>
          <div class="col-sm-6 col-lg-2"></div>
          <div class="col-sm-6 col-lg-2"></div>
          <div class="col-sm-6 col-lg-2 d-flex align-items-end">
            <button class="btn btn-primary btn-sm me-2 search ViewButton">Search</button>
            <button class="btn btn-secondary btn-sm reset ClearButton">Clear</button>
          </div>
        </div>
      </div>
    </div>
  </div>