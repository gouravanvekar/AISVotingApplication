﻿<%@ Page Title="" Language="C#" MasterPageFile="~/AISAdmin.Master" AutoEventWireup="true"
    CodeBehind="FindMembers.aspx.cs" Inherits="VotingPresentationLayer.FindMembers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminArea" runat="server">
    <center>
        <div>
            <h1>
                Find Member by Email</h1>
            <p>
                <asp:TextBox ID="memberUFID" runat="server" placeholder="Email" class="input-field"></asp:TextBox>
                <asp:RequiredFieldValidator ID="UFID_Required" runat="server" ErrorMessage="*" ControlToValidate="memberUFID"></asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:Button ID="find_button" runat="server" Text="Find" class="button-styles" OnClick="find_button_Click" />
            </p>
            <p>
                <asp:RegularExpressionValidator ID="UFID_RE_Val" runat="server" ErrorMessage="Invalid Email" ControlToValidate="memberUFID" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$"></asp:RegularExpressionValidator>
            </p>
            <br />
            <div>
                <asp:GridView ID="aisMembers" runat="server" CellPadding="4" EnableModelValidation="True"
                    ForeColor="#333333" GridLines="None" Style="border: 1px solid black;" Width="600px"
                    AutoGenerateColumns="False" DataKeyNames="UFID" DataSourceID="MembersDataSource"
                    Visible="false">
                    <AlternatingRowStyle BackColor="White" HorizontalAlign="Left" />
                    <Columns>
                        <asp:BoundField DataField="UFID" HeaderText="Email" ReadOnly="True" SortExpression="UFID" />
                        <asp:BoundField DataField="First_Name" HeaderText="Firstname" SortExpression="First_Name" />
                        <asp:BoundField DataField="Last_Name" HeaderText="Lastname" SortExpression="Last_Name" />
                        <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
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
                            <asp:Label ID="findMemberMessage" runat="server" Text="Member not found"></asp:Label></h3>
                        <div style="text-align:center;">
                            <asp:Button runat="server" ID="myButton" OnClientClick="window.location.href='FindMemberByName.aspx'; return false;" Text="Find by name" class="button-styles" />
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
                <br />
                <asp:SqlDataSource ID="MembersDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:VotingData %>"
                    SelectCommand="SELECT  AIS_Members.UFID, AIS_Members.First_Name, AIS_Members.Last_Name, Login_Details.Password 
FROM AIS_Members, Login_Details
Where AIS_Members.UFID = Login_Details.UFID And Login_Details.UFID=@memberUFID">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="memberUFID" Name="memberUFID" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </center>
</asp:Content>
