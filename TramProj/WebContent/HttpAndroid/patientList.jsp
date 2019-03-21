<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="model.PatientDTO"%>
<%@page import="java.util.List"%>
<%@page import="model.PatientDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
PatientDAO dao = new PatientDAO(application.getInitParameter("JDBCDriver"), application.getInitParameter("ConnectionURL"));

List<PatientDTO> list = dao.memberList(request.getParameter("user_id"));

JSONArray jsonArray = new JSONArray();
JSONObject object = new JSONObject();
if(list.size()==0){
	object.put("isList", 0);
	
	out.println(object);
	return;
} else{
	object.put("isList", 1);	
}
for(PatientDTO dto : list){
	JSONObject jsonObject = new JSONObject();
	jsonObject.put("pati_idx", dto.getPati_idx());
	jsonObject.put("pati_name", dto.getPati_name());
	jsonObject.put("pati_blood", dto.getPati_blood());
	jsonObject.put("pati_regidate", dto.getPati_regidate());
	jsonObject.put("pati_birthdate", dto.getPati_birthdate());
	jsonObject.put("pati_sex", dto.getPati_sex());
	jsonObject.put("pati_relation", dto.getPati_relation());
	jsonObject.put("pati_address", dto.getPati_address());
	jsonObject.put("pati_living", dto.getPati_living());
	jsonObject.put("pati_housingtype", dto.getPati_housingtype());
	jsonObject.put("pati_religion", dto.getPati_religion());
	jsonObject.put("pati_height", dto.getPati_height());
	jsonObject.put("pati_weight", dto.getPati_weight());
	jsonObject.put("pati_recuperation_num", dto.getPati_recuperation_num());
	jsonObject.put("pati_recuperation_grade", dto.getPati_recuperation_grade());
	jsonObject.put("pati_living_meal", dto.getPati_living_meal());
	jsonObject.put("pati_living_walk", dto.getPati_living_walk());
	jsonObject.put("pati_living_wash", dto.getPati_living_wash());
	jsonObject.put("pati_living_dress", dto.getPati_living_dress());
	jsonObject.put("pati_living_bathe", dto.getPati_living_bathe());
	jsonObject.put("pati_living_bathroom", dto.getPati_living_bathroom());
	jsonObject.put("pati_diseaseinfo", dto.getPati_diseaseinfo());
	jsonObject.put("pati_food_like", dto.getPati_food_like());
	jsonObject.put("pati_food_hate", dto.getPati_food_hate());
	jsonObject.put("pati_food_allergy", dto.getPati_food_allergy());
	jsonObject.put("pati_food_diabetes", dto.getPati_food_diabetes());
	jsonObject.put("pati_singularity_habit", dto.getPati_singularity_habit());
	jsonObject.put("pati_singularity_tendency", dto.getPati_singularity_tendency());
	jsonObject.put("pati_singularity_language", dto.getPati_singularity_language());
	jsonObject.put("pati_hospital_regidate", dto.getPati_hospital_regidate());
	jsonObject.put("user_id", dto.getUser_id());

	jsonArray.add(jsonObject);
}
object.put("list", jsonArray);
out.println(object);
%>