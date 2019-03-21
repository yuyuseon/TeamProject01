package controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.SanatoriumDAO;
import model.SanatoriumDTO;


@WebServlet("/CommentDelete.do")
public class CommentDelete extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String organ_idx = req.getParameter("organ_idx");
		String comment_idx = req.getParameter("comment_idx");
		
		
		ServletContext application = this.getServletContext();
		SanatoriumDAO dao =new SanatoriumDAO(application);
		int affecter = dao.delete(comment_idx);
		SanatoriumDTO dto = dao.typeInfo(organ_idx);
		
		
		if(affecter==1) {
			req.setAttribute("ERROR_MSG", "댓글삭제완료");
		}
		else {
		}
		 
		req.getRequestDispatcher("/SanatoriumInfoCtrl.do?organ_idx="+organ_idx+"&organ_type="+dto.getOrgan_type())
			.forward(req, resp);
	}
}
