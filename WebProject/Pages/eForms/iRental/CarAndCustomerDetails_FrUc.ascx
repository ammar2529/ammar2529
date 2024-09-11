<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CarAndCustomerDetails_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.CarAndCustomerDetails_FrUc" %>

<style type="text/css">
    .auto-style1 {
        overflow: hidden;
        width: 116px;
    }
</style>

<script src="../../../Scripts/eForms/iRental/frmCarAndServiceDetails.js"></script>



<table cellspacing="0" cellpadding="0" border="0" style="width: 100%;" class="myTable">

    <tr tabid="CarAndCustomersDetails">
        <td style="padding-top: 1px;">
            <table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">
                <tr id="trNote">
                    <td colspan="4" style="padding-top: 10px; padding-bottom: 10px">Use the form below to update the details, fields marked with an asterisk (*) are mandatory </td>
                </tr>

                <tr class="StatusTR">
                    <td class="ftitle" width="18%">
                        <nobr>Contract No.:</nobr>
                    </td>
                    <td class="ftitle" width="32%">
                        <span class="ftitle" style="color: red;" groupid="CarAndCustomersDetails" argumentid="RecCode">New contract no. will be generated on saving</span>
                    </td>
                    <td class="ftitle" width="20%">
                        <%--<nobr> Status:</nobr>--%>
                    </td>
                    <td class="ftitle" width="30%">
                       <%-- <span class="ftitle" groupid="CarAndCustomersDetails" argumentid="StateName"></span>--%>

                        <div style="display: none">
                            <span groupid="CarAndCustomersDetails" argumentid="StateId"></span>

                        </div>

                    </td>
                </tr>

                          <tr>

                    <td class="ftitle" width="18%">
                        <nobr>Car For*:</nobr></td>
                    <td class="ftitle RadioButtons" width="32%" >

                        <input type="radio" class="CommonDisableClass ElemDisabled RadioButtons Sales " default="default" value="Sales" name="CarFor" groupid="CarAndCustomersDetails" argumentid="CarFor" /><label>Sales</label>
                        <input type="radio" class="CommonDisableClass ElemDisabled RadioButtons Rental" value="Rental" name="CarFor" groupid="CarAndCustomersDetails" argumentid="CarFor"  /><label>Rental</label>
                        <input type="radio" class="CommonDisableClass ElemDisabled RadioButtons Lease " value="Lease" name="CarFor" groupid="CarAndCustomersDetails" argumentid="CarFor"  /><label>Lease</label>
<%--                        <input type="radio" class="CommonDisableClass ElemDisabled RadioButtons Other " value="Other" name="CarFor" groupid="CarAndCustomersDetails" argumentid="CarFor"  /><label>Other</label>--%>


    <%--                    
     <input type="radio" class="CommonDisableClass ElemDisabled Sales" value="Sales" name="CarFor" groupid="CarAndCustomersDetails" argumentid="CarFor" onclick="AsyncWidgets.WidgetScripts.frmCarAndServiceDetails.toggleDropdownCarSearchDetails()" /><label>Sales</label>
    <input type="radio" class="CommonDisableClass ElemDisabled Rental" value="Rental" name="CarFor" groupid="CarAndCustomersDetails" argumentid="CarFor" onclick="AsyncWidgets.WidgetScripts.frmCarAndServiceDetails.toggleDropdownCarSearchDetails()" /><label>Rental</label>
    <input type="radio" class="CommonDisableClass ElemDisabled Lease" value="Lease" name="CarFor" groupid="CarAndCustomersDetails" argumentid="CarFor" onclick="AsyncWidgets.WidgetScripts.frmCarAndServiceDetails.toggleDropdownCarSearchDetails()" /><label>Lease</label>
    <input type="radio" class="CommonDisableClass ElemDisabled Other" value="Other" name="CarFor" groupid="CarAndCustomersDetails" argumentid="CarFor" onclick="AsyncWidgets.WidgetScripts.frmCarAndServiceDetails.toggleDropdownCarSearchDetails()" /><label>Other</label>--%>

                    </td>
                              <td></td>
                              <td></td>
                              </tr>

                <%--/////////////////////// Select Car and Customer popup //////////////////////////////////--%>
                <tr>
                    <td class="ftitle" style="width: 170px">
                        <nobr>Car No.:</nobr>
                    </td>
                    <td >
                        <input type="hidden" name="RecId" groupid="CarAndCustomersDetails" argumentid="RecId" />
                         <input type="hidden" name="RecId" groupid="CarAndCustomersDetails" argumentid="CsRecId" />

                        <input type="hidden" name="CarAndCustomersDetailsRecId" groupid="CarAndCustomersDetails" argumentid="CarAndCustomersDetailsRecId" />

<%--    <div class="carPopupCutomerAndCarDetails hidden"></div>--%>
                   
                      
                            <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="10" class="text LOVPopup required  CommonDisableCarNumber "
                                groupid="CarAndCustomersDetails" lovpopupid="carPopupCutomerAndCarDetailsForSales" argumentid="CarNumber" />
            
                            <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red; display:none;" maxlength="10" class="text LOVPopup required CommonDisableCarNumber"
                                groupid="CarAndCustomersDetails" lovpopupid="carPopupCutomerAndCarDetailsForRental" argumentid="CarNumber" />
                     
                            <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red; display:none;" maxlength="10" class="text LOVPopup required CommonDisableCarNumber"
                                groupid="CarAndCustomersDetails" lovpopupid="carPopupCutomerAndCarDetailsForLease" argumentid="CarNumber" />
                 
                          <%--  <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red; display:none;" maxlength="10" class="text LOVPopup  required CommonDisableCarNumber"
                                groupid="CarAndCustomersDetails" lovpopupid="carPopupCutomerAndCarDetailsForOther" argumentid="CarNumber" />--%>

                          
         
                    </td>
                    <td class="ftitle" style="width: 140px">
                        <nobr>Customer Code*:</nobr></td>
                     <td style="text-align: center">
                         <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="10" class="LOVPopup required text   CommonDisableCarNumber"
                            groupid="CarAndCustomersDetails" lovpopupid="customerPopup" argumentid="CustomerRecCode" requirederr=' *Required'  />
                        
<%--                         <span class="ftitle" style="font-size: 12px;" groupid="CarAndCustomersDetails" argumentid="CustomerRecCode"></span>--%>
                    </td>
                </tr>

                <%--///////////////////// End: Select Car and Customer popup ///////////////////////////////////////--%>





                <tr>
                    <td class="ftitle">
                        <nobr>Chassis No.:</nobr>
                    </td>
                    <td >
<%--                        <span class="ftitle" groupid="CarAndCustomersDetails" argumentid="CarNumber"></span>--%>
                     <span class="ftitle CommonDisable ChassisNo" groupid="CarAndCustomersDetails" argumentid="ChassisNo"></span>
                      <%--  <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red; display:none;" maxlength="10" class="text carCutomerAndCarDetailsForOther  CommonDisableCarNumber"
                                groupid="CarAndCustomersDetails"  argumentid="OtherChassisNo" />--%>

                    </td>
                    <td class="ftitle">
                        <nobr>Name:</nobr>
                    </td>
                    <td style="text-align: center">
                        <span class="ftitle CommonDisable" style="font-size: 16px;" groupid="CarAndCustomersDetails" argumentid="CustomerName"></span>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Brand:</nobr>
                    </td>
                    <td >
                        <span class="ftitle CommonDisable CommonSp" groupid="CarAndCustomersDetails" argumentid="Brand"></span>
                        <%--<select loadon="FirstVisible" class="dropdownlist CommonCarDropdown required" style="width: 155px;"
                groupid="CarAndCustomersDetails" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}">
                <option value="" selected="selected">Select Brand</option>
            </select>--%>
                    </td>
                    <td class="ftitle">
                        <nobr>Nationality:</nobr>
                    </td>
                    <td>
                        <span class="ftitle CommonDisable " groupid="CarAndCustomersDetails" argumentid="Nationality"></span>
                        <input type="hidden"  groupid="CarAndCustomersDetails" argumentid="NationalityID"/>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Model:</nobr>
                    </td>
                    <td >
                        <span class="ftitle CommonDisable CommonSp" groupid="CarAndCustomersDetails" argumentid="Model"></span>
                        <%--<select class="dropdownlist CommonCarDropdown required" style="width: 155px;" 
                  groupid="CarAndCustomersDetails" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}">
                 <option value="" selected="selected">Select Model</option>
              </select>--%>
                    </td>
                   <td class="ftitle">
                        <nobr>National ID No.:</nobr>
                    </td>
                    <td>
                        <div style="float: left; width: 135px" class="ftitle CommonDisable NationalIDNo" groupid="CarAndCustomersDetails" argumentid="NationalIDNo"></div>
                        <span class="ftitle CommonDisable" groupid="CarAndCustomersDetails" argumentid="NationalIDExpiryDate"></span>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Year:</nobr>
                    </td>
                    <td >
                        <span class="ftitle CommonDisable CommonSp" groupid="CarAndCustomersDetails" argumentid="CarYear"></span>
                        <%--<select loadon="FirstVisible" class="dropdownlist required CommonCarDropdown" style="width: 155px;"
                groupid="CarAndCustomersDetails" argumentid="YearId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'4'}]}">
                <option value="" selected="selected">Select Year</option>
            </select>--%>
                    </td>
                    <td class="ftitle">
                        <nobr>Gender:</nobr>
                    </td>
                    <td>
                        <span class="ftitle CommonDisable " groupid="CarAndCustomersDetails" argumentid="Gender"></span>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Color:</nobr>
                    </td>
                    <td >
                        <span class="ftitle CommonDisable CommonSp" groupid="CarAndCustomersDetails" argumentid="Color"></span>
                        <%--<select loadon="FirstVisible" class="dropdownlist CommonCarDropdown required" style="width: 155px;"
                groupid="CarAndCustomersDetails" argumentid="ColorId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'6'}]}">
                <option value="" selected="selected">Select Color</option>
            </select>--%>
                    </td>
                     <td class="ftitle">
                        <nobr>Mobile Telephone:</nobr>
                    </td>
                    <td class="ftitle">
                        <span class="ftitle CommonDisable " groupid="CarAndCustomersDetails" argumentid="MobileTelephone1"></span>
                       
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Type:</nobr>
                    </td>
                    <td class="" >
                        <span class="ftitle CommonDisable CommonSp" groupid="CarAndCustomersDetails" argumentid="Type"></span>
                          <%--<select loadon="FirstVisible" class="dropdownlist CommonCarDropdown required" style="width: 155px;"
                groupid="CarAndCustomersDetails" argumentid="TypeId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'5'}]}">
                <option value="" selected="selected">Select Type</option>
            </select>--%>
                    </td>
                      <td class="ftitle">
                               
                            </td>
                            <td>
                                
                                 
                                  
                                </td>

                 
                  
                </tr>

                <tr class="hideTr">
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
                                                    

                    </td>
                </tr>


                <tr class="hideTr">
                    
                     <td class="ftitle">
                        <nobr>Full Insurance::</nobr>
                    </td>
                    <td>
                         <span class="ftitle CommonDisable " groupid="CarAndCustomersDetails" argumentid="FullInsuranceCompanyId"></span>
                    </td>
                    <td>
                        
                          
                    </td>
                    <td>
                 
                    </td></tr>
                    
                
         
                      <tr class="hideTr">
                     <td>
                        
                          <nobr class="ftitle">Policy No.</nobr> 
                    </td>
                   
                     <td>
                      <span class="ftitle CommonDisable " groupid="CarAndCustomersDetails" argumentid="FullInsurancePolicyNo"></span>
                    </td>

                    <td>
                        
                          
                    </td>
                    <td>
                     
                    </td>
                </tr>

                <tr class="hideTr">
                         <td>  <nobr class="ftitle ">Expiry Date (dd/mm/yyyy)</nobr> 
                        </td>
                       <td>
                         <span class="ftitle CommonDisable" groupid="CarAndCustomersDetails" argumentid="FullInsuranceExpiry"></span>
                    </td>
                    <td></td>
                    <td></td>

                </tr>

              <tr>
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
                                                    

                    </td>
                </tr>

                
                        <%-- Data Grid  --%>
                <tr>
                    <td colspan="4">

                      

                        <div style="width: 100%;" >
                       
                            <table cellspacing="0" cellpadding="0" border="0" style="width: 100%;" class="CustomerModifyListt">
                                <thead>
                                    <tr>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">Code</th>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black; width:30%">Customer Name</th>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">Nationality</th>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">National ID No</th>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">Mobile</th>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">Created Date</th>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">Created By</th>
                                    </tr>
                                </thead>
                                <tbody>
                                   
                                    <tr class="ItemTRR">

                                    </tr>
                                   
                                </tbody>
                                <tfoot>
                                    <tr class="NoRecordsTR" >

                                        <td class="NoRecords w-grid-norecords-msg" colspan="7">
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
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
                                                    

                    </td>
                </tr>

                <tr>
                    <td colspan="4" style="text-align: center;">
                       
                       
                    
                        <div style="padding-top: 10px; padding-bottom: 10px">
                             <%--<input type="button" style="width: 50px" roles="iRen_Contracts_Admin" value="  Edit  " class="ButtonStyle SalesButton_Edit" />--%>
                            <input type="button" style="width: 50px" value="  Save  " class="DataAction ButtonStyle  btnSave common-button" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_GRG_CarAndCustomerDetails',HideOnSuccess:true, Requery:true,GroupId:'CarAndCustomersDetails'}" />
                             <input type="button" style="width: 50px" value="  Save  " class="DataAction ButtonStyle  btnSave2 common-button" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_GRG_CarAndCustomerDetails',HideOnSuccess:false, Requery:false,GroupId:'CarAndCustomersDetails'}" />

                            <input type="button" style="width: 50px" value="  Close  " class="CloseForm ButtonStyle btnCancel common-button" />
                        </div>
                    </td>
                </tr>

            </table>
        </td>
    </tr>



</table>
