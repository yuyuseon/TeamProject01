package controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import model.SanatoriumDTO;




/* 어노테이션을 이용한 매핑(이 경우 web.xml은 필요없다) */
@WebServlet("/SanatoriumInsertCtrl.do")
public class SanatoriumInsertCtrl extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//한글 처리
		req.setCharacterEncoding("UTF-8");
		
		String tyep = req.getParameter("new");
		
		if(tyep!=null) {
			if(tyep.equals("요양병원")) {
				req.setAttribute("organ_type", "요양병원");
				req.getRequestDispatcher("/sanatorium/sanatoriumInfoWrite2.jsp")
				.forward(req, resp);
				
			}
			else if(tyep.equals("요양원")){
				req.setAttribute("organ_type", "요양원");
				req.getRequestDispatcher("/sanatorium/sanatoriumInfoWrite2.jsp")
				.forward(req, resp);
			}
			else {
				req.setAttribute("organ_type", "방문시설");
				req.getRequestDispatcher("/sanatorium/sanatoriumInfoWrite2.jsp")
				.forward(req, resp);
			}
		}else {
			/*MultipartRequest mr = FileUtil.upload(req, 
					req.getServletContext().getRealPath("/Upload"));
			
			if(mr != null) {
				String organ_photo = "";//사진
				String attachedfile1 = mr.getFilesystemName("attachedfile1");
				String attachedfile2 = mr.getFilesystemName("attachedfile2");
				String attachedfile3 = mr.getFilesystemName("attachedfile3");
				
				organ_photo += attachedfile1;
				if(!(attachedfile2.equals("")||attachedfile2==null)) {
					organ_photo += "," + attachedfile2;
				}
				if(!(attachedfile3.equals("")||attachedfile3==null)) {
					organ_photo += "," + attachedfile3;
				}
				
				String organ_name = mr.getFilesystemName("organ_name");
				String organ_grade = mr.getFilesystemName("organ_grade");
				String organ_address = mr.getFilesystemName("organ_address");
				String organ_phone = mr.getFilesystemName("organ_phone");
				String organ_code = mr.getFilesystemName("organ_code");
				String organ_fundate = mr.getFilesystemName("organ_fundate");
				String organ_appdate = mr.getFilesystemName("organ_appdate");
				String organ_etc = mr.getFilesystemName("organ_etc");
				String organ_park = mr.getFilesystemName("organ_park");
				String organ_hr = mr.getFilesystemName("organ_hr");
				String organ_bedroom = mr.getFilesystemName("organ_bedroom");
				String organ_nonpayfood = mr.getFilesystemName("organ_nonpayfood");
				String organ_nonpaysnack = mr.getFilesystemName("organ_nonpaysnack");
				String organ_nonpayhaircut = mr.getFilesystemName("organ_nonpayhaircut");
				SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
				Date fundate = transFormat(organ_fundate);
				Date appdate = transFormat(organ_appdate);
				System.out.println("fundate"+fundate);
				System.out.println("appdate"+appdate);
				SanatoriumDTO dto = new SanatoriumDTO();
				dto.setOrgan_name(organ_name);
				dto.setOrgan_grade(organ_grade);
				dto.setOrgan_address(organ_address);
				dto.setOrgan_phone(organ_phone);
				dto.setOrgan_code(organ_code);
				dto.setOrgan_fundate(fundate);
				dto.setOrgan_appdate(appdate);
				dto.setOrgan_etc(organ_etc);
				dto.setOrgan_park(organ_park);
				dto.setOrgan_hr(organ_hr);
				dto.setOrgan_bedroom(organ_bedroom);
				dto.setOrgan_nonpayfood(organ_nonpayfood);
				dto.setOrgan_nonpaysnack(organ_nonpaysnack);
				dto.setOrgan_nonpayhaircut(organ_nonpayhaircut);
				
				*/
			} 
		}


	private Date transFormat(String organ_fundate) {
		// TODO Auto-generated method stub
		return null;
	}
}
