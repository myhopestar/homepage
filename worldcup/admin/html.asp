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
    <h2>页面布局</h2>
    <a href="../login.asp?msg=userexit">
      退出管理
    </a>
  </div>
<br />
<br />
<!--#include file="conn.asp" -->
<!--#include file=cookies.asp-->
<%
msg=request("msg")
if msg="save" then response.Write("<div align=center><font color=#FF0000 size=4><b>页面布局修改成功!</b></font></div>")
set rs2=server.CreateObject("adodb.recordset")
rs2.open "select * from html",conn,1,1
top=rs2("top")
bottom=rs2("bottom")
rs2.close
%>
<table align="center" border="0" width="968px">
<tr>
<td><div align="center"><form method="post" action="savehtml.asp">
	头部HTML：<br /><textarea name="top" cols="100%" rows="8"><%=top%></textarea><br />
	底部HTML：<br /><textarea name="bottom" cols="100%" rows="8"><%=bottom%></textarea><br />
	<input type="submit" value="保存" /></form></div>
</td>
</tr>
</table>
	
</main>
</body>
</html>
<%response.write "<!-- " %>