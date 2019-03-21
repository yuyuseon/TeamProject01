package controller;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/* 어노테이션을 이용한 매핑(이 경우 web.xml은 필요없다) */
@WebServlet("/MainCtrl.do")
public class MainCtrl extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	   
		
		HttpSession session = req.getSession();
		if(session.getAttribute("TYPE")!=null) {
			if(session.getAttribute("TYPE").toString().equals("페이지관리자")) {
				//포워드(리퀘스트 영역이 공유됨)
				RequestDispatcher dis = req.getRequestDispatcher("/main.jsp");
				dis.forward(req, resp);
			}
		}
		else {
			//포워드(리퀘스트 영역이 공유됨)
			RequestDispatcher dis = req.getRequestDispatcher("/member/login.jsp");
			dis.forward(req, resp);
		}
		
	}
	
}
