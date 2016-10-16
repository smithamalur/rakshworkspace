<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
 
   <%
   try{
     String s[]=null;
 
  
     
     Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
     Connection connection = DriverManager.getConnection("jdbc:odbc:tram");
     Statement stmt = connection.createStatement();

     ResultSet rs = stmt.executeQuery("SELECT * FROM Bus_stopss  ");
 
       List li = new ArrayList();
 
       while(rs.next())
       {
           li.add(rs.getString("bus_stop_name"));
       }
 
       String[] str = new String[li.size()];
       Iterator it = li.iterator();
 
       int i = 0;
       while(it.hasNext())
       {
           String p = (String)it.next();
           str[i] = p;
           i++;
       }
 
    //jQuery related start
       String query = (String)request.getParameter("q");
 
       int cnt=1;
       for(int j=0;j<str.length;j++)
       {
           if(str[j].toUpperCase().startsWith(query.toUpperCase()))
           {
              out.print(str[j]+"\n");
              if(cnt>=5)// 5=How many results have to show while we are typing(auto suggestions)
              break;
              cnt++;
            }
       }
    //jQuery related end
 
rs.close();
stmt.close();
connection.close();
 
}
catch(Exception e){
e.printStackTrace();
}
 
//www.java4s.com
%>