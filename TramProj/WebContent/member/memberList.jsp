<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>


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
            <i class="fas fa-table"></i>
          	회원리스트 
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>휴대폰번호</th>
                    <th>가입일</th>
                    <th>타입</th>
                  </tr>
                </thead>
                <!-- <tfoot>
                  <tr>
                    <th>아이디</th>
                    <th>이름</th>
                    <th>휴대폰번호</th>
                    <th>가입일</th>
                    <th>타입</th>
                  </tr>
                </tfoot> -->
                <tbody>
                  <c:choose>
					<c:when test="${empty lists }">
						<tr style="text-align: center;">
							<td colspan="5">
								등록된 글이 없습니다.
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${lists }" var="row" varStatus="loop">
							<tr>
								<td>
									<a href="./MemberInfoCtrl.do?user_id=${row.user_id }" >
									${row.user_id }
									</a>
								</td>
								<td class="text-left">
									${row.user_name }
								</td>
								<td>${row.user_phone }</td>
								<td>${row.user_regidate}</td>
								<td>${row.user_type }</td>
								
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
                </tbody>
              </table>
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