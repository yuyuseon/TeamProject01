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

import model.SanatoriumCommentDTO;
import model.SanatoriumDAO;
import model.SanatoriumDTO;


@WebServlet("/SanatoriumInfoCtrl.do")
public class SanatoriumInfoCtrl extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String organ_idx = req.getParameter("organ_idx");
		String organ_type = req.getParameter("organ_type");
		System.out.println("요고요고"+organ_type);
		ServletContext application = this.getServletContext();
		SanatoriumDAO dao = new SanatoriumDAO(application);
		
		SanatoriumDTO dto = new SanatoriumDTO();
		
		String path;
		if(organ_type.equals("요양병원")) {
			dto = dao.reference2Info(organ_idx);
			path="/sanatorium/sanatoriumInfo2.jsp";
		}
		else if(organ_type.equals("요양원")){
			dto = dao.reference2Info(organ_idx);
			path="/sanatorium/sanatoriumInfo2.jsp";
		}
		else {
			dto = dao.reference2Info(organ_idx);
			path="/sanatorium/sanatoriumInfo2.jsp";
		}
		
		List<SanatoriumCommentDTO> colists = dao.commetList(organ_idx);
		   
	    //View로 데이터를 전달하기 위해 request객체에 속성 저장
	    req.setAttribute("colists", colists);
		
		//DTO객체를 리퀘스트 영역에 저장
		req.setAttribute("sanatoriumInfo", dto);
		req.setAttribute("organ_type", organ_type);
		
		//자원 해제
		dao.close();

		RequestDispatcher dis =
				req.getRequestDispatcher(path);
		dis.forward(req, resp);
		
		
	}

}
