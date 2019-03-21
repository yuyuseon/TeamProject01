<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<style> 
       .form-group:nth-child(1) label{display: block;} 
       .form-group:nth-child(1) input{float: left; width: 30%; margin-right: 3%;} 
       .form-group:nth-child(1) select{width: 24%; height: 34px; border-radius:4px;} 
       
       .form-group:nth-child(4) label{display: block;} 
       .form-group:nth-child(4) input{float: left; width: 30%; margin-right: 3%;} 
       .form-group:nth-child(4) select{width: 24%; height: 34px; border-radius:4px;}
       
</style>
<script>
   function domain1(){ 
	   var sel = document.getElementById('sel'); 
	    var domain=document.getElementById('domain'); 
	    if(sel.value==''){//직접 입력 선택 
	    domain.readOnly=false; 
	    domain.value=''; 
	    domain.focus(); 
	    }else{ 
	   domain.value = sel.value; 
	    domain.readOnly=true;//수정 불가 
	    } 
	}
    
	//폼값 체크
	function checkForm(f){ 

		var email= f.email; //아이디
		var pass1= f.pass1; //비밀번호
		var pass2= f.pass2; //비밀번호 확인
		var domain= f.domain; //이메일 도메인
		var phoneNum1= f.phoneNum1; //휴대전화번호
		var phoneNum2= f.phoneNum2; //휴대전화번호
		var phoneNum3= f.phoneNum3; //휴대전화번호
		var name= f.name; //이름
		
		if(email.value == ''){ 
			alert('이메일을 입력하세요'); 
			email.focus(); 
			return false; 
		}
		else if(domain.value == ''){ 
			alert('도메인을 입력하세요'); 
			domain.focus(); 
			return false; 
		}
		else if(pass1 == ''){ 
			alert('비밀번호를 입력하세요'); 
			pass1.focus(); 
			return false; 
		} 
		else if(pass2 == ''){ 
			alert('비밀번호 확인란을 입력하세요'); 
			pass2.focus(); 
			return false; 
		}
		else if(pass1.value.length>20 || pass1.value.length<6){ 
			alert('비밀번호는 6~20자로 입력해주세요.'); 
			pass1.focus(); 
			return false; 
		}
		//패스워드 일치 확인
	 	else if(pass1.value != pass2.value){
			alert('입력한 패스워드가 일치하지 않습니다.');
			pass1.value ="";
			pass2.value ="";
			pass1.focus();
			return false;
		}
	 	else if(name.value == '' ){ 
			alert('이름 입력하세요'); 
			name.focus(); 
			return false;  
		}
		else if(phoneNum1.value == '' && phoneNum2.value == '' && phoneNum3.value == '' ){ 
			alert('휴대폰 번호를 입력하세요'); 
			phoneNum2.value ='';
			phoneNum3.value ='';
			phoneNum1.focus(); 
			return false; 
		} 
		else if(phoneNum1.value.length!=3){ 
			alert('정상적인 번호를 입력해주세요'); 
			phoneNum1.focus(); 
			return false; 
		} 
		else if(phoneNum2.value.length!=4){ 
			alert('정상적인 번호를 입력해주세요'); 
			phoneNum2.focus(); 
			return false; 
		}
		else if(phoneNum3.value.length!=4){ 
			alert('정상적인 번호를 입력해주세요'); 
			phoneNum3.focus(); 
			return false; 
		}
		else if(!Number(phoneNum1.value)){ 
			alert('전화번호는 숫자를 입력해야합니다'); 
			phoneNum1.focus(); 
			return false; 
		} 
		else if(!Number(phoneNum2.value)){ 
			alert('전화번호는 숫자를 입력해야합니다'); 
			phoneNum2.focus(); 
			return false; 
		} 
		else if(!Number(phoneNum3.value)){ 
			alert('전화번호는 숫자를 입력해야합니다'); 
			phoneNum3.focus(); 
			return false; 
		} 
		
		
		
		
	} 
	
</script>

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Admin - 회원가입</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">

</head>

<body class="bg-dark">

  <div class="container">
    <div class="card card-register mx-auto mt-5">
      <div class="card-header">회원가입</div>
      <div class="card-body">
        <form action="./RegisterCtrl.do" 
          name="myform" method="get" 
          id="myform" 
          onsubmit="return checkForm(this)">
          <div class="form-group">
          	<div class="form-group"> 
                <label for="email">이메일(ID)</label> 
                <input type="text" class="form-control" name="email" id="email" autofocus="autofocus">@ &nbsp;
                <input type="text" class="form-control" name="domain" id="domain"> 
                <select name="sel" id="sel" onchange="domain1()" > 
                    <option value="">직접입력</option> 
                    <option value="naver.com">naver.com</option> 
                    <option value="daum.net">daum.net</option> 
                    <option value="nate.com">nate.com</option> 
                    <option value="gmail.com">gmail.com</option> 
                </select> 
            </div>
          </div>
          <div class="form-group">
            <label>비밀번호(PW)</label>
            <div class="form-row">
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="password" id="pass1" name="pass1" class="form-control">
                  <label for="Password">비밀번호 확인</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-label-group">
                  <input type="password" id="pass2" name="pass2" class="form-control">
                  <label for="confirmPassword">비밀번호 확인</label>
                </div>
              </div>
            </div>
          </div>
          <div class="form-group">
            <label>이름</label>
            <div class="form-row">
              <div class="col-md-6">
                
                <div class="form-label-group">
                  <input type="text" id="name" name="name" class="form-control">
                  <label for="firstName">이름</label>
                </div>
              </div>
             
            </div>
          </div>
          <div class="form-group" style="padding-bottom: 10px;">
            <div class="form-group"> 
               <label>전화번호</label>
               <input type="text" class="form-control" name="phoneNum1" id="phoneNum1">
               <input type="text" class="form-control" name="phoneNum2" id="phoneNum2">
               <input type="text" class="form-control" name="phoneNum3" id="phoneNum3">
               <br />
             </div> 
          </div>
          
          <button type="submit" class="btn btn-primary btn-block">회원 가입</button>
        </form>
        <div class="text-center">
          <a class="d-block small mt-3" href="login.html">Login Page</a>
          <a class="d-block small" href="forgot-password.html">Forgot Password?</a>
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
