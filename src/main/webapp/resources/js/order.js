
/* 발주 등록 SELECT 박스 안에 제품명, 제품코드 값 넣기 */
$(function(){

	// balju.jsp id=selectbox인 태그를 한번 클릭했을때
$("#selectbox").one("click", function(){
	// pselect() 실행
	pselect();
})
});
	
function pselect() {

$.ajax({
		type : "POST",
		url : "product_select.json",
		data : [],
		dataType : 'json',
		async : false,
		success : function(data) {
				console.log(data[0].pname)
			
				// data 길이만큼 반복해서 option에 데이터 추가
				for (var i = 0; i < data.length; i++) {
					$("#selectbox").append(
						"<option>" + data[i].pname + "</option>");
				// 해당 제품명의 제품단가 
					
				}
				
				
			} 		
	});
};
