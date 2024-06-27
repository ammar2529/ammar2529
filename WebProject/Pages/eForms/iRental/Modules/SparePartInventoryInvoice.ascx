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
            ShowOnLoad="true" DataSource="SEL_iRental_CarsForSale" AsyncForm="~/Pages/eForms/iRental/SparePartInventory_ShUc.ascx">
            <WidgetConfig>
                <script>
                    cf = {
                        header: {
                            Style: {},
                            Visible: true,
                            Collapsed: true,
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
                                    <div class="ftitle" style="color:#602010">Invoice No.: {InvoiceNo}</div>
<%--                                     <div style="font-size:11px;"><nobr class="ftitle" style="color:#008080">{CarNumber}</nobr>&nbsp;-&nbsp;{BrandId}&nbsp;-&nbsp;{ModelId}</div>--%>
                                 <div class="ftitle" style="color:#602010">{InvRecCode}</div>

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
                                     <div class="ftitle">{DeliveryNo}</div>
                                     <div class="ftitle">Price:&nbsp;<nobr class="ftitle" style="color:#602010">{GrandTotal:fix(3)}</nobr></div>
                                     <div class="ftitle">Balance:&nbsp;<nobr class="ftitle" style="color:#602010">{Balance:fix(3)}</nobr></div>
                                   
                                </pre>
                <pre columnid="CreationDetails">
<%--                                     <div class="ftitle" style="color:#808000; ">{ChassisNo}</div>--%>
                                     <div class="ftitle" style="color:#101080">{CreatedBy}</div>
                                     <div style="font-size:11px;">{DateCreated}&nbsp;{DateCreatedTime}</div>
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
                            ContractDateTimeDetails: { caption: 'Delivery No.', width: '165px' },
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
                        t.on('rowsRendered', function ()
                        {

                            $('.StateName', t.el).each(function ()
                            {
                                //if ($(this).text().indexOf('Created - Reservation') > -1) {
                                //$('.chkRowSelect', $(this).closest('tr')).removeAttr('disabled');
                                //}
                                //else if ($(this).text() != '{StateName}') {
                                $('.chkRowSelect', $(this).closest('tr')).attr('disabled', 'disabled');
                                //}

                                var ptr = $(this).closest('tr');

                                if ($(this).text().indexOf('Contract Closed - Payment Cleared') > -1)
                                {
                                    ptr.css('background', '#F1F1F1').attr('disabled', 'disabled');
                                }
                                else if ($(this).text().indexOf('Contract Cancelled') > -1)
                                {
                                    ptr.css('background', '#F1F1F1').attr('disabled', 'disabled');
                                }
                                else if ($(this).text().indexOf('Contract Open - Car In') > -1)
                                {
                                    $(this).css('color', 'Red');
                                }
                                else if ($(this).text().indexOf('With Legal - Contract Open - Car Out') > -1)
                                {
                                    $(this).css('color', 'Red');
                                }
                                else if ($(this).text().indexOf('With Legal - Contract Open - Car In') > -1)
                                {
                                    $(this).css('color', 'Red');
                                }
                                else if ($(this).text().indexOf('With Legal - Contract Closed - Pending Payment') > -1)
                                {
                                    $(this).css('color', 'Red');
                                }
                                else if ($(this).text().indexOf('Contract Closed - Pending Payment') > -1)
                                {
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