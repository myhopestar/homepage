document.onreadystatechange=function(){
	if(document.readyState=="complete"){
		document.getElementById("loading").style.display="none";
	};
};

window.onload = function(){
	var wrap = document.getElementById("wrap");
	var music = document.getElementById("music");
	var controlMusic = document.getElementById("controlMusic");
	var audio = document.getElementsByTagName("audio")[0];
	var page1 = document.getElementById("page1");
	var page2 = document.getElementById("page2");
	var page3 = document.getElementById("page3");

	/* music */
	audio.addEventListener("ended",function(){
		controlMusic.setAttribute("class","music_disk");
	},false);
	music.addEventListener("touchstart", function() {
		if(audio.paused){
			audio.play();
			//controlMusic.style.animationPlayState = "running";
			//controlMusic.style.webkitAnimationPlayState = "running";
			controlMusic.setAttribute("class","music-disk rotate");
		}else{
			audio.pause();
			//controlMusic.style.animationPlayState = "paused";
			//controlMusic.style.webkitAnimationPlayState = "paused";
			controlMusic.setAttribute("class","music_disk");
		};
	}, false);
	/* page 1 */
	setTimeout(function(){
		var redPacket = document.getElementById("redPacket");
		redPacket.style.display = "block";
		redPacket.addEventListener("touchstart",function(){
			page1.style.display = "none";
			page2.style.display = "block";
			page3.style.display = "block";
			page3.style.top = "100%";
			/* page 2 */
			setTimeout(function(){
				var fingerprintS = document.getElementById("fingerprint-S");
				var fingerprintB = document.getElementById("fingerprint-B");
				var happySpring = document.getElementById("happySpring");
				var dog = document.getElementById("dog");
				fingerprintB.style.display = "block";
				setTimeout(function(){
					fingerprintS.style.display = "block";
					setTimeout(function(){
						dog.style.display = "block";
						setTimeout(function(){
							happySpring.style.display = "block";
							setTimeout(function(){
								/* page3 */
								page2.setAttribute("class","page fadeout");
								page3.setAttribute("class","page fadein");
							},3000);
						},2500);
					},1500);
				},1000);
			},1000);
		});
	},1500);

}