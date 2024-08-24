<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GarageCarServiceDetails_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.Modules.GarageCarServiceDetails_ShUc" %>
<table class="w-form-table" cellspacing="2" style="width: 100%">
  
        <tr>
        <td style="text-align: left;" class="ftitle" width="20%">
            <span style="white-space: nowrap">Service </span><span>No.</span>
        </td>
        <td style="text-align: left;" class="ftitle" width="20%">
            <span style="white-space: nowrap">Car No.</span></td>
        <td style="text-align: left;" class="ftitle" width="20%">
            <span style="white-space: nowrap">Chassis No.</span></td>
        <td style="text-align: left;" class="ftitle" width="20%">
            <span style="white-space: nowrap">National ID No.</span></td>

        <td style="text-align: left;" class="ftitle" width="20%">

            <span style="white-space: nowrap">Customer Name</span></td>
            
    </tr>
      
    <tr>
        <td style="text-align: left;">

            <input type="text"  class="text" argumentid="RecCode"  groupid="schCarServiceDetails" />
        </td>
        <td style="text-align: left;">
            <input type="text"  class="text " 
                                groupid="schCarServiceDetails"  argumentid="CarNumber" /></td>
        <td style="text-align: left;">
            <input type="text"  class="text" argumentid="ChassisNo"  groupid="schCarServiceDetails" /></td>
        <td style="text-align: left;">
            
            <input type="text" class="text"  argumentid="NationalIDNo" groupid="schCarServiceDetails" />
           </td>

        <td style="text-align: left;">
            <input type="text" class="text" argumentid="CustomerName" groupid="schCarServiceDetails" />
            </td>
        
    </tr>
    
    
   
    <tr>

        <td colspan="7">&nbsp;
        </td>

    </tr>

      
    <tr>
        <td style="text-align: left;" class="ftitle">

            <span style="white-space: nowrap">Mobile Telephone</span></td>
        <td style="text-align: left;" class="ftitle">

            Receive Date</td>
        <td style="text-align: left;" class="ftitle">

            Delivery Date</td>
        <td style="text-align: left;" class="ftitle">

            Deliverd Date</td>
        <td style="text-align: left;" class="ftitle">Status</td>
        
    </tr>
    <tr>
        <td style="text-align: left;">
                    &nbsp;<input type="text" class="text" argumentid="MobileTelephone1" groupid="schCarServiceDetails" /></td>
        <td style="text-align: left;">
            &nbsp;<input type="text" groupid="schCarServiceDetails" maxlength="10"
                            style="width: 75px;"  class="text  date   "  argumentid="CarRecivedDate" /></td>
        <td style="text-align: left;">
            <input type="text" groupid="schCarServiceDetails" maxlength="10"
                            style="width: 75px;"  class="text  date   "  argumentid="CarToBeDeliverdDate" /></td>
        <td style="text-align: left;">

            <input type="text" groupid="schCarServiceDetails" maxlength="10"
                            style="width: 75px;"  class="text  date   "  argumentid="CarDeliverdDate" /></td>
        <td style="text-align: left; padding-bottom: 0px; white-space: nowrap">
         
            <select class="dropdownlist"
                groupid="schCarServiceDetails" argumentid="StateId" name="D4">
                <option value="" selected="selected">Select Status</option>
                <%--<option value="">-----------------------------</option>
                <option value="RRCCreatedState">Created - Reservation</option>
                <option value="">-----------------------------</option>--%>
                <option value="">-----------------------------</option>
                <option value="CreatedState">Created</option>
                <option value="">-----------------------------</option>
                <option value="ClosedState">Closed</option>
                <option value="">-----------------------------</option>
                <%--<option value="RRCContractOpen">Contract Open - Car Out</option>
                            <option value="">-----------------------------</option>
                            <option value="RRCContractCreated">Contract Created</option>
                            <option value="">-----------------------------</option>
							<option value="RRCContractOpenCarIn" style="color:red">Contract Open - Car In</option>
							<option value="RRCWithLegalContractOpenCarOut" style="color:red">With Legal - Contract Open - Car Out</option>
							<option value="RRCWithLegalContractOpenCarIn" style="color:red">With Legal - Contract Open - Car In</option>
							<option value="RRCWithLegalContractClosedPendingPayment" style="color:red">With Legal - Contract Closed - Pending Payment</option>
                            <option value="RRCContractClosedPendingPayment" style="color:red">Contract Closed - Pending Payment</option>
                            <option value="">-----------------------------</option>--%>
            <%--    <option value="RRCContractClosed" style="color: Green">Contract Closed - Payment Cleared</option>
                <option value="">-----------------------------</option>
                <option value="RRCContractCancelled">Contract Cancelled</option>
                <option value="">-----------------------------</option>
                <option value="RRCPendingPaymentCarOut">Pending Payment - Car Out</option>
                <option value="">-----------------------------</option>
                 <option value="RRCPendingPaymentCarIn">Pending Payment - Car In</option>
                 <option value="">-----------------------------</option>--%>

            </select></td>

    </tr>

     <tr>

        <td colspan="7">&nbsp;
        </td>

    </tr>


       <tr>
        <td style="text-align: left;" class="ftitle" width="20%">
            &nbsp;</td>
        <td style="text-align: left;" class="ftitle" width="20%">
            &nbsp;</td>
        <td style="text-align: left;" class="ftitle" width="20%">
            &nbsp;</td>
        <td style="text-align: left;" class="ftitle" width="20%">
            &nbsp;</td>

        <td style="text-align: left;" class="ftitle" width="20%">

            &nbsp;</td>
         
    </tr>
      
    <tr>
        <td style="text-align: left;">

            &nbsp;</td>
        <td style="text-align: left;">
            &nbsp;</td>
        <td style="text-align: left;">
            &nbsp;</td>
        <td style="text-align: left;">
            
            &nbsp;</td>

        <td style="text-align: left;">
            &nbsp;<a href="javascript:void(0);" class="search ViewButton "><img alt="" height="22px" width="47px" src="App_Themes/eForms_Theme/Images/spacer.gif"
                    border="0" /></a><a href="javascript:void(0);" class="reset clearCheck ClearButton"><img alt="" height="22px" width="47px" src="App_Themes/eForms_Theme/Images/spacer.gif"
                            border="0" /></a></td>
       
    </tr>
  

</table>