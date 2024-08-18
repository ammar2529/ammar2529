<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GarageCarServiceDetails.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.Modules.GarageCarServiceDetails" %>


<%@ Register Src="~/AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="AW" %>

<script src="../../../../Scripts/eForms/iRental/frmCarServiceDetails.js"></script>

<AW:Container ID="conCarServiceDetails" Hidden="true" Caption="Car Service Details" runat="server">
    <Childern>
      

          <AW:Form ID="frmCarServiceDetails_ShUc" runat="server" Hidden="true" LoadOnInit="false" ShowOnLoad="true" DataSource="SEL_iRental_CarsForSale" AsyncForm="~/Pages/eForms/iRental/GarageCarServiceDetails_ShUc.ascx">
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

          <AW:DataGrid ID="grdCarServiceDetails" LoadOnInit="false" ShowOnLoad="true" runat="server" Hidden="true" Columns="1" Forms="frmCarServiceDetails_ShUc"
            EmptyHeight="201px" AllowNew="true" SelectableRow="true"
            PageSize="10" DataSource="SEL_iRental_CarServiceDetails" ContainerMargin="5px" AutoSearch="OnLoad" GridTemplate="jQueryUI"
            GridHeadText="Car Service Details" GridButtons="{\'delete\':{conf:{Command:\'UPD_iRental_CarServiceDetails\',KeysCol:\'RecId\'}}}">
            <ColumnTemplates>
                <pre columnid="ContractDetails" class="w-grid-head">
                                <div style="padding-top:5px;padding-bottom:5px">
                                    <div class="ftitle" style="color:#602010">{RecCode}</div>
                                     <div style="font-size:11px;"><nobr class="ftitle" style="color:#008080">{CarNumber}</nobr>&nbsp;-&nbsp;{BrandId}&nbsp;-&nbsp;{ModelId}&nbsp;-&nbsp;{ColorId}</div>
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
                                    <div class="ftitle">Receive: {CarRecivedDate}</div>
                                     <div class="ftitle">Delivery: {CarToBeDeliverdDate}</div>
                                     <div class="ftitle">Deliverd: {CarDeliverdDate}</div>
                                     
                                    <%-- <div class="ftitle">Price:&nbsp;<nobr class="ftitle" style="color:#602010">{TotalAmount:fix(3)}</nobr></div>
                                     <div class="ftitle">Balance:&nbsp;<nobr class="ftitle" style="color:#602010">{AmountDue:fix(3)}</nobr></div>--%>
                                   
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
                            ContractDetails: { caption: 'Car Details', width: '270px' },
                            CustomerDetails: { caption: 'Customer Details', width: '270px' },
                            ContractDateTimeDetails: { caption: "Date's", width: '165px' },
                            CreationDetails: { caption: 'Creation Details', width: '165px' },
                            RecId: { width: '0px' }
                        },
                        forms: {
                            NewFormId: 'frmCarServiceDetails',
                            EditFormId: 'frmCarServiceDetails',
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

</AW:Container>


<AW:Form ID="frmCarServiceDetails" Hidden="true" DataSource="SEL_iRental_CarServiceDetails" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/eForms/iRental/GarageCarServiceDetails_FrUc.ascx">
    <WidgetConfig>
        <script>
            cf = {

                header: {
                    Style: {},
                    Visible: true,
                    Collapsed: false,
                    HeadText: 'Car Service Details'
                }
            }
        </script>
    </WidgetConfig>
  
</AW:Form>


<div class='LOVPopup' lovpopupid='carPopupGarage' style="display: none">
    <AW:Form ID="frmCarServiceDetails_Cars" runat="server" Hidden="true" LoadOnInit="false" ShowOnLoad="true" DataSource="SEL_GRG_SearchCarFor_CarAndCustomerDetils" AsyncForm="~/Pages/eForms/iRental/SalesContracts_Cars_ShUc.ascx">
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
    <AW:DataGrid ID="grdCarServiceDetails_Cars" LoadOnInit="false" ShowOnLoad="true" runat="server" Hidden="true" Columns="1" Forms="frmCarServiceDetails_Cars"
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
                        TypeId: { caption: 'Type', width: '60px' },
                        CarLocationId: { caption: 'Car Location', width: '0px' },
                        CarStatusId: { caption: 'Car Status', width: '100px' },

                        FullInsuranceCompanyId: { width: '0px' },
                        FullInsuranceExpiry: { width: '0px' },
                        FullInsurancePolicyNo: { width: '0px' },

                        CarYear: { caption: 'Year', width: '60px' },
                        ColorId: { caption: 'Color', width: '80px' },
                        Nationality: { width: '0px' },
                        MobileTelephone1: { width: '0px' },
                        MobileTelephone2: { width: '0px' },
                        NationalIDNo: { width: '0px' },
                        NationalityID: { width: '0px' },
                        Gender: { width: '0px' }
                        
                        //CurrentMileage: { caption: 'Mileage', width: '70px' },
                        //CarLocationId: { width: '0px' },
                        //CarStatusId: { caption: 'Car Status', width: '90px' },
                        //Status: { width: '100px' },
                        //ContractNo: { caption: 'Contract No.' }


                    }
                };
            </script>
        </GridConfig>
        <Scripts>
            <script>
                var fn = function ()
                {
                    var conCar = AsyncWidgets.get("conRentalContracts_Cars");
                    var f = conCar._frm;
                    t.on('beforeSearchGetForm', function (p)
                    {
                        /*Ext.apply(p, { conSalesContracts: $('[argumentid="CarType"]').val() });*/
                       
                   /*     p.ChassisNo = val('ChassisNo', AsyncWidgets.get('frmCarServiceDetails').el);*/
                        p.DBAction = 'searchCars';
                    
                        console.log(p.DBAction);
                    });

                  


                    t.on('rowsRendered', function ()
                    {
                        $('table[itemno]', t.el).click(function ()
                        {
                            debugger
                            var FullInsuranceCompanyId = $('[colid="FullInsuranceCompanyId"]  .ColValue', this).text();
                            var FullInsuranceExpiry = $('[colid="FullInsuranceExpiry"]  .ColValue', this).text();
                            var FullInsurancePolicyNo = $('[colid="FullInsurancePolicyNo"]  .ColValue', this).text();
                            var NationalIDNo =  $('[colid="NationalIDNo"]  .ColValue', this).text();
                            if (!!FullInsuranceCompanyId)
                            {
                                $('[argumentid="FullInsuranceCompanyId"]', f).text(FullInsuranceCompanyId);
                            }
                            else
                            {

                                $('[argumentid="FullInsuranceCompanyId"]', f).text('');
                              
                            }


                            if (!!FullInsuranceExpiry)
                            {
                                $('[argumentid="FullInsuranceExpiry"]', f).text(FullInsuranceExpiry);
                            }
                            else
                            {

                                $('[argumentid="FullInsuranceExpiry"]', f).text('');
                            }

                            if (!!FullInsurancePolicyNo)
                            {
                                $('[argumentid="FullInsurancePolicyNo"]', f).text(FullInsurancePolicyNo);
                            }
                            else
                            {

                                $('[argumentid="FullInsurancePolicyNo"]', f).text('');
                            }

                            if (!!NationalIDNo)
                            {
                                
                                // Remove newline characters and excess whitespace
                                let cleanedData = NationalIDNo.replace(/\n/g, '').replace(/\s+/g, ' ').trim();
                                let toString = cleanedData.toString();
                                $('[argumentid="NationalIDNo"]', t.el).text('');
                                $('[argumentid="NationalIDNo"]', t.el).text(toString);
                                console.log(cleanedData); // For debugging
                            }


                        });

                    });



                }
            </script>
        </Scripts>
    </AW:DataGrid>
</div>
