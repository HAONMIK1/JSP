<%@page import="board.EmplBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
insertProc.jsp
<br>
<%
request.setCharacterEncoding("UTF-8");
String name = request.getParameter("name");
int depart = Integer.parseInt(request.getParameter("depart"));
int salary = Integer.parseInt(request.getParameter("salary"));

EmplBean eb = new EmplBean();
eb.setName(name);
eb.setDepart(depart);
eb.setSalary(salary);
%>

<jsp:useBean id="eb1" class="board.EmplBean" />
<jsp:setProperty property="name" name="eb1" />
<jsp:setProperty property="depart" name="eb1" />
<jsp:setProperty property="salary" name="eb1" />
<jsp:getProperty property="name" name="eb1" />

<jsp:useBean id="edao" class="board.EmplDao" />
<%
	String msg;
	String url;
	int cnt = edao.insetData(eb1);
	if(cnt!=-1){
		msg="삽입성공";
		url="list.jsp";
	}else
	{
		msg="삽입 실패";
		url="insertFrom.jsp";
	}
%>
<script type="text/javascript">
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>
