<!--#include file=conn.asp-->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<%
words=request("words")
verifycode=request("verifycode")
if len(words)<5 then response.Write("<div align=center>你的留言内容太少了!<br>[<a href=# onclick=history.go(-2)>返回</a>]</div>") : response.End()
if len(words)>255 then response.Write("<div align=center>你的留言内容太多了!<br>[<a href=# onclick=history.go(-2)>返回</a>]</div>") : response.End()
if verifycode <> session("verifycode") then response.Write("<div align=center>验证码错误!<br>[<a href=# onclick=history.go(-2)>返回</a>]</div>") : response.End()
set rs=server.CreateObject("adodb.recordset")
rs.open "select * from words where id is null",conn,1,3
time1=now
ip=request.ServerVariables("REMOTE_ADDR")
rs.addnew array("ip","time","words"),array(ip,time1,words)
rs.update
rs.close
response.Write("<div align=center>留言发表成功!<br>[<a href=index.asp>确定</a>]</div>") : response.End()
%>