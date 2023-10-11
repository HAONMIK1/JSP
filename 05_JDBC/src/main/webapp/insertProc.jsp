<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
insertProc.jsp
<br>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String email = request.getParameter("email");
String mail = request.getParameter("mail");
%>
아이디 :
<%=id%><br>
패스워드 :
<%=pw%><br>
이름 :
<%=name%><br>
성별 :
<%=gender%><br>
e-mail :<%=email%>@<%=mail%><br>
<%
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:orcl";
String sqlid = "sqlid";
String sqlpw = "sqlpw";
Connection conn = null;
PreparedStatement ps = null;
try {
	Class.forName(driver);
	conn = DriverManager.getConnection(url, sqlid, sqlpw);
	
	String sql = "insert into register values(?,?,?,?,?,?)";
	ps = conn.prepareStatement(sql);
	ps.setString(1, id);
	ps.setString(2, pw);
	ps.setString(3, name);
	ps.setString(4, gender);
	ps.setString(5, email);
	ps.setString(6, mail);
	
	int num = ps.executeUpdate();
	System.out.print(num);
} catch (Exception e) {

} finally {
	try {
		ps.close();
		conn.close();
	} catch (Exception e) {

	}

}
%>
<jsp:include page="select.jsp" />
