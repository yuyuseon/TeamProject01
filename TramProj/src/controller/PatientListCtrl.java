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

import model.PatientDAO;
import model.PatientDTO;



@WebServlet("/PatientListCtrl.do")
public class PatientListCtrl extends HttpServlet {
   
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   
	   //서블릿에서 application내장객체를 가져옴
	   ServletContext application= this.getServletContext();
	   //DAO객체 생성 및 DB연결
	   
	   PatientDAO dao = new PatientDAO(application.getInitParameter("JDBCDriver"), application.getInitParameter("ConnectionURL"));
	   
	   List<PatientDTO> lists = dao.patientList();
	   
	   
	   
	   //View로 데이터를 전달하기 위해 request객체에 속성 저장
	   req.setAttribute("patient", lists);
	   
	   
	   
	   //자원 해제
	   dao.close();
	   
	   //포워드(리퀘스트 영역이 공유됨)
	   RequestDispatcher dis = req.getRequestDispatcher("/patient/patientList.jsp");
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