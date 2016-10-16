<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<html>
<head>
<title>MCTC</title>
	<link href="StyleSheet.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="css/style.css" />
	
	
	<script type="text/javascript" src="Validate.js"></script>
	<script type="text/javascript" src="JS/jquery-1.4.2.min.js"></script>
	<script src="JS/jquery.autocomplete.js"></script>	

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
       
            
             
                  
 <form name="busstops"  onsubmit="javascript : return valid(this)" action="busnumber.jsp">
   <table align="center">
  <tr><td> <h1>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   <a href="viewbusroutes1.jsp"  >View all bus routes </a> &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<a href="Search_Bus_routes.jsp" >Search bus routes </a> </h1>
   </td></tr>
  
  <tr><td><h1>Add Bus Routes</h1></td><td></td>   </tr>
<TR>
<TD > <font  face="Arial" size="2" style="font-weight: bold"> Bus no. </font> <INPUT style="BACKGROUND-COLOR: sky blue;" title="City bus no"    id="busno"  name="busno"  >
</TD>
 </tr>
 
 
 
        
              <tr><td><font  face="Arial" size="2" style="font-weight: bold">From </font>&nbsp;&nbsp; <select name="from" id="from"  >
       <option value="">---------Select----------</option>
     <%
				String bus_stop_name="";
				try{
				Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
				Connection con = DriverManager.getConnection("jdbc:odbc:tram");
				Statement stmt=con.createStatement();

		      
			ResultSet buffer = stmt.executeQuery("SELECT * FROM Bus_stopss  ORDER BY bus_stop_name");
			while(buffer.next())
			{
				bus_stop_name = buffer.getString("bus_stop_name");
				
			%>
	
				<option value="<%=bus_stop_name%>"><%=bus_stop_name %></option>
				<%
			}
				}
				catch(Exception e)
						{
						}
				%>
       </select>
       </td> </tr>
       
       
       <tr><td><font  face="Arial" size="2" style="font-weight: bold">To </font>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; <select name="to" id="to"  >
       <option value="">---------Select----------</option>
     <%
				String bus_stop_name1="";
				try{
				Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
				Connection con = DriverManager.getConnection("jdbc:odbc:tram");
				Statement stmt=con.createStatement();

		      
			ResultSet buffer = stmt.executeQuery("SELECT * FROM Bus_stopss  ORDER BY bus_stop_name");
			while(buffer.next())
			{
				bus_stop_name1 = buffer.getString("bus_stop_name");
				
			%>
	
				<option value="<%=bus_stop_name1%>"><%=bus_stop_name1 %></option>
				<%
			}
				}
				catch(Exception e)
						{
						}
				%>
       </select>
       </td> </tr>
 
 <tr><td><font  face="Arial" size="2" style="font-weight: bold">Via</font>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<textarea rows="3" cols="50"id="via" name="via" class="input_text"   ></textarea></td></tr>
 
   

   
   
   <tr> 
   <td>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
   
    <input type="submit" name="busroute" id="busroute" value="Add Bus route" >
   <input type="reset" name="reset" value="reset">
      
   </td>
   </tr>
   
   
   
   
   
   
   </table>
   
   </form>
  
  
  <%
  String busno;
  String from;
  String to;
  String via;
  
  
  if(request.getParameter("busno")==null)
  {
	  
	  
	  
  }else{
	  
	  busno = request.getParameter("busno");
	  from = request.getParameter("from");
	  to = request.getParameter("to");
	  via = request.getParameter("via");
	  

  		try{
    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection connection = DriverManager.getConnection("jdbc:odbc:tram");
	Statement stmt = connection.createStatement();
	
	
	
	ResultSet buffer = stmt.executeQuery("SELECT * FROM busnumber where Bus_no ='"+busno+"'  ");
	
	if(!buffer.next())
	{
		
		String sql = "INSERT INTO busnumber(Bus_no,From_,To_,Via)"+ " VALUES ('"+busno+"','"+from+"','"+to+"','"+via+"')";
		//String sql = "INSERT INTO Bus_stops(bus_stop_name)"+ " VALUES ('"+busstopis+"')";
	    stmt.executeUpdate(sql);
	    
	    %>
		<script type="text/javascript">

		alert('Route is added');
		
		</script>
		
		<%

	}else{
		
		
		%>
		<script type="text/javascript">

		alert('Sorry....Bus Route is already added');
		
		</script>
		
		<%
	}
	
	
	
	
  		}
  catch(Exception e)
  {
	  System.out.println("exception"+e);
  }
  
  }
  
  %>
  
   <br></br>
   <br></br>
   <br></br>
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
 
  </body>
  <script>
	jQuery(function(){
		$("#via").autocomplete("list.jsp");
	});
</script>
      