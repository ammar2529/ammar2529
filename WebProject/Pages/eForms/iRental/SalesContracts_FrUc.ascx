<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalesContracts_FrUc.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.SalesContracts_FrUc" %>
<%@ Register Src="~/AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="AW" %>

<style type="text/css">
    .auto-style1 {
        height: 21px;
    }

    .auto-style2 {
        width: 275px;
    }
</style>

<table cellspacing="0" cellpadding="0" border="0" style="width: 100%;">
    <tr>
        <td style="padding-top: 10px; padding-left: 2px;">
            <ul class="SimpleTab" style="margin: 0px;">
                <li class="active" tabid="ContractDetails">
                    <div>Contract Details </div>
                </li>
                <%--                
				<li tabid="AdditionalDrivers" >
					<div>
          Additional Drivers</div>
				</li> --%>
                <li tabid="PaymentDetails">
                    <div>Payment Details </div>
                </li>
                <li tabid="OtherCharges">
                    <div>Other Charges </div>
                </li>
                <li tabid="ContractComments" style="border-right: 1px solid #8298B0;">
                    <div>Comments </div>
                </li>
            </ul>
        </td>
    </tr>
    <tr tabid="ContractDetails">
        <td style="padding-top: 1px;">
            <table cellspacing="2" cellpadding="0" width="100%" border="0" class="w-form-table">
                <tr id="trNote">
                    <td colspan="4" style="padding-top: 10px; padding-bottom: 10px">Use the form below to update the details, fields marked with an asterisk (*) are mandatory </td>
                </tr>
                <%--    
				<tr class="OnNewHide">
					<td class="ftitle" width="18%">
						<nobr>Contract No.</nobr>
					</td>
					<td class="ftitle" width="32%">
						<span class="ftitle" style="color: red;" groupid="SalesContractsForm" argumentid="RecCode">New contract no. will be generated on saving</span>
					</td>
					<td class="ftitle" width="20%">
						<nobr>Contract Status</nobr>
					</td>
					<td class="ftitle" width="30%">
						<span class="ftitle" groupid="SalesContractsForm" argumentid="StateName"></span>
					</td>
				</tr>--%>

                <tr>
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
                    </td>
                </tr>

                <%--/////////////////////// Select Car and Customer popup //////////////////////////////////--%>
                <tr>
                    <td>
                        <nobr>Car Number*:</nobr>
                    </td>
                    <td>
                        <input type="hidden" name="RecId" groupid="SalesContractsForm" argumentid="RecId" />

                        <div style="display: none"><span groupid="SalesContractsForm" argumentid="RecId"></span><span groupid="SalesContractsForm" argumentid="StateId"></span></div>
                        <div>
                            <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="10" class="LOVPopup text required CommonDisable"
                                groupid="SalesContractsForm" lovpopupid="mypopup" argumentid="CarNumber" />
                        </div>
                    </td>
                    <td>
                        <nobr>Customer Code*:</nobr></td>
                    <td>
                        <input type="text" style="text-align: center; width: 150px; font-weight: bold; color: red" maxlength="10" class="LOVPopup text required CommonDisable"
                            groupid="SalesContractsForm" lovpopupid="mypopupp" argumentid="CustomerRecCode" />
                        <div class="ftitle w-ui-icon w-ui-panel-icon-closed unselectable contDetailsIcon" style="float: right; padding-right: 0px; height: 15px; cursor: pointer;">&nbsp;</div>
                    </td>
                </tr>

                <%--///////////////////// End: Select Car and Customer popup ///////////////////////////////////////--%>





                <tr>
                    <td>
                        <nobr>Chassis Number</nobr>
                    </td>
                    <td>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="ChassisNo"></span>
                    </td>
                    <td>
                        <nobr>Name</nobr>
                    </td>
                    <td style="text-align: center">
                        <span class="ftitle" style="font-size: 16px;" groupid="SalesContractsForm" argumentid="CustomerName"></span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <nobr>Brand</nobr>
                    </td>
                    <td>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="BrandId"></span>
                    </td>
                    <td>
                        <nobr>Type</nobr>
                    </td>
                    <td>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="CustomerType"></span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <nobr>Model</nobr>
                    </td>
                    <td>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="ModelId"></span>
                    </td>
                    <td>
                        <nobr>Nationality</nobr>
                    </td>
                    <td>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="Nationality"></span>
                    </td>
                </tr>
                <tr class="OnLoadHideCarCust">
                    <td>
                        <nobr>Year</nobr>
                    </td>
                    <td>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="CarYear"></span>
                    </td>
                    <td>
                        <nobr>Gender</nobr>
                    </td>
                    <td>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="Gender"></span>
                    </td>
                </tr>
                <tr class="OnLoadHideCarCust">
                    <td>
                        <nobr>Color</nobr>
                    </td>
                    <td>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="Color"></span>
                    </td>
                    <td>
                        <nobr>Passport No.</nobr>
                    </td>
                    <td>
                        <div style="float: left; width: 135px" class="ftitle" groupid="SalesContractsForm" argumentid="PassportNo"></div>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="PassportExpiry"></span>
                    </td>
                </tr>
                <tr class="OnLoadHideCarCust">
                    <td>
                        <nobr>Type</nobr>
                    </td>
                    <td>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="TypeId"></span>
                    </td>
                    <td>
                        <nobr>National ID No.</nobr>
                    </td>
                    <td>
                        <div style="float: left; width: 135px" class="ftitle" groupid="SalesContractsForm" argumentid="NationalIDNo"></div>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="NationalIDExpiryDate"></span>
                    </td>
                </tr>
                <tr class="OnLoadHideCarCust">
                  
                    <td>
                        <nobr>Driving License No.</nobr>
                    </td>
                    <td>
                        <div style="float: left; width: 135px" class="ftitle" groupid="SalesContractsForm" argumentid="DrivingLicenseNo"></div>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="DrivingLicenseExpiry"></span>
                    </td>
                </tr>
                <tr class="OnLoadHideCarCust">
                   
                    <td>
                        <nobr>Work & Res. Telephone</nobr>
                    </td>
                    <td class="ftitle">
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="WorkTelephone"></span>
                        <nobr class="CommaWR">, </nobr>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="ResidenceTelephone"></span>
                    </td>
                </tr>
                <tr>
                   
                    <td>
                        <nobr>Mobile Telephone</nobr>
                    </td>
                    <td class="ftitle">
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="MobileTelephone1"></span>
                        <nobr class="CommaM12">, </nobr>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="MobileTelephone2"></span>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
                    </td>
                </tr>

                <tr>
                    <td>
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

                    <td>
                        <nobr>Reservation Date:</nobr>
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
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
                    </td>
                </tr>



                <tr class="OnLoadHide">
                    <td colspan="4" class="auto-style1">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
                    </td>
                </tr>

                <tr>
                    <td rowspan="4">Comments</td>
                    <td rowspan="4">

                        <textarea class="auto-style2" style="width: 100%" rows="5" wrap="1" argumentid="fComments" groupid="SalesContractsForm-" name="S1" cols="20"></textarea></td>


                    <td class="ftitle">
                        <nobr>Price</nobr>
                    </td>
                    <td>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="Price"></span>

                    </td>
                </tr>
                <tr>

                    <td class="ftitle">

                        <nobr>Additional Amount</nobr>

                        <td>
                            <span class="ftitle" groupid="SalesContractsForm" argumentid="AdditionalAmount"></span>
                        </td>
                </tr>

                <tr>

                    <td class="ftitle">

                        <nobr>Discount:</nobr>

                        <td>
                            <span class="ftitle" groupid="SalesContractsForm" argumentid="Discount"></span>
                        </td>
                </tr>



                <tr>

                    <td>
                        <nobr>Grand Total*:</nobr>
                    </td>
                    <td>
                        <span class="ftitle" groupid="SalesContractsForm" argumentid="TotalAmount"></span>
                    </td>

                </tr>

                <tr>
                    <td colspan="4">
                        <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
                    </td>
                </tr>

                

       
            <tr >
                <td class="ftitle">
                    <nobr style="color: Green; font-size: 12px">Amount Received (KD)</nobr>
                </td>
                <td style="text-align: center;">
                    <span class="ftitle" style="color: Green; font-size: 12px" groupid="SalesContractsForm" argumentid="PaymentAmount"></span>
                </td>
                <td class="ftitle">

                    <nobr style="color: Red; font-size: 12px">Amount Due</nobr>
                </td>
                <td style="text-align: center;">
                    <span class="ftitle" style="color: Red; font-size: 12px" groupid="SalesContractsForm" argumentid="AmountDue"></span>
                </td>
            </tr>
            

            <tr>
                <td colspan="4">
                    <img height="15" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1">
                </td>
            </tr>

                <tr>
                    <td colspan="4" style="text-align: center;">
                        <div style="padding-top: 10px; padding-bottom: 10px">
                            <input type="button" value="  Save  " ignorevalidate="ReservationDate" class="DataAction ButtonStyle btn_11" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts',HideOnSuccess:true, Requery:false}" />
                            <input type="button" value="  Reserve  " class="DataAction ButtonStyle btn_11" conf="{ActorId:'DataHelper',ActionId:'DataAction',Command:'UPD_iRental_SalesContracts',HideOnSuccess:false, Requery:true,Params:{DBAction:'SCReserved'}}" />
                            <%--              <input type="button" value="  Print  " class="ButtonStyle btn_9" />--%>
                            <input type="button" value="  Close  " class="CloseForm ButtonStyle" />
                        </div>
                    </td>
                </tr>

            </table>
        </td>
    </tr>

    <script type="text/javascript" language="javascript" src="Scripts/eForms/iRental/SalesContracts.js"></script>
    <script src="../../../Scripts/eForms/iRental/frmSalesContracts.js"></script>
    <tr tabid="PaymentDetails" style="display: none;">
        <td style="padding-top: 1px;">

            <AW:DataGrid ID="grdPaymentDetails" LoadOnInit="true" ShowOnLoad="false" runat="server"
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
                    <AW:container id="conPaymentDetails_Audit" hidden="true" runat="server">
                    <childern>
                    <div style="padding:15px">
                         <AW:DataGrid ID="grdPaymentDetails_Audit" LoadOnInit="true" ShowOnLoad="false" runat="server"
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
                        var fn = function ()
                        {
                            t.on('rowsRendered', function ()
                            {
                                $('[colid="PaymentType_Audit"]:not(".w-grid-head-cell")').each(function ()
                                {
                                    var ptr = $(this).closest('tr');
                                    if ($(this).text().toLowerCase() == "return")
                                    {
                                        $('[colid="PaymentAmount"] div', ptr).css({ 'font-weight': 'bold', 'color': 'red' });
                                        $('[colid="PaymentAmount"] div', ptr).text('-' + $('[colid="PaymentAmount"] div', ptr).text());
                                    }
                                    $('[colid="PaymentAmount"] div', ptr).text(parseFloat($('[colid="PaymentAmount"] div', ptr).text()).fix(3));
                                });
                            });
                            t.on('onNoRecords', function ()
                            {
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

    <tr tabid="OtherCharges" style="display: none;">
        <td style="padding-top: 1px;">
            <AW:DataGrid ID="grdOtherCharges" LoadOnInit="true" ShowOnLoad="false" runat="server" Hidden="true" Columns="1"
                EmptyHeight="201px" AllowNew="true" SelectableRow="true"
                PageSize="10" DataSource="SEL_iRental_SalesContracts_OtherCharges" ContainerMargin="2px" GridTemplate="jQueryUI"
                GridHeadText="Other Charges" GridButtons="{\'delete\':{conf:{Command:\'UPD_iRental_SalesContracts_OtherCharges\',KeysCol:\'RecId\'}}}">

                <GridConfig>
                    <script>
                        cf = {
                            cols: {
                                Sequence: { width: '0px' },
                                RecId: { width: '70px', caption: 'ID' },
                                ParentRecId: { width: '0px' },
                                Description: { caption: 'Description' },
                                Charges: { caption: 'Amount', width: '90px' },
                                DateCreated: { caption: 'Date Created', width: '130px' },
                                CreatedBy: { caption: 'Created By', width: '150px' },
                                StateId: { width: '0px' }
                            },
                            forms: {
                                NewFormId: 'frmOtherCharges',
                                EditFormId: 'frmOtherCharges',
                                Keys: 'RecId'
                            }
                        };
                    </script>
                </GridConfig>
                <Scripts>
                    <script>
                        var fn = Sales.SalesContracts.grdOtherCharges;
                    </script>
                </Scripts>
                <RowDetail>
                    <pre class="" colindex="3">
                    <AW:container id="conOtherCharges_Audit" hidden="true" runat="server">
                    <childern>
                    <div style="padding:15px">
                         <AW:DataGrid ID="grdOtherCharges_Audit" LoadOnInit="true" ShowOnLoad="false" runat="server"
                Hidden="true" Columns="1" EmptyHeight="201px" AllowNew="true" SelectableRow="false" RelativeKeys="RecId"
                PageSize="30" DataSource="SEL_iRental_SalesContracts_OtherCharges_Audit" ContainerMargin="2px"  ShowGridHead="false"
                GridTemplate="jQueryUI" GridHeadText="Payment Details" GridButtons="{\'delete\':{visible:false},\'new\':{visible:false}}" >
                           <GridConfig>
                    <script>
                        cf = {
                            cols: {
                                AuditTrailId: { width: '0px', caption: 'Audit ID' },
                                StateId: { caption: 'Status', width: '111px' },
                                RecId: { width: '0px' },
                                ParentRecId: { width: '0px' },
                                Description: { caption: 'Description' },
                                Charges: { caption: 'Amount', width: '90px' },
                                DateCreated: { caption: 'Date Created', width: '130px' },
                                CreatedBy: { caption: 'Created By', width: '132px' }
                            }
                        };
                    </script></GridConfig>
                                <Scripts>
                    <script>
                        var fn = function ()
                        {
                            t.on('rowsRendered', function ()
                            {
                                $('[colid="Charges"]:not(".w-grid-head-cell")').each(function ()
                                {
                                    var ptr = $(this).closest('tr');
                                    $('[colid="Charges"] div', ptr).text(parseFloat($('[colid="Charges"] div', ptr).text()).fix(3));
                                });
                            });
                            t.on('onNoRecords', function ()
                            {
                                $('.BottomTR', t.Repeater).hide();
                            });
                        }
                    </script></Scripts></AW:DataGrid>
                </div></Childern></AW:container>
                     </pre>
                </RowDetail>
            </AW:DataGrid>

            <AW:Form ID="frmOtherCharges" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server"
                AsyncForm="~/Pages/eForms/iRental/SalesContracts_OC_FrUc.ascx">
                <WidgetConfig>
                    <script>
                        cf = {

                            header: {
                                Style: {},
                                Visible: true,
                                Collapsed: false,
                                HeadText: 'Other Charges'
                            }
                        }
                    </script>
                </WidgetConfig>
                <Scripts>
                    <script>
                        var fn = function ()
                        {

                            t.on('show', function (args)
                            {
                                var frm = AsyncWidgets.get('frmSalesContracts');
                                $('[argumentid="ParentRecId"]', t.el).text(frm.GetArgVal('RecId'));
                            });
                        }
                    </script>
                </Scripts>
            </AW:Form>

        </td>
    </tr>

    <tr tabid="ContractComments" style="display: none;">
        <td style="padding-top: 1px;">

            <AW:DataGrid ID="grdContractComments" LoadOnInit="true" ShowOnLoad="false" runat="server"
                Hidden="true" Columns="1" EmptyHeight="201px" AllowNew="true" SelectableRow="true"
                PageSize="10" DataSource="SEL_iRental_SalesContracts_Comments" ContainerMargin="2px"
                GridTemplate="jQueryUI" GridHeadText="Comments" GridButtons="{\'delete\':{conf:{Command:\'UPD_iRental_SalesContracts_Comments\',KeysCol:\'RecId\'}}}">
                <GridConfig>
                    <script>
                        cf = {
                            cols: {
                                Sequence: { width: '0px' },
                                RecId: { width: '0px' },
                                ParentRecId: { width: '0px' },
                                Comments: { caption: 'Comments' },
                                DateCreated: { caption: 'Date Created', width: '130px' },
                                CreatedBy: { caption: 'Created By', width: '150px' }
                            },
                            forms: {
                                NewFormId: 'frmComments',
                                EditFormId: 'frmComments',
                                Keys: 'RecId'
                            }
                        };
                    </script>
                </GridConfig>
                <Scripts>
                    <script>
                        var fn = function ()
                        {
                            t.on('beforeSearchGetForm', function (P)
                            {
                                var frm = AsyncWidgets.get('frmSalesContracts');
                                P.ParentRecId = frm.GetArgVal('RecId');
                            });
                        }
                    </script>
                </Scripts>
            </AW:DataGrid>

            <AW:Form ID="frmComments" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server"
                AsyncForm="~/Pages/eForms/iRental/SalesContracts_CS_FrUc.ascx">
                <WidgetConfig>
                    <script>
                        cf = {

                            header: {
                                Style: {},
                                Visible: true,
                                Collapsed: false,
                                HeadText: 'Comments'
                            }
                        }
                    </script>
                </WidgetConfig>
                <Scripts>
                    <script>
                        var fn = function ()
                        {

                            t.on('show', function (args)
                            {
                                var frm = AsyncWidgets.get('frmSalesContracts');
                                $('[argumentid="ParentRecId"]', t.el).text(frm.GetArgVal('RecId'));
                            });
                        }
                    </script>
                </Scripts>
            </AW:Form>

        </td>
    </tr>

</table>
