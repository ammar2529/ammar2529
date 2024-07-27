<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SparePartInventory_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.SparePartInventory_FrUc1" %>

<%@ Register Src="~/AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="AW" %>


<style>
    .thumbnail {
        /*float: right;*/
        border: 1px solid black;
    
  }
    .image-container {
    position: relative;
    display: inline-block;
}

.delete-button {
    position: absolute;
    top: 5px;
    right: 5px;
    background-color: rgba(255, 0, 0, 0.5); /* Transparent red background */
    color: white;
    border: none;
    border-radius: 50%; /* Makes the button circular */
    width: 20px;
    height: 20px;
    font-size: 12px;
    line-height: 20px;
    text-align: center;
    cursor: pointer;
    visibility: hidden; /* Initially hidden */
}

.image-container:hover .delete-button {
    visibility: visible; /* Show delete button on hover */
}

</style>
<table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">

    <tr id="trNote">
        <td colspan="2" style="padding-top: 10px; padding-bottom: 10px">Use the form below to update the details, fields marked with an asterisk (*) are mandatory
        </td>
    </tr>
    
      <tr>
        <td class="ftitle">
            <nobr>Item Id*:</nobr>
        </td>
        <td>
            
            <div>
                 <input type="text"  style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="10" class="text  AlwaysDisable ElemDisabled" 
                groupid="SparePartInventoryForm" argumentid="ItemId"  disabled="disabled" readonly="readonly"/>
            </div>
        </td>
    </tr>

      <tr>
        <td class="ftitle">
            <nobr>Item Code.*:</nobr>
        </td>
        <td>

           <%-- <input type="text" style="text-align: center; width: 150px;" maxlength="10" class="text required number"
                groupid="SparePartInventoryForm" argumentid="SparePartSerialNo" />--%>

            <input type="text" style="text-align:center;width:150px; font-weight:bold;color:red"  maxlength="10" class="text required validateunique" primarykey="RecId"
            
                storeid="iRental_SparePartInventory" uniquenotfound="{en:' Item Code is valid...',color:'green'}"  uniquefound="{en:' Duplicate Item Code...',color:'red'}" groupid="SparePartInventoryForm"  argumentid="SparePartSerialNo" />

        </td>
    </tr>

    <tr>
        <td class="ftitle">
            <nobr>Description*:</nobr>
        </td>
        <td>
            <div style="display: none"><span groupid="SparePartInventoryForm" argumentid="RecId"></span>
                <input type="hidden"groupid="SparePartInventoryForm" argumentid="UserName"  />
            </div>
            <div>
                 <input type="text"  style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="10" class="text required" 
                groupid="SparePartInventoryForm" argumentid="SparePartName" />
            </div>
        </td>
    </tr>

    

     <tr>
        <td class="ftitle">
            <nobr>Quantity*:</nobr>
        </td>
        <td>

            <input type="text" style="text-align: center; width: 150px;" maxlength="10" class="text required number"
                groupid="SparePartInventoryForm" argumentid="SparePartQuantity" />

        </td>
    </tr>

         <tr>
        <td class="ftitle">
            <nobr>Brand*:</nobr>
        </td>
        <td>
            
            <select loadon="FirstVisible" class="dropdownlist required" style="width: 155px;" groupid="SparePartInventoryForm" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}">
    <option value="" selected="selected">Select Brand</option>
    </select>
        </td>
    </tr>

      <tr>
        <td class="ftitle">
            <nobr>Model*:</nobr>
        </td>
        <td>
            <select class="dropdownlist required" style="width: 155px;" groupid="SparePartInventoryForm" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}">
    <option value="" selected="selected">Select Model</option>
    </select>
        </td>
    </tr>

  
      <tr>
        <td class="ftitle">
            <nobr>Shelf No.:</nobr>
        </td>
        <td>

            <input type="text" style="text-align: center; width: 150px;" maxlength="10" class="text  number"
                groupid="SparePartInventoryForm" argumentid="SparePartShelfNo" />

        </td>
    </tr>

  

       <tr>
        <td class="ftitle">
            <nobr>Unit Price*:</nobr>
        </td>
        <td>

            <input type="text" style="text-align: center; width: 150px;" maxlength="10" class="text required number"
                groupid="SparePartInventoryForm" argumentid="SparePartUnitPrice" />

        </td>
    </tr>
    <tr>
        <td colspan="2">
            <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
        </td>
    </tr>

<%--    <tr>
    <td class="ftitle">
        <nobr>Image:</nobr>
    </td>
    <td >
        <input type="file" accept="image/png, image/jpeg, image/gif"  class="text file-input" groupid="SparePartInventoryForm" argumentid="SparePartImage" id="imageUpload" />
                                    <button class="upload-button CommonDisableClass">Upload</button>

           <img height="100" class="thumbnail" src="../../../App_Themes/Blue/images/default_image.png" width="100"  />
                   <input type="hidden" groupid="SparePartInventoryForm" argumentid="FileGuid" readonly="readonly" />
    </td>
</tr>--%>

    <tr>
    <td class="ftitle">
        <nobr>Image:</nobr>
    </td>
    <td>
        <input type="file" accept="image/png, image/jpeg, image/gif" class="text file-input" groupid="SparePartInventoryForm" argumentid="SparePartImage" id="imageUpload" />
        <button class="upload-button CommonDisableClass">Upload</button>
        <div class="image-container">
            <img height="100" class="thumbnail" src="../../../App_Themes/Blue/images/default_image.png" width="100" />
            <button type="button" class="delete-button">X</button>
        </div>
        <input type="hidden" groupid="SparePartInventoryForm" argumentid="FileGuid" readonly="readonly" />
    </td>
</tr>

   
    <tr>
        <td colspan="2">
            <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
        </td>
    </tr>

    <tr>
        <td class="ftitle" valign="top">
            <nobr>Remarks:</nobr>
        </td>
        <td width="100%">
            <textarea class="textarea" rows="6" wrap="1" cols="37" argumentid="SparePartRemarks" groupid="SparePartInventoryForm"></textarea>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
        </td>
    </tr>

    <tr>
        <td>
            <img src="App_Themes/eForms_Theme/Images/spacer.gif" />
        </td>
        <td>
            <input type="text" style="display: none" groupid="SparePartInventoryForm" argumentid="action" value="new" class="noautoreset" />
            <input type="button" value="  Save  " class="DataAction ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SparePartInventory',HideOnSuccess:true}" />
            <input type="button" value="  Cancel  " class="CloseForm ButtonStyle" />

        </td>
    </tr>
</table>
