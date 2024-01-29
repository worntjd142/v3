//$(function(){
//	
//	
//	let ss= {"query":'울산광역시 남구 돋질로 277'}
//		
//		// 카카오 디벨로퍼스에서 발급받은 API 키
//		var REST_API_KEY = "80f1edf0f84195c4ef77e3ea50b5c0c8";
//
//		// 출발지 및 목적지 좌표
//		var destination ="129.3123047, 35.5071869,name=대한의원"; // 목적지 위치 
//		// Ajax 요청
//		$.ajax({
//		    type: "GET", // method 방식
//		    url: "https://dapi.kakao.com/v2/local/search/address", // 카카오 api url 주소
//		    data: ss,
//		    headers: {
//		        "Authorization": "KakaoAK " + REST_API_KEY, // 보안 토큰
//		        "content-type": "application/json"
//		    },
//		    success: function (data) {
//		    	console.log(data.documents[0].x);
//		    	console.log(data.documents[0].y);
//		    }
//	
//	
//	
//		})
//		    	
//		    	
//		    	
//		    	
//})