package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

public class MemberListDAO {
	//JDBC를 위한 멤버변수
	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	
	public MemberListDAO(ServletContext ctx) {
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
	//자원 반납
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(psmt!=null) psmt.close();
			if(con!=null) con.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int memberRegist(MemberListDTO dto) {
		
		int affected = 0;
		String sql= "INSERT INTO member_list (user_id, user_pass, user_name, user_phone, user_type) "
				+ " values (?,?,?,?,'페이지관리자')";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getUser_id());
			psmt.setString(2, dto.getUser_pass());
			psmt.setString(3, dto.getUser_name());
			psmt.setString(4, dto.getUser_phone());	
			
			affected = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("회원 가입 처리중 예외 발생");
			e.printStackTrace();
		}
		return affected;
	}
	
	//회원 정보 확인 후 Map 컬렉션으로 변환
	public Map<String, String> getMemberMap(String id, String pwd) {
		
		//회원 정보를 담아서 반환 하기 위한 변수
		Map<String, String> maps = new HashMap<String, String>();
		
		String query = "SELECT user_id, user_pass, user_type FROM member_list WHERE user_id=? AND user_pass=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, pwd);
			System.out.println(query);
			rs = psmt.executeQuery();
			
			//결과 셋이 있는 경우에만 레코드를 읽어온다.
			if(rs.next()) {
				//Map에 추가할 때는 put() 메소드를 사용한다.
				maps.put("user_id", rs.getString(1));
				maps.put("user_pass", rs.getString(2));
				maps.put("user_type",rs.getString(3));
			}
			else {
				System.out.println("일치하는 회원 정보 없음");
			}
			
		}catch (SQLException e) {
			System.out.println("쿼리 실행 중 오류 발생됨");
			e.printStackTrace();
		}
		return maps;
	}
	
	public List<MemberListDTO> memberList(){
		//리스트 계열의 컬렉션 생성
		List<MemberListDTO> member =new Vector<MemberListDTO>();
		
		String sql = "SELECT * FROM MEMBER_LIST order by user_regidate DESC";
		
		System.out.println(sql);
		try {
			psmt = con.prepareStatement(sql);

			rs = psmt.executeQuery();
			//오라클이 반환해준 결과 셋의 갯수 만큼 반복함
			while(rs.next()) {
				//결과셋 중 하나를 DTO객체에 저장함
				MemberListDTO dto = new MemberListDTO();
				
				dto.setUser_id(rs.getString(1));
				dto.setUser_pass(rs.getString(2));
				dto.setUser_name(rs.getString(3));
				dto.setUser_regidate(rs.getString(4));
				dto.setUser_phone(rs.getString(5));
				dto.setUser_type(rs.getString(6));
				
				member.add(dto);
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return member;
	}
	
	//회원 정보 수정
	public MemberListDTO memberInfo(String id) {
		MemberListDTO dto = new MemberListDTO();
         try {
             // 쿼리
             String query = "SELECT * FROM member_list WHERE user_id=?";
             psmt = con.prepareStatement(query);
             psmt.setString(1, id);
             rs = psmt.executeQuery();
  
             if (rs.next()) // 회원정보를 DTO에 담는다.
             {
                 // dto에 정보를 담는다.
                 dto.setUser_id(rs.getString(1));
                 dto.setUser_pass(rs.getString(2));
                 dto.setUser_name(rs.getString(3));
                 dto.setUser_regidate(rs.getString(4));
                 dto.setUser_phone(rs.getString(5));
                 dto.setUser_type(rs.getString(6));
                 
                 
             }
  
          
  
         } catch (Exception e) {}
         
         return dto; 
         
     } 
	
	public int restraint(String id, String restraint) {
		String sql = "UPDATE member_list SET user_type=? WHERE user_id=?";
		
		int result = 0;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, restraint);
			psmt.setString(2, id);
			result = psmt.executeUpdate();
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int typeUpdate(String id) {
		String sql = "UPDATE member_list SET user_type=? WHERE user_id=?";
		
		int result = 0;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, "시설관리자");
			psmt.setString(2, id);
			result = psmt.executeUpdate();
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
