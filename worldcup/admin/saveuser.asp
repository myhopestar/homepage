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
    <h2>修改密码</h2>
    <a href="../login.asp?msg=userexit">
      退出管理
    </a>
  </div>
<!--#include file="conn.asp" -->
<!--#include file=cookies.asp-->
<%
username=request("username")
password=request("newpassword")
if username="" or password="" then response.Redirect("edituser.asp?Msg=err") : response.End() '检查用户名及密码的合法性
'密码加密
mm=""
for i = 1 to len(password)
mm=mm & (asc(mid(password,i,1))+3)
next
'连接数据库
set rs=server.createobject("adodb.recordset")
sql="select * from admin where id=1" 
rs.open sql,conn,1,3
rs("username")=username
rs("password")=mm
rs.update
rs.close
set rs=nothing
%>
<table width='968px' border='0' align='center'>
  <tr>
    <td>
	  <p>&nbsp;</p>
	  <p align="center"><%=username%>密码修改成功,请重新登录<br />
      <a href="../login.asp?msg=edituser" target="_parent">确定</a></p>
    <p>&nbsp;          </p></td>
  </tr>
</table>
</main>
</body>
</html>
<%response.write "<!-- " %>