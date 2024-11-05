<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GarageCarServiceDetails_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.GarageCarServiceDetails_FrUc" %>




<link href="../../../Scripts/eForms/iRental/Upload.css" rel="stylesheet" />
<link href="../../../Scripts/eForms/iRental/RemoveButton.css" rel="stylesheet" />




<style type="text/css">
    .auto-style1 {
        height: 29px;
    }
</style>




<table cellspacing="0" cellpadding="0" border="0" style="width: 100%;" class="myTable">

    <tr tabid="GarageCarServiceDetails">
        <td style="padding-top: 1px;">
            <table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">
                <%--<tr id="trNote">
                    <td colspan="4" style="padding-top: 10px; padding-bottom: 10px">Use the form below to update the details, fields marked with an asterisk (*) are mandatory </td>
                </tr>--%>

                <tr class="StatusTR">
                    <td class="ftitle">
                        <nobr>Service No.:</nobr>
                    </td>
                    <td class="ftitle">
                        <span class="ftitle" style="color: red;" groupid="GarageCarServiceDetails" argumentid="RecCode">New contract no. will be generated on saving</span>
                    </td>
                    <td class="ftitle">
                        <nobr>Service Status:</nobr>
                    </td>
                    <td class="ftitle" width="30%">
                        <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="StateName"></span>

                        <div style="display: none">
                            <span groupid="GarageCarServiceDetails" argumentid="StateId"></span>

                        </div>

                    </td>
                </tr>
                <%-- <tr>
                    <td class="ftitle" style="width: 170px">
                        <nobr>Service No:</nobr>
                    </td>
                    <td class="" >
                        <input type="text" groupid="GarageCarServiceDetails" maxlength="10"
                            style="text-align: center; width: 75px;"  disabled="disabled" readonly="readonly" class="text   CommonDisableClass AlwaysDisable ElemDisabled "  argumentid="ServiceNo" />
                    </td>
                    <td class="ftitle" style="width: 170px">Invoice No.:</td>
                       <td >
                        <input type="text" style="text-align: center; width: 150px;" maxlength="100" class="text number CommonDisableClass AlwaysDisable ElemDisabled "
                            groupid="GarageCarServiceDetails" disabled="disabled" readonly="readonly" argumentid="InvoiceNo" />
                    </td>
                  
                </tr>--%>




                <%--/////////////////////// Select Car and Customer popup //////////////////////////////////--%>
                <tr>
                    <td class="ftitle" style="width:20%">
                        <nobr>Car No.*:</nobr>
                    </td>
                    <td style="width: 30%;">
                        <input type="hidden" name="RecId" groupid="GarageCarServiceDetails" argumentid="RecId" />
                        <input type="hidden" name="FileGuid" groupid="GarageCarServiceDetails" argumentid="FileGuid" />



                        <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="10" class="text LOVPopup required CommonDisableClass"
                            groupid="GarageCarServiceDetails" lovpopupid="carPopupGarage" argumentid="CarNumber" />

                        <%--<input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="30" class="LOVPopup text  CommonDisableClass  "
                                groupid="GarageCarServiceDetails" lovpopupid="carPopupGarage" argumentid="ChassisNo"   />--%>
                        
                    </td>
                    <td class="ftitle" style="width:20%">
                        <nobr>Customer Code*:</nobr></td>
                    <td style="text-align: center; width:30%">
                        <span class="ftitle" style="font-size: 12px;" groupid="GarageCarServiceDetails" argumentid="CustomerRecCode"></span>
                    </td>
                </tr>

                <%--///////////////////// End: Select Car and Customer popup ///////////////////////////////////////--%>





                <tr>
                    <td class="ftitle">
                        <nobr>Chassis No.:</nobr>
                    </td>
                    <td>
                        <%--                        <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="CarNumber"></span>--%>
                        <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="ChassisNo"></span>

                    </td>
                    <td class="ftitle">
                        <nobr>Name:</nobr>
                    </td>
                    <td style="text-align: center">
                        <span class="ftitle" style="font-size: 16px;" groupid="GarageCarServiceDetails" argumentid="CustomerName"></span>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Brand:</nobr>
                    </td>
                    <td>
                        <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="Brand"></span>
                    </td>
                    <td class="ftitle">
                        
                        <nobr>National ID No.:</nobr>
                                            
                    </td>
                    <td>
                        <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="NationalIDNo"></span>
                        <input type="hidden" argumentid="NationalityID" />
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Model:</nobr>
                    </td>
                    <td>
                        <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="Model"></span>
                    </td>
                    <td class="ftitle">
                        <nobr>Mobile Telephone:</nobr>

                    </td>
                    <td>
                         <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="MobileTelephone1"></span>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Year:</nobr>
                    </td>
                    <td >
                        <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="CarYear"></span>
                    </td>
                    <td class="ftitle">
                        <nobr>Temp Telephone:</nobr>
                    </td>
                    <td >
                        <input type="text" style="text-align: center; width: 150px;" maxlength="100" class="text CommonDisableClass " groupid="GarageCarServiceDetails" argumentid="TempMobile" />
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Color:</nobr>
                    </td>
                    <td>
                        <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="Color"></span>
                    </td>
                    <td class="ftitle">
                        Manual ID:</td>
                    <td class="ftitle">
                       

                        <input type="text" style="text-align: center; width: 150px;" maxlength="100" class="text CommonDisableClass " groupid="GarageCarServiceDetails" argumentid="ManualID" /></td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Type:</nobr>
                    </td>
                    <td class="">
                        <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="Type"></span>
                    </td>
                    <td class="ftitle">&nbsp;</td>
                    <td>
                        &nbsp;</td>



                </tr>





                <tr>
                    <td class="hideOnNoExpirayDate" colspan="4">
                        <!-- Orange line ke liye empty space -->
<%--                         style="border-top: 2px solid orange;border-bottom: 2px solid orange;border-left: 2px solid orange;border-right: 2px solid orange;height: 1px;padding: 0px;"--%>
                    </td>
                </tr>

                <tr class="hideOnNoExpirayDate">


                    <td class="ftitle">
                        <nobr>Full Insurance:</nobr>
                    </td>

                    <td>
                        <span class="ftitle CommonDisable " groupid="GarageCarServiceDetails" argumentid="FullInsuranceCompanyId"></span>
                    </td>



                    <td class="ftitle">
                        <nobr class=""></nobr>
                    </td>
                    <td>
                        <%--   <input type="text" class="ftitle CommonDisableClass " style="text-align: center; width: 150px;"  groupid="GarageCarServiceDetails" argumentid="ManualID" />--%>
                        
                    </td>
                </tr>

                <tr class="hideOnNoExpirayDate">
                    <td class="ftitle">
                        <nobr>PolicyNo.:</nobr>
                    </td>
                    <td>
                        <span class="ftitle CommonDisable " groupid="GarageCarServiceDetails" argumentid="FullInsurancePolicyNo"></span>
                    </td>
                    <td class="ftitle">
                        <nobr>Expiry Date:</nobr></td>
                    <td><span class="ftitle CommonDisable" groupid="GarageCarServiceDetails" argumentid="FullInsuranceExpiry"></span></td>
                </tr>

                <tr>
                    <td colspan="4" >
                        
<%--                        style="border-top: 2px solid orange;border-bottom: 2px solid orange;border-left: 2px solid orange;border-right: 2px solid orange;height: 1px;padding: 0px;"--%>

                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Last Service Date:</nobr>
                    </td>
                    <td>

                        <span class="ftitle dateLabel onDisable" groupid="GarageCarServiceDetails" argumentid="LastCarServiceDate"></span>
                    </td>
                    <td class="ftitle">Last Service KM:</td>
                    <td>

                        <span class="ftitle CommonDisable CommonCommaText" groupid="GarageCarServiceDetails" argumentid="LastServiceKm"></span>
                    </td>

                </tr>
                
                <tr>
                    <td class="ftitle">Service Type</td>
                    <td class="ftitle">
                        <input type="radio" class="   ServiceCHK CommonDisableClass  " checked="checked" default="default" value="Service" name="ServiceType" groupid="GarageCarServiceDetails" argumentid="ServiceType" /><label>Service</label>
                        <input type="radio" class="  ProblemCHK CommonDisableClass  " value="Problem" name="ServiceType" groupid="GarageCarServiceDetails" argumentid="ServiceType" /><label>Problem</label>
                        <input type="radio" class="  BothCHK CommonDisableClass  " value="Both" name="ServiceType" groupid="GarageCarServiceDetails" argumentid="ServiceType" /><label>Both</label>
                    </td>
                    <td class="ftitle">Adviser Name:</td>
                    <td>
                        <select loadon="FirstVisible" class="dropdownlist  CommonDisableClass" style="width: 155px;"
                            groupid="GarageCarServiceDetails" argumentid="AdviserName" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'44'}]}">
                            <option value="" selected="selected">Select Adviser Name</option>
                        </select>
                    </td>
                </tr>

                <tr>
                    <td class="ftitle">Warranty</td>
                    <td class="ftitle">
                        <input type="radio" class="   WarrentyYes CommonDisableClass  " checked="checked" default="default" value="Yes" name="Warranty" groupid="GarageCarServiceDetails" argumentid="Warranty" /><label>Yes</label>
                        <input type="radio" class="  WarrentyNo CommonDisableClass  " value="No" name="Warranty" groupid="GarageCarServiceDetails" argumentid="Warranty" /><label>No</label>
                    </td>
                    <td class="ftitle">Mechanic Name:</td>
                    <td>
                        <select loadon="FirstVisible" class="dropdownlist  CommonDisableClass" style="width: 155px;"
                            groupid="GarageCarServiceDetails" argumentid="MechanicName" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'43'}]}">
                            <option value="" selected="selected">Select Mechanic Name</option>
                        </select>
                    </td>
                </tr>

       

                <tr>
                    <td class="ftitle">
                        <nobr>Service Date*:</nobr>
                    </td>
                    <%-- <td>
                        <input type="text" groupid="GarageCarServiceDetails" maxlength="10"
                            style="width: 75px;" class="text  date CommonDisableClass required " requirederr="*" argumentid="CarRecivedDate" />
                        
                        <input type="text" style="text-align: center; width: 80px;" maxlength="10" class="text AlwaysDisableJC"
                            groupid="GarageCarServiceDetails" argumentid="ServiceStartDay" />

                        <input type="text" style="text-align: center; width: 55px;" maxlength="10" class="text timePick CommonDisableClass"
                            groupid="GarageCarServiceDetails" argumentid="ServiceStartTime" />


                    </td>--%>

                    <td>
                        <input type="text" groupid="GarageCarServiceDetails" maxlength="10"
                            style="width: 67px;" class="text  date CommonDisableClass required " argumentid="CarRecivedDate" />

                        <input type="text" style="text-align: center; width: 67px;" maxlength="10" class="text AlwaysDisableJC"
                            groupid="GarageCarServiceDetails" argumentid="ServiceStartDay" />

                        <input type="text" style="text-align: center; width: 40px; margin-right: 0.5px;" maxlength="10" class="text timePick CommonDisableClass"
                            groupid="GarageCarServiceDetails" argumentid="ServiceStartTime" />
                        <input type="button" title="Set current date & time" value="⏲" style="width: 20px; margin-right: 0px; cursor: pointer;" class="ButtonStyle  CommonDisableClass btnGetNewDateR" />

                    </td>

                    <td class="ftitle">In KM*:</td>
                    <td>

                        <input type="text" style="text-align: center; width: 150px;" maxlength="100" class="text number1 required  CommonDisableClass CommonCommaVal"
                            groupid="GarageCarServiceDetails" argumentid="CurrentServiceKm" />


                    </td>

                </tr>
                <tr>
                    <td class="ftitle AddAsterisk">Deliverd Date:
                    </td>

                    <td>

                        <input type="text" groupid="GarageCarServiceDetails" maxlength="10"
                            style="width: 67px;" class="text  date AddRequired CommonDisableClass OnStartState " argumentid="CarDeliverdDate" />

                        <input type="text" style="text-align: center; width: 67px;" maxlength="10" class="text AlwaysDisableJC"
                            groupid="GarageCarServiceDetails" argumentid="CarDeliverdStartDay" />

                        <input type="text" style="text-align: center; width: 40px; margin-right: 0.5px;" maxlength="10" class="text  OnStartState CarDeliverdStartTime"
                            groupid="GarageCarServiceDetails" argumentid="CarDeliverdStartTime" />
                        <input type="button" title="Set current date & time" value="⏲" style="width: 20px; margin-right: 0px; cursor: pointer;" class="ButtonStyle OnStartState CommonDisableClass btnGetNewDateD" />


                    </td>

                    <td class="ftitle AddAsterisk">Out KM:</td>
                    <td>



                        <input type="text" style="text-align: center; width: 150px;" maxlength="100" class="text number AddRequired  CommonDisableClass OnStartState CommonCommaVal"
                            groupid="GarageCarServiceDetails" argumentid="OutKm" />
                        <input type="button" style="width: 40px; cursor: pointer;" value="📋" class="ButtonStyle CommonDisableClass OnStartState btnCurrentServiceKm" />
                    </td>

                </tr>

                <tr>
                    <td class="ftitle AddAsterisk ">Next Service Date: </td>



                    <td>
                        <input type="text" groupid="GarageCarServiceDetails" maxlength="10"
                            style="width: 67px;" class="text  date  CommonDisableClass  OnStartState AddRequiredOnNXKM" argumentid="NextServiceDate" />

                        <input type="text" style="text-align: center; width: 67px;" maxlength="10" class="text AlwaysDisableJC"
                            groupid="GarageCarServiceDetails" argumentid="NextServiceStartDay" />
                        <input type="button" value="3" style="width: 20px; margin-right: 1px; cursor: pointer;" class="ButtonStyle OnStartState CommonDisableClass btn3" />
                        <input type="button" value="6" style="width: 20px; margin-right: 1px; cursor: pointer;" class="ButtonStyle OnStartState CommonDisableClass btn6" />
                        <input type="button" value="12" style="width: 20px; margin-right: 0px; cursor: pointer;" class="ButtonStyle OnStartState CommonDisableClass btn12" />
                        <%--<input type="text" style="text-align: center; width: 55px;" maxlength="10" class="text  OnStartState NextServiceStartTime"
                        groupid="GarageCarServiceDetails" argumentid="NextServiceStartTime" />--%>

                    </td>


                    <td class="ftitle AddAsterisk">Next Service KM:</td>
                    <td>
                        <input type="text" style="text-align: center; width: 150px;" maxlength="100" class="text number   CommonDisableClass OnStartState AddRequiredOnNXKM CommonCommaVal"
                            groupid="GarageCarServiceDetails" argumentid="NextServiceKm" />
                        <input type="button" style="width: 40px; margin-right: 0px; cursor: pointer;" value="5KD" class="ButtonStyle CommonDisableClass OnStartState btn5KD" />
                        <input type="button" style="width: 40px; cursor: pointer;" value="10KD" class="ButtonStyle CommonDisableClass OnStartState btn10KD" />

                    </td>

                </tr>



                <tr>
                    <td colspan="4">
                        
<%--                         style="border-top: 2px solid orange;border-bottom: 2px solid orange;border-left: 2px solid orange;border-right: 2px solid orange;height: 1px;padding: 0px;"--%>

                    </td>
                </tr>

                <tr>
                    <td valign="center" class="ftitle">
                        <nobr>Problem*:</nobr>
                    </td>
                    <td colspan="3">
                        <textarea class="textarea required Problem CommonDisableClass" rows="4" style="width: 84.5%; height: 60px; box-sizing: border-box; resize: none;"
                            argumentid="Problem" groupid="GarageCarServiceDetails"></textarea>

                    </td>

                </tr>




                <%--  <tr>
                    <td valign="center" class="ftitle">
                        <nobr>Car Condition:</nobr>
                    </td>
                    <td colspan="3">
                        <textarea class="textarea CarCondition CommonDisableClass" rows="4" wrap="1" style="width: 100%; height: 50px; box-sizing: border-box;  resize: none;"
                            argumentid="CarCondition" groupid="GarageCarServiceDetails"></textarea>
                    </td>

                </tr>--%>



                <tr>
                    <td valign="center" class="AddAsterisk ftitle">Action Taken:</td>
                    <td colspan="3">
                        <textarea class="textarea ActionTaken CommonDisableClass AddRequired OnStartState"
                            rows="4"
                            style="width: 84.5%; height: 60px; box-sizing: border-box; resize: none;"
                            argumentid="ActionTaken"
                            groupid="GarageCarServiceDetails"></textarea>


                    </td>
                </tr>



                <tr>
                    <td colspan="4" style="text-align: center;">



                        <div style="padding-top: 10px; padding-bottom: 10px">
                            <input type="button" style="width: 95px; color: blue;" ignorevalidate="DocType" value="  Open  " class="DataAction ButtonStyle  grgbtnSave3 common-button OnNewForm OnCreateInvoice" conf="{ActorId:'DataHelper',ActionId:'DataAction',Params:{NewStateId:'OpenState'},Command:'UPD_iRental_CarServiceDetails',HideOnSuccess:false, Requery:true,GroupId:'GarageCarServiceDetails'}" />
                            <input type="button" style="width: 95px; color: Green" ignorevalidate="DocType" value="  Close  " class="DataAction ButtonStyle  grgbtnClosed common-button OnNewForm OnCreateInvoice" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_CarServiceDetails',Params:{NewStateId:'ClosedState'},HideOnSuccess:true, Requery:false,GroupId:'GarageCarServiceDetails'}" />
                            <input type="button" style="width: 95px; color: Red" ignorevalidate="DocType CurrentServiceKm NextServiceKm CarDeliverdDate NextServiceDate ActionTaken" value="  Cancel  " class="DataAction ButtonStyle  grgbtnCanceled common-button OnNewForm OnCreateInvoice" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_CarServiceDetails',Params:{NewStateId:'CanceledState'},HideOnSuccess:true, Requery:false,GroupId:'GarageCarServiceDetails'}" />

                        </div>

                        <div style="padding-top: 10px; padding-bottom: 10px">

                            <input type="button" style="width: 50px" roles="iRen_Contracts_Admin" value="  Edit  " class="ButtonStyle CarServiceButton_Edit OnNewForm OnCreateInvoice" />
                            <input type="button" style="width: 50px; color: blue;" ignorevalidate="DocType" value="  Open  " class="DataAction ButtonStyle  grgbtnSave common-button" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_CarServiceDetails',HideOnSuccess:true, Requery:true,GroupId:'GarageCarServiceDetails'}" />
                            <input type="button" style="width: 50px" ignorevalidate="DocType" value="  Save  " class="DataAction ButtonStyle  grgbtnSave2 common-button" conf="{ActorId:'DataHelper',ActionId:'DataAction',Params:{DBAction:'NoStateId'},Command:'UPD_iRental_CarServiceDetails',HideOnSuccess:false, Requery:true,GroupId:'GarageCarServiceDetails'}" />
                            <input type="button" value="  Print " style="width: 50px" class="ButtonStyle PrintJobCard  OnNewForm" />

                            <input type="button" style="width: 50px" value="  Close  " class="CloseForm ButtonStyle btnCancel " />
                        </div>
                    </td>
                </tr>


                <%--<tr>
                    <td colspan="4">


                        <div class="file-upload-drop-area" style="padding: 5px;">
                            <select loadon="FirstVisible" valtype="value" class="dropdownlist required   " style="width: 155px; display: none"
                                groupid="GarageCarServiceDetails" argumentid="DocType" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'34'}]}">
                                <option value="" selected="selected">Select Doc Type</option>
                            </select>


                            <input type="file" class="file-input    " accept=".pdf,.jpg,.png,.txt,.docx,.garage" />
                            <span class="allowedFile" style="display: none;"></span>


                            <button class="upload-button ">Upload</button>

                        </div>


                        <div style="width: 100%; padding: 4px;">

                            <table cellspacing="0" cellpadding="0" border="0" style="width: 99%;" class="UploadFileListForJC">
                                <thead>
                                    <tr>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black; width: 40%;">File Name</th>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">File Size</th>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">File Type</th>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">Uploaded By</th>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">Upload Date</th>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4"></th>

                                    </tr>
                                </thead>
                                <tbody>
                                </tbody>
                                <tfoot>
                                    <tr class="NoRecordsTR">

                                        <td class="NoRecords w-grid-norecords-msg" colspan="7">
                                            <div style="padding: 10px; background-color: transparent" class="PWCNoDataMessage">No records available.</div>
                                        </td>
                                    </tr>

                                </tfoot>

                            </table>
                        </div>



                    </td>
                </tr>--%>







                <tr>
                    <td class="ftitle">
                        <nobr>Contract Created By:</nobr>
                    </td>
                    <td style="text-align: center">
                        <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="CreatedBy"></span>
                    </td>

                    <td class="ftitle">
                        <nobr>Contract Date & Time:</nobr>
                    </td>
                    <td style="text-align: center">
                        <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="DateCreated"></span>
                        <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="DateCreatedTime"></span>
                    </td>
                </tr>





            </table>

        </td>
    </tr>


</table>
