<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CarTransfers_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.CarTransfers_FrUc" %>

<table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">

                                        <tr id="trNote">
                <td colspan="4" style="padding-top:10px;padding-bottom:10px">
                    Use the form below to update the details, fields marked with an asterisk (*) are mandatory
                </td>
            </tr>
                       
                                                <tr>
                            <td class="ftitle">
                                <nobr>Transfer Date*:</nobr>
                            </td>
                            <td colspan="3">
                            <div style="display:none"><span groupid="CarsTransferForm" argumentid="RecId"></span></div>
                             <input type="text" style="text-align:center; width:150px;font-weight:bold" maxlength="10" class="text date required" groupid="CarsTransferForm" argumentid="TransferDate" />
                            </td>
                        </tr>

                                             <tr>
                            <td class="ftitle">
                                <nobr>Car Number*:</nobr>
                            </td>
                            <td colspan="3">
                        <input type="text" style="text-align:center;width:150px; font-weight:bold;color:red"  maxlength="10" class="text required AutoComplete"
                                    groupid="CarsTransferForm"  argumentid="CarNumber" conf="{ActorId:'DataHelper',ActionId:'AutoComplete',StoreId:'FX_SEL_Common_LOV_AutoComplete',QueryId:'iRental_Cars_Transfers',ACParams:{minChars:2,autoFill:false,width:350},ArgToSet:[{Index:4,Name:'CurrentMileage'},{Index:4,Name:'OutMileage'},{Index:5,Name:'OutLocationId'}]}"/>

                        </td> 
                        </tr>

                                                <tr>
                            <td class="ftitle">
                                <nobr>Current Mileage*:</nobr>
                            </td>
                            <td colspan="3">
                                       <input type="text" style="text-align:center; width:150px;font-weight:bold" disabled="disabled" maxlength="10" class="text required number"
                                    groupid="CarsTransferForm"  argumentid="CurrentMileage" />
                            </td>
                        </tr>

                                 <tr>
                            <td colspan="4">
                                <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
                            </td>
                        </tr>

                                                                        <tr>
                            <td class="ftitle">
                                <nobr>Out Location*:</nobr>
                            </td>
                            <td  width="40%">
                                                                                 <select loadon="FirstVisible" class="dropdownlist required" style="width: 155px;"
                            groupid="CarsTransferForm" argumentid="OutLocationId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'11'}]}">
                            <option value="" selected="selected">Select Location</option>
                    </select>
                            </td>
                                    <td class="ftitle" style="padding-right:20px">
                                <nobr>In Location*:</nobr></td>
                            <td  width="60%">
                                                                                 <select loadon="FirstVisible" class="dropdownlist required" style="width: 155px;"
                            groupid="CarsTransferForm" argumentid="InLocationId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'11'}]}">
                            <option value="" selected="selected">Select Location</option>
                    </select></td>
                        </tr>

                                                                        <tr>
                            <td class="ftitle">
                                <nobr>Out Mileage*:</nobr>
                            </td>
                            <td>
                                       <input type="text" style="text-align:center;width:150px;"  maxlength="10" class="text required number"
                                    groupid="CarsTransferForm"  argumentid="OutMileage" />
                            </td>
                            <td class="ftitle">
                                <nobr>In Mileage:</nobr></td>
                            <td>
                                       <input type="text" style="text-align:center;width:150px;"  maxlength="10" class="text number"
                                    groupid="CarsTransferForm"  argumentid="InMileage" /></td>
                        </tr>

                                                                                                <tr style="display:none">
                            <td class="ftitle">
                                <nobr>Out Time:</nobr>
                            </td>
                            <td>
                                       <input type="text" style="text-align:center;width:150px;"  maxlength="10" class="text"
                                    groupid="CarsTransferForm"  argumentid="TimeOut" />
                            </td>
                                      <td class="ftitle">
                                <nobr>In Time:</nobr></td>
                            <td>
                                       <input type="text" style="text-align:center;width:150px;"  maxlength="10" class="text"
                                    groupid="CarsTransferForm"  argumentid="TimeIn" /></td>
                        </tr>

                                                                    <tr>
                            <td colspan="4">
                                <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
                            </td>
                        </tr>


                                                                                                <tr>
                            <td class="ftitle">
                             <nobr>Driver:</nobr>
                            </td>
                            <td colspan="3">
                                    <select loadon="FirstVisible" class="dropdownlist" style="width: 155px;"
                            groupid="CarsTransferForm" argumentid="DriverId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'27'}]}">
                            <option value="" selected="selected">Select Driver</option>
                    </select>                                              
                            </td>
                        </tr>


                                            <tr>
                            <td colspan="4">
                                <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
                            </td>
                        </tr>

                       <tr>
                            <td>
                                <img src="App_Themes/eForms_Theme/Images/spacer.gif">
                            </td>
                            <td colspan="3" >

                                                  <input type="button" value="  Save  " class="DataAction ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Cars_Transfers',HideOnSuccess:true}">
                      <input type="button" value="  Cancel  " class="CloseForm ButtonStyle">                   
                                
                            </td>
                        </tr>
                    </table>
