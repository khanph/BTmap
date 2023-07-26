<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BTmap</title>
<link rel="stylesheet" type="text/css" href="/css/styles.css">
</head>
<body>
	<main class="flex-shrink-0">

		<!-- header-->
		<nav class="navbar navbar-expand-lg navbar-light bg-warning py-3">
			<div class="container px-10">
				<a class="navbar-brand" href="../shop/list">
					<span class="fw-bolder text-primary"> 
						<img src="../resources/img/shallweshare.png" alt="Bootstrap" width="250" height="50">
					</span>
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav ms-0 ml-0 mb-lg-0 Large  fw-bolder">
						<li class="nav-item"><a class="nav-link " href="../mypage/">마이페이지</a></li>
						<c:if test="${sessionScope.u_role = 'ADMIN' }">
							<li class="nav-item"><a class="nav-link"
								href="../admin/main">관리자페이지</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</nav>
	</main>
</body>
</html>