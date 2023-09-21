<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%! /* 선언문 전역변수*/
	String id="kim";
	String name="김노아";
	
	public String getId(){
	return id;
}
%>

<%	/* 지역변수 */
	String id ="son";
	String name ="손흥민";
	
	String comment= "주석문 연습";
%>
id:<%=getId()  %>
name:<%=name  %>
coment:<%=comment  %>