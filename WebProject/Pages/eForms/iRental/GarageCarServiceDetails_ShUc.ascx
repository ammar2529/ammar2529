<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GarageCarServiceDetails_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.Modules.GarageCarServiceDetails_ShUc" %>
<table class="w-form-table" cellspacing="2" style="width: 100%">
  
        <tr>
        <td style="text-align: left;" class="ftitle" width="20%">
            <span style="white-space: nowrap">Service </span><span>No.</span>
        </td>
        <td style="text-align: left;" class="ftitle" width="20%">
            <span style="white-space: nowrap">Car No.</span></td>
        <td style="text-align: left;" class="ftitle" width="20%">

            <span style="white-space: nowrap">Customer Name</span></td>
        <td style="text-align: left;" class="ftitle" width="20%">
            <span style="white-space: nowrap">National ID No.</span></td>

        <td style="text-align: left;" class="ftitle" width="20%">

            <span style="white-space: nowrap">Mobile Telephone</span></td>
            
    </tr>
      
    <tr style="height: 35px";>
        <td style="text-align: left;">

            <input type="text" style="width:155px;"  class="text" argumentid="RecCode"  groupid="schCarServiceDetails" />
        </td>
        <td style="text-align: left;">
            <input type="text"  class="text " style="width:155px;" 
                                groupid="schCarServiceDetails"  argumentid="CarNumber" /></td>
        <td style="text-align: left;">
            <input type="text" style="width:155px;" class="text" argumentid="CustomerName" groupid="schCarServiceDetails" /></td>
        <td style="text-align: left;">
            
            <input type="text" class="text" style="width:155px;"   argumentid="NationalIDNo" groupid="schCarServiceDetails" />
           </td>

        <td style="text-align: left;">
            <input type="text" class="text" style="width:155px;" argumentid="MobileTelephone1" groupid="schCarServiceDetails" /></td>
        
    </tr>
    
    
   


      
    <tr>
        <td style="text-align: left;" class="ftitle">

            Receive Date</td>
        <td style="text-align: left;" class="ftitle">

            Delivery Date</td>
        <td style="text-align: left;" class="ftitle">

            Deliverd Date</td>
        <td style="text-align: left;" class="ftitle">

            Status</td>
        <td style="text-align: left;" class="ftitle">&nbsp;</td>
        
    </tr>
    <tr>
        <td style="text-align: left;">
            <input type="text" groupid="schCarServiceDetails" maxlength="10"
                style="width: 135px;" class="text  date   " argumentid="CarRecivedDate" /></td>
        <td style="text-align: left;">
            <input type="text" groupid="schCarServiceDetails" maxlength="10"
                style="width: 135px;" class="text  date   " argumentid="CarToBeDeliverdDate" /></td>
        <td style="text-align: left;">

            <input type="text" groupid="schCarServiceDetails" maxlength="10"
                style="width: 135px;" class="text  date   " argumentid="CarDeliverdDate" /></td>
        <td style="text-align: left;">

            <select class="dropdownlist" style="width: 160px;"
                groupid="schCarServiceDetails" argumentid="StateId" name="D4">
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