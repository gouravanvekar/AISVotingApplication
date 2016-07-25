<%@ Page Title="Vote" Language="C#" MasterPageFile="~/AISVoter.Master" AutoEventWireup="true" CodeBehind="Vote.aspx.cs" Inherits="VotingPresentationLayer.Vote" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="VoteArea" runat="server">
    <div class="page-content">
        <h4 class="classic-title"><span>Candidates</span></h4>
        <asp:UpdatePanel ID="upCandidates" runat="server">
            <ContentTemplate>
                 <div id="divAlert" runat="server" class="alert alert-info animate-me-inverse" role="alert">
                    <h5 class="primary">
                        <asp:Label ID="lblMainMessage" runat="server" Text="Voting is now active"></asp:Label>
                    </h5>
                </div>
                <div class="row">
                    <asp:Repeater ID="rptCandidates" runat="server">
                        <ItemTemplate>
                            <div class="col-md-3 col-sm-6 col-xs-12 animate-me">
                                <div class="team-member">
                                    <div class="member-photo">
                                        <asp:Image ID="imgProfile" CssClass="member-profile" runat="server" ImageUrl='<%# (string)Eval("ProfileImage") == "" ? "images/unknown.jpg" : "images/candidates/" + Eval("ProfileImage") %>' />
                                        <div class="member-name"><%# Eval("Name") %></div>
                                    </div>
                                    <div class="hr1" style="margin-bottom: 40px;"></div>
                                    <div>
                                        <asp:Button ID="btnVote" runat="server" Text="Vote" OnClick="vote_button_Click" CommandArgument='<%# Eval("UFID") + ";" + Eval("Name") %>' CssClass="btn-system" />
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <div class="container" id="divNoCandidates" runat="server">
                        <div class="call-action call-action-boxed call-action-style1 clearfix">
                            <h2 class="primary">No candidates are running for this position</h2>
                            <p>Please wait for instructions</p>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
