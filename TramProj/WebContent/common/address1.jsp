<%@page import="model.AddressDAO"%>
<%@page import="java.util.List"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");

JSONObject object = new JSONObject();
try {
	System.out.println("제발~");
   /* req.setCharacterEncoding("UTF-8");
   resp.setContentType("text/html;charset=UTF-8"); */
   AddressDAO dao = new AddressDAO(application.getInitParameter("JDBCDriver"), application.getInitParameter("ConnectionURL"));
   List<String> address1 = dao.address1();
   StringBuffer str = new StringBuffer();
   for(String address : address1) {
      if(address == null) continue;
      str.append("<option value='"+address+"'>"+address+"</option>");
   }
   object.put("address1", str.toString());
   out.println(object);
   /* resp.getWriter().println(object); */
} catch (Exception e) {
   // TODO Auto-generated catch block
   e.printStackTrace();
}
%>