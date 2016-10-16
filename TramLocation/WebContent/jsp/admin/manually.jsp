<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
 <script type="text/javascript">
 function valid()
 {
 
  var ob=this.document.busstops;


  if(ob.latlon.value == "")
  {
   alert('Enter lattiude and longitude  for example:(12.909246,76.389326)!');
   ob.latlon.focus();
   return false;
  }
  if(ob.stopname.value == "")
  {
   alert('Enter bus stop !');
   ob.radius.focus();
   return false;
  }
  

  
}
</script>
        
<body>


    
   <form name="busstops"  onsubmit="return valid();" action="manually.jsp">
   <table align="center">
   
   
    
  
  
  <tr><td><h1>Add Bus Stops Manually</h1></td><td></td>   </tr>
<TR>
<TD > <font  face="Arial" size="2" style="font-weight: bold"> Location&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </font> <INPUT style="BACKGROUND-COLOR: sky blue;" title="Enter correct lattitud and longitude"    id="latlon" size="40" name="latlon"  >
</TD>
 </tr>
 
 
<TR>
<TD > <font  face="Arial" size="2" style="font-weight: bold"> Bus Stop name </font> 
<INPUT style="BACKGROUND-COLOR: sky blue;" title="Enter correct bus stop name"    id="stopname" size="40" name="stopname"  >
</TD>
 </tr>
   
   
   <tr> 
   <td> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   
   <input type="submit" name="addbus" id="addbus" value="Add Bus Stop" >
   <input type="reset" name="reset" value="reset">
   </td>
   </tr>
   
   
   
   </table>
   
   </form>


<%
if(request.getParameter("latlon")==null)
{
	  
}else{
	  
	String latlon  = request.getParameter("latlon");
	String stopname  = request.getParameter("stopname");
	
	latlon = latlon.trim();
	stopname = stopname.trim();
	
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection connection = DriverManager.getConnection("jdbc:odbc:tram");
	Statement stmt = connection.createStatement();
	
	
	ResultSet buffer = stmt.executeQuery("SELECT * FROM Bus_stopss where bus_stop_name ='"+stopname+"'  ");
	
	if(!buffer.next())
	{
		String sql = "INSERT INTO Bus_stopss(bus_stop_name,latlon)"+ " VALUES ('"+stopname+"','"+latlon+"')";
	  int a = stmt.executeUpdate(sql);
	  
	  if(a==1)
	  {
		  %>
		  <script type="text/javascript">
		  alert('Bus stop added successfully');
		  </script>
		  
		  <%
	  }
	}
	
	
}
%>
</body>
</html>