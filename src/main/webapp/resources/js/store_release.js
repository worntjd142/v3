/*//배달원의 목적지와의 경로 및 도착시간 
function del(x,y,name){
	
			//윈도우 팝업
		   let url = "release?x=" + x +"&y="+ y +"&name=" + name +"";

		   let option = 'width=500, height=500, left=1000, scrollbars=no, resizeable=no, menubar=no, ';

		   window.open(url, name, option);

}
*/

$(function(){

 calender = document.getElementById("balju_day");
	
	const nowDate = new Date();

	let currentYear = nowDate.getFullYear();
	let currentMonth = String((nowDate.getMonth()+1)).padStart(2,"0")
	let currentDate = String(nowDate.getDate()).padStart(2,"0")

	// 새로고침했을 때 오늘 날짜를 자동으로 세팅
	calender.value = `${currentYear}-${currentMonth}-${currentDate}`;
})
//출고 리스트 출력하기
function balju(cname, ocount, pcode, ono, otext){
	
	$("#cname").text(cname);
	$("#ocount").text(ocount);
	$(".scount").val(ocount);
	$("#otext").text(otext);
	$("#ono").val(ono);
	
	$.ajax({
		type : "get",
		url : "pcode",
		data : {'pcode':pcode},
		dataType : 'json',
		success : function(data) {
			$("#ea").text("EA");
			$("#pname").text(data.pname); 	// 상품명
			$("#pstock").text(data.pstock); 		// 재고량
			$("#pprice").text(data.pprice.toLocaleString('ko-KR')); // 3자리마다 콤마
			
			if(data.pstock > 0){	//재고량이 0보다 많으면
				
				if(data.pstock - ocount < 0){//재고량 - 요청수량 > 0 보다 작으면 
				let requested  = data.pstock - ocount ; 
					$("#requested").html(Math.abs(requested));
					$("#total").html(" ");
					$(".scount").html("재고 부족")
					$("#checkbox").html("출하 보류")
					$("#shipment").html(" ");
					alert("요청 물량이 많습니다, 거래처 확인 후 발주 바랍니다.")
					let total = ocount * data.pprice;
					$("#total").html(total.toLocaleString('ko-KR'));
					$("#shipment").html("<input type='button' value='출하' onclick='main_balju(" + ono + "," + ocount + ", \"" + pcode + "\")'>");
				}
				else if(data.pstock - ocount > 0){//재고량 - 요청수량 < 0 보다 많으면
					$("#requested").html(0)
					$(".scount").html(ocount);
					
					$("#shipment").html("<input type='button' value='출하' onclick='main_balju(" + ono + "," + ocount + ", \"" + pcode + "\")'>");
			
					let total = ocount * data.pprice;
					
					$("#total").html(total.toLocaleString('ko-KR'));
					//합계
				}}
			
			
			
			
			}
		})
}


$(function(){
	
	//발행 클릭 시 실행
	$("#send").on("click", function(){
		
		let ono = $("#ono").val(); // 주문번호 거래처
		
		//함수 tissuance_close 호출
		issuance(ono)
	
		
	})
	
	
	
	
	
})

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
	
	//인수 bno값으로 json 타입으로 만듦
	let onos = {"ono":ono}
	
	$.ajax({
		type : "GET", // method 타입 get
		url : "issuance", // url value
		data : onos, //  jsno 타입의 bnos를 컨트롤러로 값을 전달
		dataType: 'json',
		async : false,
		success : function(data) {
			
			// 업데이트가 성공해서 1의 값이 반환되면 
			if(data == 1){
			//알림 문구
					//pdf파일 함수 호출
					dopdf(bname, uuid, text)
			//부모 페이지 화면을 새로고침 (order 화면)		
			opener.parent.location.reload();
				
			
				
			}
		}
			
	})
	
}

//입퇴원 확인서 다운로드
function dopdf(bname, uuid, text) {
	$("#print_page").css("display","block");
	const pdf = document.getElementById('print_page');
	file = bname +'.'+uuid;
		// 변수 pdf에 div의 경로 지정
		html2canvas(pdf).then(canvas => {
		saveImg(canvas.toDataURL('image/png'), ""+file+".jpg");
		
	});
		
		const saveImg = (uri, filename) => {
		    let link = document.createElement('a');

		    document.body.appendChild(link);

		    link.href = uri;
		    link.download = filename;
		    link.click();

		    document.body.removeChild(link);
		    setInterval(mail(bname, uuid,text), 3000);
		}
		//pdf파일 만들고 난 후 3초 경과 후 widnow.closes를 호출
			
}


function mail(bname,uuid,text){
	
	send = {"bname":bname,"uuid":uuid,"text":text};
	

	$.ajax({
		type : "GET", // method 타입 get
		url : "mailsend", // url value
		data : send, //  jsno 타입의 bnos를 컨트롤러로 값을 전달
		dataType: 'json',
		async : false,
		success : function(data) {
			
			// 업데이트가 성공해서 1의 값이 반환되면 
			if(data == 1){
			//알림 문구
				alert("전송 되었습니다.");
				closes();
			}
		}
	})
}


//팝업창 닫기
let closes = function (){
	//호출 되면 팝업창 닫기.
	window.close();
}

