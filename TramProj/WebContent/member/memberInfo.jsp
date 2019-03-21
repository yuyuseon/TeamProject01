<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
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
          	${memberInfo.user_id } 회원 정보
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table">
              <tr>
              	<th>아이디</th>
              	<td colspan="3">${memberInfo.user_id }</td>
              </tr>
              <tr>
              	<th>이름</th>
              	<td colspan="3">${memberInfo.user_name }</td>
              </tr>
              <tr>
              	<th>휴대폰 번호</th>
              	<td colspan="3">${memberInfo.user_phone }</td>
              </tr>
              <tr>
              	<th>가입일</th>
              	<td colspan="3">${memberInfo.user_regidate }</td>
              </tr>
              <tr>
              	<th>타입</th>
              	<td>${memberInfo.user_type }</td>
              	<form action="./MemberRestraint.do">
              	<td>
              		<input type="hidden" id="user_id" name="user_id" value="${memberInfo.user_id }"/>
              		<select name="restraint" id="restraint" class="form-control">
              		
              		
              		<c:set var="typesub" value="${fn:substring(memberInfo.user_type,0,2) }"/>
              		<c:set var="typelength" value="${fn:length(memberInfo.user_type) }"/>
              		
						
					<c:choose>
					    <c:when test="${typesub eq '정지'}">
					        <option value="${fn:substring(memberInfo.user_type,3,typelength) }" selected>${fn:substring(memberInfo.user_type,3,typelength) }</option>
					        <option value="${memberInfo.user_type }" >${memberInfo.user_type }</option>
					        
					    </c:when>
					 
					    <c:when test="${typesub ne '정지'}">
					        <option value="${memberInfo.user_type }" selected>${memberInfo.user_type }</option>
					        <option value="정지/${memberInfo.user_type }" >정지/${memberInfo.user_type }</option>
					       	
					    </c:when>
					</c:choose>
					</select>
					
              	</td>
              	<td>
              		<button type="submit" class="btn btn-danger">변경</button>
              	</td>
              	</form>
              </tr>
              </table>
              
              <table class="table table-bordered">
            	<tr>
            		<th colspan="3">${memberInfo.user_id } 작성 후기 리스트</th>
            	</tr>
            	<tr>
            		<td style="width: 20%;">작성 시설</td>
            		<td style="width: 15%;">평점</td>
            		<td style="width: 65%;">내용</td>
            	</tr>
            	<c:choose>
					<c:when test="${empty colists }">
						<tr style="text-align: center;">
							<td colspan="3">
								등록된 댓글이 없습니다.
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${colists }" var="row" varStatus="loop">
							<tr>
								<td>
									${row.organ_idx }
								</td>
								<td>${row.comment_rating }</td>
								<td class="text-left">
									${row.comment_com }
								</td>
							</tr>
							
						</c:forEach>
					</c:otherwise>
				</c:choose>
            </table>
            </div>
            <div style="text-align: right;">
            	<button class="btn btn-warning" type="button" style="color: white;"
            		onclick="location.href='./ListCtrl.do';">회원 리스트 가기</button>
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