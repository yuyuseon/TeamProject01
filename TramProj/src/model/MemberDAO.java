package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;

public class MemberDAO {
	//JDBC를 위한 멤버변수
	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	
	//인자생성자 : DAO객체를 생성함과 동시에 DB 연결
	public MemberDAO(String driver, String url) {
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
	
	public MemberDAO(ServletContext ctx) {
		try {
			Class.forName(ctx.getInitParameter("JDBCDriver"));
			String url = ctx.getInitParameter("ConnectionURL");
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
	public boolean isMember(String id) {
		String sql = "SELECT COUNT(*) FROM member_list WHERE user_id=?";
		//존재하는 회원인지 판단하기 위한 변수
		int isMember = 0;
		//회원인증이 완료되었을때 jsp쪽으로 전달하기 위한 변수
		boolean isFlag = false;
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			rs.next();
			isMember = rs.getInt(1);
			System.out.println("affected:" + isMember);
			if(isMember==0) isFlag = false;
			else			isFlag = true;//회원인증이 완료된 경우에만 true
		} catch(Exception e) {
			isFlag = false;
			e.printStackTrace();
		}
		return isFlag;
	}
	
	public boolean isMember(String id, String pass) {
		String sql = "SELECT COUNT(*) FROM member_list WHERE user_id=? AND user_pass=?";
		//존재하는 회원인지 판단하기 위한 변수
		int isMember = 0;
		//회원인증이 완료되었을때 jsp쪽으로 전달하기 위한 변수
		boolean isFlag = false;
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pass);
			rs = psmt.executeQuery();
			rs.next();
			isMember = rs.getInt(1);
			//System.out.println("affected:" + isMember);
			if(isMember==0) isFlag = false;
			else			isFlag = true;//회원인증이 완료된 경우에만 true
		} catch(Exception e) {
			isFlag = false;
			e.printStackTrace();
		} 
		return isFlag;
	}
	
	public void updateToken(String id, String token) {
		String sql = "UPDATE member_token SET user_token=? WHERE user_id=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, token);
			psmt.setString(2, id);
			System.out.println("token:"+token);
			System.out.println("id:"+id);
			System.out.println(psmt.executeUpdate()+" 토큰 업데이트 완료");
			
		} catch(Exception e) {
			e.printStackTrace();
		} 
	}
	public void insertToken(String id, String token) {
		String sql = "INSERT INTO member_token VALUES(?,?)";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, token);
			System.out.println("token:"+token);
			System.out.println("id:"+id);
			System.out.println(psmt.executeUpdate()+" 토큰 추가 완료");
			
		} catch(Exception e) {
			e.printStackTrace();
		} 
	}
	public void removeToken(String id, String token) {
		String sql = "DELETE FROM member_token WHERE user_token=? AND user_id=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, token);
			psmt.setString(2, id);
			System.out.println("token:"+token);
			System.out.println("id:"+id);
			System.out.println(psmt.executeUpdate()+" 토큰 삭제 완료");
			
		} catch(Exception e) {
			e.printStackTrace();
		} 
	}
	public boolean rePass(String id, String rePass) {
		boolean isSuccess = false;
		String sql = "UPDATE member_list SET user_pass=? WHERE user_id=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, rePass);
			psmt.setString(2, id);
			int result = psmt.executeUpdate();
			if(result==1) isSuccess = true;
			
		} catch(Exception e) {
			System.out.println("암호 재설정중 오류 발생");
			e.printStackTrace();
		}
		return isSuccess;
	}
	
	public int memberUpdate(MemberDTO dto) {
		int result = 0;
		String sql = "UPDATE member_list SET user_pass=?, user_phone=?, user_name=? WHERE user_id=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getPass());
			psmt.setString(2, dto.getPhone());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getId());
			result = psmt.executeUpdate();
			
		} catch(Exception e) {
			System.out.println("암호 재설정중 오류 발생");
			e.printStackTrace();
		}
		
		return result;
	}
	
	//회원정보 확인후 DTO로 반환하기
	public MemberDTO getMemberDTO(String id, String pwd) {
		//DB에 가져온 회원정보를 저장할 DTO객체 생성
		MemberDTO dto = new MemberDTO();
		
		String query = "SELECT id, pass, name FROM member WHERE id=? and pass=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, pwd);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString(1));
				dto.setPass(rs.getString(2));//dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(3));
			} else {
				System.out.println("일치하는 회원정보 없음");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	//회원정보 확인후 Map 컬렉션으로 반환
	public Map<String, String> getMemberMap(String id, String pwd){
		Map<String, String> maps = new HashMap<String, String>();
		
		String query = "SELECT id, pass, name FROM member WHERE id=? and pass=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, pwd);
			rs = psmt.executeQuery();
			//결과셋이 있는 경우에만 레코드를 읽어온다.
			if(rs.next()) {
				maps.put("id", rs.getString(1));
				maps.put("pass", rs.getString(2));
				maps.put("name", rs.getString(3));
			} else {
				System.out.println("일치하는 회원정보 없음");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return maps;
	}
	
	public int memberRegist(MemberDTO dto) {
		int affected = 0;
		String query = "insert into member_list (user_id, user_pass, user_name, user_phone)" + "values(?, ?, ?, ?)";
		try {			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getPhone());
			affected = psmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("회원가입 처리중 예외발생");
			affected = 0;
			e.printStackTrace();
		}
		
		return affected;
		
	}
	
	public MemberDTO memberInfo(String id){
		MemberDTO dto = new MemberDTO();
		
		String sql = "SELECT * FROM member_list WHERE 1=1 and user_id=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			
			rs = psmt.executeQuery();
			rs.next();
			
			dto = new MemberDTO();
			dto.setId(rs.getString("user_id"));
			dto.setPass(rs.getString("user_pass"));
			dto.setPhone(rs.getString("user_phone"));
			dto.setName(rs.getString("user_name"));
			dto.setRegidate(rs.getDate("user_regidate"));
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
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
	/*public static void main(String[] args) {
		String driver = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		new MemberDAO(driver, url).isMember("kosmo", "1234");
	}*/
}