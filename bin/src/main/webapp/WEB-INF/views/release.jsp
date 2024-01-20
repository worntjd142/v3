<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출고 내역</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="../resources/js/release.js"></script>
</head>
<body>

<div>

<div>
<table border="1">
<tr>
<td colspan="2"> 출고기간 </td>
<td>납품처</td>
</tr>
<tr>
<td>2016-04-01</td>
<td>2016-04-05</td>
<td>
</td>
</tr>
</table>
</div>


<div>
<button>검색하기</button>
<button>모두표시</button>
<button>날짜정렬</button>
</div>

<table border="1">
<tr>
<td>출 고 날 짜</td>
<td>납 품 처</td>
<td>제 품 코 드 </td>
<td>품 명</td>
<td>운 송 자 현 위 치</td>
</tr>
<!-- 테이블 10개 생성 -->
<!-- varStatus를 이용하여 테이블 위치확인에 id값을 10개 생성하기. -->
<c:forEach begin="1" end="10" varStatus="location">
<tr>
<td></td>
<td></td>
<td></td>
<td></td>
<td id="location${location.index}">위 치 확 인</td>
</tr>
</c:forEach>
</table>

<button onclick="setCenter()">이동</button>
<button onclick="rCenter()">이전</button>


<div id="map" style="width:500px;height:400px;"></div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0e53e51300b84c3acadbd93d20d9fea8"></script>
		<script>
		// 이미지 변경 변수
		var icon = new kakao.maps.MarkerImage(
			    '../resources/image/main.png',
			    new kakao.maps.Size(31, 35),
			    {
			        offset: new kakao.maps.Point(16, 34),
			        alt: "마커 이미지 예제",
			        shape: "poly",
			        coords: "1,20,1,9,5,2,10,0,21,0,27,3,30,9,30,20,17,33,14,33"
			    }
			);
		
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(35.5421094, 129.3382413),
			level: 3
		};
		//지도 이동
		var map = new kakao.maps.Map(container, options);
		
		function setCenter() {            
		    // 이동할 위도 경도 위치를 생성합니다 
		    var moveLatLon = new kakao.maps.LatLng(33.452613, 126.570888);
		    // 지도 중심을 이동 시킵니다
		    map.panTo(moveLatLon)
		}
		//마커 생성
		var marker = new kakao.maps.Marker({ 
			image:icon, //이미지 변경
		    // 지도 중심좌표에 마커를 생성합니다 
		    position: map.getCenter() 
		    
		    
		}); 
		// 지도에 마커를 표시합니다
		marker.setMap(map);
		
		
		var polyline = new kakao.maps.Polyline({
		    map: map,
		    path: [
		        new kakao.maps.LatLng(35.5421094, 129.3382413),
		        new kakao.maps.LatLng(33.452739313807456, 126.5709308145358),
		        new kakao.maps.LatLng(33.45178067090639, 126.5726886938753) 
		    ],
		    strokeWeight: 2,
		    strokeColor: '#FF00FF',
		    strokeOpacity: 0.8,
		    strokeStyle: 'dashed'
		    
		    
		});
		polyline.setMap(map)
		
	</script>
</div>
</body>
</html>

