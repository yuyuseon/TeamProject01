package controller;

import java.io.IOException;
import java.util.ArrayList;
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
public class SanatoriumInfoCtrl extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String organ_idx = req.getParameter("organ_idx");
		String organ_type = req.getParameter("organ_type");
		ServletContext application = this.getServletContext();
		SanatoriumDAO dao = new SanatoriumDAO(application);

		SanatoriumDTO dto = new SanatoriumDTO();

		String path;
		if (organ_type.equals("요양병원")) {
			dto = dao.referenceInfo(organ_idx);
			path = "/sanatorium/sanatoriumInfo1.jsp";

			////////////////////////// 질병 자르기//////////////////////////
			String organ_disease = dto.getOrgan_disease();

			int lineCnt = 0;
			int fromIndex = -1;
			while ((fromIndex = organ_disease.indexOf(",", fromIndex + 1)) >= 0) {
				lineCnt++;
			}

			String re = "";
			ArrayList<String> text = new ArrayList<String>();
			for (int i = 0; i < lineCnt; i++) {
				int su;
				su = organ_disease.indexOf(",");
				re = organ_disease.substring(0, su);
				text.add(re);
				organ_disease = organ_disease.substring(su + 1);
			}
			text.add(organ_disease);

			for (int i = 0; i < text.size(); i++) {
				//System.out.println((i + 1) + text.get(i));
				req.setAttribute("organ_disease" + (i + 1), text.get(i));
			}
			////////////////////// 입원환자현황 자르기//////////////////////////////////////
			String organ_life = dto.getOrgan_life();

			lineCnt = 0;
			fromIndex = -1;
			while ((fromIndex = organ_life.indexOf(",", fromIndex + 1)) >= 0) {
				lineCnt++;
			}

			re = "";
			text.clear();
			for (int i = 0; i < lineCnt; i++) {
				int su;
				su = organ_life.indexOf(",");
				re = organ_life.substring(0, su);
				text.add(re);
				organ_life = organ_life.substring(su + 1);
			}
			text.add(organ_life);

			for (int i = 0; i < text.size(); i++) {
				//System.out.println((i + 1) + text.get(i));
				req.setAttribute("organ_life" + (i + 1), text.get(i).toString());
			}
			////////////////////// 평가정보현황(욕창) 자르기//////////////////////////////////////
			String organ_eval = dto.getOrgan_eval();

			lineCnt = 0;
			fromIndex = -1;
			while ((fromIndex = organ_eval.indexOf(",", fromIndex + 1)) >= 0) {
				lineCnt++;
			}

			re = "";
			text.clear();
			for (int i = 0; i < lineCnt; i++) {
				int su;
				su = organ_eval.indexOf(",");
				re = organ_eval.substring(0, su);
				text.add(re);
				organ_eval = organ_eval.substring(su + 1);
			}
			text.add(organ_eval);

			for (int i = 0; i < text.size(); i++) {
				//System.out.println((i + 1) + text.get(i));
				req.setAttribute("organ_eval" + (i + 1), text.get(i));
			}
			/////////////////////진료시간 자르기/////////////////////////////////////////
			String organ_time = dto.getOrgan_time();
			lineCnt = 0;
			fromIndex = -1;
			while ((fromIndex = organ_time.indexOf(",", fromIndex + 1)) >= 0) {
				lineCnt++;
			}
			re = "";
			text.clear();
			for (int i = 0; i < lineCnt; i++) {
				int su;
				su = organ_time.indexOf(",");
				re = organ_time.substring(0, su);
				text.add(re);
				organ_time = organ_time.substring(su + 1);
			}
			text.add(organ_time);
			
			for (int i = 0; i < text.size(); i++) {
				String organ_timeStr = text.get(i);
				//System.out.println("organ_timeStr:"+organ_timeStr);
				if(organ_timeStr.equals("없음")) {
					for(int j = 1; j <=2; j++) {
						if(j==1) {
							req.setAttribute("organ_time" + (i + 1)+""+j, "");
						}
						else {
							req.setAttribute("organ_time" + (i + 1)+""+j, "");
						}
					}
				}else {
					int su;
					su = organ_timeStr.indexOf("~");
					re = organ_timeStr.substring(0, su);
					//System.out.println("///"+re);
					organ_timeStr = organ_timeStr.substring(su + 1);
					//System.out.println("///"+organ_timeStr);
					for(int j = 1; j <=2; j++) {
						if(j==1) {
							req.setAttribute("organ_time" + (i + 1)+j, re );
							//System.out.println((i + 1)+""+j +"/" + re );
						}
						else {
							req.setAttribute("organ_time" + (i + 1)+j, organ_timeStr );
							//System.out.println((i + 1)+""+j +"/" + re );
						}
					}
				}
				
			}
			
			

		} else if (organ_type.equals("요양원")) {
			dto = dao.reference2Info(organ_idx);
			path = "/sanatorium/sanatoriumInfo2.jsp";
		} else {
			dto = dao.reference3Info(organ_idx);
			path = "/sanatorium/sanatoriumInfo2.jsp";
		}

		List<SanatoriumCommentDTO> colists = dao.commetList(organ_idx);

		// View로 데이터를 전달하기 위해 request객체에 속성 저장
		req.setAttribute("colists", colists);

		// DTO객체를 리퀘스트 영역에 저장
		req.setAttribute("sanatoriumInfo", dto);
		
		req.setAttribute("organ_type", organ_type);

		// 자원 해제
		dao.close();

		RequestDispatcher dis = req.getRequestDispatcher(path);
		dis.forward(req, resp);

	}

}
