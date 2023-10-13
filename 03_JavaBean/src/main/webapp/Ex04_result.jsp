<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.fruitBean"%>
<%
p
 
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
	String[] fruit = request.getParameterValues("fruit");
%>
이름: <%=t(na%><br>
비번: <%=t(%> <br>
좋아하는 과일: <%
 p

 for(int i=0; i<fruit.length;i++)
 		out.print(fruit[i]);
 %><br>
<hr>
JAVA <br>
<%
p

fruitBean fb1 = new fruitBean();
fb1.setName(name);
for(int i=0; i<fruit.length;i++)
fb1.setFruit(fruit);
fb1.setPw(pw);
%>

이름: <%=t(fb1.getName(%><br>
비번: <%=t(fb1.getPw(%><br>
좋아하는 과일: <%
p

String[] fruits = fb1.getFruit();
for(int i=0; i<fruits.length;i++)
	out.print(fruits[i]);
%><br>


<hr>
JSP<br>
<jsp:useBean id="n" class="w board.fruitBe"></jsp:useBean>
<jsp:setProperty property="name" name="fb"/>
<jsp:setProperty property="pw" name="fb"/>
<jsp:setProperty property="fruit" name="fb"/>

<%-- <jsp:setProperty property="*" name="fb"/> --%>

이름: <jsp:getProperty property="name" name="fb"/> <br>
비번: <jsp:getProperty property="pw" name="fb"/> <br>
좋아하는 과일: <%-- <jsp:getProperty property="fruit" name="fb"/> jsp로는 못한다--%> <br>
<%
String[] fruits2 = fb1.getFruit();
for(int i=0; i<fruits2.length;i++)
	out.print(fruits2[i]);
%><br>

