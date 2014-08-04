<%@ Page Title="" Language="C#" MasterPageFile="~/AISAdmin.Master" AutoEventWireup="true"
    CodeBehind="ResetElection.aspx.cs" Inherits="VotingPresentationLayer.ResetElection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminArea" runat="server">
    <center>
        <div>
            <h1>
                Reset Elections</h1>
            <div>
                This option will reset the data for fresh elections
                <br />
                Please use this option carefully<br />
                <br />
                <span style="color: red;">By clicking the 'Reset' button, you will lose all the data
                </span>
                <br />
                Please type the text '<span style="color: red;"><b>I Confirm</b></span>', enter the Admin password and press the <span style="color: red;">
                    'Reset'</span> button<br />
                <br />
            </div>
            <p>
                <asp:TextBox ID="confirmationText" runat="server" placeholder="Type 'I Confirm'"
                    class="input-field"></asp:TextBox>
                <asp:RequiredFieldValidator ID="confirmationText_Required" runat="server" ErrorMessage="*"
                    ControlToValidate="confirmationText"></asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:TextBox ID="adminPassword" runat="server" placeholder="Admin Password"
                    class="input-field" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="adminPasswordVal" runat="server" ErrorMessage="*"
                    ControlToValidate="adminPassword"></asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:CompareValidator ID="CompareConfirmationText" runat="server" ErrorMessage="Text does not match"
                    ValueToCompare="I Confirm" ControlToValidate="confirmationText"></asp:CompareValidator>
            </p>
            <p>
                <asp:Label ID="message" runat="server" Style="color: Red;"></asp:Label></p>
            <p>
                <asp:Button ID="clear_button" runat="server" Text="Reset" class="button-styles" OnClick="clear_button_Click" /></p>
        </div>
    </center>
</asp:Content>
