<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Context ctx =new InitialContext();

	DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/jndi");
	Connection conn =ds.getConnection();
	Statement st =conn.createStatement();
	
	ResultSet rs =st.executeQuery("select * from cv;");
	
	while(rs.next()){
		out.println(rs.getString(1) + "\t" + rs.getString(2) + "<br/>");
	}
%>
</body>
</html>