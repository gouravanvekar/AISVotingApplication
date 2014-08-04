<%@ Page Title="" Language="C#" MasterPageFile="~/AISAdmin.Master" AutoEventWireup="true"
    CodeBehind="SetAdminPassword.aspx.cs" Inherits="VotingPresentationLayer.SetAdminPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminArea" runat="server">
    <center>
        <div>
            <h1>
                Set/Change Admin Password</h1>
            <div>
                <asp:GridView ID="aisMembers" runat="server" CellPadding="4" EnableModelValidation="True"
                    ForeColor="#333333" GridLines="None" Style="border: 1px solid black;" Width="30%"
                    AutoGenerateColumns="False" DataKeyNames="UFID" DataSourceID="AdminPasswordDatasource">
                    <AlternatingRowStyle BackColor="White" HorizontalAlign="Left" />
                    <Columns>
                        <asp:BoundField DataField="UFID" HeaderText="Username" ReadOnly="True" SortExpression="UFID" />
                        <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                        <asp:CommandField ButtonType="Button" EditText="Change" ShowEditButton="True">
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
                </asp:GridView>
                <asp:SqlDataSource ID="AdminPasswordDatasource" runat="server" ConflictDetection="CompareAllValues"
                    ConnectionString="<%$ ConnectionStrings:VotingData %>" OldValuesParameterFormatString="original_{0}"
                    SelectCommand="SELECT * FROM [Login_Details] WHERE ([UFID] = @UFID)" UpdateCommand="UPDATE [Login_Details] SET [Password] = @Password WHERE [UFID] = @original_UFID AND [Password] = @original_Password">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="admin" Name="UFID" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Password" Type="String" />
                        <asp:Parameter Name="original_UFID" Type="String" />
                        <asp:Parameter Name="original_Password" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />
            </div>
        </div>
    </center>
</asp:Content>
