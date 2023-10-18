<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="mdao" class="myPkg.MovieDao"></jsp:useBean>
<%
	String userid = request.getParameter("userid");
	System.out.println("userid:"+ userid);
	
	boolean isCheck = mdao.searchId(userid);   
	// true=>이미=>사용X
	String str = "";
	
	if(isCheck){
		str = "NO";
		out.print(str); // 출력X
	}else{
		str = "YES";
		out.print(str); 
	}
%>
