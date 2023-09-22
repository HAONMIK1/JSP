<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
Ex2_form.jsp에서 Ex02_result.jsp를 요청<br>

<%
	String n1 = request.getParameter("num1"); //"3"
	String n2 = request.getParameter("num2"); //"4"
%>
<%=n1%> / <%=n2 %> <br>

<%
	int n11 = Integer.parseInt(n1);
	int n22 = Integer.parseInt(n2);
%>
<%=n11%> / <%=n22 %> <br>

<%
	int count = 0;
	int result = 1;
	while(n22 > count){
		result *= n11;
		count++;
	}
%>
<%=n11 %><sup><%=n22 %></sup> = <%=result %> <br>


	
	
	
	