<!--#include file=conn.asp-->
<%
id=request("id")
set rs=server.CreateObject("adodb.recordset")
sql="select * from vote where id=" & id
rs.open sql,conn,1,3
sum=rs("sum")
rs("sum")=sum+1
rs.update
response.Redirect("Msg.asp?Msg=" & "投票成功!" & rs("username") & "总票数上涨至:" & rs("sum"))
%>