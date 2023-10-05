<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/eForms.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebProject.Default" %>

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
<%@ Register Src="~/Pages/eForms/iRental/Modules/SalesContracts.ascx" TagPrefix="AW" TagName="SalesContracts" %>
<%@ Register Src="~/Pages/eForms/iRental/Modules/CarForSales.ascx" TagPrefix="AW" TagName="CarForSales" %>
<%@ Register Src="~/Pages/eForms/iRental/Modules/SalesCarPrice.ascx" TagPrefix="AW" TagName="SalesCarPrice" %>




<%--<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] != null)//user logged in
        {
            frmHome.Hidden = true;
            frmInbox.Hidden = false;
        }

        else
        {
            frmHome.Hidden = false;
            frmInbox.Hidden = true;
        }
    }
</script>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <asp:TextBox ID="RndNo" runat="server" class="rndno" Style="display: none" />
    <div id="MainDiv"> 
        <div id="mainpanel">
            <AW:Form ID="frmHome" Hidden="false" runat="server" AsyncForm="~/Pages/Common/Home.ascx" />
            <AW:Form ID="frmTerms" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/Common/Terms.ascx" />
            <AW:Form ID="frmPrivacy" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/Common/Privacy.ascx" />
            <AW:Form ID="frmAccessDenied" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/Common/AccessDenied.ascx" />
            <AW:Form ID="frmComingSoon" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/Common/ComingSoon.ascx" />
            <AW:Form ID="frmiDashboard" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server"
                AsyncForm="~/Pages/Common/iDashboard/Home_iDashboard.ascx">
                <Scripts>
                    <script>
                        const { on } = require("modernizr");

                        fn = function () {
                            t.on('show', function () {
                                //$(t.el).mask('Please wait while loading ...');
                                $('.iFrameDashboard', t.el).each(function () {
                                    $(this).attr('src', $(this).attr('src2'));
                                });
                                //$(t.el).unmask('Please wait while loading ...');
                            });
                        }
                    
/* END EXTERNAL SOURCE */

/* BEGIN EXTERNAL SOURCE */

                          fn = function () {

                              var cDate = function (date) {
                                  var dttmAr = date.split(' '), dt, tm, nDate;
                                  dt = dttmAr[0].split('/');
                                  if (dttmAr.length > 1) {
                                      tm = dttmAr[1].split(':');
                                      return new Date(dt[2], dt[1] - 1, dt[0], tm[0], tm[1], tm[2]);
                                  }
                                  return new Date(dt[2], dt[1] - 1, dt[0]);
                              };
                              var dateDiff = function (d1, d2) {
                                  return (d1 - d2) / (3600000 * 24);
                              };
                              $('.SimpleTab li', t.el).click(function () {
                                  if (!t.EmpInfo) return false;
                                  var li = $(this), tbl;
                                  li.parent().children('li.active').removeClass('active');
                                  li.addClass('active');
                                  tbl = li.closest('table').parent().closest('table').children();
                                  tbl.children('tr:not(:first)').hide();
                                  tbl.children('tr[tabid="' + li.attr('tabid') + '"]').show();
                                  $('.tabid', t.el).val(li.attr('tabid'));
                                  return false;
                              });
                              t.on('show', function () {

                                  AsyncWidgets.user.conf = AsyncWidgets.user.conf || {};
                                  if (!!AsyncWidgets.user.conf.ShowEmpInfo) {
                                      $('.EmpInfo', t.el).show();

                                      if (!t.__valuesLoaded) {
                                          $(t.el).mask('Please wait while loading ...');
                                          t.loadValues();
                                          $(t.el).unmask('Please wait while loading ...');
                                          t.__valuesLoaded = true;
                                      }
                                  }
                                  else {
                                      $('.EmpInfo', t.el).hide();
                                  }

                              });
                              AsyncWidgets.user.on('loggedOut', function () {
                                  t.__valuesLoaded = false;
                              });
                              t.on('onLoadedValues', function (args) {
                                  var res = args.res;

                                  if (res.status == 'OK') {
                                      t.EmpInfo = true;
                                      if (res.Response.Rows.length < 1) {
                                          $('.EMPInfoNotFound', t.el).show().siblings().hide();
                                          t.EmpInfo = false;
                                      }
                                      else {

                                          var expDate = t.GetArgVal("PassportExpiryDate");
                                          if ($.trim(expDate) != '') {
                                              if (Math.floor(dateDiff(new Date(), cDate(expDate))) >= 0) {
                                                  $('span[argumentid="PassportExpiryDate"]', t.el).css('color', 'red');
                                              }
                                          }
                                          expDate = t.GetArgVal("ResidencyExpiryDate");
                                          if ($.trim(expDate) != '') {
                                              if (Math.floor(dateDiff(new Date(), cDate(expDate))) >= 0) {
                                                  $('span[argumentid="ResidencyExpiryDate"]', t.el).css('color', 'red');
                                              }
                                          }
                                      }
                                  }
                              });
                          }
                              
/* END EXTERNAL SOURCE */

/* BEGIN EXTERNAL SOURCE */

                    fn = function () {
                        t.on('afterDataAction', function () {
                            $('.form', t.el).hide();
                            $('.OnSuccess', t.el).show();
                        });
                        t.on('refresh', function () {
                            t.setParams({ reset: true });
                            $('.OnSuccess', t.el).hide();
                            $('.form', t.el).show();

                        });
                    };
                
/* END EXTERNAL SOURCE */

/* BEGIN EXTERNAL SOURCE */

    var onReady = () => {
        //console.log("finding menu...");
        if ($('[showwidget="conLeaseContracts"]').length > 0) {
            $('[showwidget="conLeaseContracts"]').trigger('click');
        }

        else {
            //var outterFun = arguments.callee;
            setTimeout(onReady, 3000);
        }
    }</script>
                </Scripts>
            </AW:Form>
         
            <AW:Form ID="frmLogout" Hidden="true" runat="server" AsyncForm="~/Pages/Common/Logout.ascx" />

            <AW:Form ID="frmInbox" Hidden="true" LoadOnInit="false" ShowOnLoad="false" runat="server" DataSource="SEL_Employee_DB_Inbox"  AsyncForm="~/Pages/Common/Inbox.ascx">
                        <Scripts>
                      <script></script>
                        </Scripts>
              
            </AW:Form>
           

            <AW:Form ID="frmChangePassword" Hidden="true" LoadOnInit="false" ShowOnLoad="true" runat="server" AsyncForm="~/Pages/Common/ChangePassword.ascx" >
            <Scripts>
                <script></script>
            </Scripts>
            
            </AW:Form>

            <AW:Administration ID="Administration" runat="server" />

            <AW:EmployeeDatabase ID="EmployeeDatabase" runat="server" />
            <AW:CustomerDetails ID="CustomerDetails" runat="server" />
            <AW:CarDetails ID="CarDetails" runat="server" />
            <AW:CarRateDetails ID="CarRateDetails" runat="server" />
            <AW:CarTransfers ID="CarTransfers" runat="server" />
            <AW:RentalContracts ID="RentalContracts" runat="server" />
            <AW:LeaseContracts ID="LeaseContracts" runat="server" />
            <AW:SalesContracts runat="server" ID="SalesContracts" />
            <AW:CarForSales runat="server" ID="CarForSales" />
            <AW:SalesCarPrice runat="server" ID="SalesCarPrice" />
        </div>
    </div>

<script type="text/javascript">
    var onReady = () => {
        //console.log("finding menu...");
        if ($('[showwidget="conSalesContracts"]').length > 0) {
            $('[showwidget="conSalesContracts"]').trigger('click');
        }

        else {
            //var outterFun = arguments.callee;
            setTimeout(onReady, 3000);
        }
    };



    $().ready(onReady);

</script>
</asp:Content>

