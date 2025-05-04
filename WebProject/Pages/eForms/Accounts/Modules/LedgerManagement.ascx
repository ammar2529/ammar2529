<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LedgerManagement.ascx.cs" Inherits="WebProject.Pages.eForms.Accounts.Modules.LedgerManagement" %>

<%@ Register Src="~/AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="AW" %>
<%@ Register Src="~/Pages/eForms/iRental/SalesContracts_ShUc.ascx" TagPrefix="AW" TagName="SalesContracts_ShUc" %>



<AW:Container ID="conLedgerManagement" Hidden="true" Caption="Ledger Management" runat="server">
    <Childern>
        <AW:Form ID="frmconLedgerManagement_ShUc" runat="server" Hidden="true" LoadOnInit="false" ShowOnLoad="true" DataSource="SEL_iRental_SalesContracts" AsyncForm="~/Pages/eForms/iRental/SalesContracts_ShUc.ascx">
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
        
         
        </AW:Form>


        <AW:DataGrid ID="grdLedgerManagement" LoadOnInit="false" ShowOnLoad="true" runat="server" Hidden="true" Columns="1" Forms="frmconLedgerManagement_ShUc"
            EmptyHeight="201px" AllowNew="true" SelectableRow="true"
            PageSize="10" DataSource="SEL_Account_LedgerManagement" ContainerMargin="5px" AutoSearch="OnLoad" GridTemplate="jQueryUI"
            GridHeadText="Ledger Management" GridButtons="{\'delete\':{conf:{Command:\'UPD_Account_LedgerManagement\',KeysCol:\'RecId\'}}}">
            <ColumnTemplates>
                <pre columnid="LeadgerDetails" class="w-grid-head">
                                <div style="padding-top:5px;padding-bottom:5px">
                                    <div class="ftitle" style="color:#602010">{LedgerManagementRecCode}</div>
                                    <div class="ftitle" >Transaction Type:&nbsp;<nobr class="ftitle" style="color:#602010">{TransactionType}</nobr></div>


                                </div>
                                </pre>

                <pre columnid="CustomerDetails">
                                <center>
                                     <div class="ftitle" style="font-size:16px;color:#101080">{CustomerName}</div>

                                </center>
                                </pre>
                <pre columnid="LeadgerDateTimeDetails">
                                     <div class="ftitle">Amount:&nbsp;<nobr class="ftitle" style="color:#602010">{LedgerManagementAmount:fix(3)}</nobr></div>
                                   
                                </pre>
                <pre columnid="CreationDetails"> 

                    
                                      
                              <div class="ftitle" style="style="color:#101080"">{CreatedBy}</div>

                                     <div style="font-size:11px;">{DateCreated}&nbsp;{DateCreatedTime}</div>

                    
                                    
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
                            LeadgerDetails: { caption: ' Details', width: '270px' },
                            CustomerDetails: { caption: 'Customer Details', width: '270px' },
                            LeadgerDateTimeDetails: { caption: 'Amount', width: '165px' },
                            CreationDetails: { caption: 'Creation Details', width: '165px' },
                            RecId: { width: '0px' }
                        },
                        forms: {
                            NewFormId: 'frmLedgerManagement',
                            EditFormId: 'frmLedgerManagement',
                            Keys: 'RecId'
                        }
                        ,
                        DataActionParams: {
                            DBAction: 'SearchCarArriveNotArrive'
                        }
                    };
                </script>
            </GridConfig>
            <Scripts>
                <script>
                    var fn = function (t)
                    {

                        var ColClick = function () {
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
                                if ($(this).text().indexOf('Payment Cleared - Car NR') > -1) {
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
                                else if ($(this).text().indexOf('Pending Payment - Car Out') > -1) {
                                    $(this).css('color', 'Red');
                                }
                                else if ($(this).text().indexOf('Pending Payment - Car In') > -1) {
                                    $(this).css('color', 'Red');
                                }



                            });
                            var cols = $('table[itemno] td:not(.RowSelect,.EditForm)', t.el).css('cursor', 'pointer').click(ColClick);
                            $('.ColValue', cols).css('cursor', 'pointer').click(ColClick);

                            //var $('[argumentid="CarReservationMode"]',t.el)


                        });
                    }
                </script>
            </Scripts>
        </AW:DataGrid>
        <br />


    </Childern>
</AW:Container>



<div class='LOVPopup' lovpopupid='LedgerManagementPopup' style="display: none">
    <AW:Form ID="frmLedgerManagementCustomerDetails_Cust_ShUc" runat="server" Hidden="true" LoadOnInit="false" ShowOnLoad="true" DataSource="SEL_iRental_Contracts_Customers" AsyncForm="~/Pages/eForms/iRental/RentalContracts_Cust_ShUc.ascx">

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
    </AW:Form>
    <AW:DataGrid ID="grdLedgerManagement_Cust" LoadOnInit="false" ShowOnLoad="true" runat="server" Hidden="true" Columns="1" Forms="frmLedgerManagementCustomerDetails_Cust_ShUc"
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
                        NewFormId: 'frmLedgerManagementCustomerDetails',
                        Keys: 'RecId'
                    }
                };
 </script>


 </GridConfig>


 </AW:DataGrid>

    <AW:Form ID="frmLedgerManagementCustomerDetails" Hidden="true" DataSource="SEL_iRental_Contracts_Customers" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/eForms/iRental/CustomerDetails_FrUc.ascx">
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
                var fn = function () {
                    //
                    t.on("show", function () {
                     
                        $(".btnPopupForm", t).show();
                        $(".btnMainForm", t).hide();

                    });
                }
            </script>
        </Scripts>
    </AW:Form>

</div>




<AW:Form ID="frmLedgerManagement" Hidden="true" DataSource="SEL_Account_LedgerManagement" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/eForms/Accounts/LedgerManagement_FrUc.ascx">
    <WidgetConfig>
        <script>
            cf = {

                header: {
                    Style: {},
                    Visible: true,
                    Collapsed: false,
                    HeadText: 'Ledger Management'
                }
            }
        </script>
    </WidgetConfig>
</AW:Form>




