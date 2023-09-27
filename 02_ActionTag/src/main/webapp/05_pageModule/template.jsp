<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
template.jsp
<% 
	String device = request.getParameter("device");
	
%>
<table width="500" height=300 border="1">
	<tr >
	<td colspan="2" align="center">
		<%-- <jsp:include page="top.jsp"/>--%>
		<%@ include file="top.jsp" %>
	</td>
	
	</tr>

	<tr>
		<td width="150" valign="middle" align="center">
			<jsp:include page="<%=device+\"Left.jsp\" %>"/>
		</td>
		
		<td width="350" align="center">
			<jsp:include page="<%=device+\".jsp\" %>"/> 
		</td>
	</tr>

	<tr >
	<td colspan="2" align="center">
		<jsp:include page="bottom.jsp"/>
	</td>
	</tr>
	
</table>
<%-- 
jsp:include 액션태그 실행결과 붙여넣기
<%@ %>include 코드를 복붙 
--%>