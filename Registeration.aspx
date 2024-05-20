<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registeration.aspx.cs" Inherits="Web_Messenger.Registeration" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    <style>
        /* Container */
.container {
    max-width: 800px;
    max-height:800px;
    margin: auto;
    border-radius: 8px;
    background-color: #f6f6f6;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}


/* Form Title */
.form-title {
    text-align: center;
    font-size: 24px;
    margin-bottom: 20px;
}

/* Form Group */
.form-group {
    margin-bottom: 20px;
}

/* Labels */
label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
}

/* Textboxes */
input[type="text"],
input[type="password"] {
    width: calc(100% - 40px);
    border-radius: 4px;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

/* Buttons */
.btn {
    display: inline-block;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.btn-success {
    background-color: #4CAF50;
    color: black;
    border: 1px solid rgb(0,0,0,1);
}

.btn-success:hover {
    background-color: #45a049;
}

.input-group-append{
    padding-inline:0px;
    border:1px solid rgb(0,0,0,1);
    border-radius:3px;
}


/* Hyperlink */
.btn-outline-secondary {
    background-color: transparent;
    border: 1px solid #888;
    color: #888;
    text-decoration: none;
    display: inline-block;
    border-radius: 4px;
}

.btn-outline-secondary:hover {
    background-color: #ddd;
    border-color: #555;
    color: #555;
}


.formcontrol{
    min-height:36px;
}


    </style>
        <script type="text/javascript">
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

           
        </script>
</head>
<body>
    <form id="form1" runat="server" class="container registration-container">
        <h1 class="form-title" style="background-color: lightblue; color: black;">Registration Form</h1>

        <div class="form-group">
            <label for="txt_Name">Name:</label>
            <asp:TextBox ID="txt_Name" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_Name" ErrorMessage="Name Required !!" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
            <label for="txt_Email">Email:</label>
            <asp:TextBox ID="txt_Email" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txt_Email" ErrorMessage="Enter Email Address!!" CssClass="text-danger"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_Email" ErrorMessage="Please enter a valid email address!" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="text-danger"></asp:RegularExpressionValidator>
        </div>

        <div class="form-group">
            <label for="txt_Password">Password:</label>
                        <div class="input-group">
                            <asp:TextBox ID="txt_Password" runat="server" CssClass="formcontrol" Width="90%"  TextMode="Password" Height="34px" ></asp:TextBox>
                            <div class="input-group-append">
                                <button type="button" class="btn btn-light" id="btnShowPassword" onclick="togglePasswordVisibility()">
                                    <img src="https://static.thenounproject.com/png/2540381-200.png" alt="Show Password" style="width: 20px; height: 20px; " />
                                </button>
                            </div>
                        </div>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_Password" ErrorMessage="Enter Password!!" CssClass="text-danger"></asp:RequiredFieldValidator>
        </div>


        <div class="form-group">
            <label for="txt_mobile">Mobile No.:</label>
            <asp:TextBox ID="txt_mobile" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_mobile" ErrorMessage="Please Enter your Mobile Number" CssClass="text-danger"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txt_mobile" ErrorMessage="Please enter a valid mobile number!" ValidationExpression="^[6-9]\d{9}$" CssClass="text-danger"></asp:RegularExpressionValidator>

        </div>
        <div class="form-group text-center">
            <asp:Button ID="btnRegister" runat="server" Text="Register" OnClick="btnRegister_Click" CssClass="btn btn-success" style="background-color: lightblue; color: white;" />
                <br />
            <br />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Login.aspx" CssClass="btn btn-outline-secondary btn-sm" Text="Login" style="background-color: forestgreen; color: black;" Height="36px" Width="88px"></asp:HyperLink>

        </div>

    </form>
</body>
</html>
