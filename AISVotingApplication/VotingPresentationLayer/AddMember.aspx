<%@ Page Title="" Language="C#" MasterPageFile="~/AISAdmin.Master" AutoEventWireup="true"
    CodeBehind="AddMember.aspx.cs" Inherits="VotingPresentationLayer.AddMember" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminArea" runat="server">
    <center>
        <div>
            <h1>
                Add New Member</h1>
            <p>
                <asp:TextBox ID="memberUFID" runat="server" placeholder="UFID" class="input-field"></asp:TextBox>
                <asp:RequiredFieldValidator ID="UFID_Required" runat="server" ErrorMessage="*" ControlToValidate="memberUFID"></asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:TextBox ID="firstname" runat="server" placeholder="Firstname" class="input-field"></asp:TextBox>
                <asp:RequiredFieldValidator ID="Firstname_Required" runat="server" ErrorMessage="*"
                    ControlToValidate="firstname"></asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:TextBox ID="lastname" runat="server" placeholder="Lastname" class="input-field"></asp:TextBox>
                <asp:RequiredFieldValidator ID="Lastname_Required" runat="server" ErrorMessage="*"
                    ControlToValidate="lastname"></asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:Label ID="Error" runat="server" Style="color: Red;"></asp:Label></p>
            <p>
                <asp:Button ID="add_member_button" runat="server" Text="Add" OnClick="add_button_Click"
                    class="button-styles" /></p>
        </div>
    </center>
</asp:Content>
