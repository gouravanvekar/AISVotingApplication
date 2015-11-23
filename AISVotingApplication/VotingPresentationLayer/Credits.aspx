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
        <h1>Credits</h1>
        <table class="table-style">
            <tr>
                <td style="padding: 20px; width: 320px; line-height: 1.5em;">
                    <div class="profile-avatar" style="text-align: center">
                        <a href="http://gouravanvekar.com/" target="_blank" class="social">
                            <img src="images/GA.jpg" alt="GA" />
                        </a>
                    </div>
                    <div style="text-align: center">
                        <b>Gourav Anvekar</b><br />
                    </div>
                    <div style="text-align: center">
                        Developer<br />
                        (VP Media and Communications: Fall 2014)
                    </div>
                    <br />
                    <div style="text-align: center;" class="social">
                        <a href="https://www.facebook.com/gaurav.anvekar7" target="_blank">
                            <img src="images/Facebook.png" alt="Facebook" />
                        </a>
                        &nbsp;&nbsp;
                        <a href="http://github.com/gouravanvekar" target="_blank" class="social">
                            <img src="images/GitHub.png" alt="GitHub" />
                        </a>
                        &nbsp;&nbsp;
                        <a href="https://www.linkedin.com/in/gouravanvekar" target="_blank" class="social">
                            <img src="images/LinkedIn.png" alt="LinkedIn" />
                        </a>
                        &nbsp;&nbsp;
                        <a href="http://gouravanvekar.com/" target="_blank" class="social">
                            <img src="images/Website.png" alt="Website" />
                        </a>
                    </div>
                </td>                
                <td style="padding: 20px; width: 320px; line-height: 1.5em;">
                    <div class="profile-avatar" style="text-align: center">
                        <a href="http://aperauch.appspot.com/" target="_blank" class="social">
                            <img src="images/AA.jpg" alt="GA" />
                        </a>
                    </div>
                    <div style="text-align: center">
                        <b>Aron Aperauch</b><br />
                    </div>
                    <div style="text-align: center">
                        Project Manager<br />
                        (VP Networking: Spring 2013)
                    </div>
                    <br />
                    <div style="text-align: center;" class="social">
                        <a href="https://www.facebook.com/aron.aperauch" target="_blank">
                            <img src="images/Facebook.png" alt="Facebook" />
                        </a>
                        &nbsp;&nbsp;
                        <a href="https://github.com/aperauch" target="_blank" class="social">
                            <img src="images/GitHub.png" alt="GitHub" />
                        </a>
                        &nbsp;&nbsp;
                        <a href="https://www.linkedin.com/in/aperauch" target="_blank" class="social">
                            <img src="images/LinkedIn.png" alt="LinkedIn" />
                        </a>
                        &nbsp;&nbsp;
                        <a href="http://aperauch.appspot.com/" target="_blank" class="social">
                            <img src="images/Website.png" alt="Website" />
                        </a>
                    </div>
                </td>
            </tr>
        </table>
    </center>
</asp:Content>
