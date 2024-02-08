/*//배달원의 목적지와의 경로 및 도착시간 
function del(x,y,name){
	
			//윈도우 팝업
		   let url = "release?x=" + x +"&y="+ y +"&name=" + name +"";

		   let option = 'width=500, height=500, left=1000, scrollbars=no, resizeable=no, menubar=no, ';

		   window.open(url, name, option);

}
*/
let requested_math = 0;
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
function balju(ono){
	
	$.ajax({
		type : "get",
		url : "pcode",
		data : {'ono':ono},
		dataType : 'json',
		success : function(data) {
			
			
			/*$("#ea").text("EA");
			$("#pname").text(data.pname); 	// 상품명
			$("#pstock").text(data.pstock); 		// 재고량
			$("#pprice").text(data.pprice.toLocaleString('ko-KR')); // 3자리마다 콤마
			
				if(data.pstock < 0){
					alert("재고가 없습니다.")
					
				}else{
				if(data.pstock - ocount < 0){//재고량 - 요청수량 > 0 보다 작으면 
					
				let requested  = data.pstock - ocount ; 
				requested_math =  Math.abs(requested)
				
					$("#requested").html(requested_math);
					$("#total").html(" ");
					$(".scount").html("재고 부족")
					$("#checkbox").html("출하 보류")
					$("#shipment").html(" ");
					alert("요청 물량이 많습니다, 거래처 확인 후 발주 바랍니다.")
					let total = ocount * data.pprice;
					$("#total").html(total.toLocaleString('ko-KR'));
					$("#shipment").html("<input type='button' value='출하' onclick='main_balju(" + ono + "," + ocount + ", \"" + pcode + "\")'>");
					$("#Warning").html("※출고 후, 재고량 확인 부탁드립니다.")
					$("#Warning").css("color", "red");
				}
				else if(data.pstock - ocount > 0  || data.pstock - ocount == 0 ){//재고량 - 요청수량 < 0 보다 많거나 같으면
					
					$("#requested").html(0)
					$(".scount").html(ocount);
					
					$("#shipment").html("<input type='button' value='출하' onclick='main_balju(" + ono + "," + ocount + ", \"" + pcode + "\")'>");
			
					let total = ocount * data.pprice;
					
					$("#total").html(total.toLocaleString('ko-KR'));
					
						if(data.pstock - ocount == 0){
							$("#Warning").text("※출고 후, 재고량 확인 부탁드립니다.");
							$("#Warning").css("color", "red");
				}}*/
			
				}
			
			
			}
		})
}

function main_balju(ono,ocount,pcode){
	
	let amount = requested_math;
	console.log(amount);
	console.log(requested_math);
	
	let update ={'ono':ono,'ocount':ocount, 'pcode':pcode, 'amount':amount};
	$.ajax({
		type : "get",
		url : "pstock_update",
		data : update,
		dataType : 'json',
		success : function(data) {
				location.reload();
		}
	
		});
}
	
