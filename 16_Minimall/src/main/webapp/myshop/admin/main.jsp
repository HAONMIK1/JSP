<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- 
액션태그↓
<jsp:include page="top.jsp"/>
<jsp:include page="bottom.jsp"/>

 지시어와 액션태그 차이점 알기!!!
 
 지시어 ↓
 --%>
<%@include file="top.jsp" %>
	<td colspan="6" align="center">
		<img src="<%=request.getContextPath() %>/img/hot.gif" width="300">
	</td>
<%@include file="bottom.jsp" %>