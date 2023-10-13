<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.JumsuBean"%>
<%
p
 
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
	String[] jumsu = request.getParameterValues("jumsu");
	String[] group = request.getParameterValues("group");
%>

JAVA request

이름: <%=t(na%><br>
비번: <%=t(%> <br>
과목 점수: <br><%
 p

 for(int i=0; i<jumsu.length;i++){
 	if(i==0)
 		out.print("국어:"+jumsu[i]+"<br>");
 	else if(i==1)
 		out.print("영어:"+jumsu[i]+"<br>");
 	else  if(i==2)
 		out.print("수학:"+jumsu[i]+"<br>");
 	else	
 		out.print("음악:"+jumsu[i]+"<br>");
 }
 %>
좋아하는 그룹 : <%
 p

 for(int i=0; i<group.length;i++)
 		out.print(group[i]+" ");
 %><br>
 <hr>
 
JAVA 객체<br>

<%
p

JumsuBean jb = new JumsuBean();
jb.setName(name);
jb.setPw(pw);
jb.setJumsu(jumsu);
jb.setGroup(group);
%>

이름: <%=t(jb.getName(%><br>
비번: <%=t(jb.getPw(%><br>
과목 점수: <br><%
p

String[] Jumsu = jb.getJumsu();
for(int i=0; i<Jumsu.length;i++){
	if(i==0)
		out.print("국어:"+jumsu[i]+"<br>");
	else if(i==1)
		out.print("영어:"+jumsu[i]+"<br>");
	else  if(i==2)
		out.print("수학:"+jumsu[i]+"<br>");
	else	
		out.print("음악:"+jumsu[i]+"<br>");
	}
%>
좋아하는 그룹: 
<%
p

String[] groups = jb.getGroup();
for(int i=0; i<groups.length;i++)
	out.print(groups[i]+" ");
%>
<br><hr>
jsp 객체
<br>
<jsp:useBean id="n j" class="w board.JumsuBe"></jsp:useBean>
<jsp:setProperty property="name" name="jb1"/>
<jsp:setProperty property="pw" name="jb1"/>
<jsp:setProperty property="jumsu" name="jb1"/>
<jsp:setProperty property="group" name="jb1"/>

<%-- <jsp:setProperty property="*" name="fb"/> --%>

이름: <jsp:getProperty property="name" name="jb1"/> <br>
비번: <jsp:getProperty property="pw" name="jb1"/> <br>
과목 점수: <br><%
String[] Jumsu1 = jb.getJumsu();
for(int i=0; i<Jumsu1.length;i++){
	if(i==0)
		out.print("국어:"+Jumsu1[i]+"<br>");
	else if(i==1)
		out.print("영어:"+Jumsu1[i]+"<br>");
	else  if(i==2)
		out.print("수학:"+Jumsu1[i]+"<br>");
	else	
		out.print("음악:"+Jumsu1[i]+"<br>");
	}
	%>
좋아하는 그룹: 
<%
String[] Group = jb1.getGroup();
for(int i=0; i<Group.length;i++)
	out.print(Group[i]+" ");
%><br>

