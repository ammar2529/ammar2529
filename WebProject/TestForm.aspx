<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/eForms.Master" AutoEventWireup="true" CodeBehind="TestForm.aspx.cs" Inherits="WebProject.TestForm" %>

<%@ Register Src="AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="AW" %>
<%@ Register Src="AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="AW" %>
<%@ Register Src="AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="AW" %>

<%@ Register Src="Pages/Common/Administration/Modules/Administration.ascx" TagName="Administration" TagPrefix="AW" %>


<%@ Register Src="Pages/eForms/Employee/Modules/EmployeeDatabase.ascx" TagName="EmployeeDatabase" TagPrefix="AW" %>
<%@ Register Src="Pages/eForms/iRental/Modules/CustomerDetails.ascx" TagName="CustomerDetails" TagPrefix="AW" %>
<%@ Register Src="Pages/eForms/iRental/Modules/CarDetails.ascx" TagName="CarDetails" TagPrefix="AW" %>
<%@ Register Src="Pages/eForms/iRental/Modules/CarRateDetails.ascx" TagName="CarRateDetails" TagPrefix="AW" %>
<%@ Register Src="Pages/eForms/iRental/Modules/CarTransfers.ascx" TagName="CarTransfers" TagPrefix="AW" %>
<%@ Register Src="Pages/eForms/iRental/Modules/RentalContracts.ascx" TagName="RentalContracts" TagPrefix="AW" %>
<%@ Register Src="Pages/eForms/iRental/Modules/LeaseContracts.ascx" TagName="LeaseContracts" TagPrefix="AW" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <AW:Container ID="conRentalContracts" Hidden="true" Caption="Rental Contracts" runat="server">
              <Childern>
                <AW:Form ID="frmRentalContracts_ShUc" runat="server" Hidden="true" LoadOnInit="false" ShowOnLoad="true" DataSource="SEL_iRental_Contracts" AsyncForm="~/Pages/eForms/iRental/RentalContracts_ShUc.ascx" >
                <WidgetConfig>
                <script>
                    cf = { 
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
                <AW:DataGrid ID="grdRentalContracts" LoadOnInit="false" ShowOnLoad="true" runat="server" Hidden="true" Columns="1" Forms="frmRentalContracts_ShUc"
            EmptyHeight="201px" AllowNew="true" SelectableRow="true" 
            PageSize="10" DataSource="SEL_iRental_Contracts" ContainerMargin="5px" AutoSearch="OnLoad" GridTemplate="jQueryUI"
            GridHeadText="Rental Contracts"  GridButtons="{\'delete\':{conf:{Command:\'UPD_iRental_Contracts\',KeysCol:\'RecId\'}}}">
                        <columntemplates>
                                <pre columnid="ContractDetails" class="w-grid-head" >
                                <div style="padding-top:5px;padding-bottom:5px">
                                    <div class="ftitle" style="color:#602010">{RecCode}</div>
                                     <div style="font-size:11px;"><nobr class="ftitle" style="color:#008080">{CarNumber}</nobr>&nbsp;-&nbsp;{Brand}&nbsp;-&nbsp;{Model}</div>
                                    <div class="ftitle StateName" style="color:#602010">{StateName}</div>
                                </div>
                                </pre>
                                <pre columnid="CustomerDetails" >
                                <center>
                                     <div class="ftitle" style="font-size:16px;color:#101080">{CustomerName}</div>
                                     <div style="font-size:11px;">ID: {NationalIDNo}&nbsp;-&nbsp;{Nationality}</div>
                                      <div style="font-size:11px;">{MobileTelephone1}&nbsp;&nbsp;{MobileTelephone2}</div>
                                </center>
                                </pre>
                                   <pre columnid="ContractDateTimeDetails" >
                                     <div class="ftitle">{ContractStartDate}&nbsp;{ContractStartTime}</div>
                                     <div class="ftitle">Charges:&nbsp;<nobr class="ftitle" style="color:#602010">{ContractTotalCharges:fix(3)}</nobr></div>
                                     <div class="ftitle">Balance:&nbsp;<nobr class="ftitle" style="color:#602010">{TotalAmountDue:fix(3)}</nobr></div>
                                   
                                </pre>
                                 <pre columnid="CreationDetails" >
                                     <div class="ftitle" style="color:#808000">{OutLocation}</div>
                                     <div class="ftitle" style="color:#101080">{CreatedBy}</div>
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
                        NewFormId: 'frmRentalContracts',
                        EditFormId: 'frmRentalContracts',
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

</asp:Content>
