<!DOCTYPE html>
<html>
<head>
<title>世界杯互动系统-后台管理</title>
<link rel="stylesheet" href="../css/admin.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>

<body>
<span class='bckg'></span>
<header>
<h1>后台管理</h1>
  <nav>
    <ul>
      <li>
        <a href="main.asp">编辑球队</a>      </li>
      <li>
        <a href="addvote.asp?id=">添加球队</a>      </li>
      <li>
        <a href="html.asp">页面布局</a>      </li>
      <li>
        <a href="words.asp">留言管理</a>      </li>
      <li>
        <a href="edituser.asp">修改密码</a>      </li>
      <li>
        <a href="about.asp">程序说明</a>      </li>
    </ul>
  </nav>
</header>
<main>
  <div class='title'>
    <h2>添加球队</h2>
    <a href="../login.asp?msg=userexit">
      退出管理
    </a>
  </div>
<br />
<br />
<!--#include file="conn.asp" -->
<!--#include file=cookies.asp-->
<%
id=request("id")
sum=0
if len(id)>0 then 
set rs=server.CreateObject("adodb.recordset")
rs.open "select * from vote where id=" & id,conn,1,3
username=rs("username")
sum=rs("sum")
description1=rs("description")
image=rs("image")
rs.close
end if
%>
<div align="center">
	<form method="post" action="savevote.asp">
	名称:
	<input type="text" name="username" value="<%=username%>" />(必填)<br />
	票数:
	<input type="text" name="sum" value="<%=sum%>" />(数字)<br />
	图片:
	<input type="text" name="image" value="<%=image%>" />(<a style="display:inline" href="upload.asp" target="_blank">上传</a>)<br />
	<input type="text" name="id" style="visibility:hidden" value="<%=id%>" /><br />
	详细介绍:(此处为html代码,可用函数名称（username）、得票数（sum）、图片（image）)<br />
	<textarea name="description1" cols="100%" rows="20"><%=description1%></textarea><br />
	<input type="submit" value="保存" /> <a href="delvote.asp?id=<%=id%>" title="不进行确认,请谨慎使用!">删除</a>
	</form>
</div>
</main>
</body>
</html>
<%response.write "<!-- " %>