<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page import="java.sql.*"%>

<%
String Firstname=request.getParameter("firstname");
System.out.println(Firstname);
String Lastname=request.getParameter("lastname");
String Password=request.getParameter("password");
String Gender=request.getParameter("sex");
String Hobbies=request.getParameter("hobbies");
String City=request.getParameter("city");




Connection con=null;
PreparedStatement pstmt=null;
try{
	
	
	Class.forName("com.mysql.jdbc.Driver");
	con=DriverManager.getConnection("jdbc:mysql://localhost:3306?user=root&password=root");

	pstmt=con.prepareStatement("insert into regform.data values(?,?,?,?,?,?)");
	pstmt.setString(1, Firstname);
	pstmt.setString(2, Lastname);
	pstmt.setString(3, Password);
	pstmt.setString(4, Gender);
	pstmt.setString(5, Hobbies);
	pstmt.setString(6, City);
	
	pstmt.executeUpdate();
	
		
	
}catch(Exception e){
	
}finally {
	if(pstmt!=null) {
		
		try {
			pstmt.close();
		} catch (SQLException e) {
			
			
			e.printStackTrace();
		}
		System.out.println("closed the stmt ");
	}
	if(con!=null) {
		try {
			con.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		System.out.println("closed the con ");
	}
}
%>