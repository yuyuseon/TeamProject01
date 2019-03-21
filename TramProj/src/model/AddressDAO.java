package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

public class AddressDAO {
	//JDBC를 위한 멤버변수
	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	
	//인자생성자 : DAO객체를 생성함과 동시에 DB 연결
	public AddressDAO(String driver, String url) {
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
	
	public List<String> address1(){
		//리스트 계열의 컬렉션 생성
		List<String> address1 =new Vector<String>();
		
		String sql = "SELECT DISTINCT address1 FROM address_list ORDER BY address1";
		
		System.out.println(sql);
		try {
			psmt = con.prepareStatement(sql);

			rs = psmt.executeQuery();
			//오라클이 반환해준 결과 셋의 갯수 만큼 반복함
			while(rs.next()) {
				address1.add(rs.getString(1));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return address1;
	}
	public List<String> address2(String address1){
		//리스트 계열의 컬렉션 생성
		List<String> address2 =new Vector<String>();
		
		String sql = "SELECT DISTINCT address2 FROM address_list WHERE address1="+"'"+address1+"'"+" ORDER BY address2";
		
		System.out.println(sql);
		try {
			psmt = con.prepareStatement(sql);

			rs = psmt.executeQuery();
			//오라클이 반환해준 결과 셋의 갯수 만큼 반복함
			while(rs.next()) {
				address2.add(rs.getString(1));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return address2;
	}
	
	public List<String> address3(String address1, String address2){
		//리스트 계열의 컬렉션 생성
		List<String> address3 =new Vector<String>();
		
		String sql = "SELECT DISTINCT address3 FROM address_list WHERE address1="+"'"+address1+"'"+" AND address2="+"'"+address2+"'"+" ORDER BY address3";
		
		System.out.println(sql);
		try {
			psmt = con.prepareStatement(sql);

			rs = psmt.executeQuery();
			//오라클이 반환해준 결과 셋의 갯수 만큼 반복함
			while(rs.next()) {
				address3.add(rs.getString(1));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return address3;
	}
}
