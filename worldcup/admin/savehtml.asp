<!--#include file="conn.asp" -->
<!--#include file=cookies.asp-->
<%
top=request("top")
bottom=request("bottom")
set rs = server.CreateObject("adodb.recordset")
rs.open "select * from html where id=1",conn,1,3
rs("top")=top
rs("bottom")=bottom
rs.update
set rs=nothing
response.Redirect("html.asp?msg=save")
%>