<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EmployeeDatabase.ascx.cs" Inherits="WebProject.Pages.eForms.Employee.Modules.EmployeeDatabase" %>

<%@ Register Src="~/AsyncWidgets/Widgets/DataGrid.ascx" TagName="DataGrid" TagPrefix="uc6" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="uc8" %>
<%@ Register Src="~/AsyncWidgets/Widgets/Container.ascx" TagName="Container" TagPrefix="uc5" %>
<uc5:Container ID="conEmployeeDatabase" Hidden="true" Caption="Employee Database"
    runat="server">
    <Childern>
        <uc8:Form ID="frmEmployeeDatabase_ShUc" runat="server" Hidden="true" LoadOnInit="false"
            ShowOnLoad="true" DataSource="SEL_Employee_DB" AsyncForm="~/Pages/eForms/Employee/EmployeeDatabase_ShUc.ascx">
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
        </uc8:Form>
        <uc6:DataGrid ID="grdEmployeeDatabase" LoadOnInit="false" ShowOnLoad="true" runat="server" Hidden="true" Columns="1" Forms="frmEmployeeDatabase_ShUc"
            EmptyHeight="201px" AllowNew="true" SelectableRow="true" PageSize="10" DataSource="SEL_Employee_DB"
            ContainerMargin="5px" AutoSearch="OnLoad" GridTemplate="jQueryUI" GridHeadText="Employee Database"
            GridButtons="{\'delete\':{conf:{Command:\'UPD_Employee_DB\',KeysCol:\'RecId\'}}}">
            <GridConfig>
                <script>
                    cf = {
                        cols: {
                            Sequence: { width: '0px' },
                            RecId: { width: '0px' },
                            EmpId: { caption: 'Emp ID', width: '70px', smallDeviceWitdh: "80px" },
                            CivilId: { caption: 'Civil ID', width: '105px', smallDeviceWitdh: "80px" },
                            NameInEnglish: { caption: 'Employee Name', width: '175px' },
                            ResidencyExpiryDate: { caption: 'Residency Expiry', width: '135px', hideOnMeduimDevice: "200px" },
                            GrossSalary: { width: '105px', hideOnMeduimDevice: "200px" },
                            Gender: { width: '0px' },
                            EmpStatus: { caption: 'Status', width: '125px', hideOnMeduimDevice: "200px" }
                        },
                        forms: {
                            NewFormId: 'frmEmployeeDatabase',
                            EditFormId: 'frmEmployeeDatabase',
                            Keys: 'RecId'
                        }
                    };
                </script>
            </GridConfig>
        </uc6:DataGrid>
        <uc8:Form ID="frmEmployeeDatabase_KPIUc" runat="server" Hidden="true" LoadOnInit="false"
            ShowOnLoad="true" AsyncForm="~/Pages/Common/iDashboard/KPI_iDashboard.ascx">
            <WidgetConfig>
                <script>
                    cf = {

                        header: {
                            Style: {},
                            Visible: true,
                            Collapsed: true,
                            HeadText: 'KPI - Key Performance Indicator (s)'
                        }
                    }
                </script>
            </WidgetConfig>
            <Scripts>
                <script>
                    var fn = function () {
                        var LoadChart = function (msg) {
                            var strChart;
                            if (!msg.text) {
                                if (!!msg.childNodes[0])
                                    strChart = msg.childNodes[0].textContent;
                            }
                            else
                                strChart = msg.text;


                            $('#dvContainer').html('');
                            $('.dvContainer', t.el).append(strChart);

                        };
                        var CallAjax = function (param) {
                            $.ajax({
                                type: "POST",
                                url: "AsyncDashboards/WebServices/KPI.asmx/GetKPICharts",
                                dataType: "",
                                data: "ContainerName=" + param,
                                success: function (msg) {
                                    LoadChart(msg);
                                }
                            });
                        };
                        $('.w-ui-panel-icon-closed', t.el).click(function () {
                            if (!this.__ChartsLoaded) {
                                this.__ChartsLoaded = true;
                                CallAjax('conEmployeeDatabase');
                            }
                        });
                    };
                </script>
            </Scripts>
        </uc8:Form>
        <br />
    </Childern>
</uc5:Container>
<uc8:Form ID="frmEmployeeDatabase" Hidden="true" LoadOnInit="false" ShowOnLoad="true"
    runat="server" AsyncForm="~/Pages/eForms/Employee/EmployeeDatabase_FrUc2.ascx">
    <WidgetConfig>
        <script>
            cf = {

                header: {
                    Style: {},
                    Visible: true,
                    Collapsed: false,
                    HeadText: 'Employee Database'
                }
            }
        </script>
    </WidgetConfig>
    <Scripts>
        <script>
            fn = function () {
                //$('.SimpleTab li', t.el).click(function () {
                //    debugger
                //    //if (!t.EmpInfo) return false;
                //    var li = $(this), tbl;
                //    li.parent().children('li.active').removeClass('active');
                //    li.addClass('active');
                //    tbl = li.closest('div').children();
                //    tbl.children('div:not(:first)').hide();
                //    tbl.children('div[tabid="' + li.attr('tabid') + '"]').show();
                //    $('.tabid', t.el).val(li.attr('tabid'));
                //    return false;
                //});
                $('.SimpleTab li').on('click', function (e) {
                    e.preventDefault(); // Prevent default behavior
                    
                    // Get the clicked tab
                    var li = $(this),
                        tbl;

                    // Remove active class and inline style from all tabs
                    li.parent().children('li.active').removeClass('active');//.css('background-color', '');

                    // Add active class and set color to blue for the clicked tab
                    li.addClass('active');//.css('color', 'blue');

                    // Hide all tab content sections
                    tbl = li.closest('div').children();
                    tbl.children('div').hide(); // Hide all content sections

                    // Show the current tab's content
                    tbl.children('div[tabid="' + li.attr('tabid') + '"]').show();

                    // Set a hidden input field value for the active tab ID
                    $('.tabid').val(li.attr('tabid'));

                    return false;
                });

                // Show the first tab and its content by default
                $('.SimpleTab li:first-child').addClass('active');//.css('background-color', '#0d6efd'); // Default active tab with blue color
                $('div[tabid]:not(:first)').hide(); // Hide all tab content except the first
           
            }
        </script>
    </Scripts>
</uc8:Form>