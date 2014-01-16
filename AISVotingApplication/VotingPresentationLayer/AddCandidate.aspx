﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AISAdmin.Master" AutoEventWireup="true"
    CodeBehind="AddCandidate.aspx.cs" Inherits="VotingPresentationLayer.AddCandidate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminArea" runat="server">
    <center>
        <div>
            <h1>
                Add New Candidate</h1>
            <table class="table-style">
                <tr>
                    <td>
                        UFID:
                    </td>
                    <td>
                        <asp:TextBox ID="candidateUFID" runat="server" placeholder="UFID" class="input-field"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UFID_Required" runat="server" ErrorMessage="*" ControlToValidate="candidateUFID"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Position:
                    </td>
                    <td>
                        <asp:DropDownList ID="positions" runat="server" class="input-field">
                            <asp:ListItem>President</asp:ListItem>
                            <asp:ListItem>Corporate Relations</asp:ListItem>
                            <asp:ListItem>Leadership Development</asp:ListItem>
                            <asp:ListItem>Treasury</asp:ListItem>
                            <asp:ListItem>Internal Networking</asp:ListItem>
                            <asp:ListItem>Media Distribution</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="positions_Required" runat="server" ErrorMessage="*"
                            ControlToValidate="positions"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Term:
                    </td>
                    <td>
                        <asp:DropDownList ID="term" runat="server" class="input-field" Style="width: 100px;">
                            <asp:ListItem Selected="True">Fall</asp:ListItem>
                            <asp:ListItem>Spring</asp:ListItem>
                        </asp:DropDownList>
                        <asp:DropDownList ID="year" runat="server" class="input-field" Style="width: 100px;">
                            <asp:ListItem Selected="True">2013</asp:ListItem>
                            <asp:ListItem>2014</asp:ListItem>
                            <asp:ListItem>2015</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        Profile Picture:
                    </td>
                    <td>
                        <asp:FileUpload ID="profileUpload" runat="server" />
                    </td>
                </tr>
            </table>
            <p>
                <asp:Label ID="Error" runat="server" Style="color: Red;"></asp:Label></p>
            <p>
                <asp:Button ID="add_member_button" runat="server" Text="Add" OnClick="add_button_Click"
                    class="button-styles" /></p>
        </div>
    </center>
</asp:Content>
