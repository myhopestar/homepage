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
<!--#include FILE="upload.inc"--> 
<!--#include file=cookies.asp-->
<html> 
<head> 
<title>文件上传</title> 
</head> 
<body> 
<% 
dim upload,file,formName,formPath 
set upload=new upload_5xSoft ''建立上传对象 
formPath=upload.form("filepath") ''在目录后加(/) 
if right(formPath,1)<>"/" then formPath=formPath&"/" 
for each formName in upload.file ''列出所有上传了的文件 
set file=upload.file(formName) ''生成一个文件对象 
if file.filename="" or len(file.filename)<5 then response.Write("<div align=center>未选择要上传的文件或文件错误!<br>[<a href=# onclick=history.go(-1)>重新上传</a>]</div>") : response.End()
filehsw=mid(file.filename,len(file.filename)-2,len(file.filename))
if filehsw<>"jpg" and filehsw<>"png" and filehsw<>"gif" and filehsw<>"bmp" then response.Write("<div align=center>只允许上传JPG、GIF、PNG、BMP类型的文件!<br>[<a href=# onclick=history.go(-1)>重新上传</a>]</div>") : response.End()
if file.filesize<100 then 
response.write "<font size=2>请先选择你要上传的文件[ <a href=# onclick=history.go(-1)>重新上传</a> ]</font>" 
response.end 
end if 
if file.filesize>500*1000 then '设置上传文件大小为500K 
response.write "<font size=2>文件大小超过了限制 500K[ <a href=# onclick=history.go(-1)>重新上传</a> ]</font>" 
response.end 
end if 
if file.FileSize>0 then ''如果 FileSize > 0 说明有文件数据 
file.SaveAs Server.mappath("..\images\"&file.FileName) ''保存文件 
filename=file.filename
end if 
set file=nothing 
next 
set upload=nothing 
response.write "<div align=center><font size=3>文件上传成功!路径为:images\" & FileName & "<br>复制路径并粘贴在图片路径处<br> [ <a href=# onclick=history.go(-1)>继续上传</a> ]</font></div>" 
%> 
</body> 
</html> 
</main>
</body>
</html>