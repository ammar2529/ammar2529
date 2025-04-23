<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="eForms_Header.ascx.cs" Inherits="WebProject.AdminPages.eForms.eForms_Header" %>
<asp:Literal ID="MenuData" runat="server">
</asp:Literal>
<style>
    /* Vertical Navbar Container */
    .sidebar {
        position: fixed;
        top: 0;
        left: 0;
        width: 200px; /* Reduced for mobile to avoid stretch */
        height: 100vh;
        background-color: #f8f9fa;
        box-shadow: 2px 0 4px rgba(0, 0, 0, 0.1);
        z-index: 1030;
        display: flex;
        flex-direction: column;
        overflow-y: auto;
        transition: transform 0.3s ease;
    }

    /* Navbar Brand */
    .navbar-brand {
        display: flex;
        align-items: center;
        padding: 1rem;
        border-bottom: 1px solid #e9ecef;
    }

    .navbar-brand .fa-opencart {
        font-size: 16px;
        margin-right: 10px;
    }

    .navbar-brand h6 {
        margin: 0;
        font-size: 1.25rem;
    }

    /* Primary Navbar Menu */
    .navbar-nav {
        flex-direction: column;
        padding: 1rem;
    }

    .nav-item {
        width: 100%;
    }

    .nav-link {
        padding: 0.5rem 1rem;
        color: #343a40;
        transition: background-color 0.2s ease;
    }

    .nav-link:hover {
        background-color: #e9ecef;
        color: #ff6200;
    }

    /* Dropdown Menu */
    .dropdown-menu {
        position: static;
        width: 100%;
        box-shadow: none;
        border: none;
        background-color: #f1f3f5;
        padding-left: 1.5rem;
        display: none;
        transition: none;
    }

    .dropdown.show .dropdown-menu,
    .dropdown:hover .dropdown-menu {
        display: block;
    }

    .dropdown-item {
        padding: 0.5rem 1rem;
        color: #343a40;
    }

    .dropdown-item:hover {
        background-color: #e9ecef;
        color: #ff6200;
    }

    .dropdown-item i {
        color: #007bff;
        font-size: 16px;
        margin-right: 8px;
    }

    /* Secondary Navbar */
    .secondary-navbar {
        flex-direction: column;
        padding: 1rem;
        background-color: #e9ecef;
        border-top: 1px solid #dee2e6;
        display: none;
    }

    .secondary-navbar.enabled {
        display: flex;
    }

    .secondary-navbar.disabled .nav-icon {
        opacity: 0.5;
        pointer-events: none;
        cursor: not-allowed;
    }

    .secondary-navbar.enabled .nav-icon {
        opacity: 1;
        pointer-events: auto;
        cursor: pointer;
    }

    .nav-icon {
        font-size: 1.5rem;
        color: #343a40;
        padding: 0.5rem 1rem;
        transition: color 0.2s ease;
    }

    .nav-icon:hover {
        color: #ff6200;
    }

    /* User Dropdown */
    .user-dropdown {
        padding: 1rem;
        border-top: 1px solid #e9ecef;
    }

    .user-dropdown .dropdown-toggle {
        display: flex;
        align-items: center;
        color: #343a40;
        text-decoration: none;
    }

    .user-dropdown.show .dropdown-menu,
    .user-dropdown:hover .dropdown-menu {
        display: block;
    }

    .user-dropdown .dropdown-menu {
        width: 100%;
        padding-left: 1.5rem;
    }

    .logout i {
        color: #dc3545;
        font-size: 16px;
    }

    /* Navbar Toggler */
    .navbar-toggler {
        position: fixed;
        top: 10px;
        left: 10px;
        z-index: 1031;
        background: #fff;
        border: 1px solid #dee2e6;
        padding: 5px 10px;
        border-radius: 4px;
        display: none;
    }

    /* Responsive Design */
    @media (min-width: 992px) {
        .sidebar {
            width: 250px; /* Full width for desktop */
            transform: none !important;
            display: block !important;
        }

        .navbar-toggler {
            display: none !important;
        }
    }

    @media (max-width: 991.98px) {
        .sidebar {
            transform: translateX(-200px); /* Hidden by default */
            display: block;
        }

        .sidebar.active {
            transform: translateX(0); /* Show when active */
        }

        .navbar-toggler {
            display: block;
        }

        .dropdown:hover .dropdown-menu,
        .user-dropdown:hover .dropdown-menu {
            display: none;
        }

        .dropdown.show .dropdown-menu,
        .user-dropdown.show .dropdown-menu {
            display: block;
        }
    }

    @media (max-width: 575.98px) {
        .sidebar {
            width: 180px;
            transform: translateX(-180px);
        }

        .sidebar.active {
            transform: translateX(0);
        }

        .nav-icon {
            font-size: 1.2rem;
        }
    }
</style>

<!-- Vertical Sidebar -->
<div class="sidebar" id="menuContainer">
    <!-- Navbar Brand -->
    <a class="navbar-brand">
        <i class="fa-solid fa-opencart"></i>
        <h6 class="home" returntype="true" showwidget="frmInbox">BuDastoor</h6>
    </a>

    <!-- Primary Navbar -->
    <ul class="navbar-nav" id="dynamicMenu">
        <!-- Dynamic menu items will be injected here -->
    </ul>

    <!-- Secondary Navbar -->
    <nav class="secondary-navbar disabled" id="secondaryNavbar">
<%--        <a class="nav-icon settings-icon" title="Settings" aria-label="Open Settings">
            <i class="fas fa-cog" showwidget="conAdministration" onclick="toggleSidebar()"></i> Settings
        </a>
        <a class="nav-icon crystal-report-icon" title="Crystal Reports" aria-label="View Crystal Reports">
            <i class="fas fa-file-alt" showwidget="frmiDashboard" displayroles="Show_iDashboard"></i> Crystal Reports
        </a>--%>
    </nav>

    <!-- User Dropdown -->
    <div class="user-dropdown">
        <div class="dropdown">
            <a class="dropdown-toggle" id="navbarDropdownMenuAvatar" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <span class="UserName me-2"></span>
                <i class="fa-solid fa-user"></i>
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuAvatar">
                <li>
                    <a class="dropdown-item settings">
                        <i class="fas fa-cog me-2"></i> Settings
                    </a>
                </li>
                <li>
                    <a class="dropdown-item report">
                        <i class="fas fa-file-alt me-2"></i> Crystal Report
                    </a>
                </li>
                <li>
                    <a class="dropdown-item logout">
                        <i class="fas fa-sign-out-alt me-2"></i> Logout
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>

<!-- Navbar Toggler for Mobile -->
<button class="navbar-toggler d-lg-none" type="button" aria-label="Toggle sidebar" aria-expanded="false" aria-controls="menuContainer">
    <i class="fas fa-bars"></i>
</button>

<!-- JavaScript -->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var menuData = MenuData.Rows || [];
        var userName = AsyncWidgets.user?.name;
        var userRoles = AsyncWidgets.user?.conf ? decJSON(AsyncWidgets.user.conf).Roles : '';
        var rolesArray = userRoles.split(',').filter(Boolean);

        // Render dynamic menu for primary navbar
        function renderMenu() {
            var menuText = '';

            menuData.filter(menu => menu.ParentMenuId == 0).forEach(parentMenu => {
                if (parentMenu.MenuId == 0) {
                    menuText += '<li class="nav-item">';
                    menuText += '<a class="nav-link home" returntype="true" showwidget="frmInbox">';
                    menuText += '<i class="fa-solid fa-house"></i> ' + parentMenu.MenuName;
                    menuText += '</a>';
                    menuText += '</li>';
                } else if (hasChild(parentMenu.MenuId)) {
                    menuText += '<li class="nav-item dropdown">';
                    menuText += '<a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink' + parentMenu.MenuId + '" role="button" data-bs-toggle="dropdown" aria-expanded="false">';
                    menuText += parentMenu.MenuName;
                    menuText += '</a>';
                    menuText += '<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink' + parentMenu.MenuId + '">';

                    menuData.filter(childMenu => parentMenu.MenuId == childMenu.ParentMenuId).forEach(childMenu => {
                        menuText += '<li><a class="dropdown-item" returntype="true" showwidget="' + childMenu.ShowWidget + '">' + childMenu.MenuName + '</a></li>';
                    });

                    menuText += '</ul>';
                    menuText += '</li>';
                } else {
                    menuText += '<li class="nav-item">';
                    menuText += '<a class="nav-link" returntype="true" showwidget="' + parentMenu.ShowWidget + '">' + parentMenu.MenuName + '</a>';
                    menuText += '</li>';
                }
            });

            document.getElementById('dynamicMenu').innerHTML = menuText;
        }

        function hasChild(menuId) {
            return menuData.some(menu => menu.ParentMenuId == menuId);
        }

        renderMenu();
        AsyncWidgets.WidgetManager.bind($('#menuContainer [showwidget]'));

        // Control secondary navbar visibility
        var secondaryNavbar = document.getElementById('secondaryNavbar');
        if (rolesArray.includes("Admin") || userName === 'Asif Mirza') {
            secondaryNavbar.classList.remove('disabled');
            secondaryNavbar.classList.add('enabled');
        }

        // Settings icon click handler
        $('.settings-icon').click(function () {
            if (secondaryNavbar.classList.contains('enabled')) {
                // Add settings logic here
            }
        });

        // Crystal Reports icon click handler
        $('.crystal-report-icon').click(function () {
            if (secondaryNavbar.classList.contains('enabled')) {
                // Add Crystal Reports logic here
            }
        });

        // Logout handler
        $('.logout').click(function () {
            var inv = new AsyncWidgets.RAInvoker();
            inv.invokeRA({
                params: ["ActorId", "Authentication", "ActionId", "LogoutUser", "ServiceInfo", "<root><dummy></dummy></root>"]
            });
            AsyncWidgets.user.logout();
            inv.on('onSuccess', function (res) {
                $('.card').hide();
                window.location.href = "/Login.aspx";
            });
        });

        // Update user name
        if (userName) {
            $('.UserName').text(userName).css('text-decoration', 'none');
        }

        // Mobile toggle
        const sidebar = document.querySelector('.sidebar');
        const toggler = document.querySelector('.navbar-toggler');
        const overlay = document.querySelector('.sidebar-overlay');
        const mainContent = document.querySelector('.main-content');

        toggler.addEventListener('click', function () {
            sidebar.classList.toggle('active');
            toggler.setAttribute('aria-expanded', sidebar.classList.contains('active'));
            if (sidebar.classList.contains('active')) {
                overlay.style.display = 'block';
                mainContent.style.filter = 'blur(3px)';
            } else {
                overlay.style.display = 'none';
                mainContent.style.filter = 'none';
            }
        });

        // Fix dropdown flickering on mobile
        $('.dropdown').on('show.bs.dropdown', function (e) {
            if (window.innerWidth < 992) {
                $(this).find('.dropdown-menu').css('display', 'block');
            }
        }).on('hide.bs.dropdown', function (e) {
            if (window.innerWidth < 992) {
                $(this).find('.dropdown-menu').css('display', 'none');
            }
        });

        // Handle sidebar state on load and resize
        function updateSidebarState() {
            if (window.innerWidth >= 992) {
                sidebar.classList.remove('active');
                sidebar.style.transform = 'none';
                sidebar.style.display = 'block';
                toggler.style.display = 'none';
                overlay.style.display = 'none';
                mainContent.style.filter = 'none';
                mainContent.style.marginLeft = '250px';
            } else {
                sidebar.classList.remove('active');
                /*sidebar.style.transform = 'translateX(0)';*/
                sidebar.style.display = 'block';
                toggler.style.display = 'block';
                overlay.style.display = 'none';
                mainContent.style.filter = 'none';
                mainContent.style.marginLeft = '0';
            }
        }

        // Run on load
        updateSidebarState();

        // Run on resize
        window.addEventListener('resize', updateSidebarState);

        // Close sidebar when clicking overlay
        if (overlay) {
            overlay.addEventListener('click', function () {
                sidebar.classList.remove('active');
                toggler.setAttribute('aria-expanded', 'false');
                overlay.style.display = 'none';
                mainContent.style.filter = 'none';
            });
        }
    });
</script>

<%--after old navbar--%>
<%--<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="eForms_Header.ascx.cs" Inherits="WebProject.AdminPages.eForms.eForms_Header" %>
<asp:Literal ID="MenuData" runat="server">
</asp:Literal>
<style>
    /* Vertical Navbar Container */
    .sidebar {
        position: fixed;
        top: 0;
        left: 0;
        width: 250px; /* Fixed width for sidebar */
        height: 100vh; /* Full viewport height */
        background-color: #f8f9fa;
        box-shadow: 2px 0 4px rgba(0, 0, 0, 0.1);
        z-index: 1030;
        display: flex;
        flex-direction: column;
        overflow-y: auto; /* Scroll if content overflows */
    }

    /* Navbar Brand */
    .navbar-brand {
        display: flex;
        align-items: center;
        padding: 1rem;
        border-bottom: 1px solid #e9ecef;
    }

    .navbar-brand .fa-opencart {
        font-size: 16px;
        margin-right: 10px;
    }

    .navbar-brand h6 {
        margin: 0;
        font-size: 1.25rem;
    }

    /* Primary Navbar Menu */
    .navbar-nav {
        flex-direction: column; /* Stack items vertically */
        padding: 1rem;
    }

    .nav-item {
        width: 100%;
    }

    .nav-link {
        padding: 0.5rem 1rem;
        color: #343a40;
        transition: background-color 0.2s ease;
    }

    .nav-link:hover {
        background-color: #e9ecef;
        color: #ff6200; /* Orange hover effect */
    }

    /* Dropdown Menu */
    .dropdown-menu {
        position: static; /* No absolute positioning in vertical layout */
        width: 100%;
        box-shadow: none;
        border: none;
        background-color: #f1f3f5;
        padding-left: 1.5rem; /* Indent child items */
    }

    .dropdown-item {
        padding: 0.5rem 1rem;
        color: #343a40;
    }

    .dropdown-item:hover {
        background-color: #e9ecef;
        color: #ff6200;
    }

    .dropdown-item i {
        color: #007bff;
        font-size: 16px;
        margin-right: 8px;
    }

    /* Secondary Navbar */
    .secondary-navbar {
        flex-direction: column; /* Vertical alignment */
        padding: 1rem;
        background-color: #e9ecef;
        border-top: 1px solid #dee2e6;
        display: none; /* Hidden by default */
    }

    .secondary-navbar.enabled {
        display: flex; /* Show when enabled */
    }

    .secondary-navbar.disabled .nav-icon {
        opacity: 0.5;
        pointer-events: none;
        cursor: not-allowed;
    }

    .secondary-navbar.enabled .nav-icon {
        opacity: 1;
        pointer-events: auto;
        cursor: pointer;
    }

    .nav-icon {
        font-size: 1.5rem;
        color: #343a40;
        padding: 0.5rem 1rem;
        transition: color 0.2s ease;
    }

    .nav-icon:hover {
        color: #ff6200;
    }

    /* User Dropdown */
    .user-dropdown {
        padding: 1rem;
        border-top: 1px solid #e9ecef;
    }

    .user-dropdown .dropdown-toggle {
        display: flex;
        align-items: center;
        color: #343a40;
        text-decoration: none;
    }

    .user-dropdown .dropdown-menu {
        width: 100%;
        padding-left: 1.5rem;
    }

    .logout i {
        color: #dc3545; /* Red shade */
        font-size: 16px;
    }

    /* Main Content Adjustment */
    .main-content {
        margin-left: 250px; /* Offset for sidebar width */
    }

    /* Responsive Design */
    @media (max-width: 991.98px) {
        .sidebar {
            width: 200px;
            transform: translateX(-200px); /* Hidden by default on mobile */
            transition: transform 0.3s ease;
        }

        .sidebar.active {
            transform: translateX(0); /* Show when toggled */
        }

        .main-content {
            margin-left: 0; /* No offset when sidebar is hidden */
        }

        .navbar-toggler {
            position: fixed;
            top: 10px;
            left: 10px;
            z-index: 1031;
        }
    }

    @media (max-width: 575.98px) {
        .sidebar {
            width: 180px;
            transform: translateX(-180px);
        }

        .sidebar.active {
            transform: translateX(0);
        }

        .nav-icon {
            font-size: 1.2rem;
        }
    }
</style>--%>

<%--<!-- Vertical Sidebar -->
<div class="sidebar" id="menuContainer">
    <!-- Navbar Brand -->
    <a class="navbar-brand">
        <i class="fa-solid fa-car"></i>
        <h6 class="home" returntype="true" showwidget="frmInbox">BuDastoor</h6>
    </a>

    <!-- Primary Navbar -->
    <ul class="navbar-nav" id="dynamicMenu">
        <!-- Dynamic menu items will be injected here -->
    </ul>

    <!-- Secondary Navbar -->
    <nav class="secondary-navbar disabled" id="secondaryNavbar">--%>
<%--        <a class="nav-icon settings-icon" title="Settings" aria-label="Open Settings">
            <i class="fas fa-cog" showwidget="conAdministration" onclick="toggleSidebar()"></i> Settings
        </a>
        <a class="nav-icon crystal-report-icon" title="Crystal Reports" aria-label="View Crystal Reports">
            <i class="fas fa-file-alt" showwidget="frmiDashboard" displayroles="Show_iDashboard"></i> Crystal Reports
        </a>--%>
<%--    </nav>

    <!-- User Dropdown -->
    <div class="user-dropdown">
        <div class="dropdown">
            <a class="dropdown-toggle" id="navbarDropdownMenuAvatar" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                <span class="UserName me-2"></span>
                <i class="fa-solid fa-user"></i>
            </a>
            <ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuAvatar">
                <li>
                    <a class="dropdown-item settings">
                        <i class="fas fa-cog me-2"></i> Settings
                    </a>
                </li>
                <li>
                    <a class="dropdown-item report">
                        <i class="fas fa-file-alt me-2"></i> Crystal Report
                    </a>
                </li>
                <li>
                    <a class="dropdown-item logout">
                        <i class="fas fa-sign-out-alt me-2"></i> Logout
                    </a>
                </li>
            </ul>
        </div>
    </div>
</div>--%>

<!-- Navbar Toggler for Mobile -->
<%--<button class="navbar-toggler d-lg-none" type="button" aria-label="Toggle sidebar">
    <i class="fas fa-bars"></i>
</button>--%>

<!-- JavaScript -->
<%--<script>
    document.addEventListener("DOMContentLoaded", function () {
        var menuData = MenuData.Rows || [];
        var userName = AsyncWidgets.user?.name;
        var userRoles = AsyncWidgets.user?.conf ? decJSON(AsyncWidgets.user.conf).Roles : '';
        var rolesArray = userRoles.split(',').filter(Boolean);

        // Render dynamic menu for primary navbar
        function renderMenu() {
            var menuText = '';

            menuData.filter(menu => menu.ParentMenuId == 0).forEach(parentMenu => {
                if (parentMenu.MenuId == 0) {
                    menuText += '<li class="nav-item">';
                    menuText += '<a class="nav-link home" returntype="true" showwidget="frmInbox">';
                    menuText += '<i class="fa-solid fa-house"></i> ' + parentMenu.MenuName;
                    menuText += '</a>';
                    menuText += '</li>';
                } else if (hasChild(parentMenu.MenuId)) {
                    menuText += '<li class="nav-item dropdown">';
                    menuText += '<a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink' + parentMenu.MenuId + '" role="button" data-bs-toggle="dropdown" aria-expanded="false">';
                    menuText += parentMenu.MenuName;
                    menuText += '</a>';
                    menuText += '<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink' + parentMenu.MenuId + '">';

                    menuData.filter(childMenu => parentMenu.MenuId == childMenu.ParentMenuId).forEach(childMenu => {
                        menuText += '<li><a class="dropdown-item" returntype="true" showwidget="' + childMenu.ShowWidget + '">' + childMenu.MenuName + '</a></li>';
                    });

                    menuText += '</ul>';
                    menuText += '</li>';
                } else {
                    menuText += '<li class="nav-item">';
                    menuText += '<a class="nav-link" returntype="true" showwidget="' + parentMenu.ShowWidget + '">' + parentMenu.MenuName + '</a>';
                    menuText += '</li>';
                }
            });

            document.getElementById('dynamicMenu').innerHTML = menuText;
        }

        function hasChild(menuId) {
            return menuData.some(menu => menu.ParentMenuId == menuId);
        }

        renderMenu();
        AsyncWidgets.WidgetManager.bind($('#menuContainer [showwidget]'));

        // Control secondary navbar visibility
        var secondaryNavbar = document.getElementById('secondaryNavbar');
        if (rolesArray.includes("Admin") || userName === 'Asif Mirza') {
            secondaryNavbar.classList.remove('disabled');
            secondaryNavbar.classList.add('enabled');
        }

        // Settings icon click handler
        $('.settings-icon').click(function () {
            if (secondaryNavbar.classList.contains('enabled')) {
                // Add settings logic here
            }
        });

        // Crystal Reports icon click handler
        $('.crystal-report-icon').click(function () {
            if (secondaryNavbar.classList.contains('enabled')) {
                // Add Crystal Reports logic here
            }
        });

        // Logout handler
        $('.logout').click(function () {
            var inv = new AsyncWidgets.RAInvoker();
            inv.invokeRA({
                params: ["ActorId", "Authentication", "ActionId", "LogoutUser", "ServiceInfo", "<root><dummy></dummy></root>"]
            });
            AsyncWidgets.user.logout();
            inv.on('onSuccess', function (res) {
                $('.card').hide();
                window.location.href = "/Login.aspx";
            });
        });

        // Update user name
        if (userName) {
            $('.UserName').text(userName).css('text-decoration', 'none');
        }

        // Mobile toggle
        $('.navbar-toggler').click(function () {
            $('.sidebar').toggleClass('active');
        });
    });
</script>--%>



<%--old navbar--%>
<%--<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="eForms_Header.ascx.cs" Inherits="WebProject.AdminPages.eForms.eForms_Header" %>
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
        right: 0 !important;
        left: auto !important;
        transform: translateX(10px);
        transition: all 0.2s ease-in-out;
    }
    .logout i {
    color: #dc3545; /* Red shade */
    font-size: 16px;
}
    .dropdown-item i {
    color: #007bff; /* Blue shade */
    font-size: 16px;
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
                        <li>
                            <a class="dropdown-item settings">
                                <i class="fas fa-cog me-2"></i>Settings
        </a>
                        </li>
                        <li>
                            <a class="dropdown-item report">
                                <i class="fas fa-file-alt me-2"></i>Crystal Report
        </a>
                        </li>
                        <li>
                            <a class="dropdown-item logout">
                                <i class="fas fa-sign-out-alt me-2"></i>Logout
        </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>

    <!-- Second Navbar -->
    <nav class="secondary-navbar disabled" id="secondaryNavbar" style="display:none">
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
</script>--%>