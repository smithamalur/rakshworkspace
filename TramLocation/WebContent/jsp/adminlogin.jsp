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
<script type="text/javascript">
 function valid()
 {
 
  var ob=this.document.loginform;


  if(ob.name.value == "")
  {
   alert('Enter name !');
   ob.name.focus();
   return false;
  }
  if(ob.pass.value == "")
  {
   alert('Enter Password !');
   ob.pass.focus();
   return false;
  }
  
  
  
        var name=loginform.name.value;
				var flag=true;
				for(var indx=0;indx<name.length;indx++)
					if(name.toUpperCase().charAt(indx)<'A'||name.toUpperCase().charAt(indx)>'Z')
						if(name.charAt(indx)!=' '){
							alert("Name is not valid..");
							flag=false;
							break;
						}
				return flag;
  
}
</script>

<%

if (request.getParameter("name") == null) {

} else {
String adminname = request.getParameter("name");
String password = request.getParameter("pass");



	
	
	try
	{
	
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		Connection con = DriverManager.getConnection("jdbc:odbc:tram");
		Statement stmt=con.createStatement();

      
	ResultSet buffer = stmt.executeQuery(String.format("select * from Admin where admin_name ='"+adminname+"' and password = '"+password+"' "));
	if( buffer.next() )
		{
		
	String	d_name = buffer.getString("admin_name");
	String	d_id =  buffer.getString("admin_id");

	   session.setAttribute("name",d_name);
	   session.setAttribute("imei",d_id);
	   
	   response.sendRedirect("/TramLocation/jsp/admin/admin_home.jsp");	
		
		}
	else{
		%>
		<script type="text/javascript">
				
		 alert('Invalid username/password !');
		</script>
		<%
		//response.sendRedirect("/TramLocation/jsp/adminlogin.jsp?msg=invalid");
		
	}
	}catch(Exception e )
	{
		
		
	}
	

	

}

%>
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
       
          <br></br>
   <br></br>
            
           <form name="loginform" onsubmit="return valid();" action="adminlogin.jsp" method="post" >
           <table align="center"  background="images/LoginBorder.png">
           
           <tr><td><h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Admin Login&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h1></td></tr>
           <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Admin Name <input type="text" name="name" id="name">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td></tr>
           <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Password&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="pass" id="pass"></td></tr>
           <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="sub" id="sub" value="Login"><input type="reset" name="clear" id="clear" value="Clear">
           
           
           
           </table>
           </form>  
                  

   
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
 
      