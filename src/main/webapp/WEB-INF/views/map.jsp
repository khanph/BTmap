<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>BTmap</title>
 <link rel="stylesheet" type="text/css" href="/css/styles.css">
 <link rel="stylesheet" type="text/css" href="/css/map.css">
</head>

<body class="d-flex">

<div id="map" style="width: 60%;"></div>
<div id="clickLatlng"></div>
	<!-- Kakao 지도 API 불러오기, services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4ae3fe3cdeddc83d82711fb0cddf0caa&libraries=services,clusterer,drawing"></script>
	<!-- Kakao 지도 자바스크립트 -->
<script src="js/map.js"></script>
	<!-- 오른쪽 사이드바 -->
<div class="d-flex flex-column align-items-stretch flex-shrink-0 bg-white" style="width: 30%;">
    <a href="/" class="d-flex align-items-center flex-shrink-0 p-3 link-dark text-decoration-none border-bottom">
      <svg class="bi me-2" width="30" height="24"><use xlink:href="#bootstrap"></use></svg>
      <span class="fs-5 fw-semibold">BTList</span>
    </a>
    
	<c:forEach items="${BTList}" var="BTList" varStatus="status">
    <div class="list-group list-group-flush border-bottom scrollarea">
      <a href="#" class="list-group-item list-group-item-action py-3 lh-tight" aria-current="true">
<!--         <div class="d-flex w-100 align-items-center justify-content-between"> -->
        <div class="d-flex w-100 align-items-center justify-content-between">
          <strong class="mb-1">${BTList.spotname}
		         <img src="img/${BTList.spotid}.jpg" style="width: 100%; height: 100%">
          </strong>
          <small>${BTList.description} </small>
        </div>
      </a>
    </div>
  	</c:forEach>
  </div>
</body>
</html>