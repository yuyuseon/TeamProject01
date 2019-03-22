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

<%
if(request.getAttribute("ERROR_MSG")!=null){
%>
	<script>
	alert("댓글 삭제에 성공하였습니다.");
	</script>
<%
}
%>
<%
if(request.getAttribute("UPDATE")!=null){
%>
	<script>
	alert("정보 수정에 성공하였습니다.");
	</script>
<%
}
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

<style>
       .form-group select{width: 24%; height: 34px; border-radius:4px;}
</style>

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
          	[${sanatoriumInfo.organ_name }] 시설 상세 정보
          </div>
          <div class="card-body">
            <div class="table-responsive">
            <form
			name="writeFrm"
			method="post"
			action="./Sanatorium2UpdateCtrl.do"
			onsubmit="return frmValidata(this);"
			>
              <table class="table table-bordered">
              <tr>
              	<th>시설 관리자 계정</th>
              	<th colspan="2">
	              	<a href="./MemberInfoCtrl.do?user_id=${sanatoriumInfo.user_id }" >
					${sanatoriumInfo.user_id }
					</a>
					<input type="text" class="form-control" name="user_id" value="${sanatoriumInfo.user_id }" />
              	</th>
              </tr>
              <tr>
              	<th>기관코드</th>
              	<th colspan="2">기관명</th>
              </tr>
              <tr>
              	<td>
              	<input type="text" class="form-control" value="${sanatoriumInfo.organ_idx }" name="organ_idx" readonly="readonly"/> </td>
              	<td colspan="2"><input type="text" class="form-control" name="organ_name" value="${sanatoriumInfo.organ_name }" /> </td>
              </tr>
              
              <tr>

              	<th>등급</th>
              	<th colspan="2">전화번호</th>
              	
              </tr>
              <tr>
             	<td>
              		<c:set var="organ_grade" value="${sanatoriumInfo.organ_grade }"/>
              		<select name="organ_grade" class="form-control" >
						<option value="정보없음"  <c:if test="${organ_grade eq '정보없음'}"> selected</c:if>>정보없음</option>
						<option value="A등급" <c:if test="${organ_grade eq 'A등급'}"> selected</c:if>>A등급</option>
						<option value="B등급" <c:if test="${organ_grade eq 'B등급'}"> selected</c:if>>B등급</option>
						<option value="C등급" <c:if test="${organ_grade eq 'C등급'}"> selected</c:if>>C등급</option>
						<option value="D등급" <c:if test="${organ_grade eq 'D등급'}"> selected</c:if>>D등급</option>
					</select> 
              	</td>
              	<td colspan="2"><input type="text" class="form-control" name="organ_phone" value="${sanatoriumInfo.organ_phone }" /> </td>
              </tr>
              
              <tr>
              	<th colspan="2">주소</th>
              	<th>위치</th>
              	
              	
              </tr>
              <tr>
                <td colspan="2">
                <input type="text" class="form-control" n value="${sanatoriumInfo.organ_address }" /> 
                	<select id="address1" name="address1" class="" style="width: 130px; height:40px; border-radius:4px;" ></select>	
					<select id="address2" name="address2" class="" style="width: 100px; height:40px; border-radius:4px;"></select>
					<select id="address3" name="address3" class="" style="width: 100px; height:40px; border-radius:4px;"></select>
					<input type="text" id="address4" name="address4" class="form-control" placeholder="상세주소" style="width: 400px;"/>
                	<input type="hid-den" name="organ_address" id="organ_address" value="${sanatoriumInfo.organ_address }"/>

                </td>
                <td><input type="text" class="form-control" readonly="readonly" value="${sanatoriumInfo.organ_loc }" /> </td>
                
              </tr>
              
              <tr>
              	<th>기관일련번호</th>
              	<th>설립일</th>
              	<th>승인일</th>
              </tr>
              <tr>
	            <td><input type="text" class="form-control" name="organ_code" value="${sanatoriumInfo.organ_code }" /> </td>
	            <td>
		            <div class="form-group">
				      <input type="date" class="form-control" id="usr" name="organ_fundate" value="${sanatoriumInfo.organ_fundate }">
				    </div>
	            <td>
		            <div class="form-group">
				      <input type="date" class="form-control" id="usr" name="organ_appdate" value="${sanatoriumInfo.organ_appdate }">
				    </div>
	            </td>
              </tr>
              
              <tr>
              	<th colspan="3">기타시설</th>
              </tr>
              <tr>
                <td colspan="3">
                	<input type="text" class="form-control" name="organ_etc" value="${sanatoriumInfo.organ_etc }" /> </td>
                
              </tr>
              <tr>
              	
              	<th colspan="3">주차시설</th>
              	
              </tr>
              <tr>
                <td colspan="3">
                	<input type="text" class="form-control" name="organ_park" value="${sanatoriumInfo.organ_park }" /> </td>
              </tr>
              <tr>
              	<th colspan="3" >인력현황</th>
              </tr>
              <tr>
                <td colspan="3">
                	<input type="text" class="form-control" name="organ_hr" value="${sanatoriumInfo.organ_hr }" /> </td>
              </tr>
              <tr>
              	<th colspan="3">침실현황</th>
              </tr>
              <tr>
                <td colspan="3">
                	<input type="text" class="form-control" name="organ_bedroom" value="${sanatoriumInfo.organ_bedroom }" /> </td>
              </tr>
              
              <tr>
              	<th>비급여현황_식재료비(1회)</th>
              	<th>비급여현황_간식비(1회)</th>
              	<th>비급여현황_미용비(1회)</th>
              </tr>
              <tr>
                <td><input type="number" class="form-control" name="organ_nonpayfood" value="${sanatoriumInfo.organ_nonpayfood }" /> </td>
                <td><input type="number" class="form-control" name="organ_nonpaysnack" value="${sanatoriumInfo.organ_nonpaysnack }" /> </td>
                <td><input type="number" class="form-control" name="organ_nonpayhaircut" value="${sanatoriumInfo.organ_nonpayhaircut }" /> </td>
              	
              </tr>
              <tr>
              	<th colspan="3">시설 정보</th>
              </tr>
              <tr>
              	<td colspan="3"><input type="text" class="form-control" name="organ_comment" value="${sanatoriumInfo.organ_comment }" /></td>
              </tr>
              <tr>
              	<th>노출여부</th>
              	<td colspan="2">
              	<c:set var="organ_view" value="${sanatoriumInfo.organ_view }"/>
             	<select name="organ_view" class="form-control" >
					<option value="미노출"  <c:if test="${organ_grade eq '미노출'}"> selected</c:if>>미노출</option>
					<option value="노출" <c:if test="${organ_grade eq '노출'}"> selected</c:if>>노출</option>
				</select>
				</td>
              </tr>
              <tr>
              	<th>타입</th>
              	<td colspan="2">${organ_type }</td>
              	<input type="hidden" name="organ_type" value="${organ_type }" />
              </tr>
              </table>
              <div style="text-align: right;">
	          	<button class="btn btn-danger" type="submit" style="color: white;">수정하기</button>
	          </div>
              </form>
            </div>
            
            
            
            <table class="table table-bordered">
            	<tr>
            		<th colspan="4">후기 리스트</th>
            	</tr>
            	<tr>
            		<td style="width: 20%;">작성 ID</td>
            		<td style="width: 15%;">평점</td>
            		<td style="width: 50%;">내용</td>
            		<td style="width: 15%;">삭제</td>
            	</tr>
            	<c:choose>
					<c:when test="${empty colists }">
						<tr style="text-align: center;">
							<td colspan="4">
								등록된 댓글이 없습니다.
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${colists }" var="row" varStatus="loop">
							<tr>
								<td>
									<a href="./MemberInfoCtrl.do?user_id=${row.user_id }" >
									${row.user_id }
									</a>
								</td>
								<td>${row.comment_rating }</td>
								<td class="text-left">
									${row.comment_com }
								</td>
								<td>
								<button class="btn btn-danger"
								       onclick="location.href='./CommentDelete.do?comment_idx=${row.comment_idx}&organ_idx=${row.organ_idx }';">삭제</button>
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
            </table>
            <div style="text-align: right;">
            	<button class="btn btn-warning" type="button" style="color: white;"
            		onclick="location.href='./SanatoriumListCtrl.do';">시설 리스트 가기</button>
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
