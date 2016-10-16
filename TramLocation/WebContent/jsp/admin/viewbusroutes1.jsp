<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<html>
<head>
<title>Mobile location security</title>
	<link href="StyleSheet.css" rel="stylesheet" type="text/css" />



      <script type="text/javascript">
        
            var image1=new Image()
            image1.src="images/arr.jpg"
            var image2=new Image()
            image2.src="images/arr3.jpg"
            var image3=new Image()
            image3.src = "images/arr2.jpg"
            var image4 = new Image()
            image4.src = "images/arr3.jpg"
                  
        </script>
        
        
       
</head>
<body>
<form id="form1" >
    <div class="size">
        <div class="header">
            <div class="header01">
                <div class="logo">
                   <img src="images/MCTC.png" alt="" />
                </div>
                <div class="hright">
                    
                </div>
            </div>
            <div class="mnav">
                <img class="mnimgl" src="images/img_37.jpg" alt="" />
                <img class="mnimgr" src="images/img_50.jpg" alt="" />
                <div class="mnm">
                    <ul>
                        <li><a href="admin_home.jsp"  id="Home">HOME</a></li>
                        <li><a href="busstops.jsp"  id="About">Bus Stops</a></li>
                        <li><a href="busnumber.jsp"  id="gallery">Bus Number</a></li>
                        <li><a href="busdetails.jsp"  id="faq">Bus Details</a></li>
                        <li><a href="tracking.jsp"  id="services">Bus Location</a></li>
                        <li><a href="logout.jsp"  id="Contact">Logout</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="workzone">
            <div class="cmainimg">
                 <img src="images/img_73.jpg" name="slide" />

                  <script type="text/javascript">
                    <!--
                      var step = 1
                      function slideit() {
                          document.images.slide.src = eval("image" + step + ".src")
                          if (step < 4)
                              step++
                          else
                              step = 1
                          setTimeout("slideit()", 2500)
                      }
                      slideit()
                    //-->
            </script>

            </div>
       
            
             
                  
  <h1 style="text-align: center;"> Bus Routes</h1>
<table border="3"  bordercolor="black" align="center">
<tr><th>Sl no</th><th>Bus no.</th><th> &nbsp;&nbsp;&nbsp;&nbsp;From &nbsp;&nbsp;&nbsp;&nbsp;</th><th> &nbsp;&nbsp;&nbsp;&nbsp;To &nbsp;&nbsp;&nbsp;&nbsp;</th><th>Via</th><th>MAP</th></tr>

<%
try{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection connection = DriverManager.getConnection("jdbc:odbc:tram");
Statement stmt = connection.createStatement();

ResultSet buffer = stmt.executeQuery("SELECT * FROM busnumber  ORDER BY Bus_no ");
int i=0;
while(buffer.next())
{
	i=i+1;
	String Bus_no = buffer.getString("Bus_no");
	String From_ = buffer.getString("From_");
	String To_ = buffer.getString("To_");
	String Via = buffer.getString("Via");
	
	
	
	%>
	<tr><td><%=i%></td>
	<td><%=Bus_no%></td>
	<td><%=From_%></td>
	<td><%=To_%></td>
	<td><%=Via%></td>
	
	
	<td><a href="Mapview.jsp?busstops=<%=Via%>">Map</a></td>
	
	</tr>
	
	<%
	
	
}

}catch(Exception e)
{
	
}
%>
</table>

   <br></br>
   <br></br>
   <br></br>
   <br></br>
   <br></br>
   <br></br>
   
                   
             
            </div>
        </div>
        <div class="footer">
            <img class="mnimgl" src="images/img_275.jpg" alt="" />
            <img class="mnimgr" src="images/img_291.jpg" alt="" />
            <a href="admin_home.jsp"  id="Home">HOME</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="busstops.jsp"  id="About">Bus Stops</a>&nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="busnumber.jsp"  id="gallery">Bus Number</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="busdetails.jsp"  id="faq">Bus Details</a>&nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="tracking.jsp"  id="Bus Location">Bus Location</a>&nbsp;&nbsp;
        	<br/>
			<font color="#333333">Copyright 2012 Mobile location for your Security |
        	<!-- By using this template you agree not to remove or edit the copyright & author links below -->
			<a style="color: #333333" href="#">All Rights 
			Reserved</a> by
			<a style="color: #333333" href="#"></a>Location Solutions</font></div>
 
      </form>