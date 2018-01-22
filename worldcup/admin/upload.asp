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
<!--#include file=cookies.asp-->
<html> 
<head> 
<title>文件上传</title> 
</head> 
<body> 
<div align="center">上传文件(仅支持后缀为:JPG、GIF、PNG、BMP的图片文件)<br>
<form name="form" method="post" action="upfile.asp" enctype="multipart/form-data" >  
<input type="file" name="file1" size=10> 
<input type="submit" name="Submit" value="上传"> 
</form> 
</div>
</body> 
</html> 

</body> 
</html> 
</main>
</body>
</html>