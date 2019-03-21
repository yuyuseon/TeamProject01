package controller;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PatientDAO;
import model.PatientDTO;



@WebServlet("/PatientInfoCtrl.do")
public class PatientInfoCtrl extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String pati_idx = req.getParameter("pati_idx");
		ServletContext application = this.getServletContext();
		PatientDAO dao = new PatientDAO(application.getInitParameter("JDBCDriver"), application.getInitParameter("ConnectionURL"));
		
		PatientDTO dto = dao.memberInfo(pati_idx);
		
	    
		//DTO객체를 리퀘스트 영역에 저장
		req.setAttribute("patientInfo", dto);
		RequestDispatcher dis =
				req.getRequestDispatcher("/patient/patientInfo.jsp");
		dis.forward(req, resp);
		
		
	}

}
