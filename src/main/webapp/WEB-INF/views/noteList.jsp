<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>BTmap</title>
<link rel="stylesheet" type="text/css" href="/css/styles.css">
</head>
<body class=" d-flex flex-column min-vh-100">
<jsp:include page="header.jsp" />

	<div class="card" style=" margin-left: 30%; margin-right: 30%; margin-top: 5%">
	    <div class="card-header d-flex justify-content-between">우리들의 스토리
	     	<button class=" btn btn-dark" type="button" onclick="location='noteWrite'">스토리작성하러가기</button>
     	</div>
	    <div class="card-body p-0 d-flex justify-content-center mb-5" style="width: 100%">
	        <!-- Billing history table-->
            <table class="table m-0">
                <thead>
                    <tr>
                        <th class="border-gray-200" scope="col">#</th>
                        <th class="border-gray-200" scope="col">이름</th>
                        <th class="border-gray-200" scope="col">제목</th>
                        <th class="border-gray-200" scope="col">생성시간</th>
                    </tr>
                </thead>
                <tbody style="text-align:center;">
                    <c:forEach items="${list}" var="list" varStatus="status">
						<tr>
							<td>${list.noteno}</td>
							<td>${list.name}</td>
							<td>${list.title}</td>
							<td>${list.notetime}</td>
						</tr>
						<td colspan="4" style="text-align: left; border-bottom: 1px dotted;">
							<img alt="" src="img/note/${list.imgName}" style="height: 120px; width: 150px;">
							${list.content}
						</td>
					</c:forEach>
                </tbody>
            </table>
	    </div>
	</div>

		<!-- 페이징 -->
		<form method="get" action="#" id="actionForm">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		</form>
		
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
<jsp:include page="footer.jsp" />
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
















