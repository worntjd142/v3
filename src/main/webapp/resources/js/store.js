let update_ocount = [];
let update_pcode = [];
let update_amount = [];
let update_pname = [];
let update_scount = []
let update_ono;
let update_tscount;
let update_tamount;
let update_tcount;
let ssum_price = 0;
$(function(){

 calender = document.getElementById("balju_day");
	
	const nowDate = new Date();

	let currentYear = nowDate.getFullYear();
	let currentMonth = String((nowDate.getMonth()+1)).padStart(2,"0")
	let currentDate = String(nowDate.getDate()).padStart(2,"0")

	// 새로고침했을 때 오늘 날짜를 자동으로 세팅
//	calender.value = `${currentYear}-${currentMonth}-${currentDate}`;
	
})
//출고 리스트 출력하기
function balju(ono){
	 update_ocount.length=0;
	 update_pcode.length=0;
	 update_amount.length=0;
	 update_pname.length = 0;
	update_ono = ono;
	
	$("#update_ono").val(update_ono);
	
	$("#table_culha *").remove(0)
	$.ajax({
		type : "get",
		url : "ono_balju",
		data : {'ono':ono},
		dataType : 'json',
		success : function(data) {
			console.log(data);
			
			let html ;
			let num = 1;
			let total_count = 0;
			let total_price = 0;
			let ssum = 0;
			ssum_price = 0;
			for(let i = 0; i < data.length; i++){
				
				ssum_price += data[i].pprice;
				total_count += data[i].ocount; //합계 갯수
				total_price += data[i].pprice * data[i].ocount; // 합계 단가
				ssum = data[i].pprice * data[i].ocount;
				
				html += "<tr>"
				html += "<td style='width: 30px;'>" + num++ +"</td>"; //거래처
				html += "<td style='text-align: left; style='width: 200px;'>" +data[0].cname+"</td>"; //거래처
				html += "<td style='text-align: left; style='width: 130px;'>"+data[i].pproduct+"</td>"; // 품목명
				html += "<td style='text-align: left; style='width: 80px;'>"+data[i].pcode+"</td>"; // 품목코드
				html += "<td style='text-align: right; style='width: 90px;'>"+data[i].ocount.toLocaleString("ko-KR")+"EA</td>"; // 수주수량
				html += "<td style='text-align: right; style='width: 90px;'>"+data[i].ocount.toLocaleString("ko-KR")+"EA</td>"; //출하수량
				html += "<td style='text-align: right; style='width: 100px;'>"+data[i].pprice.toLocaleString("ko-KR")+"</td>"; //출하수량
				html += "<td style='text-align: right; style='width: 150px;'>"+ssum.toLocaleString("ko-KR")+"</td>"; //출하수량
				html += "</tr>"
			}
			
				$("#ocount_total").html(total_count + "EA");// 합계 수주수량
				$("#scount_total").html(total_count + "EA");// 합계 출하수량
				$("#total_price").html(total_price.toLocaleString("ko-KR")); // 합계 단가
				$("#table_culha").append(html); //동적 테이블
			
				}
			})
			
			
	$.ajax({
		type : "get",
		url : "ono_stock",
		data : {'ono':ono},
		dataType : 'json',
		success : function(data) {
			
			console.log(data);
			let html ;
			let num = 1;
			let amount = 0;
			let pamount = 0;
			let total_pstock = 0;
			let total_scount = 0;
			let total_count = 0;
			let spamount = 0;
			let d;
			
			for(let i = 0; i < data.length; i++){
					
				total_count += data[i].ocount;
				total_pstock += data[i].pstock;
					
			 if(data[i].pstock - data[i].ocount < 0){ // 재고량 - 수주량이 0보다 낮을 시
						 amount  = data[i].pstock - data[i].ocount // 요청잔량 =재고량 - 수주수량
						 pamount = Math.abs(amount); // 음수로 나온 값음 양수로 변경
						 
						 	if(data[i].pstock < 0){
						 		spamount += data[i].ocount;
						 	}else{
						 		spamount += Math.abs(amount); //양수로 나온 요청잔량의 합
						 	}
						 data[i].scount = data[i].ocount - pamount// 요청잔량이 발생할 경우 출하수량을 재고량과 같게하기.
						 
						 if(data[i].pstock < 0){ //재고량이 0보다 낮을 경우
							 total_scount = data[i].scount = 0; // 출하수량은 0으로 바꿈
							 pamount = data[i].ocount;// 물품이 나갈수 없으므로 요청잔량의 값은 수주수량과 같음
						 }
						 	
					}else{
						pamount = 0; // 요청잔량이 발생하지 않으면 0으로 초기화
						data[i].scount = data[i].ocount// 요청잔량이 발생하지 않을경우 scount의값은 ocount와 같게하라
					}
			
				html += "<tr style='width: 30px;'>"
				html += "<td width: 356px;>" + num++ +"</td>"; 
				html += "<td style='text-align: left;width: 196px;'>" +data[i].pproduct+"</td>"; //품목명
				html += "<td id='dt_pcode'style='text-align: left;width: 130px;' >"+data[i].pcode+"</td>"; // 품목코드
				html += "<td style='text-align: right; width: 130px;'>"+data[i].pstock+"EA</td>"; //재고량
				html += "<td id='dt_ocount'style='text-align: right; width: 130px;' >"+data[i].ocount+"EA</td>"; //수주수량
				html += "<td style='text-align: right; width: 130px;'>"+data[i].scount+"EA</td>"; //출하수량
				html += "<td id='pamount"+i+"' style='text-align: right; width: 130px;'>"+pamount+"EA</td>"; //요청잔량
				html +="</tr>"
					
					
				total_scount += data[i].scount; //total_scount의 값은 data[i].scount 총합

				//배열
				update_ocount.push(data[i].ocount);
				update_pcode.push(data[i].pcode);
				update_amount.push(pamount);
				update_pname.push(data[i].pproduct);
				update_scount.push(data[i].scount);	
					
			}
			
			$("#stock").html(html);
			
			for (let i = 0; i < data.length; i++){ // data의 길이만큼 반복
				
				let text = $("#pamount"+i+"").text(); // pamount의 텍스트를 추출
				
				let First_String = text.charAt(0); // pamount의 첫자리 문자를 추출
				
				let Int_num = parseInt(First_String); // 추출한 문자를 int형식으로 변경
				
				if(Int_num > 0 ){ // int로 변경한 값이 0보다 크면
					
					$("#pamount"+i+"").css("color", "red"); //최초 pamount의 텍스트에 red색을 입힘
				}
				
			}
			
			update_tcount = total_count;
			update_tscount = total_scount;
			update_tamount = spamount;
			
			
			$("#total_psock").html(total_pstock.toLocaleString("ko-KR") + "EA");
			$("#total_ocount").html(total_count.toLocaleString("ko-KR") + "EA");
			$("#total_scount").html(total_scount.toLocaleString("ko-KR") + "EA");
			$("#sum_price").html(ssum_price.toLocaleString("ko-KR"));
			
			for(let i = 0; i < data.length; i++){
				if(data[i].pstock < 0){
					
					spamount - data[i].pstock;
					
				}
		}
			$("#total_amount").html(spamount.toLocaleString("ko-KR") + "EA");
			$("#update_ocount").val(update_ocount.toLocaleString("ko-KR"));
			$("#update_pcode").val(update_pcode.toLocaleString("ko-KR"));
			$("#update_amount").val(update_amount.toLocaleString("ko-KR"));
			
			if(spamount > 0){
			$("#total_amount").css("color", "red");
			}else{
			$("#total_amount").css("color", "black");
			}
			
			
				}
			})
		}

function culha(){
/*	console.log(update_ocount);
	console.log (update_pcode);
	console.log(update_amount);
	console.log(update_pname);
	console.log(update_ono);
	console.log( update_tscount);
	console.log( update_tamount);
	console.log(update_scount);*/
	
	if(update_amount.length == 0){// 제품을 선택하지 않고 출하요청 시
		alert("수주내용이 없습니다. ")
	}
	
	$.ajax({
		type : "get",
		url : "pstock_update",
		data : {'update_ocount':update_ocount, 'update_pcode':update_pcode,'update_amount':update_amount,  
				   'update_ono':update_ono, 'update_pname':update_pname ,'update_tcount':update_tcount, 
				   'update_scount':update_scount, 'update_tscount':update_tscount,'update_tamount':update_tamount },
		dataType : 'json',
		success : function(data) {
			
			if(data  == 0){
				
				alert("오류 발생, 새로고침 하겠습니다")
				location.reload();
			}else{
			
				location.reload();
			}
		}
	
		});
}
	
