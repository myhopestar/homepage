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
<table align="center" width=968px border=0 cellpadding="1" cellspacing="1" bordercolor="#FF0000" bordercolordark="#FF0000" bordercolorlight="#FF0000">
		<%
		set rs2=server.CreateObject("adodb.recordset")
		rs2.open "select * from words",conn,adopenforwardonly
		l=0
		do while not rs2.eof
		l=l+1
		response.Write("<tr valign=middle><td bordercolor=#99CCCC><hr /><font color=#FF0000 size=4><b>" & l & "</b></font><font size=2>楼 游客IP:" & rs2("ip") & " 留言时间:" & rs2("time") & " 留言内容↓</font><font color=#FF0000><a href=editwords.asp?id=" & rs2("id") & "><b>编辑</b></a></font><hr></td></tr><tr valign=middle><td bordercolor=#99CCCC align=center><textarea cols=130 rows=3 style=border:hidden;background-color:#99CCCC;color:#333333 readonly=readonly>" & rs2("words") & "</textarea></td></tr>")
		rs2.movenext
		loop
		rs2.close
		%>
</table>
</main>
</body>
</html>
<%response.write "<!-- " %>