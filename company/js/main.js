function AddFavorite(sURL, sTitle) {
	sURL = encodeURI(sURL);
	try {
		window.external.addFavorite(sURL, sTitle)
	} catch(e) {
		try {
			window.sidebar.addPanel(sTitle, sURL, "")
		} catch(e) {
			alert("加入收藏失败，请使用Ctrl+D进行添加,或手动在浏览器里进行设置.")
		}
	}
}
function SetHome(url) {
	if (document.all) {
		document.body.style.behavior = 'url(#default#homepage)';
		document.body.setHomePage(url)
	} else {
		alert("您好,您的浏览器不支持自动设置页面为首页功能,请您手动在浏览器里设置该页面为首页!")
	}
}
var name_0 = 'word';
var cursel_0 = 1;
var ScrollTime = 3000;
var links_len, iIntervalId;
onload = function() {
	var links = document.getElementById("scollpic").getElementsByTagName('li');
	links_len = links.length;
	for (var i = 0; i < links_len; i++) {
		links[i].onmouseover = function() {
			clearInterval(iIntervalId);
			this.onmouseout = function() {
				iIntervalId = setInterval(Next, ScrollTime)
			}
		}
	}
	document.getElementById("scoll_" + name_0 + "_" + links_len).parentNode.onmouseover = function() {
		clearInterval(iIntervalId);
		this.onmouseout = function() {
			iIntervalId = setInterval(Next, ScrollTime)
		}
	};
	setTab(name_0, cursel_0);
	iIntervalId = setInterval(Next, ScrollTime)
}
function setTab(name, cursel) {
	cursel_0 = cursel;
	for (var i = 1; i <= links_len; i++) {
		var menu = document.getElementById(name + i);
		var menudiv = document.getElementById("scoll_" + name + "_" + i);
		if (i == cursel) {
			menu.className = "off";
			menudiv.style.display = "block"
		} else {
			menu.className = "";
			menudiv.style.display = "none"
		}
	}
}
function Next() {
	cursel_0++;
	if (cursel_0 > links_len) cursel_0 = 1;
	setTab(name_0, cursel_0)
}