<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BudastoorLogin.aspx.cs" Inherits="WebProject.BudastoorLogin" %>

<!doctype html>
<html lang="en">
<head runat="server">
    <title>Login Page</title>
    <script language='javascript' type='text/javascript' > ROOT_PATH = ''; BASE_PATH = "";</script>
    <link href="App_Themes/eForms_Theme/StyleSheets/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f8f9fa;
        }
        .card {
            width: 100%;
            max-width: 400px; /* Adjust this value as needed */
        }
        /* Default input styles */
        .form-floating .form-control {
            border: none;
            border-bottom: 2px solid #6c757d; /* Gray bottom border by default */
            border-radius: 0;
            outline: none;
            box-shadow: none;
            height: auto; /* Ensure proper height */
        }
        /* Focus styles */
        .form-floating .form-control:focus {
            border-bottom: 3px solid #ff6200; /* Orange on focus */
            outline: none;
            box-shadow: none;
        }
        /* Filled styles */
        .form-floating .form-control:not(:placeholder-shown) {
            border-bottom: 3px solid #ff6200; /* Orange when filled */
        }
        /* Placeholder styles - hidden by default */
        .form-floating .form-control::placeholder {
            color: transparent; /* Placeholder hidden by default */
            opacity: 0; /* Extra assurance for cross-browser compatibility */
        }
        /* Label styles */
        .form-floating label {
            color: #000; /* Default label color */
            transition: color 0.2s ease, transform 0.2s ease; /* Smooth transitions */
        }
        /* Label color when focused or filled */
        .form-floating .form-control:focus ~ label,
        .form-floating .form-control:not(:placeholder-shown) ~ label {
            color: #ff6200; /* Orange when focused or filled */
        }
        /* Responsive margin adjustments */
        @media (max-width: 575.98px) { /* Bootstrap's 'sm' breakpoint */
            .form-floating {
                margin-bottom: 1rem !important; /* Ensure spacing on small devices */
            }
        }
        @media (min-width: 576px) and (max-width: 991.98px) { /* Between 'sm' and 'lg' */
            .form-floating {
                margin-bottom: 1.5rem !important; /* Slightly more spacing */
            }
        }
    </style>
    <script src="../../AsyncWidgets/Scripts/jquery.js"></script>
</head>
<body>
    <div class="card">
        <div class="card-body">
<%--            <h5 class="card-title">Login</h5>
            <div class="form-floating mb-3">
                <input id="UserName" type="text" class="form-control required" argumentid="UserName" groupid="UserLogin" value="" placeholder="Enter User ID" />
                <label for="UserName">User ID</label>
            </div>
            <div class="form-floating mb-3">
                <input type="password" class="form-control required" id="UserPassword" argumentid="UserPassword" groupid="UserLogin" placeholder="Enter Password" />
                <label for="UserPassword">Password</label>
            </div>
            <button type="button" class="btn btn-primary btnLogin" conf="{ActorId:'Authentication', ActionId:'AuthenticateUser', Action:'login'}">Login</button>

            <div class="alert alert-light mt-3" role="alert" style="display:none">
                Log Out SuccessFully!
            </div>--%>
             <h5 class="card-title text-center mb-3">Login</h5>
            
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="form-floating mb-3">
                            <input id="UserName" type="text" class="form-control required" placeholder="Enter User ID" argumentid="UserName" groupid="UserLogin">
                            <label for="UserName">User ID</label>
                        </div>
                    </div>
                    
                    <div class="col-12">
                        <div class="form-floating mb-3">
                            <input type="password" class="form-control required" id="UserPassword" placeholder="Enter Password" argumentid="UserPassword" groupid="UserLogin">
                            <label for="UserPassword">Password</label>
                        </div>
                    </div>
                    
                    <div class="col-12 text-center">
                        <button type="button" class="btn btn-primary w-100 btnLogin" conf="{ActorId:'Authentication', ActionId:'AuthenticateUser', Action:'login'}">Login</button>
                    </div>
                </div>
            </div>

            <div class="alert alert-light mt-3 text-center" role="alert" style="display:none">
                Log Out SuccessFully!
            </div>
        </div>
    </div>

       

    <script src="App_Themes/eForms_Theme/StyleSheets/bootstrap.bundle.min.js"></script>
    <script src="../../AsyncWidgets/Scripts/AsyncWidgets.js"></script>
    <script src="../../AsyncWidgets/Scripts/Custom-Ext.js"></script>
    <script src="../../AsyncWidgets/Scripts/WidgetBase.js"></script>
    <script src="../../JQuery/Common.js"></script>
    <script>
        $().ready(function () {
            $('.btnLogin').click(function (e) {
                e.preventDefault();
                ServerCallCtx($("body")[0], null, function (res) {
                    if (res.status == 'OK') {
                        if (res.Response.Authenticated) {
                            $('.card').hide();
                            var arRoles = res.Response.Roles.split(',');

                            if (arRoles.length) {
                                for (var i = 0; i < arRoles.length; i++) {
                                    $('[displayroles*=' + arRoles[i] + ']').show();
                                }
                            }

                            AsyncWidgets.user.conf = res.Response.Conf;
                            AsyncWidgets.user.conf2 = res.Response.Name;
                            /*window.location = "/testDataTable.aspx"*/
                            window.location = "/BuDastoorHome.aspx"
                        }
                    }
                }, null, "AuthenticateUser", "Authentication");
                return false;
            });

            function callGetCookie() {
                if (!window.getCookie) {
                    setTimeout(function () {
                        callGetCookie();
                    }, 500)
                } else {
                    $("#UserName").val("amirza");
                    $("#UserPassword").val("sasa");
                    $('.btnLogin').click();
                }
            }
            /* callGetCookie(); */

            function showAlert() {
                $('#logoutAlert').show();
                setTimeout(function () {
                    hideAlert();
                }, 4000);
            }

            function hideAlert() {
                $('#logoutAlert').hide();
            }

            showAlert(); // To show the alert
        });
    </script>
</body>
</html>
