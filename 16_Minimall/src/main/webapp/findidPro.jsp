<%@page import="my.member.MemberDTO"%>
<%@page import="my.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    	request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String ssn1 = request.getParameter("ssn1");
		String ssn2 = request.getParameter("ssn2");
	MemberDAO mdao = MemberDAO.getInstance();
	MemberDTO mb =  mdao.getMemberByNameAndSsn(name,ssn1,ssn2);
	String viewPage =null;
	String id=null;
	if(mb!=null){
		 id = mb.getId();
	}else{
		%>
			<script type="text/javascript">
					alert('가입하지않은 회원입니다.');
			</script>
		<%
		
	}
	viewPage = request.getContextPath() + "/main.jsp";
	%>
	<script type="text/javascript">
		alert("<%=id%>"+"입니다");
		location.href="<%=viewPage%>";
	</script>