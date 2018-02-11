"use strict";

jQuery(document).ready(function($){

	$(".myweb-header-navigation a, .responsive_menu a").click(function(){
		var id =  $(this).attr('class');
		id = id.split('-');
		$("#myweb-body .content").hide();
		$("#myweb-body #menu-"+id[1]).addClass("animated fadeInDown").show();
		$("#myweb-body .introduction").hide();
		$(".support").hide();
		$(".testimonials").hide();
		return false;
	});

	$( window ).load(function() {
	  $("#myweb-body .landscape").hide();
	});

	$(".myweb-header-navigation a.page-introduction").addClass('active');

	$(".myweb-header-navigation a.page-introduction, .responsive_menu a.page-introduction").click(function(){
		$("#myweb-body .introduction").addClass("animated fadeInDown").show();
		$(this).addClass('active');
		$(".myweb-header-navigation a.page-landscape, .responsive_menu a.page-landscape").removeClass('active');
		$(".myweb-header-navigation a.page-travel, .responsive_menu a.page-travel").removeClass('active');
		$(".myweb-header-navigation a.page-food, .responsive_menu a.page-food").removeClass('active');
		$(".myweb-header-navigation a.page-map, .responsive_menu a.page-map").removeClass('active');
		return false;
	});

	$(".myweb-header-navigation a.page-landscape, .responsive_menu a.page-landscape").click(function(){
		$("#myweb-body .landscape").addClass("animated fadeInDown").show();
		$(this).addClass('active');
		$(".myweb-header-navigation a.page-introduction, .responsive_menu a.page-introduction").removeClass('active');
		$(".myweb-header-navigation a.page-travel, .responsive_menu a.page-travel").removeClass('active');
		$(".myweb-header-navigation a.page-food, .responsive_menu a.page-food").removeClass('active');
		$(".myweb-header-navigation a.page-map, .responsive_menu a.page-map").removeClass('active');
		return false;
	});

	$(".myweb-header-navigation a.page-travel, .responsive_menu a.page-travel").click(function(){
		$("#myweb-body .travel").addClass("animated fadeInDown").show();
		$(".our-travel").show();
		$(this).addClass('active');
		$(".myweb-header-navigation a.page-landscape, .responsive_menu a.page-landscape").removeClass('active');
		$(".myweb-header-navigation a.page-introduction, .responsive_menu a.page-introduction").removeClass('active');
		$(".myweb-header-navigation a.page-food, .responsive_menu a.page-food").removeClass('active');
		$(".myweb-header-navigation a.page-map, .responsive_menu a.page-map").removeClass('active');
		return false;
	});

	$(".myweb-header-navigation a.page-food, .responsive_menu a.page-food").click(function(){
		$("#myweb-body .food").addClass("animated fadeInDown").show();
		$(".our-travel").show();
		$(this).addClass('active');
		$(".myweb-header-navigation a.page-landscape, .responsive_menu a.page-landscape").removeClass('active');
		$(".myweb-header-navigation a.page-travel, .responsive_menu a.page-travel").removeClass('active');
		$(".myweb-header-navigation a.page-introduction, .responsive_menu a.page-introduction").removeClass('active');
		$(".myweb-header-navigation a.page-map, .responsive_menu a.page-map").removeClass('active');
		return false;
	});

	$(".myweb-header-navigation a.page-map, .responsive_menu a.page-map").click(function(){
		$("#myweb-body .map").addClass("animated fadeInDown").show();
		$(this).addClass('active');
		$(".myweb-header-navigation a.page-landscape, .responsive_menu a.page-landscape").removeClass('active');
		$(".myweb-header-navigation a.page-travel, .responsive_menu a.page-travel").removeClass('active');
		$(".myweb-header-navigation a.page-food, .responsive_menu a.page-food").removeClass('active');
		$(".myweb-header-navigation a.page-introduction, .responsive_menu a.page-introduction").removeClass('active');
		
		return false;
	});

	$(".overlay").hide();

	$('.landscape-item').hover(
	  function() {
	    $(this).find('.overlay').addClass('animated fadeIn').show();
	  },
	  function() {
	    $(this).find('.overlay').removeClass('animated fadeIn').hide();
	  }
	);

	$(function(){
		$('[data-rel="lightbox"]').lightbox();
	});


	$("a.menu-toggle-btn").click(function() {
	  $(".responsive_menu").stop(true,true).slideToggle();
	  return false;
	});
 
    $(".responsive_menu a").click(function(){
		$('.responsive_menu').hide();
	});

});


function loadJScript() {
		var script = document.createElement("script");
		script.type = "text/javascript";
		script.src = "http://api.map.baidu.com/api?v=2.0&ak=6UtGzl3V2lLjqISGXjHiAdoDTWbTAs2P&callback=init";
		document.body.appendChild(script);
	}
function init() {
		var map = new BMap.Map("allmap");
		var point = new BMap.Point(120.039837,33.474395); 
		map.centerAndZoom(point,12);                 
		map.enableScrollWheelZoom();
	}  
	window.onload = loadJScript;
