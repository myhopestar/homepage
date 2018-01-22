<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>世界杯管理系统-关于</title>
<link href="css/worldcup.css" rel="stylesheet" type="text/css" />
</head>

<body>
	<div id="containers">
		<div id="head">
			<!--#include file="conn.asp" -->
			<%set rs=server.CreateObject("adodb.recordset")%>
			<%=top%>
			<ul id="nav">
				<li><a href="index.asp">系统首页</a></li>
        		<li><a href="result.asp">投票查询</a></li>
       		 	<li><a href="about.asp">系统说明</a></li>
        		<li><a href="login.asp">后台登录</a></li>
   			 </ul>	
		</div>
		<div id="body">
			<hr />
			<div id="words">
<p align="center">系统名称:世界杯互动系统</p>
<p align="center">主要功能：为你喜欢的球队投票，留言互动</p>
<p align="center">系统制作时间:2014年6月11日</p>
<p align="center">系统作者:邢晟乾</p>
<p align="center">指导老师：李显峰</p>
<p align="center">说明：该系统原为个人综合课程设计，毕业后又进行了大量的修改</p>
<p align="center">后台登录名：hopestar,密码：hopestars</p>
			</div>
		</div>
		<div id="footer"><%=bottom%></div>
	</div>
	
	<div id="backgound">
		<!--#include file="background.html" -->
	</div>

</body>
</html>
<%response.write "<!-- " %>
