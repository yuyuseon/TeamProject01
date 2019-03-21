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
          	${sanatoriumInfo.organ_name } 시설 정보
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered">
              <tr>
              	<th>시설 관리자 계정</th>
              	<th colspan="2">
	              	<a href="./MemberInfoCtrl.do?user_id=${sanatoriumInfo.user_id }" >
					${sanatoriumInfo.user_id }
					</a>
              	</th>
              </tr>
              <tr>
              	<th>기관코드</th>
              	<th>기관명</th>
              	<th>등급</th>
              	
              </tr>
              <tr>
              	<td><input type="text" class="form-control" value="${sanatoriumInfo.organ_idx }" readonly="readonly"/> </td>
              	<td><input type="text" class="form-control" value="${sanatoriumInfo.organ_name }" /> </td>
              	<td><input type="text" class="form-control" value="${sanatoriumInfo.organ_grade }" /> </td>
              </tr>
              
              <tr>
              	<th>주소</th>
              	<th>위치</th>
              	<th>전화번호</th>
              	
              </tr>
              <tr>
                <td><input type="text" class="form-control" value="${sanatoriumInfo.organ_address }" /> </td>
                <td><input type="text" class="form-control" value="${sanatoriumInfo.organ_loc }" /> </td>
                <td><input type="text" class="form-control" value="${sanatoriumInfo.organ_phone }" /> </td>
              </tr>
              
              <tr>
              	<th>기관일련번호</th>
              	<th>설립일</th>
              	<th>승인일</th>
              </tr>
              <tr>
	            <td><input type="text" class="form-control" value="${sanatoriumInfo.organ_code }" /> </td>
	            <td><input type="text" class="form-control" value="${sanatoriumInfo.organ_fundate }" /> </td>
	            <td><input type="text" class="form-control" value="${sanatoriumInfo.organ_appdate }" /> </td>
              </tr>
              
              <tr>
              	<th colspan="3">기타시설</th>
              	
              	
              </tr>
              <tr>
                <td colspan="3">
                	<input type="text" class="form-control" value="${sanatoriumInfo.organ_etc }" /> </td>
                
              </tr>
              <tr>
              	
              	<th colspan="3">주차시설</th>
              	
              </tr>
              <tr>
                <td colspan="3">
                	<input type="text" class="form-control" value="${sanatoriumInfo.organ_park }" /> </td>
              </tr>
              <tr>
              	<th colspan="3" >인력현황</th>
              </tr>
              <tr>
                <td colspan="3">
                	<input type="text" class="form-control" value="${sanatoriumInfo.organ_hr }" /> </td>
              </tr>
              <tr>
              	<th colspan="3">침실현황</th>
              </tr>
              <tr>
                <td colspan="3">
                	<input type="text" class="form-control" value="${sanatoriumInfo.organ_bedroom }" /> </td>
              </tr>
              
              <tr>
              	<th>비급여현황_식재료비</th>
              	<th>비급여현황_간식비</th>
              	<th>비급여현황_미용비</th>
              </tr>
              <tr>
                <td><input type="text" class="form-control" value="${sanatoriumInfo.organ_nonpayfood }" /> </td>
                <td><input type="text" class="form-control" value="${sanatoriumInfo.organ_nonpaysnack }" /> </td>
                <td><input type="text" class="form-control" value="${sanatoriumInfo.organ_nonpayhaircut }" /> </td>
              	
              </tr>
              <tr>
              	<th colspan="3">사진</th>
              </tr>
              <tr>
              	<td colspan="3">${sanatoriumInfo.organ_photo }</td>
              </tr>
              <tr>
              	<th>타입</th>
              	<td colspan="2">${organ_type }</td>
              	<form action="./MemberRestraint.do">
              	
              	</form>
              </tr>
              </table>
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