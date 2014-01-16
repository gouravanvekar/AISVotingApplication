<%@ Page Title="" Language="C#" MasterPageFile="~/AISMember.Master" AutoEventWireup="true" CodeBehind="VotingHome.aspx.cs" Inherits="VotingPresentationLayer.VotingHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="VoteArea" runat="server">
    <center>
        <h1>
            <asp:Label ID="positionHeading" runat="server" Text="Welcome to AIS Elections and Awards Ceremony"></asp:Label></h1>
        <p>
            <a href="http://www.ufais.com/">
                <img src="images/ufais_labs-logo.png" alt="AISLogo" width="220px" height="250px" /></a></p>
       <h3>
                    AIS Labs presents you with the brand new platform to display one’s leadership
                    skills.
                </h3>
    </center>
</asp:Content>
