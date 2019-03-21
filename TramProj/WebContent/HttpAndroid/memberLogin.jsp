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
String user_pw = request.getParameter("user_pw");
String user_token = request.getParameter("user_token");

MemberDAO dao = new MemberDAO(application.getInitParameter("JDBCDriver"), application.getInitParameter("ConnectionURL"));

JSONObject jsonObject = new JSONObject();


boolean isMember = dao.isMember(user_id, user_pw);

if(isMember){
	MemberDTO dto = dao.memberInfo(user_id);
		
	dao.insertToken(user_id, user_token);
	jsonObject.put("isLogin", 1);
	jsonObject.put("msg", "로그인 성공");
	jsonObject.put("name", dto.getName());
	
	
} else{
	jsonObject.put("isLogin", 0);
	jsonObject.put("msg", "아이디/암호를 확인하세요");
}

out.println(jsonObject);

%>