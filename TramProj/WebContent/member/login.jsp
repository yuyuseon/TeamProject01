<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>건덕 Admin - Login</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">

</head>
<script type="text/javascript">
		
history.pushState(null, null, location.href);
    window.onpopstate = function () {
        history.go(1);
};

</script>

<%
if(request.getAttribute("RESULT")!=null){

	if(request.getAttribute("RESULT").toString().equals("1")){
%>
	<script>
		alert("회원가입 성공");
	</script>
	
<% 	}else{ %>
	<script>
		alert("회원 가입에 실패하였습니다. 다시 시도해주세요");
		history.go(-1);
	</script>
<%
	}
} %>



<body class="bg-dark">

  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">Admin Login</div>
      <div class="card-body">
        <form action="./LoginCtrl.do" 
          name="myform" method="get" 
          id="myform" 
          onsubmit="return checkForm(this)">
          <div class="form-group">
            <div class="form-label-group">
              <input type="text" id="inputEmail" name="inputEmail" class="form-control" placeholder="ID" required="required" autofocus="autofocus">
              <label for="inputEmail">ID</label>
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <input type="password" id="inputPassword" name="inputPassword" class="form-control" placeholder="Password" required="required">
              <label for="inputPassword">Password</label>
            </div>
          </div>
          <button type="submit" class="btn btn-primary btn-block">Login</button>
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="./member/register.jsp">회원 가입</a>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

</body>

</html>
