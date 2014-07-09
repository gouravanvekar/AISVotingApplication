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
            Contributors</h1>
        <table class="table-style">
            <tr>
                <td style="padding: 20px;">
                    <div>
                        <img src="images/Aron_1.jpg" alt="Aron Aperauch" class="image-styles" onmouseover="hover(this, 'images/Aron_2.jpg');"
                            onmouseout="unhover(this, 'images/Aron_1.jpg');" /><br />
                    </div>
                    <div style="text-align: center">
                        <b>Aron Aperauch</b>
                    </div>
                    <div style="text-align: center">
                        Labs Director
                    </div>
                </td>
                <td style="padding: 20px;">
                    <div>
                        <img src="images/Gourav_1.jpg" alt="Gourav Anvekar" class="image-styles" onmouseover="hover(this, 'images/Gourav_2.jpg');"
                            onmouseout="unhover(this, 'images/Gourav_1.jpg');" /><br />
                    </div>
                    <div style="text-align: center">
                        <b>Gourav Anvekar</b>
                    </div>
                    <div style="text-align: center">
                        Lead Developer
                    </div>
                </td>
                <td style="padding: 20px;">
                    <div>
                        <img src="images/Swetha_1.jpg" alt="Swetha Katepalli" class="image-styles" onmouseover="hover(this, 'images/Swetha_2.jpg');"
                            onmouseout="unhover(this, 'images/Swetha_1.jpg');" /><br />
                    </div>
                    <div style="text-align: center">
                        <b>Swetha Katepalli</b>
                    </div>
                    <div style="text-align: center">
                        Tester
                    </div>
                </td>
            </tr>
            <tr>
                <td style="padding: 20px;">
                    <div>
                        <img src="images/Adrian_1.jpg" alt="Songbo 'Adrian' Wu" class="image-styles" onmouseover="hover(this, 'images/Adrian_2.jpg');"
                            onmouseout="unhover(this, 'images/Adrian_1.jpg');" /><br />
                    </div>
                    <div style="text-align: center">
                        <b>Songbo "Adrian" Wu</b>
                    </div>
                    <div style="text-align: center">
                        Developer
                    </div>
                </td>
                <td style="padding: 20px;">
                    <div>
                        <img src="images/Santosh_1.jpg" alt="Santosh Sunkavalli" class="image-styles" onmouseover="hover(this, 'images/Santosh_2.jpg');"
                            onmouseout="unhover(this, 'images/Santosh_1.jpg');" /><br />
                    </div>
                    <div style="text-align: center">
                        <b>Santosh Sunkavalli</b>
                    </div>
                    <div style="text-align: center">
                        Developer
                    </div>
                </td>
                <td style="padding: 20px;">
                    <div>
                        <img src="images/Tarun.jpg" alt="Tarun Sharma" class="image-styles" /><br />
                    </div>
                    <div style="text-align: center">
                        <b>Tarun Sharma</b>
                    </div>
                    <div style="text-align: center">
                        Database Designer
                    </div>
                </td>
            </tr>
        </table>
    </center>
</asp:Content>
