<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.CategoryDAO"%>
<%@page import="my.shop.CategoryDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    CategoryDAO cdao = CategoryDAO.getInstance();
   ArrayList<CategoryDTO> lists= cdao.selectCategory();
   
    %>
<%@include file="top.jsp" %>

	<td colspan="6" align="center">
		<table border="1" align="center" width="350">
			<tr>
				<th bgcolor="yellow" >번호</th>
				<th bgcolor="yellow" >카테고리 코드</th>
				<th bgcolor="yellow" >카테고리명</th>
				<th bgcolor="yellow" > 삭제</th>
			</tr>
<%
			if(lists.size()==0){
%>
			<tr>
				<td colspan="4">등록된 카테고리가 없습니다</td>
				
			</tr>
			<% 
			}else{
			for(int i=0; i<lists.size();i++) {
				CategoryDTO cb = lists.get(i);
			%>
			<tr>
			<td><%=cb.getCnum() %></td>
			<td><%=cb.getCode() %></td>
			<td><%=cb.getCname() %></td>
			<td><a href="categorydelete.jsp?cnum=<%=cb.getCnum()%>">삭제</a> </td>
			</tr>
			
			<%}} %>
	</table>
	</td>
	
<%@include file="bottom.jsp" %>