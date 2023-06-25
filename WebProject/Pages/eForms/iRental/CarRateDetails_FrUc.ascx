<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CarRateDetails_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.CarRateDetails_FrUc" %>

  <table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">

                                        <tr id="trNote">
                <td colspan="2" style="padding-top:10px;padding-bottom:10px">
                    Use the form below to update the details, fields marked with an asterisk (*) are mandatory
                </td>
            </tr>
                      <tr>
                            <td class="ftitle">
                                <nobr>Rate Type*:</nobr>
                            </td>
                            <td width="100%">
                            <div style="display:none"><span groupid="CarsRateForm" argumentid="RecId"></span></div>
                                    <select loadon="FirstVisible" class="dropdownlist required" style="width: 155px;"
                                            groupid="CarsRateForm" argumentid="RateTypeId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'26'}]}">
                                            <option value="" selected="selected">Select Rate Type</option>
                                    </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="ftitle">
                                <nobr>Brand*:</nobr>
                            </td>
                            <td>
                                    <select loadon="FirstVisible" class="dropdownlist required" style="width: 155px;"
                                            groupid="CarsRateForm" argumentid="BrandId" childcombo="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'2'}]}">
                                            <option value="" selected="selected">Select Brand</option>
                                    </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="ftitle">
                                <nobr>Model*:</nobr>
                            </td>
                            <td>
                                     <select class="dropdownlist required" style="width: 155px;"
                                    groupid="CarsRateForm" argumentid="ModelId" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'3'},{SPParamName:'SubParentTypeId',Name:'BrandId'}]}">
                                    <option value="" selected="selected">Select Model</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="ftitle">
                                <nobr>Year*:</nobr>
                            </td>
                            <td>
                                 <select loadon="FirstVisible" class="dropdownlist required" style="width: 155px;"
                                groupid="CarsRateForm" argumentid="CarYear" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'4'}]}">
                                <option value="" selected="selected">Select Year</option>
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
                                <nobr>Daily Rental Rate (KD)*:</nobr>
                            </td>
                            <td>
                          
                                       <input type="text" style="text-align:center;width:150px;"  maxlength="10" class="text required number"
                                    groupid="CarsRateForm" alphconf="{allow:'.'}"  argumentid="Rate" />

                                   
                            </td>
                        </tr>

                                                <tr>
                            <td class="ftitle">
                                <nobr>Daily Mileage (KM) Limit*:</nobr>
                            </td>
                            <td>
                          
                                       <input type="text" style="text-align:center;width:150px;"  maxlength="10" class="text required number"
                                    groupid="CarsRateForm"  argumentid="AllowedKM" />
                            </td>
                        </tr>

                                                                        <tr>
                            <td class="ftitle">
                                <nobr>Rate/KM (Extra Mileage)*:</nobr>
                            </td>
                            <td>
                          
                                       <input type="text" style="text-align:center;width:150px;"  maxlength="10" class="text required number"
                                    groupid="CarsRateForm" alphconf="{allow:'.'}"  argumentid="ExtraKMRate" />
                            </td>
                        </tr>

                                                                                                <tr>
                            <td class="ftitle">
                                <nobr>Is Disable:</nobr>
                            </td>
                            <td>
                               <input type="radio" checked="checked" default="default" value="0" name="IsDisable" groupid="CarsRateForm" argumentid="IsDisable"><label>No</label>
                               <input type="radio" value="1" name="IsDisable" groupid="CarsRateForm" argumentid="IsDisable"><label>Yes</label>
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
                            <td >

                                                  <input type="button" value="  Save  " class="DataAction ButtonStyle" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_Cars_Rates',HideOnSuccess:true}">
                      <input type="button" value="  Cancel  " class="CloseForm ButtonStyle">                   
                                
                            </td>
                        </tr>
                    </table>