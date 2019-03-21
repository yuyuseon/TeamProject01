<%@page import="model.PatientDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.PatientDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="model.MemberDTO"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");




String pati_name = request.getParameter("pati_name");
String pati_blood = request.getParameter("pati_blood");

/* String pati_regidateStr = request.getParameter("pati_regidate");
SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");

java.util.Date date1 = sdf1.parse(pati_regidateStr);
java.sql.Date pati_regidate = new java.sql.Date(date1.getTime());  */

String pati_birthdateStr = request.getParameter("pati_birthdate");
SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
java.util.Date date2 = sdf2.parse(pati_birthdateStr);
java.sql.Date pati_birthdate = new java.sql.Date(date2.getTime()); 

String pati_sex = request.getParameter("pati_sex")==null ? "" : request.getParameter("pati_sex");
String pati_relation = request.getParameter("pati_relation")==null ? "" : request.getParameter("pati_relation");
String pati_address = request.getParameter("pati_address")==null ? "" : request.getParameter("pati_address");
String pati_living = request.getParameter("pati_living")==null ? "" : request.getParameter("pati_living");
String pati_housingtype = request.getParameter("pati_housingtype")==null ? "" : request.getParameter("pati_housingtype");
String pati_religion = request.getParameter("pati_religion")==null ? "" : request.getParameter("pati_religion");
String pati_height = request.getParameter("pati_height")==null ? "" : request.getParameter("pati_height");
String pati_weight = request.getParameter("pati_weight")==null ? "" : request.getParameter("pati_weight");
String pati_recuperation_num = request.getParameter("pati_recuperation_num")==null ? "" : request.getParameter("pati_recuperation_num");
String pati_recuperation_grade = request.getParameter("pati_recuperation_grade")==null ? "" : request.getParameter("pati_recuperation_grade");
String pati_living_meal = request.getParameter("pati_living_meal")==null ? "" : request.getParameter("pati_living_meal");
String pati_living_walk = request.getParameter("pati_living_walk")==null ? "" : request.getParameter("pati_living_walk");
String pati_living_dress = request.getParameter("pati_living_dress")==null ? "" : request.getParameter("pati_living_dress");
String pati_living_bathroom = request.getParameter("pati_living_bathroom")==null ? "" : request.getParameter("pati_living_bathroom");
String pati_diseaseinfo = request.getParameter("pati_diseaseinfo")==null ? "" : request.getParameter("pati_diseaseinfo");
String pati_food_like = request.getParameter("pati_food_like")==null ? "" : request.getParameter("pati_food_like");
String pati_food_hate = request.getParameter("pati_food_hate")==null ? "" : request.getParameter("pati_food_hate");
String pati_food_allergy = request.getParameter("pati_food_allergy")==null ? "" : request.getParameter("pati_food_allergy");
String pati_food_diabetes = request.getParameter("pati_food_diabetes")==null ? "" : request.getParameter("pati_food_diabetes");
String pati_singularity_habit = request.getParameter("pati_singularity_habit")==null ? "" : request.getParameter("pati_singularity_habit");
String pati_singularity_tendency = request.getParameter("pati_singularity_tendency")==null ? "" : request.getParameter("pati_singularity_tendency");
String pati_hospital_regidateStr = request.getParameter("pati_hospital_regidateStr")==null ? "" : request.getParameter("pati_hospital_regidateStr");


SimpleDateFormat sdf3 = new SimpleDateFormat("yyyy-MM-dd");
java.util.Date date3 = sdf3.parse(pati_hospital_regidateStr);
java.sql.Date pati_hospital_regidate = new java.sql.Date(date3.getTime()); 

String user_id = request.getParameter("user_id");

//DB연결
String driver = application.getInitParameter("JDBCDriver");
String url = application.getInitParameter("ConnectionURL");
PatientDAO dao = new PatientDAO(driver, url);

JSONArray jsonArray = new JSONArray();
PatientDTO dto = new PatientDTO();
dto.setPati_name(pati_name);
dto.setPati_blood(pati_blood);
dto.setPati_birthdate(pati_birthdate);
dto.setPati_sex(pati_sex);
dto.setPati_relation(pati_relation);
dto.setPati_address(pati_address);
dto.setPati_living(pati_living);
dto.setPati_housingtype(pati_housingtype);
dto.setPati_religion(pati_religion);
dto.setPati_height(pati_height);
dto.setPati_weight(pati_weight);
dto.setPati_recuperation_num(pati_recuperation_num);
dto.setPati_recuperation_grade(pati_recuperation_grade);
dto.setPati_living_meal(pati_living_meal);
dto.setPati_living_walk(pati_living_walk);
dto.setPati_living_dress(pati_living_dress);
dto.setPati_living_bathroom(pati_living_bathroom);
dto.setPati_diseaseinfo(pati_diseaseinfo);
dto.setPati_food_like(pati_food_like);
dto.setPati_food_hate(pati_food_hate);
dto.setPati_food_allergy(pati_food_allergy);
dto.setPati_food_diabetes(pati_food_diabetes);
dto.setPati_food_diabetes(pati_food_diabetes);
dto.setPati_singularity_habit(pati_singularity_habit);
dto.setPati_singularity_tendency(pati_singularity_tendency);
dto.setPati_hospital_regidate(pati_hospital_regidate);
dto.setUser_id(user_id);

dao.insert(dto);





out.print(jsonArray.toJSONString());
%>