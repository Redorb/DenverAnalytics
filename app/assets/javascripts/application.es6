class Application {
    constructor() {
        this.apiForm = new ApiForm();
        this.setupMaterialize();
        this.setupNav();

    }

    setupMaterialize() {
        $(document).ready(function(){
            $('.parallax').parallax();
        });
        $(document).ready(function() {
            $('select').material_select();
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
            $('#queryContainer').show();
        });
    }
}

let app = new Application();
