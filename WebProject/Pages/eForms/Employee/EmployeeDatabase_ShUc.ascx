<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EmployeeDatabase_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.Employee.EmployeeDatabase_ShUc" %>




<div class="">
    <div class="card">
        <div id="collapsePanel" class="collapse show">
            <div class="card-body">
                <div class="row">
                    <div class="col-sm-12 ">
                        <div class="form-header">

                            <span class="h4 fw-bold ink-bar">Search</span>
                        </div>
                    </div>
            </div>
                <div class="row">
                    <div class="col-sm-6 col-lg-2">
                        <div class="form-floating">
                            <input type="text" class="form-control form-control-sm CommonEmpty" id="EmpId" argumentid="EmpId" groupid="schEmployeeDatabase" placeholder="Enter Emp ID">
                            <label for="EmpId">Emp ID</label>
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <div class="form-floating">
                            <input type="text" class="form-control form-control-sm CommonEmpty" id="CivilId" argumentid="CivilId" groupid="schEmployeeDatabase" placeholder="Enter Civil ID">
                            <label for="CivilId">Civil ID</label>
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <div class="form-floating">
                            <input type="text" class="form-control form-control-sm CommonEmpty" id="NameInEnglish" argumentid="NameInEnglish" groupid="schEmployeeDatabase" placeholder="Enter Name">
                            <label for="NameInEnglish">Name In English</label>
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <div class="form-floating">
                            <input type="text" class="form-control form-control-sm CommonEmpty" id="JobTitle" argumentid="JobTitle" groupid="schEmployeeDatabase" placeholder="Enter Job Title">
                            <label for="JobTitle">Job Title</label>
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <div class="form-floating">
                            <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="EmpStatus" groupid="schEmployeeDatabase" argumentid="EmpStatus" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'24'}]}">
                                <option value="" selected="selected">Select Employee Status</option>
                            </select>
                            <label for="EmpStatus">Emp Status</label>
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-2 d-flex align-items-center mt-3">
                        <button href="javascript:void(0);" class="btn btn-primary btn-sm search ViewButton me-2">Search</button>
                        <button href="javascript:void(0);" class="btn btn-secondary btn-sm reset ClearButton">Clear</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


