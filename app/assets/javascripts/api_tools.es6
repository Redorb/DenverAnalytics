class ApiTools {
    static convertDateToUTC(dateStr) {
        let date = dateStr.split('-');
        let year = date[0];
        let month = date[1] - 1;
        let day;
        if (date.length == 3) {
            day = date[2]
        } else {
            day = 1;
        }
        return Date.UTC(year, month, day)

    }

    static getLegendColor() {
        // 30 random hues with step of 12 degrees
        var hue = Math.floor(Math.random() * 30) * 12;

        return $.Color({
            hue: hue,
            saturation: 0.9,
            lightness: 0.7,
            alpha: 0.5
        }).toHexString();
    }

    static getGroups() {
        let groups = [];
        $("#groupSelect option:enabled:selected").each(function() {
            groups.push($(this).val());
        });
        return groups;
    }

    static getLatLong() {
        return [$('#latitude').val(), $('#longitude').val()]
    }

    static getRadius() {
        return $('#radius').val();
    }

    static getAddress() {
        return $('#address').val();
    }
}