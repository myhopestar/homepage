var area = document.getElementById("scrollarea");
var area1 = document.getElementById("area1");
var area1Height = area1.offsetHeight;
var liHeight = area1.getElementsByTagName("li")[0].offsetHeight;
var change = document.getElementById("change");
area1.innerHTML += area1.innerHTML;
var conInterval,pauseInter,pauseTime;
var flag = true;
/*连续滚动*/
function continuous(){
	function scrollCon(){
		if(area.scrollTop >= area1Height){
			area.scrollTop = 1;
		}else{
			area.scrollTop++;
		};
	};
	conInterval = setInterval(scrollCon,50);
	area.onmouseenter = function(){
		clearInterval(conInterval);
	};
	area.onmouseleave = function(){
		conInterval = setInterval(scrollCon,50);
	};
};
/*间歇滚动*/
function pause(){
	function scrollPause(){
		pauseInter = setInterval(pauseUp,50);	
	};
	function pauseUp(){
		if(area.scrollTop % liHeight == 0){
			clearInterval(pauseInter);
			pauseTime = setTimeout(scrollPause,2000);
			area.scrollTop++;
		}else if(area.scrollTop >= area1Height){
			area.scrollTop = 1;
		}else{
			area.scrollTop++;
		};
	};
	pauseTime = setTimeout(scrollPause,2000);
};
pause();
change.onclick = function(){
	if(flag == true){
		flag = false;
		clearInterval(pauseInter);
		clearTimeout(pauseTime);
		continuous();
	}else{
		flag = true;
		clearInterval(conInterval);
		area.onmouseenter = null;
		area.onmouseleave = null;
		pause();
	};
};