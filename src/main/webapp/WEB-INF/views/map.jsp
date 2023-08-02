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
<body class=" d-flex flex-column min-vh-100 mx-5">
<jsp:include page="header.jsp" />
	<!--사이드바 -->
<div class="d-flex flex-column align-items-stretch flex-shrink-0 bg-white" style="width: 30%;">
    <div>
	  	<c:forEach items="${BTList}" var="BTList">
	        <div class="list-group list-group-flush border-bottom scrollarea" style="margin-left: 50px;">
	            <a href="#" class="list-group-item list-group-item-action py-3 lh-tight" aria-current="true"
	               onclick="panTo('${BTList.spotname}', ${BTList.latitude}, ${BTList.longitude}, '${BTList.imgName}'); return false;">
	               <div class="container text-center">
					  <div class="row">
					    <div class="col mb-3">
		                    <strong class="ms-1">${BTList.spotname}</strong>
					    </div>
					  </div>
					  <div class="row">
					    <div class="col-md-auto">
	                   	 <img src="img/list/${BTList.imgName}" style="width: 150px; height: 120px">
					    </div>
					    <div class="col-7">
	                   	 <small style="width: 150px">${BTList.description}</small>
					    </div>
					  </div>
					</div>
	            </a>
	        </div>
	    </c:forEach>
    </div>
  </div>
  
	<!--Kakao 지도 -->
<div id="map"></div>
<div id="clickLatlng" style="height: 50px; position: fixed; top: 0; left: 0;">
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
    center: new kakao.maps.LatLng(35.13620824142927, 129.11692092842443),
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
        	spotname: '${BTList.spotname}', 
            latitude: ${BTList.latitude}, 
            longitude: ${BTList.longitude},
            imgName: '${BTList.imgName}',
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
    var iwContent = '<div style="padding:5px; text-align: center; width:150px;"><img src="img/list/'+place.imgName+'" style="width: 100%; height: 70% "><br>' + place.spotname + '</div>';
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
 function panTo(spotname, latitude, longitude, imgName) {
      // 이동할 위도 경도 위치를 생성합니다
    var moveLatLon = new kakao.maps.LatLng(latitude, longitude);
    
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
// 지도에 클릭 이벤트를 등록합니다
// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
    
    // 클릭한 위도, 경도 정보를 가져옵니다 
    var latlng = mouseEvent.latLng; 
    
    // 마커 위치를 클릭한 위치로 옮깁니다
    marker.setPosition(latlng);
    
    var message = '클릭한 위치의 위도 ' + latlng.getLat() + ', ';
    message += '경도 ' + latlng.getLng() + ', ';
    
    var resultDiv = document.getElementById('clickLatlng'); 
    resultDiv.innerHTML = message;
    
});
</script>



    










