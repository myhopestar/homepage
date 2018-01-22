document.onreadystatechange=function(){
	if(document.readyState=="complete"){
		$("#loading").fadeOut();
		$("nav").css("display","block");
		$("body").snowfall({
			image: "index/images/flower.png",
			flakeCount:30,
			minSize: 8,
			maxSize: 20
		});
	};
}