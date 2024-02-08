<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalesContracts.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.Modules.SalesContracts" %>

<%@ Register Src="~/AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="AW" %>
<%@ Register Src="~/Pages/eForms/iRental/SalesContracts_ShUc.ascx" TagPrefix="AW" TagName="SalesContracts_ShUc" %>

<script src="/Scripts/eForms/iRental/SalesContracts.js" type="text/javascript"></script>

<AW:Container ID="conSalesContracts" Hidden="true" Caption="Sales Contracts" runat="server">
    <Childern>
        <AW:Form ID="frmSalesContracts_ShUc" runat="server" Hidden="true" LoadOnInit="false" ShowOnLoad="true" DataSource="SEL_iRental_SalesContracts" AsyncForm="~/Pages/eForms/iRental/SalesContracts_ShUc.ascx">
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


        <AW:DataGrid ID="grdSalesContracts" LoadOnInit="false" ShowOnLoad="true" runat="server" Hidden="true" Columns="1" Forms="frmSalesContracts_ShUc"
            EmptyHeight="201px" AllowNew="true" SelectableRow="true"
            PageSize="10" DataSource="SEL_iRental_SalesContracts" ContainerMargin="5px" AutoSearch="OnLoad" GridTemplate="jQueryUI"
            GridHeadText="Sales Contracts" GridButtons="{\'delete\':{conf:{Command:\'UPD_iRental_SalesContracts\',KeysCol:\'RecId\'}}}">
            <ColumnTemplates>
                <pre columnid="ContractDetails" class="w-grid-head">
                                <div style="padding-top:5px;padding-bottom:5px">
                                    <div class="ftitle" style="color:#602010">{RecCode}</div>
                                     <div style="font-size:11px;"><nobr class="ftitle" style="color:#008080">{CarNumber}</nobr>&nbsp;-&nbsp;{Brand}&nbsp;-&nbsp;{Model}</div>
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
                                     <div class="ftitle">{ContractStartDate}&nbsp;{ContractStartTime}</div>
                                     <div class="ftitle">Price:&nbsp;<nobr class="ftitle" style="color:#602010">{TotalAmount:fix(3)}</nobr></div>
                                     <div class="ftitle">Balance:&nbsp;<nobr class="ftitle" style="color:#602010">{AmountDue:fix(3)}</nobr></div>
                                   
                                </pre>
                <pre columnid="CreationDetails">
<%--                                     <div class="ftitle" style="color:#808000">{OutLocation}</div>--%>
                                     <div class="ftitle" style="color:#101080">{CreatedBy}</div>
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
                            ContractDetails: { caption: 'Contract & Car Details', width: '270px' },
                            CustomerDetails: { caption: 'Customer Details', width: '270px' },
                            ContractDateTimeDetails: { caption: 'Contract Date & Time', width: '165px' },
                            CreationDetails: { caption: 'Creation Details', width: '165px' },
                            RecId: { width: '0px' }
                        },
                        forms: {
                            NewFormId: 'frmSalesContracts',
                            EditFormId: 'frmSalesContracts',
                            Keys: 'RecId'
                        }
                    };
                </script>
            </GridConfig>
            <Scripts>
                <script>
                    var fn = Sales.SalesContracts.grdSalesContracts;
                </script>
            </Scripts>
        </AW:DataGrid>
        <br />


    </Childern>
</AW:Container>



<div class='LOVPopup' lovpopupid='customerPopup' style="display: none">
    <AW:Form ID="frmSalesContracts_Cust_ShUc" runat="server" Hidden="true" LoadOnInit="false" ShowOnLoad="true" DataSource="SEL_iRental_Contracts_Customers" AsyncForm="~/Pages/eForms/iRental/RentalContracts_Cust_ShUc.ascx">

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
    <AW:DataGrid ID="grdSalesContracts_Cust" LoadOnInit="false" ShowOnLoad="true" runat="server" Hidden="true" Columns="1" Forms="frmSalesContracts_Cust_ShUc"
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
                        NewFormId: 'frmSalesCustomerDetails',
                        Keys: 'RecId'
                    }
                };
            </script>


        </GridConfig>


    </AW:DataGrid>

    <AW:Form ID="frmSalesCustomerDetails" Hidden="true" DataSource="SEL_iRental_Contracts_Customers" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/eForms/iRental/CustomerDetails_FrUc.ascx">
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




<AW:Form ID="frmSalesContracts" Hidden="true" DataSource="SEL_iRental_SalesContracts" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/eForms/iRental/SalesContracts_FrUc.ascx">
    <WidgetConfig>
        <script>
            cf = {

                header: {
                    Style: {},
                    Visible: true,
                    Collapsed: false,
                    HeadText: 'Sales Contracts'
                }
            }
        </script>
    </WidgetConfig>
</AW:Form>

<div class='LOVPopup' lovpopupid='carPopup' style="display: none">
    <AW:Form ID="frmSalesContracts_Cars" runat="server" Hidden="true" LoadOnInit="false" ShowOnLoad="true" DataSource="SEL_iRental_CarsForSale" AsyncForm="~/Pages/eForms/iRental/SalesContracts_Cars_ShUc.ascx">
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
    <AW:DataGrid ID="grdSalesContracts_Cars" LoadOnInit="false" ShowOnLoad="true" runat="server" Hidden="true" Columns="1" Forms="frmSalesContracts_Cars"
        EmptyHeight="201px" AllowNew="true" SelectableRow="false"
        PageSize="10" DataSource="SEL_iRental_CarsForSale" ContainerMargin="5px" AutoSearch="none" GridTemplate="jQueryUI"
        GridHeadText="Select Car" GridButtons="{\'new\':{visible:false},\'delete\':{visible:false}}">

        <GridConfig>
            <script>
                var cf = {
                    cols: {
                        Sequence: { width: '0px' },
                        RecId: { width: '0px' },
                        RecCode: { width: '0px' },
                        ChassisNo: { width: '100px' },
                        CarNumber: { caption: 'Car No.', width: '80px' },
                        BrandId: { caption: 'Brand', width: '120px' },
                        ModelId: { caption: 'Model', width: '140px' },
                        TypeId: { caption: 'Type', width: '80px' },
                        CarYear: { caption: 'Year', width: '80px' },
                        ColorId: { caption: 'Color', width: '80px' },
                        InsuranceExpiry: { caption: 'Normal Ins.', width: '0px' },
                        FullInsuranceExpiry: { caption: 'Full Ins.', width: '0px' },
                        CurrentMileage: { caption: 'Mileage', width: '100px' },
                        CarLocationId: { width: '0px' },
                        Status: { width: '100px' },
                        ContractNo: { caption: 'Contract No.' }


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
                        
                        p.CarType = val('CarType', AsyncWidgets.get('frmSalesContracts').el);;
                        p.DBAction = 'popupCars';
                        console.log(p.CarType);
                        console.log(p.DBAction);
                    });

                    //$('table[itemno]', t.el).click(function () {

                    //    $('[argumentid="Price"]', t.el).val($('[colid="Price"] .ColValue', this).text().toFixed(3));

                    //});
                    function getAmountInWordsSalesContract(v) {

                        if (!v) return '';
                        else {
                            v = parseFloat(v);
                        }
                        var arr = v.fix(3).toString().split('.');
                        var des = cnvrt2Upper(toWords(arr[0])) + 'KD';
                        if (arr.length == 2) {
                            var num = parseInt(arr[1]);
                            if (num > 0) {
                                des += ' and ' + cnvrt2Upper(toWords(arr[1])) + 'Fils';
                            }
                        }
                        return des + ' Only';
                    }

                    t.on('rowsRendered', function ()
                    {
                        $('table[itemno]', t.el).click(function ()
                        {
                         
                            var priceValue = parseFloat($('[colid="Price"]  .ColValue', this).text()).toFixed(3);
                            parseFloat($('[argumentid="Price"]', f).val(`${priceValue}`));
                            parseFloat($('[argumentid="TotalAmount"]', f).val(`${priceValue}`));
                            $('[argumentid="AmountInWordsSalesContract"]').val(getAmountInWordsSalesContract(priceValue));
                            var carNumber = $('[colid="CarNumber"]  .ColValue', this).text();
                            if (!!carNumber) {
                                $('[argumentid="CarNumber"]', f).text(carNumber);
                            }
                            else {

                                $('[argumentid="CarNumber"]', f).text('');
                            }
                        });

                    });
                    
                    
                  
                }
            </script>
        </Scripts>
    </AW:DataGrid>
</div>


