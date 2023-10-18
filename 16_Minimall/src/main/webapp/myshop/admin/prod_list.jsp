<%@page import="my.prod.ProdDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.prod.ProdDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="top.jsp" %>
	<td colspan="6" align="center">
		   <%
    ProdDAO pdao = ProdDAO.getInstance();
   	ArrayList<ProdDTO> lists= pdao.selectProd();   
    %>
<td colspan="6" align="center">
		<table border="1" align="center" width="350">
			<tr>
				<th bgcolor="yellow" >번호</th>
				<th bgcolor="yellow" >카테고리 코드</th>
				<th bgcolor="yellow" >카테고리명</th>
				<th bgcolor="yellow" > 삭제</th>
			</tr>
			<% for(int i=0; i<lists.size();i++) {
				ProdDTO pb = lists.get(i);
			%>
			<tr>
			<td><%=pb.getPnum() %></td>
			<td><%=pb.getPname() %></td>
			<td><%=pb.getPcategory_fk() %></td>
			<td><%=pb.getPcompany() %></td>
			<td><%=pb.getPimage() %></td>
			<td><%=pb.getPqty() %></td>
			<td><%=pb.getPrice() %></td>
			<td><%=pb.getPsepc() %></td>
			<td><%=pb.getPcontents() %></td>
			<td><%=pb.getPoint() %></td>
			<td><%=pb.getPinputdate() %></td>
	
			<td><a href="categorydelete.jsp?cnum=<%=pb.getPnum()%>">삭제</a> </td>
			</tr>
			
			<%} %>
	</table>
	</td>

	</td>
<%@include file="bottom.jsp" %>