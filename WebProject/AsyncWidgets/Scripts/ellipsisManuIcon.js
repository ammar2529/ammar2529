// Toggle dropdown menu on ellipsis click
$(document).on('click', '.actionBtn .fa-ellipsis', function () {
    
    const $menu = $(this).siblings('.action-menu');
    $('.action-menu').not($menu).hide(); // Hide other open menus
    $menu.toggle(); // Toggle current menu
});

// Handle edit button click
$(document).on('click', '.edit-btn', function () {
    const $row = $(this).closest('tr');
    // Add your edit logic here, e.g., get row data
    console.log('Edit clicked for row:', $row);
    $(this).closest('.action-menu').hide();
});

// Handle delete button click
$(document).on('click', '.delete-btn', function () {
    const $row = $(this).closest('tr');
    // Add your delete logic here, e.g., remove row or send delete request
    console.log('Delete clicked for row:', $row);
    $(this).closest('.action-menu').hide();
});

// Hide menu when clicking outside
$(document).on('click', function (e) {
    if (!$(e.target).closest('.actionBtn').length) {
        $('.action-menu').hide();
    }
});