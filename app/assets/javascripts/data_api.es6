class DataApi {
    static fullCountByDay() {
        $.get("/full_count_by_day", data => {
            console.log(data);
            ApiGraph.fullCountByDayGraph(data);
        });
    }

    static fullCountByMonth() {
        $.get("/full_count_by_month", data => {
            console.log(data);
            ApiGraph.fullCountByMonthGraph(data);
        });
    }

    static countByAreaWithAddress() {
        let radius = ApiTools.getRadius();
        let address = ApiTools.getAddress();
        let groups = ApiTools.getGroups();

        $.ajax({
                method: "POST",
                url: "/count_by_area_with_address",
                data: {
                    radius: radius,
                    address: address,
                    groups: groups
                }
            })
            .done(function (data) {
                console.log(data);
                ApiGraph.dateGroupGraph(data);
            });
    }

    static countByAreaWithLatLong() {
        let radius = ApiTools.getRadius();
        let latLong = ApiTools.getLatLong();
        let groups = ApiTools.getGroups();

        $.ajax({
                method: "POST",
                url: "/count_by_area_with_lat_long",
                data: {
                    radius: radius,
                    latitude: latLong[0],
                    longitude: latLong[1],
                    groups: groups
                }
            })
            .done(function (data) {
                console.log(data);
                ApiGraph.dateGroupGraph(data);
            });
    }

    static countByGroups() {
        let groups = ApiTools.getGroups();

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

    static countByDayAndGroups() {
        let groups = ApiTools.getGroups();

        $.ajax({
                method: "POST",
                url: "/count_by_day_and_groups",
                data: {
                    groups: groups
                }
            })
            .done(function (data) {
                console.log(data);
                ApiGraph.dateGroupGraph(data);
            });
    }

    static countByMonthAndGroups() {
        let groups = ApiTools.getGroups();

        $.ajax({
                method: "POST",
                url: "/count_by_month_and_groups",
                data: {
                    groups: groups
                }
            })
            .done(function (data) {
                console.log(data);
                ApiGraph.dateGroupGraph(data);
            });
    }

    static infoByGroups() {
        let groups = ApiTools.getGroups();

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