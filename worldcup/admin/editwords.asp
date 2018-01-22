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
    <h2>留言管理</h2>
    <a href="../login.asp?msg=userexit">
      退出管理
    </a>
  </div>
<!--#include file="conn.asp" -->
<!--#include file=cookies.asp-->
<br />
<br />
<%
id=request("id")
set rs=server.CreateObject("adodb.recordset")
rs.open "select * from words where id=" & id,conn,1,3
words=rs("words")
rs.close
%>
<table align="center" width="968px" border="0">
<tr>
	<td align="center">
		<form method="post" action="savewords.asp?id=<%=id%>">
		<textarea name="words" cols="100%" rows="20"><%=words%></textarea><br />
		注:清空留言内容则为删除留言!<br />
		<input type="submit" value="保存" /></form>
	</td>
</tr>
</table>
</main>
</body>
</html>
<%response.write "<!-- " %>