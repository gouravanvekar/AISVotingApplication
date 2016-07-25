<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="VotingPresentationLayer._Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Welcome to AIS Elections</title>
    <!-- CSS  -->
    <%--<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/custom.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="css/brand.css" media="screen" />--%>
    <link href="css/vote.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="css/login.min.css" media="screen" />
    <link rel="icon" type="image/png" href="images/AIS.png" />
</head>
<body>
    <div class="top-content">
        <div class="inner-bg">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-sm-offset-3 form-box">
                        <div class="form-top">
                            <div class="form-top-left">
                                <img alt="logo" src="images/ais_logo.png" />
                            </div>
                            <div class="form-top-right">
                                <i class="fa fa-lock"></i>
                            </div>
                        </div>
                        <form id="form1" runat="server" class="login-form">
                            <div id="login" class="form-bottom">
                                <h3>Login</h3>
                                <hr />
                                <div class="inner-addon left-addon form-group">
                                    <i class="fa fa-user"></i>
                                    <label class="sr-only" for="form-username">Username</label>
                                    <asp:TextBox ID="txtUsername" runat="server" placeholder="Username" class="form-username form-control"></asp:TextBox>
                                </div>

                                <div class="inner-addon left-addon form-group">
                                    <i class="fa fa-lock"></i>
                                    <label class="sr-only" for="form-password">Password</label>
                                    <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" class="form-password form-control" TextMode="Password"></asp:TextBox>
                                </div>
                                <asp:Label ID="lblMessage" runat="server"></asp:Label>
                                <asp:Button ID="login_button" runat="server" Text="Login" class="btn-system btn-block" OnClick="login_button_Click" />

                                <div class="row-centered">
                                    <a class='form-switch' href='#request'>Request Access</a>
                                </div>

                            </div>
                            <div id="request" class="form-bottom">
                                <h3>Request Access</h3>
                                <hr />
                                <div class="inner-addon left-addon form-group">
                                    <i class="fa fa-user"></i>
                                    <label class="sr-only" for="form-username">Firstname</label>
                                    <asp:TextBox ID="txtFirstname" runat="server" placeholder="Firstname" class="form-username form-control"></asp:TextBox>
                                </div>
                                <div class="inner-addon left-addon form-group">
                                    <i class="fa fa-user"></i>
                                    <label class="sr-only" for="form-username">Lastname</label>
                                    <asp:TextBox ID="txtLastname" runat="server" placeholder="Lastname" class="form-username form-control"></asp:TextBox>
                                </div>
                                <div class="inner-addon left-addon form-group">
                                    <i class="fa fa-envelope"></i>
                                    <label class="sr-only" for="form-username">Email</label>
                                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" class="form-username form-control"></asp:TextBox>
                                </div>

                                <div class="inner-addon left-addon form-group">
                                    <i class="fa fa-lock"></i>
                                    <label class="sr-only" for="form-password">Password</label>
                                    <asp:TextBox ID="txtRequestPassword" runat="server" placeholder="Password" class="form-password form-control" TextMode="Password"></asp:TextBox>
                                </div>
                                <asp:Label ID="Label1" runat="server"></asp:Label>
                                <asp:Button ID="requestAccess" runat="server" Text="Request" class="btn-system btn-block" OnClick="requestAccess_Click" />
                                <div class="row-centered">
                                    <a class='form-switch' href='#login'>Login</a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%--<script type="text/javascript" src="Scripts/jquery-2.1.4.min.js"></script>--%>
    <script src="Scripts/vote.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var $loginSwitch = $('#login, #request').hide();
            $('#login').show();
            $('.form-switch').click(function () {
                var href = $(this).attr('href');
                $loginSwitch.hide();
                $(href).show();
            });

            $('.login-form input[type="text"], #txtPassword, #txtRequestPassword').on('focus', function () {
                $(this).removeClass('input-error');
            });

            $('#save_feedback').click(function (e) {
                if ($('#txtUsername').val() == "") {
                    e.preventDefault();
                    $('#txtUsername').addClass('input-error');
                }
                else if (!validateEmail($('#txtUsername').val())) {
                    if ($('#txtUsername').val() !== "admin") {
                        e.preventDefault();
                        $('#txtUsername').addClass('input-error');
                    }
                }

                if ($('#txtPassword').val() == "") {
                    e.preventDefault();
                    $('#txtPassword').addClass('input-error');
                }
            });

            $('#requestAccess').click(function (e) {
                if ($('#txtFirstname').val() == "") {
                    e.preventDefault();
                    $('#txtFirstname').addClass('input-error');
                }
                if ($('#txtLastname').val() == "") {
                    e.preventDefault();
                    $('#txtLastname').addClass('input-error');
                }
                if ($('#txtEmail').val() == "") {
                    e.preventDefault();
                    $('#txtEmail').addClass('input-error');
                }
                else if (!validateEmail($('#txtEmail').val())) {
                    e.preventDefault();
                    $('#txtEmail').addClass('input-error');
                }

                if ($('#txtRequestPassword').val() == "") {
                    e.preventDefault();
                    $('#txtRequestPassword').addClass('input-error');
                }
            });

            function validateEmail(email) {
                var regex = /^\s*[\w\-\+_]+(\.[\w\-\+_]+)*\@[\w\-\+_]+\.[\w\-\+_]+(\.[\w\-\+_]+)*\s*$/;
                if (regex.test(email)) {
                    if (email.indexOf('@ufl.edu', email.length - '@ufl.edu'.length) !== -1) {
                        return true;
                    } else {
                        return false;
                    }
                } else {
                    return false;
                }
            }
        });
    </script>
</body>
</html>
