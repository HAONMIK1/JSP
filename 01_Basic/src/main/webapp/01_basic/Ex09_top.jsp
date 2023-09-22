<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 Ex09_top.jsp<br>
 <% 
 	Date d = new Date();
 	out.print(d.toLocaleString());
 %>
 