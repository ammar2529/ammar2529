<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalesCarPrice_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.SalesCarPrice_FrUc" %>


<table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">

    <tr id="trNote">
        <td colspan="2" style="padding-top:10px;padding-bottom:10px">
            Use the form below to update the details, fields marked with an asterisk (*) are mandatory
        </td>
    </tr>

    <tr>
        <td class="ftitle">
            <nobr>Brand*:</nobr>
        </td>
        <td>
            <input type="hidden"  groupid="SalesCarsPriceForm" argumentid="RecId" />
            <select loadon="FirstVisible" class="dropdownlist required" style="width: 155px;" groupid="SalesCarsPriceForm" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}">
    <option value="" selected="selected">Select Brand</option>
    </select>
        </td>
    </tr>
    <tr>
        <td class="ftitle">
            <nobr>Model*:</nobr>
        </td>
        <td>
            <select class="dropdownlist required" style="width: 155px;" groupid="SalesCarsPriceForm" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}">
    <option value="" selected="selected">Select Model</option>
    </select>
        </td>
    </tr>
    <tr>
        <td class="ftitle">
            <nobr>Year*:</nobr>
        </td>
        <td>
            <select loadon="FirstVisible" class="dropdownlist required" style="width: 155px;" groupid="SalesCarsPriceForm" argumentid="YearId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'4'}]}">
    <option value="" selected="selected">Select Year</option>
    </select>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
        </td>
    </tr>

    <tr>
        <td class="ftitle">
            <nobr>Price*:</nobr>
        </td>
        <td>

            <input type="text" style="text-align:center;width:150px;" maxlength="10" class="text required number" groupid="SalesCarsPriceForm" alphconf="{allow:'.'}" argumentid="Price" />


        </td>
    </tr>



    <tr>
        <td class="ftitle">
            <nobr>Comments:</nobr>
        </td>
        <td>

            <textarea class="textarea " rows="6" wrap="1" cols="30" argumentid="Comments" groupid="SalesCarsPriceForm"></textarea>
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

            <input type="button" value="  Save  " class="DataAction ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesCarPrice',HideOnSuccess:true}" />
            <input type="button" value="  Cancel  " class="CloseForm ButtonStyle" />

        </td>
    </tr>
</table>