class DataApi {
    constructor() {
        this.fullCountByDay();
    }

    fullCountByDay() {
        $.get("/full_count_by_day", data => {
            console.log(data);
            this.setupTimeseriesGraph(data);
        });
    }

    fullCountByMonth() {
        $.get("/full_count_by_month", data => {
            console.log(data);
            this.setupTimeseriesGraph(data);
        });
    }

    countByArea() {
        let geocode_tuple = [];
        let address = '';

        $.ajax({
                method: "POST",
                url: "/count_by_area",
                data: {
                    geocode_tuple: geocode_tuple,
                    address: address
                }
            })
            .done(function (data) {
                console.log(data);
            });
    }

    countByGroups() {
        let groups = ['case_summary'];

        $.ajax({
                method: "POST",
                url: "/count_by_groups",
                data: {
                    groups: groups
                }
            })
            .done(function (data) {
                console.log(data);
            });
    }

    countByDayAndGroups() {
        let groups = ['case_summary'];

        $.ajax({
                method: "POST",
                url: "/count_by_day_and_groups",
                data: {
                    groups: groups
                }
            })
            .done(function (data) {
                console.log(data);
            });
    }

    countByMonthAndGroups() {
        let groups = ['case_summary'];

        $.ajax({
                method: "POST",
                url: "/count_by_month_and_groups",
                data: {
                    groups: groups
                }
            })
            .done(function (data) {
                console.log(data);
            });
    }

    infoByGroups() {
        let groups = ['case_summary'];

        $.ajax({
                method: "POST",
                url: "/info_by_groups",
                data: {
                    groups: groups
                }
            })
            .done(function (data) {
                console.log(data);
            });
    }

    setupTimeseriesGraph(data) {
        var result = [];
        var month;
        var day;
        var year;
        var date;

        for (var i in data) {
            date = i.split('-');
            year = date[0];
            month = date[1] - 1;
            day = date[2];
            result.push([Date.UTC(year, month, day), data[i]]);
        }

        $(function () {
            $('#graph').highcharts({
                chart: {
                    zoomType: 'x',
                    style: {
                        fontFamily: "'Roboto', sans-serif"
                    }
                },
                title: {
                    text: 'Complaints logged in denver over time'
                },
                subtitle: {
                    text: document.ontouchstart === undefined ?
                        'Click and drag in the plot area to zoom in' : 'Pinch the chart to zoom in'
                },
                xAxis: {
                    type: 'datetime'
                },
                yAxis: {
                    title: {
                        text: 'Complaints Logged'
                    }
                },
                legend: {
                    enabled: false
                },
                plotOptions: {
                    area: {
                        fillColor: {
                            linearGradient: {
                                x1: 0,
                                y1: 0,
                                x2: 0,
                                y2: 1
                            },
                            stops: [
                                [0, Highcharts.getOptions().colors[0]],
                                [1, Highcharts.Color(Highcharts.getOptions().colors[0]).setOpacity(0).get('rgba')]
                            ]
                        },
                        marker: {
                            radius: 2
                        },
                        lineWidth: 1,
                        states: {
                            hover: {
                                lineWidth: 1
                            }
                        },
                        threshold: null
                    }
                },

                series: [{
                    type: 'area',
                    name: 'Complaints',
                    data: result
                }]
            });
        });
    }
}