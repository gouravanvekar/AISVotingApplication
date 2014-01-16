<%@ Page Title="" Language="C#" MasterPageFile="~/AISMember.Master" AutoEventWireup="true" CodeBehind="Voting.aspx.cs" Inherits="VotingPresentationLayer.Voting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="VoteArea" runat="server">
    <div id="activeVoting" runat="server" visible="false">
        <center>
            <h1>
                <asp:Label ID="positionHeading" runat="server"></asp:Label></h1>
            <p>
                <asp:RadioButtonList ID="candidates" runat="server" RepeatDirection="Horizontal"
                    Style="text-align: center">
                </asp:RadioButtonList>
            </p>
            <p>
                <asp:RequiredFieldValidator ID="candidatesRequired" runat="server" ErrorMessage="Please select one candidate"
                    ControlToValidate="candidates"></asp:RequiredFieldValidator>
            </p>
            <p class="submit">
                <asp:Button ID="vote_button" runat="server" Text="Vote" class="button-styles" OnClick="vote_button_Click" /></p>
        </center>
    </div>
    <div id="inactiveVoting" runat="server" visible="false">
        <center>
            <h1>
                <br />
                <br />
                <asp:Label ID="inactiveMessage" runat="server"></asp:Label></h1>
        </center>
    </div>
</asp:Content>
