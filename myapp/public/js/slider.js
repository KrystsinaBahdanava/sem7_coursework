$(document).ready(function () {
    var slider = $('#slider-holder')

    slider
        .jcarousel({
            wrap: 'both'
        })
        .jcarouselAutoscroll({
            interval: 3000,
            target: '+=1',
            autostart: true,
        })


    slider.on('jcarousel:scrollend', function (event, carousel) {
        var visibleSlide = $(carousel.visible()[0])
        var index = slider.find('li').index(visibleSlide)

        $('#slider-nav a').removeClass('active')
        $('#slider-nav a').eq(index).addClass('active')
    })

    var instance = slider.data('jcarousel')

    $('#slider-nav a').click(function () {
        var index = $(this).parent().find('a').index(this)

        instance.scroll(index)
    })
})
