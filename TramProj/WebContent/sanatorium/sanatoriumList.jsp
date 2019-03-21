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
<%
if(request.getAttribute("Modified")!=null){
%>
<script>
	alert("설정이 변경되었습니다.");
</script>
<%} %>

<%
if(request.getAttribute("INSERT")!=null){
%>

	<script>
		alert("신규등록이 완료되었습니다.");
	</script>
	
<%} %>
	

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
          	 시설 리스트
          	<form action="./SanatoriumInsert1Ctrl.do" >
	          	<select name="new" id="new" 
	          		style="width: 150px; height: 40px; border-radius:4px; padding: 1px;">
	          		<option value="요양병원">요양병원</option> 
	          		<option value="요양원">요양원</option>
	          		<option value="방문시설">방문시설</option>
	          	</select>
	          	<button type="submit" class="btn btn-success" style="padding: 5px;">신규 등록</button>
	          	
          	</form>
          	
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                  <tr>
                    <th>이름</th>
                    <th>주소</th>
                    <th>등급</th>
                    <th>타입</th>
                    <th>노출여부</th>
                    
                  </tr>
                </thead>
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
									<a href="./SanatoriumInfoCtrl.do?organ_idx=${row.organ_idx }&organ_type=${row.organ_type }" >
									${row.organ_name }
									</a>
								</td>
								<td class="text-left">
									${row.organ_address }
								</td>
								<td>${row.organ_grade }</td>
								<td>${row.organ_type }</td>
								
								
								<c:choose>
								    <c:when test="${row.organ_view eq '노출'}">
								        <td>${row.organ_view }
								        	<button class="btn btn-danger"
								        		onclick="location.href='./SanatoriumListCtrl.do?organ_view=미노출&organ_idx=${row.organ_idx }&organ_type=${row.organ_type }';">미노출</button>
								        </td>
								        
								    </c:when>
								 
								    <c:when test="${row.organ_view eq '미노출'}">
								        <td>${row.organ_view }
								        	<button class="btn btn-success"
								        		onclick="location.href='./SanatoriumListCtrl.do?organ_view=노출&organ_idx=${row.organ_idx }&organ_type=${row.organ_type }';">노출</button>
								        </td>
								        
								        
								    </c:when>
								    
								</c:choose>
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