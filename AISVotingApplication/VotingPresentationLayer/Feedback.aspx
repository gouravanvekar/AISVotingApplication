<%@ Page Title="" Language="C#" MasterPageFile="~/AISMember.Master" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="VotingPresentationLayer.Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="VoteArea" runat="server">
    <center>
        <div>
            <h1>Feedback</h1>
            <br />
            <div id="feedback" runat="server">
                <table class="table-style">
                    <tr>
                        <td>Feedback Mode:<br />
                        </td>
                        <td>
                            <asp:ScriptManager ID="AnalysisScriptManager" runat="server">
                            </asp:ScriptManager>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:RadioButtonList runat="server" ID="rblFeedback_Mode" AutoPostBack="True" OnSelectedIndexChanged="rblFeedback_Mode_SelectedIndexChanged" RepeatDirection="Horizontal" Width="500px">
                                        <asp:ListItem Selected="True">Anonymous</asp:ListItem>
                                        <asp:ListItem>Named</asp:ListItem>
                                    </asp:RadioButtonList>
                                    <asp:Label ID="lblMessage" runat="server" Style="color: Red;"></asp:Label>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="rblFeedback_Mode" EventName="SelectedIndexChanged" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </td>
                        <td class="td-small"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            
                        </td>
                        <td class="td-small"></td>
                    </tr>
                    <tr>
                        <td>Rate this app:
                        </td>
                        <td>
                            <asp:RadioButtonList runat="server" ID="rblRating" OnSelectedIndexChanged="rblFeedback_Mode_SelectedIndexChanged" RepeatDirection="Horizontal" Width="500px">
                                <asp:ListItem Value="1">1 (Poor)</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem Value="5">5 (Excellent)</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td class="td-small">
                            <asp:RequiredFieldValidator ID="Rating_Required" runat="server" ErrorMessage="*"
                                ControlToValidate="rblRating"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td class="td-small"></td>
                    </tr>
                    <tr>
                        <td>Feedback/Comments:
                        </td>
                        <td>
                            <asp:TextBox ID="txtComments" runat="server" placeholder="Feedback"
                                class="input-field" TextMode="MultiLine" Height="100" Width="500px"></asp:TextBox>
                        </td>
                        <td class="td-small">
                            <asp:RequiredFieldValidator ID="Comments_Required" runat="server" ErrorMessage="*"
                                ControlToValidate="txtComments"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                </table>
                <p>
                </p>
                <p>
                    <asp:Label ID="Error" runat="server" Style="color: Red;"></asp:Label>
                </p>
                <p>
                    <asp:Button ID="save_feedback" runat="server" Text="Submit" class="button-styles" OnClick="save_feedback_Click" />
                </p>
                <br />
            </div>
        </div>
    </center>
</asp:Content>
