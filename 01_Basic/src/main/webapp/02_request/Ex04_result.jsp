<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
이름:
<%=request.getParameter("name")%>
<br>
비번:
<%=request.getParameter("pw")%>
<br>
과일:
<%
String[] fruit = request.getParameterValues("fruit");
if(fruit!=null){
for(int i=0;i<fruit.length;i++){
	out.print(" "+fruit[i]);
}}else{
	out.print("선택한 과일 없음");
	
}
%>
<br>
취미: 
<%
String[] hobby = request.getParameterValues("hobby");
if(hobby!=null){
for(int i=0;i<hobby.length;i++){
	out.print(" "+hobby[i]);
}}else{
	out.print("선택한 취미 없음");
	
}
%>
<br>