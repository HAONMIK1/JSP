<%@page import="my.shop.CategoryDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="my.shop.CategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
String cPath = request.getContextPath();
CategoryDAO cdao = CategoryDAO.getInstance();
ArrayList<CategoryDTO> lists = cdao.selectCategory();
String id = request.getParameter("id");
String memid = (String)session.getAttribute("memid");
%>

<link rel="stlyesheet" href="<%=cPath%>/style.css" type="text/css"> 
<style>
.right{
	float: right;

}
</style>
<table border="1" width = "800" align="center">
	<tr>
		<td colspan="2" align="center">
		
		<a href="<%=cPath%>/main.jsp"> HOME</a> | 
		<%
		if(memid.equals("admin")){
			%>
		<a href="<%=cPath%>/myshop/admin/main.jsp">관리자 홈</a> | 
			<%
			}
		
		%>
		<a href="<%=cPath%>/myshop/display/mall.jsp">쇼핑목록</a> | 
		<a href="<%=cPath%>/myshop/display/mall_cartlist.jsp">장바구니 </a>|
		<a href="<%=cPath%>/myshop/board/list.jsp">게시판 </a>|
		<a href="<%=cPath%>/myshop/display/company.jsp">회사소개 </a>
	
	<a href="<%=cPath%>/main.jsp" class="right">
		<img  src="<%=cPath%>/img/logout3.jpg" width="60">
	</a>
	<span style="text-align: right;" class="right" ><%=memid %>님</span>
	</td>
	</tr>
	<tr height= "400">
		<td valign="top" width="150" align="center">
			<table border="1" >
				<caption><b>카테고리</b></caption>
					<% 
			
			for(int i=0; i<lists.size();i++) {
				CategoryDTO cb = lists.get(i);
			%>
				<tr>
					<td>
		<a href="mall_cglist.jsp?cname=<%=cb.getCname() %>&cgname=<%=cb.getCname() %>">
			<%=cb.getCname() %>[<%=cb.getCode() %>]
		</a>
					</td>
				</tr>
			<%} %>
			</table>

