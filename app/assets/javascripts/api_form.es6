class ApiForm {
    constructor() {
        this.buildEvents();
    }

    buildEvents() {
        this.buildFormCreateEvents();
        this.buildRenderButtonEvent();
    }

    buildFormCreateEvents() {
        $("#querySelect").change((e) => {
            $('.graphInput').hide();
            let option = $(e.target).children(":selected")[0].id;
            if (option !== 'fullCountByDay' && option !== 'fullCountByMonth') {
                $('.groupSelectInput').show();
            }
            $(`.${option}`).show();
        });
    }

    buildRenderButtonEvent() {
        $('#renderGraph').click((e) => {
            e.preventDefault();
            $("#queryContainer").hide();
            $("#graphingContainer").show();
            let query = $("#querySelect option:selected").val();
            switch (query) {
                case "full_count_by_day":
                    DataApi.fullCountByDay();
                    break;
                case "full_count_by_month":
                    DataApi.fullCountByMonth();
                    break;
                case "count_by_area_with_address":
                    DataApi.countByAreaWithAddress();
                    break;
                case "count_by_area_with_lat_long":
                    DataApi.countByAreaWithLatLong();
                    break;
                case "count_by_groups":
                    DataApi.countByGroups();
                    break;
                case "count_by_day_and_groups":
                    DataApi.countByDayAndGroups();
                    break;
                case "count_by_month_and_groups":
                    DataApi.countByMonthAndGroups();
                    break;
                case "info_by_groups":
                    DataApi.infoByGroups();
                    break;
                default:
                    $("#graphingContainer").hide();
                    $("#queryContainer").show();
                    console.log("Invalid Selection");
            }
        });
    }
}