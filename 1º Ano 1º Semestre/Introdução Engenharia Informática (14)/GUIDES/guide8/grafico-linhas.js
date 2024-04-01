function desenhaGrafico() {
    $("#grafico-linhas").highcharts({
    chart: { type: "line" },
    title: { text: "Média de temperaturas" },
    xAxis: { categories: ["Jan", "Fev", "Mar", "Abr", "Mai", "Jun",
    "Jul", "Ago", "Set", "Out", "Nov", "Dez"]
    },
    series:[
    { name: "Lisboa",
    data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
    },
    { name: "Aveiro",
    data: [7.0, 6.9, 9.5, 1.5, 8.2, 21.5, 15.2, 16.5, 13.3, 18.3, 13.9, 9.6]

    },
]
});
};
var ctx = document.getElementById("grafico-linhas").getContext("2d");
var myBar = new Chart(ctx).Bar(chartData, {
    showTooltips: false,
    onAnimationComplete: function () {

        var ctx = this.chart.ctx;
        ctx.font = this.scale.font;
        ctx.fillStyle = this.scale.textColor
        ctx.textAlign = "center";
        ctx.textBaseline = "bottom";

        this.datasets.forEach(function (dataset) {
            dataset.bars.forEach(function (bar) {
                ctx.fillText(bar.value, bar.x, bar.y - 5);
            });
        })
    }
});