/*
Data plugin for Highcharts

(c) 2012-2014 Torstein Honsi

License: www.highcharts.com/license
*/
(function (j) {
    var m = j.each, o = function (b, a) { this.init(b, a) }; j.extend(o.prototype, { init: function (b, a) { this.options = b; this.chartOptions = a; this.columns = b.columns || this.rowsToColumns(b.rows) || []; this.columns.length ? this.dataFound() : (this.parseCSV(), this.parseTable(), this.parseGoogleSpreadsheet()) }, getColumnDistribution: function () {
        var b = this.chartOptions, a = b && b.chart && b.chart.type, c = []; m(b && b.series || [], function (b) { c.push((j.seriesTypes[b.type || a || "line"].prototype.pointArrayMap || [0]).length) }); this.valueCount =
{ global: (j.seriesTypes[a || "line"].prototype.pointArrayMap || [0]).length, individual: c}
    }, dataFound: function () { if (this.options.switchRowsAndColumns) this.columns = this.rowsToColumns(this.columns); this.parseTypes(); this.findHeaderRow(); this.parsed(); this.complete() }, parseCSV: function () {
        var b = this, a = this.options, c = a.csv, d = this.columns, f = a.startRow || 0, h = a.endRow || Number.MAX_VALUE, i = a.startColumn || 0, e = a.endColumn || Number.MAX_VALUE, g, k, j = 0; c && (k = c.replace(/\r\n/g, "\n").replace(/\r/g, "\n").split(a.lineDelimiter ||
"\n"), g = a.itemDelimiter || (c.indexOf("\t") !== -1 ? "\t" : ","), m(k, function (a, c) { var k = b.trim(a), n = k.indexOf("#") === 0; c >= f && c <= h && !n && k !== "" && (k = a.split(g), m(k, function (b, a) { a >= i && a <= e && (d[a - i] || (d[a - i] = []), d[a - i][j] = b) }), j += 1) }), this.dataFound())
    }, parseTable: function () {
        var b = this.options, a = b.table, c = this.columns, d = b.startRow || 0, f = b.endRow || Number.MAX_VALUE, h = b.startColumn || 0, i = b.endColumn || Number.MAX_VALUE, e; a && (typeof a === "string" && (a = document.getElementById(a)), m(a.getElementsByTagName("tr"), function (a,
b) { e = 0; b >= d && b <= f && m(a.childNodes, function (a) { if ((a.tagName === "TD" || a.tagName === "TH") && e >= h && e <= i) c[e] || (c[e] = []), c[e][b - d] = a.innerHTML, e += 1 }) }), this.dataFound())
    }, parseGoogleSpreadsheet: function () {
        var b = this, a = this.options, c = a.googleSpreadsheetKey, d = this.columns, f = a.startRow || 0, h = a.endRow || Number.MAX_VALUE, i = a.startColumn || 0, e = a.endColumn || Number.MAX_VALUE, g, k; c && jQuery.getJSON("https://spreadsheets.google.com/feeds/cells/" + c + "/" + (a.googleSpreadsheetWorksheet || "od6") + "/public/values?alt=json-in-script&callback=?",
function (a) { var a = a.feed.entry, c, j = a.length, m = 0, n = 0, l; for (l = 0; l < j; l++) c = a[l], m = Math.max(m, c.gs$cell.col), n = Math.max(n, c.gs$cell.row); for (l = 0; l < m; l++) if (l >= i && l <= e) d[l - i] = [], d[l - i].length = Math.min(n, h - f); for (l = 0; l < j; l++) if (c = a[l], g = c.gs$cell.row - 1, k = c.gs$cell.col - 1, k >= i && k <= e && g >= f && g <= h) d[k - i][g - f] = c.content.$t; b.dataFound() })
    }, findHeaderRow: function () { m(this.columns, function () { }); this.headerRow = 0 }, trim: function (b) { return typeof b === "string" ? b.replace(/^\s+|\s+$/g, "") : b }, parseTypes: function () {
        for (var b =
this.columns, a = b.length, c, d, f, h; a--; ) for (c = b[a].length; c--; ) d = b[a][c], f = parseFloat(d), h = this.trim(d), h == f ? (b[a][c] = f, f > 31536E6 ? b[a].isDatetime = !0 : b[a].isNumeric = !0) : (d = this.parseDate(d), a === 0 && typeof d === "number" && !isNaN(d) ? (b[a][c] = d, b[a].isDatetime = !0) : b[a][c] = h === "" ? null : h)
    }, dateFormats: { "YYYY-mm-dd": { regex: "^([0-9]{4})-([0-9]{2})-([0-9]{2})$", parser: function (b) { return Date.UTC(+b[1], b[2] - 1, +b[3]) } } }, parseDate: function (b) {
        var a = this.options.parseDate, c, d, f; a && (c = a(b)); if (typeof b === "string") for (d in this.dateFormats) a =
this.dateFormats[d], (f = b.match(a.regex)) && (c = a.parser(f)); return c
    }, rowsToColumns: function (b) { var a, c, d, f, h; if (b) { h = []; c = b.length; for (a = 0; a < c; a++) { f = b[a].length; for (d = 0; d < f; d++) h[d] || (h[d] = []), h[d][a] = b[a][d] } } return h }, parsed: function () { this.options.parsed && this.options.parsed.call(this, this.columns) }, complete: function () {
        var b = this.columns, a, c, d = this.options, f, h, i, e, g, k; if (d.complete) {
            this.getColumnDistribution(); b.length > 1 && (a = b.shift(), this.headerRow === 0 && a.shift(), a.isDatetime ? c = "datetime" : a.isNumeric ||
(c = "category")); for (e = 0; e < b.length; e++) if (this.headerRow === 0) b[e].name = b[e].shift(); h = []; for (e = 0, k = 0; e < b.length; k++) { f = j.pick(this.valueCount.individual[k], this.valueCount.global); i = []; for (g = 0; g < b[e].length; g++) i[g] = [a[g], b[e][g] !== void 0 ? b[e][g] : null], f > 1 && i[g].push(b[e + 1][g] !== void 0 ? b[e + 1][g] : null), f > 2 && i[g].push(b[e + 2][g] !== void 0 ? b[e + 2][g] : null), f > 3 && i[g].push(b[e + 3][g] !== void 0 ? b[e + 3][g] : null), f > 4 && i[g].push(b[e + 4][g] !== void 0 ? b[e + 4][g] : null); h[k] = { name: b[e].name, data: i }; e += f } d.complete({ xAxis: { type: c },
    series: h
})
        } 
    } 
    }); j.Data = o; j.data = function (b, a) { return new o(b, a) }; j.wrap(j.Chart.prototype, "init", function (b, a, c) { var d = this; a && a.data ? j.data(j.extend(a.data, { complete: function (f) { a.series && m(a.series, function (b, c) { a.series[c] = j.merge(b, f.series[c]) }); a = j.merge(f, a); b.call(d, a, c) } }), a) : b.call(d, a, c) })
})(Highcharts);
