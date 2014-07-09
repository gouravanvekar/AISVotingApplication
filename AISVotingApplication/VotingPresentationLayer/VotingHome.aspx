<%@ Page Title="" Language="C#" MasterPageFile="~/AISMember.Master" AutoEventWireup="true"
    CodeBehind="VotingHome.aspx.cs" Inherits="VotingPresentationLayer.VotingHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="VoteArea" runat="server">
    <center>
        <h1>
            <asp:Label ID="positionHeading" runat="server" Text="Welcome to AIS Elections and Awards Ceremony"></asp:Label></h1>
        <p>
            <a href="http://www.ufais.com/">
                <img src="images/ufais_labs-logo.gif" alt="AISLogo" class="labs-logo" /></a></p>
        <h3>
            AIS Labs presents you with a enhanced version of our in-house product, the "Real-Time
            Voting App"
        </h3>
    </center>
</asp:Content>
