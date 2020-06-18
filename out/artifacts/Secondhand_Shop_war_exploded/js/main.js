jQuery(document).ready(function ($) {

    // jQuery sticky Menu

    $(".mainmenu-area").sticky({topSpacing: 0});
    $(document).ready(function () {
        $('ul.nav > li').click(function (e) {
            e.preventDefault();
            $('ul.nav > li').removeClass('active');
            $(this).addClass('active');
        });
    });
    $(document).ready(function () {
        $('div.list-group > a').click(function (e) {
            e.preventDefault();
            $('div.list-group > a').removeClass('active');
            $(this).addClass('active');
        });
    });
    var stars = [
        ['stars.png', 'stard.png', 'stard.png', 'stard.png', 'stard.png'],
        ['stars.png', 'stars.png', 'stard.png', 'stard.png', 'stard.png'],
        ['stars.png', 'stars.png', 'stars.png', 'stard.png', 'stard.png'],
        ['stars.png', 'stars.png', 'stars.png', 'stars.png', 'stard.png'],
        ['stars.png', 'stars.png', 'stars.png', 'stars.png', 'stars.png'],
    ];
    $("#stars").find("img").hover(function(e) {
        var obj = $(this);
        var index = obj.index();
        if(index < (parseInt($("#stars").attr("data-default-index")) -1)){
            return ;
        }
        var li = obj.closest("span");
        var star_area_index = li.index();
        for (var i = 0; i < 5; i++) {
            li.find("img").eq(i).attr("src", "../imgs/" + stars[index][i]);//切换每个星星
        }
    }, function() {
    })
    $("#stars").hover(function(e) {
    }, function() {
        var index = $(this).attr("data-default-index");//点击后的索引
        index = parseInt(index);
        $("#stars").find("img").attr("src","../imgs/stard.png");
        for (var i=0;i<index;i++){
            $("#stars").find("img").eq(i).attr("src","../imgs/stars.png");
        }
    })
    $("#stars").find("img").click(function() {
        var obj = $(this);
        var li = obj.closest("span");
        var star_area_index = li.index();
        var index1 = obj.index();
        li.attr("data-default-index", (parseInt(index1)+1));
        var index = $("#stars").attr("data-default-index");//点击后的索引
        index = parseInt(index);
        $("#stars").find("img").attr("src","../imgs/stard.png");
        for (var i=0;i<index;i++){
            $("#stars").find("img").eq(i).attr("src","../imgs/stars.png");
        }
    })
    //     loop:true,
    //     nav:true,
    //     margin:20,
    //     responsiveClass:true,
    //     responsive:{
    //         0:{
    //             items:1,
    //         },
    //         600:{
    //             items:3,
    //         },
    //         1000:{
    //             items:5,
    //         }
    //     }
    // });
    //
    // $('.related-products-carousel').owlCarousel({
    //     loop:true,
    //     nav:true,
    //     margin:20,
    //     responsiveClass:true,
    //     responsive:{
    //         0:{
    //             items:1,
    //         },
    //         600:{
    //             items:2,
    //         },
    //         1000:{
    //             items:2,
    //         },
    //         1200:{
    //             items:3,
    //         }
    //     }
    // });
    //
    // $('.brand-list').owlCarousel({
    //     loop:true,
    //     nav:true,
    //     margin:20,
    //     responsiveClass:true,
    //     responsive:{
    //         0:{
    //             items:1,
    //         },
    //         600:{
    //             items:3,
    //         },
    //         1000:{
    //             items:4,
    //         }
    //     }
    // });
    //
    //
    // // Bootstrap Mobile Menu fix
    // $(".navbar-nav li a").click(function(){
    //     $(".navbar-collapse").removeClass('in');
    // });
    //
    // // jQuery Scroll effect
    // $('.navbar-nav li a, .scroll-to-up').bind('click', function(event) {
    //     var $anchor = $(this);
    //     var headerH = $('.header-area').outerHeight();
    //     $('html, body').stop().animate({
    //         scrollTop : $($anchor.attr('href')).offset().top - headerH + "px"
    //     }, 1200, 'easeInOutExpo');
    //
    //     event.preventDefault();
    // });
    //
    // // Bootstrap ScrollPSY
    // $('body').scrollspy({
    //     target: '.navbar-collapse',
    //     offset: 95
    // })
});

