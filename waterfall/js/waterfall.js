window.onload = function() {
	waterfall('wrap', 'box');
	var imgsrc = {
		'imgsrc': [{
			'src': '0.jpg'
		},
		{
			'src': '1.jpg'
		},
		{
			'src': '2.jpg'
		},
		{
			'src': '3.jpg'
		},
		{
			'src': '4.jpg'
		},
		{
			'src': '5.jpg'
		},
		{
			'src': '6.jpg'
		},
		{
			'src': '7.jpg'
		},
		{
			'src': '8.jpg'
		},
		{
			'src': '9.jpg'
		},
		{
			'src': '10.jpg'
		},
		{
			'src': '11.jpg'
		},
		{
			'src': '12.jpg'
		},
		{
			'src': '13.jpg'
		},
		{
			'src': '14.jpg'
		},
		{
			'src': '15.jpg'
		},
		{
			'src': '16.jpg'
		},
		{
			'src': '17.jpg'
		},
		{
			'src': '18.jpg'
		},
		{
			'src': '19.jpg'
		},
		{
			'src': '20.jpg'
		},
		{
			'src': '21.jpg'
		},
		{
			'src': '22.jpg'
		},
		{
			'src': '23.jpg'
		},
		{
			'src': '24.jpg'
		},
		{
			'src': '25.jpg'
		},
		{
			'src': '26.jpg'
		},
		{
			'src': '27.jpg'
		},
		{
			'src': '28.jpg'
		},
		{
			'src': '29.jpg'
		},
		{
			'src': '30.jpg'
		},
		{
			'src': '31.jpg'
		},
		{
			'src': '32.jpg'
		},
		{
			'src': '33.jpg'
		},
		{
			'src': '34.jpg'
		},
		{
			'src': '35.jpg'
		},
		{
			'src': '37.jpg'
		},
		{
			'src': '38.jpg'
		},
		{
			'src': '39.jpg'
		},
		{
			'src': '40.jpg'
		}]
	};
	window.onscroll = function() {
		if (checkScroll()) {
			for (var i = 0; i < imgsrc.imgsrc.length; i++) {
				var oparent = document.getElementById('wrap');
				var obox = document.createElement('div');
				obox.className = 'box';
				oparent.appendChild(obox);
				var oimg = document.createElement('img');
				oimg.src = 'images/' + imgsrc.imgsrc[i].src;
				obox.appendChild(oimg)
			}
			waterfall('wrap', 'box')
		}
	}
}
function waterfall(wrap, box) {
	var oparent = document.getElementById(wrap);
	var box = getElementByClass(oparent, box);
	var browserW = document.documentElement.clientWidth;
	var boxW = box[0].offsetWidth;
	var num = Math.floor(browserW / boxW);
	var wrapW = num * boxW + num * 10;
	oparent.style.cssText = "width:" + wrapW + "px;margin:0 auto;";
	var boxArr = [];
	for (var i = 0; i < box.length; i++) {
		if (i < num) {
			boxArr[i] = box[i].offsetHeight
		} else {
			var boxMinH = Math.min.apply(null, boxArr);
			var boxMinHindex = getMinHindex(boxMinH, boxArr);
			box[i].style.position = 'absolute';
			box[i].style.top = boxMinH + 5 + 'px';
			box[i].style.left = box[boxMinHindex].offsetLeft - 5 + 'px';
			boxArr[boxMinHindex] += box[i].offsetHeight += 5
		}
	}
}
function getElementByClass(parent, classname) {
	var oElements = parent.getElementsByTagName('*');
	var Elebox = new Array();
	for (var i = 0; i < oElements.length; i++) {
		if (oElements[i].className == classname) {
			Elebox.push(oElements[i])
		}
	};
	return Elebox
}
function getMinHindex(boxMinH, boxArr) {
	for (var i in boxArr) {
		if (boxArr[i] == boxMinH) {
			return i
		}
	}
}
function checkScroll() {
	var oparent = document.getElementById('wrap');
	var box = getElementByClass(oparent, 'box');
	var boxlast = box[box.length - 1];
	var boxlastH = boxlast.offsetTop - 500;
	var browerH = document.documentElement.clientHeight;
	var scrollH = document.body.scrollTop || document.documentElement.scrollTop;
	return (boxlastH < browerH + scrollH) ? true: false
}