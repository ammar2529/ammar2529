<%@ Page Title="" Language="C#" MasterPageFile="~/BuDastoor.Master" AutoEventWireup="true" CodeBehind="BudastoorLogin2.aspx.cs" Inherits="WebProject.BudastoorLogin1" %>


 
<asp:Content ID="Content1" ContentPlaceHolderID="BuDastoorHome" runat="server">
            <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #ebeff3;
               font-family: 'OpenSans-Regular', sans-serif;
                font-weight: 400;
            
        }
        .card {
            width: 100%;
            max-width: 400px; /* Adjust this value as needed */
        }

        @font-face {
    font-family: 'OpenSans-Regular';
    src: url('../fonts/OpenSans-Regular.woff2') format('woff2');
    font-weight: 400;
    font-style: normal;
}

@font-face {
    font-family: 'OpenSans-SemiBold';
    src: url('../fonts/OpenSans-SemiBold.woff2') format('woff2');
    font-weight: 600;
    font-style: normal;
}

/*.form-floating .form-control.invalid {
    border-bottom: 2px solid #f44336 !important;
}

.form-floating label.invalid {
    color: #f44336 !important;
}*/

        /* Responsive margin adjustments */
        /*@media (max-width: 575.98px) {*/ /* Bootstrap's 'sm' breakpoint */
            /*.form-floating {
                margin-bottom: 1rem !important;*/ /* Ensure spacing on small devices */
            /*}
        }
        @media (min-width: 576px) and (max-width: 991.98px) {*/ /* Between 'sm' and 'lg' */
            /*.form-floating {
                margin-bottom: 1.5rem !important;*/ /* Slightly more spacing */
            /*}
        }*/
    </style>
        <div class="card">
        <div class="card-body">

             <h5 class="card-title text-center mb-3">Login</h5>
            
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="form-floating mb-3">
                            <input id="UserName" type="text" class="form-control required" placeholder="Enter User ID" argumentid="UserName" groupid="UserLogin"  autocomplete="off">
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
                        <button type="button" class="btn btn-primary w-100 btnLogin mt-3" style="background-color: #f08c20;outline: none;border: none;" conf="{ActorId:'Authentication', ActionId:'AuthenticateUser', Action:'login'}">Login</button>
                    </div>
                </div>
            </div>

            <div class="alert alert-light mt-3 text-center" role="alert" style="display:none">
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

    <script>
    </script>
</asp:Content>
