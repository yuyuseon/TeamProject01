package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;


public class PatientDAO {
	//JDBC를 위한 멤버변수
	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	
	//인자생성자 : DAO객체를 생성함과 동시에 DB 연결
	public PatientDAO(String driver, String url) {
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

	/*public String findName(String id) {
		String sql = "SELECT name FROM member WHERE id=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			rs.next();
			return rs.getString(1);
		} catch(Exception e) {
			e.printStackTrace();
			return "";
		} 
	}*/
	
	

	public int insert(PatientDTO dto)
     {
        int affected = 0;
        try {
           //답변글 처리를 위해 3개컬럼 추가하기
           /*
            답변형 게시판에서 원글의 경우에는 일련번호와 동일한 그룹번호를 가지게 된다. 
            즉 idx에 입력할 시퀀스를 bgroup에도 동일하게 입력해준다. 그리고 step, indent는 무조건 0이다.
            */
           String sql = "INSERT INTO member_patient VALUES(pati_seq.nextval,?,?,?,to_date(?,'YYYY-MM-DD'), ?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,to_date(?,'YYYY-MM-DD'),?);";
           psmt = con.prepareStatement(sql);
           psmt.setString(1, dto.getPati_name());
           psmt.setString(2, dto.getPati_blood());
           psmt.setDate(3, dto.getPati_regidate());
           psmt.setDate(4, dto.getPati_birthdate());
           psmt.setString(5, dto.getPati_sex());
           psmt.setString(6, dto.getPati_relation());
           psmt.setString(7, dto.getPati_address());
           psmt.setString(8, dto.getPati_living());
           psmt.setString(9, dto.getPati_sex());
           psmt.setString(10, dto.getPati_housingtype());
           psmt.setString(11, dto.getPati_religion());
           psmt.setString(12, dto.getPati_height());
           psmt.setString(13, dto.getPati_weight());
           psmt.setString(14, dto.getPati_recuperation_num());
           psmt.setString(15, dto.getPati_recuperation_grade());
           psmt.setString(16, dto.getPati_living_meal());
           psmt.setString(17, dto.getPati_living_walk());
           psmt.setString(18, dto.getPati_living_wash());
           psmt.setString(19, dto.getPati_living_dress());
           psmt.setString(20, dto.getPati_living_bathe());
           psmt.setString(21, dto.getPati_living_bathroom());
           psmt.setString(22, dto.getPati_diseaseinfo());
           psmt.setString(23, dto.getPati_food_like());
           psmt.setString(24, dto.getPati_food_hate());
           psmt.setString(25, dto.getPati_food_allergy());
           psmt.setString(26, dto.getPati_food_like());
           psmt.setString(27, dto.getPati_singularity_tendency());
           psmt.setString(28, dto.getPati_singularity_language());
           psmt.setDate(29, dto.getPati_hospital_regidate());
           psmt.setString(30, dto.getUser_id());
           
           
           affected = psmt.executeUpdate();
        } 
        catch (Exception e) {
           e.printStackTrace();
        }
        return affected;
     }

	//회원으로 어르신 검색하기
	public List<PatientDTO> memberList(String id){
		List<PatientDTO> list = new Vector<PatientDTO>();
		
		String sql = "SELECT * FROM member_patient WHERE user_id=? ORDER BY pati_regidate DESC";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			while(rs.next()) {
				PatientDTO dto = new PatientDTO();
				dto.setPati_idx(rs.getString("pati_idx"));
				dto.setPati_name(rs.getString("pati_name"));
				dto.setPati_blood(rs.getString("pati_blood"));
				dto.setPati_regidate(rs.getDate("pati_regidate"));
				dto.setPati_birthdate(rs.getDate("pati_birthdate"));
				dto.setPati_sex(rs.getString("pati_sex"));
				dto.setPati_relation(rs.getString("pati_relation"));
				dto.setPati_address(rs.getString("pati_address"));
				dto.setPati_living(rs.getString("pati_living"));
				dto.setPati_housingtype(rs.getString("pati_housingtype"));
				dto.setPati_religion(rs.getString("pati_religion"));
				dto.setPati_height(rs.getString("pati_height"));
				dto.setPati_weight(rs.getString("pati_weight"));
				dto.setPati_recuperation_num(rs.getString("pati_recuperation_num"));
				dto.setPati_recuperation_grade(rs.getString("pati_recuperation_grade"));
				dto.setPati_living_meal(rs.getString("pati_living_meal"));
				dto.setPati_living_walk(rs.getString("pati_living_walk"));
				dto.setPati_living_wash(rs.getString("pati_living_wash"));
				dto.setPati_living_dress(rs.getString("pati_living_dress"));
				dto.setPati_living_bathe(rs.getString("pati_living_bathe"));
				dto.setPati_living_bathroom(rs.getString("pati_living_bathroom"));
				dto.setPati_diseaseinfo(rs.getString("pati_diseaseinfo"));
				dto.setPati_food_like(rs.getString("pati_food_like"));
				dto.setPati_food_hate(rs.getString("pati_food_hate"));
				dto.setPati_food_allergy(rs.getString("pati_food_allergy"));
				dto.setPati_food_diabetes(rs.getString("pati_food_diabetes"));
				dto.setPati_singularity_habit(rs.getString("pati_singularity_habit"));
				dto.setPati_singularity_tendency(rs.getString("pati_singularity_tendency"));
				dto.setPati_singularity_language(rs.getString("pati_singularity_language"));
				dto.setPati_hospital_regidate(rs.getDate("pati_hospital_regidate"));
				dto.setUser_id(rs.getString("user_id"));

				list.add(dto);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	//어른신 idx로 정보 당아오기
	public PatientDTO memberInfo(String pati_idx){
		
		String sql = "SELECT * FROM member_patient WHERE pati_idx=?";
		PatientDTO dto = new PatientDTO();
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, pati_idx);
			rs = psmt.executeQuery();
			rs.next();
			dto.setPati_idx(rs.getString("pati_idx"));
			dto.setPati_name(rs.getString("pati_name"));
			dto.setPati_blood(rs.getString("pati_blood"));
			dto.setPati_regidate(rs.getDate("pati_regidate"));
			dto.setPati_birthdate(rs.getDate("pati_birthdate"));
			dto.setPati_sex(rs.getString("pati_sex"));
			dto.setPati_relation(rs.getString("pati_relation"));
			dto.setPati_address(rs.getString("pati_address"));
			dto.setPati_living(rs.getString("pati_living"));
			dto.setPati_housingtype(rs.getString("pati_housingtype"));
			dto.setPati_religion(rs.getString("pati_religion"));
			dto.setPati_height(rs.getString("pati_height"));
			dto.setPati_weight(rs.getString("pati_weight"));
			dto.setPati_recuperation_num(rs.getString("pati_recuperation_num"));
			dto.setPati_recuperation_grade(rs.getString("pati_recuperation_grade"));
			dto.setPati_living_meal(rs.getString("pati_living_meal"));
			dto.setPati_living_walk(rs.getString("pati_living_walk"));
			dto.setPati_living_wash(rs.getString("pati_living_wash"));
			dto.setPati_living_dress(rs.getString("pati_living_dress"));
			dto.setPati_living_bathe(rs.getString("pati_living_bathe"));
			dto.setPati_living_bathroom(rs.getString("pati_living_bathroom"));
			dto.setPati_diseaseinfo(rs.getString("pati_diseaseinfo"));
			dto.setPati_food_like(rs.getString("pati_food_like"));
			dto.setPati_food_hate(rs.getString("pati_food_hate"));
			dto.setPati_food_allergy(rs.getString("pati_food_allergy"));
			dto.setPati_food_diabetes(rs.getString("pati_food_diabetes"));
			dto.setPati_singularity_habit(rs.getString("pati_singularity_habit"));
			dto.setPati_singularity_tendency(rs.getString("pati_singularity_tendency"));
			dto.setPati_singularity_language(rs.getString("pati_singularity_language"));
			dto.setPati_hospital_regidate(rs.getDate("pati_hospital_regidate"));
			dto.setUser_id(rs.getString("user_id"));
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	
	//어르신 전체 리스트 불러오기 / 관리자페이지
	public List<PatientDTO> patientList(){
		List<PatientDTO> list = new Vector<PatientDTO>();
		
		String sql = "SELECT * FROM member_patient ORDER BY pati_regidate DESC";
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				PatientDTO dto = new PatientDTO();
				dto.setPati_idx(rs.getString("pati_idx"));
				dto.setPati_name(rs.getString("pati_name"));
				dto.setPati_blood(rs.getString("pati_blood"));
				dto.setPati_regidate(rs.getDate("pati_regidate"));
				dto.setPati_birthdate(rs.getDate("pati_birthdate"));
				dto.setPati_sex(rs.getString("pati_sex"));
				dto.setPati_relation(rs.getString("pati_relation"));
				dto.setPati_address(rs.getString("pati_address"));
				dto.setPati_living(rs.getString("pati_living"));
				dto.setPati_housingtype(rs.getString("pati_housingtype"));
				dto.setPati_religion(rs.getString("pati_religion"));
				dto.setPati_height(rs.getString("pati_height"));
				dto.setPati_weight(rs.getString("pati_weight"));
				dto.setPati_recuperation_num(rs.getString("pati_recuperation_num"));
				dto.setPati_recuperation_grade(rs.getString("pati_recuperation_grade"));
				dto.setPati_living_meal(rs.getString("pati_living_meal"));
				dto.setPati_living_walk(rs.getString("pati_living_walk"));
				dto.setPati_living_wash(rs.getString("pati_living_wash"));
				dto.setPati_living_dress(rs.getString("pati_living_dress"));
				dto.setPati_living_bathe(rs.getString("pati_living_bathe"));
				dto.setPati_living_bathroom(rs.getString("pati_living_bathroom"));
				dto.setPati_diseaseinfo(rs.getString("pati_diseaseinfo"));
				dto.setPati_food_like(rs.getString("pati_food_like"));
				dto.setPati_food_hate(rs.getString("pati_food_hate"));
				dto.setPati_food_allergy(rs.getString("pati_food_allergy"));
				dto.setPati_food_diabetes(rs.getString("pati_food_diabetes"));
				dto.setPati_singularity_habit(rs.getString("pati_singularity_habit"));
				dto.setPati_singularity_tendency(rs.getString("pati_singularity_tendency"));
				dto.setPati_singularity_language(rs.getString("pati_singularity_language"));
				dto.setPati_hospital_regidate(rs.getDate("pati_hospital_regidate"));
				dto.setUser_id(rs.getString("user_id"));
				dto.setOrgan_idx(rs.getString("organ_idx"));

				list.add(dto);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	// 환자정보수정
    public int patientUpdate(PatientDTO dto) {
       int affected = 0;

       try {

          String query = " UPDATE member_patient set " + 
                " pati_name=?,pati_blood=?,pati_birthdate=to_date(?, 'yyyy-mm-dd'), " + 
                " pati_sex=?,pati_relation=?,pati_address=?,pati_living=?,pati_housingtype=?, " + 
                " pati_religion=?,pati_height=?,pati_weight=?,pati_recuperation_num=?,pati_recuperation_grade=?, " + 
                " pati_living_meal=?,pati_living_walk=?,pati_living_wash=?,pati_living_dress=?,pati_living_bathe=?, " + 
                " pati_living_bathroom=?,pati_diseaseinfo=?,pati_food_like=?,pati_food_hate=?, " + 
                " pati_food_allergy=?,pati_food_diabetes=?,pati_singularity_habit=?,pati_singularity_tendency=?, " + 
                " pati_singularity_language=?,pati_hospital_regidate=to_date(?, 'yyyy-mm-dd'),user_id=?,organ_idx=? " + 
                " WHERE pati_idx=?";
          
          psmt = con.prepareStatement(query);
          psmt.setString(1, dto.getPati_name());
          psmt.setString(2, dto.getPati_blood() );
          psmt.setDate(3, dto.getPati_birthdate() );
          psmt.setString(4, dto.getPati_sex() );
          psmt.setString(5, dto.getPati_relation() );
          psmt.setString(6, dto.getPati_address() );
          psmt.setString(7, dto.getPati_living() );
          psmt.setString(8, dto.getPati_housingtype() );
          psmt.setString(9, dto.getPati_religion() );
          psmt.setString(10, dto.getPati_height() );
          psmt.setString(11, dto.getPati_weight() );
          psmt.setString(12, dto.getPati_recuperation_num() );
          psmt.setString(13, dto.getPati_recuperation_grade() );
          psmt.setString(14, dto.getPati_living_meal() );
          psmt.setString(15, dto.getPati_living_walk() );
          psmt.setString(16, dto.getPati_living_wash() );
          psmt.setString(17, dto.getPati_living_dress() );
          psmt.setString(18, dto.getPati_living_bathe() );
          psmt.setString(19, dto.getPati_living_bathroom() );
          psmt.setString(20, dto.getPati_diseaseinfo() );
          psmt.setString(21, dto.getPati_food_like() );
          psmt.setString(22, dto.getPati_food_hate() );
          psmt.setString(23, dto.getPati_food_allergy() );
          psmt.setString(24, dto.getPati_food_diabetes() );
          psmt.setString(25, dto.getPati_singularity_habit() );
          psmt.setString(26, dto.getPati_singularity_tendency() );
          psmt.setString(27, dto.getPati_singularity_language() );
          psmt.setDate(28, dto.getPati_hospital_regidate() );
          psmt.setString(29, dto.getUser_id() );
          psmt.setString(30, dto.getOrgan_idx() );
          
          psmt.setString(31, dto.getPati_idx() );
          
          affected = psmt.executeUpdate();
          
       }

       catch (Exception e) {
          System.out.println("update중 예외발생"+ affected);
          e.printStackTrace();
       }
       return affected;
    }
    
    
    
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
