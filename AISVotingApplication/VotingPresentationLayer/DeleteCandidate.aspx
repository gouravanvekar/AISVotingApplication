<%@ Page Title="" Language="C#" MasterPageFile="~/AISAdmin.Master" AutoEventWireup="true"
    CodeBehind="DeleteCandidate.aspx.cs" Inherits="VotingPresentationLayer.DeleteCandidate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminArea" runat="server">
    <center>
        <div>
            <h1>
                <asp:Label ID="candidateHeading" runat="server"></asp:Label></h1>
            <div>
                <asp:GridView ID="aisCandidates" runat="server" CellPadding="4" EnableModelValidation="True"
                    ForeColor="#333333" GridLines="None" Style="border: 1px solid black;" Width="600px"
                    AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="UFID"
                    DataSourceID="CandidatesDataSource" OnRowDeleting="aisCandidates_RowDeleting" OnRowDeleted="aisCandidates_RowDeleted">
                    <AlternatingRowStyle BackColor="White" HorizontalAlign="Center" />
                    <Columns>
                        <asp:BoundField DataField="UFID" HeaderText="UFID" ReadOnly="True" SortExpression="UFID" Visible="false" />
                        <asp:TemplateField HeaderText="Profile Image">
                            <ItemTemplate>
                                <asp:Image runat="server" ID="myImg" CssClass="grid-image"
                                ImageUrl='<%# GetImageUrl(Eval("Profile_Image") as string) %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Position" HeaderText="Position" SortExpression="Position" />
                        <asp:CommandField AccessibleHeaderText="Delete" ButtonType="Button" HeaderText="Delete"
                            ShowCancelButton="False" ShowDeleteButton="True">
                            <ControlStyle CssClass="button-styles" />
                        </asp:CommandField>
                    </Columns>
                    <EditRowStyle BackColor="#507CD1" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#000" ForeColor="White" Height="50px" HorizontalAlign="Center" />
                    <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Left" />
                    <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <EmptyDataTemplate>
                        <h3 style="text-align: center">
                            <asp:Label ID="candidateMessage" runat="server" Text="No candidates have been added"></asp:Label></h3>
                    </EmptyDataTemplate>
                </asp:GridView>
                <br />
                <asp:SqlDataSource ID="CandidatesDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:VotingData %>"
                    SelectCommand="SELECT AIS_Members.UFID, COALESCE(AIS_Members.First_Name, '') + ' ' + COALESCE(AIS_Members.Last_Name, '') AS Name, Voting_Candidate.Position, Voting_Candidate.Profile_Image 
FROM AIS_Members INNER JOIN Voting_Candidate ON AIS_Members.UFID = Voting_Candidate.UFID 
ORDER BY Voting_Candidate.Position DESC" DeleteCommand="DELETE FROM Voting_Candidate WHERE UFID=@UFID;DELETE FROM Vote_Bank WHERE Candidates_UFID=@UFID;">
                    <DeleteParameters>
                        <asp:Parameter Name="UFID" Type="String" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </center>
</asp:Content>
