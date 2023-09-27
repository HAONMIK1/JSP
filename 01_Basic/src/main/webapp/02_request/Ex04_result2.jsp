<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	Enumeration<String> names = request.getParameterNames();
	
	while(names.hasMoreElements()){
		String str = names.nextElement();
		//out.print(str+" ");
		String[] values = request.getParameterValues(str);
		
		out.print(str+" :");
		for(int i=0;i<values.length;i++){
		out.print(values[i]+" ");
		}	
		out.print("<br> ");
	}
%>

