<%@ Page Title="" Language="C#" MasterPageFile="~/AISAdmin.Master" AutoEventWireup="true"
    CodeBehind="Dashboard.aspx.cs" Inherits="VotingPresentationLayer.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminArea" runat="server">
    <center>
        <div style="width: 80%; height: 420px;">
            <h1>
                Control Panel</h1>
            <div class="left-div-style">
                <a href="AddMember.aspx">
                    <img src="images/Members.png" alt="Members" class="icon-style" />
                </a>
                <h3>
                    Add Members</h3>
                <br />
                <a href="BreakUpAnalysis.aspx">
                    <img src="images/BreakUpAnalysis.png" alt="Break Up Analysis" class="icon-style" />
                </a>
                <h3>
                    Break Up Analysis</h3>
            </div>
            <div class="left-div-style">
                <a href="FindMembers.aspx">
                    <img src="images/FindMember.png" alt="FindMember" class="icon-style" />
                </a>
                <h3>
                    Find Members</h3>
                <br />
                <a href="VotingResults.aspx">
                    <img src="images/Results.png" alt="Results" class="icon-style" />
                </a>
                <h3>
                    Results</h3>
            </div>
            <div class="left-div-style">
                <a href="AddCandidate.aspx">
                    <img src="images/Candidate.png" alt="Candidate" class="icon-style" />
                </a>
                <h3>
                    Add Candidates</h3>
                <br />
                <a href="VotingTrends.aspx">
                    <img src="images/VotingTrends.png" alt="VotingTrends" class="icon-style" />
                </a>
                <h3>
                    Voting Trends</h3>
            </div>
            <div class="left-div-style">
                <a href="ActivatePoll.aspx">
                    <img src="images/Activate.png" alt="Activate Polls" class="icon-style" />
                </a>
                <h3>
                    Activate Polls</h3>
                <br />
                <a href="SetAdminPassword.aspx">
                    <img src="images/SetPassword.png" alt="Set Password" class="icon-style" />
                </a>
                <h3>
                    Set Admin Password</h3>
            </div>
        </div>
    </center>
</asp:Content>
