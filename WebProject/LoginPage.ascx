<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.ascx.cs" Inherits="WebProject.LoginPage" %>


<table cellspacing="0" cellpadding="0" width="100%" border="0">
    <tbody>
        <tr>
   
            <td>
                <img height="20" width="1" alt="" src="App_Themes/eForms_Theme/Images/spacer.gif" />
            </td>
            <td class="text-align-positive" style="color: #ffffff; padding: 5px 10px 5px 10px;">
                <b><a style="text-decoration: none; color: #ffffff;" showwidget="frmHome" href="javascript:void(0);">
                    Home</a></b>
            </td>
            <td width="100%">
            </td>
          <%--  <td nowrap="nowrap">
                <div class="tmp_rtxtb text-align-positive" style="color: #ffffff;">
                    User ID:</div>
            </td>
            <td>
                <img alt="" src="App_Themes/eForms_Theme/Images/spacer.gif" />
            </td>
            <td>
                <div style="width: 105px; text-align: left">
                    <input type="text" style="width: 90px;" class="text required" tabindex="1" blurvalidate="false"
                        requirederr=' *' argumentid="UserName" groupid="UserLogin" value="" />
                </div>
            </td>
            <td>
                <img height="1" alt="" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1"/>
            </td>
            <td>
                <div class="tmp_rtxtb text-align-positive" style="color: #ffffff;">
                    Password:</div>
            </td>
            <td>
                <img alt="" src="App_Themes/eForms_Theme/Images/spacer.gif"/>
            </td>
            <td>
                <div style="width: 110px; text-align: left">
                    <input type="password" value="" style="width: 90px" class="text required" tabindex="2" argumentid="UserPassword"
                        groupid="UserLogin" blurvalidate="false" requirederr=' *' />
                </div>
            </td>
            <td>
                <img height="1" alt="" src="App_Themes/eForms_Theme/Images/spacer.gif" width="1" />
            </td>
            <td style="padding-right: 10px; padding-top:2px">
                <asp:Button ID="LoginButton" OnClientClick="return false;" Style="cursor: pointer;
                    background-color: #73ABCB" TabIndex="3" conf="{ActorId:'Authentication',ActionId:'AuthenticateUser',Action:'login'}"
                    CssClass="LoginButton ActionButton" runat="server" Width="38px" Height="23px" />
            </td>--%>
        </tr>
    </tbody>
</table>



<%--<style>
    .login-table {
        width: 100%;
        text-align: center;
    }
    .login-cell {
        padding: 5px 10px;
    }
    .input-container {
        text-align: right;
    }
</style>

<div width:"50px">--%>
<%--<table class="login-table" cellspacing="0" cellpadding="0" border="0">
    <tbody>
        
        <tr>
            <td class="login-cell">
                <img height="20" width="1" alt="" src="App_Themes/eForms_Theme/Images/spacer.gif" />
            </td>
            <td class="login-cell">
                <b><a class="nav-link" href="javascript:void(0);">
                    Home</a></b>
            </td>
            <td class="login-cell">
            </td>
        </tr>
        <tr>
            <td class="login-cell" colspan="3">
                <div class="input-container">
                    <label for="UserID" class="input-label">User ID:</label>
                    <input type="text" id="UserID" class="text required" tabindex="1" required placeholder="Enter your user ID" />
                </div>
            </td>
        </tr>
        <tr>
            <td class="login-cell" colspan="3">
                <div class="input-container">
                    <label for="Password" class="input-label">Password:</label>
                    <input type="password" id="Password" class="text required" tabindex="2" required placeholder="Enter your password" />
                </div>
            </td>
        </tr>
        <tr>
            <td class="login-cell" colspan="3" style="padding-right: 10px; padding-top:2px">
                <button id="LoginButton" type="submit" class="login-button">
                    Login
                </button>
            </td>
        </tr>
    </tbody>
</table>
</div>--%>



<style>




.box-form {
  margin: 0 auto;
/*  width: 80%;*/
  background: #FFFFFF;
  border-radius: 10px;
  overflow: hidden;
  display: flex;
  flex: 1 1 100%;
  align-items: stretch;
  justify-content: space-between;
/*  box-shadow: 0 0 20px 6px #090b6f85;*/
}
@media (max-width: 980px) {
  .box-form {
    flex-flow: wrap;
    text-align: center;
    align-content: center;
    align-items: center;
  }
}
.box-form div {
  height: auto;
}
.box-form .left {
  color: #FFFFFF;
  background-size: cover;
  background-repeat: no-repeat;
  background-image: 
  
}
.box-form .left .overlay {
  padding: 30px;
  width: 90%;
  height: 100%;
  /*overflow: hidden;*/
  box-sizing: border-box;
  border: solid black
}
.box-form .left .overlay h1 {
  font-size: 10vmax;
  line-height: 1;
  font-weight: 900;
  margin-top: 40px;
  margin-bottom: 20px;
}
.box-form .left .overlay span p {
  margin-top: 30px;
  font-weight: 900;
}
.box-form .left .overlay span a {
  background: #3b5998;
  color: #FFFFFF;
  margin-top: 10px;
  padding: 14px 50px;
  border-radius: 100px;
  display: inline-block;
  box-shadow: 0 3px 6px 1px #042d4657;
}
.box-form .left .overlay span a:last-child {
  background: #1dcaff;
  margin-left: 30px;
}
.box-form .right {
  padding: 40px;
/*  overflow: hidden;
*/}
@media (max-width: 980px) {
  .box-form .right {
    width: 100%;
  }
}
.box-form .right h5 {
  font-size: 6vmax;
  line-height: 0;
}
.box-form .right p {
  font-size: 14px;
  color: #B0B3B9;
}
.box-form .right .inputs {
  overflow: hidden;
}
.box-form .right input {
  width: 100%;
  padding: 10px;
  margin-top: 25px;
  font-size: 16px;
  border: none;
  outline: none;
  border-bottom: 2px solid #B0B3B9;
}
.box-form .right .remember-me--forget-password {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.box-form .right .remember-me--forget-password input {
  margin: 0;
  margin-right: 7px;
  width: auto;
}
.box-form .right button {
  float: right;
  color: #fff;
  font-size: 16px;
  padding: 12px 35px;
  border-radius: 50px;
  display: inline-block;
  border: 0;
  outline: 0;
  box-shadow: 0px 4px 20px 0px #49c628a6;
  background-image: linear-gradient(135deg, #70F570 10%, #49C628 100%);
}

label {
  display: block;
  position: relative;
  margin-left: 30px;
}

label::before {
  content: ' \f00c';
  position: absolute;
  font-family: FontAwesome;
  background: transparent;
  border: 3px solid #70F570;
  border-radius: 4px;
  color: transparent;
  left: -30px;
  transition: all 0.2s linear;
}

label:hover::before {
  font-family: FontAwesome;
  content: ' \f00c';
  color: #fff;
  cursor: pointer;
  background: #70F570;
}

label:hover::before .text-checkbox {
  background: #70F570;
}

label span.text-checkbox {
  display: inline-block;
  height: auto;
  position: relative;
  cursor: pointer;
  transition: all 0.2s linear;
}

label input[type="checkbox"] {
  display: none;
}
</style>

<div class="box-form">
	<div class="left">
		<div class="overlay">
	
		<table cellspacing="0" cellpadding="0" width="100%" border="0" style="padding-left: 20px;
        padding-right: 20px; padding-bottom: 10px; padding-top: 5px;">
        <tbody>

            <tr>
                <td width="15%" style="padding-top:15px;padding-bottom:10px;padding-right:50px" valign="top">
                <img height="35" width="96" alt="" src="App_Themes/eForms_Theme/Images/Logo_eForms.png" border="0"/>
                    <span style="color: White; font-weight: bold; padding-left:10px" class="HeaderTitle">
                                                   Welcome to eForms - Paperless Office
                                                </span>
                    <img height="10px" width="10px" alt="" src="App_Themes/eForms_Theme/Images/spacer.gif"/>
                    <br />
                    <br />


                <b>eForms</b> provides ready to use web based modules,
                
                <ul>
                <li>Business Process Automation Solution</li>
                 <li>Employee & Payroll Management Solution</li>
                 <li>Employee Attendance Management</li>
                 <li>iDashboards - Interactive Reporting</li>
                 <li>etc...</li>
                </ul>
                <b>Please login to use the system...</b>
                 <br /> <br />

                <b>Visionary</b> – Our enthusiasm for technological achievement enables us to imagine far-reaching possibilities and bring them to fruition – raising the bar for excellence.
                <br /> <br />
                <b>Valuable</b> – Our proven ability to deliver reliable, high quality products and services makes us an important asset to our customers, communities and shareholders alike.

                             <img height="120" alt="" src="App_Themes/eForms_Theme/Images/Home_1.jpg" width="425" style="padding-left:20px"/>
                  <br />
                 In the fast-moving and demanding world in which we live and work, once in a rare while a company comes along that actually delivers more than it promises, exceeding the customers needs, beyond their expectations and imagination – A company that is dynamic, innovative and yet completely dependable. A company that raises the bar...
                             <br />
                   <br />
We depend on our technically advanced next generation infrastructure to deliver best in class customer-aware and lifestyle-enhancing products and services that anticipate customer's needs. We understand that customers are on-the-go, busy and mobile and expect frictionless and seamless services. By deeply understanding the needs of customers we deliver the right products and services at the right time – helping customers simplify their lives, enabling them to transact their businesses and lives easily and ensuring a WOW user-experience from start to finish.

       <br />


          <%--      </td>
                <td width="50%" style="padding-top:10px;padding-bottom:10px" valign="top">
                 <img height="120" alt="" src="App_Themes/eForms_Theme/Images/Home_1.jpg" width="425" style="padding-left:20px"/>
                  <br />
                 In the fast-moving and demanding world in which we live and work, once in a rare while a company comes along that actually delivers more than it promises, exceeding the customers needs, beyond their expectations and imagination – A company that is dynamic, innovative and yet completely dependable. A company that raises the bar...
                             <br />
                   <br />
We depend on our technically advanced next generation infrastructure to deliver best in class customer-aware and lifestyle-enhancing products and services that anticipate customer's needs. We understand that customers are on-the-go, busy and mobile and expect frictionless and seamless services. By deeply understanding the needs of customers we deliver the right products and services at the right time – helping customers simplify their lives, enabling them to transact their businesses and lives easily and ensuring a WOW user-experience from start to finish.

       <br />
                </td>--%>
                    </td>
            </tr>
        </tbody>
    </table>

		</div>
	</div>
	
	
		<div class="right">
		<h5>Login</h5>
		<p>Don't have an account? <a href="#">Creat Your Account</a> it takes less than a minute</p>
		<div class="inputs">
			<input type="text" placeholder="user name" />
			<br>
			<input type="password" placeholder="password" />
		</div>
			
			<br><br>
			
		<div class="remember-me--forget-password">
				<!-- Angular -->
	<label>
		<input type="checkbox" name="item" checked/>
		<span class="text-checkbox">Remember me</span>
	</label>
			<p>forget password?</p>
		</div>
			
			<br>
			<button>Login</button>
	</div>
	
</div>


