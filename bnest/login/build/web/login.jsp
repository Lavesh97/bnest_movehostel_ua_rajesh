<%@ page import="java.sql.*" %>
<%
response.setDateHeader("Expires",-1);
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/lavesh?zeroDateTimeBehavior=convertToNull","root","");
PreparedStatement ps=conn.prepareStatement("select uname from reg_user where email=? and pass=?");
String userid=request.getParameter("email");
String pwd=request.getParameter("pass");
System.out.println(userid);
ps.setString(1,userid);
ps.setString(2,pwd);
ResultSet rs=ps.executeQuery();

if(rs.next())
{
   
	String ename=rs.getString(3);
//out.println("lavesh ");         
 out.println(ename);
  System.out.println(rs.getString(1));
}
else
{
          out.println("fail ");
}
}
catch(Exception ex)
{
out.println("fail ");
System.out.println("Error Details:"+ex);
}
%>