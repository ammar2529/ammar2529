<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GarageCarServiceDetails_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.GarageCarServiceDetails_FrUc" %>




<link href="../../../Scripts/eForms/iRental/Upload.css" rel="stylesheet" />
<link href="../../../Scripts/eForms/iRental/RemoveButton.css" rel="stylesheet" />

<table cellspacing="0" cellpadding="0" border="0" style="width: 100%;" class="myTable">

    <tr tabid="GarageCarServiceDetails">
        <td style="padding-top: 1px;">
            <table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">
                <tr id="trNote">
                    <td colspan="4" style="padding-top: 10px; padding-bottom: 10px">Use the form below to update the details, fields marked with an asterisk (*) are mandatory </td>
                </tr>

                <tr class="StatusTR">
                      <td class="ftitle" width="18%">
                        <nobr>Service No.:</nobr>
                    </td>
                    <td class="ftitle" width="32%">
                        <span class="ftitle" style="color: red;" groupid="GarageCarServiceDetails" argumentid="RecCode">New contract no. will be generated on saving</span>
                    </td>
                    <td class="ftitle" width="20%">
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
            
                <tr>
                    <td class="ftitle" style="width: 170px">
                        <nobr>Service Date *:</nobr>
                    </td>
                    <td  >
                        <input type="text" groupid="GarageCarServiceDetails" maxlength="10"
                            style="width: 75px;"  class="text  date CommonDisableClass required " requirederr=" *Required"  argumentid="CarRecivedDate" />
                    </td>
                    <td class="ftitle" style="width: 170px">Engine No.:</td>
                             <td>
                        <input type="text" style="text-align: center; width: 150px;" maxlength="100" class="text number CommonDisableClass  "
                            groupid="GarageCarServiceDetails" argumentid="EngineNo" />
                    </td>
                  
                </tr>


                <%--/////////////////////// Select Car and Customer popup //////////////////////////////////--%>
                <tr>
                    <td class="ftitle" style="width: 170px">
                        <nobr>Car No.*:</nobr>
                    </td>
                    <td >
                        <input type="hidden" name="RecId" groupid="GarageCarServiceDetails" argumentid="RecId" />
                        <input type="hidden" name="FileGuid" groupid="GarageCarServiceDetails" argumentid="FileGuid" />

                   
                        <div>
                            <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="10" class="text LOVPopup required CommonDisableClass"
                                groupid="GarageCarServiceDetails" lovpopupid="carPopupGarage" argumentid="CarNumber" />

                            <%--<input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="30" class="LOVPopup text  CommonDisableClass  "
                                groupid="GarageCarServiceDetails" lovpopupid="carPopupGarage" argumentid="ChassisNo"   />--%>
                        </div>
                    </td>
                    <td class="ftitle" style="width: 140px">
                        <nobr>Customer Code*:</nobr></td>
                     <td style="text-align: center">
                        <span class="ftitle" style="font-size: 12px;" groupid="GarageCarServiceDetails" argumentid="CustomerRecCode"></span>
                    </td>
                </tr>

                <%--///////////////////// End: Select Car and Customer popup ///////////////////////////////////////--%>





                <tr>
                    <td class="ftitle">
                        <nobr>Chassis No.:</nobr>
                    </td>
                    <td >
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
                    <td >
                        <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="Brand"></span>
                    </td>
                    <td class="ftitle">
                        <nobr>Nationality:</nobr>
                    </td>
                    <td>
                        <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="Nationality"></span>
                        <input type="hidden"  argumentid="NationalityID"/>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Model:</nobr>
                    </td>
                    <td >
                        <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="Model"></span>
                    </td>
                   <td class="ftitle">
                        <nobr>National ID No.:</nobr>
                    </td>
                    <td>
<%--                        <div style="float: left; width: 135px" class="ftitle" groupid="GarageCarServiceDetails" argumentid="NationalIDNo"></div>--%>
                        <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="NationalIDNo"></span>
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
                        <nobr>Gender:</nobr>
                    </td>
                    <td>
                        <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="Gender"></span>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Color:</nobr>
                    </td>
                    <td >
                        <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="Color"></span>
                    </td>
                     <td class="ftitle">
                        <nobr>Mobile Telephone:</nobr>
                    </td>
                    <td class="ftitle">
                        <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="MobileTelephone1"></span>
                        <nobr class="CommaM12">, </nobr>
                        <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="MobileTelephone2"></span>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Type:</nobr>
                    </td>
                    <td class="" >
                        <span class="ftitle" groupid="GarageCarServiceDetails" argumentid="Type"></span>
                    </td>
                      <td class="ftitle">
                                
                            </td>
                            <td>
                                
                                
                                  
                                </td>

                    
                  
                </tr>

               


             
         

                   <tr >
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
                                                    

                    </td>
                </tr>

   <tr>
                           
                           
                             <td class="ftitle">
                                <nobr>Full Insurance:</nobr>
                            </td>
                           
                       <td>
                         <span class="ftitle CommonDisable " groupid="GarageCarServiceDetails" argumentid="FullInsuranceCompanyId"></span>
                    </td>
                                                                    
                           

                          <td class="ftitle">
                               <%-- <nobr>Full Insurance Expiry:</nobr>--%>
                            </td>
                          <td>
                              <%--<span class="ftitle CommonDisable" groupid="GarageCarServiceDetails" argumentid="FullInsuranceExpiry"></span> --%>
                          </td>
                        </tr>

                <tr>
                     <td class="ftitle">
                                <nobr>PolicyNo. - Expiry Date:</nobr>
                            </td>
                      <td>
                      <span class="ftitle CommonDisable " groupid="GarageCarServiceDetails" argumentid="FullInsurancePolicyNo"></span> - <span class="ftitle CommonDisable" groupid="GarageCarServiceDetails" argumentid="FullInsuranceExpiry"></span> 
                    </td>
                    <td></td>
                    <td></td>
                </tr>

              <tr>
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
                                                    

                    </td>
                </tr>
                   <tr>
                    <td class="ftitle" style="width: 170px">
                        <nobr>Last Service Date:</nobr>
                    </td>
                    <td  >
                        
                        <span class="ftitle dateLabel onDisable" groupid="GarageCarServiceDetails" argumentid="LastCarServiceDate"></span>
                    </td>
                    <td class="ftitle" style="width: 170px">Last Service KM.:</td>
                             <td>
                    
                                 <span class="ftitle CommonDisable" groupid="GarageCarServiceDetails" argumentid="LastServiceKm"></span>  
                    </td>
                  
                </tr>

                    
                <tr>
                    <td class="ftitle" style="width: 170px">In KM *:</td>
                             <td>
                        <input type="text" style="text-align: center; width: 150px;" maxlength="100" class="text number required  CommonDisableClass "
                            groupid="GarageCarServiceDetails" argumentid="CurrentServiceKm" />

                    </td>

                    <td class="ftitle" style="width: 170px">Out KM :</td>
                             <td>
                   

                                 <input type="text" style="text-align: center; width: 150px;" maxlength="100"  class="text number   CommonDisableClass "
                                     groupid="GarageCarServiceDetails" argumentid="OutKm"
                                     />

                             
                             
                    </td>
                </tr>

                
                   <tr>
                    <td class="ftitle" style="width: 170px">
                        <nobr>Delivery Date:</nobr>
                    </td>
                    <td  >
                        <input type="text" groupid="GarageCarServiceDetails" maxlength="10"
                            style="width: 75px;"  class="text  date CommonDisableClass  "  argumentid="CarToBeDeliverdDate" />
                    </td>
                    <td class="ftitle" style="width: 170px">Deliverd Date:</td>
                             <td>
                        <input type="text" groupid="GarageCarServiceDetails" maxlength="10"
                            style="width: 75px;"  class="text  date CommonDisableClass  "  argumentid="CarDeliverdDate" />
                    </td>
                  
                </tr>

                <tr>
                    <td class="ftitle" style="width: 170px">
                        <nobr>Next Service Date:</nobr>
                    </td>
                    <td>
                        <input type="text" groupid="GarageCarServiceDetails" maxlength="10"
                            style="width: 75px;" class="text  date CommonDisableClass  " argumentid="NextServiceDate" />
                    </td>
                    <td class="ftitle" style="width: 170px">Next Service KM:</td>
                    <td>
                      <input type="text" style="text-align: center; width: 150px;" maxlength="100" class="text number   CommonDisableClass "
                        groupid="GarageCarServiceDetails" argumentid="NextServiceKm" />
                    </td>

                </tr>

                <tr>
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
                                                    

                    </td>
                </tr>
               
                   <tr>
        <td valign="center" class="ftitle">
            <nobr>Problem *:</nobr>
        </td>
                       <td colspan="3">
                           <textarea class="textarea required Problem" rows="4" wrap="1"" style="width: 100%; height: 50px; box-sizing: border-box; border: 0.5px solid black; 
                            resize: none;" argumentid="Problem" groupid="GarageCarServiceDetails"></textarea>
                       </td>
       
    </tr>

                   
                   <tr>
        <td valign="center" class="ftitle">
            <nobr>Action Taken:</nobr>
        </td>
                       <td colspan="3">
                           <textarea class="textarea ActionTaken" rows="4" wrap="1"" style="width: 100%; height: 50px; box-sizing: border-box; border: 0.5px solid black; resize: none;" 
                               argumentid="ActionTaken" groupid="GarageCarServiceDetails"></textarea>
                       </td>
       
    </tr>

                        
                   <tr>
        <td valign="center" class="ftitle">
            <nobr>Car Condition:</nobr>
        </td>
                       <td colspan="3">
                           <textarea class="textarea CarCondition" rows="4" wrap="1"" style="width: 100%; height: 50px; box-sizing: border-box; border: 0.5px solid black; resize: none;"
                               argumentid="CarCondition" groupid="GarageCarServiceDetails"></textarea>
                       </td>
       
    </tr>


              

              <tr>
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
                                                    

                    </td>
                </tr>


                <tr>
                    <td colspan="4">


                        <div class="file-upload-drop-area">
                            <select loadon="FirstVisible" valtype="value" class="dropdownlist required   " style="width: 155px;"
                                groupid="GarageCarServiceDetails" argumentid="DocType" storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'34'}]}">
                                <option value="" selected="selected">Select Doc Type</option>
                            </select>


                            <input type="file" class="file-input    " accept=".pdf,.jpg,.png,.txt,.docx" />
                            <span class="allowedFile" style="display: none;"></span>


                            <button class="upload-button ">Upload</button>

                        </div>


                        <div style="width: 100%;">

                            <table cellspacing="0" cellpadding="0" border="0" style="width: 100%;" class="UploadFileListForJC">
                                <thead>
                                    <tr>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black; width: 40%;">File Name</th>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">File Size</th>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">File Type</th>
                                        <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">Uploaded By</th>
                                      <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" style="padding-left: 5px; padding-right: 0px; color: black;">Upload Date</th>
                                       <th class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" ></th>

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
                </tr>



                <tr>
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />


                    </td>
                </tr>

                <tr>
                    <td colspan="4" style="text-align: center;">
                       
                       
                    
                        <div style="padding-top: 10px; padding-bottom: 10px">
                           
                      <input type="button" style="width: 75px" ignorevalidate="DocType" value="  Closed  " class="DataAction ButtonStyle  grgbtnClosed common-button" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_CarServiceDetails',Params:{NewStateId:'ClosedState'},HideOnSuccess:true, Requery:false,GroupId:'GarageCarServiceDetails'}" />
                       <input type="button" style="width: 75px" ignorevalidate="DocType" value="  Canceled  " class="DataAction ButtonStyle  grgbtnClosed common-button" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_CarServiceDetails',Params:{NewStateId:'CanceledState'},HideOnSuccess:true, Requery:false,GroupId:'GarageCarServiceDetails'}" />

                         </div>
                    </td>
                </tr>

                  <tr>
      <td colspan="4" style="text-align: center;">
         
         
      
          <div style="padding-top: 10px; padding-bottom: 10px">
             
              <input type="button" style="width: 50px" roles="iRen_Contracts_Admin" value="  Edit  " class="ButtonStyle CarServiceButton_Edit" />
              <input type="button" style="width: 50px" ignorevalidate="DocType" value="  Save  " class="DataAction ButtonStyle  grgbtnSave common-button" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_CarServiceDetails',Params:{NewStateId:'CreatedState'},HideOnSuccess:true, Requery:true,GroupId:'GarageCarServiceDetails'}" />
             <input type="button" style="width: 50px" ignorevalidate="DocType" value="  Save  " class="DataAction ButtonStyle  grgbtnSave2 common-button" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_CarServiceDetails',Params:{NewStateId:'CreatedState'},HideOnSuccess:false, Requery:false,GroupId:'GarageCarServiceDetails'}" />


              <input type="button" style="width: 50px" value="  Close  " class="CloseForm ButtonStyle btnCancel " />
          </div>
      </td>
  </tr>

            </table>
        </td>
    </tr>



</table>
