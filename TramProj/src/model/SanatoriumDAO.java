package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

import javax.servlet.ServletContext;

public class SanatoriumDAO {
	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	
	public SanatoriumDAO(String driver, String url) {
		try {
			Class.forName(driver);
			String id = "kosmo";
			String pw = "1234";
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("DB연결성공");
		} catch(Exception e) {
			System.out.println("DB연결실패");
		}
	}
	
	public SanatoriumDAO(ServletContext ctx) {
		try {
			/*
			java파일에서 web.xml의 초기화 파라미터를 가져옴 
			*/
			Class.forName(ctx.getInitParameter("JDBCDriver"));
			String url= ctx.getInitParameter("ConnectionURL"); 
			String id= "kosmo"; 
			String pw= "1234";
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("DB연결 성공");
		}
		catch(Exception e) {
			System.out.println("DB연결 실패");
		}
	}
	
	public int countList() {
		String sql = "SELECT COUNT(*) FROM organ_type";
		int cnt = 0;
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			
			cnt = rs.getInt(1);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	public List<String> newOrganIdxList(){
		String sql = "SELECT organ.*, rownum FROM (SELECT * FROM organ_type ORDER BY organ_idx desc) organ WHERE rownum BETWEEN 1 and 4";
		List<String> list = new Vector<String>();
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getString("organ_idx"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public List<SanatoriumDTO> newOrganList() {		
		String sql = "SELECT organ.*, rownum FROM (SELECT * FROM organ_type ORDER BY organ_idx desc) organ WHERE rownum BETWEEN 1 and 4";
		List<SanatoriumDTO> list = new Vector<SanatoriumDTO>();
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				SanatoriumDTO dto = new SanatoriumDTO();
				dto.setOrgan_idx(rs.getString("organ_idx"));
				dto.setOrgan_name(rs.getString("organ_name"));
				dto.setOrgan_type(rs.getString("organ_type"));
				dto.setOrgan_regidate(rs.getDate("organ_regidate"));
				//dto.setOrgan_address(rs.getString("organ_address"));
				list.add(dto);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	public SanatoriumDTO getReference(String organ_idx, String organ_type) {
		SanatoriumDTO dto = new SanatoriumDTO();
		String sql = "";
		System.out.println("organ_idx:"+organ_idx);
		System.out.println("organ_type:"+organ_type);
		if(organ_type.equals("요양병원"))
			sql = "SELECT * FROM organ_reference_1 WHERE organ_idx=?";
		else if(organ_type.equals("요양원"))
			sql = "SELECT * FROM organ_reference_2 WHERE organ_idx=?";
		else if(organ_type.equals("방문시설"))
			sql = "SELECT * FROM organ_reference_3 WHERE organ_idx=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, organ_idx);
			rs = psmt.executeQuery();
			rs.next();
			
			dto.setOrgan_idx(organ_idx);
			dto.setOrgan_name(rs.getString("organ_name"));
			dto.setOrgan_type(organ_type);
			//dto.setOrgan_regidate(rs.getDate("organ_regidate"));
			dto.setOrgan_address(rs.getString("organ_address"));
		} catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	//organ_idx로 organ_type찾기
	public SanatoriumDTO typeInfo(String organ_idx) {
		
		SanatoriumDTO dto = new SanatoriumDTO();
		String sql = "SELECT * FROM organ_type WHERE organ_idx=?";
		try {
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, organ_idx);
			rs = psmt.executeQuery();
			while(rs.next()) {
				dto.setOrgan_idx(rs.getString("organ_idx"));
				dto.setOrgan_name(rs.getString("organ_name"));
				dto.setOrgan_type(rs.getString("organ_type"));
				dto.setOrgan_regidate(rs.getDate("organ_regidate"));
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	
	//요양병원 상세보기
	public SanatoriumDTO referenceInfo(String organ_idx){
		
		SanatoriumDTO dto = new SanatoriumDTO();
		
		String query = "SELECT * FROM organ_reference_1 ";
		
		if(!organ_idx.equals("")) {
			query+=" WHERE organ_idx = '"+ organ_idx +"' ";
		}
		
		
		
		
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			//오라클이 반환해준 결과 셋의 갯수 만큼 반복함
			while(rs.next()) {
				//결과셋 중 하나를 DTO객체에 저장함
				
				
				//DTO객체의 setter()를 이용하여 데이터 저장
				dto.setOrgan_name(rs.getString("organ_name"));
				dto.setOrgan_address(rs.getString("organ_address"));
				dto.setOrgan_grade(rs.getString("organ_grade"));
				dto.setOrgan_fund(rs.getString("organ_fund"));
				dto.setOrgan_care(rs.getString("organ_care"));
				dto.setOrgan_loca(rs.getString("organ_loca"));
				dto.setOrgan_reli(rs.getString("organ_reli"));
				dto.setOrgan_call(rs.getString("organ_call"));
				dto.setOrgan_pay(rs.getInt("organ_pay"));
				dto.setOrgan_subject(rs.getString("organ_subject"));
				dto.setOrgan_time(rs.getString("organ_time"));
				dto.setOrgan_ref(rs.getString("organ_ref"));
				dto.setOrgan_patnum(rs.getInt("organ_patnum"));
				dto.setOrgan_docnum(rs.getInt("organ_docnum"));
				dto.setOrgan_nurnum(rs.getInt("organ_nurnum"));
				dto.setOrgan_staffnum(rs.getInt("organ_staffnum"));
				dto.setOrgan_disease(rs.getString("organ_disease"));
				dto.setOrgan_life(rs.getString("organ_life"));
				dto.setOrgan_eval(rs.getString("organ_eval"));
				dto.setOrgan_idx(rs.getString("organ_idx"));
				dto.setOrgan_view(rs.getString("organ_view"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setOrgan_comment(rs.getString("organ_comment"));
				
				
				
			}
			
		}catch (Exception e) {
			System.out.println("Select시 예외발생");
			e.printStackTrace();
		}
		
		return dto;

	}
	
	//요양원 상세보기
	public SanatoriumDTO reference2Info(String organ_idx){
		
		SanatoriumDTO dto = new SanatoriumDTO();
		
		String query = "SELECT * FROM organ_reference_2 ";
		
		if(!organ_idx.equals("")) {
			query+=" WHERE organ_idx = '"+ organ_idx +"' ";
		}
		
		
		
		
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			//오라클이 반환해준 결과 셋의 갯수 만큼 반복함
			while(rs.next()) {
				
				//DTO객체의 setter()를 이용하여 데이터 저장
				dto.setOrgan_name(rs.getString("organ_name"));
				dto.setOrgan_address(rs.getString("organ_address"));
				dto.setOrgan_grade(rs.getString("organ_grade"));
				dto.setOrgan_code(rs.getString("organ_code"));
				dto.setOrgan_fundate(rs.getDate("organ_fundate"));
				dto.setOrgan_appdate(rs.getDate("organ_appdate"));
				dto.setOrgan_phone(rs.getString("organ_phone"));
				dto.setOrgan_hr(rs.getString("organ_hr"));
				dto.setOrgan_bedroom(rs.getString("organ_bedroom"));
				dto.setOrgan_etc(rs.getString("organ_etc"));
				dto.setOrgan_nonpayfood(rs.getString("organ_nonpayfood"));
				dto.setOrgan_nonpaysnack(rs.getString("organ_nonpaysnack"));
				dto.setOrgan_nonpayhaircut(rs.getString("organ_nonpayhaircut"));
				dto.setOrgan_park(rs.getString("organ_park"));
				dto.setOrgan_loc(rs.getString("organ_loc"));
				dto.setOrgan_idx(rs.getString("organ_idx"));
				dto.setOrgan_comment(rs.getString("organ_comment"));
				dto.setUser_id(rs.getString("user_id"));
				
				
			}
			
		}catch (Exception e) {
			System.out.println("Select시 예외발생");
			e.printStackTrace();
		}
		
		return dto;

	}
	
	//방문시설 상세보기
	
	public SanatoriumDTO reference3Info(String organ_idx){
		
		SanatoriumDTO dto = new SanatoriumDTO();
		
		String query = "SELECT * FROM organ_reference_3 ";
		
		if(!organ_idx.equals("")) {
			query+=" WHERE organ_idx = '"+ organ_idx +"' ";
		}
		
		
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			//오라클이 반환해준 결과 셋의 갯수 만큼 반복함
			while(rs.next()) {
				//결과셋 중 하나를 DTO객체에 저장함
				
				
				//DTO객체의 setter()를 이용하여 데이터 저장
				dto.setOrgan_name(rs.getString("organ_name"));
				dto.setOrgan_address(rs.getString("organ_address"));
				dto.setOrgan_grade(rs.getString("organ_grade"));
				dto.setOrgan_code(rs.getString("organ_code"));
				dto.setOrgan_fundate(rs.getDate("organ_fundate"));
				dto.setOrgan_appdate(rs.getDate("organ_appdate"));
				dto.setOrgan_phone(rs.getString("organ_phone"));
				dto.setOrgan_hr(rs.getString("organ_hr"));
				dto.setOrgan_bedroom(rs.getString("organ_bedroom"));
				dto.setOrgan_etc(rs.getString("organ_etc"));
				dto.setOrgan_nonpayfood(rs.getString("organ_nonpayfood"));
				dto.setOrgan_nonpaysnack(rs.getString("organ_nonpaysnack"));
				dto.setOrgan_nonpayhaircut(rs.getString("organ_nonpayhaircut"));
				dto.setOrgan_park(rs.getString("organ_park"));
				dto.setOrgan_loc(rs.getString("organ_loc"));
				dto.setOrgan_idx(rs.getString("organ_idx"));
				dto.setOrgan_comment(rs.getString("organ_comment"));
				dto.setUser_id(rs.getString("user_id"));
				
				
			}
			
		}catch (Exception e) {
			System.out.println("Select시 예외발생");
			e.printStackTrace();
		}
		
		return dto;

	}
	
	
	public int commentCount(String organ_idx) {
		
		
		int totalCount = 0;
		
		//전체 레코드수를 카운트하기 위해 count()그룹함수 사용
		
		try {
			String query = "SELECT COUNT(*) FROM organ_comment ";
			query+=" WHERE organ_idx = '"+ organ_idx +"' ";
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			rs.next();
			//게시물의 갯수를 가져오므로 getInt()로 읽어온다.
			totalCount = rs.getInt(1);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		//게시물의 갯수 반환
		return totalCount;
	}
	
	//코멘트 총합
	public double organRating(String organ_idx) {
		
		double rating = 0;
		
		//전체 레코드수를 카운트하기 위해 count()그룹함수 사용
		
		try {
			String query = "select comment_rating from organ_comment ";
			query+=" WHERE organ_idx = '"+ organ_idx +"' ";
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			while(rs.next()) {
				rating += rs.getInt(1);
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(rating);
		//게시물의 갯수 반환
		return rating;
	}
	
	
	
	public List<SanatoriumCommentDTO> commetList(String organ_idx){
		
		List<SanatoriumCommentDTO> commentList = new Vector<SanatoriumCommentDTO>();
		
		String query = "SELECT *  FROM organ_comment ";
		
		if(!organ_idx.equals("")) {
			query+=" WHERE organ_idx = '"+ organ_idx +"' ";
		}
		query += " ORDER BY comment_idx DESC";
		
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			//오라클이 반환해준 결과 셋의 갯수 만큼 반복함
			while(rs.next()) {
				//결과셋 중 하나를 DTO객체에 저장함
				SanatoriumCommentDTO dto = new SanatoriumCommentDTO();
				
				//DTO객체의 setter()를 이용하여 데이터 저장
				dto.setComment_idx(rs.getInt("comment_idx"));
				dto.setComment_rating(rs.getDouble("comment_rating"));
				dto.setComment_com(rs.getString("comment_com"));
				dto.setOrgan_idx(rs.getInt("organ_idx"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setComment_regidate(rs.getDate("comment_regidate"));
				
				
				//위에서 저장한 DTO객체를 List컬렉션에 추가
				commentList.add(dto);
				
			}
			
		}catch (Exception e) {
			System.out.println("Select시 예외발생");
			e.printStackTrace();
		}
		
		return commentList;

	}
	public List<SanatoriumCommentDTO> idCommetList(String user_id){
		
		List<SanatoriumCommentDTO> commentList = new Vector<SanatoriumCommentDTO>();
		
		String query = "SELECT *  FROM organ_comment ";
		
		if(!user_id.equals("")) {
			query+=" WHERE user_id = '"+ user_id +"' ";
		}
		query += " ORDER BY comment_idx DESC";
		
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			//오라클이 반환해준 결과 셋의 갯수 만큼 반복함
			while(rs.next()) {
				//결과셋 중 하나를 DTO객체에 저장함
				SanatoriumCommentDTO dto = new SanatoriumCommentDTO();
				
				//DTO객체의 setter()를 이용하여 데이터 저장
				dto.setComment_idx(rs.getInt("comment_idx"));
				dto.setComment_rating(rs.getDouble("comment_rating"));
				dto.setComment_com(rs.getString("comment_com"));
				dto.setOrgan_idx(rs.getInt("organ_idx"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setComment_regidate(rs.getDate("comment_regidate"));
				
				
				//위에서 저장한 DTO객체를 List컬렉션에 추가
				commentList.add(dto);
				
			}
			
		}catch (Exception e) {
			System.out.println("Select시 예외발생");
			e.printStackTrace();
		}
		
		return commentList;

	}
	
	public float avgRating(String organ_idx) {
		String sql = "select avg(comment_rating) from organ_comment WHERE organ_idx=? order by comment_idx";
		float rating = 0;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, organ_idx);
			
			rs = psmt.executeQuery();
			rs.next();
			
			rating = rs.getFloat(1);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return rating;
	}
	
	
	
	
	//댓글 입력
	public int commentInsert(SanatoriumCommentDTO dto) {
		int	affecter = 0;
		try {
			
			String sql = " INSERT INTO ORGAN_COMMENT " + 
					"    (comment_idx, comment_rating, comment_com, organ_idx, user_id) VALUES " + 
					"    (organ_comment_seq.NEXTVAL, ?, ?, ?, ?) ";
			psmt = con.prepareStatement(sql);
			psmt.setDouble(1, dto.getComment_rating());
			psmt.setString(2, dto.getComment_com());
			psmt.setInt(3, dto.getOrgan_idx());
			psmt.setString(4, dto.getUser_id());
			
			System.out.println(sql);
			
			affecter = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return affecter;
	}
	
	//시설 리스트 출력 함수
	public List<SanatoriumDTO> sanatoriumList(){
		//리스트 계열의 컬렉션 생성
		List<SanatoriumDTO> member =new Vector<SanatoriumDTO>();
		
		String sql = "SELECT re1.organ_idx, re1.organ_name, re1.organ_address, re1.organ_grade, re1.organ_view, type.organ_type FROM organ_reference_1 re1 " + 
				"    inner join organ_type type " + 
				"        on re1.organ_name = type.organ_name " + 
				"UNION         " + 
				"SELECT re2.organ_idx, re2.organ_name, re2.organ_address, re2.organ_grade, re2.organ_view, type.organ_type FROM organ_reference_2 re2 " + 
				"    inner join organ_type type " + 
				"        on re2.organ_name = type.organ_name " + 
				"UNION         " + 
				"SELECT re3.organ_idx, re3.organ_name, re3.organ_address, re3.organ_grade, re3.organ_view, type.organ_type FROM organ_reference_3 re3 " + 
				"    inner join organ_type type " + 
				"        on re3.organ_name = type.organ_name " + 
				" " + 
				"order by organ_idx DESC";
		
		System.out.println(sql);
		try {
			psmt = con.prepareStatement(sql);

			rs = psmt.executeQuery();
			//오라클이 반환해준 결과 셋의 갯수 만큼 반복함
			while(rs.next()) {
				//결과셋 중 하나를 DTO객체에 저장함
				SanatoriumDTO dto = new SanatoriumDTO();
				
				dto.setOrgan_name(rs.getString("organ_name"));
				dto.setOrgan_address(rs.getString("organ_address"));
				dto.setOrgan_grade(rs.getString("organ_grade"));
				dto.setOrgan_idx(rs.getString("organ_idx"));
				dto.setOrgan_type(rs.getString("organ_type"));
				dto.setOrgan_view(rs.getString("organ_view"));
				
				member.add(dto);
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}
	
	//-----------------------병원정보 불러오기
	public SanatoriumDTO SanatoriumInfo2(String organ_idx){
			
		SanatoriumDTO dto = new SanatoriumDTO();
		
		String query = "SELECT * FROM organ_reference_2 ";
		
		if(!organ_idx.equals("")) {
			query+=" WHERE organ_idx = '"+ organ_idx +"' ";
		}
		
		
		try {
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				dto.setOrgan_name(rs.getString("organ_name"));
				dto.setOrgan_address(rs.getString("organ_address"));
				dto.setOrgan_grade(rs.getString("organ_grade"));
				dto.setOrgan_code(rs.getString("organ_code"));
				dto.setOrgan_fundate(rs.getDate("organ_fundate"));
				dto.setOrgan_appdate(rs.getDate("organ_appdate"));
				dto.setOrgan_phone(rs.getString("organ_phone"));
				dto.setOrgan_hr(rs.getString("organ_hr"));
				dto.setOrgan_bedroom(rs.getString("organ_bedroom"));
				dto.setOrgan_etc(rs.getString("organ_etc"));
				dto.setOrgan_nonpayfood(rs.getString("organ_nonpayfood"));
				dto.setOrgan_nonpaysnack(rs.getString("organ_nonpaysnack"));
				dto.setOrgan_nonpayhaircut(rs.getString("organ_nonpayhaircut"));
				dto.setOrgan_park(rs.getString("organ_park"));
				dto.setOrgan_loc(rs.getString("organ_loc"));
				dto.setOrgan_idx(rs.getString("organ_idx"));
			}
			
			
		}catch (Exception e) {
			System.out.println("Select시 예외발생");
			e.printStackTrace();
		}
		
		return dto;

		}
	
	
	//organ_reference_1시설 노출 여부 확인
	public int exposureModified1(String idx, String view) {
		int	affecter = 0;
		try {
			String query = " UPDATE organ_reference_1 SET organ_view = ? WHERE organ_idx=? ";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, view);
			psmt.setString(2, idx);
			
			
			affecter = psmt.executeUpdate();
			System.out.println(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return affecter;
	}
	
	//organ_reference_2시설 노출 여부 확인
	public int exposureModified2(String idx, String view) {
		int	affecter = 0;
		try {
			String query = " UPDATE organ_reference_2 SET organ_view = ? WHERE organ_idx=? ";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, view);
			psmt.setString(2, idx);
			
			
			affecter = psmt.executeUpdate();
			System.out.println(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return affecter;
	}
	
	//organ_reference_3시설 노출 여부 확인
	public int exposureModified3(String idx, String view) {
		int	affecter = 0;
		try {
			String query = " UPDATE organ_reference_3 SET organ_view = ? WHERE organ_idx=? ";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, view);
			psmt.setString(2, idx);
			
			
			affecter = psmt.executeUpdate();
			System.out.println(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return affecter;
	}
	
	//코멘트 삭제
	public int delete(String idx) {
		int	affecter = 0;
		try {
			String query = " DELETE FROM organ_comment WHERE comment_idx=?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			
			affecter = psmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("delete중 예외발생");
			e.printStackTrace();
		}
		return affecter;
	}
	
	//ORGAN_REFERENCE_1 생성
	public int reference1insert(SanatoriumDTO dto) {
		int	affecter = 0;
		try {
			
			String sql = " INSERT INTO ORGAN_REFERENCE_1 " + 
					"	(ORGAN_NAME,ORGAN_ADDRESS,ORGAN_GRADE,ORGAN_FUND,ORGAN_CARE, " + 
					"	ORGAN_LOCA,ORGAN_RELI,ORGAN_CALL,ORGAN_PAY,ORGAN_SUBJECT,ORGAN_TIME, " + 
					"	ORGAN_REF,ORGAN_PATNUM,ORGAN_DOCNUM,ORGAN_NURNUM,ORGAN_STAFFNUM,ORGAN_DISEASE, " + 
					"	ORGAN_LIFE,ORGAN_EVAL,ORGAN_IDX,ORGAN_VIEW,USER_ID,ORGAN_COMMENT) "+
					"     VALUES " + 
					"    (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, organ_seq.NEXTVAL, ?, ?, ?) ";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getOrgan_name());
			psmt.setString(2, dto.getOrgan_address());
			psmt.setString(3, dto.getOrgan_grade());
			psmt.setString(4, dto.getOrgan_fund());
			psmt.setString(5, dto.getOrgan_care());
			psmt.setString(6, dto.getOrgan_loca());
			psmt.setString(7, dto.getOrgan_reli());
			psmt.setString(8, dto.getOrgan_call());
			psmt.setInt(9, dto.getOrgan_pay());
			psmt.setString(10, dto.getOrgan_subject());
			psmt.setString(11, dto.getOrgan_time());
			psmt.setString(12, dto.getOrgan_ref());
			psmt.setInt(13, dto.getOrgan_patnum());
			psmt.setInt(14, dto.getOrgan_docnum());
			psmt.setInt(15, dto.getOrgan_nurnum());
			psmt.setInt(16, dto.getOrgan_staffnum());
			psmt.setString(17, dto.getOrgan_disease());
			psmt.setString(18, dto.getOrgan_life());
			psmt.setString(19, dto.getOrgan_eval());
			psmt.setString(20, "미노출");
			psmt.setString(21, dto.getUser_id());
			psmt.setString(22, dto.getOrgan_comment());
			
			affecter = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return affecter;
	}
	
	
	//ORGAN_REFERENCE_2 생성
	public int reference2insert(SanatoriumDTO dto) {
		int	affecter = 0;
		try {
			
			String sql = "Insert into KOSMO.ORGAN_REFERENCE_2 " + 
					" (ORGAN_NAME,ORGAN_ADDRESS,ORGAN_GRADE,ORGAN_CODE," + 
					" ORGAN_FUNDATE,ORGAN_APPDATE,ORGAN_PHONE,ORGAN_HR," + 
					" ORGAN_BEDROOM,ORGAN_ETC,ORGAN_NONPAYFOOD,ORGAN_NONPAYSNACK," + 
					" ORGAN_NONPAYHAIRCUT,ORGAN_PARK,ORGAN_VIEW," + 
					" ORGAN_IDX,USER_ID,ORGAN_COMMENT) " + 
					" values " + 
					" (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,organ_seq.NEXTVAL,?,?) ";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getOrgan_name());
			psmt.setString(2, dto.getOrgan_address());
			psmt.setString(3, dto.getOrgan_grade());
			psmt.setString(4, dto.getOrgan_code());
			psmt.setDate(5, dto.getOrgan_fundate());
			psmt.setDate(6, dto.getOrgan_appdate());
			psmt.setString(7, dto.getOrgan_phone());
			psmt.setString(8, dto.getOrgan_hr());
			psmt.setString(9, dto.getOrgan_bedroom());
			psmt.setString(10, dto.getOrgan_etc());
			psmt.setString(11, dto.getOrgan_nonpayfood());
			psmt.setString(12, dto.getOrgan_nonpaysnack());
			psmt.setString(13, dto.getOrgan_nonpayhaircut());
			psmt.setString(14, dto.getOrgan_park());
			psmt.setString(15, "미노출");
			psmt.setString(16, dto.getUser_id());
			psmt.setString(17, dto.getOrgan_comment());
			
			affecter = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return affecter;
	}
	
	//ORGAN_REFERENCE_3 생성
	public int reference3insert(SanatoriumDTO dto) {
		int	affecter = 0;
		try {
			
			String sql = "Insert into KOSMO.ORGAN_REFERENCE_3 " + 
					" (ORGAN_NAME,ORGAN_ADDRESS,ORGAN_GRADE,ORGAN_CODE," + 
					" ORGAN_FUNDATE,ORGAN_APPDATE,ORGAN_PHONE,ORGAN_HR," + 
					" ORGAN_BEDROOM,ORGAN_ETC,ORGAN_NONPAYFOOD,ORGAN_NONPAYSNACK," + 
					" ORGAN_NONPAYHAIRCUT,ORGAN_PARK,ORGAN_VIEW," + 
					" ORGAN_IDX,USER_ID,ORGAN_COMMENT) " + 
					" values " + 
					" (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,organ_seq.NEXTVAL,?,?) ";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getOrgan_name());
			psmt.setString(2, dto.getOrgan_address());
			psmt.setString(3, dto.getOrgan_grade());
			psmt.setString(4, dto.getOrgan_code());
			psmt.setDate(5, dto.getOrgan_fundate());
			psmt.setDate(6, dto.getOrgan_appdate());
			psmt.setString(7, dto.getOrgan_phone());
			psmt.setString(8, dto.getOrgan_hr());
			psmt.setString(9, dto.getOrgan_bedroom());
			psmt.setString(10, dto.getOrgan_etc());
			psmt.setString(11, dto.getOrgan_nonpayfood());
			psmt.setString(12, dto.getOrgan_nonpaysnack());
			psmt.setString(13, dto.getOrgan_nonpayhaircut());
			psmt.setString(14, dto.getOrgan_park());
			psmt.setString(15, "미노출");
			psmt.setString(16, dto.getUser_id());
			psmt.setString(17, dto.getOrgan_comment());
			
			affecter = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return affecter;
	}
	
	
	//ORGAN_TYPE생성 후 id로
	public String idxselect(String id){
		//리스트 계열의 컬렉션 생성
		String idx = null;
		
		String sql = "SELECT organ_idx FROM organ_reference_1 WHERE user_id=?";
		sql +=" UNION ";
		sql +=" SELECT organ_idx FROM organ_reference_2 WHERE user_id=? ";
		sql +=" UNION ";
		sql +=" SELECT organ_idx FROM organ_reference_3 WHERE user_id=? ";
		sql +=" ORDER BY organ_idx DESC ";
		
		
		System.out.println(sql);
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, id);
			psmt.setString(3, id);

			rs = psmt.executeQuery();
			//오라클이 반환해준 결과 셋의 갯수 만큼 반복함
			int count =0;
			while(rs.next()) {
				idx = rs.getString("organ_idx");
				count++;
				if(count>=1) {
					break;
				}
			}

		}catch (Exception e) {
			e.printStackTrace();
		}
		return idx;
	}
	
	//ORGAN_TYPE 생성
	public int typeInsert(SanatoriumDTO dto) {
		int	affecter = 0;
		try {
			
			String sql = " INSERT INTO organ_type " + 
					"    (ORGAN_IDX,ORGAN_NAME,ORGAN_TYPE) VALUES " + 
					"    (?, ?, ?) ";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getOrgan_idx());
			psmt.setString(2, dto.getOrgan_name());
			psmt.setString(3, dto.getOrgan_type());
			
			affecter = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return affecter;
	}
	
	
	
	
	
	//요양원 정보 업데이트
	public int reference2update(SanatoriumDTO dto) {
		int	affecter = 0;
		try {
			
			String sql = "UPDATE organ_reference_2 SET" + 
					" ORGAN_NAME=?,ORGAN_ADDRESS=?,ORGAN_GRADE=?,ORGAN_CODE=?," + 
					" ORGAN_FUNDATE=?,ORGAN_APPDATE=?,ORGAN_PHONE=?,ORGAN_HR=?," + 
					" ORGAN_BEDROOM=?,ORGAN_ETC=?,ORGAN_NONPAYFOOD=?,ORGAN_NONPAYSNACK=?," + 
					" ORGAN_NONPAYHAIRCUT=?,ORGAN_PARK=?,ORGAN_VIEW=?," + 
					" USER_ID=?,ORGAN_COMMENT=?"
					+ " WHERE organ_idx=?";
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1, dto.getOrgan_name());
			psmt.setString(2, dto.getOrgan_address());
			psmt.setString(3, dto.getOrgan_grade());
			psmt.setString(4, dto.getOrgan_code());
			psmt.setDate(5, dto.getOrgan_fundate());
			psmt.setDate(6, dto.getOrgan_appdate());
			psmt.setString(7, dto.getOrgan_phone());
			psmt.setString(8, dto.getOrgan_hr());
			psmt.setString(9, dto.getOrgan_bedroom());
			psmt.setString(10, dto.getOrgan_etc());
			psmt.setString(11, dto.getOrgan_nonpayfood());
			psmt.setString(12, dto.getOrgan_nonpaysnack());
			psmt.setString(13, dto.getOrgan_nonpayhaircut());
			psmt.setString(14, dto.getOrgan_park());
			psmt.setString(15, dto.getOrgan_view());
			psmt.setString(16, dto.getUser_id());
			psmt.setString(17, dto.getOrgan_comment());
			
			psmt.setString(18, dto.getOrgan_idx());
			affecter = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return affecter;
	}
	
	//방문시설 업데이트
	public int reference3update(SanatoriumDTO dto) {
		int	affecter = 0;
		try {
			
			String sql = "UPDATE organ_reference_3 SET" + 
					" ORGAN_NAME=?,ORGAN_ADDRESS=?,ORGAN_GRADE=?,ORGAN_CODE=?," + 
					" ORGAN_FUNDATE=?,ORGAN_APPDATE=?,ORGAN_PHONE=?,ORGAN_HR=?," + 
					" ORGAN_BEDROOM=?,ORGAN_ETC=?,ORGAN_NONPAYFOOD=?,ORGAN_NONPAYSNACK=?," + 
					" ORGAN_NONPAYHAIRCUT=?,ORGAN_PARK=?,ORGAN_VIEW=?," + 
					" USER_ID=?,ORGAN_COMMENT=?"
					+ " WHERE organ_idx=?";
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1, dto.getOrgan_name());
			psmt.setString(2, dto.getOrgan_address());
			psmt.setString(3, dto.getOrgan_grade());
			psmt.setString(4, dto.getOrgan_code());
			psmt.setDate(5, dto.getOrgan_fundate());
			psmt.setDate(6, dto.getOrgan_appdate());
			psmt.setString(7, dto.getOrgan_phone());
			psmt.setString(8, dto.getOrgan_hr());
			psmt.setString(9, dto.getOrgan_bedroom());
			psmt.setString(10, dto.getOrgan_etc());
			psmt.setString(11, dto.getOrgan_nonpayfood());
			psmt.setString(12, dto.getOrgan_nonpaysnack());
			psmt.setString(13, dto.getOrgan_nonpayhaircut());
			psmt.setString(14, dto.getOrgan_park());
			psmt.setString(15, dto.getOrgan_view());
			psmt.setString(16, dto.getUser_id());
			psmt.setString(17, dto.getOrgan_comment());
			
			psmt.setString(18, dto.getOrgan_idx());
			affecter = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return affecter;
	}
	//ORGAN_TYPE update (name)
	public int typeUpdate(SanatoriumDTO dto) {
		int	affecter = 0;
		try {
			
			String sql = "UPDATE ORGAN_TYPE SET" + 
					" ORGAN_NAME=?"
					+ " WHERE organ_idx=?";
			psmt = con.prepareStatement(sql);
			
			psmt.setString(1, dto.getOrgan_name());
			
			psmt.setString(2, dto.getOrgan_idx());
			affecter = psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return affecter;
	}
	
	//자원반납
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(psmt!=null) psmt.close();
			if(con!=null) con.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
