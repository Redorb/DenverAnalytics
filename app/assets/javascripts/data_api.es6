class DataApi {
    constructor() {
        this.countByAreaWithAddress();
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

    countByAreaWithAddress() {
        let radius = 0.2;
        let address = '1144 Broadway, Denver, CO';

        $.ajax({
                method: "POST",
                url: "/count_by_area_with_address",
                data: {
                    radius: radius,
                    address: address
                }
            })
            .done(function (data) {
                console.log(data);
            });
    }

    countByAreaWithLatLong() {
        let radius = 0.2;
        let latitude = 39.74;
        let longitude = 104.99;

        $.ajax({
                method: "POST",
                url: "/count_by_area_with_address",
                data: {
                    radius: radius,
                    latitude: latitude,
                    longitude: longitude
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