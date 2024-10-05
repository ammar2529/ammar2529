<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalesContracts_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.SalesContracts_ShUc" %>

<script>
    
    setTimeout(function ()
    {

        var t = this;

        //$('.NoArrive').prop('checked', true);
        if ($('.NotArrive').is(":checked"))
        {
            $('.CommonSecondDD').hide();
            $('.CommonFirstDD').show();
            $('.CommonSecondDD').val('');
        } else
        {
            $('.CommonSecondDD').show();
            $('.CommonFirstDD').hide();
            $('.CommonFirstDD').val('');
        }



        $('.NotArrive').on('click', function ()
        {
            if ($(this).is(":checked"))
            {
                $('.CommonSecondDD').hide();
                $('.CommonFirstDD').show();
                $('.CommonSecondDD').val('');
            }
        });

        // Event handler for Arrive checkbox
        $('.Arrive').on('click', function ()
        {
            if ($(this).is(":checked"))
            {
                $('.CommonSecondDD').show();
                $('.CommonFirstDD').hide();
                $('.CommonFirstDD').val('');
            }
        });

        $('.clearCheck').click(function ()
        {
            $('[name="CarReservationMode"]').prop('checked', false);


        });

      
    }, 2000);
   
    

    //$('.NotArrive', t.el).on('click', function ()
    //{
    //    $('.CommonSecondDD').hide();
    //    $('.CommonFirstDD').show();
    //    $('.CommonSecondDD').val('');
    //});

    //$('.Arrive', t.el).on('click', function ()
    //{
    //    $('.CommonSecondDD').show();
    //    $('.CommonFirstDD').hide();
    //    $('.CommonFirstDD').val('');
    //});
</script>

<table class="w-form-table" cellspacing="2" style="width: 100%">
    <tr>
        <td style="text-align: left;" class="ftitle" width="20%">
            <span>Contract No.</span>
        </td>
        <td style="text-align: left;" class="ftitle" width="20%">

            <span class="ftitle"  style="white-space: nowrap">LPO Number</span><%--            <span style="white-space: nowrap">Year</span>--%></td>
        <td style="text-align: left;" class="ftitle" width="20%">
            <span class="ftitle"  style="white-space: nowrap">Finance Company</span></td>
        <td style="text-align: left;" class="ftitle" width="20%">
            <span style="white-space: nowrap">Salesman</span></td>

        <td style="text-align: left;" class="ftitle" width="20%">
            <span style="white-space: nowrap">Contract Status</span>
        </td>
    </tr>
      
    <tr style="height:35px">
        <td style="text-align: left;">
            <input type="text" class="text" argumentid="RecCode" groupid="schSalesContractDetails" style="width:155Px;"/>
        </td>
        <td style="text-align: left;">
            <input type="text" style="text-align: center; width: 155px;" maxlength="29" class="text  "
                            groupid="schSalesContractDetails" argumentid="LPONumber" /></td>
        <td style="text-align: left;">
            <select class="dropdownlist" style="width: 160px;" loadon="FirstVisible"  groupid="schSalesContractDetails" argumentid="FinanceCompany" 
                storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'36'}]}" name="D5">
                <option value="" selected="selected">Select Finance Company</option>
            </select></td>
        <td style="text-align: left;">
            <%--<select loadon="FirstVisible" class="dropdownlist" style="width: 135px;"
                groupid="schSalesContractDetails" argumentid="CarYearId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'4'}]}">
                <option value="" selected="selected">Select Year</option>
            </select>--%><select loadon="FirstVisible" valtype="value" class="dropdownlist CommonDisableClass  "   style="width: 160px;" groupid="schSalesContractDetails" argumentid="Salesman" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'39'}]}" name="D6">
                            <option value="" selected="selected">Select Salesman</option>
                        </select></td>

        <td style="text-align: left;">
            <select class="dropdownlist" style="width: 160px;"
                groupid="schSalesContractDetails" argumentid="StateId" name="D4">
                <option value="" selected="selected">Select Status</option>
                <option value="">-----------------------------</option>
                <option value="RRCCreatedState">Created - Reservation</option>
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
                <option value="RRCContractClosed" style="color: Green">Contract Closed - Payment Cleared</option>
                <option value="">-----------------------------</option>
                <option value="RRCContractCancelled">Contract Cancelled</option>
                <option value="">-----------------------------</option>
                <option value="RRCPendingPaymentCarOut">Pending Payment - Car Out</option>
                <option value="">-----------------------------</option>
                 <option value="RRCPendingPaymentCarIn">Pending Payment - Car In</option>
                 <option value="">-----------------------------</option>

            </select></td>
    </tr>

 


      <tr>
        <td style="text-align: left;" class="ftitle" width="20%">
                        <%--<nobr>Car Reservation</nobr>--%>
            <nobr>Car No.</nobr>

        </td>
        <td style="text-align: left;" class="ftitle" width="20%">

            <span style="white-space: nowrap">Chassis No.</span></td>
        <td style="text-align: left;" class="ftitle" width="20%">
            <span>Brand</span>
        </td>
        <td style="text-align: left;" class="ftitle" width="20%">
            <span style="white-space: nowrap">Model</span></td>

        <td style="text-align: left;" class="ftitle" width="20%">
<%--            <span style="white-space: nowrap">Salesman</span>--%>

            <span style="white-space: nowrap">Color</span></td>
    </tr>
      
    <tr style="height:35px">
        <td style="text-align: left;">
          <%-- <input type="radio" class="  Arrive  "  value="CarArrived" name="CarReservationMode"  groupid="schSalesContractDetails" argumentid="CarReservationMode" /><label>Arrived</label>
                        <input type="radio" class=" NotArrive NoArrive " value="CarNotArrive" name="CarReservationMode" groupid="schSalesContractDetails" argumentid="CarReservationMode" /><label>Not Arrive </label>--%>
                        <%-- CommonDisableClass ElemDisabled default="default" --%>
                        <input type="text" class="text" argumentid="CarNumber" groupid="schSalesContractDetails" style="width:155Px;"/>
        </td>
        <td style="text-align: left;">
           
            <input type="text"  class="text" argumentid="ChassisNo" groupid="schSalesContractDetails" style="width:155Px;"/></td>

        <td style="text-align: left;">
           
            <select loadon="FirstVisible" class="dropdownlist CommonFirstDD  " style="width: 160px;"
                groupid="schSalesContractDetails" argumentid="SalesBrandId" childcombo="SalesModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}" name="D11">
                <option value="" selected="selected">Select Brand</option>
        <%--SalesModelId--%>
            </select>

            <select loadon="FirstVisible" class="dropdownlist CommonSecondDD" style="width: 160px;"
                 groupid="schSalesContractDetails" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}" name="D12">
                <option value="" selected="selected">Select Brand</option>
            </select>
        </td>
        <td style="text-align: left;">
          

                       <select class="dropdownlist  CommonFirstDD" style="width: 160px;" 
                  groupid="schSalesContractDetails" argumentid="SalesModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'SalesBrandId'}]}" name="D9">
                 <option value="" selected="selected">Select Model</option>
              </select>
            <select class="dropdownlist CommonSecondDD" style="width: 160px;"
                 groupid="schSalesContractDetails" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}" name="D10">
                <option value="" selected="selected">Select Model</option>
            </select>
        </td>

        <td style="text-align: left;">
            <%--<select loadon="FirstVisible" valtype="value" class="dropdownlist CommonDisableClass  "   style="width: 135px;" groupid="schSalesContractDetails" argumentid="Salesman" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'39'}]}">
                            <option value="" selected="selected">Select Salesman</option>
                        </select>--%>
          

              <select loadon="FirstVisible" class="dropdownlist   CommonFirstDD" style="width: 160px;"
                groupid="schSalesContractDetails" argumentid="SalesColorId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'6'}]}" name="D7">
                <option value="" selected="selected">Select Color</option>
            </select>

            <select loadon="FirstVisible" class="dropdownlist CommonSecondDD" style="width: 160px;"
                groupid="schSalesContractDetails" argumentid="ColorId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'6'}]}" name="D8">
                <option value="" selected="selected">Select Color</option>
            </select>
            </td>
    </tr>

   
       
    <tr>
        <td style="text-align: left;" class="ftitle">

            <span style="white-space: nowrap">Customer Name</span></td>
        <td style="text-align: left;" class="ftitle">

            <span style="white-space: nowrap">National ID No.</span></td>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">Mobile Telephone</span></td>
        <td style="text-align: left;" class="ftitle">
            <span style="white-space: nowrap">Car Owner National ID No.</span></td>
        <td style="text-align: left;" class="ftitle">
            &nbsp;</td>
    </tr>
    <tr style="height:35px">
        <td style="text-align: left;">
            <input type="text" class="text" argumentid="CustomerName" groupid="schSalesContractDetails" style="width:155Px;"/></td>
        <td style="text-align: left;">
            <input type="text" class="text" argumentid="NationalIDNo" groupid="schSalesContractDetails" style="width:155Px;"/></td>
        <td style="text-align: left;">
            <input type="text" class="text" argumentid="MobileTelephone1" groupid="schSalesContractDetails" style="width:155Px;"/>
        </td>
        <td style="text-align: left;">

            <input type="text" style="text-align: center; width: 155px;" maxlength="12" class="text "
                            groupid="schSalesContractDetails" argumentid="CarOwnerNationalIdNumber" /></td>
  
        
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
