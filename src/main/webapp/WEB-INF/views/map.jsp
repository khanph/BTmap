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
<body>
<jsp:include page="header.jsp" />
	<!--사이드바 -->
<div class="d-flex flex-column align-items-stretch flex-shrink-0 bg-white" style="width: 30%;">
    <a href="BTmap" class="d-flex align-items-center flex-shrink-0 p-3 link-dark text-decoration-none border-bottom">
      <svg class="bi me-2" width="30" height="24"><use xlink:href="#bootstrap"></use></svg>
       <span class="fs-4"> BusanTourMap</span>
    </a>
    <a href="listWrite" class="d-flex align-items-center flex-shrink-0 p-3 link-dark text-decoration-none border-bottom">
      <svg class="bi me-2" width="30" height="24"><use xlink:href="#bootstrap"></use></svg>
      <span class="fs-5 fw-semibold">
      	업데이트 
     	</span>
    </a>
    <div>
	  	<c:forEach items="${BTList}" var="BTList">
	        <div class="list-group list-group-flush border-bottom scrollarea" style="margin-left: 50px;">
	            <a href="#" class="list-group-item list-group-item-action py-3 lh-tight" aria-current="true"
	               onclick="panTo(${BTList.latitude}, ${BTList.longitude}, '${BTList.spotname}')">
	                <div class="d-flex w-100 align-items-center justify-content-between">
	                    <img src="img/list/${BTList.spotid}.jpg" style="width: 150px; height: 120px">
	                    <strong class="ms-1">${BTList.spotname}</strong> <br>
	                    <small style="width: 150px">${BTList.description}</small>
	                </div>
	            </a>
	        </div>
	    </c:forEach>
    </div>
  </div>
  
	<!--Kakao 지도 -->
<div id="map"></div>
<div id="clickLatlng" style="height: 50px; position: fixed; bottom: 0; right: 0;">
	<p id="result"></p>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
	<!-- Kakao 지도 API 불러오기, services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4ae3fe3cdeddc83d82711fb0cddf0caa&libraries=services,clusterer,drawing"></script>
	<!-- Kakao 지도 자바스크립트 -->

<script type="text/javascript">
////////////////////////////지도 생성///////////////////////////////////
var mapContainer = document.getElementById('map'),
mapOption = {
    center: new kakao.maps.LatLng(35.15767875878566, 129.05913411487356),
    level: 8
};
	
var map = new kakao.maps.Map(mapContainer, mapOption);
var marker = new kakao.maps.Marker({ 
    // 지도 중심좌표에 마커를 생성합니다 
    position: map.getCenter() 
}); 
// 지도에 마커를 표시합니다
marker.setMap(map);
// 장소 목록을 담을 배열
var placeList = [];

// 장소 정보를 가진 배열
var places = [
    <c:forEach items="${BTList}" var="BTList" varStatus="loop">
        { 
        	spotid: ${BTList.spotid}, 
            latitude: ${BTList.latitude}, 
            longitude: ${BTList.longitude},
            spotname: '${BTList.spotname}',
        }<c:if test="${!loop.last}">,</c:if>
    </c:forEach>
];

// 모든 장소 정보를 마커로 표시
places.forEach(function(place) {
    var moveLatLon = new kakao.maps.LatLng(place.latitude, place.longitude);
    var marker = new kakao.maps.Marker({
        position: moveLatLon,
        map: map
    });
    var iwContent = '<div style="padding:5px; text-align: center; width:150px;"><img src="img/list/'+place.spotid+'.jpg" style="width: 100%; height: 70% "><br>' + place.spotname + '</div>';
    var iwPosition = moveLatLon;
    var infowindow = new kakao.maps.InfoWindow({
        position: iwPosition,
        content: iwContent
    });

    // 마커 위에 인포윈도우를 표시합니다
    infowindow.open(map, marker);

    // 마커와 정보를 배열에 추가
    placeList.push({ marker: marker, infowindow: infowindow });
});



////////////////////////////화면이동///////////////////////////////////
 function panTo(latitude, longitude, spotname) {
// 	console.log(latitude+", "+longitude)
      // 이동할 위도 경도 위치를 생성합니다
    var moveLatLon = new kakao.maps.LatLng(latitude, longitude);
	var markerPosition  = new kakao.maps.LatLng(latitude, longitude); 
	marker = new kakao.maps.Marker({
	   position: markerPosition
	});
	 // 기존 마커가 존재하면 지우고 새로운 마커 생성
    if (marker) {
	// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
        marker.setMap(null);
    }
    // 새로운 마커 생성
    marker = new kakao.maps.Marker({
        position: moveLatLon,
        map: map
    });
	var iwContent = '<div style="padding:5px;">'+spotname+'</div>', 
					// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
    				iwPosition = new kakao.maps.LatLng(latitude, longitude); //인포윈도우 표시 위치입니다
    				
    				// 인포윈도우를 생성합니다
    				var infowindow = new kakao.maps.InfoWindow({
    				    position : iwPosition, 
    				    content : iwContent 
    				});
    				  
    				// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
    				infowindow.open(map, marker); 
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


    
</script>










