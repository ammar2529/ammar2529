<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="eForms_Header.ascx.cs" Inherits="WebProject.AdminPages.eForms.eForms_Header" %>
<asp:Literal ID="MenuData" runat="server">
</asp:Literal>
<style>
    /* First Navbar (Existing) */
    .navbar {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        z-index: 1030;
        margin: 0;
        border-radius: 0;
        background-color: #f8f9fa;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    /* Second Navbar */
    .secondary-navbar {
        position: fixed;
        top: 56px; /* Adjust based on first navbar height */
        left: 0;
        width: 100%;
        z-index: 1029; /* Below first navbar */
        background-color: #e9ecef; /* Slightly different background for distinction */
        padding: 0.5rem 1rem;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        display: none; /* Hidden by default */
    }

    .secondary-navbar.enabled {
        display: flex; /* Show when enabled */
        justify-content: flex-end; /* Align icons to the right */
    }

    .secondary-navbar.disabled .nav-icon {
        opacity: 0.5; /* Grayed out when disabled */
        pointer-events: none; /* Non-clickable */
        cursor: not-allowed;
    }

    .secondary-navbar.enabled .nav-icon {
        opacity: 1; /* Fully visible */
        pointer-events: auto; /* Clickable */
        cursor: pointer;
    }

    .nav-icon {
        font-size: 1.5rem; /* Icon size */
        margin-left: 1rem; /* Space between icons */
        color: #343a40; /* Dark color for icons */
        transition: color 0.2s ease;
    }

    .nav-icon:hover {
        color: #ff6200; /* Orange on hover (matches your theme) */
    }

    /* Dropdown menu styles */
    .d-flex.align-items-center .dropdown-menu {
        position: absolute;
        display: none;
    }

    .d-flex.align-items-center .dropdown:hover .dropdown-menu {
        display: block;
    }

    /* Navbar brand */
    .navbar-brand {
        display: flex;
        align-items: center;
        justify-content: center;
        width: 11%;
        text-align: center;
        position: relative;
        margin-left: 15px;
    }

    .navbar-brand .fa-opencart {
        position: absolute;
        left: 5px;
        font-size: 16px;
    }

    .navbar-brand h6 {
        margin: 0;
        flex-grow: 1;
    }

    /* Dropdown menu */
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

    .offcanvas {
        background-color: gray;
        margin-top: 56px;
    }

    .UserName {
        text-decoration: none !important;
    }

    /* Responsive adjustments */
    @media (min-width: 992px) {
        .navbar-nav .dropdown:hover .dropdown-menu {
            display: block;
        }
    }

    @media (max-width: 991.98px) {
        .navbar-collapse {
            background-color: #f8f9fa;
        }
        .secondary-navbar {
            top: 56px; /* Same as desktop, adjust if mobile navbar height differs */
        }
    }

    @media (max-width: 575.98px) {
        .secondary-navbar {
            padding: 0.5rem;
        }
        .nav-icon {
            font-size: 1.2rem; /* Smaller icons on mobile */
            margin-left: 0.75rem;
        }
    }
</style>

<!-- Updated Navbar -->
<div id="menuContainer">
    <!-- First Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-body-tertiary">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <a class="navbar-brand mt-2 mt-lg-0">
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
                        <i class="fa-solid fa-user"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownMenuAvatar">
                        <li><a class="dropdown-item logout">Logout</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>

    <!-- Second Navbar -->
    <nav class="secondary-navbar disabled" id="secondaryNavbar">
        <a class="nav-icon settings-icon" title="Settings"><i class="fas fa-cog" showwidget="conAdministration" onclick="toggleSidebar()"></i></a>
        <a class="nav-icon crystal-report-icon" title="Crystal Reports"><i class="fas fa-file-alt" showwidget="frmiDashboard" displayroles="Show_iDashboard"></i></a>
    </nav>
</div>

<!-- JavaScript to render dynamic menu and control second navbar -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var menuData = MenuData.Rows;
        var userName = AsyncWidgets.user.name;
        var userId = AsyncWidgets.user.id; // Assuming user.id holds the userid
        var userRoles = AsyncWidgets.user.conf;
        var conUserRoles = decJSON(userRoles);
        var roles = conUserRoles.Roles;

        var rolesArray = roles.split(',').filter(Boolean); // Split & remove empty values

        if (rolesArray.includes("Car_Customer_Details")) {
            console.log("Role Found: Car_Customer_Details");
        } else {
            console.log("Role Not Found");
        }

        
        // Render dynamic menu for first navbar
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
                    menuText += '<i class="fa-solid fa-house"></i> ' + parentMenu.MenuName;
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
                    menuText += '</li>';
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

        // Control second navbar visibility and state
        var secondaryNavbar = document.getElementById('secondaryNavbar');


        // Settings icon click handler (example)
        $('.settings-icon').click(function () {
            if (secondaryNavbar.classList.contains('enabled')) {
                // Add your settings logic here
                //alert('Settings clicked!');
            }
        });

        // Crystal Reports icon click handler (example)
        $('.crystal-report-icon').click(function () {
            if (secondaryNavbar.classList.contains('enabled')) {
                // Add your Crystal Reports logic here
                //alert('Crystal Reports clicked!');
            }
        });

        $('.logout').click(function () {
            var inv = new AsyncWidgets.RAInvoker();
            inv.invokeRA({
                params: ["ActorId", "Authentication", "ActionId", "LogoutUser", "ServiceInfo", "<root><dummy></dummy></root>"]
            });

            AsyncWidgets.user.logout();
            inv.on('onSuccess', function (res) {
                $('.card').hide();
                window.location = "/Login.aspx";
                window.location.pathname = BASE_PATH + "BuDastoorHome";
            });
        });

        if (userName) {
            var a = $('#menuContainer');
            $('.UserName', a).text(userName);
            $('.UserName', a).css('text-decoration', 'none');
            if (userName == 'Asif Mirza') {
                secondaryNavbar.classList.remove('disabled');
                secondaryNavbar.classList.add('enabled');
            } else {
                secondaryNavbar.style.display = 'none'; // Explicitly hide

            }
        }
    });
</script>