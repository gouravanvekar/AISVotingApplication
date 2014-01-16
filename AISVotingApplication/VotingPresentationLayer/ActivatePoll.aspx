<%@ Page Title="" Language="C#" MasterPageFile="~/AISAdmin.Master" AutoEventWireup="true"
    CodeBehind="ActivatePoll.aspx.cs" Inherits="VotingPresentationLayer.ActivatePoll" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminArea" runat="server">
    <center>
        <div>
            <h1>
                Activate Voting</h1>
            <div>
                <asp:GridView ID="gvActivatePolls" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    DataKeyNames="Position_ID" DataSourceID="SqlDataSource1" EnableModelValidation="True"
                    ForeColor="#333333" GridLines="None" Style="border: 1px solid black;" Width="500px">
                    <AlternatingRowStyle BackColor="White" HorizontalAlign="Center" />
                    <Columns>
                        <asp:BoundField DataField="Position_ID" HeaderText="Serial No." InsertVisible="False"
                            ReadOnly="True" SortExpression="Position_ID" Visible="False" />
                        <asp:TemplateField HeaderText="Position" SortExpression="Position">
                            <EditItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Position") %>' Style="color: White;"></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Position") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Activated" SortExpression="Activated">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("Activated") %>'>
                                    <asp:ListItem>Yes</asp:ListItem>
                                    <asp:ListItem>No</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Activated") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ButtonType="Button" EditText="Change" ShowEditButton="True" AccessibleHeaderText="Change"
                            ShowHeader="True">
                            <ControlStyle CssClass="button-styles" />
                        </asp:CommandField>
                    </Columns>
                    <EditRowStyle BackColor="#507CD1" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#000" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                </asp:GridView>
            </div>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues"
                ConnectionString="<%$ ConnectionStrings:VotingData %>" DeleteCommand="DELETE FROM [Voting_Activation] WHERE [Position_ID] = @original_Position_ID AND [Position] = @original_Position AND (([Activated] = @original_Activated) OR ([Activated] IS NULL AND @original_Activated IS NULL))"
                InsertCommand="INSERT INTO [Voting_Activation] ([Position], [Activated]) VALUES (@Position, @Activated)"
                OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [Position], [Activated], [Position_ID] FROM [Voting_Activation]"
                UpdateCommand="UPDATE [Voting_Activation] SET [Position] = @Position, [Activated] = @Activated WHERE [Position_ID] = @original_Position_ID AND [Position] = @original_Position AND (([Activated] = @original_Activated) OR ([Activated] IS NULL AND @original_Activated IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_Position_ID" Type="Int32" />
                    <asp:Parameter Name="original_Position" Type="String" />
                    <asp:Parameter Name="original_Activated" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Position" Type="String" />
                    <asp:Parameter Name="Activated" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Position" Type="String" />
                    <asp:Parameter Name="Activated" Type="String" />
                    <asp:Parameter Name="original_Position_ID" Type="Int32" />
                    <asp:Parameter Name="original_Position" Type="String" />
                    <asp:Parameter Name="original_Activated" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </center>
</asp:Content>
