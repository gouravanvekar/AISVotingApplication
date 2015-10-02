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
        <h1>Project Team</h1>
        <table class="table-style">
            <tr>
                <td style="padding: 20px; width:320px;">
                    <div style="text-align: center">
                        <b>Aron Aperauch</b>
                    </div>
                    <div style="text-align: center">
                        Project Manager<br />
                        (VP Networking: Spring 2013)
                    </div>
                </td>
                <td style="padding: 20px; width:320px;">
                    <div style="text-align: center">
                        <b>Gourav Anvekar</b>
                    </div>
                    <div style="text-align: center">
                        Lead Developer<br />
                        (VP Media and Communications: Fall 2014)
                    </div>
                </td>
            </tr>
        </table>
    </center>
</asp:Content>
