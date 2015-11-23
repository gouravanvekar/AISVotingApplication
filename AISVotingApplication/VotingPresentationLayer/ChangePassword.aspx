<%@ Page Title="" Language="C#" MasterPageFile="~/AISMember.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="VotingPresentationLayer.ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="VoteArea" runat="server">
    <center>
        <div>
            <h1>Change Password</h1>
            <br />
            <div id="changePassword" runat="server">
                <table class="table-style">
                    <tr>
                        <td>Current Password:
                        </td>
                        <td>
                            <asp:TextBox ID="CurrentPassword" runat="server" placeholder="Current Password"
                                class="input-field" TextMode="Password">
                            </asp:TextBox>
                        </td>
                        <td class="td-small">
                            <asp:RequiredFieldValidator ID="CurrentPassword_Required" runat="server" ErrorMessage="*" ControlToValidate="CurrentPassword"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>New Password:
                        </td>
                        <td>
                            <asp:TextBox ID="NewPassword" runat="server" placeholder="New Password"
                                class="input-field" TextMode="Password">
                            </asp:TextBox>
                        </td>
                        <td class="td-small">
                            <asp:RequiredFieldValidator ID="NewPassword_Required" runat="server" ErrorMessage="*"
                                ControlToValidate="NewPassword"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>Confirm Password:
                        </td>
                        <td>
                            <asp:TextBox ID="ConfirmPassword" runat="server" placeholder="Confirm Password"
                                class="input-field" TextMode="Password">
                            </asp:TextBox>
                        </td>
                        <td class="td-small">
                            <asp:RequiredFieldValidator ID="ConfirmPassword_Required" runat="server" ErrorMessage="*"
                                ControlToValidate="ConfirmPassword"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
                <p>
                    <asp:CompareValidator ID="ComparePasswords" runat="server" ErrorMessage="Passwords do not match" ControlToCompare="NewPassword" ControlToValidate="ConfirmPassword"></asp:CompareValidator>
                </p>
                <p>
                    <asp:Label ID="Error" runat="server" Style="color: Red;"></asp:Label>
                </p>
                <p>
                    <asp:Button ID="change_button" runat="server" Text="Change" class="button-styles" OnClick="change_button_Click" />
                </p>
                <br />
            </div>
        </div>
    </center>
</asp:Content>
