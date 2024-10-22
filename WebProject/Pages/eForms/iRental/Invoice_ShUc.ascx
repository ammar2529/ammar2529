<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Invoice_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.Invoice_ShUc" %>

<table class="w-form-table" cellspacing="2" style="width: 100%">
    <tr>
        <td style="text-align: left;" class="ftitle" width="20%">
            <span style="white-space: nowrap">Invoice No.</span></td>
        <td style="text-align: left;" class="ftitle" width="20%">
            &nbsp;<span style="white-space: nowrap">Car No.</span></td>
        <td style="text-align: left;" class="ftitle" width="20%">
            &nbsp;<span>Brand</span>
                                    

        </td>
        <td style="text-align: left;" class="ftitle" width="20%">
            

            <span style="white-space: nowrap">Model</span></td>

        <td style="text-align: left;" class="ftitle" width="20%">
            Status</td>
    </tr>
      
    <tr style="height:35px">
        <td style="text-align: left;">
            <input type="text" class="text" argumentid="InvRecCode" groupid="schInvoice" style="width:155px;" />
        </td>
        <td style="text-align: left;">
            <input type="text" class="text" argumentid="CarNumber" groupid="schInvoice" style="width:155px;" /></td>
        <td style="text-align: left;">
          

            <select loadon="FirstVisible" class="dropdownlist " style="width: 160px;"
                 groupid="schInvoice" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}" name="D5">
                <option value="" selected="selected">Select Brand</option>
            </select></td>
       <td style="text-align: left;padding-bottom: 4px;">
          

            <select class="dropdownlist " style="width: 160px;;"
                 groupid="schInvoice" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}" name="D6">
                <option value="" selected="selected">Select Model</option>
            </select></td>

        <td style="text-align: left;padding-bottom: 4px;">
            

            <select class="dropdownlist" style="width: 160px;"
    groupid="schInvoice" argumentid="StateId" name="D4">
    <option value="" selected="selected">Select Status</option>
    <%--<option value="">-----------------------------</option>
    <option value="RRCCreatedState">Created - Reservation</option>
    <option value="">-----------------------------</option>--%>
    <option value="">-----------------------------</option>
    <option value="OpenState">Open</option>
    <option value="">-----------------------------</option>
    <option value="ClosedState">Closed</option>
    <option value="">-----------------------------</option>
    <option value="CanceledState">Canceled</option>
    <option value="">-----------------------------</option>

</select></td>
    </tr>

  

      <tr>
        <td style="text-align: left;" class="ftitle" width="20%">
            Service<span style="white-space: nowrap"> No.</span></td>
        <td style="text-align: left;" class="ftitle" width="20%">

            <span style="white-space: nowrap">Customer Name</span></td>
        <td style="text-align: left;" class="ftitle" width="20%">

            <span style="white-space: nowrap">National ID No.</span></td>
        <td style="text-align: left;" class="ftitle" width="20%">

            <span style="white-space: nowrap">Mobile Telephone</span></td>

        <td style="text-align: left;" class="ftitle" width="20%">
<%--            <span style="white-space: nowrap">Salesman</span>--%>

                        </td>
    </tr>
      
    <tr style="height:35px">
        <td style="text-align: left;">
          

            <input type="text" class="text" argumentid="ServiceNo" groupid="schInvoice" style="width:155px;"/></td>
        <td style="text-align: left;">
       

            <input type="text" class="text" argumentid="CustomerName" groupid="schInvoice" style="width:155px;"/></td>

        <td style="text-align: left;">
               
  

            <input type="text" class="text" argumentid="NationalIDNo" groupid="schInvoice" style="width:155px;"/></td>
        <td style="text-align: left;">
          


            <input type="text" class="text"  argumentid="MobileTelephone1" groupid="schInvoice" style="width:155px;"/></td>

        <td style="text-align: left; padding-bottom: 0px; white-space: nowrap; padding-top: 6px;">
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