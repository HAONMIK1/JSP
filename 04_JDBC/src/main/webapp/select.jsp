<%@page import="java.sql.ResultSet"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
select.jsp<br>

<h2>member table 레코드 조회</h2>
<table border ="1" width="400" >
<tr>
<th>아이디</th>
<th>패스워드</th>
<th>이름</th>
<th>가입일</th>
</tr>
<%
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String user="sqlid";
	String password="sqlpw";
	Connection conn=null;
	PreparedStatement ps = null;	
	ResultSet rs= null;
	try{
		//1.드라이버로드
	Class.forName(driver);
	System.out.print("드");
		//2.계정에 접속
	conn= DriverManager.getConnection(url, user, password);
	System.out.print("라");
	String sql = "select * from member";
	//3.sql문접속
	ps= conn.prepareStatement(sql);
	System.out.print("이");
	//4.sql문 실행
	rs = ps.executeQuery();	
	System.out.print("버 실패");
	while(rs.next()){
	String id =	rs.getString("id");
	String passwd =	rs.getString("passwd");
	String name = rs.getString("name");
	String reg_date = String.valueOf(rs.getDate(4));
	%>
		<tr align="center">
			<td><%=id%></td>
			<td><%=passwd %></td>
			<td><%=name %></td>
			<td><%=reg_date %></td>
		</tr>
	<%
	}
	}catch(Exception e){
		System.out.print("드라이버 실패");
	}finally{
	try{
		ps.close();
		rs.close();
		conn.close();}
	catch(Exception e){
	}
	}
%>
</table>
