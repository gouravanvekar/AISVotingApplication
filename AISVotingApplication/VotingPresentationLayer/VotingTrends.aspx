<%@ Page Title="" Language="C#" MasterPageFile="~/AISAdmin.Master" AutoEventWireup="true"
    CodeBehind="VotingTrends.aspx.cs" Inherits="VotingPresentationLayer.VotingTrends" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Scripts/jquery.min.js" type="text/javascript"></script>
    <script src="Scripts/highcharts.js" type="text/javascript"></script>
    <script src="Scripts/exporting.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            debugger;
            $('#container').highcharts({
                chart: {
                    type: 'spline'
                },
                title: {
                    text: $('#<%=ChartTitle.ClientID %>').val()
                },
                subtitle: {
                    text: $('#<%=ChartSubtitle.ClientID %>').val()
                },
                xAxis: {
                    categories: ['President', 'Corporate Relations', 'Leadership Development', 'Membership & Treasury', 'Networking', 'Media & Communication', 'Alumni Relations']
                },
                yAxis: {
                    title: {
                        text: 'Number of Votes'
                    },
                    labels: {
                        formatter: function () {
                            return this.value
                        }
                    }
                },
                tooltip: {
                    crosshairs: true,
                    shared: true
                },
                plotOptions: {
                    spline: {
                        marker: {
                            radius: 4,
                            lineColor: '#666666',
                            lineWidth: 1
                        }
                    }
                },
                series: [{
                    name: $('#<%=Series1Title.ClientID %>').val(),
                    marker: {
                        symbol: 'square'
                    },
                    data: $('#<%=Series1.ClientID %>')[0].defaultValue.split(",").map(Number)
                }, {
                    name: $('#<%=Series2Title.ClientID %>').val(),
                    marker: {
                        symbol: 'diamond'
                    },
                    data: $('#<%=Series2.ClientID %>')[0].defaultValue.split(",").map(Number)
                }]
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminArea" runat="server">
    <center>
        <div>
            <h1>
                Voting Trends</h1>
            <asp:HiddenField ID="ChartTitle" runat="server" />
            <asp:HiddenField ID="ChartSubtitle" runat="server" />
            <asp:HiddenField ID="Series1Title" runat="server" />
            <asp:HiddenField ID="Series2Title" runat="server" />
            <asp:HiddenField ID="Series1" runat="server" />
            <asp:HiddenField ID="Series2" runat="server" />
            <div id="container" style="padding: 2px; background-color: #000; width: 800px; height: 400px;
                margin: 0 auto">
            </div>
            <br />
            <br />
        </div>
    </center>
</asp:Content>
