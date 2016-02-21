class DataApi {
    constructor() {
        this.countByGroups();
    }

    fullCountByDay() {
        $.get("/full_count_by_day", data => {
            console.log(data);
            ApiGraph.fullCountByDayGraph(data);
        });
    }

    fullCountByMonth() {
        $.get("/full_count_by_month", data => {
            console.log(data);
            ApiGraph.fullCountByMonthGraph(data);
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
        let groups = ['case_status'];

        $.ajax({
                method: "POST",
                url: "/count_by_groups",
                data: {
                    groups: groups
                }
            })
            .done(function (data) {
                console.log(data);
                ApiGraph.countByGroupsGraph(data);
            });
    }

    countByDayAndGroups() {
        let groups = ['police_district'];

        $.ajax({
                method: "POST",
                url: "/count_by_day_and_groups",
                data: {
                    groups: groups
                }
            })
            .done(function (data) {
                console.log(data);
                ApiGraph.countByDayAndGroupsGraph(data);
            });
    }

    countByMonthAndGroups() {
        let groups = ['police_district'];

        $.ajax({
                method: "POST",
                url: "/count_by_month_and_groups",
                data: {
                    groups: groups
                }
            })
            .done(function (data) {
                console.log(data);
                ApiGraph.countByMonthAndGroupsGraph(data)
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
}