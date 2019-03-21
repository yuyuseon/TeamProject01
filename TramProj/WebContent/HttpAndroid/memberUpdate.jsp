<%@page import="model.MemberDTO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

String user_id = request.getParameter("user_id");
MemberDAO dao = new MemberDAO(application.getInitParameter("JDBCDriver"), application.getInitParameter("ConnectionURL"));

JSONObject jsonObject = new JSONObject();

MemberDTO dto = dao.memberInfo(user_id);

jsonObject.put("user_pass", dto.getPass());
jsonObject.put("user_name", dto.getName());
jsonObject.put("user_phone", dto.getPhone());

out.println(jsonObject);
%>