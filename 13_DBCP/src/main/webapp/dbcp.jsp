<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
dbcp.jsp <br>
<!-- database connection pool -->

<%
	request.setCharacterEncoding("UTF-8");
	Connection conn = null;
	PreparedStatement ps = null;
	
	Context initContext = new InitialContext();
	Context envContext = (Context)initContext.lookup("java:comp/env");
	DataSource ds = (DataSource)envContext.lookup("jdbc/OracleDB");
	conn = ds.getConnection();
	System.out.println("conn:"+conn);

	
	String username = request.getParameter("username");
	String email = request.getParameter("email");
	
	if(username != null){
		String sql = "insert into tdbcp values(?,?)";
		ps = conn.prepareStatement(sql);
		ps.setString(1,username);
		ps.setString(2,email);
		
		ps.executeUpdate();
	}
	
%>

<form name="myform" method="post" action="dbcp.jsp">
	이름 : <input type="text" name="username"><br>
	이메일 : <input type="text" name="email"><br><br>
	
	<input type="submit" value="등록">
</form>
<hr>

목록보기 <br>
<%
	String sql = "select * from tdbcp";
	ps = conn.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	int i=0;
	while(rs.next()){
		out.print(i +":"+ rs.getString("username") + "," +
		rs.getString(2)+"<br>");
		i++;
	}
	
	rs.close();
	ps.close();
	conn.close();
%>
<h1>글목로(전체 글:14)</h1>
<form>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>직성자</th>
			<th>작성일</th>
			<th>조회</th>
			<th>IP</th>
		</tr>
		<% for(int i=0; i<lists.length;i++ ){ %>
		
		
		<%} %>
	
	
	
	</table>
</form>












