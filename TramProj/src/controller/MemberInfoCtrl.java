package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.MemberListDAO;
import model.MemberListDTO;
import model.SanatoriumCommentDTO;
import model.SanatoriumDAO;


@WebServlet("/MemberInfoCtrl.do")
public class MemberInfoCtrl extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String user_id = req.getParameter("user_id");
		ServletContext application = this.getServletContext();
		MemberListDAO dao = new MemberListDAO(application);
		
		MemberListDTO dto = dao.memberInfo(user_id);
		
		SanatoriumDAO sandao = new SanatoriumDAO(application);
		List<SanatoriumCommentDTO> colists = sandao.idCommetList(user_id);
		   
	    //코멘트 리스트 저장
	    req.setAttribute("colists", colists);
	    
		//DTO객체를 리퀘스트 영역에 저장
		req.setAttribute("memberInfo", dto);
		RequestDispatcher dis =
				req.getRequestDispatcher("/member/memberInfo.jsp");
		dis.forward(req, resp);
		
		
	}

}
