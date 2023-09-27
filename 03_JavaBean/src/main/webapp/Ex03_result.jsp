<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="mypkg.SingBean"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String hakbun = request.getParameter("hakbun");
	String name = request.getParameter("name");
	String sing = request.getParameter("sing");
	String girl = request.getParameter("girl");
%>
학번: <%=hakbun%> <br>
이름: <%=name%><br>
좋아하는 노래: <%=sing%><br>
좋아하는 걸그룹: <%=girl%><br>
<hr>
JAVA <br>
<%
SingBean sb1 = new SingBean();
sb1.setHakbun(hakbun);
sb1.setName(name);
sb1.setSing(sing);
sb1.setGirl(girl);
%>

학번: <%=sb1.getHakbun()%> <br>
이름: <%=sb1.getName() %><br>
좋아하는 노래: <%=sb1.getSing() %><br>
좋아하는 걸그룹: <%=sb1.getGirl() %><br>


<hr>
JSP<br>
<jsp:useBean id="sb" class="mypkg.SingBean"></jsp:useBean>
<%-- <jsp:setProperty property="hakbun" name="sb"/>
<jsp:setProperty property="name" name="sb"/>
<jsp:setProperty property="sing" name="sb"/>
<jsp:setProperty property="girl" name="sb"/> --%>


<jsp:setProperty property="*" name="sb"/>
학번: <jsp:getProperty property="hakbun" name="sb"/> <br>
이름: <jsp:getProperty property="name" name="sb"/> <br>
좋아하는 노래: <jsp:getProperty property="sing" name="sb"/> <br>
좋아하는 걸그룹: <jsp:getProperty property="girl" name="sb"/> <br>


