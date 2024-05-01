

AsyncWidgets.WidgetScripts.frmUserManagement = function (obj)
{
    var t = obj;

    AsyncWidgets.WidgetScripts.frmSalesContracts.t = t;

    t.on('onLoadedValues', function (p)
    {

        /* var parsedP = JSON.parse(p);*/
   
        var res = p
        var rows = res.res.Response.Rows
        var roleValues = [];
        $('#rolesContent').empty();
        for (var i = 0; i < rows.length; i++)
        {
            var row = rows[ i ];
          
            var rolesString = row.Roles;

            // Split the roles string into an array of role names
            var roles = rolesString.split(',');
            roles.forEach(function (role)
            {
                $('#rolesContent').append(
                    $('<input>').attr({
                        type: 'checkbox',
                        id: role,
                        name: 'userRoles',
                        value: role,
                        checked: true, // Set to true to make checkbox checked by default
                        groupid: 'NewUser', // Adding groupid attribute
                        argumentid: 'Roles' // Adding argumentid attribute
                    })
                ).append(
                    $('<label>').attr('for', role).text(role.replace(/_/g, ' ').toUpperCase())
                ).append($('<br>'));
            });
            
        
        }
        //$('#rolesContent')[ 0 ].reset();

    }
    );

}

        
    