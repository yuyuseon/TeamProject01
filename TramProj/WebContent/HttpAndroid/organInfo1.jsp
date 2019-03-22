
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

SanatoriumDTO m = dao.referenceInfo(organ_idx);

int commentCount = dao.commentCount(organ_idx);
double rating = dao.organRating(organ_idx);


JSONObject jsonObject = new JSONObject();

jsonObject.put("organ_name", m.getOrgan_name());
jsonObject.put("organ_address", m.getOrgan_address());
jsonObject.put("organ_grade", m.getOrgan_grade());
jsonObject.put("organ_fund", m.getOrgan_fund());
jsonObject.put("organ_care", m.getOrgan_care());
jsonObject.put("organ_loca", m.getOrgan_loca());
jsonObject.put("organ_reli", m.getOrgan_reli());
jsonObject.put("organ_call", m.getOrgan_call());
jsonObject.put("organ_pay", m.getOrgan_pay());
jsonObject.put("organ_subject", m.getOrgan_subject());
jsonObject.put("organ_time", m.getOrgan_time());
jsonObject.put("organ_ref", m.getOrgan_ref());

int patnum = m.getOrgan_patnum();
int docnum = m.getOrgan_docnum();
int nurnum = m.getOrgan_nurnum();
int staffnum = m.getOrgan_staffnum();
double organ_docnum = patnum/docnum;
double organ_nurnum = patnum/nurnum;
double organ_staffnum = patnum/staffnum;

jsonObject.put("organ_docnum", organ_docnum);
jsonObject.put("organ_nurnum", organ_nurnum);
jsonObject.put("organ_staffnum", organ_staffnum);


String str_disease = m.getOrgan_disease();
String str_disease1 = str_disease.substring(0, str_disease.indexOf(",") );
String str_disease1_1 = str_disease.substring(str_disease.indexOf(",")+1 );
String str_disease2 = str_disease1_1.substring(0, str_disease.indexOf(","));
String str_disease3 = str_disease.substring(str_disease.lastIndexOf(",")+1);
jsonObject.put("organ_disease1", str_disease1);
jsonObject.put("organ_disease2", str_disease2);
jsonObject.put("organ_disease3", str_disease3);

String str_life = m.getOrgan_life();
String str_life1 = str_life.substring(0, str_life.indexOf(",") );
String str_life1_1 = str_life.substring(str_life.indexOf(",")+1 );
String str_life2 = str_life1_1.substring(0, str_life.indexOf(","));
String str_life3 = str_life.substring(str_life.lastIndexOf(",")+1);
jsonObject.put("organ_life1", str_life1);
jsonObject.put("organ_life2", str_life2);
jsonObject.put("organ_life3", str_life3);

String str_eval = m.getOrgan_eval();
String str_eval1 = str_eval.substring(0, str_eval.indexOf(",") );
String str_eval1_1 = str_eval.substring(str_eval.indexOf(",")+1 );
String str_eval2 = str_eval1_1.substring(0, str_eval.indexOf(","));
String str_eval3 = str_eval.substring(str_eval.lastIndexOf(",")+1);
jsonObject.put("organ_eval1", str_eval1);
jsonObject.put("organ_eval2", str_eval2);
jsonObject.put("organ_eval3", str_eval3);
jsonObject.put("organ_idx", m.getOrgan_idx());

//코멘트 갯수, 평점
jsonObject.put("organ_commetcount", commentCount);	
jsonObject.put("organ_rate",  Math.round(rating/commentCount*10)/10.0);	//소숫점 첫째자리까지 반올림


jsonArray.add(jsonObject);
	

out.print(jsonArray.toJSONString());
%>