<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
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
		alert("정보 변경에 성공하였습니다.");
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
          	${patientInfo.pati_name } 환자 정보
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <form
				name="modFrm"
				method="post"
				action="./PatientModfiyCtrl.do"
				>
              <input type="hidden" value="${patientInfo.pati_idx }" name="pati_idx" />
              <table class="table table-bordered">
              <tr>
              	<th>보호자 계정/이름</th>
              	<th colspan="2">
	              	기존 보호자 : <a href="./MemberInfoCtrl.do?user_id=${patientInfo.user_id }" >
					${patientInfo.user_id }
					</a>
					<input type="text" class="form-control" name="user_id" value="${patientInfo.user_id }" />
              	</th>
              </tr>
              <tr>
              	<th>환자이름</th>
              	<th>성별</th>
              	<th>생년월일</th>
              	
              </tr>
              <tr>
              	<td><input type="text" class="form-control" name="pati_name" value="${patientInfo.pati_name }" /> </td>
              	<td><input type="text" class="form-control" name="pati_sex" value="${patientInfo.pati_sex }" /> </td>
              	<td>
              		<div class="form-group">
				      <input type="date" class="form-control" id="usr" name="pati_birthdate" value="${patientInfo.pati_birthdate }">
				    </div>
              	</td>
              </tr>
              
              <tr>
              	<th>혈액형</th>
              	<th>보호자와의 관계</th>
              	<th>정보등록일</th>
              	
              </tr>
              <tr>
                <td><input type="text" class="form-control" name="pati_blood" value="${patientInfo.pati_blood }" /> </td>
                <td><input type="text" class="form-control" name="pati_relation" value="${patientInfo.pati_relation }" /> </td>
                <td><input type="text" class="form-control" name="pati_regidate" value="${patientInfo.pati_regidate }" readonly="readonly"/> </td>
              </tr>
              
              <tr>
              	<th>주소</th>
              	<th>기초수급대상</th>
              	<th>주거형태</th>
              </tr>
              <tr>
	            <td><input type="text" class="form-control" name="pati_address" value="${patientInfo.pati_address }" /> </td>
	            <td><input type="text" class="form-control" name="pati_living" value="${patientInfo.pati_living }" /> </td>
	            <td><input type="text" class="form-control" name="pati_housingtype" value="${patientInfo.pati_housingtype }" /> </td>
              </tr>
              
              <tr>
              	<th>종교</th>
              	<th>신장</th>
              	<th>체중</th>
              </tr>
              <tr>
	            <td><input type="text" class="form-control" name="pati_religion" value="${patientInfo.pati_religion }" /> </td>
	            <td><input type="text" class="form-control" name="pati_height" value="${patientInfo.pati_height }" /> </td>
	            <td><input type="text" class="form-control" name="pati_weight" value="${patientInfo.pati_weight }" /> </td>
              </tr>
              
              <tr>
              	<th colspan="2">요양번호</th>
              	<th>요양등급</th>
              </tr>
              <tr>
	            <td colspan="2"><input type="text" class="form-control" name="pati_recuperation_num" value="${patientInfo.pati_recuperation_num }" /> </td>
	            <td><input type="text" class="form-control" name="pati_recuperation_grade" value="${patientInfo.pati_recuperation_grade }" /> </td>
              </tr>
              
              <tr>
              	<th>식사</th>
              	<th>보행</th>
              	<th>세면</th>
              </tr>
              <tr>
	            <td><input type="text" class="form-control" name="pati_living_meal" value="${patientInfo.pati_living_meal }" /> </td>
	            <td><input type="text" class="form-control" name="pati_living_walk" value="${patientInfo.pati_living_walk }" /> </td>
	            <td><input type="text" class="form-control" name="pati_living_wash" value="${patientInfo.pati_living_wash }" /> </td>
              </tr>
              
              <tr>
              	<th>의복</th>
              	<th>목욕</th>
              	<th>화장실</th>
              </tr>
              <tr>
	            <td><input type="text" class="form-control" name="pati_living_dress" value="${patientInfo.pati_living_dress }" /> </td>
	            <td><input type="text" class="form-control" name="pati_living_bathe" value="${patientInfo.pati_living_bathe }" /> </td>
	            <td><input type="text" class="form-control" name="pati_living_bathroom" value="${patientInfo.pati_living_bathroom }" /> </td>
              </tr>
              
              <tr>
              	<th colspan="3">질병 정보</th>
              	
              </tr>
              <tr>
                <td colspan="3">
                	<input type="text" class="form-control" name="pati_diseaseinfo" value="${patientInfo.pati_diseaseinfo }" /> </td>
                
              </tr>
              
              <tr>
              	<th>좋아하는 음식</th>
              	<th>싫어하는 음식</th>
              	<th>알러지 음식</th>
              </tr>
              <tr>
	            <td><input type="text" class="form-control" name="pati_food_like" value="${patientInfo.pati_food_like }" /> </td>
	            <td><input type="text" class="form-control" name="pati_food_hate" value="${patientInfo.pati_food_hate }" /> </td>
	            <td><input type="text" class="form-control" name="pati_food_allergy" value="${patientInfo.pati_food_allergy }" /> </td>
              </tr>
              
              <tr>
              	<th>당뇨식 여부</th>
              	<th>습관</th>
              	<th>성향</th>
              </tr>
              <tr>
	            <td><input type="text" class="form-control" name="pati_food_diabetes" value="${patientInfo.pati_food_diabetes }" /> </td>
	            <td><input type="text" class="form-control" name="pati_singularity_habit" value="${patientInfo.pati_singularity_habit }" /> </td>
	            <td><input type="text" class="form-control" name="pati_singularity_tendency" value="${patientInfo.pati_singularity_tendency }" /> </td>
              </tr>
              
              <tr>
              	<th>언어 능력</th>
              	<th>등록 병원</th>
              	<th>시설 등록일</th>
              </tr>
              <tr>
	            <td><input type="text" class="form-control" name="pati_singularity_language" value="${patientInfo.pati_singularity_language }" /> </td>
	            
	            <c:choose>
					<c:when test="${empty row.organ_idx}">
						<td><input type="text" class="form-control" name="organ_idx" value="등록안됨" /></td>
						<td>
							<div class="form-group">
						      <input type="date" class="form-control" id="usr" name="pati_hospital_regidate" >
						    </div>
					    </td>
					</c:when>
					<c:otherwise>
						<td><input type="text" class="form-control" name="organ_idx" value="${patientInfo.organ_idx }" /> </td>
						<td>
							<div class="form-group">
						      <input type="date" class="form-control" id="usr" name="pati_hospital_regidate" value="${patientInfo.pati_hospital_regidate }">
						    </div>
						</td>
					</c:otherwise>
				</c:choose>
              </tr>
              
              </table>
              <div style="text-align: right; padding-bottom: 20px;">
            	<button class="btn btn-danger" type="submit" style="color: white;">정보 수정</button>
              </div>
              </form>
            </div>
            
            
            
            
            <div style="text-align: right;">
            	<button class="btn btn-warning" type="button" style="color: white;"
            		onclick="location.href='./SanatoriumListCtrl.do';">시설 리스트 가기</button>
            </div>
          </div>
        </div>

      </div>
      
      
      
      
      <!-- /.container-fluid -->

      <!-- Sticky Footer -->
      <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © Your Website 2019</span>
          </div>
        </div>
      </footer>

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