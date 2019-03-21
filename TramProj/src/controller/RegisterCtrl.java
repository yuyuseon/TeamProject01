package controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberListDAO;
import model.MemberListDTO;



/* 어노테이션을 이용한 매핑(이 경우 web.xml은 필요없다) */
@WebServlet("/RegisterCtrl.do")
public class RegisterCtrl extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("email");
		String domain = req.getParameter("domain");
		String user_id = id+"@"+domain;
		String name = req.getParameter("name");
		String pass = req.getParameter("pass1");
		String phone1 = req.getParameter("phoneNum1");
		String phone2 = req.getParameter("phoneNum2");
		String phone3 = req.getParameter("phoneNum3");
		String phone = (phone1+phone2+phone3);
		
		MemberListDTO dto = new MemberListDTO();
		dto.setUser_id(user_id);
		dto.setUser_name(name);
		dto.setUser_pass(pass);
		dto.setUser_phone(phone);
		
		ServletContext application = this.getServletContext();
		MemberListDAO dao = new MemberListDAO(application);
		int affected = dao.memberRegist(dto);
		
		if(affected==1) {
			req.setAttribute("RESULT", "1");
		}
		else {
			req.setAttribute("RESULT", "0");
		}
		req.getRequestDispatcher("/member/login.jsp")
		.forward(req, resp);
	}
}
