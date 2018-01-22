<%
StrSQL="DBQ="+server.mappath("../data.mdb")+";DRIVER={Microsoft Access Driver (*.mdb)};"
set conn=server.createobject("ADODB.CONNECTION")
conn.open StrSQL
%>