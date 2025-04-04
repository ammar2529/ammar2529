<%@ Page Title="" Language="C#" MasterPageFile="~/BuDastoor.Master" AutoEventWireup="true" CodeBehind="testDataTable.aspx.cs" Inherits="WebProject.testDataTable" %>
<%--<%@ Register Src="AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="AW" %>
<%@ Register Src="AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="AW" %>
<%@ Register Src="AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="AW" %>
<%@ Register Src="~/Pages/Common/Home.ascx" TagPrefix="AW" TagName="Home" %>


<%@ Register Src="~/Pages/eForms/iRental/Modules/SalesContracts.ascx" TagPrefix="AW" TagName="SalesContracts" %>
<%@ Register Src="~/Pages/eForms/iRental/Modules/CarForSales.ascx" TagPrefix="AW" TagName="CarForSales" %>
<%@ Register Src="~/Pages/eForms/iRental/Modules/SalesCarPrice.ascx" TagPrefix="AW" TagName="SalesCarPrice" %>
<%@ Register Src="~/Pages/eForms/iRental/Modules/SparePartInventory.ascx" TagPrefix="AW" TagName="SparePartInventory" %>
<%@ Register Src="~/Pages/eForms/iRental/Modules/SparePartInventoryInvoice.ascx" TagPrefix="AW" TagName="SparePartInventoryInvoice" %>
<%@ Register Src="~/Pages/eForms/iRental/Modules/GarageCarServiceDetails.ascx" TagPrefix="AW" TagName="GarageCarServiceDetails" %>
<%@ Register Src="~/Pages/eForms/iRental/Modules/CarAndCustomerDetails.ascx" TagPrefix="AW" TagName="CarAndCustomerDetails" %>
<%@ Register Src="~/Pages/eForms/iRental/Modules/LeaseContracts.ascx" TagPrefix="AW" TagName="LeaseContracts" %>











<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:TextBox ID="RndNo" runat="server" class="rndno" Style="display: none" />

    <div id="MainDiv">
        <div id="mainpanel">



            <AW:Form ID="frmCarsForSales_ShUc" runat="server" Hidden="true" LoadOnInit="true"
                ShowOnLoad="true" DataSource="SEL_iRental_CarsForSale" AsyncForm="~/Pages/eForms/iRental/CarForSales_ShUc.ascx">
                <WidgetConfig>
                    <script>
                        cf = {
                            header: {
                                Style: {},
                                Visible: true,
                                Collapsed: false,
                                /*HeadText: 'Search'*/
                            }
                        }
                    </script>
                </WidgetConfig>
            </AW:Form>

            <AW:DataGrid ID="grdCarForSales" LoadOnInit="false" ShowOnLoad="true" runat="server" Hidden="true" Columns="1" Forms="frmCarsForSales_ShUc"
                EmptyHeight="201px" AllowNew="true" SelectableRow="true" PageSize="10" DataSource="SEL_iRental_CarsForSale"
                ContainerMargin="5px" AutoSearch="OnLoad" GridTemplate="jQueryUI" GridHeadText="Cars For Sale"
                GridButtons="{\'delete\':{conf:{Command:\'UPD_iRental_CarsForSales\',KeysCol:\'ChassisNo\'}}}">
                <GridConfig>
                    <script>
                        cf = {
                            cols: {
                                Sequence: { width: '0px' },
                                RecId: { width: '0px' },
                                RecCode: { width: '0px' },
                                CarNumber: { caption: 'Car No.', width: '80px', bootstrapClass: "", smallDeviceWitdh:"80px" },
                                ChassisNo: { caption: 'ChassisNo.', width: '135px', bootstrapClass: "", smallDeviceWitdh: "160px" },
                                CarFor: { width: '70px'},
                                BrandId: { caption: 'Brand', width: '80px' },
                                ModelId: { caption: 'Model', width: '100px'},
                                TypeId: { caption: 'Type', width: '50px', hideOnMeduimDevice: "200px" },
                                YearId: { caption: 'Year', width: '55px'},
                                ColorId: { caption: 'Color', width: '60px', hideOnMeduimDevice: "200px" },

                                Price: { caption: 'Price', width: '80px', hideOnMeduimDevice:"200px"},
                                CarLocationId: { caption: 'Location', width: '75px', hideOnMeduimDevice: "200px" },
                                CarStatusId: { caption: 'Status', width: '63px', hideOnMeduimDevice: "200px" },
                                RegistrationDate: { caption: 'Registratio Date', width: '63px', hideOnMeduimDevice: "200px" }
                            },
                            forms: {
                                NewFormId: 'frmCarForSales',
                                EditFormId: 'frmCarForSales',
                                Keys: 'ChassisNo'
                            }
                            ,
                            DataActionParams: {
                                DBAction: 'SearchChassisNo'
                            }
                        };
                    </script>
                </GridConfig>
                <Scripts>
                    <script>

                        var fn = function () {
                            t.on('rowsRendered', function () {
                                $('[colid="Price"]:not(".w-grid-head-cell")').each(function () {

                                    var ptr = $(this).closest('tr');
                                    $('[colid="Price"] div', ptr).text(parseFloat($('[colid="Price"] div', ptr).text()).fix(3));

                                });

                            });


                        }

                    </script>
                </Scripts>
            </AW:DataGrid>


        </div>
    </div>

</asp:Content>
--%>
