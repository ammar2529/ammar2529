<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SparePartInventoryInvoice.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.Modules.SparePartInventoryInvoice" %>
<%@ Register Src="~/AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="uc8" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="uc5" %>
<%@ Register Src="~/Pages/eForms/iRental/SparePartInventoryInvoice_FrUc.ascx" TagPrefix="uc5" TagName="SparePartInventoryInvoice_FrUc" %>

<style>
.ElemDisabled
{
	background:#F1F1F1 !important;
	}
</style>

<uc5:Container ID="conInvoice" Hidden="true" Caption="Spare Part Inventory" runat="server">
      <Childern>
        <uc8:Form ID="frmSparePartInventoryInvoice_ShUc" runat="server" Hidden="true" LoadOnInit="false"
            ShowOnLoad="true" DataSource="SEL_iRental_CarsForSale" AsyncForm="~/Pages/eForms/iRental/Invoice_ShUc.ascx">
            <WidgetConfig>
                <script>
                    cf = {
                        header: {
                            Style: {},
                            Visible: true,
                            Collapsed: false,
                            HeadText: 'Search'
                        }
                    }
                </script>
            </WidgetConfig>
        </uc8:Form>


        

          <AW:DataGrid ID="grdSparePartCustomerAndInvoiceDetails" LoadOnInit="false" ShowOnLoad="true" runat="server" Hidden="true" Columns="1" Forms="frmSparePartInventoryInvoice_ShUc"
            EmptyHeight="201px" AllowNew="true" SelectableRow="true"
            PageSize="10" DataSource="SEL_Invoice" ContainerMargin="5px" AutoSearch="OnLoad" GridTemplate="jQueryUI"
            GridHeadText="Invoice Details" GridButtons="{\'delete\':{conf:{Command:\'UPD_iRental_CarServiceDetails\',KeysCol:\'RecId\'}}}">
            <ColumnTemplates>
                <pre columnid="ContractDetails" class="w-grid-head">
                                <div style="padding-top:5px;padding-bottom:5px">
                                    <div class="ftitle" style="color:#602010">{InvRecCode}</div>
                                  <tpl if="CarNumber && Brand && Model && CarYear">
                                     <div class="CarDetails" style="font-size:11px;">
                                         <nobr class="ftitle" style="color:#008080">{CarNumber}</nobr>&nbsp;-&nbsp;{Brand}&nbsp;-&nbsp;{Model}&nbsp;-&nbsp;{CarYear}

                                     </div>
                                   </tpl>
                                     <%--<div class="ftitle" style="font-size:11px;">Delivery No.:{DeliveryNo}</div>--%>

                                    <div class="ftitle">InvoiceFor:&nbsp;<nobr class="ftitle" style="color:#602010">{InvoiceDetails}</nobr></div> 

                                    <div class="ftitle StateName" style="color:#602010">{StateName}</div>
                                </div>
                                </pre>
                <pre columnid="CustomerDetails">
                                <center>
                                     <div class="ftitle" style="font-size:16px;color:#101080">{CustomerName}</div>
                                     <div style="font-size:11px;">ID: {NationalIDNo}&nbsp;-&nbsp;{Nationality}</div>
                                      <div style="font-size:11px;">{MobileTelephone1}&nbsp;&nbsp;{MobileTelephone2}</div>
                                </center>
                                </pre>
                <pre columnid="ContractDateTimeDetails">
                                    
                                     <div class="ftitle">Price:&nbsp;<nobr class="ftitle" style="color:#602010">{GrandTotal:fix(3)}</nobr></div>
                                     <div class="ftitle">Balance:&nbsp;<nobr class="ftitle" style="color:#602010">{Balance:fix(3)}</nobr></div>
                                             

                                   
                                </pre>
                <pre columnid="CreationDetails">
                                     <div class="ftitle" style="color:#808000; display:none">{ChassisNo}</div>
                                     <div class="ftitle" style="color:#101080">{CreatedBy}</div>
                                     <div class="ftitle" >{DateCreated}&nbsp;{DateCreatedTime}</div>
                                  <%-- <div class="ftitle" style="color:#808000">{FinanceCompany}</div>--%>

                    
                                    
                                </pre>

                <pre columnid="RecId">
                                {RecId}
                                </pre>
            </ColumnTemplates>
            <GridConfig>
                <script>
                    var cf = {
                        cols: {
                            EditForm: { width: '0px' },
                            Sequence: { width: '0px' },
                            ContractDetails: { caption: 'Invoice Details', width: '270px' },
                            CustomerDetails: { caption: 'Customer Details', width: '270px' },
                            ContractDateTimeDetails: { caption: 'Payment Details', width: '165px' },
                            CreationDetails: { caption: 'Creation Details', width: '165px' },
                            RecId: { width: '0px' }
                        },
                        forms: {
                            NewFormId: 'frmSparePartInventoryInvoice',
                            EditFormId: 'frmSparePartInventoryInvoice',
                            Keys: 'RecId'
                        }
                    };
                </script>
            </GridConfig>
            <Scripts>
                <script>

                    var fn = function ()
                    {

                        var ColClick = function ()
                        {
                            $('.EditForm.ColValue', $(this).closest('tr')).trigger('click');
                            return false;
                        };
                        t.on('rowsRendered', function () {

                            $('.StateName', t.el).each(function () {
                                //if ($(this).text().indexOf('Created - Reservation') > -1) {
                                //$('.chkRowSelect', $(this).closest('tr')).removeAttr('disabled');
                                //}
                                //else if ($(this).text() != '{StateName}') {
                                $('.chkRowSelect', $(this).closest('tr')).attr('disabled', 'disabled');
                                //}

                                var ptr = $(this).closest('tr');

                                if ($(this).text().indexOf('Contract Closed - Payment Cleared') > -1) {
                                    ptr.css('background', '#F1F1F1').attr('disabled', 'disabled');
                                }
                                else if ($(this).text().indexOf('Contract Cancelled') > -1) {
                                    ptr.css('background', '#F1F1F1').attr('disabled', 'disabled');
                                }
                                else if ($(this).text().indexOf('Contract Open - Car In') > -1) {
                                    $(this).css('color', 'Red');
                                }
                                else if ($(this).text().indexOf('With Legal - Contract Open - Car Out') > -1) {
                                    $(this).css('color', 'Red');
                                }
                                else if ($(this).text().indexOf('With Legal - Contract Open - Car In') > -1) {
                                    $(this).css('color', 'Red');
                                }
                                else if ($(this).text().indexOf('With Legal - Contract Closed - Pending Payment') > -1) {
                                    $(this).css('color', 'Red');
                                }
                                else if ($(this).text().indexOf('Contract Closed - Pending Payment') > -1) {
                                    $(this).css('color', 'Red');


                                }
                                
                               
                                
                            });
                            var cols = $('table[itemno] td:not(.RowSelect,.EditForm)', t.el).css('cursor', 'pointer').click(ColClick);
                            $('.ColValue', cols).css('cursor', 'pointer').click(ColClick);
                        });


                    }

                </script>
            </Scripts>
        </AW:DataGrid>
       
        <br />
    </Childern>
    
</uc5:Container>




<script src="../../../../Scripts/eForms/iRental/frmSparePartInventoryInvoice.js"></script>

  <uc8:Form ID="frmSparePartInventoryInvoice" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server"
    AsyncForm="~/Pages/eForms/iRental/SparePartInventoryInvoice_FrUc.ascx">
    <WidgetConfig>
        <script>
            cf = {

                header: {
                    Style: {},
                    Visible: true,
                    Collapsed: false,
                    HeadText: 'Spare Part Inventory Details'
                }
            }
        </script>
    </WidgetConfig>
        <Scripts>
            <script>

</script>
        </Scripts>

</uc8:Form>


<div class='LOVPopup' lovpopupid='customerInvoicePopup' style="display: none">
    <UC8:Form ID="frmInvoice_Cust_ShUc" runat="server" Hidden="true" LoadOnInit="false" ShowOnLoad="true" DataSource="SEL_iRental_Contracts_Customers" AsyncForm="~/Pages/eForms/iRental/RentalContracts_Cust_ShUc.ascx">

        <WidgetConfig>
            <script>
                var cf = {
                    header: {
                        Style: {},
                        Visible: true,
                        Collapsed: false,
                        HeadText: 'Search'
                    }
                }
            </script>
        </WidgetConfig>
     <%--   <Scripts>
                    <script>
                        var fn = function () {
                            var conGrd = AsyncWidgets.get("conRentalContracts_Cust");

                            $('.ClosePopup', t.el).click(function () {
                                var f = conGrd._frm;
                                f._LOVCon.hide();
                                conGrd._Masked.unmask();
                                conGrd._frm = conGrd._Masked = null;
                            });
                        }
                    </script>
                </Scripts>--%>
    </UC8:Form>
    <AW:DataGrid ID="grdInvoice_Cust" LoadOnInit="false" ShowOnLoad="true" runat="server" Hidden="true" Columns="1" Forms="frmInvoice_Cust_ShUc"
        EmptyHeight="201px" AllowNew="false" SelectableRow="false"
        PageSize="10" DataSource="SEL_iRental_Contracts_Customers" ContainerMargin="5px" AutoSearch="none" GridTemplate="jQueryUI"
        GridHeadText="Select Customer" GridButtons="{\'new\':{visible:true},\'delete\':{visible:false}}">

        
 <GridConfig>
 <script>
     var cf = {
         cols: {
             Sequence: { width: '0px' },
             NationalIDExpiryDate: { width: '0px' },
             Nationality: { width: '0px' },
             Gender: { width: '0px' },
             DrivingLicenseNo: { width: '0px' },
             DrivingLicenseExpiry: { width: '0px' },
             PassportNo: { width: '0px' },
             PassportExpiry: { width: '0px' },
             CustomerType: { width: '0px' },
             WorkTelephone: { width: '0px' },
             ResidenceTelephone: { width: '0px' },
             MobileTelephone2: { width: '0px' },
             RecCode: { caption: 'Code', width: '90px' },
             NationalIDNo: { caption: 'National ID No.' },
             MobileTelephone1: { caption: 'Mobile Telephone' },
             CustomerStatus: { caption: 'Status' }


         },
         forms: {
             NewFormId: 'frmInvoiceDetails',
             Keys: 'RecId'
         }
     };
 </script>


 </GridConfig>


 </AW:DataGrid>

    <uc8:Form ID="frmInvoiceDetails" Hidden="true" DataSource="SEL_iRental_Contracts_Customers" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/eForms/iRental/CustomerDetails_FrUc.ascx">
        <WidgetConfig>
            <script>
                cf = {

                    header: {
                        Style: {},
                        Visible: true,
                        Collapsed: false,
                        HeadText: 'Add Customers'
                    }
                }
            </script>
        </WidgetConfig>
        <Scripts>
            <script>
                var fn = function ()
                {
                    //
                    t.on("show", function ()
                    {

                        $(".btnPopupForm", t).show();
                        $(".btnMainForm", t).hide();

                    });
                }
            </script>
        </Scripts>
    </uc8:Form>

</div>

<div class='LOVPopup' lovpopupid='carPopupGarageForInvoice' style="display: none">
    <uc8:Form ID="frmCarServiceDetailsForInvoice_Cars" runat="server" Hidden="true" LoadOnInit="false" ShowOnLoad="true" DataSource="SEL_GRG_SearchCarFor_CarAndCustomerDetils" AsyncForm="~/Pages/eForms/iRental/GRG_CarServiceDetails_Car_ShUc.ascx">
        <WidgetConfig>
            <script>
                var cf = {
                    header: {
                        Style: {},
                        Visible: true,
                        Collapsed: false,
                        HeadText: 'Search'
                    }
                }
            </script>
        </WidgetConfig>
    </uc8:Form>
    <AW:DataGrid ID="grdCarServiceDetailsForInvoice_Cars" LoadOnInit="false" ShowOnLoad="true" runat="server" Hidden="true" Columns="1" Forms="frmCarServiceDetailsForInvoice_Cars"
        EmptyHeight="201px" AllowNew="true" SelectableRow="false"
        PageSize="10" DataSource="SEL_GRG_SearchCarFor_CarAndCustomerDetils" ContainerMargin="5px" AutoSearch="none" GridTemplate="jQueryUI"
        GridHeadText="Select Car" GridButtons="{\'new\':{visible:false},\'delete\':{visible:false}}">

        <GridConfig>
            <script>
                var cf = {
                    cols: {


                        Sequence: { width: '0px' },
                        RecId: { width: '0px' },
                        RecCode: { width: '0px' },
                        CarNumber: { caption: 'Car No.', width: '80px' },
                        ChassisNo: { width: '150px' },

                        BrandId: { caption: 'Brand', width: '60px' },
                        ModelId: { caption: 'Model', width: '90px' },
                        CarYear: { caption: 'Year', width: '60px' },
                        ColorId: { caption: 'Color', width: '80px' },
                        Type: { width: '0px' },
                        CarLocationId: { caption: 'Car Location', width: '0px' },
                        CarStatusId: { caption: 'Car Status', width: '0px' },
                        InvCustomerName: { caption: 'Name', width: '80px' },
                        /*CustomerRecCode: { caption: 'Rec No.', width: '85px' },*/
                        SICustomerRecCode: { caption: 'Rec No.', width: '85px' },
                            NationalIDNo: { caption: 'National ID', width: '100px' },
                        MobileTelephone1: { caption: 'Mobile Telephone', width: '100px' },
                        Type: { width: '0px' },
                        FullInsuranceCompanyId: { width: '0px' },
                        FullInsuranceExpiry: { width: '0px' },
                        FullInsurancePolicyNo: { width: '0px' },
                        CarFor: { width: '0px' },
                        LastServiceKm: { width: '0px' },
                        LastCarServiceDate: { width: '0px' },
                        CarRecivedDate: { width: '0px' },

                        Nationality: { width: '0px' },
                        NationalityID: { width: '0px' },
                        InvNationalIDNo: { width: '0px' },
                        MobileTelephone2: { width: '0px' },
                        

                        CurrentServiceKm: { width: '0px' },

                        Gender: { width: '0px' },

                        CarToBeDeliverdDate: { width: '0px' },
                        CarDeliverdDate: { width: '0px' },
                        Problem: { width: '0px' },
                        ActionTaken: { width: '0px' },
                        CarCondition: { width: '0px' },
                        ServiceState: { width: '0px' },
                        DateCreated: { width: '0px' }


                    },
                    DataActionParams: {
                        SearchDbAction: 'SearchChassisNo'
                    }
                };
            </script>
        </GridConfig>
        <Scripts>
            <script>
                var fn = function () {
                    var conCar = AsyncWidgets.get("conRentalContracts_Cars");
                    var f = conCar._frm;
                    t.on('beforeSearchGetForm', function (p) {
                        /*Ext.apply(p, { conSalesContracts: $('[argumentid="CarType"]').val() });*/

                        /*     p.ChassisNo = val('ChassisNo', AsyncWidgets.get('frmCarServiceDetails').el);*/
                        p.DBAction = 'searchCarsForInvoice';

                        console.log(p.DBAction);
                    });




                    t.on('rowsRendered', function () {
                        $('table[itemno]', t.el).click(function () {

                            
                            var ChassisNo = $('[colid="ChassisNo"]  .ColValue', this).text();
                            var CustomerRecCode = $('[colid="CustomerRecCode"]  .ColValue', this).text();

                            $('[argumentid="ChassisNo"]', t.el).val(ChassisNo);
                            $('.CustRec', t.el).text(CustomerRecCode)

                            //var FullInsuranceExpiry = $('[colid="FullInsuranceExpiry"]  .ColValue', this).text();
                            //var FullInsurancePolicyNo = $('[colid="FullInsurancePolicyNo"]  .ColValue', this).text();
                            //var NationalIDNo = $('[colid="NationalIDNo"]  .ColValue', this).text();
                            //if (!!FullInsuranceCompanyId) {
                            //    $('[argumentid="FullInsuranceCompanyId"]', f).text(FullInsuranceCompanyId);
                            //}
                            //else {

                            //    $('[argumentid="FullInsuranceCompanyId"]', f).text('');

                            //}


                            //if (!!FullInsuranceExpiry) {
                            //    $('[argumentid="FullInsuranceExpiry"]', f).text(FullInsuranceExpiry);
                            //}
                            //else {

                            //    $('[argumentid="FullInsuranceExpiry"]', f).text('');
                            //}

                            //if (!!FullInsurancePolicyNo) {
                            //    $('[argumentid="FullInsurancePolicyNo"]', f).text(FullInsurancePolicyNo);
                            //}
                            //else {

                            //    $('[argumentid="FullInsurancePolicyNo"]', f).text('');
                            //}

                            //if (!!NationalIDNo) {

                            //    // Remove newline characters and excess whitespace
                            //    let cleanedData = NationalIDNo.replace(/\n/g, '').replace(/\s+/g, ' ').trim();
                            //    let toString = cleanedData.toString();
                            //    $('[argumentid="NationalIDNo"]', t.el).text('');
                            //    $('[argumentid="NationalIDNo"]', t.el).text(toString);
                            //    console.log(cleanedData); // For debugging
                            //}


                        });

                    });



                }
            </script>
        </Scripts>
    </AW:DataGrid>
</div>