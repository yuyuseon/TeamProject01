<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요양선</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link href="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<link href="styles/login.css" rel="stylesheet" id="bootstrap-css">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="js/login.js"></script>
<script src="js/regist.js"></script>
<script src="js/address.js"></script>
<script>
function isValidate(f){
	if(f.organ_name.value==''){
		alert("기관명은 필수입니다");
		f.organ_name.focus();
		return false;
	}
	if(f.organ_address.value==''){
		alert("기관 주소는 필수입니다");
		f.organ_address.focus();
		return false;
	}
	if(f.organ_call.value==''){
		alert("전화번호는 필수입니다");
		f.organ_call.focus();
		return false;
	}
}
</script>
<style>
input[type=checkbox]{
	margin-left:20px;
}
text{
	margin-left:50px;
	 color:#777777;		
}
input{
	 color:#777777;					
}
</style>
</head>
<body>
<div class="container mt-3">
  <h2>신청하실 시설의 종류를 선택 후 폼을 작성해 주세요</h2>
  <h3>관리자의 심의 후 시설회원으로 전환됩니다.</h3>
  <br>
  <!-- Nav tabs -->
  <ul class="nav nav-tabs nav-justified">
    <li class="nav-item">
      <a class="nav-link active" data-toggle="tab" href="#요양병원" style="color:black;">요양병원으로 전환하기</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#요양원" style="color:black;">요양원으로 전환하기</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" data-toggle="tab" href="#방문시설" style="color:black;">방문시설로 전환하기</a>
    </li>
  </ul>

  <!-- Tab panes -->
  <div class="tab-content">
<!--   <input type="text" class="form-control" name="addressCode" id="sample6_postcode" placeholder="우편번호 찾기" readonly onclick="sample6_execDaumPostcode()"><br/>
		<input type="text" class="form-control" name="address1" id="sample6_address" placeholder="주소" readonly><br/>
		<input type="text" class="form-control" name="address2" id="sample6_detailAddress" placeholder="상세주소">
		<input type="hidden" class="form-control" name="address3" id="sample6_extraAddress" placeholder="참고항목" readonly> -->
    <div id="요양병원" class="container tab-pane active"><br>
      <form action="member/changeTypeAction1" method="get" onsubmit="return isValidate(this);" accept-charset="UTF-8">
      <input type="hidden" value="요양병원" name="organ_type" />
		<label><p class="label-txt">기관명</p><input type="text" class="input" name="organ_name" /><div class="line-box"><div class="line"></div></div></label>
		<label><p class="label-txt">주소</p><br />
		<select id="address1" name="address1" class="input" ></select>	
		<select id="address2" name="address2" class="input" ></select>
		<select id="address3" name="address3" class="input" ></select>
		<input type="text" id="address4" name="address4" class="input" placeholder="상세주소"/>	
		<input type="hidden" id="organ_address" name="organ_address" class="input"/>	
		</label>
		<label><p class="label-txt">전화번호</p>
		<input type="text" class="input" name="organ_call" />
		<div class="line-box"><div class="line"></div></div></label>
		<label><p class="label-txt">등급</p>
		<select name="organ_grade" class="input" >
			<option value="정보없음">정보없음</option>
			<option value="1등급">1등급</option>
			<option value="2등급">2등급</option>
			<option value="3등급">3등급</option>
		</select><div class="line-box"><div class="line"></div></div></label>
		<label><p class="label-txt">설립정보</p>
		<select name="organ_fund" class="input" >
			<option value="정보없음">정보없음</option>
			<option value="개인">개인</option>
			<option value="단체">단체</option>
			<option value="공공기관">공공기관</option>			
			<option value="기타">기타</option>			
		</select><div class="line-box"><div class="line"></div></div></label>
		<label><p class="label-txt">간병형태</p>
		<select name="organ_care" class="input" >
			<option value="정보없음">정보없음</option>
			<option value="개별간병">개별간병</option>
			<option value="공동간병">공동간병</option>			
			<option value="기타">기타</option>
		</select><div class="line-box"><div class="line"></div></div></label>
		<label><p class="label-txt">입지정보</p>
		<select name="organ_loca" class="input" >
			<option value="정보없음">정보없음</option>
			<option value="단독건물">단독건물</option>
			<option value="상가건물">상가건물</option>			
			<option value="기타">기타</option>
		</select>
		<div class="line-box"><div class="line"></div></div></label>
		<label style="text-align:left;"><p class="label-txt">종교활동</p><br />
		<input type="checkbox" class="form-check-input" name="organ_reli" value="천주교"><text>천주교</text><br />
		<input type="checkbox" class="form-check-input" name="organ_reli" value="기독교"><text>기독교</text><br />
		<input type="checkbox" class="form-check-input" name="organ_reli" value="불교"><text>불교</text><br />
		<input type="checkbox" class="form-check-input" name="organ_reli" value="기타"><text>기타</text><br />
		</label>
		<label><p class="label-txt">진료비</p>
		<input type="number" class="input" name="organ_pay" placeholder="입원 1일당 평균 진료비, 총 금액"  value="0"/><div class="line-box"><div class="line"></div></div></label>
		<label><p class="label-txt">진료과목(전문의수)</p><input type="text" class="input" name="organ_subject" placeholder="내과(2), 외과(1)"/><div class="line-box"><div class="line"></div></div></label>
		<label style="text-align:left;"><p class="label-txt">진료시간</p><br />
		<input type="text" class="input" value="평일 점심시간" /> <br /><text style="margin-left:10px;">없음</text><input type="checkbox" class="form-check-input" name="organ_timeCheck1" value="1"><input type="time" class="input" name="organ_time11" />
		<br /><text style="margin-left:10px;">~</text><input type="time" class="input" name="organ_time12" /><br /><br />
		<input type="text" class="input" value="평일 진료시간" /><br /><text style="margin-left:10px;">없음</text><input type="checkbox" class="form-check-input" name="organ_timeCheck2" value="1"><input type="time" class="input" name="organ_time21" />
		<br /><text style="margin-left:10px;">~</text><input type="time" class="input" name="organ_time22" /><br /><br />
		<input type="text" class="input" value="토요일 점심시간" /><br /><text style="margin-left:10px;;">없음</text><input type="checkbox" class="form-check-input" name="organ_timeCheck3" value="1"><input type="time" class="input" name="organ_time31" />
		<br /><text style="margin-left:10px;;">~</text><input type="time" class="input" name="organ_time32" /><br /><br />
		<input type="text" class="input" value="토요일 진료시간" /><br /><text style="margin-left:10px;">없음</text><input type="checkbox" class="form-check-input" name="organ_timeCheck4" value="1"><input type="time" class="input" name="organ_time41" />
		<br /><text style="margin-left:10px;">~</text><input type="time" class="input" name="organ_time42" /><br /><br />
		<input type="text" class="input" value="일요일 점심시간" /><br /><text style="margin-left:10px;">없음</text><input type="checkbox" class="form-check-input" name="organ_timeCheck5" value="1"><input type="time" class="input" name="organ_time51" />
		<br /><text style="margin-left:10px;">~</text><input type="time" class="input" name="organ_time52" /><br /><br />
		<input type="text" class="input" value="일요일 진료시간" /><br /><text style="margin-left:10px;">없음</text><input type="checkbox" class="form-check-input" name="organ_timeCheck6" value="1"><input type="time" class="input" name="organ_time61" />
		<br /><text style="margin-left:10px;">~</text><input type="time" class="input" name="organ_time62" /><br /><br />		
		<input type="text" class="input" value="공휴일 점심시간" /><br /><text style="margin-left:10px;">없음</text><input type="checkbox" class="form-check-input" name="organ_timeCheck7" value="1"><input type="time" class="input" name="organ_time71" />
		<br /><text style="margin-left:10px;">~<input type="time" class="input" name="organ_time72" /><br /><br />
		<input type="text" class="input" value="공휴일 진료시간" /><br /><text style="margin-left:10px;">없음</text><input type="checkbox" class="form-check-input" name="organ_timeCheck8" value="1"><input type="time" class="input" name="organ_time81" />
		<br /><text style="margin-left:10px;">~</text><input type="time" class="input" name="organ_time82" /><br /><br />
		</label>
		<label><p class="label-txt">시설정보</p><input type="text" class="input" name="organ_ref" placeholder="물리치료실(7),일반병상(196)"/><div class="line-box"><div class="line"></div></div></label>
		<label><p class="label-txt">환자 수</p><input type="number" class="input" name="organ_patnum" min="0" value="0"/><div class="line-box"><div class="line"></div></div></label>
		<label><p class="label-txt">의사 수</p><input type="number" class="input" name="organ_docnum" min="0" value="0"/><div class="line-box"><div class="line"></div></div></label>
		<label><p class="label-txt">간호사 수</p><input type="number" class="input" name="organ_nurnum" min="0" value="0"/><div class="line-box"><div class="line"></div></div></label>
		<label><p class="label-txt">간호인력 수</p><input type="number" class="input" name="organ_staffnum" min="0" value="0"/><div class="line-box"><div class="line"></div></div></label>
		<label><p class="label-txt">입원환자현황(질환)</p><br />
		<input type="text" class="input" name="organ_disease1" placeholder="1순위" />
		<input type="text" class="input" name="organ_disease2" placeholder="2순위" />
		<input type="text" class="input" name="organ_disease3" placeholder="3순위" />
		</label>
		<label><p class="label-txt">입원환자현황(일상생활)</p><br />
		<input type="text" class="input" value="스스로 가능(%)" readonly/><input type="number" class="input" name="organ_life1" min="0" max="100" value="0" />
		<input type="text" class="input" value="타인의 도움 필요(%)" readonly/><input type="text" class="input" name="organ_life2" min="0" max="100" value="0" />
		<input type="text" class="input" value="타인의 도움 전적으로 필요(%)" readonly/><input type="text" class="input" name="organ_life3" min="0" max="100" value="0" />
		</label>

		  <button type="submit">전환신청</button>
		</form>
    </div>
    
    
    
    <div id="요양원" class="container tab-pane fade"><br>
      <h3>Menu 1</h3>
      <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
    </div>
    
    
    
    <div id="방문시설" class="container tab-pane fade"><br>
      <h3>Menu 2</h3>
      <p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam.</p>
    </div>
  </div>
</div>


</body>
</html>