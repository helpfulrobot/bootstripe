$(function () {
    var $display = [];
    $(window).resize(function () {
        if (!$display.length) { //try again we may have added it later.
            $display = $('#responsive div');
        }
        if ($display.length) {
            var vWidth = $(window).width();
            var vHeight = $(window).height();
            $display.text('w: ' + vWidth + 'px h: ' + vHeight + 'px');
        }
    }).resize();

    $(".dotdotdot").dotdotdot({watch: true});
});