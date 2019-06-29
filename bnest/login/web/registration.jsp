<%@ page import="java.sql.*" %>
<%
response.setDateHeader("Expires",-1);
try
{
System.out.println("Request received");
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/lavesh?zeroDateTimeBehavior=convertToNull","root","");
PreparedStatement ps=conn.prepareStatement("Select uname  from reg_user where uname=?");
String uname=request.getParameter("uname");
ps.setString(1,uname);
String mobile=request.getParameter("mobile");
ResultSet rs=ps.executeQuery();
System.out.println(mobile);
if(rs.next())
	out.println("fail");
else
    {
	PreparedStatement ps2=conn.prepareStatement("insert into reg_user values (?,?,?,?)");
        String email=request.getParameter("email");
        String pass=request.getParameter("pass");
        
        System.out.println(email);
        ps2.setString(1, uname);
        ps2.setString(2, email);
        ps2.setString(3, pass);
        ps2.setString(4, mobile);
        int ans= ps2.executeUpdate();
        if(ans!=0)
              out.println("done");
        else
            out.println("fail");
    
    }
}
catch(Exception ex)
{
out.println("fail");
System.out.println("Error Details:"+ex);
}
%>