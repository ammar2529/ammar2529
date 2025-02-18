<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebProject.AdminPages.eForms.Login" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>
    <script language='javascript' type='text/javascript' > ROOT_PATH = ''; BASE_PATH = "";</script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
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
    </style>
    <script src="../../AsyncWidgets/Scripts/jquery.js"></script>
</head>
<body>
<%--    <form onsubmit="return false;">--%>
        <div class="card">
            <div class="card-body">
                <h5 class="card-title">Login</h5>
                <div class="mb-3">
                    <label for="exampleInputEmail1" class="form-label">User ID:</label>
                    <input id="UserName" type="text" class="form-control required" argumentid="UserName" groupid="UserLogin" value=""/>
<%--                    <div id="emailHelp" class="form-text">We'll never share your ID with anyone else.</div>--%>
                </div>
                <div class="mb-3">
                    <label for="exampleInputPassword1" class="form-label">Password:</label>
                    <input type="password" class="form-control required" id="UserPassword" argumentid="UserPassword" groupid="UserLogin"/>
                </div>
            <%--    <div class="mb-3 form-check">
                    <input type="checkbox" class="form-check-input" id="exampleCheck1"/>
                    <label class="form-check-label" for="exampleCheck1">Check me out</label>
                </div>--%>
                <button type="button" class="btn btn-primary btnLogin" conf="{ActorId:'Authentication', ActionId:'AuthenticateUser', Action:'login'}">Login</button>

                <div class="alert alert-light mt-3" role="alert" style="display:none" >
                    Log Out SuccessFully!
                </div>
            </div>
        </div>
<%--    </form>--%>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="../../AsyncWidgets/Scripts/Custom-Ext.js"></script>
    <script src="../../AsyncWidgets/Scripts/WidgetBase.js"></script>
    <script src="../../JQuery/Common.js"></script>
     <script>
         $().ready(function () {



             $('.btnLogin').click(function (e)
             {
                 
                 e.preventDefault();
                 ServerCallCtx($("body")[0], null, function (res) {
                    
                     if (res.status == 'OK') {
                         
                         if (res.Response.Authenticated) {
                             $('.card').hide();
                             var arRoles = res.Response.Roles.split(',');
                             
                             if (arRoles.length) {
                                 for (var i = 0; i < arRoles.length; i++) {
                                     //if(arRoles[i])
                                     $('[displayroles*=' + arRoles[i] + ']').show();
                                 }
                             }
                             
                             AsyncWidgets.user.conf = res.Response.Conf;
                             AsyncWidgets.user.conf2 = res.Response.Name;
                             window.location = "/BuDastoorHome.aspx"

                            
                         

                             //****End****//

                         }
                     }
                     
                    
                 }, null, "AuthenticateUser", "Authentication");
                 // getForm()

                 //var params = {};

                 //ServerCall(params, function (res) {
                 
                 //    console.log(res);
                 //}, 'GetUserMenu', 'Authentication');

                 return false;
             });
           
             
             //if (!window.callGetCookie) {
             //    console.log('inside in getCookie');
             //    setTimeout(function () {

             //        //setCookie('autoLogin', 'true', 7)
             //        $("#UserName").val("amirza");
             //        $("#UserPassword").val("sasa");
             //        $('.btnLogin').click();
             //        getCookie('autoLogin');
             //    }, 500)

             //}

 


             function callGetCookie() {
                 if (!window.getCookie) {
                     setTimeout(function () {

                         //setCookie('autoLogin', 'true', 7)
                       
                         callGetCookie();
                     }, 500)
                 } else{
                     $("#UserName").val("amirza");
                     $("#UserPassword").val("sasa");
                     $('.btnLogin').click();
                 }

             }
             callGetCookie();
             //if (getCookie("autoLogin") == "true") {
             //    //setCookie('autoLogin', 'true', 7)
             //    $("#UserName").val("amirza");
             //    $("#UserPassword").val("sasa");
             //    $('.btnLogin').click();
             //}
         
         });

         function showAlert() {
             $('#logoutAlert').show();
             // Hide the alert after 4 seconds
             setTimeout(function () {
                 hideAlert();
             }, 4000);
         }

         // Function to disable Bootstrap alert
         function hideAlert() {
             $('#logoutAlert').hide();
         }

         // Example usage:
         showAlert(); // To show the alert

     </script>
    
</body>
</html>
