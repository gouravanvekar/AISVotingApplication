<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/AISVoter.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="VotingPresentationLayer.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="VoteArea" runat="server">
    <div class="page-content">
        <div class="row">
            <div class="col-md-5">
                <h4 class="classic-title"><span>Change Password</span></h4>
                <div class="form-group">
                    <div class="controls">
                        <div class="row">
                            <div class="col-xs-11">
                                <asp:TextBox ID="CurrentPassword" runat="server" placeholder="Current Password"
                                    class="email" TextMode="Password">
                                </asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="controls">
                        <div class="row">
                            <div class="col-xs-11">
                                <asp:TextBox ID="NewPassword" runat="server" placeholder="New Password"
                                    class="email" TextMode="Password">
                                </asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="controls">
                        <div class="row">
                            <div class="col-xs-11">
                                <asp:Label ID="lblMessage" runat="server"></asp:Label>
                            </div>
                            <div class="col-xs-1">
                            </div>
                        </div>
                    </div>
                </div>
                <asp:Button ID="change_button" runat="server" Text="Change" class="btn-system btn-large" OnClick="change_button_Click" />
            </div>
            <div class="col-md-7 instructions">
                <h4 class="classic-title"><span>Information</span></h4>
                <ul>
                    <li>Re-login immediately after a successful password change</li>
                    <li>The system may logout your current session due to inactivity</li>
                    <li>Please contact your administrator if you face any login issues</li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
