// Toggle dropdown menu on ellipsis click
$(document).on('click', '.actionBtn .fa-ellipsis', function () {
    
    // Toggle menu on ellipsis click
    $('.fa-ellipsis').on('click', function () {
        const $menu = $(this).siblings('.action-menu');
        $('.action-menu').not($menu).hide(); // Hide other open menus

        // Toggle current menu with display: flex
        if ($menu.css('display') === 'none') {
            $menu.css('display', 'flex');
        } else {
            $menu.hide();
        }
    });

    // Handle edit button click
    $(document).on('click', '.edit-btn', function () {
        const $row = $(this).closest('tr');
        console.log('Edit clicked for row:', $row);
        $(this).closest('.action-menu').hide();
    });

    // Handle delete button click
    $(document).on('click', '.delete-btn', function () {
        const $row = $(this).closest('tr');
        console.log('Delete clicked for row:', $row);
        $(this).closest('.action-menu').hide();
    });

    // Hide menu when clicking outside
    $(document).on('click', function (e) {
        if (!$(e.target).closest('.actionBtn').length) {
            $('.action-menu').hide();
        }
    });
});