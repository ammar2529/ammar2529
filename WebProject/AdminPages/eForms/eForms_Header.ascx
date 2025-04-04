<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="eForms_Header.ascx.cs" Inherits="WebProject.AdminPages.eForms.eForms_Header" %>
<asp:Literal ID="MenuData" runat="server">
</asp:Literal>


<style>
    .d-flex.align-items-center .dropdown-menu {
        position: absolute;
        display: none; /* Hide by default */
    }

    .d-flex.align-items-center .dropdown:hover .dropdown-menu {
        display: block; /* Show on hover */
    }

    .navbar-brand {
        display: flex;
        align-items: center;
        justify-content: center;
        width: 11%;
        text-align: center;
        position: relative;
    }

        .navbar-brand .fa-opencart {
            position: absolute;
            left: 5px;
            font-size: 16px; /* Adjust font size as needed */
        }

        .navbar-brand h6 {
            margin: 0;
            flex-grow: 1;
        }

    .dropdown-menu {
        position: absolute;
        cursor: pointer;
    }

    .dropdown-item {
        cursor: pointer;
    }

    .navbar-nav {
        padding-left: 15px;
    }

    .home {
        cursor: pointer;
    }

    .navbar {
        margin: 10px 0;
        border-radius: 8px;
    }

    .navbar-brand {
        margin-left: 15px;
    }
    /*    .logout {
        margin-right: 15px;
    }*/
    .offcanvas {
        background-color: gray;
        margin-top: 56px;
    }
    .UserName {
 text-decoration: none !important; /* Remove underline */
    }

    @media (min-width: 992px) {
        .navbar-nav .dropdown:hover .dropdown-menu {
            display: block;
        }
    }
</style>

<!-- Updated Navbar -->
<div id="menuContainer">
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light bg-body-tertiary">
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <a class="navbar-brand mt-2 mt-lg-0">
                        <i class="fa-brands fa-opencart home" returntype="true" showwidget="frmInbox"></i>
                        <h6 class="h6 home" returntype="true" showwidget="frmInbox">BuDastoor</h6>
                    </a>
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0" id="dynamicMenu">
                        <!-- Dynamic menu items will be injected here -->
                    </ul>
                </div>
                <div class="d-flex align-items-center">
                    <div class="dropdown">
                        <a class="dropdown-toggle d-flex align-items-center hidden-arrow" id="navbarDropdownMenuAvatar" role="button" aria-expanded="false">
                            <span class="UserName me-2"></span>
                            <!-- Add the user's name here -->
                            <i class="fa-solid fa-user"></i>
                            <!-- User icon -->
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownMenuAvatar">
                            <%-- <li><a class="dropdown-item" href="#">My profile</a></li>
            <li><a class="dropdown-item" href="#">Settings</a></li> --%>
                            <li><a class="dropdown-item logout">Logout</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </nav>
        <div>new div</div>
    </div>
</div>

<!-- JavaScript to render dynamic menu -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var menuData = MenuData.Rows;

        //var userRoles = decJSON(AsyncWidgets.user.conf);
        var userName = AsyncWidgets.user.name;

        
        function renderMenu() {
            var menuText = '';

            for (var idx in menuData) {
                var parentMenu = menuData[idx];

                if (parentMenu.ParentMenuId != 0) {
                    break;
                }

                if (parentMenu.MenuId == 0) {
                    menuText += '<li class="nav-item">';
                    menuText += '<a class="nav-link home" returntype="true" showwidget="frmInbox">';
                    menuText += '<i class="fa-solid fa-house"></i> ' + parentMenu.MenuName; // Add icon here
                    menuText += '</a>';
                    menuText += '</li>';
                } else if (hasChild(parentMenu.MenuId)) {
                    menuText += '<li class="nav-item dropdown">';
                    menuText += '<a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">';
                    menuText += parentMenu.MenuName;
                    menuText += '</a>';
                    menuText += '<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">';

                    for (var jdx in menuData) {
                        var childMenu = menuData[jdx];
                        if (parentMenu.MenuId == childMenu.ParentMenuId) {
                            menuText += '<li><a class="dropdown-item" returntype="true" showwidget="' + childMenu.ShowWidget + '">' + childMenu.MenuName + '</a></li>';
                        }
                    }

                    menuText += '</ul>';
                    menuText += '</li>';
                } else {
                    menuText += '<li class="nav-item">';
                    menuText += '<a class="nav-link" returntype="true" showwidget="' + parentMenu.ShowWidget + '">' + parentMenu.MenuName + '</a>';
                }
            }

            document.getElementById('dynamicMenu').innerHTML = menuText;
        }

        function hasChild(menuId) {
            for (var i in menuData) {
                if (menuData[i].ParentMenuId == menuId) {
                    return true;
                }
            }
            return false;
        }

        renderMenu();
        AsyncWidgets.WidgetManager.bind($('#menuContainer [showwidget]'));
       

        $('.logout').click(function () {

            var inv = new AsyncWidgets.RAInvoker();
            inv.invokeRA({
                params: ["ActorId", "Authentication", "ActionId", "LogoutUser", "ServiceInfo", "<root><dummy></dummy></root>"]
            });

            AsyncWidgets.user.logout();
            inv.on('onSuccess', function (res) {
                $('.card').hide();
                window.location = "/Login.aspx"
                window.location.pathname = BASE_PATH + "BuDastoorHome"; //"Logout.aspx";
            });
        });

        if (userName) {
            var a = $('#menuContainer')
            $('.UserName',a).text(userName);
            $('.UserName', a).css('text-decoration', 'none')
        }
    });


</script>
