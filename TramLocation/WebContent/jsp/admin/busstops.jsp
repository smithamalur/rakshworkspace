<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.net.*"%>

<%@page import="java.io.*"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException"%>
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
        
        <script type="text/javascript">
 function valid()
 {
 
  var ob=this.document.busstops;


  if(ob.latlon.value == "")
  {
   alert('Click on Map for location!');
   ob.latlon.focus();
   return false;
  }
  if(ob.radius.value == "")
  {
   alert('Select Radius !');
   ob.radius.focus();
   return false;
  }
  

  
}
</script>
        
        
        
        <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript">

	var ltlng;
      function initialize() {
        var mapDiv = document.getElementById('map-canvas');
        var map = new google.maps.Map(mapDiv, {
          center: new google.maps.LatLng(12.307991017063235,76.65358543395996),
          zoom: 15,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        });
      
        var infoWindow = new google.maps.InfoWindow();
        google.maps.event.addListener(map, 'click', function(event) {
          var html = 'The LatLng value is: ' + event.latLng + ' at zoom level ' + map.getZoom();
          
          infoWindow.setContent(html);
        
	    
	     
	     var a = event.latLng.toString();
	     
	    
	     var x=a.split(",");
	    
	     var lat_1 = x[0];
	     var lon_1 = x[1];
	     
	     var lat_2 = lat_1.substring(1);
	     var lon_2 = lon_1.substring(0);
	     
	     lon_2 = lon_2.replace(")",""); 
	     lon_2 = lon_2.replace(/^\s+|\s+$/g, '') ;
	     
	     var seprator = ",";
	     lat_2 = lat_2.concat(seprator); 
	     
	     var latlng = lat_2.concat(lon_2); 
	     
	  
	     
	     document.getElementById("latlon").value = latlng;
	     
	     
	     
	     
		var marker = new google.maps.Marker({
    	map: map,
    	position:event.latLng,
   	 draggable: false
  	});
             infoWindow.setPosition(event.latLng);
          infoWindow.open(map);
        }); 
}    

      google.maps.event.addDomListener(window, 'load', initialize);
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
       
            
             
 
   
   <br></br>
 
   
    
   <form name="busstops"  onsubmit="return valid();" action="busstops.jsp">
   <table align="center">
   
   
    
    <tr align="right"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <h1>   <a href="manually.jsp"  target="frames">ADD BUS STOP MANUALLY </a></h1> </td> </tr>
 <tr align="right"><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <h1>   <a href="viewbusstop.jsp"  target="frames">View Bus Stops </a> </h1> </td> </tr> 
  
  
  <tr><td><h1>Add Bus Stops</h1></td><td></td>   </tr>
<TR>
<TD > <font  face="Arial" size="2" style="font-weight: bold"> Location </font> </TD>
<TD><INPUT style="BACKGROUND-COLOR: sky blue;" title="Click on map to get location"    id="latlon" size="40" name="latlon"  >
</TD>
 </tr>
 
 
 <Tr><td><font  face="Arial" size="2" style="font-weight: bold">Radius</font> </td><td>
<select name="radius">
  <option value="500">0.5km</option>
  <option value="1000">1 km</option>
  <option value="2000">2 km</option>

</select> 
   </td></Tr>
   
   
   <tr> <td></td>
   <td> <input type="submit" name="addbus" id="addbus" value="Add Bus Stop" >
   <input type="reset" name="reset" value="reset">
     
   </td>
   </tr>
   
   
   
   
   
   
   
   </table>
   
   </form>
  
  
  <form action="">
<table>
</table>
 <div id="content">  <div class="post">
    <center>
    <div id="map-canvas"  style="width: 800px; height: 500px"> 
    </div>
    </center>  
    </div>
   
    
    
    


</div>
</form>
  
  
  <%
  
  String jsoncont ="";

  String urlLink = "";

  if(request.getParameter("latlon")==null)
  {
	  
  }else{
	  
	String latlon  = request.getParameter("latlon");
	String radius  = request.getParameter("radius");
	
	urlLink = "https://maps.googleapis.com/maps/api/place/search/json?location="+latlon+"&radius="+radius+"&types=bus_station&sensor=false&key=AIzaSyCS7iRYF0cbnzz6Odn7zWuDLculFzW0vcU";
	  
	
	System.out.println("urllink"+urlLink);
		try {
			URL url = new URL(urlLink);
			URLConnection connection = url.openConnection();

			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(connection.getInputStream()));

			StringBuffer stringBuffer = new StringBuffer();

			String line = "";

			while ((line = bufferedReader.readLine()) != null)
			{
				stringBuffer.append(line);
			}

			//System.out.println(stringBuffer);
			jsoncont = stringBuffer.toString();

		} catch (MalformedURLException e) {
			System.out
					.println("MalformedURLException while reading json from net "+ e.toString());
			
		} catch (IOException e) {
			System.out.println("IOException while reading json from net "+ e.toString());
			
		} catch (Exception e) {
			System.out.println("Exception while reading json from net "+ e.toString());
			
		}
	  
 
  
  
  try {
		JSONParser jsParser = new JSONParser();

		Object object = jsParser.parse(jsoncont);

		JSONObject json = (JSONObject) object;
		
		JSONArray resultsarray = (JSONArray) json.get("results");
		
	//	String busstops[] = null;
		
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection connection = DriverManager.getConnection("jdbc:odbc:tram");
		Statement stmt = connection.createStatement();
		Statement stmt1 = connection.createStatement();
		
		for(int i=0;i<resultsarray.size();i++)
		{
			
			JSONObject resultObject = (JSONObject) resultsarray.get(i);
			
			JSONObject geometry_object = (JSONObject)resultObject.get("geometry");
			
			JSONObject location_object = (JSONObject)geometry_object.get("location");
			
			String lattiude = String.valueOf(location_object.get("lat"));
			String longitude = String.valueOf(location_object.get("lng"));
			String latlong = lattiude+","+longitude;
			
			
			
			String busstopis = String.valueOf(resultObject.get("name"));
		
			System.out.println("busstopis:"+busstopis+"["+i+"]");
			
			
			ResultSet buffer = stmt.executeQuery("SELECT * FROM Bus_stopss where bus_stop_name ='"+busstopis+"'  ");
			
			if(!buffer.next())
			{
				String sql = "INSERT INTO Bus_stopss(bus_stop_name,latlon)"+ " VALUES ('"+busstopis+"','"+latlong+"')";
			    stmt1.executeUpdate(sql);
			}
			
			
			
		}
		//stmt.close();
		//stmt1.close();
		//connection.close();
		


	} catch (ParseException e) {
		System.out.println("JSON ParseException : " + e.toString());
		
	} catch (Exception e) {
		System.out.println(" Exception : " + e.toString());
		
	}

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
 