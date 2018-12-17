var fixmeTop = $('.fixme').offset().top;
$(window).scroll(function() {
    var currentScroll = $(window).scrollTop();
    if (currentScroll >= fixmeTop) {
        $('.fixme').css({
            position: 'fixed',
            top: '0'

        });
    } else {
        $('.fixme').css({
            position: 'static'
        });
    }
});

# another example
 $(window).scroll(function(){
     var scrollBottom = $(window).scrollTop() + $("formDesign").height();
    $("#fixedForm").css("bottom", Math.max(0, 250 - $(this).scrollBottom()));
    });