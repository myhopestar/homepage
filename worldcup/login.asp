<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>世界杯互动系统-管理登录</title>
<link href="css/worldcup.css" rel="stylesheet" type="text/css"  />
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/worldcup.js"></script>
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
		<%
		response.cookies("UserName")=""
		response.Cookies("Password")=""
		if request("msg")="edituser" then response.Write("<div align=center>用户资料修改成功,请重新登录!</div>")
		if request("msg")="cookies" then response.Write("<div align=center>cookies已过期,请重新登录!</div>")
		if request("msg")="errpassword" then response.Write("<div align=center>请输入正确的用户名、密码以及验证码!</div>")
		if request("msg")="userexit" then response.Write("<div align=center>用户已成功退出系统!</div>")
		%>
		<hr />
		<form method="post" action="admin/chklogin.asp">
		<table border="1" width="500" bgcolor="#00FF99" align=center cellspacing="2" cellpadding="6">
		<tr>
			<td width="100%" align="center" height="40">
			<font size="4" color="#FFFFFF">后台管理登录</font></td>
		</tr>
		<tr>
			<td width="100%" align="center" height="166">
			<table border="0" width="300" cellpadding="6">
			<tr>
				<td align="right">用户名：</td>
				<td><input name="UserName" size="20" font face="宋体" style="font-size: 9pt"></td>
			</tr>
			<tr>
				<td align="right">密&nbsp; 码：</td>
  				<td><input type="password" name="Password" size="20" font face="宋体" style="font-size: 9pt"></td>
			</tr>
			<tr>
				<td align="right">验证码：</td>
				<td><%dim num1,rndnum
				Randomize
				Do While Len(rndnum)<4
				num1=CStr(Chr((57-48)*rnd+48))
				rndnum=rndnum&num1
				loop
				session("verifycode")=rndnum
				%>
				<input type="text" name="Verifycode" size="15" font face="宋体" style="font-size: 9pt">
				<b><span style="background-color: #FFFFFF"><font color=#000000><%=session("verifycode")%></font></span></b>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2">
				<p><input type="submit" name="Submit" value="登录"></p>
              	</td>
			</tr>
			</table>
		</tr>
		</table>
		</form>
	</div>
	<div id="footer"><%=bottom%></div>
</div>

<div id="backgound">
	<!--#include file="background.html" -->
</div>

</body>
</html>
<%response.write "<!-- " %>