
<%@page import="model.SanatoriumCommentDTO"%>
<%@page import="model.SanatoriumDTO"%>
<%@page import="model.SanatoriumDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="org.json.simple.JSONArray"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//한글처리
request.setCharacterEncoding("UTF-8");

//파라미터 받기
String organ_idx = request.getParameter("organ_idx")==null ? "" : request.getParameter("organ_idx");


//DB연결
String driver = application.getInitParameter("JDBCDriver");
String url =  application.getInitParameter("ConnectionURL");

SanatoriumDAO dao = new SanatoriumDAO(driver, url);

//JSON객체 생성
JSONArray jsonArray = new JSONArray();

SanatoriumDTO m = dao.SanatoriumInfo2(organ_idx);

int commentCount = dao.commentCount(organ_idx);
double rating = dao.organRating(organ_idx);

JSONObject jsonObject = new JSONObject();
	
jsonObject.put("organ_name", m.getOrgan_name());
jsonObject.put("organ_address", m.getOrgan_address());
jsonObject.put("organ_grade", m.getOrgan_grade());
jsonObject.put("organ_code", m.getOrgan_code());
jsonObject.put("organ_funDate", m.getOrgan_fundate());
jsonObject.put("organ_appDate", m.getOrgan_appdate());
jsonObject.put("organ_phone", m.getOrgan_phone());
jsonObject.put("organ_hr", m.getOrgan_hr());
jsonObject.put("organ_bedroom", m.getOrgan_bedroom());
jsonObject.put("organ_etc", m.getOrgan_etc());
jsonObject.put("organ_park", m.getOrgan_park());
jsonObject.put("organ_nonPayfood", m.getOrgan_nonpayfood());
jsonObject.put("organ_nonPaysnack", m.getOrgan_nonpaysnack());
jsonObject.put("organ_loc", m.getOrgan_loc());
jsonObject.put("organ_idx", m.getOrgan_idx());

//코멘트 갯수, 평점
jsonObject.put("organ_commetcount", commentCount);
jsonObject.put("organ_rate",  Math.round(rating/commentCount*10)/10.0);	//소숫점 첫째자리까지 반올림

jsonArray.add(jsonObject);



out.print(jsonArray.toJSONString());
%>