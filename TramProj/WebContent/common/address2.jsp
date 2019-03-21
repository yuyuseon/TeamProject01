<%@page import="model.AddressDAO"%>
<%@page import="java.util.List"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String address1 = request.getParameter("address1");
JSONObject object = new JSONObject();
try {
	System.out.println("제발~2");
   /* req.setCharacterEncoding("UTF-8");
   resp.setContentType("text/html;charset=UTF-8"); */
   AddressDAO dao = new AddressDAO(application.getInitParameter("JDBCDriver"), application.getInitParameter("ConnectionURL"));
   List<String> address2 = dao.address2(address1);
   StringBuffer str = new StringBuffer();
   for(String address : address2) {
      if(address == null) continue;
      str.append("<option value='"+address+"'>"+address+"</option>");
   }
   object.put("address2", str.toString());
   out.println(object);
   /* resp.getWriter().println(object); */
} catch (Exception e) {
   // TODO Auto-generated catch block
   e.printStackTrace();
}
%>