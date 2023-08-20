<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="eForms_Header.ascx.cs" Inherits="WebProject.AdminPages.eForms.eForms_Header" %>

<%@ Register Src="~/AsyncWidgets/Widgets/Form.ascx" TagName="Form" TagPrefix="uc3" %>

<asp:Literal ID="MenuData" runat="server">
</asp:Literal>
<script type="text/javascript">
    var timeout = 500;
    var closetimer = 0;
    var ddmenuitem = 0;
    function jsddm_open() {
        jsddm_canceltimer();
        jsddm_close();
        ddmenuitem = $(this).find('ul').eq(0);

        if (ddmenuitem.css('visibility') == 'visible') {
            ddmenuitem.css('visibility', 'hidden');
        }
        else {
            if (!jsddm_close.clsByWin || !(jsddm_open.ddmenuitem[0] === ddmenuitem[0]))
                ddmenuitem.css('visibility', 'visible');
        }
        jsddm_open.ddmenuitem = ddmenuitem;
        jsddm_close.clsByWin = false;
        return false;
    }
    function jsddm_openMO() {
        jsddm_canceltimer();
        jsddm_close();
        ddmenuitem = $(this).find('ul').eq(0).css('visibility', 'visible');
        return false;
    }
    function jsddm_close() {
        if (ddmenuitem && ddmenuitem.css('visibility') == 'visible') {
            ddmenuitem.css('visibility', 'hidden');
            if (this == window)
                jsddm_close.clsByWin = true;
            else
                jsddm_close.clsByWin = false;
        }
    }
    function jsddm_closeMO() {
        if (ddmenuitem) {
            ddmenuitem.css('visibility', 'hidden');
        }
    }
    function jsddm_timer() {
        closetimer = window.setTimeout(jsddm_close, timeout);
    }
    function jsddm_timerMO() {
        closetimer = window.setTimeout(jsddm_closeMO, timeout);
    }
    function jsddm_canceltimer() {
        if (closetimer) {
            window.clearTimeout(closetimer);
            closetimer = null;
        }
    }
    document.onclick = jsddm_close;
</script>
<table cellspacing="0" cellpadding="0" width="100%" border="0">
    <tbody>
        <tr>
            <td width="100%">
                <table style="background-color: #ffffff" cellspacing="0" cellpadding="0" width="100%"
                    border="0">
                    <tbody>
                        <tr>
                            <td style="background-color: #73ABCB">
                                <img height="27" width="1" alt="" src="App_Themes/eForms_Theme/Images/spacer.gif" />
                            </td>
                            <td style="background-color: #73ABCB" width="100%" class="HeaderMenuPanel"> 
                                <uc3:Form ID="frmLogin_Header" runat="server" Hidden="false" AsyncForm="AdminPages/eForms/eForms_Header_Login.ascx">
                                    <Scripts>
                                        <script>

                                            var fn = function () {
                                                
                                                AsyncWidgets.user.isLogged({
                                                    callBack: function (isLogged) {
                                                        if (isLogged) {
                                                            //****Enabled Session Resume Option On Refresh if User Logged In*****//
                                                            $(document).timeout();
                                                            //****End****//

                                                            //****Load Proxy User On Refresh if User Logged In*****//
                                                            var f = AsyncWidgets.get('frmMenu_Header');
                                                            f.LoadCombo(f, $('[argumentid="ProxyUsers"]', f.el));
                                                            f.on('onComboFilled', function (cf) {
                                                                if ($(cf.combo).attr('argumentid') == "ProxyUsers")
                                                                    $('option:first', cf.combo).remove();
                                                            });
                                                            //****End****//
                                                        }
                                                    }
                                                });


                                                $('[argumentid="UserName"]', t.el).focus();

                                                $('[argumentid="UserName"],[argumentid="UserPassword"]', t.el).keyup(function () {
                                                    if (!!t.msg) t.msg.hide();
                                                });
                                                t.login = function (t, cf, btn) {
                                                    var t = this;
                                                    if (!!t.msg) t.msg.hide();
                                                    var cf = decJSON($(btn).attr('conf'));
                                                    if (!t.validator.isValid()) {
                                                        t.showInvalid(t);
                                                        return false;
                                                    }
                                                    var inv = new AsyncWidgets.RAInvoker();
                                                    inv.on('onSuccess', function (res) {

                                                        var res = decJSON(res);
                                                        if (res.status == 'OK') {
                                                            t.hide();
                                                            if (res.Response.Authenticated) {
                                                                var arRoles = res.Response.Roles.split(',');

                                                                if (arRoles.length) {
                                                                    for (var i = 0; i < arRoles.length; i++) {
                                                                        //if(arRoles[i])
                                                                        $('[displayroles*=' + arRoles[i] + ']').show();
                                                                    }
                                                                }
                                                                AsyncWidgets.user.conf = res.Response.Conf;
                                                                var frmMH = AsyncWidgets.get('frmMenu_Header').show(); //LoggedUser
                                                                $('.LoggedUser', frmMH.el).html(res.Response.Name);
                                                                
                                                                if (!window.StartupWidgetId ) {
                                                                    StartupWidgetId = "frmInbox";
                                                                }
                                                                else if (!AsyncWidgets.has(StartupWidgetId)) {
                                                                    StartupWidgetId = "frmInbox";
                                                                }

                                                                AsyncWidgets.get(StartupWidgetId).hide();
                                                                AsyncWidgets.get(StartupWidgetId).show();

                                                                AsyncWidgets.user.login();

                                                                //****Enabled Session Resume Option On Log In*****//
                                                                $(document).timeout();
                                                                //****End****//

                                                                //****Load Proxy User On Log In*****//
                                                                var f = AsyncWidgets.get('frmMenu_Header');
                                                                f.LoadCombo(f, $('[argumentid="ProxyUsers"]', f.el));
                                                                f.on('onComboFilled', function (cf) {
                                                                    if ($(cf.combo).attr('argumentid') == "ProxyUsers")
                                                                        $('option:first', cf.combo).remove();
                                                                });
                                                                //****End****//

                                                            }
                                                            else {

                                                                t.show();
                                                                var txt = $('[argumentid="UserName"]', t.el), pos = txt.offset(),
                                                                    msg = $('&lt;div class="wrongpassword tmp_rtxt" style="background:#73ABCB;position:absolute;display:none;color:white;font-weight:bold;padding-top:2px;padding-bottom:2px;padding-right:10px;padding-left:10px;">Invalid User ID or Password!&lt;/div>');
                                                                if (!t.msg) {
                                                                    $('body').append(msg);
                                                                    t.msg = msg;
                                                                }
                                                                t.msg.css({ left: pos.left, top: pos.top + 24 }).show('fast');

                                                                if (!t.hideDT) t.hideDT = new Ext.util.DelayedTask(function () {
                                                                    t.msg.hide('fast');
                                                                });
                                                                t.hideDT.delay(3000);

                                                                //alert('Unable to logged in!');
                                                            }
                                                        }
                                                        else {
                                                            //$('.wrongpassword', t.el).html('Unable to login, contact system administrator!');
                                                            //alert('Unable to logged in!');
                                                        }

                                                        $(t.el).unmask();
                                                        //$('body').unmask();
                                                    });
                                                    inv.on('onFailure', function (res) {
                                                        $(t.el).unmask();
                                                        //$('body').unmask();
                                                        //$('.wrongpassword', t.el).html('Connection Error, contact system administrator!');
                                                        //alert('Problem occured while connection to web server');
                                                    });
                                                    t.$el.mask('Please wait while loading ...');
                                                    //$('body').mask('Please wait while loading ...');
                                                    ServiceInfo = getForm(t.el, null, null);
                                                    //debugger;
                                                    inv.invokeRA({
                                                        params: ["ActorId", cf.ActorId, "ActionId", cf.ActionId, "ServiceInfo", ServiceInfo]
                                                    });

                                                };
                                            };
                                        </script>
                                    </Scripts>
                                </uc3:Form>
                                <uc3:Form ID="frmMenu_Header" runat="server" ShowOnLoad="false" Hidden="true" AsyncForm="AdminPages/eForms/eForms_Header_Menu.ascx">
                                    <Scripts>
                                        <script>

                                            //*****Proxy Code *****//
                                            var mouseOut, hideProxyList, iPL, mnuDelay = 500;

                                            hideProxyList = function () {
                                                $('.ProxyList').hide();
                                            };
                                            mouseOut = function () {
                                                iPL[0].DT.delay(mnuDelay);
                                            };

                                            iPL = $('.ShowProxyList');
                                            iPL[0].DT = new Ext.util.DelayedTask(hideProxyList);

                                            iPL.mouseenter(function () {

                                                if (!this.init) {
                                                    this.init = true;
                                                    var i = 0, PLHtml = "&lt;tr id='trlbl'>&lt;td class='ProxyListHeader' colspan='2' align='left'>&lt;span>Proxy Users&lt;/span>&lt;/td>";
                                                    $('.cboProxy option').each(function () {
                                                        PLHtml += '&lt;tr idx="' + i + '">&lt;td class="ProxyListFC">&lt;div >&nbsp;&lt;/div>&lt;/td>&lt;td class="ProxyListSC">' + $(this).html() + '&lt;/td>&lt;/tr>';
                                                        i++;
                                                    });
                                                    //                                                    if (i < 2) {
                                                    //                                                        $('.ShowProxyList').hide();
                                                    //                                                    }

                                                    $('.ProxyList table').html(PLHtml).filter('tr:last td').css('border-bottom', '1px');
                                                    $('.ProxyList table tr:last td').css('border-bottom', '0px');
                                                    $('.ProxyList tr')
                                                        .mouseenter(function () {
                                                            $('td', this).each(function () {
                                                                var td = $(this);
                                                                if (td.hasClass('ProxyListFC')) {
                                                                    td.addClass('ProxyListHoverFC');
                                                                }
                                                                else {
                                                                    if (!td.hasClass('ProxyListHeader'))
                                                                        td.addClass('ProxyListHoverSC');
                                                                }
                                                            });
                                                        }).mouseleave(function () {
                                                            $('td', this).each(function () {
                                                                var td = $(this);
                                                                td.removeClass('ProxyListHoverSC ProxyListHoverFC');
                                                            });
                                                        }).click(function () {
                                                            $('.cboProxy')[0].selectedIndex = $(this).attr('idx');
                                                            if ($(this).attr('id') != 'trlbl')
                                                                $('.cboProxy').trigger('change');
                                                            hideProxyList();
                                                        });
                                                }
                                                // debugger;
                                                var IE6 = false;
                                                if ($.browser.msie && parseInt($.browser.version.charAt(0)) < 7) {
                                                    IE6 = true;
                                                }
                                                iPL[0].DT.cancel();

                                                var p = $('.ProxyList').show().offsetParent(), ptop, pleft;
                                                var pos = $(this).offset(), height
                                                width = 0;

                                                height = $(this).height();
                                                var isBody = p[0].tagName == 'BODY', prxTblWidth;
                                                //debugger;
                                                $('.ProxyList').css({ 'left': '5000', 'z-index': '9999' }).show();
                                                $('.ProxyList td.ProxyListSC').addClass('ProxyListHoverSC');
                                                prxTblWidth = parseInt($('.ProxyList table').width());
                                                $('.ProxyList td.ProxyListSC').removeClass('ProxyListHoverSC');
                                                $('.ProxyList').css('width', prxTblWidth);
                                                //                                                if (prxTblWidth < parseInt($('.ProxyList').width())) {
                                                //                                                    $('.ProxyList table').css('width',parseInt( $('.ProxyList').css('width')));
                                                //                                                }

                                                ptop = -((isBody ? 0 : p.offset().top) + (IE6 || isBody ? 0 : parseInt(p.css('border-top-width')) || 0))
                                                    + pos.top + height + (isBody ? parseInt(p.css('border-top-width')) || 0 : 0);

                                                pleft = -((isBody ? 0 : p.offset().left) + (IE6 || isBody ? 0 : parseInt(p.css('border-left-width')) || 0))
                                                    + pos.left + (isBody ? parseInt(p.css('border-left-width')) || 0 : 0); // + )
                                                // pleft -= $('.ProxyList').outerWidth() - $(this).width();
                                                $('.ProxyList').css({ "left": pleft + "px", "top": ptop + 5 + "px" }).show();


                                                $('.logger').html('Icon {Left: ' + pos.left + '&nbsp;&nbsp;-&nbsp;&nbsp;Top:' + pos.top + " - Heigth:" + height + " - Width:" + width + "}<br />" +
                                                    'Menu { offset parent top: ' + p.offset().top + '&nbsp;&nbsp;-&nbsp;&nbsp;' + 'offset parent left: ' + p.offset().left + "}<br /> "
                                                    + 'pleft: ' + pleft + ' - ptop: ' + ptop);

                                            }).mouseout(mouseOut);
                                            $('.ProxyList').mouseenter(function () {
                                                iPL[0].DT.cancel();
                                            }).mouseleave(function () {
                                                iPL[0].DT.delay(mnuDelay);
                                            });
                                            //End of Proxy Code

                                            var centerE = function (el) {
                                                el.css("position", "absolute");
                                                el.css("top", (($(window).height() - el.outerHeight()) / 2) +
                                                    $(window).scrollTop() + "px");
                                                el.css("left", (($(window).width() - el.outerWidth()) / 2) +
                                                    $(window).scrollLeft() + "px");

                                            };
                                            var msgbox = function (msg) {
                                                if (!msgbox.msgdiv) {
                                                    msgbox.msgdiv = $('&lt;div style="border: 1px solid black;  background: none repeat scroll 0% 0% rgb(213, 220, 232); width: 400px; height: 200px; position: absolute; top: 253.5px; left: 367px;">&lt;center>&lt;div style="overflow: auto; width: 400px; height: 160px" class="msgcontainer">&lt;/div>&lt;/center>&lt;div style="vertical-align:middle">&lt;center>&lt;input type="button" value="OK" style="width:80px" class="btnOK">&lt;/center>&lt;/div>&lt;/div>');
                                                    $('body').append(msgbox.msgdiv);
                                                }

                                                $('.msgcontainer', msgbox.msgdiv).text(msg);
                                                msgbox.msgdiv.show();
                                                centerE(msgbox.msgdiv);
                                                $('.btnOK', msgbox.msgdiv).click(function () {
                                                    msgbox.msgdiv.hide();
                                                });
                                            };
                                            var fn = function () {
                                                $('.logout', t.el).click(function () {
                                                   // debugger;
                                                    var inv = new AsyncWidgets.RAInvoker();
                                                    inv.invokeRA({
                                                        params: ["ActorId", "Authentication", "ActionId", "LogoutUser", "ServiceInfo", "<root><dummy></dummy></root>"]
                                                    });

                                                    AsyncWidgets.user.logout();

                                                    window.location.pathname = BASE_PATH +"default" ; //"Logout.aspx";
                                                });
                                                var getMenu = function (rws) {
                                                  
                                                    var i, j, mnuHTML = "&lt;ul id='jsddm' style='z-index:999'>";
                                                    for (i = 0; i < rws.length && rws[i].ParentMenuId == 0; i++) {
                                                        var prntId = rws[i].MenuId;
                                                        if (rws[i].MenuName == "Home")
                                                            mnuHTML += String.format("&lt;li>&lt;a href='javascript:void(0);' showwidget='{1}'>{0}&lt;/a>&lt;ul style='z-index:1000'>", rws[i].MenuName, rws[i].ShowWidget);
                                                        else
                                                            mnuHTML += String.format("&lt;li>&lt;a href='javascript:void(0);' >{0}&lt;/a>&lt;ul style='z-index:1000'>", rws[i].MenuName);
                                                        for (j = 0; j < rws.length; j++) {
                                                            if (rws[j].ParentMenuId == 0 || prntId != rws[j].ParentMenuId)
                                                            {
                                                                continue;
                                                            }
                                                            mnuHTML += String.format("&lt;li style='text-align:left'>&lt;a showwidget='{1}' returntype='true' href='javascript:void(0);'>{0}&lt;/a>&lt;/li>", rws[j].MenuName, rws[j].ShowWidget);
                                                        }
                                                        mnuHTML += "&lt;/ul>&lt;/li>";
                                                    }
                                                    mnuHTML += "&lt;/ul>";
                                                    return mnuHTML;
                                                };

                                                AsyncWidgets.user.on('loggedIn', function () {
                                                    if (!t.Menu) {

                                                        var inv = new AsyncWidgets.RAInvoker();
                                                        t.hide();
                                                        inv.on('onSuccess', function (res) {
                                                            t.Menu = true;
                                                            //debugger;
                                                            var res = decJSON(res), mnuHTML;

                                                            if (res.status == 'OK') {
                                                                $('.menuContainer', t.el).html(getMenu(res.Response.Rows));
                                                                if (__touch) {
                                                                    $('#jsddm > li', t.el).bind('click', jsddm_open)
                                                                    $(document).bind('click', jsddm_timer);
                                                                }
                                                                else
                                                                    $('#jsddm > li', t.el).bind('mouseover', jsddm_openMO).bind('mouseout', jsddm_timerMO);
                                                                AsyncWidgets.WidgetManager.bind($('.menuContainer [showwidget]', t.el));
                                                            }
                                                            else {
                                                                //                                    if (dbg()) {
                                                                alert('Unable to logged in!');
                                                                //                                    }
                                                            }
                                                            t.show();
                                                            $(t.el).unmask();
                                                        });
                                                        inv.on('onFailure', function (res) {
                                                            t.show();
                                                            $(t.el).unmask();
                                                            alert('Problem occured while connection to web server');
                                                        });
                                                        t.$el.mask('Please wait while loading ...');
                                                        ServiceInfo = getForm(null, null, { Command: 'FX_SEL_SimpleMenu' });
                                                        inv.invokeRA({
                                                            params: ["ActorId", 'Authentication', "ActionId", 'GetUserMenu', "ServiceInfo", ServiceInfo]
                                                        });
                                                    }
                                                });


                                                if (!t.Menu) {  //if menu is not rendered
                                                    if (!!window.MenuData) {

                                                        t.Menu = true;
                                                        $('.menuContainer', t.el).html(getMenu(MenuData.Response.Rows));
                                                        if (__touch) {
                                                            $('#jsddm > li', t.el).bind('click', jsddm_open)
                                                            $(document).bind('click', jsddm_timer);
                                                        }
                                                        else
                                                            $('#jsddm > li', t.el).bind('mouseover', jsddm_openMO).bind('mouseout', jsddm_timerMO);

                                                        AsyncWidgets.WidgetManager.bind($('.menuContainer [showwidget]', t.el));
                                                        return;
                                                    }
                                                }
                                            }
                                        </script>
                                    </Scripts>


                                </uc3:Form>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="background-image: url(App_Themes/eForms_Theme/Images/i/t4.gif);
                                background-repeat: repeat-x" align="middle">
                                <img height="11" width="73" alt="" src="App_Themes/eForms_Theme/Images/spacer.gif" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="padding-top: 5px; padding-bottom: 5px;">
                                <table border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff" width="100%"
                                    style="border-collapse: collapse;">
                                    <tr>
                                        <td align="center">
                                            <table border="0" width="100%" cellpadding="2" cellspacing="1">
                                                <tr>
                                                    <td align="center" style="padding-left: 10px">
                                                        <img height="35" width="96" alt="" src="App_Themes/eForms_Theme/Images/Logo_eForms.png"
                                                            border="0" />
                                                    </td>
                                                    <td align="center" style="padding-left: 10px; display: none">
                                                        <a href='javascript:void(0);'>
                                                            <img height="30" width="119" alt="" src="App_Themes/eForms_Theme/Images/Logo_iDashboards.png"
                                                                border="0" /></a>
                                                    </td>
                                                    <td class="bottom text-align-negative" nowrap="nowrap" width="100%">
                                                        <%--<b>Follow Us: </b>--%>
                                                    </td>
                                                    <td style="padding-left: 10px; padding-right: 10px; padding-top: 0px" nowrap="nowrap">
                                                        <%-- Any Images or Logos--%>
                                                        <a href='javascript:void(0);' style="display: none">
                                                            <img height="30" width="30" alt="" title="Alerts" src="App_Themes/eForms_Theme/Images/Alert.png"
                                                                border="0" /></a> <a id="lnkiDashboard" href='javascript:void(0);' displayroles="Show_iDashboard"
                                                                    runat="server" showwidget='frmiDashboard'>
                                                                    <img height="40" width="40" alt="" title="iDashboard" src="App_Themes/eForms_Theme/Images/iDashboard.png"
                                                                        border="0" /></a> <a id="lnkAdministration" href='javascript:void(0);' displayroles="Show_Administration"
                                                                            runat="server" showwidget='conAdministration'>
                                                                            <img height="40" width="40" alt="" title="Administration" src="App_Themes/eForms_Theme/Images/settings-icon.png"
                                                                                border="0" /></a>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" style="background-image: url(App_Themes/eForms_Theme/Images/i/t4.gif);
                                background-repeat: repeat-x" align="middle">
                                <img height="11" width="73" alt="" src="App_Themes/eForms_Theme/Images/spacer.gif" />
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
        <tr>
        <td>
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
    <tbody>
        <tr>
            <td colspan="2" style="background-image: url(App_Themes/eForms_Theme/Images/i/t5.gif); background-repeat: repeat-x"
                class="text-align-positive">
                <table cellspacing="0" cellpadding="0" border="0" width="100%">
                    <tbody>
                        <tr>
                            <td >
                                <table cellspacing="0" cellpadding="0" border="0" class="HeaderTitlePanel">
                                    <tbody>
                                        <tr>
                                            <td class="headr">
                                                <img height="26px" width="35px" alt="" src="App_Themes/eForms_Theme/Images/spacer.gif" />
                                            </td>
                                            <td width="100%" class="head-search" nowrap="nowrap">
                                                <span style="color: White; font-weight: bold; padding-left:10px" class="HeaderTitle">
                                                   Welcome to eForms - Paperless Office
                                                </span>
                                                <img height="10px" width="10px" alt="" src="App_Themes/eForms_Theme/Images/spacer.gif" />
                                            </td>
                                            <td class="headl">
                                                <img height="26px" width="35px" alt="" src="App_Themes/eForms_Theme/Images/spacer.gif" />
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
  
                           <td width="100%" align="right" style="padding-right:10px;padding-bottom:5px">
                                <div class="jclock" style="padding: 0 0 0 0; font-weight:bold"></div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="background-image: url(App_Themes/eForms_Theme/Images/i/f-t4.gif); background-repeat: repeat-x">
                <img alt="" src="App_Themes/eForms_Theme/images/f-t4.gif" />
                            </td>
        </tr>
    </tbody>
</table>
        </td>
        </tr>
    </tbody>
</table>
