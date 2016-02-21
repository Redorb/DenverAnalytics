class Application {
    constructor() {
        this.api = new DataApi();
        this.setupMaterialize();
        this.setupNav();

    }

    setupMaterialize() {
        $(document).ready(function(){
            $('.parallax').parallax();
        });
    }

    setupNav() {
        $('#nav-landing').click(() => {
            $('.page').hide();
            $('#landingContainer').show();
            $('.parallax').parallax();
        });
        $('#nav-graphing').click(() => {
            $('.page').hide();
            $('#graphingContainer').show();
        });
    }
}

let app = new Application();
