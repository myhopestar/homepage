<%
StrSQL="DBQ="+server.mappath("data.mdb")+";DRIVER={Microsoft Access Driver (*.mdb)};"
set conn=server.createobject("ADODB.CONNECTION")
conn.open StrSQL
set rs2=server.CreateObject("adodb.recordset")
rs2.open "select * from html",conn,1,1
top=rs2("top")
bottom=rs2("bottom")
rs2.close
%>