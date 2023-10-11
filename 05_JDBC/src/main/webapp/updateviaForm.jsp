              <%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
updateviaForm.jsp
<br>
<%
request.setCharacterEncoding("UTF-8");

String id = request.getParameter("id"); // kim
String passwd = request.getParameter("pw"); // 1234
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:orcl";
String dbId = "sqlid";
String dbPw = "sqlpw";
Connection conn = null;
PreparedStatement ps = null;
ResultSet rs = null;

try {
	//1
	Class.forName(driver);

	//2
	conn = DriverManager.getConnection(url, dbId, dbPw);

	String sql = "select * from register where id=?";
	ps = conn.prepareStatement(sql);
	ps.setString(1, id);
	rs = ps.executeQuery();
	//kim   1234
	if(rs.next()){ 
		// 아이디가 있다.
		String rpw = rs.getString("passwd");
		if(rpw.equals(passwd)){
			// 비번이 같다.
			session.setAttribute("sid",id);
%>
		<form method="post" action="updateProc.jsp">
			<%-- <input type="hidden" name="id" value="<%=id%>">
			<input type="hidden" name="name" value="<%= rs.getString("name") %>"> --%>
			<table border="1" cellpadding="3" cellspacing="0">
				<tr>
					<th colspan="2">
						수정할 정보를 입력해 주세요
					</th>
				</tr>
				<tr>
					<th> 아이디 </th>
					<td> <%=id %> </td>
				</tr>
				<tr>
					<th> 패스워드 </th>
					<td> <input type="password" name="passwd"> </td>
				</tr>
				<tr>
					<th> 이름 </th>
					<td> <%= rs.getString("name") %> </td>
				</tr>
				<tr>
					<th> 성별 </th>
					<td> 
						<input type="radio" name="gender" value="남">남
						<input type="radio" name="gender" value="여">여
					</td>
				</tr>
				<tr>
					<th> 이메일 </th>
					<td> 
						<input type="text" name="uname" value="<%=rs.getString("uname")%>">@
						<select name="dname">
							<option value="naver.com">naver.com
							<option value="daum.net">daum.net
							<option value="google.com">google.com
							<option value="nate">nate.com
						</select>
					</td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="submit" value="확인">
						<input type="reset" value="취소">
					</th>
				</tr>	
			</table>
			
		
		</form>
<%				
		}else{
			// 비번이 같지 않다.
%>
			<script type="text/javascript">
				alert("비번이 다릅니다.\n비번을 다시 확인하세요");
			</script>	
			<meta http-equiv="refresh" content="0; url=updateForm.jsp">									
			
<%				
		}
		
	}else{
		// 아이디가 없다.
%>
		<script type="text/javascript">
			alert("없는 아이디입니다.\n아이디를 다시 확인하세요");
		</script>	
		<meta http-equiv="refresh" content="0; url=updateForm.jsp">								
		
<%			
	}

} catch (Exception e) {
e.printStackTrace();
} finally {
try {
if (ps != null) {
	ps.close();
}
if (conn != null) {
	conn.close();
}
} catch (SQLException e) {
e.printStackTrace();
}
}
%>










