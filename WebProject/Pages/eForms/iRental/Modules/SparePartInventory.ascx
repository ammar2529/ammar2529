<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SparePartInventory.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.Modules.SparePartInventory1" %>
<%@ Register Src="~/AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="uc5" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="uc8" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="uc5" %>
<style>
.ElemDisabled
{
	background:#F1F1F1 !important;
	}
</style>

<uc5:Container ID="conSparePartInventory" Hidden="true" Caption="Spare Part Inventory" runat="server">
    <Childern>
       

        <uc8:Form ID="frmSparePartInventory_ShUc" runat="server" Hidden="true" LoadOnInit="false" ShowOnLoad="true" DataSource="SEL_iRental_SparePartInventory" AsyncForm="~/Pages/eForms/iRental/SparePartInventory_ShUc.ascx">
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
        
         
        </uc8:Form>
        <uc5:DataGrid ID="grdSparePartInventory" LoadOnInit="false" ShowOnLoad="true" runat="server" Hidden="true" Columns="1" Forms="frmSparePartInventory_ShUc"
            EmptyHeight="201px" AllowNew="true" SelectableRow="true" PageSize="10" DataSource="SEL_iRental_SparePartInventory"
            ContainerMargin="5px" AutoSearch="OnLoad" GridTemplate="jQueryUI" GridHeadText="Spare Part Inventory"
            GridButtons="{\'delete\':{conf:{Command:\'UPD_iRental_SparePartInventory\',KeysCol:\'RecId\'}}}">
            <GridConfig>
                <script>
                    cf = {
                        cols: {
                            Sequence: { width: '0px' },
                            RecId: { width: '0px' },
                            ItemId: { caption: 'Item ID', width: '70px' },
                            SparePartSerialNo: { caption: 'Item Code', width: '50px' },
                            SparePartName: { caption: 'Description', width: '100px' },
                            SparePartSerialNo: { caption: 'Item Code', width: '110px' },
                            SparePartQuantity: { caption: 'Qty', width: '45px' },
                            BrandId: { caption: 'Brand', width: '70px' },
                            ModelId: { caption: 'Model', width: '60px' },
                            SparePartRackfNo: { caption: 'Rack', width: '60px' },
                            SparePartShelfNo: { caption: 'Shelf', width: '60px' },
                            SparePartUnitPrice: { caption: 'Unit Price', width: '80px' },
                            SparePartRemarks: { caption: 'Remarks', width: '100px' },
                            SparePartImage: { caption: 'Image', width: '80px' },
                            StoreLocation: { caption: 'Store', width: '50px' },
                            PurchasingFrom: { caption: 'From', width:'60px'}
                      
                        },
                        forms: {
                            NewFormId: 'frmSparePartInventory',
                            EditFormId: 'frmSparePartInventory',
                            Keys: 'RecId'
                        }
                        //,
                        //DataActionParams: {
                        //    DBAction : 'SearchChassisNo'
                        //}
                    };
                </script>
            </GridConfig>
            <Scripts>
                <script>

                    var fn = function ()
                    {
                        t.on('rowsRendered', function () 
                        {
                            $('[colid="SparePartUnitPrice"]:not(".w-grid-head-cell")').each(function ()
                            {
                              
                                var ptr = $(this).closest('tr');
                                $('[colid="SparePartUnitPrice"] div', ptr).text(parseFloat($('[colid="SparePartUnitPrice"] div', ptr).text()).fix(3));

                            });

                        });

                       
                    }
                   
                </script>
            </Scripts>
        </uc5:DataGrid>
       
        <br />
    </Childern>

</uc5:Container>
<script src="../../../../Scripts/eForms/iRental/frmSparePartInventory.js"></script>
<uc8:Form ID="frmSparePartInventory" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server"
    AsyncForm="~/Pages/eForms/iRental/SparePartInventory_FrUc.ascx">
    <WidgetConfig>
        <script>
            cf = {

                header: {
                    Style: {},
                    Visible: true,
                    Collapsed: false,
                    HeadText: 'Spare Part Inventory'
                }
            }
        </script>
    </WidgetConfig>
        <Scripts>
            <script>
              
            </script>
        </Scripts>

</uc8:Form>