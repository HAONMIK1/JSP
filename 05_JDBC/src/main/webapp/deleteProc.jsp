<%@page import="java.sql.ResultSet"%>
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
String passwd = request.getParameter("passwd");
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:orcl";
String sqlid = "sqlid";
String sqlpw = "sqlpw";
Connection conn = null;
PreparedStatement ps = null;
ResultSet rs =null;
try {
	Class.forName(driver);
	conn = DriverManager.getConnection(url, sqlid, sqlpw);
	
	String sql = "select * from register  where id=? ";
	ps = conn.prepareStatement(sql);
	ps.setString(1, id);
	rs = ps.executeQuery();
	if(rs.next()){
		
		if(rs.getString("passwd").equals(passwd)){
			String sql1 = "delete from register  where id=? ";
			ps = conn.prepareStatement(sql1);
			ps.setString(1, id);
			int cnt = ps.executeUpdate();
			if(cnt!=0){
				System.out.print("사제성고");
			}
			
		}else{
			%>
			<script type="text/javascript">
				alert("비번이 다릅니다.\n비번을 다시 확인하세요");
			</script>	
			<meta http-equiv="refresh" content="0; url=deleteForm.jsp">									
			
<%
		}
		
	}
	else{
		%>
		<script type="text/javascript">
			alert("아이디 다릅니다.\n아이디를 다시 확인하세요");
		</script>	
		<meta http-equiv="refresh" content="0; url=deleteForm.jsp">									
		
<%
		
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
