<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<table border="1">
	<% 
	out.print("<tr>");
	for(int i=2;i<10;i++){
	out.print("<th>"+i+"단</th>");
  }
	out.print("</tr>");
	for(int j=1;j<10;j++){
	out.print("<tr>");
	for(int i=2;i<10;i++){
	out.print("<th>"+i+"*"+j+"="+i*j+"</th>");
  }
	out.print("</tr>");
	}
%>
</table>


