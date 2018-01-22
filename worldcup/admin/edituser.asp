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
<!--#include file=cookies.asp-->
<%
msg=request("msg")
if msg="err" then response.Write("<div align=center>用户名或密码输入有误!</div>")
username=session("username")
%>
<table width='905' border='0' align='center'>
  <tr>
    <td>
	<form method="post" action="saveuser.asp">
	  <div align="center">
	    <p>&nbsp;</p>
	    <p>用户名:
	      <input type="text" name="username" value="<%=username%>" />
	        <br />
	      新密码:
	      <input type="text" name="newpassword" value="" />
	      <br />
	      <input type="submit" value="修改" />
	      </p>
	    <p>&nbsp;</p>
	  </div>
	</form>
    </td>
  </tr>
</table>
</main>
</body>
</html>
<%response.write "<!-- " %>