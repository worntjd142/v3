
/* 발주 등록 SELECT 박스 안에 제품명, 제품코드 값 넣기 */
$(function(){

	// balju.jsp id=selectbox인 태그를 한번 클릭했을때
$("#selectbox").one("click", function(){
	// pselect() 실행
	pselect();
})
});
	
function pselect() {
	//전역변수
	let stock = Array(); // 배열 stock 선언
	let stock_money = Array(); // 배열 stock_money 선언
	let select_name; // 변수 select_name 선언
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
					$("#selectbox").append(
						"<option>" + data[i].pname + "</option>");
					stock.push(data[i].pname);// stock 배열에 data[i].panme 값을 누적
					stock_money.push(data[i].pprice); //stock_money 배열에 data[i].pprice 값을 누적
				}
				// 해당 제품명의 제품단가 
					
				
				$("#selectbox").change(function(){ //셀렉트 박스가 바뀌어서 선택이 되면
					select_name = $(this).val();	//선택한 값을 select_name 변수에 저장
					for(var j = 0; j < data.length; j++ ){ // data의 배열 길이 만큼 반복
					if(select_name == stock[j]){ // select_name 의 값과 stock[j] 값이 같으면 
						$("#stock_money").text(stock_money[j]); // stock_money의 빈 공간에 stock_money[j]을 삽입.
					}
				}
				})
			} 		
	});
};
