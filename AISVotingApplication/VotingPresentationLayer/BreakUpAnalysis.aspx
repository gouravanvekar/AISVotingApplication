<%@ Page Title="" Language="C#" MasterPageFile="~/AISAdmin.Master" AutoEventWireup="true"
    CodeBehind="BreakUpAnalysis.aspx.cs" Inherits="VotingPresentationLayer.BreakUpAnalysis" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="Scripts/jquery.min.js" type="text/javascript"></script>
    <script src="Scripts/highcharts.js" type="text/javascript"></script>
    <script src="Scripts/drilldown.js" type="text/javascript"></script>
    <script src="Scripts/data.js" type="text/javascript"></script>
    <script src="Scripts/exporting.js" type="text/javascript"></script>
    <script type="text/javascript">
        function BindEvents() {
            $(function () {
                Highcharts.data({
                    csv: document.getElementById('tsv').innerHTML,
                    itemDelimiter: '\t',
                    parsed: function (columns) {
                        var brands = {},
                brandsData = [],
                versions = {},
                drilldownSeries = [];
                        // Parse percentage strings
                        columns[1] = $.map(columns[1], function (value) {
                            if (value != undefined) {
                                if (value.indexOf('%') === value.length - 8) {
                                    //debugger;
                                    //value = parseFloat(value.slice(40, 45));
                                    var regex = /[+-]?\d+\.\d+/g;
                                    value = value.match(regex).map(function (v) { return parseFloat(v); });
                                }
                            }
                            return value;
                        });

                        $.each(columns[0], function (i, name) {
                            var brand,
                    version;

                            if (i > 0) {
                                // Remove special edition notes
                                name = name.split(' -')[0];

                                // Split into brand and version
                                version = name.match(/([0-9]+[\.0-9x]*)/);
                                if (version) {
                                    version = version[0];
                                }
                                brand = name.replace(version, '');

                                // Create the main data
                                if (!brands[brand]) {
                                    brands[brand] = columns[1][i];
                                } else {
                                    brands[brand] += columns[1][i];
                                }

                                // Create the version data
                                if (version !== null) {
                                    if (!versions[brand]) {
                                        versions[brand] = [];
                                    }
                                    versions[brand].push(['v' + version, columns[1][i]]);
                                }
                            }

                        });

                        $.each(brands, function (name, y) {
                            brandsData.push({
                                name: name,
                                y: y,
                                drilldown: versions[name] ? name : null
                            });
                        });
                        $.each(versions, function (key, value) {
                            drilldownSeries.push({
                                name: key,
                                id: key,
                                data: value
                            });
                        });

                        // Create the chart
                        $('#container').highcharts({
                            chart: {
                                type: 'column'
                            },
                            title: {
                                text: $('#<%=ChartTitle.ClientID %>').val()
                            },
                            subtitle: {
                                text: $('#<%=ChartSubtitle.ClientID %>').val()
                            },
                            xAxis: {
                                type: 'category'
                            },
                            yAxis: {
                                title: {
                                    text: 'Percentage of Votes'
                                }
                            },
                            legend: {
                                enabled: false
                            },
                            plotOptions: {
                                series: {
                                    borderWidth: 0,
                                    dataLabels: {
                                        enabled: false,
                                        format: '{point.y:.1f}%'
                                    }
                                }
                            },

                            tooltip: {
                                headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
                                pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total votes<br/>'
                            },

                            series: [{
                                name: 'Candidate',
                                colorByPoint: true,
                                data: brandsData
                            }],
                            drilldown: {
                                series: drilldownSeries
                            }
                        })
                    }
                });
            });
        }
		</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="AdminArea" runat="server">
    <center>
        <div>
            <asp:ScriptManager ID="AnalysisScriptManager" runat="server">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <script type="text/javascript">
                        Sys.Application.add_load(BindEvents);
                    </script>
                    <h2>
                        Break Up Analysis</h2>
                    <div>
                        <table class="table-style">
                            <tr>
                                <td>
                                    Select Position:
                                </td>
                                <td>
                                    <asp:DropDownList ID="positions" runat="server" class="input-field" AutoPostBack="True"
                                        OnSelectedIndexChanged="positions_SelectedIndexChanged">
                                        <asp:ListItem>President</asp:ListItem>
                                        <asp:ListItem>Corporate Relations</asp:ListItem>
                                        <asp:ListItem>Leadership Development</asp:ListItem>
                                        <asp:ListItem>Treasury</asp:ListItem>
                                        <asp:ListItem>Internal Networking</asp:ListItem>
                                        <asp:ListItem>Media Distribution</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div>
                        <br />
                        <div id="container" style="padding: 2px; background-color: #000; width: 600px; height: 400px;
                            margin: 0 auto">
                            <asp:HiddenField ID="ChartTitle" runat="server" />
                            <asp:HiddenField ID="ChartSubtitle" runat="server" />
                        </div>
                        <pre id="tsv" style="display: none">
                             <asp:Label ID="Candidate0" runat="server" />	<asp:Label ID="VotePercent0" runat="server" />
                             <asp:Label ID="Candidate1" runat="server" />	<asp:Label ID="VotePercent1" runat="server" />
                             <asp:Label ID="Candidate2" runat="server" />	<asp:Label ID="VotePercent2" runat="server" />
                             <asp:Label ID="Candidate3" runat="server" />	<asp:Label ID="VotePercent3" runat="server" />
                             <asp:Label ID="Candidate4" runat="server" />	<asp:Label ID="VotePercent4" runat="server" />
                             <asp:Label ID="Candidate5" runat="server" />	<asp:Label ID="VotePercent5" runat="server" />
                        </pre>
                    </div>
                    <div>
                        <br />
                        <asp:GridView ID="positionResults" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            EnableModelValidation="True" ForeColor="#333333" GridLines="None" Style="border: 1px solid black;"
                            Width="300px">
                            <AlternatingRowStyle BackColor="White" HorizontalAlign="Center" />
                            <Columns>
                                <asp:BoundField DataField="Candidate Name" HeaderText="Candidate Name" ReadOnly="True"
                                    SortExpression="Candidate Name" />
                                <asp:BoundField DataField="Votes" HeaderText="Votes Received" ReadOnly="True" SortExpression="Votes" />
                            </Columns>
                            <EditRowStyle BackColor="#507CD1" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle BackColor="#000" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        </asp:GridView>
                        <br />
                        <br />
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="positions" EventName="SelectedIndexChanged" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
    </center>
</asp:Content>
