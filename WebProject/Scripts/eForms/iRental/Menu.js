$().ready(function () {
    if (!!window.MenuData) {

        // t.Menu = true;
        var menuHtml = `        <li class="nav-item active">
          <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item ">
          <a class="nav-link" href="#">About</a>
        </li>
<!--
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            Services
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            <a class="dropdown-item" href="#">Service 1</a>
            <a class="dropdown-item" href="#">Service 2</a>
            <a class="dropdown-item" href="#">Service 3</a>
          </div>
        </li>
-->
        ##MenuHTML##
        <li class="nav-item">
          <a class="nav-link" href="#">Contact</a>
        </li>;
`
        //  $('.menuContainer', t.el).html(getMenu(MenuData.Response.Rows));
        var pItemTemp = `        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            ##parentMenu##
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
            ##ChildItems##
          </div>
        </li>
`;
        var cItemTemp = `<a class="dropdown-item" href="#">{childMenu}</a>`;

        //////////////////////////////////////////////////////////


        var pMenu = "Renting";

        pItemHtml = pItem.replace("#parentMenu#", pMenu);

        //inner loop firttime
        var cMenu = "Renting child1";
        cMenuHtml += `<a class="dropdown-item menuContainer" href="#">{cMenu}</a>`;


        //inner loop secondtime
        cMenu = "Renting child2";
        cMenuHtml += `<a class="dropdown-item menuContainer" href="#">{cMenu}</a>`;

        pItemHtml.replace('##ChildItems##', cMenuHtml);
        cMenuHtml = "";



        pMenu = "Leasing";
        pItem = pItem.replace("#parentMenu# menuContainer", pMenu);

        //inner loop secondtime
        cMenu = "Leaseing child2";
        cMenuHtml += `<a class="dropdown-item menuContainer" href="#">{cMenu}</a>`;


        pItemHtml.replace('##ChildItems##', cMenuHtml);
        cMenuHtml = "";


        AsyncWidgets.WidgetManager.bind($('.menuContainer [showwidget]', t.el));


        return;
    }


});