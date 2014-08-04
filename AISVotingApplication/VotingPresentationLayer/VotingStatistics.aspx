<%@ Page Title="" Language="C#" MasterPageFile="~/AISAdmin.Master" AutoEventWireup="true"
    CodeBehind="VotingStatistics.aspx.cs" Inherits="VotingPresentationLayer.VotingStatistics"
    EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminArea" runat="server">
    <center>
        <div>
            <h1>
                Voting Statistics</h1>
            <div>
                <asp:ScriptManager ID="StatisticsScriptManager" runat="server">
                </asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="votingStatistics" runat="server" CellPadding="4" EnableModelValidation="True"
                            ForeColor="#333333" GridLines="None" Style="border: 1px solid black;" Width="600px"
                            AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="VotersUFID,CandidatesUFID"
                            DataSourceID="StatisticsDataSource">
                            <AlternatingRowStyle BackColor="White" HorizontalAlign="Left" />
                            <Columns>
                                <asp:BoundField DataField="Voter" HeaderText="Voter Name" ReadOnly="True" SortExpression="Voter" />
                                <asp:BoundField DataField="Candidate" HeaderText="Candidate Name" ReadOnly="True"
                                    SortExpression="Candidate" />
                                <asp:BoundField DataField="Position" HeaderText="Position" ReadOnly="True" SortExpression="Position" />
                                <asp:BoundField DataField="Term" HeaderText="Term" ReadOnly="True" SortExpression="Term" />
                            </Columns>
                            <EditRowStyle BackColor="#507CD1" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#000" ForeColor="White" Height="50px" HorizontalAlign="Left" />
                            <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Left" />
                            <RowStyle BackColor="#EFF3FB" HorizontalAlign="Left" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <EmptyDataTemplate>
                                <h3 style="text-align: center">
                                    <asp:Label ID="votingStatisticsMessage" runat="server" Text="Voting statistics are not available yet"></asp:Label></h3>
                            </EmptyDataTemplate>
                        </asp:GridView>
                        <asp:SqlDataSource ID="StatisticsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:VotingData %>"
                            SelectCommand="SELECT A.UFID VotersUFID, COALESCE(A.First_Name, '') + ' ' + COALESCE(A.Last_Name, '') AS 'Voter', C.UFID CandidatesUFID,  COALESCE(C.First_Name, '') + ' ' + COALESCE(C.Last_Name, '') AS 'Candidate',  COALESCE(Position, '') Position, COALESCE(Term, '') Term
FROM Vote_Bank B
JOIN AIS_Members A ON A.UFID = B.Voters_UFID
JOIN AIS_Members C ON C.UFID = B.Candidates_UFID"></asp:SqlDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <p>
                    <asp:Button ID="export_button" runat="server" Text="Export to Excel" class="button-styles"
                        OnClick="export_button_Click" /></p>
            </div>
        </div>
        <br />
    </center>
</asp:Content>
