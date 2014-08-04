<%@ Page Title="" Language="C#" MasterPageFile="~/AISMember.Master" AutoEventWireup="true"
    CodeBehind="Elected.aspx.cs" Inherits="VotingPresentationLayer.Elected" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="VoteArea" runat="server">
    <center>
        <div>
            <h1>
                Candidates elected by me</h1>
            <div>
                <asp:GridView ID="electedCandidates" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    EnableModelValidation="True" ForeColor="#333333" GridLines="None" Style="border: 1px solid black;"
                    Width="400px">
                    <AlternatingRowStyle BackColor="White" HorizontalAlign="Left" />
                    <Columns>
                        <asp:BoundField DataField="Position" HeaderText="Position" ReadOnly="True" SortExpression="Position" />
                        <asp:BoundField DataField="Elected Candidate" HeaderText="Elected Candidate" ReadOnly="True"
                            SortExpression="Elected Candidate" />
                    </Columns>
                    <EditRowStyle BackColor="#507CD1" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#000" ForeColor="White" Height="50px" HorizontalAlign="Left" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Left" />
                    <RowStyle BackColor="#EFF3FB" HorizontalAlign="Left" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <EmptyDataTemplate>
                        <h3 style="text-align: center">
                            <asp:Label ID="votingHistoryMessage" runat="server" Text="Voting information is not available yet"></asp:Label></h3>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>
        <br />
    </center>
</asp:Content>
