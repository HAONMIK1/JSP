<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%
request.setCharacterEncoding("UTF-8");
%>
RESULT
<table bored="1">
	<tr>
		<td>id</td>
		<td><%=request.getParameter("name") %></td>
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


</table>