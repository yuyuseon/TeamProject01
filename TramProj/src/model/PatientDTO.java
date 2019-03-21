package model;

import java.sql.Date;

/*
DTO(Data Transfer Objedct) : 계층간의 데이터전달을 위해 사용하는 데이터객체로
	로직은 전혀 가지고 있지 않으며 속성에 접근하기 위한 getter/setter 메소드만
	가진 클래스를 뜻한다.
 */
public class PatientDTO {
	
	String pati_idx;
	String pati_name;
	String pati_blood;
	java.sql.Date pati_regidate;
	java.sql.Date pati_birthdate;
	String pati_sex;
	String pati_relation;
	String pati_address;
	String pati_living;
	String pati_housingtype;
	String pati_religion;
	String pati_height;
	String pati_weight;
	String pati_recuperation_num;
	String pati_recuperation_grade;
	String pati_living_meal;
	String pati_living_walk;
	String pati_living_wash;
	String pati_living_dress;
	String pati_living_bathe;
	String pati_living_bathroom;
	String pati_diseaseinfo;
	String pati_food_like;
	String pati_food_hate;
	String pati_food_allergy;
	String pati_food_diabetes;
	String pati_singularity_habit;
	String pati_singularity_tendency;
	String pati_singularity_language;
	java.sql.Date pati_hospital_regidate;
	String user_id;
	String organ_idx;
	
	public PatientDTO() {}

	public PatientDTO(String pati_idx, String pati_name, String pati_blood, Date pati_regidate, Date pati_birthdate,
			String pati_sex, String pati_relation, String pati_address, String pati_living, String pati_housingtype,
			String pati_religion, String pati_height, String pati_weight, String pati_recuperation_num,
			String pati_recuperation_grade, String pati_living_meal, String pati_living_walk, String pati_living_wash,
			String pati_living_dress, String pati_living_bathe, String pati_living_bathroom, String pati_diseaseinfo,
			String pati_food_like, String pati_food_hate, String pati_food_allergy, String pati_food_diabetes,
			String pati_singularity_habit, String pati_singularity_tendency, String pati_singularity_language,
			Date pati_hospital_regidate, String user_id, String organ_idx) {
		super();
		this.pati_idx = pati_idx;
		this.pati_name = pati_name;
		this.pati_blood = pati_blood;
		this.pati_regidate = pati_regidate;
		this.pati_birthdate = pati_birthdate;
		this.pati_sex = pati_sex;
		this.pati_relation = pati_relation;
		this.pati_address = pati_address;
		this.pati_living = pati_living;
		this.pati_housingtype = pati_housingtype;
		this.pati_religion = pati_religion;
		this.pati_height = pati_height;
		this.pati_weight = pati_weight;
		this.pati_recuperation_num = pati_recuperation_num;
		this.pati_recuperation_grade = pati_recuperation_grade;
		this.pati_living_meal = pati_living_meal;
		this.pati_living_walk = pati_living_walk;
		this.pati_living_wash = pati_living_wash;
		this.pati_living_dress = pati_living_dress;
		this.pati_living_bathe = pati_living_bathe;
		this.pati_living_bathroom = pati_living_bathroom;
		this.pati_diseaseinfo = pati_diseaseinfo;
		this.pati_food_like = pati_food_like;
		this.pati_food_hate = pati_food_hate;
		this.pati_food_allergy = pati_food_allergy;
		this.pati_food_diabetes = pati_food_diabetes;
		this.pati_singularity_habit = pati_singularity_habit;
		this.pati_singularity_tendency = pati_singularity_tendency;
		this.pati_singularity_language = pati_singularity_language;
		this.pati_hospital_regidate = pati_hospital_regidate;
		this.user_id = user_id;
		this.organ_idx = organ_idx;
	}

	public String getPati_idx() {
		return pati_idx;
	}

	public void setPati_idx(String pati_idx) {
		this.pati_idx = pati_idx;
	}

	public String getPati_name() {
		return pati_name;
	}

	public void setPati_name(String pati_name) {
		this.pati_name = pati_name;
	}

	public String getPati_blood() {
		return pati_blood;
	}

	public void setPati_blood(String pati_blood) {
		this.pati_blood = pati_blood;
	}

	public java.sql.Date getPati_regidate() {
		return pati_regidate;
	}

	public void setPati_regidate(java.sql.Date pati_regidate) {
		this.pati_regidate = pati_regidate;
	}

	public java.sql.Date getPati_birthdate() {
		return pati_birthdate;
	}

	public void setPati_birthdate(java.sql.Date pati_birthdate) {
		this.pati_birthdate = pati_birthdate;
	}

	public String getPati_sex() {
		return pati_sex;
	}

	public void setPati_sex(String pati_sex) {
		this.pati_sex = pati_sex;
	}

	public String getPati_relation() {
		return pati_relation;
	}

	public void setPati_relation(String pati_relation) {
		this.pati_relation = pati_relation;
	}

	public String getPati_address() {
		return pati_address;
	}

	public void setPati_address(String pati_address) {
		this.pati_address = pati_address;
	}

	public String getPati_living() {
		return pati_living;
	}

	public void setPati_living(String pati_living) {
		this.pati_living = pati_living;
	}

	public String getPati_housingtype() {
		return pati_housingtype;
	}

	public void setPati_housingtype(String pati_housingtype) {
		this.pati_housingtype = pati_housingtype;
	}

	public String getPati_religion() {
		return pati_religion;
	}

	public void setPati_religion(String pati_religion) {
		this.pati_religion = pati_religion;
	}

	public String getPati_height() {
		return pati_height;
	}

	public void setPati_height(String pati_height) {
		this.pati_height = pati_height;
	}

	public String getPati_weight() {
		return pati_weight;
	}

	public void setPati_weight(String pati_weight) {
		this.pati_weight = pati_weight;
	}

	public String getPati_recuperation_num() {
		return pati_recuperation_num;
	}

	public void setPati_recuperation_num(String pati_recuperation_num) {
		this.pati_recuperation_num = pati_recuperation_num;
	}

	public String getPati_recuperation_grade() {
		return pati_recuperation_grade;
	}

	public void setPati_recuperation_grade(String pati_recuperation_grade) {
		this.pati_recuperation_grade = pati_recuperation_grade;
	}

	public String getPati_living_meal() {
		return pati_living_meal;
	}

	public void setPati_living_meal(String pati_living_meal) {
		this.pati_living_meal = pati_living_meal;
	}

	public String getPati_living_walk() {
		return pati_living_walk;
	}

	public void setPati_living_walk(String pati_living_walk) {
		this.pati_living_walk = pati_living_walk;
	}

	public String getPati_living_wash() {
		return pati_living_wash;
	}

	public void setPati_living_wash(String pati_living_wash) {
		this.pati_living_wash = pati_living_wash;
	}

	public String getPati_living_dress() {
		return pati_living_dress;
	}

	public void setPati_living_dress(String pati_living_dress) {
		this.pati_living_dress = pati_living_dress;
	}

	public String getPati_living_bathe() {
		return pati_living_bathe;
	}

	public void setPati_living_bathe(String pati_living_bathe) {
		this.pati_living_bathe = pati_living_bathe;
	}

	public String getPati_living_bathroom() {
		return pati_living_bathroom;
	}

	public void setPati_living_bathroom(String pati_living_bathroom) {
		this.pati_living_bathroom = pati_living_bathroom;
	}

	public String getPati_diseaseinfo() {
		return pati_diseaseinfo;
	}

	public void setPati_diseaseinfo(String pati_diseaseinfo) {
		this.pati_diseaseinfo = pati_diseaseinfo;
	}

	public String getPati_food_like() {
		return pati_food_like;
	}

	public void setPati_food_like(String pati_food_like) {
		this.pati_food_like = pati_food_like;
	}

	public String getPati_food_hate() {
		return pati_food_hate;
	}

	public void setPati_food_hate(String pati_food_hate) {
		this.pati_food_hate = pati_food_hate;
	}

	public String getPati_food_allergy() {
		return pati_food_allergy;
	}

	public void setPati_food_allergy(String pati_food_allergy) {
		this.pati_food_allergy = pati_food_allergy;
	}

	public String getPati_food_diabetes() {
		return pati_food_diabetes;
	}

	public void setPati_food_diabetes(String pati_food_diabetes) {
		this.pati_food_diabetes = pati_food_diabetes;
	}

	public String getPati_singularity_habit() {
		return pati_singularity_habit;
	}

	public void setPati_singularity_habit(String pati_singularity_habit) {
		this.pati_singularity_habit = pati_singularity_habit;
	}

	public String getPati_singularity_tendency() {
		return pati_singularity_tendency;
	}

	public void setPati_singularity_tendency(String pati_singularity_tendency) {
		this.pati_singularity_tendency = pati_singularity_tendency;
	}

	public String getPati_singularity_language() {
		return pati_singularity_language;
	}

	public void setPati_singularity_language(String pati_singularity_language) {
		this.pati_singularity_language = pati_singularity_language;
	}

	public java.sql.Date getPati_hospital_regidate() {
		return pati_hospital_regidate;
	}

	public void setPati_hospital_regidate(java.sql.Date pati_hospital_regidate) {
		this.pati_hospital_regidate = pati_hospital_regidate;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getOrgan_idx() {
		return organ_idx;
	}

	public void setOrgan_idx(String organ_idx) {
		this.organ_idx = organ_idx;
	}

	
	
	

}
