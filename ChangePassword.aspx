<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="Web_Messenger.ChangePassword" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">
  <title>Change Password</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
  <style>
     body {
    background: linear-gradient(225deg, 
        /* Color stops */
        #E9D701 0%,       /* 0% - red */
        #3DE901 25%,   /* 25% - yellow */
        #01E9D4 50%,    /* 50% - green */
        #0D74F8 75%,     /* 75% - blue */
        #1F00FF 100%   /* 100% - purple */
    );
    background-repeat: no-repeat;
 background-size: cover;
 background-position: center center;
 background-attachment: fixed;
}


      .login-container {
                     max-width: 600px;
          margin: auto;
          margin-top: 50px;
          background-color:transparent;
          
      }

      .card {
          border: 1px solid black;
          border-radius: .25rem;
          box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, .15);
          background-color:transparent;
          
      }

      .card-header {
          background-color:transparent;
          color: black;
          text-align: center;
          font-weight: bold;
          border: 1px solid black;
border-radius: 5px;
      }

      .btn-login {
          background-color:transparent;
          color: black;
          width: 100%;
          margin-top: 20px;
          border: 1px solid black;
border-radius: 5px;
      }
      .btn-login:hover{
                      transform: scale(1.02);

      }
     

      .hehe{
          
          background-color:transparent;
        display: block;
        text-align: center;
        margin-top: 15px;
        color: black;
        text-decoration: none;
        width:58px;
        margin-top:30px;     
          padding: 10px;
          border: 1px solid black;
          border-radius: 5px;
          cursor: pointer;
          
      }
     
      .hehe:hover{
         
            transform: scale(1.02);
            

      }
      .a{
          text-decoration:none;
          color:black;
      }
      .a:hover{
          text-decoration:none;
            color:black;
      }
      .form-control:hover{
                      transform: scale(1.02);

      }
      
  </style>
      <script type="text/javascript">
          function showFlashMessage(message) {
              var flashMessage = document.getElementById('flashMessage');
              flashMessage.innerHTML = message;
              flashMessage.style.display = 'block';
              setTimeout(function () {
                  flashMessage.style.display = 'none';
              }, 2000);
          }

          function togglePasswordVisibility() {
              var passwordTextBox = document.getElementById('<%= txt_Password.ClientID%>');
                var btnShowPassword = document.getElementById('btnShowPassword');

                if (passwordTextBox.type === 'password') {
                    passwordTextBox.type = 'text';
                    btnShowPassword.innerHTML = '<img src="https://w7.pngwing.com/pngs/27/357/png-transparent-eye-eyeball-hide-interface-secret-revamp-icon.png" alt="Hide Password" style="width: 20px; height: 20px;">';
                } else {
                    passwordTextBox.type = 'password';
                    btnShowPassword.innerHTML = '<img src="https://static.thenounproject.com/png/2540381-200.png" alt="Show Password" style="width: 20px; height: 20px;">';
                }
          }

          function toggleConfirmPasswordVisibility() {
              var passwordTextBox = document.getElementById('<%= txt_Confirmpassword.ClientID%>');
                var btnShowPassword = document.getElementById('btnShowConfirmPassword');

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
<body >
       <form id="form1" runat="server">
        <div class="container login-container">
            <div class="card">
                <div class="card-header">
                  Change Password
                </div>
                <div class="card-body">
                   <div class="form-group">
                      &nbsp; Change
                       <label for="txt_Password">
                       Password:</label>
                       <div class="input-group">
                           <asp:TextBox ID="txt_Password" runat="server" CssClass="form-control" Width="85%" TextMode="Password"></asp:TextBox>
                           <div class="input-group-append">
                               <button type="button" class="btn btn-light" id="btnShowPassword" onclick="togglePasswordVisibility()">
                                   <img src="https://static.thenounproject.com/png/2540381-200.png" alt="Show Password" style="width: 20px; height: 20px;" />
                               </button>
                           </div>
                       </div>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_Password" ErrorMessage="Enter Password!!" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>

        <div class="form-group">
            <label for="txt_Confirmpassword">Re-enter Password:</label>
             <div class="input-group">
            <asp:TextBox ID="txt_Confirmpassword" runat="server"  CssClass="form-control" Width="85%" TextMode="Password"></asp:TextBox>
                            <div class="input-group-append">
                                <button type="button" class="btn btn-light" id="btnShowConfirmPassword" onclick="toggleConfirmPasswordVisibility()">
                                    <img src="https://static.thenounproject.com/png/2540381-200.png" alt="Show Password" style="width: 20px; height: 20px;" />
                                </button>
                            </div>
                        </div>
            
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Re-enter password" CssClass="text-danger" ControlToValidate="txt_Confirmpassword"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password Doesn't Match !" ControlToValidate="txt_Confirmpassword" ControlToCompare="txt_Password" CssClass="text-danger"></asp:CompareValidator>
        </div>




                    <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Submit" CssClass="btn btn-login " Height="51px" />
             
                </div>
               <center> <div class="hehe"> 
                    <asp:HyperLink  ID="HyperLink1" CssClass="a" runat="server" NavigateUrl="user.aspx" >Back</asp:HyperLink>     
                </div>
                   </center>

            </div>
            </div>
       

  


    </form>
</body>
</html>

