<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalesContracts_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.SalesContracts_FrUc" %>
<%@ Register Src="~/AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="AW" %>
<%@ Register Src="~/Pages/eForms/iRental/CustomerDetails_FrUc.ascx" TagPrefix="AW" TagName="CustomerDetails_FrUc" %>


<link href="../../../Scripts/eForms/iRental/Upload.css" rel="stylesheet" />
<link href="../../../Scripts/eForms/iRental/RemoveButton.css" rel="stylesheet" />
<script type="text/javascript" language="javascript" src="Scripts/eForms/iRental/SalesContracts.js"></script>
<script src="../../../Scripts/eForms/iRental/frmSalesContracts.js"></script>
<table cellspacing="0" cellpadding="0" border="0" style="width: 100%;">
    <tr>
        <td style="padding-top: 0px; padding-left: 2px;">
            <ul class="SimpleTab" style="margin: 0px;">
                <li class="active" tabid="SalesContractDetails">
                    <div>Contract Details </div>
                </li>
                <li tabid="SalesPaymentDetails" style="border-right: 1px solid #8298B0;">
                    <div>Payment Details </div>
                </li>

            </ul>
        </td>
    </tr>
    <tr tabid="SalesContractDetails">
        <td style="padding-top: 1px;">
            <table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">
                <tr id="trNote">
                    <td colspan="4" style="padding-top: 10px; padding-bottom: 10px">Use the form below to update the details, fields marked with an asterisk (*) are mandatory </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
                    </td>
                </tr>

                <%--/////////////////////// Select Car and Customer popup //////////////////////////////////--%>
                <tr>
                    <td class="ftitle" style="width: 170px">
                        <nobr>Car Number*:</nobr>
                    </td>
                    <td>
                        <input type="hidden" name="RecId" groupid="SalesContractsForm" argumentid="RecId" />

                        <div style="display: none">
                            <span groupid="SalesContractsForm" argumentid="RecId1"></span><span groupid="SalesContractsForm" argumentid="StateId"></span>


                        </div>
                        <div>
                            <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="10" class="LOVPopup text required CommonDisable"
                                groupid="SalesContractsForm" lovpopupid="carPopup" argumentid="CarNumber" />
                        </div>
                    </td>
                    <td class="ftitle" style="width: 140px">
                        <nobr>Customer Code*:</nobr></td>
                    <td>
                        <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="10" class="LOVPopup text required CommonDisable"
                            groupid="SalesContractsForm" lovpopupid="customerPopup" argumentid="CustomerRecCode" />
                        <div class="ftitle w-ui-icon w-ui-panel-icon-closed unselectable contDetailsIcon" style="float: right; padding-right: 0px; height: 15px; cursor: pointer;">&nbsp;</div>
                        <%--                        <div class="ftitle w-ui-icon w-ui-panel-icon-closed unselectable contDetailsIcon" style="float: right; padding-right: 0px; height: 15px; cursor: pointer;">&nbsp;</div>--%>

                    </td>
                </tr>

                <%--///////////////////// End: Select Car and Customer popup ///////////////////////////////////////--%>





                <tr>
                    <td class="ftitle">
                        <nobr>Chassis Number:</nobr>
                    </td>
                    <td>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="ChassisNo"></span>
                    </td>
                    <td class="ftitle">
                        <nobr>Name:</nobr>
                    </td>
                    <td style="text-align: center">
                        <span class="ftitle" style="font-size: 16px;" groupid="SalesContractsForm" argumentid="CustomerName"></span>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Brand:</nobr>
                    </td>
                    <td>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="BrandId"></span>
                    </td>
                    <td class="ftitle">
                        <nobr>Type:</nobr>
                    </td>
                    <td>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="CustomerType"></span>
                    </td>
                </tr>
                <tr>
                    <td class="ftitle">
                        <nobr>Model:</nobr>
                    </td>
                    <td>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="ModelId"></span>
                    </td>
                    <td class="ftitle">
                        <nobr>Nationality:</nobr>
                    </td>
                    <td>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="Nationality"></span>
                    </td>
                </tr>
                <tr class="OnLoadHideCarCust">
                    <td class="ftitle">
                        <nobr>Year:</nobr>
                    </td>
                    <td>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="CarYear"></span>
                    </td>
                    <td class="ftitle">
                        <nobr>Gender:</nobr>
                    </td>
                    <td>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="Gender"></span>
                    </td>
                </tr>
                <tr class="OnLoadHideCarCust">
                    <td class="ftitle">
                        <nobr>Color:</nobr>
                    </td>
                    <td>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="Color"></span>
                    </td>
                    <td class="ftitle">
                        <nobr>Passport No.:</nobr>
                    </td>
                    <td>
                        <div style="float: left; width: 135px" class="ftitle" groupid="SalesContractsForm" argumentid="PassportNo"></div>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="PassportExpiry"></span>
                    </td>
                </tr>
                <tr class="OnLoadHideCarCust">
                    <td class="ftitle">
                        <nobr>Type</nobr>
                    </td>
                    <td>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="TypeId"></span>
                    </td>
                    <td class="ftitle">
                        <nobr>National ID No.:</nobr>
                    </td>
                    <td>
                        <div style="float: left; width: 135px" class="ftitle" groupid="SalesContractsForm" argumentid="NationalIDNo"></div>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="NationalIDExpiryDate"></span>
                    </td>
                </tr>
                <tr class="OnLoadHideCarCust">

                    <td></td>
                    <td></td>

                    <td class="ftitle">
                        <nobr>Driving License No.:</nobr>
                    </td>
                    <td>
                        <div style="float: left; width: 135px" class="ftitle" groupid="SalesContractsForm" argumentid="DrivingLicenseNo"></div>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="DrivingLicenseExpiry"></span>
                    </td>
                </tr>
                <tr class="OnLoadHideCarCust">
                    <td></td>
                    <td></td>
                    <td class="ftitle">
                        <nobr>Work & Res. Telephone:</nobr>
                    </td>
                    <td class="ftitle">
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="WorkTelephone"></span>
                        <nobr class="CommaWR">, </nobr>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="ResidenceTelephone"></span>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td class="ftitle">
                        <nobr>Mobile Telephone:</nobr>
                    </td>
                    <td class="ftitle">
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="MobileTelephone1"></span>
                        <nobr class="CommaM12">, </nobr>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="MobileTelephone2"></span>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
                    </td>
                </tr>

                <tr>
                    <td class="ftitle">
                        <nobr>Contract Start Date*:</nobr>
                    </td>
                    <td>
                        <input type="text" groupid="SalesContractsForm" maxlength="10"
                            style="width: 75px;" class="text required date CommonDisable" requirederr=' *' argumentid="ContractStartDate" />

                        <input type="text" style="text-align: center; width: 80px;" maxlength="10" class="text AlwaysDisable"
                            groupid="SalesContractsForm" argumentid="ContractStartDay" />

                        <input type="text" style="text-align: center; width: 55px;" maxlength="10" class="text AlwaysDisable"
                            groupid="SalesContractsForm" argumentid="ContractStartTime" />

                    </td>

                    <td class="ftitle">
                        <nobr>Reservation Date*:</nobr>
                    </td>
                    <td>
                        <input type="text" groupid="SalesContractsForm" maxlength="10"
                            style="width: 75px;" class="text required date DisableOnClose" requirederr=' Reservation Date Required' argumentid="ReservationDate" />

                        <input type="text" style="text-align: center; width: 80px;" maxlength="10" class="text AlwaysDisable"
                            groupid="SalesContractsForm" argumentid="ReservationWeekDays" />

                        <input type="text" style="text-align: center; width: 55px;" maxlength="10" class="text AlwaysDisable"
                            groupid="SalesContractsForm" argumentid="ReservationExpireTime" />

                        <input type="text" style="text-align: center; width: 30px;" maxlength="10" class="text AlwaysDisable"
                            groupid="SalesContractsForm" argumentid="ReservationDays" />

                    </td>


                </tr>

                <tr>
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
                    </td>
                </tr>

                <tr>
                    <td class="ftitle">

                        <nobr>Car Price:</nobr>
                    </td>
                    <td class="ftitle">
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="Price" style="text-align: center;" requirederr=' Car Price  Required'></span>

                    </td>
                    <td colspan="2" class="ftitle">

                        <nobr>Comments:</nobr>
                    </td>


                </tr>


                <tr>


                    <td class="ftitle">

                        <nobr>Additional Amount:</nobr>
                    </td>
                    <td class="ftitle">
                        <input type="text" style="text-align: center; width: 150px;" maxlength="10" class="text required number CommonDisable"
                            groupid="SalesContractsForm" argumentid="AdditionalAmount" />

                    </td>

                    <td rowspan="3" colspan="2">

                        <textarea style="width: 100%" rows="5" wrap="hard" argumentid="fComments" groupid="SalesContractsForm" name="S1" cols="20"></textarea>

                    </td>

                </tr>


                <tr>

                    <td class="ftitle">

                        <nobr>Discount:</nobr>

                    </td>
                    <td class="ftitle">
                        <input type="text" style="text-align: center; width: 150px;" maxlength="10" class="text required number CommonDisable"
                            groupid="SalesContractsForm" argumentid="Discount" />
                    </td>

                </tr>



                <tr>

                    <td class="ftitle">
                        <nobr>Grand Total:</nobr>
                    </td>
                    <td>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="TotalAmount"></span>
                    </td>

                </tr>



                <tr>
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
                    </td>
                </tr>




                <tr>
                    <td class="ftitle">
                        <nobr style="color: Green; font-size: 12px">Amount Received (KD):</nobr>
                    </td>
                    <td style="text-align: center;">
                        <span class="ftitle" style="color: Green; font-size: 12px" groupid="SalesContractsForm" argumentid="PaymentAmount"></span>
                    </td>
                    <td class="ftitle">

                        <nobr style="color: Red; font-size: 12px">Amount Due:</nobr>
                    </td>
                    <td style="text-align: center;">
                        <span class="ftitle" style="color: Red; font-size: 12px" groupid="SalesContractsForm" argumentid="AmountDue"></span>
                    </td>
                </tr>


                <tr>
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
                    </td>
                </tr>

                <tr>
                    <td colspan="4">
                        <div class="file-upload-container">
                            <div class="uploaded-file-list"></div>

                            <div id="file-list" class="file-list">
                                <!-- File list will be displayed here -->
                            </div>
                            <p class="ftitle">Click to select file .</p>
                            <div class="file-upload-drop-area">

                                <input type="file" class="file-input" accept=".pdf,.jpg,.png,.txt,.docx"/>
                                <select loadon="FirstVisible" class="dropdownlist required newdropdownlist" style="width: 155px;"
                                    groupid="SalesContractsForm" argumentid="DocType"  storeinfo="{Command:'FX_SEL_Common_LOV_AutoFill',TextCol:'Name',ValCol:'ChildId',Params:[{Name:'ParentTypeId',Value:'34'}]}">
                                    <option value="" selected="selected">Select File Type</option>
                                </select>
                                <button class="upload-button">Upload</button>

                            </div>



                            
                            <div class="progress-bar"></div>
                            <div class="message"></div>

                            <input type="hidden" groupid="SalesContractsForm" argumentid="FileGuid" readonly="readonly" />

                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <%-- style="margin-left:5%;width: 90%; text-align: left" --%>
                        <%-- Data Grid --%>
                        <table cellspacing="0" cellpadding="0" border="0" style="margin-left: 5%; width: 90%; text-align: left" class="uploadedFileList">
                            <tbody>
                                <tr class="HeaderTR">
                                    <td class="Header w-grid-border">
                                        <table cellspacing="0" cellpadding="0" width="100%" border="0" class="w-grid-header">
                                            <tbody>
                                                <tr class="w-grid-head-back">

                                                    <td class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-2" colindex="2" colid="RecId" style="padding-left: 0px; padding-right: 0px; width: 50px;">
                                                        <div style="white-space: nowrap; overflow: hidden; margin-left: 10px; width: 40px;">
                                                            <span href="#" class="w-grid-head ColName sort">Sr.</span>
                                                        </div>
                                                    </td>
                                                    <td class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-3" colindex="3" colid="FileName" style="padding-left: 0px; padding-right: 0px;">
                                                        <div style="white-space: nowrap; overflow: hidden; margin-left: 10px;">
                                                            <span href="#" class="w-grid-head ColName sort">File Name</span>
                                                        </div>
                                                    </td>
                                                    <td class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" colindex="4" colid="FileSize" style="padding-left: 0px; padding-right: 0px; width: 110px;">
                                                        <div style="white-space: nowrap; overflow: hidden; margin-left: 10px; width: 100px;">
                                                            <span href="#" class="w-grid-head ColName sort">File Size</span>
                                                        </div>
                                                    </td>
                                                    <td class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" colindex="4" colid="FileType" style="padding-left: 0px; padding-right: 0px; width: 110px;">
                                                        <div style="white-space: nowrap; overflow: hidden; margin-left: 10px; width: 100px;">
                                                            <span href="#" class="w-grid-head ColName sort">File Type</span>
                                                        </div>
                                                    </td>
                                                    <td class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" colindex="4" colid="CreatedBy" style="padding-left: 0px; padding-right: 0px; width: 110px;">
                                                        <div style="white-space: nowrap; overflow: hidden; margin-left: 10px; width: 100px;">
                                                            <span href="#" class="w-grid-head ColName sort">Uploaded By</span>
                                                        </div>
                                                    </td>
                                                    <td class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" colindex="4" colid="CreatedDate" style="padding-left: 0px; padding-right: 0px; width: 110px;">
                                                        <div style="white-space: nowrap; overflow: hidden; margin-left: 10px; width: 100px;">
                                                            <span href="#" class="w-grid-head ColName sort">Uploade Date</span>
                                                        </div>
                                                    </td>
                                                    <td class="ColTemplate w-grid-head-cell w-grid-head-back w-grid-cell-border colIndex-4" colindex="4" colid="FileSize" style="padding-left: 0px; padding-right: 0px; width: 45px;">
                                                        <div style="white-space: nowrap; overflow: hidden; margin-left: 10px; width: 35px;">
                                                            <span href="#" class="w-grid-head ColName sort"></span>
                                                        </div>
                                                    </td>


                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr class="ItemTR">
                                    <td class="Item w-grid-border">
                                        <table cellspacing="0" cellpadding="0" border="0" style="width: 100%; table-layout: fixed" itemno="10" class="w-grid-row-odd">
                                            <tbody>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr class="NoRecordsTR" style="display: none;">
                                    <td class="NoRecords w-grid-norecords-msg">
                                        <div style="padding: 10px; background-color: transparent" class="PWCNoDataMessage">No records available.</div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        <%-- End Data Grid --%>
                   
                        
                    </td>
                </tr>

                <tr>
                    <td colspan="4" style="text-align: center;">
                        <div style="padding-top: 10px; padding-bottom: 10px">
                            <input type="button" value="  Save  " ignorevalidate="ReservationDate DocType" class="DataAction ButtonStyle btn_11" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts',HideOnSuccess:true, Requery:false,GroupId:'SalesContractsForm'}" />
                            <input type="button" value="  Reserve  " class="DataAction ButtonStyle btn_11" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts',HideOnSuccess:false,GroupId:'SalesContractsForm',Requery:false,Params:{DBAction:'SCReserved'}}" />
                            <%--              <input type="button" value="  Print  " clafss="ButtonStyle btn_9" />--%>
                            <input type="button" value="  Close  " class="CloseForm ButtonStyle" />
                        </div>
                    </td>
                </tr>

            </table>
        </td>
    </tr>

    <tr tabid="SalesPaymentDetails" style="display: none;">
        <td style="padding-top: 1px;">

            <AW:DataGrid ID="grdSalesContractsPaymentDetails" LoadOnInit="true" ShowOnLoad="false" runat="server"
                Hidden="true" Columns="1" EmptyHeight="201px" AllowNew="true" SelectableRow="true"
                PageSize="20" DataSource="SEL_iRental_SalesContracts_Payments" ContainerMargin="2px"
                GridTemplate="jQueryUI" GridHeadText="Payment Details" GridButtons="{\'delete\':{conf:{Command:\'UPD_iRental_SalesContracts_Payments\',KeysCol:\'RecId\'}}}">
                <GridConfig>
                    <script>
                        cf = {
                            cols: {
                                Sequence: { width: '0px' },
                                RecId: { width: '0px', caption: 'ID' },
                                LocationReceiptId: { width: '110px', caption: 'ID' },
                                PrintId: { width: '30px', caption: '' },
                                ParentRecId: { width: '0px' },
                                PaymentType: { width: '65px', caption: 'Type' },
                                PaymentDate: { caption: 'Date', width: '90px' },
                                PaymentMode: { caption: 'Mode', width: '75px' },
                                ChequeNo: { width: '0px' },
                                PaymentAmount: { caption: 'Amount', width: '80px' },
                                ReceiptId: { caption: 'Manual ID' },
                                DateCreated: { caption: 'Date Created', width: '130px' },
                                CreatedBy: { caption: 'Created By', width: '150px' },
                                StateId: { width: '0px' }
                            },
                            forms: {
                                NewFormId: 'frmSalesContactsPaymentDetails',
                                EditFormId: 'frmSalesContactsPaymentDetails',
                                Keys: 'RecId'
                            }
                        };
                    </script>
                </GridConfig>
                <Scripts>
                    <script>
                        var fn = Sales.SalesContracts.grdPaymentDetails;
                    </script>
                </Scripts>
                <RowDetail>
                    <pre class="" colindex="4">
                    <AW:container id="conSalesPaymentDetails_Audit" hidden="true" runat="server">
                    <childern>
                    <div style="padding:15px">
                         <AW:DataGrid ID="grdSalesPaymentDetails_Audit" LoadOnInit="true" ShowOnLoad="false" runat="server"
                Hidden="true" Columns="1" EmptyHeight="201px" AllowNew="true" SelectableRow="false" RelativeKeys="RecId"
                PageSize="30" DataSource="SEL_iRental_SalesContracts_Payments_Audit" ContainerMargin="2px"  ShowGridHead="false"
                GridTemplate="jQueryUI" GridHeadText="Payment Details" GridButtons="{\'delete\':{visible:false},\'new\':{visible:false}}" >
                           <GridConfig>
                    <script>
                        cf = {
                            cols: {
                                AuditTrailId: { width: '0px', caption: 'Audit ID' },
                                StateId: { caption: 'Status', width: '182px' },
                                RecId: { width: '0px', caption: 'System ID' },
                                ParentRecId: { width: '0px' },
                                PaymentType_Audit: { width: '65px', caption: 'Type' },
                                PaymentDate: { caption: 'Date', width: '90px' },
                                PaymentMode: { caption: 'Mode', width: '75px' },
                                ChequeNo: { width: '0px' },
                                PaymentAmount: { caption: 'Amount', width: '80px' },
                                ReceiptId: { caption: 'Manual ID' },
                                DateCreated: { caption: 'Date Created', width: '130px' },
                                CreatedBy: { caption: 'Action By', width: '132px' }
                            }
                        };
                    </script></GridConfig>
                    <Scripts>
                    <script>
                        var fn = function () {
                            t.on('rowsRendered', function () {
                                $('[colid="PaymentType_Audit"]:not(".w-grid-head-cell")').each(function () {
                                    var ptr = $(this).closest('tr');
                                    if ($(this).text().toLowerCase() == "return") {
                                        $('[colid="PaymentAmount"] div', ptr).css({ 'font-weight': 'bold', 'color': 'red' });
                                        $('[colid="PaymentAmount"] div', ptr).text('-' + $('[colid="PaymentAmount"] div', ptr).text());
                                    }
                                    $('[colid="PaymentAmount"] div', ptr).text(parseFloat($('[colid="PaymentAmount"] div', ptr).text()).fix(3));
                                });
                            });
                            t.on('onNoRecords', function () {
                                $('.BottomTR', t.Repeater).hide();
                            });
                        }
                   </script></Scripts></AW:DataGrid>
                </div></Childern></AW:container>
                     </pre>
                </RowDetail>

            </AW:DataGrid>

            <AW:Form ID="frmSalesContactsPaymentDetails" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/eForms/iRental/SalesContracts_PD_FrUc.ascx">
                <WidgetConfig>
                    <script>
                        cf = {

                            header: {
                                Style: {},
                                Visible: true,
                                Collapsed: false,
                                HeadText: 'Payment Details'
                            }
                        }
                    </script>
                </WidgetConfig>
                <Scripts>
                    <script>

                        var fn = Sales.SalesContracts.frmSalesContactsPaymentDetails;

                    </script>
                </Scripts>
            </AW:Form>

        </td>
    </tr>

</table>
