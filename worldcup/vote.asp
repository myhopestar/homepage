<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>世界杯互动系统-投票页面</title>
<link href="css/worldcup.css" rel="stylesheet" type="text/css"  />
</head>

<body>
<div id="containers">
	<div id="head">
			<!--#include file="conn.asp" -->
			<%set rs=server.CreateObject("adodb.recordset")%>
			<%=top%>
	</div>
	<div id="body">
		<!--#include file=conn.asp-->
		<%
		id=request("id")
		set rs=server.CreateObject("adodb.recordset")
		sql="select * from vote where id=" & id
		rs.open sql,conn,1,3
		image=rs("image")
		username=rs("username")
		sum=rs("sum")
		description1=rs("description")
		rs.close
		%>
		<hr />
		<table align="center" width="900" border="0">
		<tr>
			<td><a href="vote2.asp?id=<%=id%>" target="_parent" title="点击为<%=username%>投一票哦">
			<img src="images/vote1.gif" alt="点击为<%=username%>投一票哦" width="120" height="30" border="0"/></a></td>
			<td align="right"><a href="javascript:history.go(-1)">
			<img src="images/vote2.gif" alt="返回" width="120" height="30" border="0" title="返回" /></a></td>
		</tr>
		</table>
		<hr />
		<img src=<%=image%> title=<%=username%> alt=<%=username%> style="float:left;"/>
		<font color="#33FFCC" size="3"><%=username%>,总票数:</font>
		<font color="#FF0000" size="3"><%=sum%></font><br />
		<font color="#33FFCC" size="3"><%=description1%></font>
		<div align="center">
		<p>&nbsp;</p>
		<p><a href="vote2.asp?id=<%=id%>" target="_parent" title="点击为<%=username%>投一票哦">
		<img src="images/vote3.gif" alt="点击为<%=username%>投一票哦" width="120" height="30" border="1"/></a></p>
		</div>
	</div>
	<div id="footer"><%=bottom%></div>
</div>
<div id="backgound">
	<!--#include file="background.html" -->
</div>
</body>
</html>
<%response.write "<!-- " %>