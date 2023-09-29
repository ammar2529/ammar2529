<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SalesCarPrice.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.Modules.SalesCarPrice" %>

<%@ Register Src="~/AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="uc6" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="uc8" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="uc5" %>

              <uc5:Container ID="conSalesCarPriceDetails" Hidden="true" Caption="Car Price Details" runat="server">
              <Childern>
                <uc8:Form ID="frmSaleCarPriceDetails_ShUc" runat="server" Hidden="true" LoadOnInit="false" ShowOnLoad="true" DataSource="SEL_iRental_SalesCarPrice" AsyncForm="~/Pages/eForms/iRental/SalesCarPrice_ShUc.ascx" >
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
                <uc6:DataGrid ID="grdCarRatePriceDetails" LoadOnInit="false" ShowOnLoad="true"  runat="server" Hidden="true" Columns="1" Forms="frmSaleCarPriceDetails_ShUc"
            EmptyHeight="201px" AllowNew="true" SelectableRow="true" 
            PageSize="10" DataSource="SEL_iRental_SalesCarPrice" ContainerMargin="5px" AutoSearch="OnLoad" GridTemplate="jQueryUI"
            GridHeadText="Price Management"  GridButtons="{\'delete\':{conf:{Command:\'UPD_iRental_SalesCarPrice\',KeysCol:\'RecId\'}}}">
          
            <GridConfig>
            <script>
               var cf = {
                    cols: {
                        Sequence: { width: '0px' },
                        RecId: { width: '0px' },
                        RateTypeId: { caption: 'Rate Type', width: '130px' },
                        BrandId: { caption: 'Brand', width: '130px' },
                        ModelId: { caption: 'Model', width: '150px' },
                        CarYear: { caption: 'Year', width: '55px' },
                        Rate: { caption: 'Daily Rate', width: '95px' },
                        AllowedKM: { caption: 'Daily KM Limit', width: '125px' },
                        ExtraKMRate: { caption: 'Rate/KM', width: '85px' }
                    },
                    forms: {
                        NewFormId: 'frmSaleCarPriceDetails',
                        EditFormId: 'frmSaleCarPriceDetails',
                        Keys: 'RecId'
                    }
                };
            </script>
            </GridConfig>
            </uc6:DataGrid>
            <br />
           </Childern>
            </uc5:Container>

  <uc8:Form ID="frmSaleCarPriceDetails" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/eForms/iRental/SalesCarPrice_FrUc.ascx" >
              <WidgetConfig>
                <script>
                    cf = {

                        header: {
                            Style: {},
                            Visible: true,
                            Collapsed: false,
                            HeadText: 'Price Management'
                        }
                    }
                </script>
                </WidgetConfig>
            </uc8:Form>
