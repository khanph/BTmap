<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>BTmap</title>
</head>
<body><jsp:include page="header.jsp" />

	<div class="d-flex justify-content-center my-3">
		<form action="listWrite_ok" method="post" enctype="multipart/form-data" class="needs-validation" id="uploadForm">
          <div class="row g-3 ms-5 ps-5" style="width: 60%">
          
            <div class="col-sm-6">
              <label for="firstName" class="form-label">관광지명</label>
              <input type="text" class="form-control" name="spotname" placeholder="관광지명을 넣으세요" required="required">
            </div>

            <div class="col-8">
              <label for="address" class="form-label">주소</label>
              <input type="text" class="form-control" name="address" placeholder="주소를 입력해주세요" required="required">
            </div>
            
            <div class="col-sm-6">
              <label for="firstName" class="form-label">위도</label>
              <input type="text" class="form-control" name="latitude" placeholder="위도를 입력해주세요" required="required">
              <label for="firstName" class="form-label">경도</label>
              <input type="text" class="form-control" name="longitude" placeholder="경도를 입력해주세요" required="required">
            </div>
            
            <div class="col-8">
              <label for="address" class="form-label">관광지정보</label> <br>
              <textarea name="description" class="form-control" rows="10" placeholder="정보를 입력해주세요"></textarea>
            </div>
            
             <div class="col-sm-6">
              <label for="firstName" class="form-label">image</label>
              <input type="file" class="form-control" name="file" required="required">
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
    function uploadData() {
        var formData = new FormData(document.getElementById('uploadForm'));
        $.ajax({
            url: 'listWrite_ok',
            type: 'POST',
            processData: false,
            contentType: false,
            data: formData,
            success: function (data) {
            	console.log(data);
                if (data) {
                  	alert('글쓰기 성공')
                  	window.location.href = 'redirect:/noteList'; 
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















