<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>

<script type="text/javascript">
// Popup window code
function newPopup(url) {
	popupWindow = window.open(
		url,'popUpWindow','height=700,width=800,left=10,top=10,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no,status=yes')
}
</script>



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
                

                 

            </div>
       


<%
String bustops="";
String markers="";
String markerpaths="";
String alphabets[] ={"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};



String stops_array [] = null;
ArrayList<String> latlonarray = new ArrayList<String>();


if(request.getParameter("busstops")==null)
{
	
}else{
	
	bustops = request.getParameter("busstops");
	System.out.println("busstops"+bustops);
	

	stops_array =bustops.split(",");
	
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con = DriverManager.getConnection("jdbc:odbc:tram");
	Statement stmt=con.createStatement();
	
	for(int i=0;i<stops_array.length;i++)
	{
		
		
		try{
			
			

	      String stop = stops_array[i].trim();
	      
	      System.out.println("stop"+stop);
	      
		ResultSet buffer = stmt.executeQuery("SELECT * FROM Bus_stopss where bus_stop_name ='"+stop+"' ");
		while(buffer.next())
		{
			String location = buffer.getString("latlon");
			latlonarray.add(location);
		}
	
		}catch(Exception e)
		{
			
		}
		
		
	}
	
	
	for(int i =0; i <latlonarray.size(); i++){
		
		String k = alphabets[i];
		
		markers = markers +"markers=color:blue|label:"+k+"|"+latlonarray.get(i)+"&";
	}
	
	
	System.out.println("markers"+markers);
	
//	String paths="path=color:0x0000ff|weight:5|";
///	for(int i =0; i <latlonarray.size(); i++)
//	{
//		paths  = paths+latlonarray.get(i)+"|";
//	}
	
//	paths = paths.substring(0, paths.length()-1);
	//System.out.println("pahts 2: "+paths );
	
	//  markerpaths = markers+paths;
	
	
}

System.out.println("markerpaths"+markerpaths);

%>

<a href="JavaScript:newPopup('http://maps.googleapis.com/maps/api/staticmap?zoom=14&size=512x512&maptype=roadmap&<%=markers%>&sensor=false');">Click here to View map</a>

<%
for(int i=0;i<stops_array.length;i++)
{
	
	String alpha = alphabets[i];
	String stop = stops_array[i];
	
	String alphastop = alpha+"="+stop+",";
	%>
	
	<br>
	<br>
	
	
	<%
	out.println(alphastop+"\n");
}

%>




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