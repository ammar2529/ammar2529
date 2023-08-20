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
                    /** changes from dastoor */
                  var  cf = {
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
                                     <div class="ftitle">Charges:&nbsp;<nobr class="ftitle" style="color:#602010">{ContractTotalCharges:fix(3)}</nobr></div>
                                     <div class="ftitle">Balance:&nbsp;<nobr class="ftitle" style="color:#602010">{TotalAmountDue:fix(3)}</nobr></div>
                                   
                                </pre>
                <pre columnid="CreationDetails">
                                     <div class="ftitle" style="color:#808000">{OutLocation}</div>
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


<div class='LOVPopup' lovpopupid='mypopupp' style="display: none">
    <AW:Form ID="frmRentalContracts_Cust_ShUc" runat="server" Hidden="true" LoadOnInit="false" ShowOnLoad="true" DataSource="SEL_iRental_Contracts_Customers" AsyncForm="~/Pages/eForms/iRental/RentalContracts_Cust_ShUc.ascx">

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
        <%--<Scripts>
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

    <AW:DataGrid ID="grdContracts_Cust" LoadOnInit="false" ShowOnLoad="true" runat="server" Hidden="true" Columns="1" Forms="frmRentalContracts_Cust_ShUc"
        EmptyHeight="201px" AllowNew="true" SelectableRow="false"
        PageSize="10" DataSource="SEL_iRental_Contracts_Customers" ContainerMargin="5px" AutoSearch="none" GridTemplate="jQueryUI"
        GridHeadText="Select Customer" GridButtons="{\'new\':{visible:false},\'delete\':{visible:false}}">

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
                        CustomerStatus: { caption: 'Status' },
                        CustomerRecCode: { width: '0px' }

                    }
                };
            </script>
        </GridConfig>
        <%-- <Scripts>
                <script>
                    var fn = function () {//CustomerRecCode
                        var conGrd = AsyncWidgets.get("conRentalContracts_Cust");
                        t.on('rowsRendered', function () {
                            $('table[itemno]', t.el).click(function () {
                                debugger;
                                var f = conGrd._frm;
                                $('[argumentid="CustomerRecCode"]', f.el).val($('[colid="RecCode"] .ColValue', this).text());
                                $('[argumentid="CustomerName"]', f.el).text($('[colid="CustomerName"] .ColValue', this).text());
                                $('[argumentid="CustomerType"]', f.el).text($('[colid="CustomerType"] .ColValue', this).text());
                                $('[argumentid="Nationality"]', f.el).text($('[colid="Nationality"] .ColValue', this).text());
                                $('[argumentid="Gender"]', f.el).text($('[colid="Gender"] .ColValue', this).text());
                                $('[argumentid="PassportNo"]', f.el).text($('[colid="PassportNo"] .ColValue', this).text());
                                $('[argumentid="PassportExpiry"]', f.el).text($('[colid="PassportExpiry"] .ColValue', this).text());
                                $('[argumentid="NationalIDNo"]', f.el).text($('[colid="NationalIDNo"] .ColValue', this).text());
                                $('[argumentid="NationalIDExpiryDate"]', f.el).text($('[colid="NationalIDExpiryDate"] .ColValue', this).text());
                                $('[argumentid="DrivingLicenseNo"]', f.el).text($('[colid="DrivingLicenseNo"] .ColValue', this).text());
                                $('[argumentid="DrivingLicenseExpiry"]', f.el).text($('[colid="DrivingLicenseExpiry"] .ColValue', this).text());
                                $('[argumentid="WorkTelephone"]', f.el).text($('[colid="WorkTelephone"] .ColValue', this).text());
                                $('[argumentid="ResidenceTelephone"]', f.el).text($('[colid="ResidenceTelephone"] .ColValue', this).text());
                                $('[argumentid="MobileTelephone1"]', f.el).text($('[colid="MobileTelephone1"] .ColValue', this).text());
                                $('[argumentid="MobileTelephone2"]', f.el).text($('[colid="MobileTelephone2"] .ColValue', this).text());

                                //Load Commas if both numbers are there
                                if (!!$('[argumentid="WorkTelephone"]', f.el).text() && !!$('[argumentid="ResidenceTelephone"]', f.el).text()) {
                                    $('.CommaWR', f.el).show();
                                }
                                else {
                                    $('.CommaWR', f.el).hide();
                                }

                                if (!!$('[argumentid="MobileTelephone1"]', f.el).text() && !!$('[argumentid="MobileTelephone2"]', f.el).text()) {
                                    $('.CommaM12', f.el).show();
                                }
                                else {
                                    $('.CommaM12', f.el).hide();
                                }
                                //End Commas if both numbers are there

                                // Date Difference Function
                                var cDate = function (date) {
                                    var dttmAr = date.split(' '), dt, tm, nDate;
                                    dt = dttmAr[0].split('/');
                                    if (dttmAr.length > 1) {
                                        tm = dttmAr[1].split(':');
                                        return new Date(dt[2], dt[1] - 1, dt[0], tm[0], tm[1], tm[2]);
                                    }
                                    return new Date(dt[2], dt[1] - 1, dt[0]);
                                };
                                var dateDiff = function (d1, d2) {
                                    return (d1 - d2) / (3600000 * 24);
                                };
                                // End

                                $('span[argumentid="CustomerName"],span[argumentid="PassportExpiry"],span[argumentid="NationalIDExpiryDate"],span[argumentid="DrivingLicenseExpiry"]', f.el).css('color', '#628296'); //Change Color to Normal on every click

                                // Highlight dates as red which have expired
                                var HLD = function (arg) {
                                    var expDate = f.GetArgVal(arg).replace(/3rd - /g, '').replace(/Full - /g, '');
                                    if ($.trim(expDate) != '') {
                                        if (Math.floor(dateDiff(new Date(), cDate(expDate))) >= 0) {
                                            $('span[argumentid="' + arg + '"]', f.el).css('color', 'red');
                                            $('span[argumentid="CustomerName"]', f.el).css('color', 'red');
                                        }
                                    }
                                    return HLD;
                                };
                                HLD('PassportExpiry')('NationalIDExpiryDate')('DrivingLicenseExpiry');
                                // End of Highlight of expired dates

                                f._LOVCon.hide();
                                $('[argumentid="CustomerRecCode"]', f.el).trigger('keyup'); //This is to remove the required validation issue
                                conGrd._Masked.unmask();
                                conGrd._frm = conGrd._Masked = null;
                            })
                            $('table[itemno] td,table[itemno] div').css('cursor', 'pointer');
                        });
                    };
                </script>
            </Scripts>--%>
    </AW:DataGrid>
</div>

<AW:Form ID="frmSalesContracts" Hidden="true" DataSource="SEL_iRental_CarsForSale" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/eForms/iRental/SalesContracts_FrUc.ascx">
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
    <Scripts>
        <script>

            var fn = Sales.SalesContracts.frmSalesContractsInit;

        </script>
    </Scripts>
</AW:Form>

<div class='LOVPopup' lovpopupid='mypopup' style="display: none">
    <AW:Form ID="frmSalesContracts_Cars" runat="server" Hidden="true" LoadOnInit="false" ShowOnLoad="true" DataSource="SEL_iRental_CarsForSale" AsyncForm="~/Pages/eForms/iRental/RentalContracts_Cars_ShUc.ascx">
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
           
            </script>
        </Scripts>
    </AW:DataGrid>
</div>


