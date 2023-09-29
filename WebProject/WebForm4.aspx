<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/eForms.Master" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="WebProject.WebForm4" %>

<%@ Register Src="AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="AW" %>
<%@ Register Src="AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="AW" %>
<%@ Register Src="AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="AW" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <AW:DataGrid ID="grdSalesFileUpload" LoadOnInit="false" ShowOnLoad="true" runat="server" Hidden="false" Columns="1"
                                EmptyHeight="201px" AllowNew="true" SelectableRow="false"
                                PageSize="10" DataSource="FX_UPD_FileUpload" ContainerMargin="5px" AutoSearch="none" GridTemplate="jQueryUI"
                                GridHeadText="Upload File List" GridButtons="{\'new\':{visible:false},\'delete\':{visible:false}}">

                              <GridConfig>
                                <script>
                                    var cf = {
                                        cols: {
                                            Sequence: { width: '0px' },
                                            FileName: { width: '0px' },
                                            FileSize: { width: '0px' },
                                            $CreatedBy: { width: '0px' },
                     

                                        }
                    
                                    };


                                </script>


                            </GridConfig>
                             <Scripts>

                                 <script>
                                     var grd = AsyncWidgets.get('grdSalesFileUpload');
                                     if (!!grd) {
                                         grd.show();
                                     } else {
                                         alert("not found grdSalesFileUpload")
                                     }

                                 </script>

                             </Scripts>

                            </AW:DataGrid>

    <%-- <AW:DataGrid ID="grdSalesContracts" LoadOnInit="false" ShowOnLoad="true" runat="server" Hidden="true" Columns="1" Forms="frmSalesContracts_ShUc"
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

                    var wdg = AsyncWidgets.get('grdSalesContracts');
                    wdg.show();
                </script>
            </Scripts>
        </AW:DataGrid>--%>
</asp:Content>

