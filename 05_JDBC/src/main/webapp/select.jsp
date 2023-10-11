<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
select.jsp
<br>
<h1>register 테이블의 레코드를 화면에 표시하는 예제</h1>

<table border="1">

	<%
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String sqlid = "sqlid";
	String sqlpw = "sqlpw";
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, sqlid, sqlpw);
		String sql = "select * from register";
		ps = conn.prepareStatement(sql);
		rs = ps.executeQuery();
	%>
	<tr>
		<td>아이디</td>
		<td>패스워드</td>
		<td>이름</td>
		<td>성별</td>
		<td>email</td>
	</tr>
	<%
	while (rs.next()) {
		String id = rs.getString("id");
		String passwd = rs.getString("passwd");
		String name = rs.getString("name");
		String gender = rs.getString("gender");
		String uname = rs.getString("uname");
		String dname = rs.getString("dname");
	%>
	<tr>
		<td><%=id%></td>
		<td><%=passwd%></td>
		<td><%=name%></td>
		<td><%=gender%></td>
		<td><%=uname%>@<%=dname%></td>
	</tr>
	<%
	}
	} catch (Exception e) {
	System.out.print("드라이버 실패");
	} finally {
	try {
	rs.close();
	ps.close();
	conn.close();
	} catch (Exception e) {
	}
	}
	%>
</table>
