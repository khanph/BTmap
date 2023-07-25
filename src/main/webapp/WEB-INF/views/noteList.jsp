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
	<table border="1">
			<tr>
				<td>NO</td>
				<td>이름</td>
				<td>제목</td>
				<td>생성시간</td>
			</tr>
			
			<c:forEach items="${list}" var="list" varStatus="status">
				<tr>
					<td>${list.noteno}</td>
					<td>${list.name}</td>
					<td>${list.title}</td>
					<td>${list.notetime}</td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="4" align="center">
					<input type="button" value="글쓰기" onclick="location='noteWrite'">
				</td>
			</tr>
	</table>
	<!-- 페이징 -->
	<form method="get" action="#" id="actionForm">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
	</form>
	
	<div>
		<nav aria-label="Page navigation example">
			<ul
				class="pagination pagination-lg justify-content-center mt-5">
				<c:if test="${pageMaker.prev}">
					<li class="page-item"><a class="page-link"
						href="${pageMaker.startPage - 1}" aria-label="Previous"> <span
							aria-hidden="true">&laquo;</span>
					</a></li> 
					
				</c:if>
				<c:forEach var="num" begin="${pageMaker.startPage}"
					end="${pageMaker.endPage}">
					<li class="page-item " ${pageMaker.cri.pageNum == num }><a
						class="page-link" href="${num}"> ${num} </a></li>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<li class="page-item"><a class="page-link"
						href="${pageMaker.endPage + 1}" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
				</c:if>
			</ul>
		</nav>
	</div>

</body>
</html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	// 	페이지번호 처리
	var actionForm = $("#actionForm");
	$(".page-link").on("click", function(e) {
		e.preventDefault();
		// 		console.log("@# href==>"+$(this).attr("href"));
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
</script>
















