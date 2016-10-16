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
       
            
             
                  
 <form name="busstops"  onsubmit="javascript : return valid(this)" action="busdetails.jsp">
   <table align="center">
  <tr><td> <h1>&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   <a href="search_bus_by_reg.jsp"  >Search bus by Reg no </a> &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<a href="search_bus_by_bus_no.jsp"  >Search bus by Bus no </a> </h1>
   </td></tr>
  
  <tr><td><h1>Add Bus Details</h1></td><td></td>   </tr>
<TR>
<TD > <font  face="Arial" size="2" style="font-weight: bold">Device IMEI&nbsp;</font> <INPUT style="BACKGROUND-COLOR: sky blue;" title="Gps reciver imei no"    id="imei"  name="imei"  >
</TD>
 </tr>
 
 
 
        
              <tr><td><font  face="Arial" size="2" style="font-weight: bold">Bus No.&nbsp;  &nbsp;&nbsp; </font>&nbsp;&nbsp; <select name="busno" id="busno"  >
       <option value="">----------Select-----------</option>
     <%
				String Bus_no="";
				try{
				Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
				Connection con = DriverManager.getConnection("jdbc:odbc:tram");
				Statement stmt=con.createStatement();

		      
			ResultSet buffer = stmt.executeQuery("SELECT * FROM busnumber  ORDER BY Bus_no");
			while(buffer.next())
			{
				Bus_no = buffer.getString("Bus_no");
				
			%>
	
				<option value="<%=Bus_no%>"><%=Bus_no %></option>
				<%
			}
				}
				catch(Exception e)
						{
						}
				%>
       </select>
       </td> </tr>
       
       
       
 <TR>
<TD > <font  face="Arial" size="2" style="font-weight: bold">Bus Reg No&nbsp; </font> <INPUT style="BACKGROUND-COLOR: sky blue;" title="Bus Reg no"    id="regno"  name="regno"  >
</TD>
 </tr>
   

   
   
   <tr> 
   <td> 
        &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;

    <input type="submit" name="busdetails" id="busdetails" value="ADD" >
   <input type="reset" name="reset" value="reset">
      
   </td>
   </tr>
   
   
   
   
   
   
   </table>
   
   </form>
  
  
  <%
  String busno;
  String imei;
  String regno;
  
  
  if(request.getParameter("imei")==null)
  {
	  
	  
	  
  }else{
	  
	  imei = request.getParameter("imei");
	  regno = request.getParameter("regno");
	  busno = request.getParameter("busno");
	 
	  

  		try{
    Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection connection = DriverManager.getConnection("jdbc:odbc:tram");
	Statement stmt = connection.createStatement();
	
	
	
	ResultSet buffer = stmt.executeQuery("SELECT * FROM Bus_details where Reg_no ='"+regno+"'  ");
	
	if(!buffer.next())
	{
		
		String sql = "INSERT INTO Bus_details(imei,bus_no,Reg_no)"+ " VALUES ('"+imei+"','"+busno+"','"+regno+"')";
	    stmt.executeUpdate(sql);
	    
	    %>
		<script type="text/javascript">

		alert('Bus Details is added');
		
		</script>
		
		<%

	}else{
		
		
		%>
		<script type="text/javascript">

		alert('Sorry....Details is already added for this Bus');
		
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
      