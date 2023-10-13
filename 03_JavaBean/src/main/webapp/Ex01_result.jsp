<%@page import="board.SimpleBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    Ex01_result.jsp
<%
request.setCharacterEncoding("UTF-8");
    String message = request.getParameter("message");
%>
message : <%=message%><br>
<%
SimpleBean sb = new SimpleBean();
	sb.setMsg(message);
	System.out.println(sb.getMsg());
%>
msg: <%=sb.getMsg()%>


<hr>

JSP객체 생성

<jsp:useBean id="sb2" class="board.SimpleBean"/>
<jsp:setProperty property="msg" name="sb2" param="message"/>
<%
System.out.print("msg"+sb2.getMsg());
%>

msg: <%=sb2.getMsg()%>

msg2: <jsp:getProperty property="msg" name="sb2"/>