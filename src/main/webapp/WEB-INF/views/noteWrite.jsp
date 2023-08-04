<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>BTmap</title>
</head>
<body><jsp:include page="header.jsp" />

	<div class="d-flex justify-content-center my-3">
		<form action="noteWrite_ok" method="post" enctype="multipart/form-data" class="needs-validation" id="uploadForm">
          <div class="row g-3 ms-5 ps-5" style="width: 60%">
          
            <div class="col-sm-6">
              <label for="firstName" class="form-label">아이디</label>
              <input type="text" class="form-control" name="name" placeholder="아이디를 입력해주세요" required="required">
              <label for="firstName" class="form-label">비밀번호</label>
              <input type="password" class="form-control" name="pass" placeholder="비밀번호를 입력해주세요" required="required">
            </div>
            
            <div class="col-8">
              <label for="address" class="form-label">제목</label>
              <input type="text" class="form-control" name="title" placeholder="제목를 입력해주세요" required="required">
            </div>
            
            <div class="col-8">
              <label for="address" class="form-label">내용</label> <br>
              <textarea name="content" class="form-control" rows="10" placeholder="내용을 입력해주세요" required="required"></textarea>
            </div>
            
            <div class="col-sm-6">
              <label for="firstName" class="form-label">image</label>
              <input type="file" class="form-control" name="file" >
            </div>
             
	        <hr class="my-3">
	        <div class="d-flex justify-content-evenly">
		        <button class="btn btn-dark" type="button" onclick="uploadData()">작성완료</button>
		        <button class=" btn btn-dark" type="button" onclick="location='noteList'">작성취소</button>
	        </div>
          </div>
        </form>
      </div>
   
		      
<jsp:include page="footer.jsp" />

</body>
</html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
    function uploadData() {
        var formData = new FormData(document.getElementById('uploadForm'));
        $.ajax({
            url: 'noteWrite_ok',
            type: 'POST',
            processData: false,
            contentType: false,
            data: formData,
            success: function (data) {
            	console.log(data);
                if (data) {
                  	alert('글쓰기 성공')
                  	window.location.href = '/noteList'; 
                } else {
                    alert('실패');
                }
            },
            error: function () {
                alert('서버와의 통신에 실패했습니다.');
            }
        });
    }
</script>











