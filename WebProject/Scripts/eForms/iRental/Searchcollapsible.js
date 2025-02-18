$(document).ready(function () {
    $('.collapsible-header').click(function () {
        const panel = $('#collapsePanel');
        const icon = $('#collapse-icon');

        if (panel.hasClass('show')) {
            icon.text('+');
        } else {
            icon.text('-');
        }
    });
});
