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

import model.SanatoriumDAO;
import model.SanatoriumDTO;


/* 어노테이션을 이용한 매핑(이 경우 web.xml은 필요없다) */
@WebServlet("/SanatoriumListCtrl.do")
public class SanatoriumListCtrl extends HttpServlet {
   
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   
	   //서블릿에서 application내장객체를 가져옴
	   ServletContext application= this.getServletContext();
	   //DAO객체 생성 및 DB연결
	   
	   SanatoriumDAO dao = new SanatoriumDAO(application);
	   
	   String organ_view = req.getParameter("organ_view");
	   int result = -1;
	   if(organ_view!=null) {
		   if(organ_view.equals("미노출")) {
			   String organ_idx = req.getParameter("organ_idx");
			   String organ_type = req.getParameter("organ_type");
			   if(organ_type.equals("요양병원")) {
				   result = dao.exposureModified1(organ_idx, organ_view);
			   }
			   else if(organ_type.equals("요양원")){
				   result = dao.exposureModified2(organ_idx, organ_view);
			   }
			   else {
				   result = dao.exposureModified3(organ_idx, organ_view);
			   }
			   
			   req.setAttribute("Modified", result);
		   }
		   else {
			   String organ_idx = req.getParameter("organ_idx");
			   String organ_type = req.getParameter("organ_type");
			   if(organ_type.equals("요양병원")) {
				   result = dao.exposureModified1(organ_idx, organ_view);
			   }
			   else if(organ_type.equals("요양원")){
				   result = dao.exposureModified2(organ_idx, organ_view);
			   }
			   else {
				   result = dao.exposureModified3(organ_idx, organ_view);
			   }
			   req.setAttribute("Modified", result);
		   }
	   }
	   
	   
	   
	   
	   List<SanatoriumDTO> lists = dao.sanatoriumList();
	   
	   
	   //View로 데이터를 전달하기 위해 request객체에 속성 저장
	   req.setAttribute("lists", lists);
	   
	   
	   //자원 해제
	   dao.close();
	   
	   //포워드(리퀘스트 영역이 공유됨)
	   RequestDispatcher dis = req.getRequestDispatcher("/sanatorium/sanatoriumList.jsp");
	   dis.forward(req, resp);
	   
   }
    
   @Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   /*
	   Post로 들어온 요청도 doGet()메소드로 처리하도록 한다.
	   ※Post로 들어온 요청을 받을 doGet()메소드가 없으면
	   405에러가 발생하므로 주의해야한다.
	   */
	   doGet(req, resp);
	   
	}
}