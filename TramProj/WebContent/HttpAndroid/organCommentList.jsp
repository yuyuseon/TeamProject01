<%@page import="model.SanatoriumCommentDTO"%>
<%@page import="model.SanatoriumDAO"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String organ_idx = request.getParameter("organ_idx");

SanatoriumDAO dao = new SanatoriumDAO(application.getInitParameter("JDBCDriver"), application.getInitParameter("ConnectionURL"));
JSONArray cojsonArray = new JSONArray();

List<SanatoriumCommentDTO> coList = dao.commetList(organ_idx);
JSONObject object = new JSONObject();

object.put("isList", coList.size()==0? "0":"1");

for(SanatoriumCommentDTO m : coList){
	JSONObject jsonObject = new JSONObject();
	
	jsonObject.put("comment_idx", m.getComment_idx() );
	jsonObject.put("comment_rating", m.getComment_rating() );
	jsonObject.put("comment_com", m.getComment_com() );
	jsonObject.put("organ_idx", m.getOrgan_idx());
	jsonObject.put("user_id", m.getUser_id() );
	
	
	cojsonArray.add(jsonObject);
	
}
String str = String.format("%.2f", dao.avgRating(organ_idx));

object.put("avgRating", str);
object.put("list", cojsonArray);

out.println(object);
%>