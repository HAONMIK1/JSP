<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int sum=0;
	for(int i=0;i<=10;i++){
		sum+=i;
	}
	//out.print(sum);
	%>
<%
		String[] str = {"JSP","정말","재미","있다"};
	%>
현재 날짜와 시간
<%
		Date d= new Date();
		out.print(d.toLocaleString());
	%>
<table border="1">
	<tr>
		<th>배열의 첨자</th>
		<th>배열의 내용</th>
	</tr>
	<%
	for(int i=0;i<str.length;i++){
%>
	<tr>
		<th><%= i%></th>
		<th><%=str[i] %></th>
	</tr>
	<%} %>

</table>



<table border="1">
	<tr>
		<th>배열의 첨자</th>
		<th>배열의 내용</th>
	</tr>
	<%
	for(int i=0;i<str.length;i++){
		out.print("<tr>");
		out.print("<th>"+i+"</th>");
		out.print("<th>"+str[i]+"</th>");
		out.print("</tr>");
	
	} %>

</table>
