<%@ Page Title="" Language="C#" MasterPageFile="~/AISAdmin.Master" AutoEventWireup="true"
    CodeBehind="AddMember.aspx.cs" Inherits="VotingPresentationLayer.AddMember" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminArea" runat="server">
    <center>
        <div>
            <h1>
                Add Members</h1>
            <br />
            <asp:RadioButtonList ID="AddMembersList" runat="server" Style="width: 30%; border: 1px solid black;"
                RepeatDirection="Horizontal" OnSelectedIndexChanged="AddMembersList_SelectedIndexChanged"
                AutoPostBack="True">
                <asp:ListItem Selected="True">Single Member</asp:ListItem>
                <asp:ListItem>Multiple Members</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <div id="singleMember" runat="server">
                <table class="table-style">
                    <tr>
                        <td>
                            UFID:
                        </td>
                        <td>
                            <asp:TextBox ID="memberUFID" runat="server" placeholder="UFID" class="input-field"
                                ValidationGroup="SingleMember"></asp:TextBox>
                        </td>
                        <td class="td-small">
                            <asp:RequiredFieldValidator ID="UFID_Required" runat="server" ErrorMessage="*" ControlToValidate="memberUFID"
                                ValidationGroup="SingleMember"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Firstname:
                        </td>
                        <td>
                            <asp:TextBox ID="firstname" runat="server" placeholder="Firstname" class="input-field"
                                ValidationGroup="SingleMember"></asp:TextBox>
                        </td>
                        <td class="td-small">
                            <asp:RequiredFieldValidator ID="Firstname_Required" runat="server" ErrorMessage="*"
                                ControlToValidate="firstname" ValidationGroup="SingleMember"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Lastname:
                        </td>
                        <td>
                            <asp:TextBox ID="lastname" runat="server" placeholder="Lastname" class="input-field"
                                ValidationGroup="SingleMember"></asp:TextBox>
                        </td>
                        <td class="td-small">
                            <asp:RequiredFieldValidator ID="Lastname_Required" runat="server" ErrorMessage="*"
                                ControlToValidate="lastname" ValidationGroup="SingleMember"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Password:
                        </td>
                        <td>
                            <asp:TextBox ID="Password" runat="server" placeholder="Default password 'aismember'"
                                class="input-field" TextMode="Password">
                            </asp:TextBox>
                        </td>
                        <td class="td-small">
                        </td>
                    </tr>
                </table>
                <p>
                    <asp:Label ID="Error" runat="server" Style="color: Red;"></asp:Label>
                </p>
                <p>
                    <asp:Button ID="add_member_button" runat="server" Text="Add" OnClick="add_button_Click"
                        class="button-styles" ValidationGroup="SingleMember" /></p>
            </div>
            <div id="multipleMembers" runat="server">
                <div>
                    Please upload a valid CSV file
                    <br />
                    The values must be in the following format:<br />
                    <br />
                    <span style="color: red;">UFID,Password,Firstname,Lastname<br />
                    </span>Eg.: 12345678,TestPassword,John,Doe<br />
                    <br />
                </div>
                <table class="table-style">
                    <tr>
                        <td>
                            Upload CSV File:
                        </td>
                        <td>
                            <asp:FileUpload ID="csvUpload" runat="server" />
                        </td>
                    </tr>
                </table>
                <p>
                    <asp:Label ID="uploadError" runat="server" Style="color: Red;"></asp:Label></p>
                <div>
                    <asp:GridView ID="aisMembers" runat="server" CellPadding="4" EnableModelValidation="True"
                        ForeColor="#333333" GridLines="None" Style="border: 1px solid black;" Width="600px"
                        AutoGenerateColumns="False">
                        <AlternatingRowStyle BackColor="White" HorizontalAlign="Left" />
                        <Columns>
                            <asp:BoundField DataField="UFID" HeaderText="UFID" ReadOnly="True" SortExpression="UFID" />
                            <asp:BoundField DataField="FirstName" HeaderText="Firstname" SortExpression="FirstName" />
                            <asp:BoundField DataField="Lastname" HeaderText="Lastname" SortExpression="Lastname" />
                            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                        </Columns>
                        <EditRowStyle BackColor="#507CD1" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#000" ForeColor="White" Height="50px" HorizontalAlign="Left" />
                        <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Left" />
                        <RowStyle BackColor="#EFF3FB" HorizontalAlign="Left" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    </asp:GridView>
                    <br />
                </div>
                <p>
                    <asp:Button ID="csvButton" runat="server" Text="Upload" class="button-styles" OnClick="csvButton_Click" /></p>
                <br />
            </div>
        </div>
    </center>
</asp:Content>
