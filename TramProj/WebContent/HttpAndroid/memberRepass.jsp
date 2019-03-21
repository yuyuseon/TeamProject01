<%@page import="org.json.simple.JSONObject"%>
<%@page import="model.MemberDAO"%>
<%@page import="java.util.UUID"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="smtp.SMTPAuth"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//한글깨짐방지
request.setCharacterEncoding("UTF-8");

String from = "opgssvtest@naver.com";
String id = request.getParameter("user_id");
String subject = "[요양선]임시 비밀번호를 제공해 드립니다.";
String repass = UUID.randomUUID().toString().substring(0, 6);

JSONObject jsonObject = new JSONObject();

MemberDAO dao = new MemberDAO(application.getInitParameter("JDBCDriver"), application.getInitParameter("ConnectionURL"));
if(!dao.isMember(id)){
	jsonObject.put("isRepass", 0);
	jsonObject.put("msg", "등록된 메일주소가 없습니다.");
	out.println(jsonObject);
	return;
}

if(!dao.rePass(id, repass)){
	jsonObject.put("isRepass", 0);
	jsonObject.put("msg", "이메일 전송에 실패했습니다. 다시 시도해주세요");
	out.println(jsonObject);
	return;
}

String content = "고객님("+id+")의 임시 비밀번호는 [ "+repass+" ]입니다\n새로운 비밀번호로 변경해 주세요";

if(content!=null){
	Properties p = new Properties(); // 정보를 담을 객체
	 
	// SMTP 서버에 접속하기 위한 정보들
	p.put("mail.smtp.host","smtp.naver.com"); // 네이버 SMTP	 
	p.put("mail.smtp.port", "465");
	p.put("mail.smtp.starttls.enable", "true");
	p.put("mail.smtp.auth", "true");
	p.put("mail.smtp.debug", "true");
	p.put("mail.smtp.socketFactory.port", "465");
	p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	p.put("mail.smtp.socketFactory.fallback", "false");

	try{
	    Authenticator auth = new SMTPAuth();
	    Session ses = Session.getInstance(p, auth);
	     
	    ses.setDebug(true);
	     
	    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
	    msg.setSubject(subject); // 제목
	     
	    Address fromAddr = new InternetAddress(from);
	    msg.setFrom(fromAddr); // 보내는 사람
	     
	    Address toAddr = new InternetAddress(id);
	    msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
	     
	    msg.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩
	     
	    Transport.send(msg); // 전송
	} 
	catch(Exception e){
	    e.printStackTrace();
	    //out.println("<script>alert('메일전송에 실패했습니다.ㅜㅜ;');history.back();</script>");	    
	    return;
	}
	
	//JavascriptUtil.jsAlertLocation("메일이 발송되었습니다", "email_sending.jsp", out);	
	
	jsonObject.put("isRepass", 1);
	jsonObject.put("msg", "임시 비밀번호가 발송되었습니다.\n이메일을 확인해주세요");
	out.println(jsonObject);
	
	return;
}
%>