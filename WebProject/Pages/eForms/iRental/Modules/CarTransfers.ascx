<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CarTransfers.ascx.cs" Inherits="WebProject.Pages.eForms.iRental.Modules.CarTransfers" %>

<%@ Register Src="~/AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="uc6" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="uc8" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="uc5" %>


            <uc5:Container ID="conCarTransfers" Hidden="true" Caption="Car Transfers" runat="server">
              <Childern>
                <uc8:Form ID="frmCarTransfers_ShUc" runat="server" Hidden="true" LoadOnInit="false" ShowOnLoad="true" DataSource="SEL_iRental_Cars_Transfers" AsyncForm="~/Pages/eForms/iRental/CarTransfers_ShUc.ascx" >
                <WidgetConfig>
                <script>
                    cf = {
                        header: {
                            Style: {},
                            Visible: false,
                            Collapsed: false,
                            HeadText: 'Search'
                        }
                    }
                    </script>
                </WidgetConfig>
                </uc8:Form>

                  <div class="mt-2">
    <div class="card">
        <div class="card-body">
            <div class="row">
                <div class="col-sm-12 ">
                    <div class="form-header">

                        <span class=" h5 fw-bold ink-bar">Car Transfers</span>
						                    <i class="fa-regular fa-rectangle-xmark "
                        tabid="CloseBtn" title="Close Grid"
                        style="font-size: 20px; color: black; cursor: pointer; 
                               transition: color 0.3s ease; position: absolute; 
                               right: 10px;"
                        onmouseover="this.style.color='red';" 
                        onmouseout="this.style.color='black';" returntype="true" showwidget="frmInbox">
                    </i>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-sm-12">
                                   <uc6:DataGrid ID="grdCarTransfers" LoadOnInit="false" ShowOnLoad="true"  runat="server" Hidden="true" Columns="1" Forms="frmCarTransfers_ShUc"
           EmptyHeight="201px" AllowNew="true" SelectableRow="true" 
           PageSize="10" DataSource="SEL_iRental_Cars_Transfers" ContainerMargin="5px" AutoSearch="OnLoad" GridTemplate="jQueryUI"
            GridButtons="{\'delete\':{conf:{Command:\'UPD_iRental_Cars_Transfers\',KeysCol:\'RecId\'}}}">
         
           <GridConfig>
           <script>
               cf = {
                   cols: {
                       Sequence: { width: '0px' },
                       RecId: { width: '0px' },
                       CarNumber: { caption: 'Car No.', width: '80px' },
                       TransferDate: { width: '110px' },
                       CurrentMileage: { caption: 'Mileage', width: '75px' },
                       OutMileage: { width: '100px' },
                       InMileage: { width: '100px' },
                       OutLocationId: { caption: 'Out Location', width: '105px' },
                       InLocationId: { caption: 'In Location', width: '105px' },
                       DriverId: { caption: 'Driver' },
                       GridButtons:
                       {
                           'delete': {
                               conf: {
                                   Action: 'DeleteRows',
                                   Command: 'UPD_iRental_Cars_Transfers',
                                   KeysCol: 'RecId'
                               }
                           }
                       }
                   },
                   forms: {
                       NewFormId: 'frmCarTransfers',
                       EditFormId: 'frmCarTransfers',
                       Keys: 'RecId'
                   }
               };
           </script>
           </GridConfig>
           </uc6:DataGrid>
                </div>
            </div>
        </div>
    </div>
</div>

 
           </Childern>
            </uc5:Container>


                       <uc8:Form ID="frmCarTransfers" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/eForms/iRental/CarTransfers_FrUc2.ascx" >
                            <WidgetConfig>
                <script>
                    cf = {

                        header: {
                            Style: {},
                            Visible: true,
                            Collapsed: false,
                            HeadText: 'Car Transfers'
                        }
                    }
                </script>
                </WidgetConfig>
            </uc8:Form>