<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="VotingPresentationLayer._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Welcome to AIS Elections</title>
    <link rel="stylesheet" href="css/style.css" />
    <link rel="icon" type="image/png" href="images/AIS.png" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
        <div class="login">
            <h1>
                Sign in to Vote</h1>
            <p>
                <a href="http://www.ufais.com/">
                    <img src="images/AISLogo.png" alt="AISLogo" width="300px" height="60px" /></a></p>
            <p>
                <asp:TextBox ID="username" runat="server" placeholder="UFID" Width="265px" class="login-text"></asp:TextBox>
                <asp:RequiredFieldValidator ID="UFID_Required" runat="server" ErrorMessage="*" ControlToValidate="username"></asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:TextBox ID="password" runat="server" placeholder="Password" Width="265px" class="login-text"
                    TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="Pwd_Required" runat="server" ErrorMessage="*" ControlToValidate="password"></asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:Label ID="Error" runat="server" Style="color: Red;"></asp:Label></p>
            <p>
                <asp:Button ID="login_button" runat="server" Text="Sign in" class="button-styles"
                    OnClick="login_button_Click" /></p>
        </div>
    </div>
    </form>
</body>
</html>
