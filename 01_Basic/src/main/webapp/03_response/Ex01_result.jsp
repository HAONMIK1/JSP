<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex01_result.jsp<br>
DB작업
넘어온 값: <%=request.getParameter("msg") %><br>
<% 
	String msg = request.getParameter("msg");
	out.println(msg);
	System.out.print("Ex01_result1.jsp :"+msg);
	
	
	//DB작업
	
	response.sendRedirect("Ex01_result2.jsp?");/*  여기는 거쳐가는 페이지 result2가 본 */
%>
<!-- response
폼에서 넘어온 정보가 다음페이지를 넘어가지 않는다

 -->