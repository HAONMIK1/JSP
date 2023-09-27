<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>


<%

	String name = request.getParameter("name");
	String pw = request.getParameter("pw");

%>
name: <%= name %>
pw: <%= pw %>
<jsp:include page="Ex01_include.jsp">
	<jsp:param value="20" name="age"/>
	<jsp:param value="서울" name="address"/>
	<jsp:param value="<%=name+\"회원님\"%>" name="name"/>
</jsp:include> <!-- 실행결과 붙여넣기 -->

<%--
 <%@ include file=""  %>
	코드를 공유한다
 --%>