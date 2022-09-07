$(function(){
	/*page height*/
	var navigatorH = document.documentElement.clientHeight  || document.body.clientHeight;
	var navigatorW = document.documentElement.clientWidth  || document.body.clientWidth;
	$("#introduction,#work,#project,#network,#web_developer,#contact").css("height",navigatorH+"px");
	/*tab height*/
	if(navigatorH>navigatorW){
		$("#netTab,#webTable").css("height",navigatorW*0.8+"px");
		$("#netTab,#webTable").css("width",navigatorW*0.8+"px");
	}else{
		$("#netTab,#webTable").css("height",navigatorH*0.8+"px");
		$("#netTab,#webTable").css("width",navigatorH*0.8+"px");
	};
	/*page load*/
	var netflag=false,webflag=false;
	window.onscroll = function(){
		var scrollH = document.documentElement.scrollTop || document.body.scrollTop;
		if(navigatorH*0.5>scrollH){
			/*introduction load*/
			$("h1 a").removeClass("titleactive");
			$("#introduction h1 a").addClass("titleactive");
			netflag=false,webflag=false;
		}else if(navigatorH*1.5>scrollH&&scrollH>=navigatorH*0.5){
			/*work load*/
			$("h1 a").removeClass("titleactive");
			$("#work h1 a").addClass("titleactive");
			netflag=false,webflag=false;
		}else if(navigatorH*2.5>scrollH&&scrollH>=navigatorH*1.5){
			/*project load*/
			$("h1 a").removeClass("titleactive");
			$("#project h1 a").addClass("titleactive");
			netflag=false,webflag=false;
		}else if(navigatorH*3.5>scrollH&&scrollH>=navigatorH*2.5){
			/*network load*/
			$("h1 a").removeClass("titleactive");
			$("#network h1 a").addClass("titleactive");
			if(netflag==false){
				nettable();
				netflag=true;
			};
			webflag=false;
		}else if(navigatorH*4.5>scrollH&&scrollH>=navigatorH*3.5){
			/*web_developer load*/
			$("h1 a").removeClass("titleactive");
			$("#web_developer h1 a").addClass("titleactive");
			if(webflag==false){
				webtable();
				webflag=true;
			};
			netflag=false;
		}else{
			/*contact load*/
			$("h1 a").removeClass("titleactive");
			$("#contact h1 a").addClass("titleactive");
			netflag=false,webflag=false;
		};
	};
});
/*web table*/
function webtable() {  
	var chart = {      
		type: 'pie',     
		options3d: {
			enabled: true,
			alpha: 45,
			beta: 0
		},
		backgroundColor:'#CCFFCC'
	};
	var title = {
		text: ''   
	};   
	var tooltip = {		
		formatter: function(){
			var tiptext;
			switch (this.y){
				case 5:tiptext="掌握信道、传输介质、数据编码、数字调制等技术<br />熟悉通信和交换方式、多路复用技术、差错控制";
				break;
				case 2:tiptext="掌握公共交换电话网、X.25公共数据网、帧中继网、ISDN和ATM的基本知识";
				break;
				case 25:tiptext="掌握逻辑链路控制、介质访问控制技术<br />熟练掌握IEEE802.3标准、局域网、城域网、无线网相关技术";
				break;
				case 30:tiptext="熟练掌握IP协议、ICMP协议、TCP和UDP协议<br />熟练掌握域名、网关、各类路由与交换技术<br />掌握IP QOS、IPV6等技术";
				break;
				case 8:tiptext="掌握数据认证、加密、数字证书等技术<br />掌握虚拟专用网、防火墙、病毒防护、入侵检测等相关知识";
				break;
				case 11:tiptext="能够独立完成IIS、DNS、DHCP等服务器的搭建与配置<br />了解活动目录（AD）的常见操作和配置";
				break;
				case 12:tiptext="熟悉多种网络管理、诊断、配置、监控工具";
				break;
				case 7:tiptext="掌握结构化布线系统<br />熟知网络分析和设计过程";
				break;
			};
			return '<span style="color:'+this.series.color+'">'+tiptext+'</span>';
		}
	};
	var plotOptions = {
		pie: {
		allowPointSelect: true,
		cursor: 'pointer',
		depth: 35,
		dataLabels: {
			enabled: true,
			format: '{point.name}'
		}
		}
	};  
	var series= [{
		type: 'pie',
		name: '技能比例：',
		data: [
			['数据通信',5],
			['广域网通信',2],
			{
				name: '局域网与城域网',
				y:25,
				sliced: true,
				selected: true
			},
			['互联网',30],
			['网络安全',8],
			['网络操作系统与应用服务器配置',11],
			['网络管理',12],
			['网络规划和设计',7]
		]
	}];    
	var json = {};   
	json.chart = chart; 
	json.title = title;       
	json.tooltip = tooltip; 
	json.plotOptions = plotOptions; 
	json.series = series;   
	$('#webTable').highcharts(json);
};
/*network table*/
function nettable(){
	Highcharts.data({
		csv: document.getElementById('netTabData').innerHTML,
		parsed: function(){
			var categorysData=[{drilldown:"路由",name:"路由",y:30},{drilldown:"交换",name:"交换",y:40},{drilldown:"安全",name:"安全",y:20},{drilldown:"其他",name:"其他",y:10}];
			var skillLists=[{data:[["RIP",3.6],["EIGRP",6.4],["OSPF",9.0],["ISIS",1.8],["BGP",3.2],["PBR",2.7],["HSRP VRRP GLBP",3.3]],id:"路由",name:"路由"},{data:[["VLAN",19.9],["VTP",8],["STP",12.1]],id:"交换",name:"交换"},{data:[["VPN",5],["port security",4.5],["dhcp snooping",5.8],["root guard",4.7]],id:"安全",name:"安全"},{data:[["QOS",2.9],["wireless",4.3],["VOIP",2.8]],id:"其他",name:"其他"}];
			var chart = {
				type: 'pie',
				backgroundColor:'#00bcd4'
			};
			var title = {
				text: ''   
			};    
			var xAxis = {
				type: 'category'      
			};
			var yAxis ={
				title: {
					text: 'Total skill percent'
				}
			};  
			var tooltip = {
				formatter: function(){
					var tiptext;
					switch (this.y){
						case 3.6:tiptext="熟练掌握RIP协议的算法，等开销负载均衡、<br />认证、汇总、缺省、单播和被动的配置和<br />排错";
						break;
						case 6.4:tiptext="熟练掌握EIGRP的核心机制，能够熟练的<br />完成EIGRP在WAN广域网下的部署，精通<br />EIGRP单播邻居、被动接口、认证、汇总<br />和缺省的配置和排错";
						break;
						case 9.0:tiptext="熟练掌握OSPF协议的特点、SPF算法。<br />精通OSPF区域划分、OSPF网络的优化、<br />路由选型、缺省的配置和排错";
						break;
						case 1.8:tiptext="掌握ISIS协议的基础配置、ISIS的区域划分、<br />DIS选择、ISIS的认证的配置";
						break;
						case 3.2:tiptext="掌握BGP协议的特点、基础配置、防环机制、<br />选路进程、汇总、路由惩罚和后门路由、<br />认证的配置";
						break;
						case 2.7:tiptext="掌握路由重发布、路由控制、PBR、<br />路径优选的原理和配置";
						break;
						case 3.3:tiptext="熟练掌握网络冗余的设计，电源冗余、<br />引擎冗余、网关冗余的配置";
						break;
						case 8.0:tiptext="熟练掌握使用VTP完成网络中VLAN信息的<br />通告及相关问题的处理";
						break;
						case 19.9:tiptext="精通使用VLAN划分网络及网络管理";
						break;
						case 12.1:tiptext="熟练掌握STP的原理、选取过程，RSTP、<br />MSTP、etherchannel的配置及排错";
						break;
						case 5.0:tiptext="理解IPSEC VPN,MPLS VPN的原理及配置";
						break;
						case 4.5:tiptext="熟练使用port security<br />来管理网络设备的接入";
						break;
						case 5.8:tiptext="熟练掌握dhcp欺骗攻击的防御方法";
						break;
						case 4.7:tiptext="熟练掌握网络中根交换机的配置和防护";
						break;
						case 2.9:tiptext="掌握QOS三种服务模型的原理及配置";
						break;
						case 4.3:tiptext="掌握传统无线网络、华为云无线网络的规划、<br />配置及优化";
						break;
						case 2.8:tiptext="掌握阿卡特IP电话的配置、管理和排错；<br />掌握华为IP话机的管理；<br />掌握思科、POLYCOM视频会议的管理和日常维护";
						break;
						default:tiptext="点击查看详情";
					};
					return '<div style="color:'+this.series.color+';">'+tiptext+'</div>';	
				}
			};   
			var credits = {
				enabled: false
			};
			var series= [{
				name: '',
				colorByPoint: true,
				data: categorysData
			}];
			var drilldown= {
				series: skillLists
			}   
			var json = {};   
			json.chart = chart; 
			json.title = title;   
			json.xAxis = xAxis;
			json.yAxis = yAxis;   
			json.tooltip = tooltip;   
			json.credits = credits;
			json.series = series;
			json.drilldown = drilldown;
			$('#netTab').highcharts(json);
		}
	});
};
