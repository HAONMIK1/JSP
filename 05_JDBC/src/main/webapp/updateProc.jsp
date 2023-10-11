<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
updateProc.jsp
<br>
<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");
String sid = (String)session.getAttribute("sid");
String passwd = request.getParameter("passwd");
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String uname = request.getParameter("uname");
String dname = request.getParameter("dname");
out.print(sid+" "+passwd+" "+name+" "+gender+" "+uname+" "+dname);
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:orcl";
String sqlid = "sqlid";
String sqlpw = "sqlpw";
Connection conn = null;
PreparedStatement ps = null;
try {
	Class.forName(driver);
	conn = DriverManager.getConnection(url, sqlid, sqlpw);
	
	String sql = "update register set gender = ?, uname = ?, dname = ?  where passwd = ?";
	ps = conn.prepareStatement(sql);
	ps.setString(1, gender);
	ps.setString(2, uname);
	ps.setString(3, dname);
	ps.setString(4, passwd);
	
	int num = ps.executeUpdate();
	System.out.print(num);
	if(num==0){
		%> <script type="text/javascript">
			alert("비밀번호를 다시 입력하시오");
			</script>
			<%
	}
	else{
		%> <jsp:include page="select.jsp"/> <%
	}
} catch (Exception e) {

} finally {
	try {
		ps.close();
		conn.close();
	} catch (Exception e) {

	}

}
%>
