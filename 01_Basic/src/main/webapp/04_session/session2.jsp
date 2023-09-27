<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%> 
<% 
	Object id = session.getAttribute("id");
	String pw = (String)session.getAttribute("pw");
	
	String sports = request.getParameter("sports");
	String game = request.getParameter("game");
	
%>
<%if(id!=null) {%>
id: <%=id  %>
pw: <%=pw  %>
sports: <%=sports  %>
game: <%=game  %>
<%	//session.invalidate();
}else{
out.print("세샨 x");
}%>