<%@ Page Title="" Language="C#" MasterPageFile="~/AISMember.Master" AutoEventWireup="true"
    CodeBehind="Credits.aspx.cs" Inherits="VotingPresentationLayer.Credits" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function hover(element, path) {
            element.setAttribute('src', path);
        }
        function unhover(element, path) {
            element.setAttribute('src', path);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="VoteArea" runat="server">
    <center>
        <h1>
            Authors</h1>
        <table class="table-style">
            <tr>
                <td style="padding: 20px;">
                    <div style="text-align: center">
                        <b>Aron Aperauch</b>
                    </div>
                    <div style="text-align: center">
                        Project Manager
                    </div>
                </td>
                <td style="padding: 20px;">
                    <div style="text-align: center">
                        <b>Gourav Anvekar</b>
                    </div>
                    <div style="text-align: center">
                        Lead Developer
                    </div>
                </td>
                <td style="padding: 20px;">
                    <div style="text-align: center">
                        <b>Tarun Sharma</b>
                    </div>
                    <div style="text-align: center">
                        Database Admin (Fall 2013)
                    </div>
                </td>
            </tr>
            <tr>
                <td style="padding: 20px;">
                    <div style="text-align: center">
                        <b>Contributors<br />(Spring 2014)</b>
                    </div>
                    <div style="text-align: center">
                        <br />Santosh Sunkavalli
                        <br />Swetha Katepalli
                        <br />Adrian Wu
                    </div>
                </td>
                <td style="padding: 20px;">
                    <div style="text-align: center">
                        <b>Contributors<br />(Fall 2014)</b>
                    </div>
                    <div style="text-align: center">
                        <br />Name 1
                        <br />Name 2
                        <br />Name 3
                    </div>
                </td>
                <td style="padding: 20px;">
                    <div style="text-align: center">
                        <b></b>
                    </div>
                    <div style="text-align: center">
                        
                    </div>
                </td>
            </tr>
        </table>
    </center>
</asp:Content>
