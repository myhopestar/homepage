<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>世界杯投票系统-查看投票结果</title>
<link href="css/worldcup.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script> 
<script type="text/javascript" src="js/highcharts.js"></script>
</head>

<body>
	<div id="containers">
		<div id="head">
			<!--#include file="conn.asp" -->
			<%set rs=server.CreateObject("adodb.recordset")%>
			<%=top%>
		</div>
		<div id="container">
		<!--#include file=conn.asp-->
		<%
		set rs=server.CreateObject("adodb.recordset")
		rs.open "select * from vote",conn,adopenforwardonly
		do while not rs.eof
		zsum=zsum+rs("sum")
		rs.movenext
		loop
		rs.movefirst
		%>
		<%
		set rs2=server.CreateObject("adodb.recordset")
		rs2.open "select * from vote",conn,adopenforwardonly
		do while not rs2.eof
		zsum=zsum+rs2("sum")
		rs2.movenext
		loop
		rs2.movefirst
		%>
		<%
		set rs3=server.CreateObject("adodb.recordset")
		rs3.open "select * from vote",conn,adopenforwardonly
		do while not rs3.eof
		zsum=zsum+rs3("sum")
		rs3.movenext
		loop
		rs3.movefirst
		%>
<script language="JavaScript">
$(document).ready(function() {  
   var chart = {
      zoomType: 'xy'
   };
   var subtitle = {
      text: '图表可以鼠标框选进行缩放'   
   };
   var title = {
      text: '各球队实时得票数'   
   };
   var xAxis = {
      categories: [<%
			do while not rs.eof
			response.Write("'" & rs("username") &"',")
			rs.movenext
			loop
			%>
],
      crosshair: true

   };
   var yAxis= [{ // 第一条Y轴
      labels: {
         format: '{value}%',
         style: {
            color: Highcharts.getOptions().colors[1]
         }
      },
      title: {
         text: '占总票数的百分比',
         style: {
            color: Highcharts.getOptions().colors[1]
         }
      }
   }, { // 第二条Y轴
      title: {
         text: '得票数',
         style: {
            color: Highcharts.getOptions().colors[0]
         }
      },
      labels: {
         format: '{value} 票',
         style: {
            color: Highcharts.getOptions().colors[0]
         }
      },
      opposite: true
   }];
   var tooltip = {
      shared: true
   };
   var legend = {
      layout: 'vertical',
      align: 'left',
      x: 600,
      verticalAlign: 'top',
      y: 5,
      floating: true,
      backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
   };
   var series= [{         name: '得票数',
            type: 'column',
            yAxis: 1,
            data: [<%
		do while not rs2.eof
		response.Write(" " & rs2("sum") &",")
		rs2.movenext
		loop
		%>],
            tooltip: {
                valueSuffix: ' 票'
            }

         }, {
            name: '占总票数的百分比',
            type: 'spline',
            data: [<%
		do while not rs3.eof
		bfb=rs3("sum")/zsum * 100
		if mid(bfb,1,1)="." then bfb="0" & bfb
		response.Write(" " & clng(bfb) &",")
		rs3.movenext
		loop
		%>],
            tooltip: {
                valueSuffix: '%'
           }
        }
   ]; 
      
      
   var json = {};   
   json.chart = chart;   
   json.title = title;
   json.subtitle = subtitle;      
   json.xAxis = xAxis;
   json.yAxis = yAxis;
   json.tooltip = tooltip;  
   json.legend = legend;  
   json.series = series;
   $('#container').highcharts(json);  
});
</script>
</div>
<div id="footer"><%=bottom%></div>
</div>
<div id="backgound">
	<!--#include file="background.html" -->
</div>

</body>
</html>
<%response.write "<!-- " %>
