<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>  
	hello1<br>  
	<script type="text/javascript">
		document.write("hello2<br>");
	</script>
	
	<%
	String str = "hello3";
	%>
	<%=str %>
	
</body>
</html>
<%-- 

JSP 태그
지시어: <@page %> => 전체 페이지에 대한 정보
		<@include %> =>
		 <@taglib %> =>
스크립드릿: <% %> 변수 제어문 제일 많이 사용!! 지역변수
표현식: <%= %> 출력할때 사용
선언문: <%! %> 메서드 정의  전역변수

JSP 주석--%>