$(document).ready(function () {

    var default_image = 'index/images/mywebs/default.jpg';
    var default_caption = 'Welcome to my homepage!';
	var default_link = 'javascript:void(0)';

    loadPhoto(default_image, default_caption, default_link);


    function loadPhoto($url, $caption, $link) {


        showPreloader();
        var img = new Image();
        jQuery(img).load(function () {
            jQuery(img).hide();
            hidePreloader();

        }).attr({ "src": $url });

        $('#largephoto').css('background-image', 'url("' + $url + '")');
        $('#largephoto').data('caption', $caption);
		$('#largephoto a').attr("href",$link);
    }


    $('.thumb_container').hover(function () {

        var handler = $(this).find('.large_image');
        var newsrc = handler.attr('src');
        var newcaption = handler.attr('rel');
		var newlink = handler.attr('alt');
        loadPhoto(newsrc, newcaption, newlink);

    });

    $('#largephoto').hover(function () {

        var currentCaption = ($(this).data('caption'));
        var largeCaption = $(this).find('#largecaption');

        largeCaption.stop();
        largeCaption.css('opacity', '0.9');
        largeCaption.find('.captionContent').html(currentCaption);
        largeCaption.fadeIn()



        largeCaption.find('.captionShine').stop();
        largeCaption.find('.captionShine').css("background-position", "-550px 0");
        largeCaption.find('.captionShine').animate({ backgroundPosition: '550px 0' }, 700);

       // Cufon.replace('.captionContent');


    },

    function () {
        var largeCaption = $(this).find('#largecaption');
        largeCaption.find('.captionContent').html('');
        largeCaption.fadeOut();

    });


    $('.thumb_container').hover(function () {
        $(this).find(".large_thumb").stop().animate({ marginLeft: -7, marginTop: -7 }, 200);
        $(this).find(".large_thumb_shine").stop();
        $(this).find(".large_thumb_shine").css("background-position", "-99px 0");
        $(this).find(".large_thumb_shine").animate({ backgroundPosition: '99px 0' }, 700);

    }, function () {
        $(this).find(".large_thumb").stop().animate({ marginLeft: 0, marginTop: 0 }, 200);
    });

    function showPreloader() {
        $('#loader').css('background-image', 'url("images/interface/loader.gif")');
    }

    function hidePreloader() {
        $('#loader').css('background-image', 'url("")');
    }

});