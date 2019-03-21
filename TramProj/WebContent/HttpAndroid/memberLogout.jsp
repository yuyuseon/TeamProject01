<%@page import="model.MemberDTO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.Map"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%
request.setCharacterEncoding("UTF-8");

String user_id = request.getParameter("user_id");
String user_token = request.getParameter("user_token");

MemberDAO dao = new MemberDAO(application.getInitParameter("JDBCDriver"), application.getInitParameter("ConnectionURL"));

	
dao.removeToken(user_id, user_token);
%>