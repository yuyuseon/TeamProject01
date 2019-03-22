package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.SanatoriumDAO;
import model.SanatoriumDTO;

@WebServlet("/Sanatorium2UpdateCtrl.do")
public class Sanatorium2UpdateCtrl extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

	
		// 파라미터 값 받기
		String organ_idx = req.getParameter("organ_idx");
		String user_id = req.getParameter("user_id");
		String organ_type = req.getParameter("organ_type");
		String organ_name = req.getParameter("organ_name");
		String organ_grade = req.getParameter("organ_grade");
		String organ_address = req.getParameter("organ_address");
		String organ_phone = req.getParameter("organ_phone");
		String organ_code = req.getParameter("organ_code");
		String organ_view = req.getParameter("organ_view");
	
		String organ_fundateStr = req.getParameter("organ_fundate");
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date1 = null;
		try {
			date1 = sdf1.parse(organ_fundateStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		java.sql.Date organ_fundate = new java.sql.Date(date1.getTime());

		
		String organ_appdateStr = req.getParameter("organ_appdate");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date2 = null;
		try {
			date2 = sdf2.parse(organ_appdateStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		java.sql.Date organ_appdate = new java.sql.Date(date2.getTime());

		
		String organ_etc = req.getParameter("organ_etc");
		String organ_park = req.getParameter("organ_park");
		String organ_hr = req.getParameter("organ_hr");
		String organ_bedroom = req.getParameter("organ_bedroom");
		String organ_nonpayfood = req.getParameter("organ_nonpayfood");
		String organ_nonpaysnack = req.getParameter("organ_nonpaysnack");
		String organ_nonpayhaircut = req.getParameter("organ_nonpayhaircut");
		String organ_comment = req.getParameter("organ_comment");
	

		// 서블릿에서 application내장객체를 가져옴
		ServletContext application = this.getServletContext();
		// DAO객체 생성 및 DB연결
	
		SanatoriumDAO dao = new SanatoriumDAO(application.getInitParameter("JDBCDriver"),
				application.getInitParameter("ConnectionURL"));
		SanatoriumDTO dto = new SanatoriumDTO();
		dto.setOrgan_name(organ_name);
		dto.setOrgan_address(organ_address);
		dto.setOrgan_grade(organ_grade);
		dto.setOrgan_code(organ_code);
		dto.setOrgan_fundate(organ_fundate);
		dto.setOrgan_appdate(organ_appdate);
		dto.setOrgan_phone(organ_phone);
		dto.setOrgan_hr(organ_hr);
		dto.setOrgan_bedroom(organ_bedroom);
		dto.setOrgan_etc(organ_etc);
		dto.setOrgan_nonpayfood(organ_nonpayfood);
		dto.setOrgan_nonpaysnack(organ_nonpaysnack);
		dto.setOrgan_nonpayhaircut(organ_nonpayhaircut);
		dto.setOrgan_park(organ_park);
		dto.setUser_id(user_id);
		dto.setOrgan_view(organ_view);
		dto.setOrgan_comment(organ_comment);
		dto.setOrgan_idx(organ_idx);
		
		
		int re = 0;
		if(organ_type.equals("요양원")) {
			re = dao.reference2update(dto);
			System.out.println("1. re=1 이면 성공 / 요양원" + re);
		}else {
			re = dao.reference3update(dto);
			System.out.println("1. re=1 이면 성공 / 방문시설" + re);
		}
		
	
		if (re == 1) {
		
			re = dao.typeUpdate(dto);
			System.out.println("2. re=1 이면 typeUpdate 성공" + re);
			
			req.setAttribute("UPDATE", "변경!" );
		}else {
		}
		
		
		// 포워드(리퀘스트 영역이 공유됨)
		RequestDispatcher dis = req.getRequestDispatcher("/SanatoriumInfoCtrl.do?organ_idx="+organ_idx
		+"&organ_type="+organ_type);
		dis.forward(req, resp);
	}
}
