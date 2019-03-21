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
String user_phone = request.getParameter("user_phone");
String user_name = request.getParameter("user_name");

MemberDAO dao = new MemberDAO(application.getInitParameter("JDBCDriver"), application.getInitParameter("ConnectionURL"));

JSONObject jsonObject = new JSONObject();

MemberDTO dto = new MemberDTO();
dto.setId(user_id);
dto.setPass(user_pw);
dto.setPhone(user_phone);
dto.setName(user_name);

int affected = dao.memberRegist(dto);
jsonObject.put("isRegist", affected);

if(affected==0){
	if(dao.isMember(user_id)){
		jsonObject.put("msg", "아이디가 이미 존재합니다");
	} else{
		jsonObject.put("msg", "회원가입에 실패했습니다 다시 시도해주세요");
	}
} else{
	jsonObject.put("msg", "회원가입 성공! 로그인해주세요");
}

out.println(jsonObject);

%>