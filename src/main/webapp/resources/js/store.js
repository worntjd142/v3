/* 발주 등록 SELECT 박스 안에 제품명, 제품코드 값 넣기 */
$(function() {
	
	// balju.jsp id=selectbox인 태그를 한번 클릭했을때
	$("#selectbox").one("click", function() {
		// pselect() 실행
		pselect();
	})
	
	calender = document.getElementById("balju_day");
	
	const nowDate = new Date();

	let currentYear = nowDate.getFullYear();
	let currentMonth = String((nowDate.getMonth()+1)).padStart(2,"0")
	let currentDate = String(nowDate.getDate()).padStart(2,"0")

	// 새로고침했을 때 오늘 날짜를 자동으로 세팅
	calender.value = `${currentYear}-${currentMonth}-${currentDate}`;


		
});

	
function pselect() {
	
	//전역변수
	let stock = Array(); // 배열 stock 선언
	let stock_money = Array(); // 배열 stock_money 선언
	let select_name; // 변수 select_name 선언
	let stock_pcode = Array();
	
	var sum = '';
	var num1 = 0;
	
	$.ajax({
		type : "POST",
		url : "product_select.json",
		data : [],
		dataType : 'json',
		async : false,
		success : function(data) {
			console.log(data)

			// data 길이만큼 반복해서 option에 데이터 추가
			for (var i = 0; i < data.length; i++) {
				$("#selectbox")
						.append("<option>" + data[i].pname + "</option>");
				stock.push(data[i].pname);// stock 배열에 data[i].panme 값이 뒷 배열에 쌓임
				stock_money.push(data[i].pprice); //stock_money 배열에 data[i].pprice 값이 뒷 배열에 쌓임
				stock_pcode.push(data[i].pcode); //stock_money 배열에 data[i].pcode 값이 뒷 배열에 쌓임
			};
			// 해당 제품명의 제품단가 

			$("#selectbox").change(function() { //셀렉트 박스가 바뀌어서 선택이 되면
				select_name = $(this).val(); //선택한 값을 select_name 변수에 저장
				for (var j = 0; j < data.length; j++) { // data의 배열 길이 만큼 반복
					if (select_name == stock[j]) { // select_name 의 값과 stock[j] 값이 같으면 
						$("#stock_money").val(stock_money[j]); // stock_money의 빈 공간에 stock_money[j]을 삽입.
						$("#pcode").val(stock_pcode[j]); // stock_money의 빈 공간에 stock_money[j]을 삽입.
						
						// stock_money[j] num1에 저장
						var num1 = stock_money[j];
						
						$("#num1").on("keyup",function(){ // input keyup 이벤트														
							var num2 = $("#num1").val(); // 수량 값을 num2에 저장
							
							sum = num1 * num2; //단가 * 수량							 
							$("#total").val(sum); //total의 빈공간에 sum 출력
							
						});
					
					};
				};				
			});
		}
	});
	

};
//온클릭으로 매개변수 2개의 값을 인수에 저장
function insert_company(name, number){
	
	$("#bname").val(name); // 인수 값을 id=bame의 value에 저장
	$("#bnumber").val(number); // 인수 값을 id="bnumber의 value에 저장
}


//배달원의 목적지와의 경로 및 도착시간 
function del(x,y,name){
	
			//윈도우 팝업
		   let url = "release?x=" + x +"&y="+ y +"&name=" + name +"";

		   let option = 'width=500, height=500, left=1000, scrollbars=no, resizeable=no, menubar=no, ';

		   window.open(url, name, option);

}


$("#scount").on("click", function(){
	console.log("aaa");
	
})

//출고 리스트 출력하기
function balju(cname, ocount, pcode){
	
	$("#cname").text(cname);
	$("#ocount").text(ocount);
	$(".scount").val(ocount);
	
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
			
			if(data.pstock - ocount < 0){//재고량 - 요청수량 > 0 보다 작으면 
				$("#total").html(" ");
				$(".scount").html("재고 부족")
				$("#checkbox").html("출하 보류")
				$("#shipment").html(" ");
			}else if(data.pstock - ocount > 0){//재고량 - 요청수량 < 0 보다 많으면
				$(".scount").html(ocount);
				$("#checkbox").html("<input type='checkbox'>");
				$("#shipment").html("<input type='button' value='출하' onclick='balju()'>");
				let sum = ocount * data.pprice;
				
				$("#total").html(sum.toLocaleString('ko-KR'));
				//합계
			}
			
			
			}
		})
}

function main_balju(ono,ocount,pcode){
	
	let update ={'ono':ono,'ocount':ocount, 'pcode':pcode };
	$.ajax({
		type : "get",
		url : "pstock_update",
		data : update,
		dataType : 'json',
		success : function(data) {
				console.log(data);
		}
	
		});
}*/


