AsyncWidgets.WidgetScripts.frmBeneficiaryManagement = function (obj) {
    var t = obj;
    AsyncWidgets.WidgetScripts.frmBeneficiaryManagement.t = t;

    // Function to handle field and label updates
    function updateBeneficiaryFields() {
        if ($(".Company").is(":checked")) {
            // Company selected: Add '*' to CompanyTD and remove '*' from PersonTD
            $(".CompanyTD").html("Company Name*:");
            $(".PersonTD").html("Person Name:");

            // Set required attribute accordingly
            $('[argumentid="PersonName"]', t.el).removeClass('required');
            $('[argumentid="CompanyName"]', t.el).addClass('required');
        }
        else if ($(".Individual").is(":checked")) {
            // Individual selected: Add '*' to PersonTD and remove '*' from CompanyTD
            $(".CompanyTD").html("Company Name:");
            $(".PersonTD").html("Person Name*:");

            // Set required attribute accordingly
            $('[argumentid="PersonName"]', t.el).addClass('required');
            $('[argumentid="CompanyName"]', t.el).removeClass('required');
        }
    }

    // Call function when radio buttons are clicked
    $(".Company, .Individual").click(updateBeneficiaryFields);

    // Call function on form show to apply settings immediately
    t.on('show', function (args) {
        updateBeneficiaryFields();
    });

    t.on('onLoadedValues', function (args) {
        updateBeneficiaryFields();
    });
};