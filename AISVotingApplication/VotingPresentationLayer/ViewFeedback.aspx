<%@ Page Title="" Language="C#" MasterPageFile="~/AISAdmin.Master" AutoEventWireup="true" CodeBehind="ViewFeedback.aspx.cs" Inherits="VotingPresentationLayer.ViewFeedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminArea" runat="server">
    <center>
        <div>
            <h1>
                View Feedback</h1>
            <div>
                <asp:ScriptManager ID="StatisticsScriptManager" runat="server">
                </asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="votingStatistics" runat="server" CellPadding="4" EnableModelValidation="True"
                            ForeColor="#333333" GridLines="None" Style="border: 1px solid black;" Width="600px"
                            AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
                            DataSourceID="FeedbackDataSource">
                            <AlternatingRowStyle BackColor="White" HorizontalAlign="Left" />
                            <Columns>
                                <asp:BoundField DataField="Rating" HeaderText="Rating" SortExpression="Rating" >
                                <ItemStyle Width="100px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Feedback" HeaderText="Feedback"
                                    SortExpression="Feedback" >
                                <ItemStyle Width="700px" />
                                </asp:BoundField>
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
                                    <asp:Label ID="votingStatisticsMessage" runat="server" Text="Feedback not available yet"></asp:Label></h3>
                            </EmptyDataTemplate>
                        </asp:GridView>
                        <asp:SqlDataSource ID="FeedbackDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:VotingData %>"
                            SelectCommand="SELECT [Rating], [Feedback] FROM [Feedback]"></asp:SqlDataSource>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <br />
    </center>
</asp:Content>
