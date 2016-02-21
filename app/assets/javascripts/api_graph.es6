class ApiGraph {
    static fullCountByDayGraph(data) {
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

    static fullCountByMonthGraph(data) {
        var result = [];
        var month;
        var day;
        var year;
        var date;

        for (var i in data) {
            date = i.split('-');
            year = date[0];
            month = date[1] - 1;
            day = 1;
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
                    type: 'datetime',
                    minTickInterval: 3600*24*30*1000,
                    minRange: 3600*24*30*1000
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