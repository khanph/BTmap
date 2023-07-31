<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>BTmap</title>
<script type="text/javascript">

// 아이디 중복검사
// function idCheck(){
// 	if(myform.id.value == ""){
// 		alert('중복된 아이디입니다.');
// 	}
// 	else{
// 		alert('사용 가능한 아이디입니다.');
// 	}
// } 
	
</script>
</head>
<body class="mx-5"><jsp:include page="header.jsp" />

	<div class="d-flex justify-content-center ">
		<form action="noteWrite_ok" method="post" name="frm" enctype="multipart/form-data" class="needs-validation">
          <div class="row g-3 ms-5 ps-5" style="width: 60%">
          
            <div class="col-sm-6">
              <label for="firstName" class="form-label">아이디</label>
              <input type="text" class="form-control" name="name" placeholder="아이디를 입력해주세요" required="">
              <label for="firstName" class="form-label">비밀번호</label>
              <input type="password" class="form-control" name="pass" placeholder="비밀번호를 입력해주세요" required="">
            </div>
            
            <div class="col-8">
              <label for="address" class="form-label">제목</label>
              <input type="text" class="form-control" name="title" placeholder="제목를 입력해주세요" required="">
            </div>
            
            <div class="col-8">
              <label for="address" class="form-label">내용</label> <br>
              <textarea name="content" class="form-control" rows="10" placeholder="내용을 입력해주세요"></textarea>
            </div>
            
            <div class="col-sm-6">
              <label for="firstName" class="form-label">image</label>
              <input type="file" class="form-control" name="noteFile" >
            </div>
            
	        <hr class="my-3">
	        <div class="d-flex justify-content-evenly">
		        <button class=" btn btn-dark" type="submit">작성완료</button>
		        <button class=" btn btn-dark" type="button" onclick="location='BTmap'">작성취소</button>
	        </div>
	          
          </div>
        </form>
      </div>
      
<jsp:include page="footer.jsp" />
</body>
</html>
















