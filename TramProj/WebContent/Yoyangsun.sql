
/* Drop Tables */

DROP TABLE member_patient CASCADE CONSTRAINTS;
DROP TABLE member_savelist CASCADE CONSTRAINTS;
DROP TABLE member_token CASCADE CONSTRAINTS;
DROP TABLE organ_comment CASCADE CONSTRAINTS;
DROP TABLE member_list CASCADE CONSTRAINTS;
DROP TABLE notice CASCADE CONSTRAINTS;
DROP TABLE organ_list CASCADE CONSTRAINTS;
DROP TABLE organ_reference_1 CASCADE CONSTRAINTS;
DROP TABLE organ_reference_2 CASCADE CONSTRAINTS;
DROP TABLE organ_reference_3 CASCADE CONSTRAINTS;
DROP TABLE organ_type CASCADE CONSTRAINTS;




/* Create Tables */

CREATE TABLE member_list
(
	user_id varchar2(30) NOT NULL,
	user_pass varchar2(30) NOT NULL,
	user_name varchar2(30) NOT NULL,
	user_regidate date DEFAULT sysdate NOT NULL,
	user_phone varchar2(30) NOT NULL,
	user_type varchar2(30) DEFAULT '보호자',
	PRIMARY KEY (user_id)
);


CREATE TABLE member_patient
(
	pati_name varchar2(30) NOT NULL,
	pati_hospital_regidate date,
	pati_birthdate varchar2(30),
	pati_sex varchar2(30),
	pati_relation varchar2(300),
	pati_address varchar2(300),
	pati_living varchar2(300),
	pati_housingtype varchar2(300),
	pati_height varchar2(300),
	pati_weight varchar2(300),
	pati_recuperation_num varchar2(300),
	pati_recuperation_grade varchar2(300),
	pati_living_meal varchar2(300),
	pati_living_walk varchar2(300),
	pati_living_wash varchar2(300),
	pati_living_dress varchar2(300),
	pati_living_bathe varchar2(300),
	pati_living_bathroom varchar2(300),
	pati_diseaseinfo varchar2(300),
	pati_food_like varchar2(300),
	pati_food_hate varchar2(300),
	pati_food_allergy varchar2(300),
	pati_food_diabetes varchar2(300),
	pati_singularity_habit varchar2(300),
	pati_singularity_tendency varchar2(300),
	pati_singularity_language varchar2(300),
	pati_regidate date DEFAULT sysdate NOT NULL,
	user_id varchar2(30) NOT NULL,
	-- 요양원코드
	organ_idx number NOT NULL
);


CREATE TABLE member_savelist
(
	user_id varchar2(30) NOT NULL,
	-- 요양원코드
	organ_idx number NOT NULL,
	organ_type varchar2(30)
);


CREATE TABLE member_token
(
	user_token varchar2(3000) NOT NULL,
	user_id varchar2(30) NOT NULL
);


CREATE TABLE notice
(
	not_idx varchar2(300) NOT NULL,
	not_title varchar2(300) NOT NULL,
	not_contents varchar2(300) NOT NULL,
	not_date date DEFAULT SYSDATE NOT NULL,
	PRIMARY KEY (not_idx)
);


CREATE TABLE organ_comment
(
	comment_idx number,
	comment_regidate date DEFAULT sysdate NOT NULL,
	comment_rating number,
	comment_com varchar2(3000),
	-- 요양원코드
	organ_idx number NOT NULL,
	user_id varchar2(30) NOT NULL
);


CREATE TABLE organ_list
(
	organ_name varchar2(300),
	organ_type varchar2(30),
	-- 요양원코드
	organ_idx number NOT NULL
);


CREATE TABLE organ_reference_1
(
	-- 기관명
	organ_name varchar2(300) NOT NULL,
	organ_address varchar2(3000) NOT NULL,
	-- A/B/C/D등급
	organ_grade varchar2(10) NOT NULL,
	-- 설립정보
	organ_fund varchar2(3000),
	-- 간병형태(공동간병, 전담간병)
	organ_care varchar2(3000),
	-- 입지정보(단독건물, 빌딩 등)
	organ_loca varchar2(3000),
	-- 종교활동(아니오, 불교, 기독교)
	organ_reli varchar2(3000),
	-- 전화번호(- 제외)
	organ_call varchar2(3000),
	-- 입원 1일당 진료비(환자의 건강보험과 본인부담금을 포함)
	organ_pay number,
	-- 진료과목(재활의학과 등)
	organ_subject varchar2(3000),
	-- 진료시간
	organ_time varchar2(3000),
	-- 시설정보
	organ_ref varchar2(3000),
	-- 환자 수
	organ_patNum number,
	-- 의사 수
	organ_docNum number,
	-- 간호사 수
	organ_nurNum number,
	-- 간호인력 수
	organ_staffNum number,
	-- 입원환자 현황(질환, 일상수행 가능정도)
	organ_patList number,
	-- 평가정보현황
	organ_eval number,
	-- 요양원코드
	organ_idx number NOT NULL
);


CREATE TABLE organ_reference_2
(
	organ_name varchar2(300) NOT NULL,
	organ_address varchar2(300) NOT NULL,
	organ_grade varchar2(10) NOT NULL,
	organ_code varchar2(3000) NOT NULL,
	organ_funDate date,
	organ_appDate date,
	organ_phone number,
	organ_hr varchar2(3000),
	organ_bedroom varchar2(3000),
	organ_etc varchar2(3000),
	organ_park varchar2(3000),
	organ_nonPay varchar2(3000),
	organ_photo varchar2(3000),
	organ_loc varchar2(3000),
	organ_review varchar2(3000),
	organ_rate number,
	-- 요양원코드
	organ_idx number NOT NULL
);


CREATE TABLE organ_reference_3
(
	organ_name varchar2(300) NOT NULL,
	organ_address varchar2(300) NOT NULL,
	organ_grade varchar2(10) NOT NULL,
	organ_code varchar2(3000) NOT NULL,
	organ_funDate date,
	organ_appDate date,
	organ_phone number,
	organ_hr varchar2(3000),
	organ_photo varchar2(3000),
	organ_review varchar2(3000),
	organ_rate number,
	-- 요양원코드
	organ_idx number NOT NULL
);


CREATE TABLE organ_type
(
	-- 요양원코드
	organ_idx number NOT NULL,
	-- 요양원이름
	organ_name varchar2(300) NOT NULL,
	-- 요양병원/요양원/방문시설
	organ_type varchar2(30),
	PRIMARY KEY (organ_idx)
);



/* Create Foreign Keys */

ALTER TABLE member_patient
	ADD FOREIGN KEY (user_id)
	REFERENCES member_list (user_id)
;


ALTER TABLE member_savelist
	ADD FOREIGN KEY (user_id)
	REFERENCES member_list (user_id)
;


ALTER TABLE member_token
	ADD FOREIGN KEY (user_id)
	REFERENCES member_list (user_id)
;


ALTER TABLE organ_comment
	ADD FOREIGN KEY (user_id)
	REFERENCES member_list (user_id)
;


ALTER TABLE member_patient
	ADD FOREIGN KEY (organ_idx)
	REFERENCES organ_type (organ_idx)
;


ALTER TABLE member_savelist
	ADD FOREIGN KEY (organ_idx)
	REFERENCES organ_type (organ_idx)
;


ALTER TABLE organ_comment
	ADD FOREIGN KEY (organ_idx)
	REFERENCES organ_type (organ_idx)
;


ALTER TABLE organ_list
	ADD FOREIGN KEY (organ_idx)
	REFERENCES organ_type (organ_idx)
;


ALTER TABLE organ_reference_1
	ADD FOREIGN KEY (organ_idx)
	REFERENCES organ_type (organ_idx)
;


ALTER TABLE organ_reference_2
	ADD FOREIGN KEY (organ_idx)
	REFERENCES organ_type (organ_idx)
;


ALTER TABLE organ_reference_3
	ADD FOREIGN KEY (organ_idx)
	REFERENCES organ_type (organ_idx)
;



/* Comments */

COMMENT ON COLUMN member_patient.organ_idx IS '요양원코드';
COMMENT ON COLUMN member_savelist.organ_idx IS '요양원코드';
COMMENT ON COLUMN organ_comment.organ_idx IS '요양원코드';
COMMENT ON COLUMN organ_list.organ_idx IS '요양원코드';
COMMENT ON COLUMN organ_reference_1.organ_name IS '기관명';
COMMENT ON COLUMN organ_reference_1.organ_grade IS 'A/B/C/D등급';
COMMENT ON COLUMN organ_reference_1.organ_fund IS '설립정보';
COMMENT ON COLUMN organ_reference_1.organ_care IS '간병형태(공동간병, 전담간병)';
COMMENT ON COLUMN organ_reference_1.organ_loca IS '입지정보(단독건물, 빌딩 등)';
COMMENT ON COLUMN organ_reference_1.organ_reli IS '종교활동(아니오, 불교, 기독교)';
COMMENT ON COLUMN organ_reference_1.organ_call IS '전화번호(- 제외)';
COMMENT ON COLUMN organ_reference_1.organ_pay IS '입원 1일당 진료비(환자의 건강보험과 본인부담금을 포함)';
COMMENT ON COLUMN organ_reference_1.organ_subject IS '진료과목(재활의학과 등)';
COMMENT ON COLUMN organ_reference_1.organ_time IS '진료시간';
COMMENT ON COLUMN organ_reference_1.organ_ref IS '시설정보';
COMMENT ON COLUMN organ_reference_1.organ_patNum IS '환자 수';
COMMENT ON COLUMN organ_reference_1.organ_docNum IS '의사 수';
COMMENT ON COLUMN organ_reference_1.organ_nurNum IS '간호사 수';
COMMENT ON COLUMN organ_reference_1.organ_staffNum IS '간호인력 수';
COMMENT ON COLUMN organ_reference_1.organ_patList IS '입원환자 현황(질환, 일상수행 가능정도)';
COMMENT ON COLUMN organ_reference_1.organ_eval IS '평가정보현황';
COMMENT ON COLUMN organ_reference_1.organ_idx IS '요양원코드';
COMMENT ON COLUMN organ_reference_2.organ_idx IS '요양원코드';
COMMENT ON COLUMN organ_reference_3.organ_idx IS '요양원코드';
COMMENT ON COLUMN organ_type.organ_idx IS '요양원코드';
COMMENT ON COLUMN organ_type.organ_name IS '요양원이름';
COMMENT ON COLUMN organ_type.organ_type IS '요양병원/요양원/방문시설';



