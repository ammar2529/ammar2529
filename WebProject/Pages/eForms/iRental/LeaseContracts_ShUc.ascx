<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeaseContracts_ShUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.LeaseContracts_ShUc" %>

 <table class="w-form-table" cellspacing="2" style="width:100%">
            <tr>
                <td style=" text-align: left;" class="ftitle" width="20%">
                    <span>Contract No.</span>
                </td>
                <td style=" text-align: left;" class="ftitle" width="20%">
                       <span style="white-space:nowrap">Car Number</span></td>
                <td style=" text-align: left;" class="ftitle" width="20%">
                      <span style="white-space:nowrap">Brand</span></td>
                <td style=" text-align: left;" class="ftitle" width="20%">
                      <span style="white-space:nowrap">Model</span></td>
                       <td style=" text-align: left;" class="ftitle" width="20%">
                      <span style="white-space:nowrap">Year</span></td>
              <%--  <td style=" text-align: left;" class="ftitle" width="20%">
                      <span style="white-space:nowrap">Salesman</span></td>--%>

                                      <td style=" text-align: left;" class="ftitle" rowspan="2">
     </td>
            </tr>
            <tr>
                <td style=" text-align: left;">
                <input type="text" class="text" argumentid="RecCode" groupid="schContractDetails" />
                </td>
                <td style=" text-align: left;">
                <input type="text" class="text" argumentid="CarNumber" groupid="schContractDetails" /></td>
                <td style=" text-align: left;">
                    <select loadon="FirstVisible" class="dropdownlist" style="width: 135px;"
                            groupid="schContractDetails" argumentid="BrandId" childcombo="ModelId" 
                           storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}" 
                           name="D3">
                            <option value="" selected="selected">Select Brand</option>
                    </select></td>
                <td style=" text-align: left;">
               <select class="dropdownlist" style="width: 135px;"
                            groupid="schContractDetails" argumentid="ModelId" 
                                        storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}" 
                                        name="D2">
                            <option value="" selected="selected">Select Model</option>
                        </select>

                </td>
                                        <td style=" text-align: left;">
                              <select loadon="FirstVisible" class="dropdownlist" style="width: 135px;"
                            groupid="schContractDetails" argumentid="CarYearId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'4'}]}">
                            <option value="" selected="selected">Select Year</option>
                    </select>
                </td>

                
                                        <td style=" text-align: left;">
                              <%--<select loadon="FirstVisible" valtype="value" class="dropdownlist CommonDisableClass  "   style="width: 135px;" groupid="SalesContractsForm" argumentid="Salesman" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'39'}]}">
                            <option value="" selected="selected">Select Salesman</option>
                        </select>--%>
                </td>
            </tr>
             <tr>

             <td colspan="6">
             &nbsp;
             </td>

             </tr>

            <tr>
                <td style=" text-align: left;" class="ftitle">
                <span style="white-space:nowrap">Out Location</span></td>
                <td style=" text-align: left;" class="ftitle">

                <span style="white-space:nowrap">National ID No.</span></td>
                <td style=" text-align: left;" class="ftitle">
                       <span style="white-space:nowrap">Customer Name</span></td>
                <td style=" text-align: left;" class="ftitle" colspan="2">
                      <span style="white-space:nowrap">Contract Status</span>
                </td>
                <td style=" text-align: left;">

                    &nbsp;</td>
            </tr>
            <tr>
                <td style="text-align: left;">
                    <select loadon="FirstVisible" class="dropdownlist" style="width: 135px;"
                            groupid="schContractDetails" argumentid="OutLocationId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'11'}]}">
                            <option value="" selected="selected">Select Location</option>
                    </select>

          
                </td>
                <td style="text-align: left;">
                   <input type="text"  class="text" argumentid="NationalIDNo" groupid="schContractDetails" /> 
                </td>
                <td style="text-align: left;">
                <input type="text" class="text" argumentid="CustomerName" groupid="schContractDetails" />
                </td>
                <td style="text-align: left;" colspan="2">

                    <select class="dropdownlist" style="width: 300px;"
                            groupid="schContractDetails" argumentid="StateId" name="D4">
                            <option value="" selected="selected">Select Status</option>
                            <option value="">-----------------------------</option>
                            <option value="RRCCreatedState">Created - Reservation</option>
                            <option value="">-----------------------------</option>
							<option value="RRCContractOpen">Contract Open - Car Out</option>
                            <option value="">-----------------------------</option>
							<option value="RRCContractOpenCarIn" style="color:red">Contract Open - Car In</option>
							<option value="RRCWithLegalContractOpenCarOut" style="color:red">With Legal - Contract Open - Car Out</option>
							<option value="RRCWithLegalContractOpenCarIn" style="color:red">With Legal - Contract Open - Car In</option>
							<option value="RRCWithLegalContractClosedPendingPayment" style="color:red">With Legal - Contract Closed - Pending Payment</option>
                            <option value="RRCContractClosedPendingPayment" style="color:red">Contract Closed - Pending Payment</option>
                            <option value="">-----------------------------</option>
							<option value="RRCContractClosed" style="color:Green">Contract Closed - Payment Cleared</option>
                            <option value="">-----------------------------</option>
							<option value="RRCContractCancelled">Contract Cancelled</option>
                            <option value="">-----------------------------</option>
                    </select></td>
                <td style="text-align: left; padding-bottom: 0px;white-space:nowrap">
                    <a href="javascript:void(0);" class="search ViewButton">
                        <img alt="" height="22px" width="47px" src="App_Themes/eForms_Theme/Images/spacer.gif"
                            border="0" /></a> <a href="javascript:void(0);" class="reset ClearButton">
                                <img alt="" height="22px" width="47px" src="App_Themes/eForms_Theme/Images/spacer.gif"
                                    border="0" /></a>
                </td>
            </tr>
            </table>