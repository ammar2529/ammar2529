<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BudastoorLogin.aspx.cs" Inherits="WebProject.BudastoorLogin" %>

<!doctype html>
<html lang="en">
<head >
    <title>Login Page</title>
    <script language='javascript' type='text/javascript'> ROOT_PATH = ''; BASE_PATH = "";</script>
    <link href="App_Themes/eForms_Theme/StyleSheets/bootstrap.min.css" rel="stylesheet" />
    <link href="App_Themes/eForms_Theme/StyleSheets/ControllsAndSelect.css" rel="stylesheet" />
    <script src="../../AsyncWidgets/Scripts/jquery.js"></script>
<%--<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,600&display=swap">--%>
    <style>
       
/*        @font-face {
            font-family: 'OpenSans-Regular';
            src: url('./fonts/OpenSans-Regular.woff2') format('woff2');
            font-weight: 400;
            font-style: normal;
        }

        @font-face {
            font-family: 'OpenSans-SemiBold';
            src: url('./fonts/OpenSans-SemiBold.woff2') format('woff2');
            font-weight: 600;
            font-style: normal;
        }*/

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #ebeff3;
          /*  font-family: 'OpenSans-Regular', sans-serif;*/
            /*font-weight: 400;*/
        }

        .card {
            width: 100%;
            max-width: 400px; /* Adjust this value as needed */
        }



        .form-floating .form-control.invalid {
            border-bottom: 2px solid #f44336 !important;
        }

        .form-floating label.invalid {
            color: #f44336 !important;
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
    
</head>
<body>
    <div class="card">
        <div class="card-body">

            <h5 class="card-title text-center mb-3">Login</h5>

            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="form-floating mb-3">
                            <input id="UserName" type="text" class="form-control required" placeholder="Enter User ID" argumentid="UserName" groupid="UserLogin" autocomplete="off">
                            <label for="UserName">User ID</label>
                        </div>
                    </div>

                    <div class="col-12">
                        <div class="form-floating mb-3">
                            <input type="password" class="form-control required " id="UserPassword" placeholder="Enter Password" argumentid="UserPassword" groupid="UserLogin">
                            <label for="UserPassword">Password</label>
                        </div>
                    </div>

                    <div class="col-12 text-center">
                        <button type="button" class="btn btn-primary w-100 btnLogin mt-3" style="background-color: #f08c20; border: none;" conf="{ActorId:'Authentication', ActionId:'AuthenticateUser', Action:'login'}">Login</button>
                    </div>
                </div>
            </div>

            <div class="alert alert-light mt-3 text-center" role="alert" style="display: none">
                Log Out SuccessFully!
            </div>
        </div>
    </div>

    <div class="toast position-fixed bottom-0 end-0 m-3" id="errorToast" role="alert" aria-live="polite" aria-atomic="true">
        <div class="toast-header bg-danger text-white">
            <strong class="me-auto">Error</strong>
            <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
        <div class="toast-body">
            <!-- Message will be dynamically set -->
        </div>
    </div>


    <script src="App_Themes/eForms_Theme/StyleSheets/bootstrap.bundle.min.js"></script>
    <%--    <script src="../../AsyncWidgets/Scripts/AsyncWidgets.js"></script>--%>
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
                                arRoles.forEach(role => {
                                    $('[displayroles*=' + role + ']').show();
                                });
                            }

                            AsyncWidgets.user.conf = res.Response.Conf;
                            AsyncWidgets.user.conf2 = res.Response.Name;
                            window.location = "/BuDastoorHome.aspx";
                        } else {
                            showToast("Authentication failed! Please check your credentials.");
                        }
                    } else {
                        showToast("Server error! Please try again later.");
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

            // Function to show Bootstrap Toast
            function showToast(message) {
                var toastEl = $('#errorToast');
                toastEl.find('.toast-body').text(message);
                var toast = new bootstrap.Toast(toastEl[0]);
                toast.show();
            }


            $('.form-floating .form-control').on('blur', function () {
                
                var isRequired = $(this).attr('required') || $(this).hasClass('required'); // Check if 'required' attribute or class exists
                var value = $(this).val().trim(); // Remove extra spaces

                if (isRequired && !value) { // Apply validation only if 'required' exists
                    $(this).addClass('invalid');
                    $(this).siblings('label').addClass('invalid');
                } else {
                    $(this).removeClass('invalid');
                    $(this).siblings('label').removeClass('invalid');
                }
            });

            // Remove error styling when user focuses on the input
            $('.form-floating .form-control').on('focus', function () {
                $(this).removeClass('invalid');
                $(this).siblings('label').removeClass('invalid');
            });
        });
    </script>
</body>
</html>
