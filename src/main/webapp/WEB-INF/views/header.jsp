<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>BTmap</title>
<link rel="stylesheet" type="text/css" href="/css/styles.css">
</head>
<body>
    <div class="container p-0">
    <header class="d-flex justify-content-between py-4">
     	<ul class="nav nav-pills">
     		<li class="nav-item">
     			<a href="BTmap" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
			      <svg class="bi me-2" width="40" height="32"><use xlink:href="#bootstrap"></use></svg>
			      <span class="fs-2"> BusanTourMap</span>
			    </a>
     		 </li>
     	</ul>
	    <ul class="nav nav-pills mt-2">
	      <li class="nav-item"><a href="BTmap" class="nav-link">지도보기</a></li>
	      <li class="nav-item"><a href="noteList" class="nav-link">게시판</a></li>
	      <li class="nav-item"><a href="adminLogin" class="nav-link">관리자페이지</a></li>
	      <c:choose>
			<c:when test="${admin ne null }">
				<li class="nav-item">
					<a href="listWrite" class="nav-link">업데이트</a>
				</li>
				<li>
					<p href="#" class="nav-link dark">${admin}님</p>
				</li>					 
				<li>
					<a href="#" class="nav-link dark" onclick="logout()">로그아웃</a>
				</li>					 
			</c:when>
		</c:choose>
	    </ul>
    </header>
    	
  </div>
  <hr>
</body>
</html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
//로그아웃 처리
function logout() {
  $.ajax({
    url: 'logout', // 로그아웃을 처리하는 서버의 URL
    type: 'POST', // 로그아웃 요청은 POST 방식으로 보냄
    success: function (data) {
      // 로그아웃 성공 시 로그인 페이지 등으로 리다이렉트
      alert('로그아웃되었습니다.')
      window.location.href = 'BTmap';
    },
    error: function () {
      alert('로그아웃에 실패했습니다.');
    }
  });
}
</script>
