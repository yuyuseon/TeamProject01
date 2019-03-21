package controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberListDAO;


/* 어노테이션을 이용한 매핑(이 경우 web.xml은 필요없다) */
@WebServlet("/LoginCtrl.do")
public class LoginCtrl extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String user_id = req.getParameter("inputEmail");
		String user_pass = req.getParameter("inputPassword");

		System.out.println(user_id);
		
		ServletContext application = this.getServletContext();
		MemberListDAO dao = new MemberListDAO(application);


		Map<String,String> memInfo = dao.getMemberMap(user_id, user_pass);
		HttpSession session = req.getSession();
		if(memInfo.get("user_type")!=null){
			System.out.println("로그인 성공");
			//Map에서 꺼내온 이름을 세션 영역에 저장한다.
			session.setAttribute("TYPE", memInfo.get("user_type"));
			//회원 인증에 성공
			session.setAttribute("USER_ID", user_id);
			session.setAttribute("LOGIN", "1");
			
			resp.sendRedirect("main.jsp");
			
		}
		else{
			//회원 인증에 실패
			System.out.println("로그인 실패");
			session.setAttribute("TYPE", null);
			req.getRequestDispatcher("main.jsp").forward(req, resp);
		}
		
	}
}
