<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalesContracts_PD_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.SalesContracts_PD_FrUc" %>

<script>
    // American Numbering System
    var th = ['', 'thousand', 'million', 'billion', 'trillion'];
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
        for (var i = 0; i < x; i++) {
            if ((x - i) % 3 == 2) {
                if (n[i] == '1') { str += tn[Number(n[i + 1])] + ' '; i++; sk = 1; }
                else if (n[i] != 0) { str += tw[n[i] - 2] + ' '; sk = 1; }
            } else if (n[i] != 0) { str += dg[n[i]] + ' '; if ((x - i) % 3 == 0) str += 'hundred '; sk = 1; }
            if ((x - i) % 3 == 1) { if (sk) str += th[(x - i - 1) / 3] + ' '; sk = 0; }
        }
        if (x != s.length) { var y = s.length; str += 'point '; for (var i = x + 1; i < y; i++) str += dg[n[i]] + ' '; }
        return str.replace(/\s+/g, ' ');
    }
</script>



<script type="text/javascript" src="../../../Scripts/eForms/iRental/SalesContracts.js">

</script>


    <div class="card mt-2" style="border: 0.5px solid #ede5e5; border-radius: 7px;">
        <div class="card-body">
   

            <div class="row">
                <div class="col-sm-12">

                    <!-- System ID and Manual ID -->
                    <div class="row ">
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



                        <div style="display: none">
                            <span groupid="Sales_Payments" argumentid="ParentRecId"></span>
                            <span groupid="Sales_Payments" argumentid="RecId"></span>

                        </div>
                    </div>

                    <!-- Payment Date and Salesman -->
                    <div class="row ">
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
                    <div class="row mt-4">

                        <div class="col-12 col-sm-12 col-md-12 col-lg-4  align-self-end">
                            <label for="floatingLimited" class="me-3">
                                <small>Payment Type*</small>
                            </label>
                            <div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input CommonDisableClass cash" type="radio" id="receipt" checked="checked" value="0" name="PaymentType" argumentid="PaymentType" groupid="Sales_Payments">
                                    <label class="form-check-label" for="receipt">Receipt</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input CommonDisableClass finance" type="radio" id="return" value="1" name="PaymentType" argumentid="PaymentType" groupid="Sales_Payments">
                                    <label class="form-check-label" for="return">Return</label>
                                </div>
                            </div>
                        </div>


                    </div>

                    <!-- Payment Mode -->
                    <div class="row ">

                        <div class="col-12 col-sm-12 col-md-12 col-lg-4 ">

                            <div class="custom-floating">
                                <select class="form-select PaymentMode" id="SalespaymentMode" aria-label="Custom floating label select" loadon="FirstVisible"
                                    groupid="Sales_Payments" argumentid="PaymentMode" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'10'}]}">
                                    <option value="" selected></option>

                                </select>
                                <label for="SalespaymentMode">Payment Mode*</label>
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="form-floating">
                                <select class="form-select BankName required" id="SalesbankName"
                                    groupid="Sales_Payments" argumentid="BankName" loadon="FirstVisible"
                                    storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'38'}]}">
                                    <option value="" selected>Select Bank</option>
                                </select>
                                <label for="SalesbankName" class="BankName">Bank*</label>
                            </div>
                        </div>
                    </div>

                    <!-- Cheque Fields (Below Payment Mode and Bank) -->
                    <div class="row  BankName ">
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
                    <div class="row ">
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
                    <div class="row ">
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
        </div>
    </div>







