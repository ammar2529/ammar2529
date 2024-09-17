<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CarAndCustomerDetails.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.Modules.CarAndCustomerDetails" %>
<%@ Register Src="~/AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="AW" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="AW" %>
<script src="../../../../Scripts/eForms/iRental/grdCarAndServiceDetailsContracts_Cust.js"></script>
<AW:Container ID="conCarAndCustomerDetails" Hidden="true" Caption="Sales Contracts" runat="server">
    <Childern>
        <AW:Form ID="frmCarAndServiceDetails_ShUc" runat="server" Hidden="true" LoadOnInit="false" ShowOnLoad="true" DataSource="SEL_GRG_CarAndCustomerDetails" AsyncForm="~/Pages/eForms/iRental/GRG_CarAndCustomerDetails_ShUc.ascx">
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


        <AW:DataGrid ID="grdfrmCarAndServiceDetails" LoadOnInit="false" ShowOnLoad="true" runat="server" Hidden="true" Columns="1" Forms="frmCarAndServiceDetails_ShUc"
            EmptyHeight="201px" AllowNew="true" SelectableRow="true"
            PageSize="10" DataSource="SEL_GRG_CarAndCustomerDetails" ContainerMargin="5px" AutoSearch="OnLoad" GridTemplate="jQueryUI"
            GridHeadText="Car & Customer Details" GridButtons="{\'delete\':{conf:{Command:\'UPD_GRG_CarAndCustomerDetails\',KeysCol:\'RecId\'}}}">
            <ColumnTemplates>
                <pre columnid="ContractDetails" class="w-grid-head">
                                <div style="padding-top:5px;padding-bottom:5px">
                                    <div class="ftitle" style="color:#602010">{RecCode}</div>
                                     <div style="font-size:11px;"><nobr class="ftitle" style="color:#008080">{CarNumber}{OtherCarNumber}</nobr>&nbsp;-&nbsp;{BrandId}{Brand}&nbsp;-&nbsp;{ModelId}{Model}&nbsp;-&nbsp;{CarYear}</div>
                                    <div class="ftitle StateName" style="color:#602010;display:none">{StateName}</div>
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
                                     <div class="ftitle">Car For: {CarFor}</div>
                                     <%--<div class="ftitle">Price:&nbsp;<nobr class="ftitle" style="color:#602010">{TotalAmount:fix(3)}</nobr></div>
                                     <div class="ftitle">Balance:&nbsp;<nobr class="ftitle" style="color:#602010">{AmountDue:fix(3)}</nobr></div>--%>
                                   
                                </pre>
                <pre columnid="CreationDetails"> 
                                     <div class="ftitle" style="color:#808000; display:none">{ChassisNo}</div>
                                     <div class="ftitle" style="color:#808000; display:none">{LPONumber}</div>
                                     <div class="ftitle" style="color:#808000; display:none">{CarOwnerNationalIdNumber}</div>
                                        <div class="ftitle" style="color:#808000; display:none">{CarOwnerNationalIdNumber}</div>
                    
                                     <%--<div class="ftitle" style="color:#101080">{Salesman}</div>--%>
                                     <div class="ftitle" style="color:#101080">{CreatedBy}</div>

                                     <div style="font-size:11px;">{DateCreated}&nbsp;{DateCreatedTime}</div>
                                   <%--<div class="ftitle" style="color:#808000">{FinanceCompany}</div>--%>

                    
                                    
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
                            ContractDateTimeDetails: { caption: 'Other Details', width: '165px' },
                            CreationDetails: { caption: 'Creation Details', width: '165px' },
                            RecId: { width: '0px' }
                        },
                        forms: {
                            NewFormId: 'frmCarAndServiceDetails',
                            EditFormId: 'frmCarAndServiceDetails',
                            Keys: 'RecId'
                        }
                        //,
                        //DataActionParams: {
                        //    DBAction: 'SearchCarArriveNotArrive'
                        //}
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
                                
                                $('.chkRowSelect', $(this).closest('tr')).attr('disabled');

                                //if ($(this).text().indexOf('Created') > -1)
                                //{
                                  
                                //    $(this).css('color', 'Green');
                                //}
                                //else if ($(this).text() != '{StateName}')
                                //{
                                //    $('.chkRowSelect', $(this).closest('tr')).attr('disabled', 'disabled');
                                //}

                                //var ptr = $(this).closest('tr');

                                //if ($(this).text().indexOf('Contract Closed - Payment Cleared') > -1)
                                //{
                                //    ptr.css('background', '#F1F1F1').attr('disabled', 'disabled');
                                //}
                                //else if ($(this).text().indexOf('Contract Cancelled') > -1)
                                //{
                                //    ptr.css('background', '#F1F1F1').attr('disabled', 'disabled');
                                //}
                                //else if ($(this).text().indexOf('Contract Open - Car In') > -1)
                                //{
                                //    $(this).css('color', 'Red');
                                //}
                                //else if ($(this).text().indexOf('With Legal - Contract Open - Car Out') > -1)
                                //{
                                //    $(this).css('color', 'Red');
                                //}
                                //else if ($(this).text().indexOf('With Legal - Contract Open - Car In') > -1)
                                //{
                                //    $(this).css('color', 'Red');
                                //}
                                //else if ($(this).text().indexOf('With Legal - Contract Closed - Pending Payment') > -1)
                                //{
                                //    $(this).css('color', 'Red');
                                //}
                                //else if ($(this).text().indexOf('Contract Closed - Pending Payment') > -1)
                                //{
                                //    $(this).css('color', 'Red');
                                //}
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



<div class='LOVPopup' lovpopupid='customerPopup' style="display: none">
    <AW:Form ID="frmCarAndServiceDetails_Cust_ShUc" runat="server" Hidden="true" LoadOnInit="false" ShowOnLoad="true" DataSource="SEL_iRental_Contracts_Customers" AsyncForm="~/Pages/eForms/iRental/RentalContracts_Cust_ShUc.ascx">

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
      <%--  <Scripts>
                    <script>
                        var fn = function ()
                        {
                            var conGrd = AsyncWidgets.get("conRentalContracts_Cust");

                            //$('.ClosePopup', t.el).click(function () {
                            //    var f = conGrd._frm;
                            //    f._LOVCon.hide();
                            //    conGrd._Masked.unmask();
                            //    conGrd._frm = conGrd._Masked = null;
                            //});

                       
                        }
                    </script>
                </Scripts>--%>
    </AW:Form>
    <AW:DataGrid ID="grdCarAndServiceDetailsContracts_Cust" LoadOnInit="false" ShowOnLoad="true" runat="server" Hidden="true" Columns="1" Forms="frmCarAndServiceDetails_Cust_ShUc"
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
             NewFormId: 'frmCarAndServiceDetailsCustomerDetails',
             Keys: 'RecId'
         }
     };
 </script>


 </GridConfig>
         <Scripts>
 <script>
     //var fn = function ()
     //{
         
         
         

     //    //t.on('onLoadedValues', function (args)
     //    //{


     //    //    debugger

     //    //});
     //}
 </script>
 </Scripts>

 </AW:DataGrid>

    <AW:Form ID="frmCarAndServiceDetailsCustomerDetails" Hidden="true" DataSource="SEL_iRental_Contracts_Customers" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/eForms/iRental/CustomerDetails_FrUc.ascx">
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
    </AW:Form>

</div>




<AW:Form ID="frmCarAndServiceDetails" Hidden="true" DataSource="SEL_GRG_CarAndCustomerDetails" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/eForms/iRental/CarAndCustomerDetails_FrUc.ascx">
    <WidgetConfig>
        <script>
            cf = {

                header: {
                    Style: {},
                    Visible: true,
                    Collapsed: false,
                    HeadText: 'Car & Service Details'
                }
            }
        </script>
    </WidgetConfig>
</AW:Form>

<div class='LOVPopup' lovpopupid='carPopupCutomerAndCarDetailsForSales' style="display: none">
    <AW:Form ID="frmCarAndServiceDetails_Cars" runat="server" Hidden="true" LoadOnInit="false" ShowOnLoad="true" DataSource="SEL_CarAndCustomerDetailsForSearchingCar" AsyncForm="~/Pages/eForms/iRental/CarAndCustomerDetails_Car_ShUc.ascx">
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
  
    
    <AW:DataGrid ID="grdCarAndServiceDetails_Cars" LoadOnInit="false" ShowOnLoad="true" runat="server" Hidden="true" Columns="1" Forms="frmCarAndServiceDetails_Cars"
        EmptyHeight="201px" AllowNew="true" SelectableRow="false"
        PageSize="10" DataSource="SEL_CarAndCustomerDetailsForSearchingCar" ContainerMargin="5px" AutoSearch="none" GridTemplate="jQueryUI"
        GridHeadText="Select Sales Car" GridButtons="{\'new\':{visible:false},\'delete\':{visible:false}}">

        

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
             Type: { width: '0px' },
             CarLocationId: { caption: 'Car Location', width: '0px' },
             CarStatusId: { caption: 'Car Status', width: '0px' },
             CustomerRecCode: { caption: 'Rec No.', width: '75px' },
             NationalIDNo: { caption: 'National ID', width: '100px' },
             MobileTelephone1: { caption: 'Mobile Telephone', width: '100px' },
             CarType: {width:'0px'},
             FullInsuranceCompanyId: { width: '0px' },
             FullInsuranceExpiry: { width: '0px' },
             FullInsurancePolicyNo: { width: '0px' },

             CarYear: { caption: 'Year', width: '60px' },
             ColorId: { caption: 'Color', width: '80px' },
             Nationality: { width: '0px' },
           
             MobileTelephone2: { width: '0px' },
             
             Gender: { width: '0px' }


         },
         forms: {
             NewFormId: 'frmCarAndCustomerDetailsAddSaleCar',
             Keys: 'RecId'
         }
     };
   
 </script>
 </GridConfig>
 <Scripts>
 <script>
     var fn = function ()
     {
         
         t.on('beforeSearchGetForm', function (p)
         {

             
             p.DBAction = 'SalesCars';
        
             console.log(p.DBAction);
         });


         t.on('rowsRendered', function ()
         {
             $('table[itemno]', t.el).click(function ()
             {
                 

                 var carValue = $('[colid="CarNumber"]  .ColValue', this).text();
                 $('[lovpopupid="carPopupCutomerAndCarDetailsForSales"]').val(carValue);
                 var NationalIDNo = $('[colid="NationalIDNo"]  .ColValue', this).text();

                 if (!!NationalIDNo)
                 {
                     
                     // Remove newline characters and excess whitespace
                     let cleanedData = NationalIDNo.replace(/\n/g, '').replace(/\s+/g, ' ').trim();
                     
                     $('.NationalIDNo', t.el).text('');
                     let toString = cleanedData.toString();
                     $('.NationalIDNo', t.el).text(toString);
                     console.log(cleanedData); // For debugging
                 }
             });
         });

       
     }
 </script>
 </Scripts>
 </AW:DataGrid>

      <AW:Form ID="frmCarAndCustomerDetailsAddSaleCar" Hidden="true" DataSource="SEL_iRental_CarsForSale" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/eForms/iRental/CarForSales_FrUc.ascx">
        <WidgetConfig>
            <script>
                cf = {

                    header: {
                        Style: {},
                        Visible: true,
                        Collapsed: false,
                        HeadText: 'Add Sales Car'
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
    </AW:Form>
</div>

<div class='LOVPopup' lovpopupid='carPopupCutomerAndCarDetailsForRental' style="display: none">
    <AW:Form ID="frmSearchCarForRental_Car" runat="server" Hidden="true" LoadOnInit="false" ShowOnLoad="true" DataSource="SEL_CarAndCustomerDetailsForSearchingCar" AsyncForm="~/Pages/eForms/iRental/CarAndCustomerDetails_Car_ShUc.ascx">
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
    <AW:DataGrid ID="grdSearchCarForRental" LoadOnInit="false" ShowOnLoad="true" runat="server" Hidden="true" Columns="1" Forms="frmSearchCarForRental_Car"
        EmptyHeight="201px" AllowNew="true" SelectableRow="false"
        PageSize="10" DataSource="SEL_CarAndCustomerDetailsForSearchingCar" ContainerMargin="5px" AutoSearch="none" GridTemplate="jQueryUI"
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
             CustomerRecCode: { caption: 'Rec No.', width: '75px' },
             NationalIDNo: { caption: 'National ID', width: '100px' },
             MobileTelephone1: { caption: 'Mobile Telephone', width: '100px' },
             Type: { width: '0px' },
             FullInsuranceCompanyId: { width: '0px' },
             FullInsuranceExpiry: { width: '0px' },
             FullInsurancePolicyNo: { width: '0px' },

             
            
             Nationality: { width: '0px' },

             MobileTelephone2: { width: '0px' },

             Gender: { width: '0px' }


         },
         forms: {
             NewFormId: 'frmCarAndCustomerDetailsAddRentalCar',
             Keys: 'RecId'
         }
     };
 </script>
 </GridConfig>
 <Scripts>
 <script>
     var fn = function ()
     {
         
      
             
             t.on('beforeSearchGetForm', function (p)
             {
                 
                 p.DBAction = 'RentalCars';

                 console.log(p.DBAction);
             });
     

         t.on('rowsRendered', function ()
         {
             $('table[itemno]', t.el).click(function () {

                 
                 var carValue = $('[colid="CarNumber"] .ColValue', this).text().replace(/\s+/g, ' ').trim();
                 //var FullInsuranceCompanyId = $('[colid="FullInsuranceCompanyId"] .ColValue', this).text().replace(/\s+/g, ' ').trim();
                 //var FullInsuranceExpiry = $('[colid="FullInsuranceExpiry"] .ColValue', this).text().replace(/\s+/g, ' ').trim();
                 //var FullInsurancePolicyNo = $('[colid="FullInsurancePolicyNo"] .ColValue', this).text().replace(/\s+/g, ' ').trim();

                 //// Debugging logs
                 //console.log('carValue:', carValue);
                 //console.log('FullInsuranceCompanyId:', FullInsuranceCompanyId);
                 //console.log('FullInsuranceExpiry:', FullInsuranceExpiry);
                 //console.log('FullInsurancePolicyNo:', FullInsurancePolicyNo);

                 //// Update values
                 $('[lovpopupid="carPopupCutomerAndCarDetailsForRental"]').val(carValue || '');
                 //$('[argumentid="FullInsuranceCompanyId"]', t.el).text(FullInsuranceCompanyId || '');
                 //$('[argumentid="FullInsuranceExpiry"]', t.el).text(FullInsuranceExpiry || '');
                 //$('[argumentid="FullInsurancePolicyNo"]', t.el).text(FullInsurancePolicyNo || '');
                
             });
         });

     }
 </script>
 </Scripts>
 </AW:DataGrid>

     <AW:Form ID="frmCarAndCustomerDetailsAddRentalCar" Hidden="true" DataSource="SEL_iRental_Cars" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/eForms/iRental/CarDetails_FrUc.ascx">
        <WidgetConfig>
            <script>
                cf = {

                    header: {
                        Style: {},
                        Visible: true,
                        Collapsed: false,
                        HeadText: 'Add Rental Car'
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
    </AW:Form>
</div>

<div class='LOVPopup' lovpopupid='carPopupCutomerAndCarDetailsForLease' style="display: none">
    <AW:Form ID="frmSearchCarForLease_Car" runat="server" Hidden="true" LoadOnInit="false" ShowOnLoad="true" DataSource="SEL_CarAndCustomerDetailsForSearchingCar" AsyncForm="~/Pages/eForms/iRental/CarAndCustomerDetails_Car_ShUc.ascx">
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
    <AW:DataGrid ID="grdSearchCarForLease" LoadOnInit="false" ShowOnLoad="true" runat="server" Hidden="true" Columns="1" Forms="frmSearchCarForLease_Car"
        EmptyHeight="201px" AllowNew="true" SelectableRow="false"
        PageSize="10" DataSource="SEL_CarAndCustomerDetailsForSearchingCar" ContainerMargin="5px" AutoSearch="none" GridTemplate="jQueryUI"
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
             CustomerRecCode: { caption: 'Rec No.', width: '75px' },
             NationalIDNo: { caption: 'National ID', width: '100px' },
             MobileTelephone1: { caption: 'Mobile Telephone', width: '100px' },
             Type: { width: '0px' },
             FullInsuranceCompanyId: { width: '0px' },
             FullInsuranceExpiry: { width: '0px' },
             FullInsurancePolicyNo: { width: '0px' },



             Nationality: { width: '0px' },

             MobileTelephone2: { width: '0px' },

             Gender: { width: '0px' }


         },
         forms: {
             NewFormId: 'frmCarAndCustomerDetailsAddLeaseCar',
             Keys: 'RecId'
         }
     };
 </script>
 </GridConfig>
 <Scripts>
 <script>
     var fn = function ()
     {

     
             
             t.on('beforeSearchGetForm', function (p)
             {
                 
                 p.DBAction = 'LeaseCars';

                 console.log(p.DBAction);
             });
         
        
         t.on('rowsRendered', function ()
         {
             $('table[itemno]', t.el).click(function ()
             {
                 

                 var carValue = $('[colid="CarNumber"]  .ColValue', this).text();
                 $('[lovpopupid="carPopupCutomerAndCarDetailsForLease"]').val(carValue);
             });
         });


     }
 </script>
 </Scripts>
 </AW:DataGrid>

     <AW:Form ID="frmCarAndCustomerDetailsAddLeaseCar" Hidden="true" DataSource="SEL_iRental_Cars" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/eForms/iRental/CarDetails_FrUc.ascx">
        <WidgetConfig>
            <script>
                cf = {

                    header: {
                        Style: {},
                        Visible: true,
                        Collapsed: false,
                        HeadText: 'Add Lease Car'
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
    </AW:Form>
</div>

<div class='LOVPopup' lovpopupid='carPopupCutomerAndCarDetailsForOther' style="display: none">
    <AW:Form ID="frmSearchCarForOther_Car" runat="server" Hidden="true" LoadOnInit="false" ShowOnLoad="true" DataSource="SEL_CarAndCustomerDetailsForSearchingCar" AsyncForm="~/Pages/eForms/iRental/CarAndCustomerDetails_Car_ShUc.ascx">
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
    <AW:DataGrid ID="grdSearchCarForOther" LoadOnInit="false" ShowOnLoad="true" runat="server" Hidden="true" Columns="1" Forms="frmSearchCarForOther_Car"
        EmptyHeight="201px" AllowNew="true" SelectableRow="false"
        PageSize="10" DataSource="SEL_CarAndCustomerDetailsForSearchingCar" ContainerMargin="5px" AutoSearch="none" GridTemplate="jQueryUI"
        GridHeadText="Select Car" GridButtons="{\'new\':{visible:true},\'delete\':{visible:false}}">

        

 <GridConfig>
 <script>
     var cf = {
         cols: {
             Sequence: { width: '0px' },
             RecId: { width: '0px' },
             RecCode: { width: '0px' },
             ChassisNo: { width: '150px' },
             CarNumber: { caption: 'Car No.', width: '80px' },
             BrandId: { caption: 'Brand', width: '60px' },
             ModelId: { caption: 'Model', width: '90px' },
             TypeId: { caption: 'Type', width: '60px' },
             CarYear: { caption: 'Year', width: '60px' },
             ColorId: { caption: 'Color', width: '80px' },
             FullInsuranceCompanyId: {with:'0px'},
             FullInsuranceExpiry: { caption: 'Normal Ins.', width: '0px' },
             FullInsurancePolicyNo: { caption: 'Full Ins.', width: '0px' },
             //CurrentMileage: { caption: 'Mileage', width: '70px' },
             //CarLocationId: { width: '0px' },
             //CarStatusId: { caption: 'Car Status', width: '90px' },
             //Status: { width: '100px' },
             //ContractNo: { caption: 'Contract No.' }


         },
         forms: {
             NewFormId: 'frmCarAndCustomerDetailsAddOtherCar',
             Keys: 'RecId'
         }
     };
 </script>
 </GridConfig>
 <Scripts>
 <script>
     var fn = function ()
     {

         t.on('beforeSearchGetForm', function (p)
         {


             p.DBAction = 'OtherCars';

             console.log(p.DBAction);
         });
     

         t.on('rowsRendered', function ()
         {
             $('table[itemno]', t.el).click(function ()
             {
                 

                 var carValue = $('[colid="CarNumber"]  .ColValue', this).text();
                 $('[lovpopupid="carPopupCutomerAndCarDetailsForOther"]').val(carValue);
             });
         });

     }
 </script>
 </Scripts>
 </AW:DataGrid>

     <AW:Form ID="frmCarAndCustomerDetailsAddOtherCar" Hidden="true" DataSource="SEL_GRG_OtherCars" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/eForms/iRental/GRG_OtherCars_FrUc.ascx">
        <WidgetConfig>
            <script>
                cf = {

                    header: {
                        Style: {},
                        Visible: true,
                        Collapsed: false,
                        HeadText: 'Add Other Car'
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
    </AW:Form>
</div>