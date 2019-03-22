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

@WebServlet("/Sanatorium1UpdateCtrl.do")
public class Sanatorium1UpdateCtrl extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

	
		// 파라미터 값 받기
		String organ_idx = req.getParameter("organ_idx");
		String user_id = req.getParameter("user_id");
		String organ_type = req.getParameter("organ_type");
		String organ_view = req.getParameter("organ_view");
		String organ_name = req.getParameter("organ_name");
		String organ_grade = req.getParameter("organ_grade");
		String organ_address = req.getParameter("organ_address");
		String organ_call = req.getParameter("organ_call");
	
		String organ_fund = req.getParameter("organ_fund");
		String organ_comment = req.getParameter("organ_comment");
	
		String organ_care = req.getParameter("organ_care");
		String organ_loca = req.getParameter("organ_loca");
		String organ_reli = req.getParameter("organ_reli");
		String organ_pay = req.getParameter("organ_pay");
		String organ_subject = req.getParameter("organ_subject");
		String organ_ref = req.getParameter("organ_ref");
		String organ_patnum = req.getParameter("organ_patnum");
		String organ_docnum = req.getParameter("organ_docnum");
		String organ_nurnum = req.getParameter("organ_nurnum");
		String organ_staffnum = req.getParameter("organ_staffnum");
		String organ_disease1 = req.getParameter("organ_disease1");
		String organ_disease2 = req.getParameter("organ_disease2");
		String organ_disease3 = req.getParameter("organ_disease3");
		String organ_disease = organ_disease1 + "," + organ_disease2 + "," + organ_disease3;
	
		int organ_life1 = Integer.parseInt(req.getParameter("organ_life1"));
		int organ_life2 = Integer.parseInt(req.getParameter("organ_life2"));
		int organ_life3 = Integer.parseInt(req.getParameter("organ_life3"));
	
		String organ_life = organ_life1 + "," + organ_life2 + "," + organ_life3 + "";
	
		int organ_eval1 = Integer.parseInt(req.getParameter("organ_eval1"));
		int organ_eval2 = Integer.parseInt(req.getParameter("organ_eval2"));
		int organ_eval3 = Integer.parseInt(req.getParameter("organ_eval3"));
	
		String organ_eval = organ_eval1 + "," + organ_eval2 + "," + organ_eval3 + "";
	
		String organ_time = "";
	
		if (req.getParameter("organ_timeCheck1") == null) {
			organ_time += req.getParameter("organ_time11");
			organ_time += "~";
			organ_time += req.getParameter("organ_time12");
			organ_time += ",";
			System.out.println(organ_time);
		} else {
			organ_time += "없음,";
		}
	
		if (req.getParameter("organ_timeCheck2") == null) {
			organ_time += req.getParameter("organ_time21");
			organ_time += "~";
			organ_time += req.getParameter("organ_time22");
			organ_time += ",";
		} else {
			organ_time += "없음,";
		}
	
		if (req.getParameter("organ_timeCheck3") == null) {
			organ_time += req.getParameter("organ_time31");
			organ_time += "~";
			organ_time += req.getParameter("organ_time32");
			organ_time += ",";
		} else {
			organ_time += "없음,";
		}
	
		if (req.getParameter("organ_timeCheck4") == null) {
			organ_time += req.getParameter("organ_time41");
			organ_time += "~";
			organ_time += req.getParameter("organ_time42");
			organ_time += ",";
		} else {
			organ_time += "없음,";
		}
		if (req.getParameter("organ_timeCheck5") == null) {
			organ_time += req.getParameter("organ_time51");
			organ_time += "~";
			organ_time += req.getParameter("organ_time52");
			organ_time += ",";
		} else {
			organ_time += "없음,";
		}
		if (req.getParameter("organ_timeCheck6") == null) {
			organ_time += req.getParameter("organ_time61");
			organ_time += "~";
			organ_time += req.getParameter("organ_time62");
			organ_time += ",";
		} else {
			organ_time += "없음,";
		}
		if (req.getParameter("organ_timeCheck7") == null) {
			organ_time += req.getParameter("organ_time71");
			organ_time += "~";
			organ_time += req.getParameter("organ_time72");
			organ_time += ",";
		} else {
			organ_time += "없음,";
		}
		if (req.getParameter("organ_timeCheck8") == null) {
			organ_time += req.getParameter("organ_time81");
			organ_time += "~";
			organ_time += req.getParameter("organ_time82");
		} else {
			organ_time += "없음";
		}
		System.out.println("최종"+organ_time);
		

		// 서블릿에서 application내장객체를 가져옴
		ServletContext application = this.getServletContext();
		// DAO객체 생성 및 DB연결
	
		SanatoriumDAO dao = new SanatoriumDAO(application.getInitParameter("JDBCDriver"),
				application.getInitParameter("ConnectionURL"));
		SanatoriumDTO dto = new SanatoriumDTO();
		dto.setOrgan_name(organ_name);
		dto.setOrgan_address(organ_address);
		dto.setOrgan_grade(organ_grade);
		dto.setOrgan_fund(organ_fund);
		dto.setOrgan_care(organ_care);
		dto.setOrgan_loca(organ_loca);
		dto.setOrgan_reli(organ_reli);
		dto.setOrgan_call(organ_call);
		dto.setOrgan_pay(Integer.parseInt(organ_pay));
		dto.setOrgan_subject(organ_subject);
		dto.setOrgan_time(organ_time);
		dto.setOrgan_ref(organ_ref);
		dto.setOrgan_patnum(Integer.parseInt(organ_patnum));
		dto.setOrgan_docnum(Integer.parseInt(organ_docnum));
		dto.setOrgan_nurnum(Integer.parseInt(organ_nurnum));
		dto.setOrgan_staffnum(Integer.parseInt(organ_staffnum));
		dto.setOrgan_disease(organ_disease);
		dto.setOrgan_life(organ_life);
		dto.setOrgan_eval(organ_eval);
		dto.setOrgan_view(organ_view);
		dto.setUser_id(user_id);
		dto.setOrgan_comment(organ_comment);
		dto.setOrgan_idx(organ_idx);
		
		
		int re = 0;
		re = dao.reference1update(dto);
		System.out.println("1. re=1 이면 reference1update 성공" + re);
	
		if (re == 1) {
		
			re = dao.typeUpdate(dto);
			System.out.println("2. re=1 이면 typeUpdate 성공" + re);
			
			req.setAttribute("UPDATE", "변경!" );
			
		}
		
		// 포워드(리퀘스트 영역이 공유됨)
		RequestDispatcher dis = req.getRequestDispatcher("/SanatoriumInfoCtrl.do?organ_idx="+organ_idx
		+"&organ_type="+organ_type);
		dis.forward(req, resp);
		
	}
}