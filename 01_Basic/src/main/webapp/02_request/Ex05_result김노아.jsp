<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");//HttpServletRequest? 성조변수
%>
<h1>RESULT</h1>
<table border="1">
<% 
	boolean flag =false;
	Enumeration<String> names = request.getParameterNames();
	while(names.hasMoreElements()){
		String str = names.nextElement();
		if(str.equals("agree"))
				flag=true;
		//out.print(str+" ");
		String[] values = request.getParameterValues(str);
		%><tr><% 
		%><td> <% 
		out.print(str);
		if(str.length()==4){
		}
		%></td><%
		%><td> <% 
		for(int i=0;i<values.length;i++){
		if(values[i].equals("on")){
			out.print("동의함");
		}
		else
		out.print(values[i]+" ");
	}
		%></td><%
	
		%></tr><%
	} %>
		<% 
		if(flag==false){
		out.print("<tr>");
		out.print("<td>");
		out.print("aprrove");
		out.print("</td>");
		out.print("<td>");
			out.print("동의하지않음");
		out.print("</td>");
			}
		out.print("<br> ");
		out.print("</tr>");
		%>
</table>

<%-- 	<tr>
		<td>id</td>
		<td><%=request.getParameter("id") %></td>
	</tr>
	<tr>
		<td>pw</td>
		<td><%=request.getParameter("pw") %></td>
	</tr>
	<tr>
		<td>product</td>
		<td><%
		String []product = request.getParameterValues("product");
		for(int i=0;i<product.length;i++)
				out.print(product[i]);
			%></td>
	</tr>
	<tr>
		<td>time</td>
		<td><%=request.getParameter("time") %></td>
	</tr>
	<tr>
		<td>approve</td>
		<td><%=request.getParameter("approve") %></td>
	</tr>
	<tr>
		<td>agree</td>
		<td>
			<%
			String agree = request.getParameter("agree");
			if(agree.equals("on")){
				out.print("동의함");
			}
			%>
		</td>
	</tr>
 --%>