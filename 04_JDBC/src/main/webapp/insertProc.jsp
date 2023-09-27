<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Driver"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String name = request.getParameter("name");
long time = System.currentTimeMillis();
Timestamp register = new Timestamp(time);
System.out.print(id + " " + pw + " " + name);

String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:orcl";
String sqlid = "sqlid";
String sqlpw = "sqlpw";
Connection conn = null;
PreparedStatement ps = null;
try {
	Class.forName(driver);
	conn = DriverManager.getConnection(url, sqlid, sqlpw);

	String sql = "insert into member values(?,?,?,?)";
	ps = conn.prepareStatement(sql);
	ps.setString(1, id);
	ps.setString(2, pw);
	ps.setString(3, name);
	ps.setTimestamp(4, register);

	int cnt = ps.executeUpdate();
	System.out.print(cnt);
	
} catch (Exception e) {
} finally {
	try {
		ps.close();
		conn.close();
	} catch (Exception e) {
	}
}

%>

<%-- 
<jsp:forward page="select.jsp"/>
 --%>
<%
	response.sendRedirect("select.jsp");
%>