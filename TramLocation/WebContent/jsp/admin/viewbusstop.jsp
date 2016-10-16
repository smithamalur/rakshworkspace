<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="color:#193A56 "     >

<h1 style="text-align: center;">Mysore City Bus Stops</h1>
<table border="3"  bordercolor="black" align="center">
<tr><th>Sl no</th><th>Stop Name</th></tr>

<%
try{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection connection = DriverManager.getConnection("jdbc:odbc:tram");
Statement stmt = connection.createStatement();

ResultSet buffer = stmt.executeQuery("SELECT * FROM Bus_stopss  ORDER BY bus_stop_name ");
int i=0;
while(buffer.next())
{
	i=i+1;
	String stopname = buffer.getString("bus_stop_name");
	%>
	<tr><td><%=i%></td><td><%=stopname%></td></tr>
	
	<%
	
	
}





}catch(Exception e)
{
	
}

%>
</table>


</body>
</html>