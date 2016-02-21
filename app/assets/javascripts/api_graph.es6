class ApiGraph {
    static dateGroupGraph(data) {
        let results = [];
        for (var i in data) {
            let result_data = [];
            let color = ApiTools.getLegendColor();
            for (var j in data[i]) {
                result_data.push([ApiTools.convertDateToUTC(j), data[i][j]])
            }
            results.push(
                {
                    name: i,
                    color: color,
                    data: result_data
                }
            );
        }

        $(function () {
            $('#graph').highcharts({
                chart: {
                    type: 'spline',
                    zoomType: 'xy'
                },
                title: {
                    text: 'Number of complaints per month by type'
                },
                subtitle: {
                    text: document.ontouchstart === undefined ?
                        'Click and drag in the plot area to zoom in' : 'Pinch the chart to zoom in'
                },
                xAxis: {
                    type: 'datetime',
                    dateTimeLabelFormats: { // don't display the dummy year
                        month: '%e. %b',
                        year: '%b'
                    },
                    title: {
                        text: 'Date'
                    },
                    minTickInterval: 3600 * 24 * 30 * 1000,
                    minRange: 3600 * 24 * 30 * 1000
                },
                yAxis: {
                    title: {
                        text: 'Complaints'
                    },
                    min: 0
                },
                tooltip: {
                    headerFormat: '<b>{series.name}</b><br>',
                    pointFormat: '{point.x:%e. %b}: {point.y}'
                },

                plotOptions: {
                    spline: {
                        marker: {
                            enabled: true
                        }
                    }
                },

                series: results
            });
        });
    }

    static fullCountByDayGraph(data) {
        let results = [];
        for (var i in data) {
            results.push([ApiTools.convertDateToUTC(i), data[i]]);
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
                    data: results
                }]
            });
        });
    }

    static fullCountByMonthGraph(data) {
        let results = [];
        for (var i in data) {
            results.push([ApiTools.convertDateToUTC(i), data[i]]);
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
                    minTickInterval: 3600 * 24 * 30 * 1000,
                    minRange: 3600 * 24 * 30 * 1000
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
                    data: results
                }]
            });
        });
    }

    static countByGroupsGraph(data) {
        let results = [];
        for (var i in data) {
            results.push([i, data[i]]);
        }

        $(function () {
            $('#graph').highcharts({
                chart: {
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false,
                    type: 'pie'
                },
                title: {
                    text: 'Complaints by Group'
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                            style: {
                                color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                            }
                        }
                    }
                },
                series: [{
                    name: 'Complaints by groups',
                    colorByPoint: true,
                    data: results
                }]
            });
        });
    }
}