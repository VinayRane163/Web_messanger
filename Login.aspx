﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Web_Messenger.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    <style>
          body {
        background-image: url('https://www.shutterstock.com/shutterstock/photos/1169160307/display_1500/stock-vector-social-media-minimalist-seamless-pattern-internet-messenger-background-vector-illustration-1169160307.jpg');
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center center;
        background-attachment: fixed;
        
          }

        .login-container {
            max-width: 600px;
            margin: auto;
            margin-top: 50px;
        }

        .card {
            border: 1px solid rgba(0, 0, 0, .125);
            border-radius: .25rem;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, .15);
        }

        .card-header {
            background-color: lightblue;
            color: black;
            text-align: center;
            font-weight: bold;
        }

        .btn-login {
              background-color : lightblue;
              display: block;
              text-align: center;
              margin-top: 15px;
              color: black;
              text-decoration: none;
              padding: 10px;
              border: 1px solid black;
              border-radius: 5px;
              cursor: pointer;
              width : 100%;
        }

         .btn-login:hover{
             
                     text-decoration: none;
                     color:BLACK

         }


       


        
        .auto-style1 {
            position: relative;
            display: flex;
            -webkit-box-orient: vertical;
            -webkit-box-direction: normal;
            -ms-flex-direction: column;
            flex-direction: column;
            min-width: 0;
            word-wrap: break-word;
            background-clip: border-box;
            border-radius: .25rem;
            box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, .15);
            left: 0px;
            top: 0px;
            background-color: none;
            backdrop-filter: blur(5px);            
        }

        .hehe{
            background-color:lightblue;
        }
        .hehe:hover{
            background-color:lightblue;
        }

        
    </style>
        <script type="text/javascript">
            
            // for button to see and unsee password

            function togglePasswordVisibility() {
                var passwordTextBox = document.getElementById('<%= TxtPassword.ClientID %>');
                 var btnShowPassword = document.getElementById('btnShowPassword');

                 if (passwordTextBox.type === 'password') {
                     passwordTextBox.type = 'text';
                     btnShowPassword.innerHTML = '<img src="https://w7.pngwing.com/pngs/27/357/png-transparent-eye-eyeball-hide-interface-secret-revamp-icon.png" alt="Hide Password" style="width: 20px; height: 20px;">';
                 } else {
                     passwordTextBox.type = 'password';
                     btnShowPassword.innerHTML = '<img src="https://static.thenounproject.com/png/2540381-200.png" alt="Show Password" style="width: 20px; height: 20px;">';
                 }
             }
        </script>

</head>
<body>
    
    <form id="form1" runat="server" >
        <div class="container login-container">
            <div class="auto-style1">
                <div class="card-header">
                    User Login
                </div>
                <div class="card-body">
                   <div class="form-group">
                      <label for="TxtUsername"class="btn-light hehe">User ID (Email):</label>
                       <asp:TextBox ID="TxtUsername" runat="server" CssClass="form-control" Width="100%" BorderColor="#CCCCFF"></asp:TextBox>
                    </div>

                   <div class="form-group ">
                       <label for="TxtPassword" class="btn-light hehe">Password:</label>
                       <div class="input-group">
                           <asp:TextBox ID="TxtPassword" runat="server" CssClass="form-control" Width="85%" TextMode="Password"></asp:TextBox>
                           <div class="input-group-append">
                               <button type="button" class="btn btn-light" id="btnShowPassword" onclick="togglePasswordVisibility()">
                                   <img src="https://static.thenounproject.com/png/2540381-200.png" alt="Show Password" style="width: 20px; height: 20px;" />
                               </button>
                           </div>
                       </div>
                   </div>
                  
                    
                    
                    <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" CssClass="btn btn-login" Height="51px" />
                   
                     
                   
                 <asp:HyperLink ID="registerLink" runat="server" NavigateUrl="Registeration.aspx" CssClass="btn-login">Register</asp:HyperLink>
                    
                         
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="ForgetPassword.aspx" CssClass="btn-login">Forget Password</asp:HyperLink>
        
                </div>
            </div>
        </div>

        <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </p>

    </form>
</body>
</html>