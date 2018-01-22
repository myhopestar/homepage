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
<%
on error resume next
id=request("id")
words=request("words")
set rs=server.CreateObject("adodb.recordset")
rs.open "select * from words where id=" & id,conn,1,3
if words="" then 
rs.delete
msg="删除"
else
rs("words")=words
msg="修改"
end if
rs.update
rs.close
if err.number<>0 then response.Write("<div align=center>" & err.description & "<br><a href=# onclick=history.go(-1)>返回</a></div>") :response.End()
response.Write("<div align=center>留言" & msg &"成功!<br><a href=words.asp>确定</a></div>")
%>
</main>
</body>
</html>
<%response.write "<!-- " %>