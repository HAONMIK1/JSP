<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.PersonBean"%>
<%
request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String addr = request.getParameter("addr");
%>

name: <%=name%> <br>

age: <%=age%>  <br>

addr: <%=addr%>  <br>

<hr>

<%
PersonBean sb =new PersonBean();
	sb.setName(name);
	sb.setAge(Integer.parseInt(age));
	sb.setAddr(addr);
%>

name: <%=sb.getName()%> <br>

age: <%=sb.getAge()%>  <br>

addr: <%=sb.getAddr()%>  <br>


<hr>

<jsp:useBean id="pb1" class="board.PersonBean"/>
<jsp:setProperty property="name" name="pb1" />
<jsp:setProperty property="age" name="pb1" />
<jsp:setProperty property="addr" name="pb1" param="addr"/>

name: <jsp:getProperty property="name" name="pb1"/> <br>

 age: <jsp:getProperty property="age" name="pb1"/> <br>

addr: <jsp:getProperty property="addr" name="pb1"/> <br>


