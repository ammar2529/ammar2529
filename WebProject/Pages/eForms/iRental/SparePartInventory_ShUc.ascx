<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SparePartInventory_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.SparePartInventory_ShUc" %>



<table class="w-form-table" cellspacing="2" style="width: 100%">
    <tr>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">Item Id</span>
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


    <tr>
        <td style="text-align: left;">

            <input type="text" style="width: 115px;" class="text" argumentid="ItemId" groupid="schSparePartInventory" /></td>
        <td style="text-align: left;">

            <input type="text" style="width: 115px;" class="text" argumentid="SparePartSerialNo" groupid="schSparePartInventory" /></td>
        <td style="text-align: left;">

            &nbsp;<input type="text" style="width: 115px;" class="text" argumentid="SparePartName" groupid="schSparePartInventory" /></td>
        <td style="text-align: left;">

            <select loadon="FirstVisible" class="dropdownlist" style="width: 120px;"
                groupid="schSparePartInventory" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}" name="D1">
                <option value="" selected="selected">Select Brand</option>
            </select></td>
      
       
        <td style="text-align: left; padding-bottom: 0px">

            <select class="dropdownlist required" style="width: 120px;" groupid="schSparePartInventory" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}" name="D3">
    <option value="" selected="selected">Select Model</option>
    </select>
        
        </td>
         <td style="text-align: left; padding-bottom: 0px">

             <select argumentid="StoreLocation" class="dropdownlist  " 
                 groupid="schSparePartInventory" loadon="FirstVisible" name="D2" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'40'}]}" style="width: 150px;">
                 <option selected="selected" value="">Select Store</option>
             </select>

        </td>
       
    </tr>


      <tr>
      <td>
          <span style="white-space: nowrap"></span>
      </td>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap"></span>
        </td>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap"></span>

        </td>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap"></span>

        </td>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap"></span>

        </td>
            <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap"></span>

        </td>
       
    </tr>

       <tr>
        <td style="text-align: left;">

            <%--<input type="text" style="width: 115px;" class="text" argumentid="ItemId" groupid="schSparePartInventory" />--%></td>
        <td style="text-align: left;">

            <%--<input type="text" style="width: 115px;" class="text" argumentid="SparePartName" groupid="schSparePartInventory" />--%></td>
        <td style="text-align: left;">

            <%--<select loadon="FirstVisible" class="dropdownlist" style="width: 120px;"
                groupid="schSparePartInventory" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}">
                <option value="" selected="selected">Select Brand</option>
            </select>--%>
        </td>
        <td style="text-align: left;">
            <%--<select class="dropdownlist" style="width: 120px;"
                groupid="schSparePartInventory" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}">
                <option value="" selected="selected">Select Model</option>
            </select>--%></td>
        <td style="text-align: left;">
            <%--<input type="text" style="width: 115px;" class="text" argumentid="SparePartShelfNo" groupid="schSparePartInventory" />--%>
        </td>
       
        <td style="text-align: left; padding-bottom: 0px">

            <a href="javascript:void(0);" class="search ViewButton">
                <img alt="" height="22px" width="47px" src="App_Themes/eForms_Theme/Images/spacer.gif" border="0" /></a>
            <a href="javascript:void(0);" class="reset ClearButton">
                <img alt="" height="22px" width="47px" src="App_Themes/eForms_Theme/Images/spacer.gif" border="0" /></a>

           <%-- <a href="javascript:void(0);" class="ClosePopup CloseLOVPopup">
                <img alt="" height="22px" width="47px" src="App_Themes/eForms_Theme/Images/Close.gif" border="0" /></a>--%>

        </td>
    </tr>
</table>


