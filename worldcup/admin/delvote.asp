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
    <h2>编辑球队</h2>
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
if len(id)=0 then response.Write("<div align=center><br><br>请从查看项目处点击要被删除的项目的名称,然后点击删除!<br><a href=main.asp>确定</a></div>") : response.End()
set rs=server.CreateObject("adodb.recordset")
rs.open "select * from vote where id=" & id,conn,1,3
username=rs("username")
rs.delete
rs.close
response.Write("<div align=center><br><br>删除 " & username & " 项目成功!<br><a href=main.asp>确定</a></div>")
%>
</main>
</body>
</html>
<%response.write "<!-- " %>