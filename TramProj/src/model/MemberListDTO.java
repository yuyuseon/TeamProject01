package model;

public class MemberListDTO {
	private String user_id;
	private String user_pass;
	private String user_name;
	private String user_regidate;
	private String user_phone;
	private String user_type;
	public MemberListDTO() {
	}
	public MemberListDTO(String user_id, String user_pass, String user_name, String user_regidate, String user_phone,
			String user_type) {
		this.user_id = user_id;
		this.user_pass = user_pass;
		this.user_name = user_name;
		this.user_regidate = user_regidate;
		this.user_phone = user_phone;
		this.user_type = user_type;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pass() {
		return user_pass;
	}
	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_regidate() {
		return user_regidate;
	}
	public void setUser_regidate(String user_regidate) {
		this.user_regidate = user_regidate;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_type() {
		return user_type;
	}
	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}
	
	
	
}
