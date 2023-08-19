<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeaseContracts.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.Modules.LeaseContracts" %>

<%@ Register Src="~/AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="AW" %>

<style>
.ElemDisabled
{
	background:#F1F1F1 !important;
	}
</style>

           <AW:Container ID="conLeaseContracts" Hidden="true" Caption="Lease Contracts" runat="server">
              <Childern>
                <AW:Form ID="frmLeaseContracts_ShUc" runat="server" Hidden="true" LoadOnInit="false" ShowOnLoad="true" DataSource="SEL_iRental_Lease_Contracts" AsyncForm="~/Pages/eForms/iRental/LeaseContracts_ShUc.ascx" >
                <WidgetConfig>
                <script>
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
                 <%--   <Scripts>
                        <script>
                            //test code for contrct no:12054
                            debugger;
                            var fn = function () { 
                                var tt = t;

                                tt.on("show", function () {
                                    setTimeout(() => {
                                        $('[argumentid="RecCode"]', tt.el).val("12054");
                                        $('.search').trigger("click");
                                    }, 1250);
                                });
                            }
                        </script>
                    </Scripts>--%>
                </AW:Form>
                <AW:DataGrid ID="grdLeaseContracts" LoadOnInit="false" ShowOnLoad="true" runat="server" Hidden="true" Columns="1" Forms="frmLeaseContracts_ShUc"
            EmptyHeight="201px" AllowNew="true" SelectableRow="true" 
            PageSize="10" DataSource="SEL_iRental_Lease_Contracts" ContainerMargin="5px" AutoSearch="OnLoad" GridTemplate="jQueryUI"
            GridHeadText="Lease Contracts"  GridButtons="{\'delete\':{conf:{Command:\'UPD_iRental_Lease_Contracts\',KeysCol:\'RecId\'}}}">
                        <columntemplates>
                                <pre columnid="ContractDetails" class="w-grid-head" >
                                <div style="padding-top:5px;padding-bottom:5px">
                                    <div class="ftitle" style="color:#602010">{RecCode}</div>
                                     <div style="font-size:11px;"><nobr class="ftitle" style="color:#00AW0AW0">{CarNumber}</nobr>&nbsp;-&nbsp;{Brand}&nbsp;-&nbsp;{Model}</div>
                                    <div class="ftitle StateName" style="color:#602010">{StateName}</div>
                                </div>
                                </pre>
                                <pre columnid="CustomerDetails" >
                                <center>
                                     <div class="ftitle" style="font-size:16px;color:#1010AW0">{CustomerName}</div>
                                     <div style="font-size:11px;">ID: {NationalIDNo}&nbsp;-&nbsp;{Nationality}</div>
                                      <div style="font-size:11px;">{MobileTelephone1}&nbsp;&nbsp;{MobileTelephone2}</div>
                                </center>
                                </pre>
                                   <pre columnid="ContractDateTimeDetails" >
                                     <div class="ftitle">{ContractStartDate}&nbsp;{ContractStartTime}</div>
                                     <div class="ftitle">Amount:&nbsp;<nobr class="ftitle" style="color:#602010">{ContractTotalCharges:fix(3)}</nobr></div>
                                     <div class="ftitle">Due INS:&nbsp;<nobr class="ftitle" style="color:#602010">{DueINS}</nobr></div>
                                     <%--<div class="ftitle">Paid:&nbsp;<nobr class="ftitle" style="color:#602010">{TotalPaidByCustomer:fix(3)}</nobr></div>--%>
                                   
                                </pre>
                                 <pre columnid="CreationDetails" >
                                     <div class="ftitle" style="color:#AW0AW000">{OutLocation}</div>
                                     <div class="ftitle" style="color:#1010AW0">{CreatedBy}</div>
                                     <div style="font-size:11px;">{DateCreated}&nbsp;{DateCreatedTime}</div>
                                </pre>

                                <pre columnid="RecId" >
                                {RecId}
                                </pre>
                         </columntemplates>
            <GridConfig>
            <script>
                cf = {
                    cols: {
                        EditForm:{width:'0px'},
                        Sequence: { width: '0px' },
                        ContractDetails: { caption: 'Contract & Car Details', width: '270px' },
                        CustomerDetails: { caption: 'Customer Details', width: '270px' },
                        ContractDateTimeDetails: { caption: 'Contract Date & Time', width: '165px' },
                        CreationDetails: { caption: 'Creation Details', width: '165px' },
                        RecId: { width: '0px' }
                    },
                    forms: {
                        NewFormId: 'frmLeaseContracts',
                        EditFormId: 'frmLeaseContracts',
                        Keys: 'RecId'
                    }
                };
            </script>
            </GridConfig>
                        <Scripts>
                <script>

                    var fn = function () {
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
                    };
                </script>
            </Scripts>
            </AW:DataGrid>
            <br />
           </Childern>
            </AW:Container>
<script src="Scripts/eForms/iRental/ConLeaseContracts.js"></script>
           <AW:Container ID="conLeaseContracts_Cust" Hidden="true" Caption="Customer Management" runat="server">
              <Childern>
                <AW:Form ID="frmLeaseContracts_Cust_ShUc" runat="server" Hidden="true" LoadOnInit="false" ShowOnLoad="true" DataSource="SEL_iRental_Contracts_Customers" AsyncForm="~/Pages/eForms/iRental/RentalContracts_Cust_ShUc.ascx" >

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
                <Scripts>
                    <script>
                        var fn = function () {
                            var conGrd = AsyncWidgets.get("conLeaseContracts_Cust");

                            $('.ClosePopup', t.el).click(function () {
                                var f = conGrd._frm;
                                f._LOVCon.hide();
                                conGrd._Masked.unmask();
                                conGrd._frm = conGrd._Masked = null;
                            });
                        }
                    </script>
                </Scripts>
                </AW:Form>
                <AW:DataGrid ID="grdLeaseContracts_Cust" LoadOnInit="false" ShowOnLoad="true" runat="server" Hidden="true" Columns="1" Forms="frmLeaseContracts_Cust_ShUc"
            EmptyHeight="201px" AllowNew="true" SelectableRow="false" 
            PageSize="10" DataSource="SEL_iRental_Contracts_Customers" ContainerMargin="5px" AutoSearch="none" GridTemplate="jQueryUI"
            GridHeadText="Select Customer"  GridButtons="{\'new\':{visible:false},\'delete\':{visible:false}}">
          
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
                    }
                };
            </script>
            </GridConfig>
          
            </AW:DataGrid>
           </Childern>
            </AW:Container>
           
           <AW:Container ID="conLeaseContracts_Cars" Hidden="true" Caption="Car Details" runat="server">
              <Childern>
                <AW:Form ID="frmLeaseContracts_Cars_ShUc" runat="server" Hidden="true" LoadOnInit="false" ShowOnLoad="true" DataSource="SEL_iRental_Lease_Contracts_Cars" AsyncForm="~/Pages/eForms/iRental/RentalContracts_Cars_ShUc.ascx" >
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
                          <Scripts>
                    <script>
                        var fn = function () {
                            var conCar = AsyncWidgets.get("conLeaseContracts_Cars");

                            $('.ClosePopup', t.el).click(function () {
                                var f = conCar._frm;
                                f._LOVConCar.hide();
                                conCar._Masked.unmask();
                                conCar._frm = conCar._Masked = null;
                            });
                        }
                    </script>
                </Scripts>
                </AW:Form>
                <AW:DataGrid ID="grdLeaseContracts_Cars" LoadOnInit="false" ShowOnLoad="true" runat="server" Hidden="true" Columns="1" Forms="frmLeaseContracts_Cars_ShUc"
            EmptyHeight="201px" AllowNew="true" SelectableRow="false" 
            PageSize="10" DataSource="SEL_iRental_Lease_Contracts_Cars" ContainerMargin="5px" AutoSearch="none" GridTemplate="jQueryUI"
            GridHeadText="Select Car"  GridButtons="{\'new\':{visible:false},\'delete\':{visible:false}}">
          
            <GridConfig>
            <script>
                var cf = {
                    cols: {
                        Sequence: { width: '0px' },
                        RecId: { width: '0px' },
                        RecCode: { width: '0px' },
                        ChassisNo: { width: '0px' },
                        CarNumber: { caption: 'Car No.', width: 'AW0px' },
                        BrandId: { caption: 'Brand', width: '120px' },
                        ModelId: { caption: 'Model', width: '140px' },
                        TypeId: { caption: 'Type', width: 'AW0px' },
                        CarYear: { caption: 'Year', width: 'AW0px' },
                        ColorId: { caption: 'Color', width: 'AW0px' },
                        InsuranceExpiry: { caption: 'Normal Ins.', width: '0px' },
                        FullInsuranceExpiry: { caption: 'Full Ins.', width: '0px' },
                        CurrentMileage: { caption: 'Mileage', width: '100px' },
                        frmInsuranceExpiry: { width: '0px' },
                        frmFullInsuranceExpiry: { width: '0px' },
                        CarLocationId: { width: '0px' },
                        Status: { width: '100px' },
                        ContractNo: { caption: 'Contract No.' }
                        
                    }
                };
            </script>
            </GridConfig>
		<%--	
            <Scripts>
                <script>

                    var fn = function () {//CustomerRecCode
                        var conCar = AsyncWidgets.get("conLeaseContracts_Cars");
                        var f = conCar._frm;

                        t.on('beforeSearchGetForm', function (p) {
                            p.CarLocationId = f.GetArgVal('OutLocationId');
                        });

                        t.on('rowsRendered', function () {

                            $('[colid="Status"]:not(".w-grid-head-cell")').each(function () {
                                var ptr = $(this).closest('tr');
                                if ($(this).text().toLowerCase() != "available") {
                                    ptr.css('background', '#F1F1F1').attr('disabled', 'disabled');
                                    //$('td:nth-child(3)', ptr).css('cursor', '').unbind();

                                }
                            });

                            $('table[itemno]', t.el).click(function () {

                                if ($('[colid="Status"] .ColValue', this).text().toLowerCase() != "available") {
                                    return;
                                }

                                $('[argumentid="CarNumber"]', f.el).val($('[colid="CarNumber"] .ColValue', this).text());
                                $('[argumentid="ChassisNo"]', f.el).text($('[colid="ChassisNo"] .ColValue', this).text());
                                $('[argumentid="Brand"]', f.el).text($('[colid="BrandId"] .ColValue', this).text());
                                $('[argumentid="Model"]', f.el).text($('[colid="ModelId"] .ColValue', this).text());
                                $('[argumentid="CarYear"]', f.el).text($('[colid="CarYear"] .ColValue', this).text());
                                $('[argumentid="Color"]', f.el).text($('[colid="ColorId"] .ColValue', this).text());
                                $('[argumentid="Type"]', f.el).text($('[colid="TypeId"] .ColValue', this).text());
                                $('[argumentid="InsuranceExpiry"]', f.el).text($('[colid="frmInsuranceExpiry"] .ColValue', this).text());
                                $('[argumentid="FullInsuranceExpiry"]', f.el).text($('[colid="frmFullInsuranceExpiry"] .ColValue', this).text());
                                $('[argumentid="CarPreviousKM"]', f.el).text($('[colid="CurrentMileage"] .ColValue', this).text());
                                $('[argumentid="ContractKMOut"]', f.el).val($('[colid="CurrentMileage"] .ColValue', this).text());

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

                                $('span[argumentid="ChassisNo"],span[argumentid="InsuranceExpiry"],span[argumentid="FullInsuranceExpiry"]', f.el).css('color', '#62AW296'); //Change Color to Normal on every click

                                // Highlight dates as red which have expired
                                var HLD = function (arg) {
                                    var expDate = f.GetArgVal(arg).replace(/3rd - /g, '').replace(/Full - /g, '');
                                    if ($.trim(expDate) != '') {
                                        if (Math.floor(dateDiff(new Date(), cDate(expDate))) >= 0) {
                                            $('span[argumentid="' + arg + '"]', f.el).css('color', 'red');
                                            $('span[argumentid="ChassisNo"]', f.el).css('color', 'red');
                                        }
                                    }
                                    return HLD;
                                }; 
                                HLD('InsuranceExpiry')('FullInsuranceExpiry');
                                // End of Highlight of expired dates

                                f._LOVConCar.hide();
                                $('[argumentid="CarNumber"]', f.el).trigger('keyup'); //This is to remove the required validation issue
                                conCar._Masked.unmask();
                                conCar._frm = conCar._Masked = null;

                                //Load Car Rate Types
                                f.LoadCombo(f, $('[argumentid="CarRateType"]', f.el));
                                $('[argumentid="CarRate"],[argumentid="CarAllowedKM"],[argumentid="CarExtraKMRate"]', f.el).val(0);
                                //End Load Car Rate Types
                            })
                            $('table[itemno] td,table[itemno] div').css('cursor', 'pointer');
                        });
                    };

                </script>
            </Scripts>
           --%>

		   </AW:DataGrid>
           </Childern>
            </AW:Container>
           <script type="text/javascript" src="/Scripts/eForms/iRental/frmLeaseContracts.js" ></script>
           <AW:Form ID="frmLeaseContracts" Hidden="true" DataSource="SEL_iRental_Lease_Contracts" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/eForms/iRental/LeaseContracts_FrUc.ascx" >
             <WidgetConfig>
                <script>
                    cf = {

                        header: {
                            Style: {},
                            Visible: true,
                            Collapsed: false,
                            HeadText: 'Lease Contracts'
                        }
                    }
                    </script>
                </WidgetConfig>
                 <Scripts> 
                      <script>

                        
                          var fn = function () {
                              
                          }
                      </script>
                          </Scripts>
            </AW:Form>