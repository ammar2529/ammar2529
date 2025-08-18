<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalesContracts_PD_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.SalesContracts_PD_FrUc" %>

<script>
// American Numbering System
var th = ['','thousand','million', 'billion','trillion'];
// uncomment this line for English Number System
// var th = ['','thousand','million', 'milliard','billion'];

    var dg = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'];
    var tn = ['ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen'];
    var tw = ['twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety'];
    function toWords(s) {
        s = s.toString(); s = s.replace(/[\, ]/g, '');
        if (s != parseFloat(s)) return 'not a number'; var x = s.indexOf('.');
        if (x == -1) x = s.length; if (x > 15) return 'too big'; var n = s.split(''); var str = '';
        var sk = 0;
        for (var i = 0; i < x; i++)
        {
            if ((x - i) % 3 == 2)
            {
                if (n[i] == '1')
                { str += tn[Number(n[i + 1])] + ' '; i++; sk = 1; }
                else if (n[i] != 0) { str += tw[n[i] - 2] + ' '; sk = 1; }
            } else if (n[i] != 0) { str += dg[n[i]] + ' '; if ((x - i) % 3 == 0) str += 'hundred '; sk = 1; }
            if ((x - i) % 3 == 1) { if (sk) str += th[(x - i - 1) / 3] + ' '; sk = 0; }
        }
        if (x != s.length)
        { var y = s.length; str += 'point '; for (var i = x + 1; i < y; i++) str += dg[n[i]] + ' '; }
        return str.replace(/\s+/g, ' ');
    }
</script>
 


<script type="text/javascript" src="../../../Scripts/eForms/iRental/SalesContracts.js">

</script>


<div class=" mt-3">
    <div class="row justify-content-center">
      <%--  <div class="col-lg-8 col-md-10 col-sm-12 p-4 bg-light shadow rounded">--%>
            <div class="alert alert-info text-center">
                Use the form below to update the details. Fields marked with an asterisk (*) are mandatory.
            </div>
            <div style="display: none">
                <span groupid="Sales_Payments" argumentid="ParentRecId"></span>
                <span groupid="Sales_Payments" argumentid="RecId"></span>

            </div>
            <!-- System ID and Manual ID -->
            <div class="row mb-3">
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="text" class="form-control AlwaysDisable" id="systemID" placeholder="System ID"
                            groupid="Sales_Payments" argumentid="LocationReceiptId" />
                        <label for="systemID">System ID</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="manualID" placeholder="Manual ID"
                            groupid="Sales_Payments" argumentid="ReceiptId" />
                        <label for="manualID">Manual ID</label>
                    </div>
                </div>
            </div>

            <!-- Payment Date and Salesman -->
            <div class="row mb-3">
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="date" class="form-control date required" id="paymentDate" placeholder="Payment Date"
                            groupid="Sales_Payments" argumentid="PaymentDate" />
                        <label for="paymentDate">Payment Date *</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="salesman" placeholder="Salesman"
                            groupid="Sales_Payments" argumentid="Salesman" disabled />
                        <label for="salesman">Salesman</label>
                    </div>
                </div>
            </div>

            <!-- Payment Type -->
            <div class="row mb-3">
                <div class="col-md-12">
                    <label class="fw-bold">Payment Type *</label>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="PaymentType" id="receipt" value="0" checked
                            groupid="Sales_Payments" argumentid="PaymentType" />
                        <label class="form-check-label" for="receipt">Receipt</label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="PaymentType" id="return" value="1"
                            groupid="Sales_Payments" argumentid="PaymentType" />
                        <label class="form-check-label" for="return">Return</label>
                    </div>
                </div>
            </div>

            <!-- Payment Mode -->
            <div class="row mb-3">
                <div class="col-md-6">
                    <div class="form-floating">
                        <select class="form-select PaymentMode required" id="SalespaymentMode" 
                            groupid="Sales_Payments" argumentid="PaymentMode"  loadon="FirstVisible" 
                            storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'10'}]}">
                            <option value="" selected>Select Payment Mode</option>
                        </select>
                        <label for="SalespaymentMode">Payment Mode *</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <select class="form-select BankName required" id="SalesbankName"
                            groupid="Sales_Payments" argumentid="BankName" loadon="FirstVisible" 
                            storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'38'}]}">
                            <option value="" selected>Select Bank</option>
                        </select>
                        <label for="SalesbankName" class="BankName">Bank *</label>
                    </div>
                </div>
            </div>
            
            <!-- Cheque Fields (Below Payment Mode and Bank) -->
            <div class="row mb-3 BankName ">
                <div class="col-md-4">
                    <div class="form-floating">
                        <input type="text" class="form-control text number ChequeNo" id="SaleschequeNo" placeholder="Cheque No."
                            maxlength="50" groupid="Sales_Payments" argumentid="ChequeNo" requirederr="*" />
                        <label for="SaleschequeNo">Cheque No.</label>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-floating">
                        <input type="text" class="form-control text" id="chequeFrom" placeholder="Cheque From"
                            maxlength="100" groupid="Sales_Payments" alphconf="{allow:'.'}" argumentid="ChequeFrom" />
                        <label for="chequeFrom">Cheque From</label>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-floating">
                        <input type="date" class="form-control text required date ChequeDate CommonDisable" id="chequeDate"
                            placeholder="Cheque Date" maxlength="10" groupid="Sales_Payments" argumentid="ChequeDate" requirederr="*" />
                        <label for="chequeDate">Cheque Date *</label>
                    </div>
                </div>
            </div>
            <!-- Payment Amount -->
            <div class="row mb-3">
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="text" class="form-control number required" id="paymentAmount" placeholder="Payment Amount"
                            groupid="Sales_Payments" argumentid="PaymentAmount" />
                        <label for="paymentAmount">Payment Amount *</label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-floating">
                        <input type="text" class="form-control bg-light AlwaysDisable" id="amountInWords"
                            placeholder="Amount In Words" groupid="Sales_Payments" argumentid="AmountInWords" disabled />
                        <label for="amountInWords">Amount In Words</label>
                    </div>
                </div>
            </div>

            <!-- Payment For -->
            <div class="row mb-3">
                <div class="col-md-12">
                    <div class="form-floating">
                        <textarea class="form-control" placeholder="Payment For" id="paymentFor" rows="4"
                            groupid="Sales_Payments" argumentid="PaymentFor"></textarea>
                        <label for="paymentFor">Payment For</label>
                    </div>
                </div>
            </div>

            <!-- Comments -->
            <div class="row mb-3">
                <div class="col-md-12">
                    <div class="form-floating">
                        <textarea class="form-control" placeholder="Comments" id="paymentComments" rows="4"
                            groupid="Sales_Payments" argumentid="PaymentComments"></textarea>
                        <label for="paymentComments">Comments</label>
                    </div>
                </div>
            </div>

            <!-- Action Buttons -->
<div class="row justify-content-center">
    <div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3 col-xxl-3 d-flex justify-content-end mb-2">
        <button type="button" class="btn btn-primary SaveBtn DataAction w-100"
            conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts_Payments',HideOnSuccess:true}">
            Save
        </button>
    </div>
    <div class="col-12 col-sm-12 col-md-6 col-lg-3 col-xl-3 col-xxl-3 d-flex justify-content-start mb-2">
        <button type="button" class="btn btn-secondary CloseForm closedForm w-100">
            Cancel
        </button>
    </div>
</div>

        </div>
    </div>
<%--</div>--%>



<%--<table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table b SalesPaymentFRPanel">

    <tr id="trNote">
        <td colspan="2" style="padding-top: 10px; padding-bottom: 10px">Use the form below to update the details, fields marked with an asterisk (*) are mandatory
        </td>
    </tr>


  
      <tr>
        <td width="20%" class="ftitle" valign="top">
        <nobr>System ID</nobr>
      </td>
      <td width="80%">
      <div style="float:left;width:300px"> 
        <input type="text" style="text-align:center; width:150px; font-weight:bold; background-color:#F1F1F1"  maxlength="50" class="text AlwaysDisable"
              groupid="Sales_Payments" argumentid="LocationReceiptId" />
              &nbsp;&nbsp;&nbsp;&nbsp;
              <nobr style="font-style:italic; font-weight:bold; float:right">Manual ID:</nobr></div>
              &nbsp;
           <input type="text" style="text-align:center; width:150px; font-weight:bold"  maxlength="10" class="text number"
              groupid="Sales_Payments" argumentid="ReceiptId" />

              <div style="display:none">
                  <span groupid="Sales_Payments" argumentid="ParentRecId"></span>
              <span groupid="Sales_Payments" argumentid="RecId"></span>
              
              </div>

        
              </td>
  </tr>

    <tr>
        <td class="ftitle">
            <nobr>Payment Date*:</nobr>
        </td>
        <td >
            <input type="text" groupid="Sales_Payments" maxlength="10"
                style="width: 150px;" class="text required date" requirederr='*' argumentid="PaymentDate" />
            <nobr style="margin-left:56px;" class="ftitle">Salesman: </nobr><span style="margin-left:9px" class="ftitle" groupid="Sales_Payments" argumentid="Salesman"></span>

        </td>
    </tr>

    <tr>
        <td class="ftitle">
            <nobr>Payment Type*:</nobr>
        </td>
        <td >
            <input type="radio" checked="checked" default="default" value="0" name="PaymentType" groupid="Sales_Payments" argumentid="PaymentType"/><label>Receipt</label>
            <input type="radio" value="1" name="PaymentType" groupid="Sales_Payments" argumentid="PaymentType"/><label>Return</label>
        </td>
    </tr>

    <tr class="PaymentModedd">
        <td class="ftitle" rowspan="2">
            <nobr>Payment Mode*:</nobr>
        </td>
        <td >
            <div class=" parentDiv">
                <select loadon="FirstVisible" class="dropdownlist required PaymentMode" requirederr='*' style="width: 155px;margin-right:5px"
                    groupid="Sales_Payments" argumentid="PaymentMode" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'10'}]}">
                    <option value="" selected="selected">Select Payment Mode</option>
                </select>
                 &nbsp;

                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <nobr class="ftitle bankLabel">Bank*:</nobr><select loadon="FirstVisible" class="dropdownlist BankName" style="width: 170px; margin-left: 5px;"
     groupid="Sales_Payments" requirederr='*' argumentid="BankName" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'38'}]}" name="D2">
     <option value="" selected="selected"  >Select Bank</option>
     
 </select>
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<nobr class="ftitle ChequeLable">Cheque No.: </nobr><input type="text" style="text-align: center; width: 150px;" maxlength="50" class="text number ChequeNo"
                                     groupid="Sales_Payments" argumentid="ChequeNo"  requirederr='*'/>         
                  </div>
             
            </td>
    </tr>

    <tr class="PaymentMetthodDetails">
        <td >

                                   
               
            <nobr style="font-style: italic; font-weight: bold;" float="left" class="BankName"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;    
                <span class="ftitle">Cheque From: </span><input type="text" style="text-align: center; width: 165px;margin-right:4px" maxlength="100" class="text  "
groupid="Sales_Payments" alphconf="{allow:'.'}"  argumentid="ChequeFrom" />   <nobr style="font-style: italic; font-weight: bold; class="ChequeNo a"></nobr> 
                &nbsp;
            <nobr style="font-style: italic; font-weight: bold; class="ChequeNo a">Cheque Date*:</nobr>
                <input argumentid="ChequeDate" class="text required date ChequeDate CommonDisable" groupid="Sales_Payments" maxlength="10" requirederr=" *" style="width: 75px;" type="text" />

            </td>
    </tr>

    <tr>
        <td class="ftitle">
            <nobr>Payment Amount*:</nobr>
        </td>
        <td >
            <div style="float: left; width: 300px">
                <input type="text" style="text-align: center; width: 150px;" maxlength="10" class="text number required"
                    groupid="Sales_Payments" alphconf="{allow:'.'}" requirederr='*' argumentid="PaymentAmount" />
                &nbsp;&nbsp;&nbsp;&nbsp;

                                    <nobr style="font-style: italic; font-weight: bold; float: right">Amount In Words:</nobr>
            </div>
            &nbsp;
                                      <input type="text" style="text-align: center; width: 400px; background-color: #F1F1F1" maxlength="255" class="text AlwaysDisable" argumentid="AmountInWords"  groupid="Sales_Payments"/>

        </td>
    </tr>


     <tr>
        <td class="ftitle" valign="top">
            <nobr>Payment For:</nobr>
        </td>
        <td >
            <textarea class="textarea" rows="4" wrap="1" style="width: 707px" argumentid="PaymentFor" groupid="Sales_Payments"></textarea></td>
    </tr>
    
    <tr>
        <td class="ftitle" valign="top">
            <nobr>Comments:</nobr>
        </td>
        <td >
            <textarea class="textarea" rows="4" wrap="1" style="width: 707px" argumentid="PaymentComments" groupid="Sales_Payments"></textarea></td>
    </tr>

    <tr>
        <td colspan="2">
            <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
        </td>
    </tr>

    <tr>
        <td>
            <img src="App_Themes/eForms_Theme/Images/spacer.gif"/>
        </td>
        <td >
            <input type="button" value="  Save  " class="DataAction ButtonStyle SaveBtn" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts_Payments',HideOnSuccess:true }" />
            <input type="button" value="  Cancel  " class="CloseForm ButtonStyle closedForm" />
        </td>
    </tr>



</table>
--%>
