<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<!DOCTYPE html>
<script>
$(function(){
	$(document).ready(function(){
		$.ajax({
			url : "./common/address1.jsp",
			type : "get",
			data : {	
			},
			dataType : "json",
			contentType : "text/html; charset:utf-8",
			success:function(responseData){	
				$('#address1').html("<option value=''></option>"+responseData.address1); 
			},
			error:function(errorData){
				alert("오류발생:" + errorData.status+":"+errorData.statusText);
			}
		});
	});

	$('#address1').change(function(){
		$('#address2 option').remove();
		$('#address3 option').remove();		
		
		if(this.value != ''){
			$.ajax({
				url : "./common/address2.jsp",
				type : "get",
				data : {
					address1 : this.value	
				},
				dataType : "json",
				contentType : "text/html; charset:utf-8",
				success:function(responseData){	
					$('#address2').html("<option value=''></option>"+responseData.address2); 
				},
				error:function(errorData){
					alert("오류발생:" + errorData.status+":"+errorData.statusText);
				}
			});
		}
	});
	$('#address2').change(function(){
		$('#address3 option').remove();		
		
		if(this.value != ''){
			$.ajax({
				url : "./common/address3.jsp",
				type : "get",
				data : {
					address1 : $('#address1').val(),
					address2 : this.value	
				},
				dataType : "json",
				contentType : "text/html; charset:utf-8",
				success:function(responseData){	
					$('#address3').html("<option value=''></option>"+responseData.address3); 
				},
				error:function(errorData){
					alert("오류발생:" + errorData.status+":"+errorData.statusText);
				}
			});
		}
	});
	
	$('#address3').change(function(){
		$('#organ_address').val($('#address1').val()+" "+$('#address2').val()+" "+$('#address3').val());
	});
	
	$('#address4').keyup(function(){
		$('#organ_address').val($('#address1').val()+" "+$('#address2').val()+" "+$('#address3').val()+" "+$('#address4').val());
	});
});
</script>
<%
 
    request.setCharacterEncoding("UTF-8");
 
%>

<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>SB Admin - Tables</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">

</head>
<%
if(request.getAttribute("RESULT")!=null){

	if(request.getAttribute("RESULT").toString().equals("1")){
		request.removeAttribute("RESULT");
		request.removeAttribute("RESULT");
%>
	<script>
		alert("변경 성공");
	</script>
	
<% 	}else{
	request.removeAttribute("RESULT");%>
	<script>
		alert("변경에 실패하였습니다. 다시 시도해주세요");
		history.go(-1);
	</script>
<%
	}
} %>


<body id="page-top">

	<div>
		<!-- Top영역(GNB영역 : Global Navigation Bar) -->
		<%@ include file="../common/commonTop.jsp" %>
		<!-- Top영역(GNB영역 : Global Navigation Bar) -->		
	</div>

  	<div id="wrapper">

    <!-- Left영역 -->
	<%@ include file="../common/commonLeft.jsp" %>
	<!-- Left영역 -->	

    <div id="content-wrapper">

      <div class="container-fluid">

        <!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-header">
          	병원 시설 정보 입력
          </div>
          <div class="card-body">
            <div class="table-responsive">
            <form
			name="writeFrm"
			method="post"
			action="./SanatoriumInsert1Ctrl.do"
			onsubmit="return frmValidata(this);"
			>
            <table class="table table-bordered">
              <tr>
              	<th>시설 관리자 계정</th>
              	<th colspan="2">
	              	<input type="text" class="form-control" name="user_id" value=""/>
              	</th>
              </tr>
              <tr>
              	<th colspan="2">기관명</th>
              	<th>등급</th>
              </tr>
              <tr>
              	<td colspan="2"><input type="text" class="form-control" name="organ_name" value="" /> </td>
              	<td><select name="organ_grade" class="form-control" >
						<option value="정보없음">정보없음</option>
						<option value="1등급">1등급</option>
						<option value="2등급">2등급</option>
						<option value="3등급">3등급</option>
					</select> 
				</td>
              </tr>
              
              <tr>
              	<th colspan="3">주소</th>
              </tr>
              <tr>
                <td colspan="3" >
                
                	<select id="address1" name="address1" class="" style="width: 130px; height:40px; border-radius:4px;" ></select>	
					<select id="address2" name="address2" class="" style="width: 100px; height:40px; border-radius:4px;"></select>
					<select id="address3" name="address3" class="" style="width: 100px; height:40px; border-radius:4px;"></select>
					<input type="text" id="address4" name="address4" class="form-control" placeholder="상세주소" style="width: 400px;"/>
                	<input type="hidden" name="organ_address" id="organ_address"/>
                </td>
              </tr>
              
              <tr>
              	<th>설립정보</th>
              	<th>설립일</th>
              	<th>전화번호</th>
              </tr>
              <tr>
	            <td><select name="organ_fund" class="form-control" >
						<option value="정보없음">정보없음</option>
						<option value="개인">개인</option>
						<option value="단체">단체</option>
						<option value="공공기관">공공기관</option>			
						<option value="기타">기타</option>			
					</select>
				</td>
	            <td>
		            <div class="form-group">
				      <input type="date" class="form-control" id="usr" name="organ_fund">
				    </div>
	            </td>
	            <td>
	            	<input type="text" class="form-control" name="organ_call" value=""/>
	            </td>
              </tr>
              
              <tr>
              	<th>간병형태</th>
              	<th>입지정보</th>
              	<th>종교활동</th>
              </tr>
              <tr>
	            <td><select name="organ_care" class="form-control" >
						<option value="정보없음">정보없음</option>
						<option value="개별간병">개별간병</option>
						<option value="공동간병">공동간병</option>			
						<option value="기타">기타</option>
					</select>
				</td>
	            <td>
		            <select name="organ_loca" class="form-control" >
						<option value="정보없음">정보없음</option>
						<option value="단독건물">단독건물</option>
						<option value="상가건물">상가건물</option>			
						<option value="기타">기타</option>
					</select>
	            </td>
	            <td>
	            	<select name="organ_reli" class="form-control" >
						<option value="정보없음">정보없음</option>
						<option value="천주교">천주교</option>
						<option value="기독교">기독교</option>
						<option value="불교">불교</option>			
						<option value="기타">기타</option>
					</select>
	            </td>
              </tr>
              
              <tr>
              	<th>진료비<br />(입원 1일당 평균 진료비, 총 금액)</th>
              	<th colspan="2">진료과목(전무의수)</th>
              </tr>
              <tr>
	            <td>
	            	<input type="number" class="form-control" name="organ_pay" value="0"/>
				</td>
	            <td colspan="2">
		            <input type="text" class="form-control" name="organ_subject" placeholder="내과(2), 외과(1)"/>
	            </td>
	            
              </tr>
              
              <tr>
              	<th colspan="3">시설정보</th>
              </tr>
              <tr>
	            
	            <td colspan="3">
	            	<input type="text" class="form-control" name="organ_ref" placeholder="물리치료실(7),일반병상(196)"/>
	            </td>
              </tr>
              
              <tr>
              	<th>환자 수</th>
              	<th>의사 수</th>
              	<th>간호사 수</th>
              </tr>
              <tr>
	            <td>
	            	<input type="number" class="form-control" name="organ_patnum" min="0" value="0"/>
				</td>
	            <td>
	            	<input type="number" class="form-control" name="organ_docnum" min="0" value="0"/>
				</td>
				<td>
	            	<input type="number" class="form-control" name="organ_nurnum" min="0" value="0"/>
				</td>
              </tr>
              
              <tr>
              	<th>간호인력 수</th>
              	<th colspan="2">입원환자현황(질환)</th>
              </tr>
              <tr>
	            <td>
	            	<input type="number" class="form-control" name="organ_staffnum" min="0" value="0"/>
				</td>
	            <td colspan="2">
	            	<input type="text" style="width: 130px; border-radius:4px;" name="organ_disease1" placeholder="1순위" />
					<input type="text" style="width: 130px; border-radius:4px;" name="organ_disease2" placeholder="2순위" />
					<input type="text" style="width: 130px; border-radius:4px;" name="organ_disease3" placeholder="3순위" />
				</td>
              </tr>
              <tr>
              	<th colspan="3">입원환자현황(일상생활)</th>
              </tr>
              <tr>
	            <td colspan="3">
		        	<input type="text" style="width: 250px; border-radius:4px;" value="스스로 가능(명)" readonly/>
		        	<input type="number" style="width: 100px; border-radius:4px;" name="organ_life1" min="0" max="100" value="0" />
					<br />
					<input type="text" style="width: 250px; border-radius:4px;" value="타인의 도움 필요(명)" readonly/>
					<input type="number" style="width: 100px; border-radius:4px;" name="organ_life2" min="0" max="100" value="0" />
					<br />
					<input type="text" style="width: 250px; border-radius:4px;" value="타인의 도움 전적으로 필요(명)" readonly/>
					<input type="number" style="width: 100px; border-radius:4px;" name="organ_life3" min="0" max="100" value="0" />
				</td>
              </tr>
              <tr>
              	<th colspan="3">평가정보현황(욕창)</th>
              </tr>
              <tr>
	            <td colspan="3">
		        	<input type="text" style="width: 250px; border-radius:4px;" value="욕창발생(명)" readonly/>
		        	<input type="number" style="width: 100px; border-radius:4px;" name="organ_eval1" min="0" max="100" value="0" />
					<br />
					<input type="text" style="width: 250px; border-radius:4px;" value="욕창감소(명)" readonly/>
					<input type="number" style="width: 100px; border-radius:4px;" name="organ_eval2" min="0" max="100" value="0" />
					<br />
					<input type="text" style="width: 250px; border-radius:4px;" value="욕창악화(명)" readonly/>
					<input type="number" style="width: 100px; border-radius:4px;" name="organ_eval3" min="0" max="100" value="0" />
				</td>
              </tr>
              
              <tr>
              	<th colspan="3">진료시간</th>
              	
              	
              </tr>
              <tr>
                <td colspan="3">
					<input type="text" class="form-control" value="평일 점심시간" readonly="readonly"/> 
					<br /><text style="margin-left:10px;">없음</text>
					<input type="checkbox"  name="organ_timeCheck1" value="1" >
					<input type="time" style="width: 130px; border-radius:4px;" name="organ_time11" />
					<text>~</text>
					<input type="time" style="width: 130px; border-radius:4px;" name="organ_time12" />
					
					<br /><br />
					<input type="text" class="form-control" value="평일 진료시간" readonly="readonly"/>
					<br /><text style="margin-left:10px;">없음</text>
					<input type="checkbox" name="organ_timeCheck2" value="1">
					<input type="time" style="width: 130px; border-radius:4px;" name="organ_time21" />
					<text>~</text>
					<input type="time" style="width: 130px; border-radius:4px;" name="organ_time22" />
					
					<br /><br />
					<input type="text" class="form-control" value="토요일 점심시간" readonly="readonly"/>
					<br /><text style="margin-left:10px;">없음</text>
					<input type="checkbox" name="organ_timeCheck3" value="1">
					<input type="time" style="width: 130px; border-radius:4px;" name="organ_time31" />
					<text>~</text>
					<input type="time" style="width: 130px; border-radius:4px;" name="organ_time32" />
					
					<br /><br />
					<input type="text" class="form-control" value="토요일 진료시간" readonly="readonly"/>
					<br /><text style="margin-left:10px;">없음</text>
					<input type="checkbox" name="organ_timeCheck4" value="1">
					<input type="time" style="width: 130px; border-radius:4px;" name="organ_time41" />
					<text>~</text>
					<input type="time" style="width: 130px; border-radius:4px;" name="organ_time42" />
					
					<br /><br />
					<input type="text" class="form-control" value="일요일 점심시간" readonly="readonly"/>
					<br /><text style="margin-left:10px;">없음</text>
					<input type="checkbox" name="organ_timeCheck5" value="1">
					<input type="time" style="width: 130px; border-radius:4px;" name="organ_time51" />
					<text>~</text>
					<input type="time" style="width: 130px; border-radius:4px;" name="organ_time52" />
					
					<br /><br />
					<input type="text" class="form-control" value="일요일 진료시간" readonly="readonly"/>
					<br /><text style="margin-left:10px;">없음</text>
					<input type="checkbox" name="organ_timeCheck6" value="1">
					<input type="time" style="width: 130px; border-radius:4px;" name="organ_time61" />
					<text>~</text>
					<input type="time" style="width: 130px; border-radius:4px;" name="organ_time62" />
					
					<br /><br />		
					<input type="text" class="form-control" value="공휴일 점심시간" readonly="readonly"/>
					<br /><text style="margin-left:10px;">없음</text>
					<input type="checkbox" name="organ_timeCheck7" value="1">
					<input type="time" style="width: 130px; border-radius:4px;" name="organ_time71" />
					<text>~</text>
					<input type="time" style="width: 130px; border-radius:4px;" name="organ_time72" />
					
					<br /><br />
					<input type="text" class="form-control" value="공휴일 진료시간" readonly="readonly"/>
					<br /><text style="margin-left:10px;">없음</text>
					<input type="checkbox" name="organ_timeCheck8" value="1">
					<input type="time" style="width: 130px; border-radius:4px;" name="organ_time81" />
					<text>~</text>
					<input type="time" style="width: 130px; border-radius:4px;" name="organ_time82" />
					
					<br /><br />
					
                </td>
                
              </tr>
              <tr>
              	<th colspan="3">병원 소개</th>
              	
              </tr>
              <tr>
              	<td colspan="3">
              		<input type="text" name="organ_comment" class="form-control" value=""/>
              	</td>
              </tr>
              <tr>
              	<th>타입</th>
              	<td colspan="2">${organ_type }
              		<input type="hidden" name="organ_type" value="${organ_type }"/>
              	</td>
              </tr>
            </table>
            <div style="text-align: right;">
            <button class="btn btn-info" type="submit" style="color: white;">등록</button>
            </div>
            </form>
            </div>
            <div style="text-align: right;">
            	<button class="btn btn-warning" type="button" style="color: white;"
            		onclick="location.href='./SanatoriumListCtrl.do';">병원 리스트 가기</button>
            </div>
          </div>
        </div>

      </div>
      
      
      
      
      <!-- /.container-fluid -->

      

    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Page level plugin JavaScript-->
  <script src="vendor/datatables/jquery.dataTables.js"></script>
  <script src="vendor/datatables/dataTables.bootstrap4.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="js/sb-admin.min.js"></script>

  <!-- Demo scripts for this page-->
  <script src="js/demo/datatables-demo.js"></script>

</body>

</html>