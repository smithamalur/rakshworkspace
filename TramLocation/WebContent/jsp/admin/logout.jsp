<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript">
 function signout()
 {
 
 
 
  <%
session.removeAttribute("name");
session.removeAttribute("id");


%> 
  window.top.navigate("/TramLocation/jsp/adminlogin.jsp");
 }

</script>
</head>
<body onload="signout()">
<% response.sendRedirect("/TramLocation/jsp/adminlogin.jsp");%>
</body>
</html>