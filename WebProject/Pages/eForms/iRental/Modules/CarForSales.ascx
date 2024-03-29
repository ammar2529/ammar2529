﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CarForSales.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.Modules.CarForSales" %>

<%@ Register Src="~/AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="uc5" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="uc8" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="uc5" %>
<style>
.ElemDisabled
{
	background:#F1F1F1 !important;
	}
</style>

<uc5:Container ID="conCarForSales" Hidden="true" Caption="Cars For Sale" runat="server">
    <Childern>
        <uc8:Form ID="frmCarsForSale_ShUc" runat="server" Hidden="true" LoadOnInit="false"
            ShowOnLoad="true" DataSource="SEL_iRental_CarsForSale" AsyncForm="~/Pages/eForms/iRental/CarForSales_ShUc.ascx">
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
        <uc5:DataGrid ID="grdCarForSales" LoadOnInit="false" ShowOnLoad="true" runat="server" Hidden="true" Columns="1" Forms="frmCarsForSale_ShU"
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
                            CarNumber: { caption: 'Car No.', width: '80px' },
                            CarFor: { width: '70px' },
                            BrandId: { caption: 'Brand', width: '120px' },
                            ModelId: { caption: 'Model', width: '140px' },
                            TypeId: { caption: 'Type', width: '80px' },
                            CarYear: { caption: 'Year', width: '55px' },
                            CurrentMileage: { caption: 'Mileage', width: '75px' },
                            CarLocationId: { caption: 'Car Location', width: '105px' },
                            CarStatusId: { caption: 'Status' }
                        },
                        forms: {
                            NewFormId: 'frmCarForSales',
                            EditFormId: 'frmCarForSales',
                            Keys: 'ChassisNo'
                        }
                    };
                </script>
            </GridConfig>
        </uc5:DataGrid>
       
        <br />
    </Childern>

</uc5:Container>

<uc8:Form ID="frmCarForSales" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server"
    AsyncForm="~/Pages/eForms/iRental/CarForSales_FrUc.ascx">
    <WidgetConfig>
        <script>
            cf = {

                header: {
                    Style: {},
                    Visible: true,
                    Collapsed: false,
                    HeadText: 'Car For Sale'
                }
            }
        </script>
    </WidgetConfig>
         <Scripts>
                    <script>
                        var fn = function () {
                            t.on('show', function (args) {
                                $('.ElemDisabled', t.el).removeClass('ElemDisabled');
                                $('[argumentid="CarLocationId"],[argumentid="CarStatusId"],[argumentid="CurrentMileage"]', t.el).removeAttr('disabled');
                            });

                            t.on('onLoadedValues', function (args) {
                                $('[argumentid="action"]', t.el).val("update");
                                if ($('[argumentid="ContractNo"]', t.el).text() != '') {
                                    $('[argumentid="CarLocationId"],[argumentid="CarStatusId"],[argumentid="CurrentMileage"]', t.el).attr('disabled', 'disabled');
                                }
                            });

                            t.on('onComboFilled', function () {
                                $('.ElemDisabled', t.el).removeClass('ElemDisabled');
                                $('input[disabled="disabled"]:not([type="radio"]),textarea[disabled="disabled"],select[disabled="disabled"]', t.el).addClass('ElemDisabled');
                            });
                        }
                    </script>
                </Scripts>

</uc8:Form>