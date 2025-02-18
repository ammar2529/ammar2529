<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EmployeeDatabase_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.Employee.EmployeeDatabase_ShUc" %>




<div class="container text-center">
    <div class="card">
        <div class="card-header collapsible-header" data-bs-toggle="collapse" data-bs-target="#collapsePanel" aria-expanded="true" aria-controls="collapsePanel">
            <span>Data Grid Example</span>
            <span id="collapse-icon">-</span>
        </div>
        <div id="collapsePanel" class="collapse show">
            <div class="card-body">
                 <div class="row">
                    <div class="col-sm-6 col-lg-2">
                        <label for="EmpId">Emp ID</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="EmpId" argumentid="EmpId" groupid="schEmployeeDatabase" style="height: 2px;">
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="CivilId">Civil ID</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="CivilId" argumentid="CivilId" groupid="schEmployeeDatabase" style="height: 2px;">
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="NameInEnglish">Name In English</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="NameInEnglish" argumentid="NameInEnglish" groupid="schEmployeeDatabase" style="height: 2px;">
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="JobTitle">Job Title</label>
                        <input type="text" class="form-control form-control-sm CommonEmpty" id="JobTitle" argumentid="JobTitle" groupid="schEmployeeDatabase" style="height: 2px;">
                    </div>
                    <div class="col-sm-6 col-lg-2">
                        <label for="EmpStatus">Emp Status</label>
                        <select loadon="FirstVisible" class="form-select form-select-sm dropdownlist" id="EmpStatus" groupid="schEmployeeDatabase" argumentid="EmpStatus" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'24'}]}" >
                            <option value="" selected="selected">Select Employee Status</option>
                        </select>
                    </div>

                    <div class="col-sm-6 col-lg-2 d-flex align-items-center mt-3"  padding-bottom: 0px;">
                        <button href="javascript:void(0);"  class="btn btn-primary btn-sm search ViewButton me-2" >Search</button>
                        <button href="javascript:void(0);"  class="btn btn-secondary btn-sm reset ClearButton" >Clear</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


