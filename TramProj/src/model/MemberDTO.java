package model;

import java.sql.Date;
/*
DTO(Data Transfer Objedct) : 계층간의 데이터전달을 위해 사용하는 데이터객체로
	로직은 전혀 가지고 있지 않으며 속성에 접근하기 위한 getter/setter 메소드만
	가진 클래스를 뜻한다.
 */
public class MemberDTO {
	//멤버변수
	private String id;
	private String pass;
	private String name;
	private java.sql.Date regidate;
	
	//EL테스트를 위한 멤버변수 추가(해당 변수의 getter 없음)
	private String phone;
	
	//생성자
	public MemberDTO() {}
	public MemberDTO(String id, String pass, String name, Date regidate, String phone) {
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.regidate = regidate;
		this.phone = phone;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public java.sql.Date getRegidate() {
		return regidate;
	}
	public void setRegidate(java.sql.Date regidate) {
		this.regidate = regidate;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	//멤버메소드
	
}