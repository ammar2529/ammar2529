<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CarForSales_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.CarForSales_ShUc" %>

<table class="w-form-table" cellspacing="0" style="width: 100%">
    <tr>
        <%-- <td style=" text-align: left;" class="ftitle">
                    <span>Car For</span>
                </td>--%>
        <td style="text-align: left;" class="ftitle" >
            <span style="white-space: nowrap">Car No.</span></td>
        <td style="text-align: left;" >
            <span style="white-space: nowrap" class="ftitle" >Chassis No.</span></td>
        <td style="text-align: left;" >
            <span style="white-space: nowrap" class="ftitle" >Brand</span></td>
        <td style="text-align: left;" >

            <span style="white-space: nowrap" class="ftitle" >Model</span></td>
        <%--<td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">Car Location</span></td>--%>
        <td style="text-align: left;" >
            <span style="white-space: nowrap" class="ftitle" >Year</span></td>
        <td style="text-align: left;" >
            <span style="white-space: nowrap" class="ftitle" >Type</span></td>
    </tr>
    <tr>
        <%--    <td style=" text-align: left;">

                        <select class="dropdownlist" style="width:120px"  argumentid="CarFor" 
                         groupid="schCarForSalesDetails" name="D1">
                            <option value="Rental">For Sale</option>
                       
                    </select>

                </td>--%>
        <td style="text-align: left;">

            <input type="text" style="width: 115px;" class="text" argumentid="CarNumber"  groupid="schCarForSalesDetails" /></td>
        <td style="text-align: left;">
            <input type="text" style="width: 115px;" class="text" argumentid="ChassisNo"  groupid="schCarForSalesDetails" /></td>
        <td style="text-align: left;">
            <select loadon="FirstVisible" class="dropdownlist" style="width: 115px;"
                 groupid="schCarForSalesDetails" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}" name="D2">
                <option value="" selected="selected">Select Brand</option>
            </select></td>
        <td style="text-align: left;">
            <select class="dropdownlist" style="width: 115px;"
                 groupid="schCarForSalesDetails" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}" name="D3">
                <option value="" selected="selected">Select Model</option>
            </select></td>
       <%-- <td style="text-align: left;">

            <select loadon="FirstVisible" class="dropdownlist" style="width: 120px;"
                 groupid="schCarForSalesDetails" argumentid="CarLocationId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'11'}]}">
                <option value="" selected="selected">Select Location</option>
            </select>
        </td>--%>
        <td style="text-align: left;">

            <select loadon="FirstVisible" class="dropdownlist" style="width: 115px;"
                 groupid="schCarForSalesDetails" argumentid="CarYear" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'4'}]}" name="D5">
                <option value="" selected="selected">Select Year</option>
            </select></td>


        <td style="text-align: left;">

    <select loadon="FirstVisible" class="dropdownlist" style="width: 115px;"
                 groupid="schCarForSalesDetails" argumentid="TypeId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'5'}]}" name="D6">
                <option value="" selected="selected">Select Type</option>
            </select></td>
         
    </tr>
   

    <tr>
        <td style="text-align: left;" class="ftitle">
    <span style="white-space: nowrap">Location</span></td>
        <td style="text-align: left;" class="ftitle">
          <span style="white-space: nowrap">Registration Date From</span>
        </td>

        <td style="text-align: left;" class="ftitle">
            Registration Date To

        </td>
        <td style="text-align: left;" class="ftitle">
<%--            <span style="white-space: nowrap">Expiry (Days)</span>--%>

            <%--<span style="white-space: nowrap">Car Type</span>--%>

        </td>
        <td style="text-align: left;" class="ftitle">
<%--            <span style="white-space: nowrap">Full Insurance</span>--%>

           <%-- <span>Car Status</span>--%>

            <span>Car Status</span>

        </td>

                <td style="text-align: left;" class="ftitle">
<%--            <span style="white-space: nowrap">Full Insurance</span>--%>
        </td>
      
    </tr>
    <tr>
        <td style="text-align: left;">
                        <input type="hidden"  value="SearchChassisNo" groupid="schCarForSalesDetails" argumentid="SearchChassisN" />

     <select loadon="FirstVisible" class="dropdownlist" style="width: 120px;"
          groupid="schCarForSalesDetails" argumentid="CarLocationId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'11'}]}">
         <option value="" selected="selected">Select Location</option>
     </select>
 </td>
         
        <td style="text-align: left;">
                     <input type="text" groupid="schCarForSalesDetails" maxlength="10"
                            style="width: 97px;"  class="text  date   "  argumentid="RegistrationDateFrom" />

             </td>
        <td style=" text-align: left;">
            
           <input type="text" groupid="schCarForSalesDetails" maxlength="10"
                            style="width: 93px;"  class="text  date   "  argumentid="RegistrationDateTo" />
            </td>
        <td style="text-align: left;">

           

        </td>
        <td style="text-align: left;">
         


             <select loadon="FirstVisible" class="dropdownlist" style="width: 115px;"
      groupid="schCarForSalesDetails" argumentid="CarStatusId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'42'}]}" name="D4">
     <option value="" selected="selected">Select Status</option>
 </select></td>
      
     <td style="text-align: center; padding-bottom: 0px; white-space: nowrap; padding-top: 6px;">
    <!-- View Button -->
    <a href="javascript:void(0);" class="search ViewButton">
        <img alt="View" height="22" width="47" src="App_Themes/eForms_Theme/Images/spacer.gif" border="0">
    </a>

    <!-- Clear Button -->
    <a href="javascript:void(0);" class="reset clearCheck ClearButton">
        <img alt="Clear" height="22" width="47" src="App_Themes/eForms_Theme/Images/spacer.gif" border="0" style="height: 22px">
    </a>
</td>
        
    </tr>
</table>
