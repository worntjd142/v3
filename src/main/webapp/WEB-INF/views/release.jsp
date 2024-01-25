<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>출고 내역</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.js"></script>
<link rel = "stylesheet" href = "resources/css/release.css">
<script src="../resources/js/release.js"></script>
</head>
<body>
<div id="map" style="width:400px;height:350px;"></div>
<div>예상소요시간:<label id="time"></label></div>
<input type="button" onclick="rCenter()" value="확인">
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	<!-- 지도 기본 위치 받아오는 키값 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0e53e51300b84c3acadbd93d20d9fea8"></script>
	<script>
	$(function(){
	
})
	
	
	
	function rCenter(){
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(35.5421094, 129.3382413), // 지도의 중심좌표(그린컴퓨터아카데미) ... 변수제약
	        level: 4 // 지도의 확대 레벨
	    };
		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		var positions = [
		    {
		        title: '출발 : 변수제약', 
		        latlng: new kakao.maps.LatLng(35.5421094, 129.3382413)
		    },
		    {
		        title: '도착 : 대한의원',
		        latlng: new kakao.maps.LatLng(35.490829, 129.4203784)
		    }
		];

		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
		    
		for (var i = 0; i < positions.length; i ++) {
		    
		    // 마커 이미지의 이미지 크기 입니다
		    var imageSize = new kakao.maps.Size(24, 35); 
		    
		    // 마커 이미지를 생성합니다    
		    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		    
		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({
		        map: map, // 마커를 표시할 지도
		        position: positions[i].latlng, // 마커를 표시할 위치
		        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
		        image : markerImage // 마커 이미지 
		    });
		}
		
		
		
		
		// 카카오 디벨로퍼스에서 발급받은 API 키
		var REST_API_KEY = "80f1edf0f84195c4ef77e3ea50b5c0c8";

		// 출발지 및 목적지 좌표
		var origin = "129.3382413,35.5421094,name=변수제약";
		var destination ="129.3123047, 35.5071869,name=대한의원"; // 목적지 위치 

		// Ajax 요청
		$.ajax({
		    type: "GET", // method 방식
		    url: "https://apis-navi.kakaomobility.com/v1/directions", // 카카오 api url 주소
		    data: {
		        origin: origin,  //  출발지
		        destination: destination  //목적지
		    },
		    headers: {
		        "Authorization": "KakaoAK " + REST_API_KEY, // 보안 토큰
		        "Content-Type": "application/json" // 결과 값이 json
		    },
		    success: function (data) {
		        // API 응답을 처리하는 로직
		    	console.log(Math.floor(data.routes[0].sections[0].duration / 60) +"분");
		        $("#time").html(Math.floor(data.routes[0].sections[0].duration / 60) +"분");
		        const linePath = []; // linePath 배열 선언
		        data.routes[0].sections[0].roads.forEach(router => { // 성공하면 data.routes 배열 0번의 인덱스의 값을 가져와서 for문을 돌림
		          router.vertexes.forEach((vertex, index) => { 
		            if (index % 2 === 0) {
		              linePath.push(new kakao.maps.LatLng(router.vertexes[index + 1], router.vertexes[index]));
		            }
		          });
		        });
		        var polyline = new kakao.maps.Polyline({
		          path: linePath,
		          strokeWeight: 5,
		          strokeColor: '#000000',
		          strokeStyle: 'solid'
		        }); 
		        polyline.setMap(map); // 경로를 생성 
		    },
		    error: function (error) {
		        // 에러 처리 로직
		        console.error("Error:", error);
		    }
		});
		}
	var lat;
	var lon;
	var option = {
			enableHighAccuracy: true,
			timeout: 5000,
			maximumAge: 0
	};
	
	function success(position){
		console.log(position)
		
			lat = position.coords.latitude, //위도
			lon = position.coords.longitude; //경도
			
			
			var locPostion = new kakao.maps.LatLng(lat, lon)
	}		
	
		displayMarker(locPostion);
	if(navigator.geolocation){
	alert("위치정보 공유에 동의하십니까?")
	
	var na =navigator.geolocation.watchPostion(success, error, options);
	console.log(na);
	
	}
	
	var marker;
	var flag = false;
	function displayMarker(locPostion){
		console.log(1);
		if(flag){
			marker.setMap(null);
		}
		
		marker = new kakao.maps.Marker({
			position:locPostion
		});
		
		marker.setMap(map);
		flag=true;
		
		map. setCenter(locPostion);
	}
	
		</script>
</body>
</html>

