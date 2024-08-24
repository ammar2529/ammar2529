<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GRG_CarAndCustomerDetails_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.GRG_CarAndCustomerDetails_ShUc" %>

<table class="w-form-table" cellspacing="2" style="width: 100%">
    <tr>
        <td style="text-align: left;" class="ftitle" width="20%">
            <span style="white-space: nowrap">Car No.</span></td>
        <td style="text-align: left;" class="ftitle" width="20%">
            &nbsp;<span style="white-space: nowrap">Chassis No.</span></td>
        <td style="text-align: left;" class="ftitle" width="20%">
            &nbsp;<span>Brand</span>
                                    

        </td>
        <td style="text-align: left;" class="ftitle" width="20%">
            

            <span style="white-space: nowrap">Model</span></td>

        <td style="text-align: left;" class="ftitle" width="20%">
            Year</td>
    </tr>
      
    <tr>
        <td style="text-align: left;">
            <input type="text" class="text" argumentid="CarNumber" groupid="schCarAndCustomerDetails" />
        </td>
        <td style="text-align: left;">
            <input type="text"  class="text" argumentid="ChassisNo" groupid="schCarAndCustomerDetails" /></td>
        <td style="text-align: left;">
          

            <select loadon="FirstVisible" class="dropdownlist " style="width: 155px;"
                 groupid="schCarAndCustomerDetails" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}" name="D5">
                <option value="" selected="selected">Select Brand</option>
            </select></td>
       <td style="text-align: left;">
          

            <select class="dropdownlist " style="width: 155px;"
                 groupid="schCarAndCustomerDetails" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}" name="D6">
                <option value="" selected="selected">Select Model</option>
            </select></td>

        <td style="text-align: left;">
            

            <select loadon="FirstVisible" class="dropdownlist" style="width: 155px;"
                 groupid="schCarAndCustomerDetails" argumentid="CarYear" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'4'}]}">
                <option value="" selected="selected">Select Year</option>
            </select></td>
    </tr>

    <tr>
        <td colspan="5"></td>
    </tr>


      <tr>
        <td style="text-align: left;" class="ftitle" width="20%">
            <span style="white-space: nowrap">National ID No.</span></td>
        <td style="text-align: left;" class="ftitle" width="20%">

            <span style="white-space: nowrap">Customer Name</span></td>
        <td style="text-align: left;" class="ftitle" width="20%">

            <span style="white-space: nowrap">Mobile Telephone</span></td>
        <td style="text-align: left;" class="ftitle" width="20%">

            <span style="white-space: nowrap">Status</span> </td>

        <td style="text-align: left;" class="ftitle" width="20%">
<%--            <span style="white-space: nowrap">Salesman</span>--%>

                        <nobr>Car For</nobr></td>
    </tr>
      
    <tr>
        <td style="text-align: left;">
          

            <input type="text" class="text" argumentid="NationalIDNo" groupid="schCarAndCustomerDetails" /></td>
        <td style="text-align: left;">
       

            <input type="text" class="text" argumentid="CustomerName" groupid="schCarAndCustomerDetails" /></td>

        <td style="text-align: left;">
               
  

            <input type="text" class="text"  argumentid="MobileTelephone1" groupid="schCarAndCustomerDetails" /></td>
        <td style="text-align: left;">
          


            <select class="dropdownlist"  style="width: 155px;"
                groupid="schCarAndCustomerDetails" argumentid="StateId" name="D4">
                <option value="" selected="selected">Select Status</option>
                <%--<option value="">-----------------------------</option>
                <option value="RRCCreatedState">Created - Reservation</option>
                <option value="">-----------------------------</option>--%>
                <option value="">-----------------------------</option>
                <option value="CreatedState">Created</option>
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

        <td style="text-align: left;">
            <%--<select loadon="FirstVisible" valtype="value" class="dropdownlist CommonDisableClass  "   style="width: 135px;" groupid="schCarAndCustomerDetails" argumentid="Salesman" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'39'}]}">
                            <option value="" selected="selected">Select Salesman</option>
                        </select>--%>

            <select class="dropdownlist"  style="width: 155px;"
                groupid="schCarAndCustomerDetails" argumentid="CarFor" name="D7">
                <option value="" selected="selected">Select CarFor</option>
                <option value="Sales">Sales</option>
                <option value="Rental">Rental</option>
                <option value="Lease">Lease</option>
             

            </select></td>
    </tr>

   
        <tr>
        <td colspan="5"></td>
    </tr>
    
    <tr>
        <td style="text-align: left;" class="ftitle">
            &nbsp;</td>
        <td style="text-align: left;" class="ftitle">

            &nbsp;</td>
        <td style="text-align: left;" class="ftitle">
            &nbsp;</td>
        <td style="text-align: left;" class="ftitle">
            &nbsp;</td>
        <td style="text-align: left;" class="ftitle">
           </td>
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

        <td style="text-align: left; padding-bottom: 0px; white-space: nowrap">
           
            <a href="javascript:void(0);" class="search ViewButton ">
                <img alt="" height="22px" width="47px" src="App_Themes/eForms_Theme/Images/spacer.gif"
                    border="0" /></a> 
            <a href="javascript:void(0);" class="reset clearCheck ClearButton">
                        <img alt="" height="22px" width="47px" src="App_Themes/eForms_Theme/Images/spacer.gif"
                            border="0" /></a>
           
            </td>
  
</table>
