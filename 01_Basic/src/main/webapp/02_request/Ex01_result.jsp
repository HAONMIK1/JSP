<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>    

<!-- 한글처리를 맨위에 하지 않으면 한글이 깨진다. -->

Ex01_form.jsp => Ex01_result.jsp<br>

<%
/* HttpServletRequest request = new HttpServletRequest(); */ 
String name = request.getParameter("name"); // kim
String age = request.getParameter("age"); // "20"
/* 언제 null이 나오나 ? */  
%>

입력한 이름 : <%= name %> <br>
입력한 나이 : <%= age %> <br>

URI : <%=	request.getRequestURI() %><br>
method : <%= request.getMethod()%> <br>

<!-- 
get 방식 => http://localhost:8080/01_Basic/02_request/Ex01_result.jsp?name=kim&age=32
post 방식 =>http://localhost:8080/01_Basic/02_request/Ex01_result.jsp
 -->
<!-- 
class Person{
	String name;
	int age;
	
	void setName(String n){
	
	}
}

Person p2 = new Person();
p2.name="kim";
p2.age=20;
p2.setName("park");

ArrayList<Person> lists2 = new ArrayList<Person>();
lists2.add(p);

JSP 내장객체
request :  웹 브라우저의 요청 정보를 저장하고 있는 객체 
 -->


 
 
 
 