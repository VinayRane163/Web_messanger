<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Web_Messenger.Home" EnableEventValidation="false" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>message</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
    <style>
        .container {
            background-color: black;
            margin-top: 5px;
            max-width: 100%;
            min-height: 100%;
            margin: 0 auto;

            text-align: center;
            color: aliceblue;
           overflow-y: auto; /* Add vertical scrollbar if content overflows */
             scrollbar-width: none; /* Hide scrollbar for Firefox */
            -ms-overflow-style: none; /* Hide scrollbar for IE/Edge */

        }
        
    .user-box {
        padding: 10px;
        border-bottom: 1px solid #ccc;
    }

    .user-table {
        width: 100%;
    }

    .contact-button {
        display: block;
        width: 100%;
        padding: 10px;
        background-color: #fff;
        border: none;
        border-bottom: 1px solid #ddd;
        text-align: left;
        cursor: pointer;
        font-size: 16px;
        color:white;
        background-color:transparent;   text-align:center;

    }

    .contact-button:hover {
        background-color: #f5f5f5;
        color:black;
    }
      .container::-webkit-scrollbar
      {
               display: none; /* Hide scrollbar for Chrome, Safari, Opera */
      }
        
                
        .container2 {
            background-color:aquamarine;
            margin-top: 5px;
            min-height: 630px;
            min-width:max-content;  

        }

      .container3{
           text-align:center;
             background-color: pink;

            position:absolute;
            overflow-y: auto;
           
            margin-top: 25px;
            min-height: 559px;
            max-height:500px;
            min-width:1006px;
            overflow-y: auto;
            scrollbar-width: none; /* Hide scrollbar for Firefox */
            -ms-overflow-style: none; /* Hide scrollbar for IE/Edge */

       }
      .container3::-webkit-scrollbar {
    display: none; /* Hide scrollbar for Chrome, Safari, Opera */
}


        img {
            max-width: 40px;
        }
       .header1 {
            position: fixed;
            top: 0;
            width: 100%;
            background-color: #333; /* Dark color for header */
            text-align: center;
            z-index: 1000; /* Ensure it's above other elements */
            color: white;
            padding: 10px;
            display: flex;
            justify-content: space-between; /* Align items horizontally */
            align-items: center; /* Align items vertically */
        }
        .ningus
        {
            color: white;
            margin-left:1030px;
            border:solid 1px aliceblue;     
            
        }
        .tbox {
            min-height: 40px;
            min-width: 300px;
            border-radius: 10px;
            flex: 1;
    margin-right: 10px;

        }
        .search-button {
            flex-shrink: 0;

        }
        .search-box-container {
            display: flex;
            align-items: center;
        }
        a {
            text-decoration: none;
            color: wheat;
        }
        a:hover {
            text-decoration: none;
            color: wheat;
        }
      
        .auto-style1 {
            position: relative;
            width: 100%;
            min-height: 1px;
            -webkit-box-flex: 0;
            -ms-flex: 0 0 33.333333%;
            flex: 0 0 33.333333%;
            max-width: 33.333333%;
            left: 0px;
            top: 0px;
            height: 75px;
            padding-left: 15px;
            padding-right: 15px;
        }

          .user-table {
    width: 100%;
    border-collapse: collapse;
    color:wheat;
    cursor:default;
}

.user-table td {
    padding: 20px;
    border-bottom: 1px solid #ddd;
}
.loli {
    background-color:green;
            color: white;
            text-align:center center;
            position:fixed ;
            border: 1px rgb(255 0 0);
            width:300px;
            
        }
footer{
    position:absolute;
    position:fixed;
}
body{
    position:absolute;
}

.text-right {
    text-align: right;
}

.text-left {
    text-align: left;
}

.text-right .message-box {
    margin-right: 20px;
}

.text-left .message-box {
    margin-left: 20px;
}

.message-textbox {
    min-width: 400px;
    min-height: 20px; /* Set a minimum height */
    resize: none ; /* Allow vertical resizing */
    background-color:   #27E195;
    scrollbar-width: none; /* Hide scrollbar for Firefox */
     -ms-overflow-style: none; /* Hide scrollbar for IE/Edge */

     }
      .message-textbox::-webkit-scrollbar {
    display: none; /* Hide scrollbar for Chrome, Safari, Opera */
}

.message-box:hover{
    cursor:none;
}


    </style>
</head>




<body>
    <form id="form1" runat="server">
       <header id="header1" class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="search-box-container">
                <asp:TextBox ID="Search_Box" CssClass="tbox" runat="server" type="search" placeholder="Search..."></asp:TextBox>
                <asp:Button ID="Button3" runat="server" Text="Button" OnClick="Button3_Click" CssClass="search-button" />
            <br />
            <br />
            <div class="ningus">
                <a href="user.aspx">Account Info</a>
            </div>     

            </div>

        </header>



        <div class="container-flui" style="margin-top: 0px;"> <!-- Adjust margin-top to accommodate header height -->
            <div class="row">


                <div class="auto-style1">
             <div class="container">
                    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                        <ItemTemplate>
                            <div class="user-box">
                                <div class="text-center">
                                    <table class="user-table">
                                        <tr>
                                            <td>
                                                <asp:Button ID="Button2" runat="server" Text='<%# Eval("email") %>' OnClientClick='<%# "TextBox5(\"" + Eval("email") + "\"); return false;" %>' CssClass="contact-button" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                </div>




               <div class="col-md-8">
                    <div id="container2" class="container2" style="display: flex; flex-direction: column; height: 100%;">
                                          <!---  <header id="header2" class="navbar navbar-expand-lg navbar-dark bg-dark header2">
                                                wassup nega
            location.refresh(); // Refresh the page

                                            </header> -->
                <asp:TextBox ID="TextBox1" CssClass="loli" runat="server" onfocus="disableTextBox(this);"   ></asp:TextBox>

                       <div class="container3 " id="container3">

                             <asp:Repeater ID="rptGuides" runat="server">
                                 <ItemTemplate>
                                   <div class='<%# GetAlignment(Eval("From_user")) %>'>
<asp:TextBox ID="txtMessage" runat="server" Text='<%# Eval("message") %>' CssClass="message-textbox" TextMode="MultiLine" ReadOnly="true" Rows="1" MaxLength="500"></asp:TextBox>

                                     </div>
                                 </ItemTemplate>
                             </asp:Repeater>
                        </div>
                        <div>
                        <footer style="margin-top: 585px;">
                            <asp:Textbox ID="textbox" Class="tbox" runat="server" type="search" placeholder="type......." Height="50px" Width="590px"  ></asp:Textbox>
                             <asp:Button ID="Button1" runat="server" Text="send" OnClick="Button1_Click"/>

                        </footer>
                            </div>
                    </div>
                </div>



            </div>
        </div>
    </form>
    <script>
        function updateHeader(email) {
            var header = document.getElementById('header2');
            header.innerText = email;
            header.classList.add('pink-header');
        }

        function showSearchBox() {
            var footer = document.getElementById("footer");
            footer.style.display = "block";
            var searchBox = document.querySelector("#footer input[type='search']");
            searchBox.focus();

        }
        function TextBox5(email) {
            var textBox = document.getElementById('<%= TextBox1.ClientID %>');
    textBox.value = email;
            __doPostBack('<%= TextBox1.UniqueID %>', ''); // Trigger a postback
        }



        function disableTextBox(textBox) {
            textBox.readOnly = true;
            textBox.onfocus = null; // Remove the onfocus event after first click
        }

        function resizeTextBoxes() {
            var textboxes = document.getElementsByClassName("message-textbox");
            for (var i = 0; i < textboxes.length; i++) {
                textboxes[i].style.height = ""; // Reset height to auto to ensure correct resizing
                textboxes[i].style.height = textboxes[i].scrollHeight + "px"; // Set height to scroll height
            }
        }
        function resizeTextBoxesAndScroll() {
            var textboxes = document.getElementsByClassName("message-textbox");
            for (var i = 0; i < textboxes.length; i++) {
                textboxes[i].style.height = ""; // Reset height to auto to ensure correct resizing
                textboxes[i].style.height = textboxes[i].scrollHeight + "px"; // Set height to scroll height
            }

            // Scroll to bottom of container
            var container = document.getElementById("container3");
            container.scrollTop = container.scrollHeight;
        }
        // Call the resizeTextBoxes function when the page is loaded
        window.onload = function () {
            resizeTextBoxes();
            resizeTextBoxesAndScroll();

        };

        function refreshPage() {
            location.reload();
        }





    </script>
</body>
</html>