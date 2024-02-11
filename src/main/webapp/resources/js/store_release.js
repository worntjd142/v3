/*//배달원의 목적지와의 경로 및 도착시간 
function del(x,y,name){
	
			//윈도우 팝업
		   let url = "release?x=" + x +"&y="+ y +"&name=" + name +"";

		   let option = 'width=500, height=500, left=1000, scrollbars=no, resizeable=no, menubar=no, ';

		   window.open(url, name, option);

}
*/

// 프린트
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
	
//발행 함수
function issuance(ono){
	
	alert(ono);
	
	$.ajax({
		type : "GET", // method 타입 get
		url : "issuance", // url value
		data : {'ono':ono}, //  jsno 타입의 onos를 컨트롤러로 값을 전달
		dataType: 'json',
		async : false,
		success : function(data) {
			
			 // 수주서 팝업창
			url ="sujuletter1?ono="+data.ono+"";
			option = "width= 400px, height=400px "
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
			option = "width= 400px, height=400px "
			name ="수주서"
			window.open(url, option , name)
			
		}
			
	})
	
	
	
}



