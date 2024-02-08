/*//배달원의 목적지와의 경로 및 도착시간 
function del(x,y,name){
	
			//윈도우 팝업
		   let url = "release?x=" + x +"&y="+ y +"&name=" + name +"";

		   let option = 'width=500, height=500, left=1000, scrollbars=no, resizeable=no, menubar=no, ';

		   window.open(url, name, option);

}
*/

$(function(){ // 페이지 로드 시 출하일에 현재시간 적용하기.

 calender = document.getElementById("balju_day");
	
	const nowDate = new Date();

	let currentYear = nowDate.getFullYear();
	let currentMonth = String((nowDate.getMonth()+1)).padStart(2,"0")
	let currentDate = String(nowDate.getDate()).padStart(2,"0")

	// 새로고침했을 때 오늘 날짜를 자동으로 세팅
	//calender.value = `${currentYear}-${currentMonth}-${currentDate}`;
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
		data : onos, //  jsno 타입의 onos를 컨트롤러로 값을 전달
		dataType: 'json',
		async : false,
		success : function(data) {
			
			// 업데이트가 성공해서 1의 값이 반환되면 
			if(data == 1){
			//알림 문구
					console.log(data);
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

let ono = Array(); // ono 전역변수 선언
let html;
$(function() {
   
	
	// 일괄 수주 등록
	
	
   $("#check_all").on("click", function() {  // 메인 체크박스를 클릭 시.
	   
	  ono.length = 0;
	   
	  let count = $("#count").val();
	  
      let od = Array(); // od. 지역변수 선언
      
      let chk = $(this).is(":checked"); // 메인 체크박스의 값을 확인. ('false' or 'true')
      
      if (chk) { // 'true'면 작동
    	  
         $("input:checkbox[class='check_all']").prop("checked", true); 
         // class = "check_all"의 체크박스를 모두 체크 = 모두 true값으로 만듬.
         for(i = 0; i < count; i++){ // 화면에 출력할 페이지 갯수만큼 반복 (10개)
        	 
         od.push($("#check_val"+i).is(":checked")); 
         // 반복하면서 #check_val의 값을 배열 od에 저장. (들어가는 값은 'false' or 'true')
         
         if(od[i] == true){// od의 인덱스를 이용하여 true인 값만 지정하여 ono의 값을 배열ono에 저장.
            ono.push($("#check_val"+[i]).val());
            
            }
      }
         
} 
      
      else { // 'false'면 작동
         $("input:checkbox[class='check_all']").prop("checked", false); 
         
         $("#in *").remove(); // id ="in"의 append 삭제
         html = ""; // html에 초기화된 값 삭제
         // class = "check_all"의 체크박스를 모두 체크해제 = 모두 false값으로 만듬
      
         ono.length = 0; // ono 배열 안의 값을 모두 삭제
         }
      
      	a = 0;
      list();
      
   })

   
   // 개별 수주 등록
   
   $(".check_all").on("click",function(){ // 개별 체크 박스가 클릭 되면
	   
	   			if(ono.includes($(this).val())){	// 개별 체크 박스 클릭 시 ono배열에
													// 개별체크박스의 값이 있는지 확인. 있으면
													// 'true' 없으면 'false'
	   					
	   				ono = ono.filter((element) => element !== $(this).val());// 필터 함수를 통해 중복된 값을 제거하고 다시 ono 배열에 저장
	   				$("#in *").remove(); // id ="in"의 append 삭제
		   	         html = ""; // html에 초기화된 값 삭제
	   	         
	   				
	   			}else{ // 체크박스의 값이 ono에 없다면
	   				ono.push($(this).val()); // 개별체크박스의 값을 ono배열에 저장
	   			 $("#in *").remove(); // id ="in"의 append 삭제
	   	         html = ""; // html에 초기화된 값 삭제
	   			}
	   			
	   			list();
	   });   
   
});

//동적 테이블
function list(){
	$("#in *").remove(); // id ="in"의 append 삭제
       html = ""; // html에 초기화된 값 삭제
$.ajax({
    url: 'issuance_select',
    data: {'ono':ono},
    dataType: 'json',
    contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
    type: 'get',
    success: function(data) {
  	  let no = 1;
  	  let oc = Array();
  	  for(let i = 0; i < data.length; i++){
  		  oc.push(data[i].scount - data[i].amount); //출하수량
  		  
  		  html += '<tr>'
  		  html += '<td>'+ no++ +'</td>';
  		  html += '<td>'+data[i].uuid+'</td>';
  		  html += '<td>'+data[i].cname+'</td>';
  		  html += '<td>'+data[i].ocount+'</td>';
  		  html += '<td>'+oc[i]+'</td>';
  		  html += '<td>'+data[i].amount+'</td>';
  		  html += '</tr>'
  	  }
  	  $("#in").append(html);
  	   	
  	  	} 
  })  
   
   
   
}

