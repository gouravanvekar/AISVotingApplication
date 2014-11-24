<%@ Page Title="" Language="C#" MasterPageFile="~/AISAdmin.Master" AutoEventWireup="true"
    CodeBehind="ViewMembers.aspx.cs" Inherits="VotingPresentationLayer.ViewMembers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminArea" runat="server">
    <center>
        <div>
            <h1>
                View/Delete AIS Members</h1>
            <div>
                <asp:GridView ID="aisMembers" runat="server" CellPadding="4" EnableModelValidation="True"
                    ForeColor="#333333" GridLines="None" Style="border: 1px solid black;" Width="600px"
                    AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="UFID"
                    DataSourceID="MembersDataSource" OnRowDeleting="aisMembers_RowDeleting">
                    <AlternatingRowStyle BackColor="White" HorizontalAlign="Left" />
                    <Columns>
                        <asp:BoundField DataField="UFID" HeaderText="Email" ReadOnly="True" SortExpression="UFID" />
                        <asp:BoundField DataField="First_Name" HeaderText="Firstname" SortExpression="First_Name" />
                        <asp:BoundField DataField="Last_Name" HeaderText="Lastname" SortExpression="Last_Name" />
                        <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                        <asp:CommandField AccessibleHeaderText="Delete" ButtonType="Button" HeaderText="Delete"
                            ShowCancelButton="False" ShowDeleteButton="True">
                            <ControlStyle CssClass="button-styles" />
                        </asp:CommandField>
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
                            <asp:Label ID="votingMembersMessage" runat="server" Text="No members have been added yet"></asp:Label></h3>
                    </EmptyDataTemplate>
                </asp:GridView>
                <br />
                <asp:SqlDataSource ID="MembersDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:VotingData %>"
                    SelectCommand="SELECT  AIS_Members.UFID, AIS_Members.First_Name, AIS_Members.Last_Name,Login_Details.Password 
FROM AIS_Members INNER JOIN Login_Details ON AIS_Members.UFID = Login_Details.UFID" DeleteCommand="DELETE FROM Login_Details WHERE UFID=@UFID;DELETE FROM Vote_Bank WHERE Voters_UFID=@UFID;">
                    <DeleteParameters>
                        <asp:Parameter Name="UFID" Type="String" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </center>
</asp:Content>
