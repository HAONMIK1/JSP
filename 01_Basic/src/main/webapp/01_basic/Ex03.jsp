<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! /*  메서드 정의할때 선언문 <%! % >*/
 public int multiply(int a,int b){
 	int result = a*b;
 	return result;
 }
%>

5*4=<%=multiply(5, 4)%>
<br>
<%!
int a=11;
int b =21;
public int plus(int a,int b){
	return a+b;
}
%>
<%= a %>+<%= b %>=<%= plus(a,b) %>