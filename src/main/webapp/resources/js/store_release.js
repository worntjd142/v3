//발행 함수
function issuance(ono){
	
	$.ajax({
		type : "GET", // method 타입 get
		url : "issuance", // url value
		data : {'ono':ono}, //  jsno 타입의 onos를 컨트롤러로 값을 전달
		dataType: 'json',
		async : false,
		success : function(data) {
			
			 // 수주서 팝업창
			url ="sujuletter1?ono="+data.ono+"";
			option = "width= 400px, height=200px "
			name ="수주서"
			window.open(url, option , name)
			
		}
			
	})
	
}

function delivery(ono){
	let result = "";
	const characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
		const charactersLength = characters.length;
		for (let i = 0; i < 12; i++){
			result += characters.charAt(Math.floor(Math.random() * charactersLength));
			}
		
	$.ajax({
	type : "GET", // method 타입 get
		url : "shipment_insert", // url value
		data : {'ono':ono,'result':result},
		dataType: 'json',
		async : false,
		success : function(data) {
			console.log(data);
			 // 수주서 팝업창
			url ="Shipment?ono="+ono+"";
			option = "width= 100px, height=100px "
			name ="수주서"
			window.open(url, option , name)
			
		}
			
	})
	
	
	
}


//배달원의 목적지와의 경로 및 도착시간 
function del(x,y,name){
	
	console.log(x,y,name)
	 let Delivery_latitude;// 위도 
	 let Delivery_longitude; // 경도
		 navigator.geolocation.getCurrentPosition(function(w) { //내 위치정보를 불러옴.
	    
	     Delivery_latitude = w.coords.latitude; //위도
	      console.log(Delivery_latitude);
	      
	     Delivery_longitude = w.coords.longitude; //경도 
	      console.log(Delivery_longitude);
	      
	      d_man(Delivery_latitude,Delivery_longitude,x,y,name)
		})
}
		function d_man(Delivery_latitude, Delivery_longitude,x,y,name){
		
		// 카카오 디벨로퍼스에서 발급받은 API 키
		var REST_API_KEY = "80f1edf0f84195c4ef77e3ea50b5c0c8";
		// 출발지 및 목적지 좌표
		var origin = ""+Delivery_longitude+"," +Delivery_latitude+",name=배달원";
		console.log(origin)
		var destination =""+ y +"," + x +",name="+name+""; // 목적지 위치 
		console.log(destination)
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
			    center: new kakao.maps.LatLng(Delivery_latitude, Delivery_longitude), // 지도의 중심좌표(배달원 위치)
			    level: 7 // 지도의 확대 레벨
			    };
				// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				polyline.setMap(map); // 경로를 생성
				var positions = [
				    {
				        title: '변수제약', 
				        latlng: new kakao.maps.LatLng(35.5421094, 129.3382413) //출발지 고정
				    },
				    {
				        title: "도착 : "+name+"",
				        latlng: new kakao.maps.LatLng(x, y) // 목적지의 값은 받아서 변경.
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


}




/*// 프린트
	//프린트 함수 선언
	function prints(){
		// 함수 호출 될 경우 프린트 객체 실행하게 되면  1. window.onbeforeprint = beforePrint;를 실행
		window.print();
	}
	
	function beforePrint() { // 2.  프린트 화면에서 필요없는 버튼들을 삭제
		$("#prtin_after").css("display", "none");
		$("#print_page").css("display", "block");
	}
	
	function afterPrint() { //3.window.onafterprint = afterPrint; 언급으로 실행 
		//프린트 취소 or 출력 누른 이후 페이지 새로고침
		location.reload()
	}
 
	window.onbeforeprint = beforePrint;  //프린트 하기 전 실행 객체
	window.onafterprint = afterPrint; // 프린트 후 실행 객체
*/