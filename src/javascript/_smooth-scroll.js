// http://www.paulund.co.uk/smooth-scroll-to-internal-links-with-jquery
$(document).ready(function(){
    $('a[data-scroll]').on('click',function (e) {
        e.preventDefault();

        var $target = $($(this).data("scroll"));

        $('html, body').stop().animate({
            'scrollTop': $target.offset().top
        }, 900, 'swing');
    });
});