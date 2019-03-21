package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PatientDAO;
import model.PatientDTO;

@WebServlet("/PatientModfiyCtrl.do")
public class PatientModfiyCtrl extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		// 파라미터 값 받기
		String pati_idx = req.getParameter("pati_idx");
		String user_id = req.getParameter("user_id");
		String pati_name = req.getParameter("pati_name");
		String pati_sex = req.getParameter("pati_sex");

		String pati_birthdateStr = req.getParameter("pati_birthdate");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date2 = null;
		try {
			date2 = sdf2.parse(pati_birthdateStr);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		java.sql.Date pati_birthdate = new java.sql.Date(date2.getTime());

		String pati_blood = req.getParameter("pati_blood");
		String pati_relation = req.getParameter("pati_relation");
		String pati_address = req.getParameter("pati_address");
		String pati_living = req.getParameter("pati_living");
		String pati_housingtype = req.getParameter("pati_housingtype");
		String pati_religion = req.getParameter("pati_religion");
		String pati_height = req.getParameter("pati_height");
		String pati_weight = req.getParameter("pati_weight");
		String pati_recuperation_num = req.getParameter("pati_recuperation_num");
		String pati_recuperation_grade = req.getParameter("pati_recuperation_grade");
		String pati_living_meal = req.getParameter("pati_living_meal");
		String pati_living_walk = req.getParameter("pati_living_walk");
		String pati_living_wash = req.getParameter("pati_living_wash");
		String pati_living_dress = req.getParameter("pati_living_dress");
		String pati_living_bathe = req.getParameter("pati_living_bathe");
		String pati_living_bathroom = req.getParameter("pati_living_bathroom");
		String pati_diseaseinfo = req.getParameter("pati_diseaseinfo");
		String pati_food_like = req.getParameter("pati_food_like");
		String pati_food_hate = req.getParameter("pati_food_hate");
		String pati_food_allergy = req.getParameter("pati_food_allergy");
		String pati_food_diabetes = req.getParameter("pati_food_diabetes");
		String pati_singularity_habit = req.getParameter("pati_singularity_habit");
		String pati_singularity_tendency = req.getParameter("pati_singularity_tendency");
		String pati_singularity_language = req.getParameter("pati_singularity_language");
		String organ_idx = req.getParameter("organ_idx");
		if (organ_idx.equals("등록안됨")) {
			organ_idx = null;
		}

		String hospital_regidateStr = req.getParameter("pati_hospital_regidate");
		java.sql.Date pati_hospital_regidate = null;
		if (!(hospital_regidateStr == null || hospital_regidateStr.equals(""))) {
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date date1 = null;
			try {
				date1 = sdf1.parse(hospital_regidateStr);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			pati_hospital_regidate = new java.sql.Date(date1.getTime());
		}

		// 서블릿에서 application내장객체를 가져옴
		ServletContext application = this.getServletContext();
		// DAO객체 생성 및 DB연결

		PatientDAO dao = new PatientDAO(application.getInitParameter("JDBCDriver"),
				application.getInitParameter("ConnectionURL"));
		PatientDTO dto = new PatientDTO();

		dto.setPati_idx(pati_idx);
		dto.setPati_name(pati_name);
		dto.setPati_blood(pati_blood);
		dto.setPati_birthdate(pati_birthdate);
		dto.setPati_sex(pati_sex);
		dto.setPati_relation(pati_relation);
		dto.setPati_address(pati_address);
		dto.setPati_living(pati_living);
		dto.setPati_housingtype(pati_housingtype);
		dto.setPati_religion(pati_religion);
		dto.setPati_height(pati_height);
		dto.setPati_weight(pati_weight);
		dto.setPati_recuperation_num(pati_recuperation_num);
		dto.setPati_recuperation_grade(pati_recuperation_grade);
		dto.setPati_living_meal(pati_living_meal);
		dto.setPati_living_walk(pati_living_walk);
		dto.setPati_living_wash(pati_living_wash);
		dto.setPati_living_dress(pati_living_dress);
		dto.setPati_living_bathe(pati_living_bathe);
		dto.setPati_living_bathroom(pati_living_bathroom);
		dto.setPati_diseaseinfo(pati_diseaseinfo);
		dto.setPati_food_like(pati_food_like);
		dto.setPati_food_hate(pati_food_hate);
		dto.setPati_food_allergy(pati_food_allergy);
		dto.setPati_food_diabetes(pati_food_diabetes);
		dto.setPati_singularity_habit(pati_singularity_habit);
		dto.setPati_singularity_tendency(pati_singularity_tendency);
		dto.setPati_singularity_language(pati_singularity_language);

		if (!(hospital_regidateStr == null || hospital_regidateStr.equals(""))) {
			dto.setPati_hospital_regidate(pati_hospital_regidate);
		} else {
			dto.setPati_hospital_regidate(null);
		}

		dto.setUser_id(user_id);
		dto.setOrgan_idx(organ_idx);

		// View로 데이터를 전달하기 위해 request객체에 속성 저장
		req.setAttribute("patient", dto);

		int sucOrFail = dao.patientUpdate(dto);

		if (sucOrFail == 1) {
			req.setAttribute("RESULT", "1");
		} else {
			req.setAttribute("RESULT", "0");
		}

		req.getRequestDispatcher("/PatientInfoCtrl.do?pati_idx=" + pati_idx).forward(req, resp);
	}
}