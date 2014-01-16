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
                    Width="300px">
                    <AlternatingRowStyle BackColor="White" HorizontalAlign="Center" />
                    <Columns>
                        <asp:BoundField DataField="Positions" HeaderText="Positions" ReadOnly="True" SortExpression="Positions" />
                        <asp:BoundField DataField="No. of Voters" HeaderText="No. of Voters" ReadOnly="True"
                            SortExpression="No. of Voters" />
                    </Columns>
                    <EditRowStyle BackColor="#507CD1" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#000" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                </asp:GridView>
            </div>
        </div>
        <div>
            <h1>
                Voting Results By Position</h1>
            <div>
                <table class="table-style">
                    <tr>
                        <td>
                            Select Position:
                        </td>
                        <td>
                            <asp:DropDownList ID="positions" runat="server" class="input-field" AutoPostBack="True"
                                OnSelectedIndexChanged="positions_SelectedIndexChanged">
                                <asp:ListItem>President</asp:ListItem>
                                <asp:ListItem>Corporate Relations</asp:ListItem>
                                <asp:ListItem>Leadership Development</asp:ListItem>
                                <asp:ListItem>Treasury</asp:ListItem>
                                <asp:ListItem>Internal Networking</asp:ListItem>
                                <asp:ListItem>Media Distribution</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
            </div>
            <div>
                <br />
                <asp:GridView ID="positionResults" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    EnableModelValidation="True" ForeColor="#333333" GridLines="None" Style="border: 1px solid black;"
                    Width="300px">
                    <AlternatingRowStyle BackColor="White" HorizontalAlign="Center" />
                    <Columns>
                        <asp:BoundField DataField="Candidate Name" HeaderText="Candidate Name" ReadOnly="True"
                            SortExpression="Candidate Name" />
                        <asp:BoundField DataField="Votes" HeaderText="Votes" ReadOnly="True" SortExpression="Votes" />
                    </Columns>
                    <EditRowStyle BackColor="#507CD1" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#000" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                </asp:GridView>
                <br />
                <br />
            </div>
        </div>
    </center>
</asp:Content>