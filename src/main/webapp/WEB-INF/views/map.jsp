<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>BTmap</title>
 <link rel="stylesheet" type="text/css" href="/css/styles.css">
 <link rel="stylesheet" type="text/css" href="/css/map.css">
<!-- jQuery 라이브러리 가져오기 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body class="d-flex">
<jsp:include page="header.jsp" />
	<!--사이드바 -->
<div class="d-flex flex-column align-items-stretch flex-shrink-0 bg-white" style="width: 30%;">
    <a href="noteList" class="d-flex align-items-center flex-shrink-0 p-3 link-dark text-decoration-none border-bottom">
      <svg class="bi me-2" width="30" height="24"><use xlink:href="#bootstrap"></use></svg>
      <span class="fs-5 fw-semibold">
      	게시판 
     	</span>
    </a>
    <a href="listWrite" class="d-flex align-items-center flex-shrink-0 p-3 link-dark text-decoration-none border-bottom">
      <svg class="bi me-2" width="30" height="24"><use xlink:href="#bootstrap"></use></svg>
      <span class="fs-5 fw-semibold">
      	업데이트 
     	</span>
    </a>
    
  	<c:forEach items="${BTList}" var="BTList">
        <div class="list-group list-group-flush border-bottom scrollarea" style="margin-left: 50px;">
            <a href="#" class="list-group-item list-group-item-action py-3 lh-tight" aria-current="true"
               onclick="panTo(${BTList.latitude}, ${BTList.longitude})">
                <div class="d-flex w-100 align-items-center justify-content-between">
                    <img src="img/${BTList.spotid}.jpg" style="width: 150px; height: 120px">
                    <strong class="ms-1">${BTList.spotname}</strong> <br>
                    <small style="width: 150px">${BTList.description}</small>
                </div>
            </a>
        </div>
    </c:forEach>
  </div>
  
</body>
</html>
	<!--Kakao 지도 -->
<div id="map"></div>
<div id="clickLatlng" style="height: 50px; position: fixed; bottom: 0; right: 0;">
	<p id="result"></p>
</div>
	<!-- Kakao 지도 API 불러오기, services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4ae3fe3cdeddc83d82711fb0cddf0caa&libraries=services,clusterer,drawing"></script>
	<!-- Kakao 지도 자바스크립트 -->

<script type="text/javascript">
////////////////////////////지도 생성///////////////////////////////////
var mapContainer = document.getElementById('map'),
mapOption = {
    center: new kakao.maps.LatLng(35.15767875878566, 129.05913411487356),
    level: 7
};

var map = new kakao.maps.Map(mapContainer, mapOption);
////////////////////////////화면이동///////////////////////////////////
 function panTo(latitude, longitude) {
// 	console.log(latitude+", "+longitude)
      // 이동할 위도 경도 위치를 생성합니다
    var moveLatLon = new kakao.maps.LatLng(latitude, longitude);
	var markerPosition  = new kakao.maps.LatLng(latitude, longitude); 
	var marker = new kakao.maps.Marker({
	   position: markerPosition
	});
	marker.setMap(map);
	// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
	// marker.setMap(null);    
      // 지도 중심을 부드럽게 이동시킵니다
      // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
    map.panTo(moveLatLon);
  }

////////////////////////////오버레이 된 바///////////////////////////////////
// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new kakao.maps.MapTypeControl();

// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPLEFT);

// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
///////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////
// 지도를 클릭한 위치에 표출할 마커입니다
var marker = new kakao.maps.Marker({ 
    // 지도 중심좌표에 마커를 생성합니다 
    position: map.getCenter() 
}); 
// 지도에 마커를 표시합니다
marker.setMap(map);

// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
    // 클릭한 위도, 경도 정보를 가져옵니다 
    var latlng = mouseEvent.latLng; 
    
    // 마커 위치를 클릭한 위치로 옮깁니다
    marker.setPosition(latlng);
    
    var message = '클릭한 위치의 위도는 ' + latlng.getLat() + ' 이고, ';
    message += '경도는 ' + latlng.getLng() + ' 입니다';
    
    var resultDiv = document.getElementById('clickLatlng'); 
    resultDiv.innerHTML = message;
    
});
</script>










