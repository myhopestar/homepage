<%
if request.Cookies("username")="" or request.Cookies("password")="" then
response.Redirect("../login.asp?msg=cookies")
response.End()
end if
%>