<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeaseContracts_PD_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.LeaseContracts_PD_FrUc" %>

<script>
    // American Numbering System
    var th = [ '', 'thousand', 'million', 'billion', 'trillion' ];
    // uncomment this line for English Number System
    // var th = ['','thousand','million', 'milliard','billion'];

    var dg = [ 'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' ]; var tn = [ 'ten', 'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen' ]; var tw = [ 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety' ]; function toWords(s) { s = s.toString(); s = s.replace(/[\, ]/g, ''); if (s != parseFloat(s)) return 'not a number'; var x = s.indexOf('.'); if (x == -1) x = s.length; if (x > 15) return 'too big'; var n = s.split(''); var str = ''; var sk = 0; for (var i = 0; i < x; i++) { if ((x - i) % 3 == 2) { if (n[ i ] == '1') { str += tn[ Number(n[ i + 1 ]) ] + ' '; i++; sk = 1; } else if (n[ i ] != 0) { str += tw[ n[ i ] - 2 ] + ' '; sk = 1; } } else if (n[ i ] != 0) { str += dg[ n[ i ] ] + ' '; if ((x - i) % 3 == 0) str += 'hundred '; sk = 1; } if ((x - i) % 3 == 1) { if (sk) str += th[ (x - i - 1) / 3 ] + ' '; sk = 0; } } if (x != s.length) { var y = s.length; str += 'point '; for (var i = x + 1; i < y; i++) str += dg[ n[ i ] ] + ' '; } return str.replace(/\s+/g, ' '); }
</script>

<table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">

    <tr id="trNote">
        <td colspan="2" style="padding-top: 10px; padding-bottom: 10px">Use the form below to update the details, fields marked with an asterisk (*) are mandatory
        </td>
    </tr>
    <tr>
        <td width="20%" class="ftitle" valign="top">
            <nobr>System ID</nobr>
        </td>
        <td width="80%">
            <div style="float: left; width: 300px">
                <input type="text" style="text-align: center; width: 150px; font-weight: bold; background-color: #F1F1F1" maxlength="50" class="text AlwaysDisable"
                    groupid="Lease_Payments" argumentid="LocationReceiptId" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                                    <nobr style="font-style: italic; font-weight: bold; float: right">Manual ID:</nobr>
            </div>
            &nbsp;
                                             <input type="text" style="text-align: center; width: 150px; font-weight: bold" maxlength="10" class="text number"
                                                 groupid="Lease_Payments" argumentid="ReceiptId" />

            <div style="display: none">
                <span groupid="Lease_Payments" argumentid="ParentRecId"></span>
                <span groupid="Lease_Payments" argumentid="RecId"></span>

            </div>


        </td>
    </tr>

    <tr>
        <td class="ftitle">
            <nobr>Payment Date*:</nobr>
        </td>
        <td>
            <input type="text" groupid="Lease_Payments" maxlength="10"
                style="width: 150px;" class="text date" argumentid="PaymentDate" />
        </td>
    </tr>

    <tr>
        <td class="ftitle">
            <nobr>Payment Type*:</nobr>
        </td>
        <td class="ftitle">
            <input type="radio" checked="checked" default="default" value="0" name="PaymentType" groupid="Lease_Payments" argumentid="PaymentType" /><label>Receipt</label>
            <input type="radio" value="1" name="PaymentType" groupid="Lease_Payments" argumentid="PaymentType" /><label>Return</label>
        </td>
    </tr>

   

 <tr class="PaymentModeddLease">
        <td class="ftitle" rowspan="2">
            <nobr>Payment Mode*:</nobr>
        </td>
        <td class="auto-style3">
            <div class="auto-style1 parentDiv">
                <select loadon="FirstVisible" class="dropdownlist" requirederr='*' style="width: 155px;"
                    groupid="Lease_Payments" argumentid="PaymentMode" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'10'}]}">
                    <option value="" selected="selected">Select Payment Mode</option>
                </select>
                &nbsp;

                                   
                  </div>
             
            &nbsp;
           
             
            &nbsp;</td>
    </tr>

     <tr class="PaymentMetthodDetailsLease">
        <td class="auto-style3">

                                   
               
            <nobr style="font-style: italic; font-weight: bold;" float="left" class="BankName">&nbsp;Bank*:</nobr>
            
            <select loadon="FirstVisible" class="dropdownlist BankName" style="width: 155px; margin-left: 5px;"
                groupid="Lease_Payments" requirederr='*' argumentid="BankName" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'38'}]}" name="D2">
                <option value="" selected="selected"  >Select Bank</option>
                
            </select><nobr style="font-style: italic; font-weight: bold; class="ChequeNo a">&nbsp; Cheque No*:</nobr> 
                <input type="text" style="text-align: center; width: 150px;" maxlength="50" class="text number ChequeNo"
                                                     groupid="Lease_Payments" argumentid="ChequeNo"  requirederr='*'/>&nbsp;
            <nobr style="font-style: italic; font-weight: bold; class="ChequeNo a">Cheque Date*:</nobr>
                <input argumentid="ChequeDate" class="text required date ChequeDate CommonDisable" groupid="Lease_Payments" maxlength="10" requirederr=" *" style="width: 75px;" type="text" />

            </td>
    </tr>

    <tr>
        <td class="ftitle">
            <nobr>Payment Amount*:</nobr>
        </td>
        <td>
            <div style="float: left; width: 300px">
                <input type="text" style="text-align: center; width: 150px;" maxlength="10" class="text number"
                    groupid="Lease_Payments" alphconf="{allow:'.'}" argumentid="PaymentAmount" />
                &nbsp;&nbsp;&nbsp;&nbsp;

                                    <nobr style="font-style: italic; font-weight: bold; float: right">Amount In Words:</nobr>
            </div>
            &nbsp;
                                      <input type="text" style="text-align: center; width: 400px; background-color: #F1F1F1" maxlength="255" class="text AlwaysDisable"
                                          groupid="Lease_Payments" argumentid="AmountInWords" />
        </td>
    </tr>

       <tr>
        <td class="ftitle" valign="top">
            <nobr>Payment For:</nobr>
        </td>
        <td class="auto-style3">
            <textarea class="textarea" rows="4" wrap="1" style="width: 707px" argumentid="PaymentFor" groupid="Lease_Payments"></textarea></td>
    </tr>

    <tr>
        <td colspan="2">
            <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
        </td>
    </tr>
    <tr>
        <td class="ftitle" valign="top">
            <nobr>Comments:</nobr>
        </td>
        <td>
            <textarea class="textarea" rows="4" wrap="1" style="width: 707px" argumentid="PaymentComments" groupid="Lease_Payments"></textarea></td>
    </tr>

    <tr>
        <td colspan="2">
            <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
        </td>
    </tr>

    <tr>
        <td>
            
        </td>
        <td>
            <input type="button" value="  Save  " class="DataAction ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Lease_Contracts_Payments',HideOnSuccess:true}" />
            <input type="button" value="  Cancel  " class="CloseForm ButtonStyle" />
        </td>
    </tr>
</table>


<%--            <table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">

                                        <tr id="trNote">
                <td colspan="2" style="padding-top:10px;padding-bottom:10px">
                    Use the form below to update the details, fields marked with an asterisk (*) are mandatory
                </td>
            </tr>
          
                     <tr>
                            <td class="ftitle">
                                <nobr>Customer Code:</nobr>
                            </td>
                            <td width="100%">

                                    <div style="display:none"><span groupid="CustomersForm" argumentid="RecId"></span></div>
                                    <div><span groupid="CustomersForm" argumentid="RecCode" style="font-style:italic;font-weight:bold">New customer code will be generated on saving</span></div>

                            </td> 
                        </tr>
                         
                                                            <tr>
                            <td class="ftitle">
                                <nobr>Customer Type:</nobr>
                            </td>
                            <td>

                               <input type="radio" checked="checked" default="default" value="Local" name="CustomerType" groupid="CustomersForm" argumentid="CustomerType"><label>Local Residence</label>
                               <input type="radio" value="International" name="CustomerType" groupid="CustomersForm" argumentid="CustomerType"><label>International - On Visit</label>
                            </td>
                        </tr>

                        
                                            <tr>
                            <td class="ftitle">
                                <nobr>Gender:</nobr>
                            </td>
                            <td>
                               <input type="radio" checked="checked" default="default" value="Male" name="Gender" groupid="CustomersForm" argumentid="Gender"><label>Male</label>
                               <input type="radio" value="Female" name="Gender" groupid="CustomersForm" argumentid="Gender"><label>Female</label>
                            </td>
                        </tr>
                               <tr>
                            <td class="ftitle">
                                <nobr>Customer Name*:</nobr>
                            </td>
                            <td>
                               <input type="text" id="txtCustomerName" style="text-align: center; font-size:16px;font-weight:bold; width: 300px;" maxlength="199" class="text required"
                                    groupid="CustomersForm"  argumentid="CustomerName" />

                            </td> 
                        </tr>

                                                   <tr>
                            <td class="ftitle">
                                <nobr>Nationality*:</nobr>
                            </td>
                            <td>
                                <select loadon="FirstVisible" class="dropdownlist required" style="width: 215px;"
                                    groupid="CustomersForm" argumentid="Nationality" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'1'}]}">
                                    <option value="" selected="selected">Select Nationality</option>
                                </select>
                            </td>
                        </tr>
                                 <tr>
                            <td colspan="2">
                                <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
                            </td>
                        </tr>

                                  <tr>
                            <td class="ftitle">
                                
                            </td>
                            <td>
                                <img height="10" src="App_Themes/eForms_Theme/Images/spacer.gif" width="154">

                                    <nobr class="ftitle">Expiry Date (dd/mm/yyyy)</nobr> 
                            </td>
                        </tr>

                        <tr>
                            <td class="ftitle">
                                <nobr>Passport No:</nobr>
                            </td>
                            <td>
                                <asp:TextBox ID="txtPassportNo" runat="server" groupid="CustomersForm" MaxLength="50"
                                    Width="150px" class="text alphanumericspacedot" argumentid="PassportNo" />

                                    <asp:TextBox ID="txtPassportExpiry" runat="server" groupid="CustomersForm" MaxLength="10"
                                    Width="150px" class="date text" argumentid="PassportExpiry" /> 
                            </td>
                        </tr>
                                        <tr>
                            <td class="ftitle">
                                <nobr>National ID No:</nobr>
                            </td>
                            <td>
                                <asp:TextBox ID="txtNationalIDNo" runat="server" groupid="CustomersForm" MaxLength="50"
                                    Width="150px" class="text alphanumericspacedot" argumentid="NationalIDNo" />

                                             <asp:TextBox ID="txtNationalIDExpiryDate" runat="server" groupid="CustomersForm" MaxLength="50"
                                    Width="150px" class="date text" argumentid="NationalIDExpiryDate" />
                            </td>
                        </tr>
                                        <tr>
                            <td class="ftitle">
                                <nobr>Driving License No:</nobr>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDrivingLicenseNo" runat="server" groupid="CustomersForm" MaxLength="50"
                                    Width="150px" class="text alphanumericspacedot" argumentid="DrivingLicenseNo" />

                                     <asp:TextBox ID="txtDrivingLicenseExpiry" runat="server" groupid="CustomersForm" MaxLength="50"
                                    Width="150px" class="date text required" argumentid="DrivingLicenseExpiry" />
                            </td>
                        </tr>

                        <tr>
                            <td colspan="2">
                                <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
                            </td>
                        </tr>
                        <tr>
                            <td class="ftitle">
                                <nobr>Work Telephone:</nobr>
                            </td>
                            <td>
                                <asp:TextBox ID="WorkTelephone" runat="server" MaxLength="8" Width="150px" class="text number"
                                    groupid="CustomersForm" argumentid="WorkTelephone"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="ftitle">
                             <nobr>Residence Telephone:</nobr>
                            </td>
                            <td>
                                <asp:TextBox ID="ResidenceTelephone" runat="server" MaxLength="8" Width="150px" class="text number"
                                    groupid="CustomersForm" argumentid="ResidenceTelephone"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="ftitle">
                                <nobr>Mobile Telephone:</nobr>
                            </td>
                            <td>
                                <asp:TextBox ID="MobileTelephone1" runat="server" groupid="CustomersForm" MaxLength="8"
                                    Width="150px" class="text number" argumentid="MobileTelephone1"></asp:TextBox>

                                    <asp:TextBox ID="MobileTelephone2" runat="server" groupid="CustomersForm" MaxLength="8"
                                    Width="150px" class="text number" argumentid="MobileTelephone2"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <img src="App_Themes/eForms_Theme/Images/spacer.gif">
                            </td>
                            <td class="smalltext">
                                Enter the phone number without country code, E.g. <b>24045607</b>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
                            </td>
                        </tr>
                        <tr>
                            <td class="ftitle">
                                <nobr>Contact Email Address:</nobr>
                            </td>
                            <td>
                                <asp:TextBox ID="EmailAddress" runat="server" MaxLength="99" Width="235px" class="text email"
                                    groupid="CustomersForm"  argumentid="EmailAddress"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="2">
                                <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
                            </td>
                        </tr>

                        
                                            <tr>
                            <td class="ftitle">
                                <nobr>Customer Status:</nobr>
                            </td>
                            <td>

                               <input type="radio" checked="checked" default="default" value="Active" name="CustomerStatus" groupid="CustomersForm" argumentid="CustomerStatus"><label>Active</label>
                               <input type="radio" value="Blacklisted" name="CustomerStatus" groupid="CustomersForm" argumentid="CustomerStatus"><label>Blacklisted</label>
                            </td>
                        </tr>

                                  <tr>
                            <td colspan="2">
                                <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
                            </td>
                        </tr>

                        <tr>
                              <td class="ftitle">

                            </td>
                            <td>
                                        <table border="0" cellpadding="0" cellspacing="0"> 
                                                            <tr>
                                        <td class="ftitle" >
                                        <nobr>Customer Address</nobr>
                                        </td>
                                        <td class="ftitle" style="padding-left:5px"">
                                         <nobr>Customer Notes</nobr>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width:50%">
                                    <textarea class="textarea"  rows="6" wrap="1" cols="37" argumentid="Address" groupid="CustomersForm" ></textarea>
                                        </td>
                                        <td style="width:50%; padding-left:5px">
                                    <textarea class="textarea"  rows="6" wrap="1" cols="37" argumentid="CustomerNotes" groupid="CustomersForm" ></textarea>
                                        </td>
                                    </tr>
                                           
                                </table>
                            </td>
                        </tr>
                     
                        <tr>
                            <td colspan="2">
                                <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
                            </td>
                        </tr>
                       
                        <tr>
                            <td>
                                <img src="App_Themes/eForms_Theme/Images/spacer.gif">
                            </td>
                            <td>
                      <input type="button" value="  Save  " class="DataAction ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Customers',HideOnSuccess:true}">
                      <input type="button" value="  Cancel  " class="CloseForm ButtonStyle">
                            </td>
                        </tr>
                    </table>
--%>
