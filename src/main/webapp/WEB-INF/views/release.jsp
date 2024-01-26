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
<input type="button" id="ss" value="등록">
		
	<!-- 지도 기본 위치 받아오는 키값 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0e53e51300b84c3acadbd93d20d9fea8"></script>
	<script>
	
	let Delivery_latitude; //위도
	let Delivery_longitude; //경도
	
	$(function(){
		
		
		navigator.geolocation.getCurrentPosition(function(position) { //gps 정보를 불러옴.
	    console.log(position)
	    
	      Delivery_latitude = position.coords.latitude; //위도
	      console.log(Delivery_latitude)//위도
	      
	      Delivery_longitude = position.coords.longitude; //경도 
	      console.log(Delivery_longitude) //경도 
	      
	      maqload()
		})
	});
		function maqload(){
		// 카카오 디벨로퍼스에서 발급받은 API 키
		var REST_API_KEY = "80f1edf0f84195c4ef77e3ea50b5c0c8";

		// 출발지 및 목적지 좌표
		var origin = ""+Delivery_longitude+"," +Delivery_latitude+",name=배달원";
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
		    	console.log(data.routes[0].sections[0].roads[0]);
		    	
		    	//초를 60분으로 나누고 소수점 올림하여 분으로 나타냄
		        $("#time").html(Math.floor(data.routes[0].sections[0].duration / 60) +"분"); 
		    	
		        const linePath = []; // linePath 배열 선언
		        
		        //data.routes[0].sections[0].roads 만큼 반복. = 1번 
		        //router.vertexes.forEach((vertex, index) vertex의 index만큼 반복하여 배열로 만들고 그값을 
		        //		
		        //		router에 초기화
		        data.routes[0].sections[0].roads.forEach (router => {router.vertexes.forEach((vertex, index) => {
		        
		        	if (index % 2 === 0) {
		            	linePath.push(new kakao.maps.LatLng(router.vertexes[index + 1], router.vertexes[index]));
		            }
		          });
		        });
		        console.log(linePath);
		        var polyline = new kakao.maps.Polyline({
		          path: linePath,
		          strokeWeight: 5,
		          strokeColor: '#000000',
		          strokeStyle: 'solid'
		        }); 
		        
		        //성공적으로 카카오 api에서 값을 가져오면
		        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			    center: new kakao.maps.LatLng(Delivery_latitude, Delivery_longitude), // 지도의 중심좌표(현재위치)
			    level: 7 // 지도의 확대 레벨
			    };
				// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				polyline.setMap(map); // 경로를 생성
				 
				var positions = [
				    {
				        title: '출발 : 변수제약', 
				        latlng: new kakao.maps.LatLng(35.5421094, 129.3382413) //출발지 고정
				    },
				    {
				        title: '도착 : 대한의원',
				        latlng: new kakao.maps.LatLng(35.490829, 129.4203784) // 목적지의 값은 받아서 변경.
				    },
				   {
				   	title: '배달원',
				   	latlng: new kakao.maps.LatLng(Delivery_latitude, Delivery_longitude) // 배달원의 현재위치  갱신하기. 
				   }
				];

				// 마커 이미지의 이미지 주소입니다
				var imageSrc = Array(); //이미지 넣을 칸을 배열로 생성
				imageSrc.push("../../resources/image/vv.png");// 출발위치 이미지
				imageSrc.push("../../resources/image/hosp.png");// 도착위치 이미지 
				imageSrc.push("../../resources/image/car_icon.png");// 현재위치 이미지
				   
				for (var i = 0; i < positions.length; i ++) { // positions.의 길이만큼 반복
				    
				    // 마커 이미지의 이미지 크기 입니다
				    var imageSize = new kakao.maps.Size(50, 50); // 이미지 사이즈
				    
				    // 마커 이미지를 생성합니다    
				    var markerImage = new kakao.maps.MarkerImage(imageSrc[i], imageSize);  // 이미지를 생성하기위해
				    																	   // 반복문 안에서 imageSrc[i], imageSize 값을 더해 생성
				    
				    // 마커를 생성합니다
				    var marker = new kakao.maps.Marker({
				        map: map, // 마커를 표시할 지도
				        position: positions[i].latlng, // 마커를 표시할 위치
				        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				        image : markerImage // 마커 이미지 
				    });
				}
		    },
		    error: function (error) {
		        // 에러 처리 로직
		        console.error("Error:", error);
		    }
		});
	};
		</script>
</body>
</html>

