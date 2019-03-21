package model;

import java.sql.Date;

public class SanatoriumCommentDTO {
	private int comment_idx;
	private double comment_rating;
	private String comment_com;
	private int organ_idx;
	private String user_id;
	private Date comment_regidate;
	
	public SanatoriumCommentDTO() {
	}
	public SanatoriumCommentDTO(int comment_idx, double comment_rating, String comment_com, int organ_idx, String user_id) {
		this.comment_idx = comment_idx;
		this.comment_rating = comment_rating;
		this.comment_com = comment_com;
		this.organ_idx = organ_idx;
		this.user_id = user_id;
	}
	public int getComment_idx() {
		return comment_idx;
	}
	public void setComment_idx(int comment_idx) {
		this.comment_idx = comment_idx;
	}
	public double getComment_rating() {
		return comment_rating;
	}
	public void setComment_rating(double comment_rating) {
		this.comment_rating = comment_rating;
	}
	public String getComment_com() {
		return comment_com;
	}
	public void setComment_com(String comment_com) {
		this.comment_com = comment_com;
	}
	public int getOrgan_idx() {
		return organ_idx;
	}
	public void setOrgan_idx(int organ_idx) {
		this.organ_idx = organ_idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getComment_regidate() {
		return comment_regidate;
	}
	public void setComment_regidate(Date comment_regidate) {
		this.comment_regidate = comment_regidate;
	}
}
