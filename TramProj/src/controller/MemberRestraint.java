package controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberListDAO;

/* 어노테이션을 이용한 매핑(이 경우 web.xml은 필요없다) */
@WebServlet("/MemberRestraint.do")
public class MemberRestraint extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String user_id = req.getParameter("user_id");
		String restraint = req.getParameter("restraint");
		System.out.println("sss"+restraint);
		
		ServletContext application = this.getServletContext();
		MemberListDAO dao = new MemberListDAO(application);
		
		int affected = dao.restraint(user_id, restraint);
		
		if(affected==1) {
			req.setAttribute("RESULT", "1");
		}
		else {
			req.setAttribute("RESULT", "0");
		}
		
		
		
		req.getRequestDispatcher("/MemberInfoCtrl.do?user_id="+user_id)
		.forward(req, resp);
		
	}

}
