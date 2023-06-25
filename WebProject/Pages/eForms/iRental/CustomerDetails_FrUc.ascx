<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomerDetails_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.CustomerDetails_FrUc" %>

 <table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">

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
                               <input type="text" ID="txtCustomerName" style="text-align: center; font-size:16px;font-weight:bold; width: 300px;" maxlength="199" class="text required"
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

