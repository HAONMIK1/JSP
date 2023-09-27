<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
templateTest.jsp
<% String contentPage = request.getParameter("contentPage");%>
<table width="500" height=300 border="1">
	<tr >
	<td colspan="2">
		<%-- <jsp:include page="top.jsp"/>--%>
		<%@ include file="top.jsp" %>
	</td>
	
	</tr>

	<tr>
		<td width="150" valign="middle">
			<jsp:include page="left.jsp"/>
		</td>
		
		<td width="350">
		<jsp:include page="<%=contentPage %>"/> 
		<!--여기만 변화고 나머지는 그대로인게 페이지 모듈화 시켜서 그런거다 -->
		</td>
	</tr>

	<tr >
	<td colspan="2">
		<jsp:include page="bottom.jsp"/>
	</td>
	</tr>
	
</table>
<%-- 
jsp:include 액션태그 실행결과 붙여넣기
<%@ %>include 코드를 복붙 
--%>