<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="model.SanatoriumDTO"%>
<%@page import="java.util.List"%>
<%@page import="model.SanatoriumDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	SanatoriumDAO dao = new SanatoriumDAO(application.getInitParameter("JDBCDriver"), application.getInitParameter("ConnectionURL"));
List<String> list = dao.newOrganIdxList();
JSONArray jsonArray = new JSONArray();

for(String organ_idx : list){
	SanatoriumDTO dto = dao.typeInfo(organ_idx);
	String organ_type = dto.getOrgan_type();
	
	dto = dao.getReference(organ_idx, organ_type);
	JSONObject jsonObject = new JSONObject();
	jsonObject.put("organ_idx", dto.getOrgan_idx());
	jsonObject.put("organ_name", dto.getOrgan_name());
	jsonObject.put("organ_type", dto.getOrgan_type());
	//jsonObject.put("organ_regidate", dto.getOrgan_regidate());
	jsonObject.put("organ_address", dto.getOrgan_address());

	jsonArray.add(jsonObject);
}
JSONObject object = new JSONObject();
object.put("num", dao.countList());
object.put("list", jsonArray);

out.println(object);
%>