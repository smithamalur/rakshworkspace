<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<html>
<head>
<title>MCTC</title>
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
<script type="text/javascript">
// Popup window code
function newPopup(url) {
	popupWindow = window.open(
		url,'popUpWindow','height=600,width=600,left=10,top=10,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no,status=yes')
}
</script>
<body>
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
                        <li><a href="index.jsp"  id="Home">HOME</a></li>
                        <li><a href="About_us.jsp"  id="About">ABOUT</a></li>
                        <li><a href="Galary.jsp"  id="gallery">GALLERY</a></li>
                        <li><a href="FAQ.jsp"  id="faq">FAQ'S</a></li>
                        <li><a href="Services.jsp"  id="services">SERVICES</a></li>
                        <li><a href="Contact.jsp"  id="Contact">CONTACT</a></li>
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
       
            
             <form action="Services.jsp">
<table align="center">
<tr><td>Bus no.<input type="text" name="busno" id="busno"><input type="submit" name="search" id="search" value="Search"></td></tr>
</table>
</form>
                  
  <%

if(request.getParameter("busno")==null)
{
	
}else
{
	
	%>
	<br><br>
	<table border="3"  bordercolor="black" align="center">
<tr><th>Sl. no</th><th>Reg no</th><th> IMEI </th><th> REG NO.</th><th> Map</th></tr>
	<%
try{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection connection = DriverManager.getConnection("jdbc:odbc:tram");
Statement stmt = connection.createStatement();

String busnum = request.getParameter("busno");

System.out.println("busnum"+busnum);

ResultSet buffer = stmt.executeQuery("SELECT Reg_no,Bus_details.imei,location,time_is FROM Bus_details INNER JOIN Track_Details ON Bus_details.imei = Track_Details.imei where bus_no = '"+busnum+"' ");
int i=0;
while(buffer.next())
{
	System.out.println("i"+i);

	i=i+1;
	String Reg_no = buffer.getString("Reg_no");
	String imei = buffer.getString("imei");
	String time_is = buffer.getString("time_is");
	String location = buffer.getString("location");
	System.out.println("location"+location);
	
	
	
	
	%>
	
	<tr>
	<td><%=i%></td>
	<td><%=Reg_no%></td>
	<td><%=imei%></td>
	<td><%=time_is%></td>
	<td><a href="JavaScript:newPopup('http://maps.google.com/maps/api/staticmap?center=<%=location%>&zoom=15&size=600x600&markers=color:blue%7Clabel:<%=i%>%7C<%=location%>&markers=size:tiny%7Ccolor:green%7CDelta+Junction,AK&markers=size:mid%7Ccolor:0xFFFF00%7Clabel:C%7CTok,AK&sensor=false');">Click here to View map</a>
</td>
	
	</tr>
	
	<%
	
	
}

}catch(Exception e)
{
	System.out.println("Exception"+e);

}
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
            <a href="index.jsp">HOME</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="About_us.jsp">ABOUT</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
                href="Galary.jsp">GALLERY</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="FAQ.jsp">FAQ'S</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
                    href="Services.jsp">SERVICES</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="Contact.jsp">CONTACT</a>&nbsp;&nbsp; |&nbsp;&nbsp;<a href="adminlogin.jsp">ADMIN</a>
        	<br/>
			<font color="#333333">Copyright 2012 Mobile location for your Security |
        	<!-- By using this template you agree not to remove or edit the copyright & author links below -->
			<a style="color: #333333" href="#">All Rights 
			Reserved</a> by
			<a style="color: #333333" href="#"></a>Location Solutions</font></div>
 
