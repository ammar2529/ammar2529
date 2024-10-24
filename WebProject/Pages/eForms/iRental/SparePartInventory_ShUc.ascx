<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SparePartInventory_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.SparePartInventory_ShUc" %>



<table class="w-form-table" cellspacing="2" style="width: 100%">
    <tr>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">Item ID</span>
        </td>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">Item Code</span>
        </td>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">Description</span>
        </td>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">Brand</span></td>
    
       
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">Model</span>
        </td>
                <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">Store</span>
        </td> 
       

    </tr>


    <tr style="height:35px">
        <td style="text-align: left;">

            <input type="text" style="width: 115px;" class="text" argumentid="ItemId" groupid="schSparePartInventory" /></td>
        <td style="text-align: left;">

            <input type="text" style="width: 115px;" class="text" argumentid="SparePartSerialNo" groupid="schSparePartInventory" /></td>
        <td style="text-align: left;">

           <input type="text" style="width: 115px;" class="text" argumentid="SparePartName" groupid="schSparePartInventory" /></td>
        <td style="text-align: left;">

            <select loadon="FirstVisible" class="dropdownlist" style="width: 115px;"
                groupid="schSparePartInventory" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}" name="D1">
                <option value="" selected="selected">Select Brand</option>
            </select></td>
      
       
        <td style="text-align: left; padding-bottom: 4px">

            <select class="dropdownlist required" style="width: 115px;" groupid="schSparePartInventory" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}" name="D3">
    <option value="" selected="selected">Select Model</option>
    </select>
        
        </td>
         <td style="text-align: left; padding-bottom: 0px;padding-bottom:4px">

             <select argumentid="StoreLocation" class="dropdownlist  " 
                 groupid="schSparePartInventory" loadon="FirstVisible" name="D2" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'40'}]}" style="width: 115px;">
                 <option selected="selected" value="">Select Store</option>
             </select>

        </td>
       
    </tr>


      <tr>
      <td class="ftitle">
          <span style="white-space: nowrap">Purchasing From</span>
      </td>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">
        <nobr>Rack No.</nobr></span></td>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">
            <nobr>Shelf No.</nobr></span></td>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">
            <nobr>Quantity</nobr></span></td>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">
            <nobr>Unit Price</nobr></span></td>
            <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap"></span>

        </td>
       
    </tr>

       <tr>
        <td style="text-align: left;">
            <select class="dropdownlist" style="width: 121px;"
                groupid="schSparePartInventory" argumentid="PurchasingFrom" name="D4">
                <option value="" selected="selected">Select Purchasing From</option>
             
                

                <option value="Geniune">GP</option>
               
                <option value="China">LC</option>
             
                 <option value="Kuwait">LK</option>
                

            </select>
         </td>
        <td style="text-align: left;">

            <%--<input type="text" style="width: 115px;" class="text" argumentid="SparePartName" groupid="schSparePartInventory" />--%>

            <input type="text" style="width: 115px;" class="text" argumentid="SparePartRackfNo" groupid="schSparePartInventory" /></td>
        <td style="text-align: left;">

            <%--<select loadon="FirstVisible" class="dropdownlist" style="width: 120px;"
                groupid="schSparePartInventory" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}">
                <option value="" selected="selected">Select Brand</option>
            </select>--%>

            <input type="text" style="width: 115px;" class="text" argumentid="SparePartShelfNo" groupid="schSparePartInventory" /></td>
        <td style="text-align: left;">
            <%--<select class="dropdownlist" style="width: 120px;"
                groupid="schSparePartInventory" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}">
                <option value="" selected="selected">Select Model</option>
            </select>--%>
            <select class="dropdownlist" style="width: 62px;margin-right:1px;"
                groupid="schSparePartInventory" argumentid="SparePartQuantityCheck" name="D5">
                <option value="" selected="selected">< Or ></option>
             
               

                <option value="LessThan">Less</option>
               
                <option value="GreaterThan">Greater</option>
             
                 

            </select>
            <input type="text" style="width: 44px;" class="text" argumentid="SparePartQuantity" groupid="schSparePartInventory" />

        </td>
        <td style="text-align: left;">
          <select class="dropdownlist" style="width: 62px;margin-right:1px;"
                groupid="schSparePartInventory" argumentid="SparePartUnitPriceCheck" name="D5">
                <option value="" selected="selected">< Or ></option>
             
             

                <option value="LessThanP">Less</option>
              
                <option value="GreaterThanP">Greater</option>
                
                 

            </select>
            <input type="text" style="width: 44px;" class="text" argumentid="SparePartUnitPrice" groupid="schSparePartInventory" />


        </td>
        
       
        <td style="text-align: left; padding-bottom: 0px; white-space: nowrap;padding-top: 6px;">
    <!-- View Button -->
    <a href="javascript:void(0);" class="search ViewButton">
        <img alt="View" height="22" width="47" src="App_Themes/eForms_Theme/Images/spacer.gif" border="0">
    </a>

    <!-- Clear Button -->
    <a href="javascript:void(0);" class="reset clearCheck ClearButton">
        <img alt="Clear" height="22" width="47" src="App_Themes/eForms_Theme/Images/spacer.gif" border="0">
    </a>
</td>
    </tr>
</table>


