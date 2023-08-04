<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BTmap</title>
<link rel="stylesheet" type="text/css" href="/css/styles.css">
<link rel="stylesheet" type="text/css" href="/css/signin.css">
</head>
<body class="text-center">
    
	<main class="form-signin">
	    <h1 class="h3 mb-3 fw-normal">관리자 로그인</h1>
	
	  <form action="adminLoginOk" method="post" class="needs-validation" id="adminLogin">
	    <div class="form-floating">
	      <input type="text" class="form-control" id="floatingInput" name="username" placeholder="ID" required="required">
	      <label for="floatingInput">ID</label>
	    </div>
	    <div class="form-floating">
	      <input type="password" class="form-control" id="floatingPassword" name="password" placeholder="Password" required="required">
	      <label for="floatingPassword">Password</label>
	    </div>
	
	    <button class="w-100 btn btn-lg btn-primary" type="button" onclick="adminLogin()">로그인</button>
<!-- 	    <button class="w-100 btn btn-lg btn-primary" type="button" onclick="">회원가입</button> -->
	  </form>
	</main>
</body>
</html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
    function adminLogin() {
        var formData = new FormData(document.getElementById('adminLogin'));
        $.ajax({
            url: 'adminLoginOk',
            type: 'POST',
            processData: false,
            contentType: false,
            data: formData,
            success: function (data) {
            	console.log(data);
                if (data==400) {
                  	alert('아이디가 없습니다.')
                  	window.location.href = '/adminLogin'; 
            	console.log(formData.get("password"));
            	console.log(data);
            	
                } else if (data===formData.get("password")) {
                      	alert('환영합니다')
                        window.location.href = '/BTmap?admin=' + formData.get("username");
                } else {
                    alert('비번이 안맞음');
              	window.location.href = '/adminLogin'; 
                }
            },
            error: function () {
                alert('서버와의 통신에 실패했습니다.');
            }
        });
    }
    
</script>