<%@ Page Title="" Language="C#" MasterPageFile="~/AISAdmin.Master" AutoEventWireup="true"
    CodeBehind="VotingResults.aspx.cs" Inherits="VotingPresentationLayer.VotingResults" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminArea" runat="server">
    <center>
        <div>
            <h1>
                Voting Results</h1>
            <div>
                <asp:GridView ID="votingStatistics" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    EnableModelValidation="True" ForeColor="#333333" GridLines="None" Style="border: 1px solid black;"
                    Width="500px">
                    <AlternatingRowStyle BackColor="White" HorizontalAlign="Left" />
                    <Columns>
                        <asp:BoundField DataField="Position" HeaderText="Position" ReadOnly="True" 
                            SortExpression="Position" ItemStyle-Width="200px"/>
                        <asp:BoundField DataField="Winner" HeaderText="Winning Candidate" ReadOnly="True"
                            SortExpression="Winner" />
                        <asp:BoundField DataField="Votes" HeaderText="Votes Received" ReadOnly="True"
                            SortExpression="Votes" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center"/>
                    </Columns>
                    <EditRowStyle BackColor="#507CD1" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#000" ForeColor="White" Height="50px"/>
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Left" />
                    <RowStyle BackColor="#EFF3FB" HorizontalAlign="Left" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <EmptyDataTemplate>
                        <h3 style="text-align: center">
                            <asp:Label ID="votingResultsMessage" runat="server" Text="Voting results are not available yet"></asp:Label></h3>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>
        <br />
    </center>
</asp:Content>