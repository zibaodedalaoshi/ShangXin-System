<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
  session.removeAttribute("user");
  out.println("<script>window.location.href='Login_Signup.jsp'</script>");
%>
</body>
</html>