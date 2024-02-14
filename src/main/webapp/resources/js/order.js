/* 거래처명 검색 자동완성 */

$(function() { // 화면 다 뜨면 시작

	$("#auto").autocomplete({

		// source 는 자동 완성 대상
		source : function(request, response) {

			// var auto = $("#autosearch").serialize();

			$.ajax({
				url : "/autocomplete",
				type : "get",
				dataType : "json",
				data : {
					"cname" : $("#auto").val()
				},
				success : function(data) {
					console.log(data);

					// response: 서버에서 응답이 오면 화면에 리스트를 보여주기 전에 실행된다.
					response($.map(data, function(item) {
						console.log(item);// json[i] 번째 에 있는게 item 임.
						return {
							label : item.cname,
							value : item.cno,
							ceo : item.ceo
							// UI 에서 보여지는 글자, 실제 검색어랑 비교 대상
							// 그냥 사용자 설정값?
						}
					}));
				}
			});
		}, 		

		focus : function(event, ui) { // 포커스
			return false;
		},	

		select: function(event, ui) {
			// 항목을 선택하면 HTML페이지에 전달/표시
			$(this).val(ui.item.label);
			$("#auto").val(ui.item.label);
			$("#cno").val(ui.item.value); //id="cno"에 표시
			$("#ceo").val(ui.item.ceo); //id="cno"에 표시
			return false;
		},

		minLength : 0, // 조회를 위한 최소 글자수
		autoFocus : true, // 첫번째 항목 자동 포커스 기본값 false
		classes : { // 잘 모르겠음
			"ui-autocomplete" : "highlight"
		},

		delay : 0, // 검색창에 글자 써지고 나서 autocomplete 창이 뜰때까지 딜레이 시간(ms)
		// disabled: true, 자동완성 기능 끄기
		position : {
			my : "right top",
			at : "right bottom"
		},

		close : function(event) { // 자동완성창 닫아질때 호출
			console.log(event);
		}
	}).click(function() {$(this).autocomplete("search", ""); }); 
	// input 입력창을 클릭하면 전체데이터를 호출

});


/* 제품목록 체크박스 일괄체크+체크해제 */
$(function(){   	
	// 전체체크박스를 클릭했을때
	$("#all_Check").click(function(){ 

		// .is(선택한 Element와 일치하는 확인)
		if ($("#all_Check").is(":checked")) 
			// input[name=choice_Check]인 체크박스 true
			$("input[name=choice_Check]").prop("checked", true);

		// input[name=choice_Check]인 체크박스 false
		else $("input[name=choice_Check]").prop("checked", false);

	});   	
}); 



var pcount = 0;

var rowData = []; // 체크한 테이블의 값을 담을 배열
var totalSum = 0; // 총합을 저장할 변수
var pproducts = []; // 체크한 제품명 값을 담을 배열
var pprices = []; // 체크한 제품단가 값을 담을 배열
var ocounts = []; // 체크한 품목수 값을 담을 배열

$(function(){

	$("#btn_Chklist").click(function(){ 

		// 체크된 체크박스 값을 가져와서 각 필드의 값을 추출하여 rowData에 저장
		$("input[class='choice_Check']:checked").each(function() {
			var tr = $(this).closest("tr"); // 현재 체크박스가 속한 행(tr)을 찾음

			// 필드가 존재하는지 확인하고 값을 추출하여 rowData에 저장
			var pproductElement = tr.find("td:eq(1)");
			var ppriceElement = tr.find("td:eq(2)");
			var ocountElement = tr.find("input[name=ocount]");

			// 필드가 존재할 때에만 값을 추출하여 배열에 저장
			if (pproductElement.length && ppriceElement.length && ocountElement.length) {
				var pproduct = pproductElement.text().trim(); // 제품명(td:eq(1))
				var pprice = parseInt(ppriceElement.text().trim()); // 제품가격(td:eq(2))
				var ocount = ocountElement.val().trim(); // 수량(input[type='number'])

				// 제품 가격과 수량을 곱하여 가격을 계산
				var totalPrice = parseInt(pprice * parseInt(ocount));

				// 배열에 담은 값들을 배열에 담는다?
				pproducts.push(pproduct)
				pprices.push(pprice)
				ocounts.push(ocount)	    	        

				// pproduct, pprice, ocount 요소에 값을 넣어줌
				$("#pproduct").val(pproducts);
				$("#pprice").val(pprices);
				$("#ocount").val(ocounts);	 
				$("#pcount").val(pproducts.length);

				console.log(pproducts)
				console.log(pprices)
				console.log(ocounts)

				// 총합을 계산
				totalSum += totalPrice;
			}
		});

		/*	
	        // pnamesum 요소에 배열 값을 넣기
	        var pnames = rowData.map(function(item) {
	            return item.pproduct + " / " + item.pprice + "원 / " + item.ocount + "BOX"; // 제품명 - 제품가격원 x 수량개 형식으로 문자열 생성
	        }).join(", "); // 배열 요소를 쉼표와 공백으로 연결하여 문자열로 만듦
	        $("#pnamesum").val(pnames);
		 */

		// 총합을 총합 요소에 넣기 // .toLocaleString('ko-KR') 콤마넣는 메소드
		$("#osum").val(totalSum);

	});

	// "제품삭제" 버튼을 클릭하면
	$("#delete_Btn").click(function() {

		// 체크된 박스를 checkedCheckboxes 변수에 저장한다.
		var checkedCheckboxes = $("input[class='choice_Check']:checked");

		// 체크된 checkedCheckboxes변수를 반복해서
		checkedCheckboxes.each(function() {	
			// 현재 클릭된 체크박스(this)가 속한 행(tr)을 찾아서 tr 변수에 저장한다.
			var tr = $(this).closest("tr");

			// 테이블 행(tr)에서 각 제품명, 제품단가, 수량을 가져온다
			var pproductElement = tr.find("td:eq(1)").text().trim();
			var ppriceElement = tr.find("td:eq(2)").text().trim();
			var ocountElement = tr.find("input[name=ocount]").val().trim();

			var index = pproducts.indexOf(pproductElement); // 해당 제품의 인덱스 찾기

			if (index > -1) {
				pproducts.splice(index, 1); // 해당 제품 제거
				pprices.splice(index, 1); // 해당 제품의 가격 제거
				ocounts.splice(index, 1); // 해당 제품의 수량 제거
			}
		});

		// 업데이트된 배열을 다시 화면에 표시
		$("#pproduct").val(pproducts);
		$("#pprice").val(pprices);
		$("#ocount").val(ocounts);
		$("#pcount").val(pproducts.length);
	});

});




// 주문수량 +
function plus(count){
	// cnt변수에 카운트박스 value값 저장
	let cnt = document.getElementById("countBox"+count).value;

	// cnt 값이 50일 경우 +버튼 눌러도
	if(cnt == 50){
		//false값 반환
		return false;
	}else{
		// plus 버튼 누르면 cnt 증가
		cnt++;
	}
	// 증가된 cnt 값 다시 카운트박스 value에 저장
	document.getElementById("countBox"+count).value = cnt;
}
// 주문수량-
function minus(count){
	let cnt = document.getElementById("countBox"+count).value;

	if(cnt == 0){
		return false;
	}else{
		cnt--;
	}
	document.getElementById("countBox"+count).value = cnt;

}


/* 제품리스트 자동완성 */

$(function() { // 화면 다 뜨면 시작

	var sum = '';
	var num1 = 0;

	// $("#autosearch").serialize()

	$("#auto_product").autocomplete({

		// source 는 자동 완성 대상
		source : function(request, response) {

			// var auto = $("#autosearch").serialize();

			$.ajax({
				url : "/autoproduct",
				type : "get",
				dataType : "json",
				data : {
					"pname" : $("#auto_product").val()
					// 배열로만든 제품관리리스트라서 배열에 담겨있기때문에 하나만 가져와도
					// 배열로 가ㅈㅕ옴
				}, 
				success : function(data) {
					console.log(data);

					// response: 서버에서 응답이 오면 화면에 리스트를 보여주기 전에 실행된다.
					response($.map(data, function(item) {
						console.log(item);// json[i] 번째 에 있는게 item 임.
						return {
							label : item.pname,
							value: item.pprice
							// UI 에서 보여지는 글자, 실제 검색어랑 비교 대상
							// 그냥 사용자 설정값?
						}
					}));
				}
			});
		}, 		

		focus : function(event, ui) { // 포커스
			return false;
		},	

		select: function(event, ui) {
			// 항목을 선택하면 HTML페이지에 전달/표시
			$(this).val(ui.item.label);
			$("#auto_product").val(ui.item.label);
			$("#pprice").val(ui.item.value);
			return false;
		},

		minLength : 0, // 조회를 위한 최소 글자수
		autoFocus : true, // 첫번째 항목 자동 포커스 기본값 false
		classes : { // 잘 모르겠음
			"ui-autocomplete" : "highlight"
		},

		delay : 0, // 검색창에 글자 써지고 나서 autocomplete 창이 뜰때까지 딜레이 시간(ms)
		// disabled: true, 자동완성 기능 끄기
		position : {
			my : "right top",
			at : "right bottom"
		},

		close : function(event) { // 자동완성창 닫아질때 호출
			console.log(event);
		}
	}).click(function() {$(this).autocomplete("search", ""); }); // input입력창을 클릭하면 전체데이터를 호출

});    


/* 제품단가*수량=합계 */
function count(){

	var num1 = $("#pprice").val();  		
	console.log(num1);

	var num2 = $("#ocount").val();	   	
	console.log(num2);	


	var total = num1 * num2;
	console.log(total)

	$("#total").val(total.toLocaleString('ko-KR'));

};   


let ono = Array(); // ono 전역변수 선언

$(function() {


	// 일괄 수주 등록


	$("#check_all").on("click", function() {  // 메인 체크박스를 클릭 시.

		let od = Array(); // od. 지역변수 선언

		let chk = $(this).is(":checked"); // 메인 체크박스의 값을 확인. ('false' or 'true')

		if (chk) { // 'true'면 작동

			$("input:checkbox[class='check_all']").prop("checked", true); 
			// class = "check_all"의 체크박스를 모두 체크 = 모두 true값으로 만듬.

			for(i = 0; i < 10; i++){ // 화면에 출력할 페이지 갯수만큼 반복 (10개)

				od.push($("#check_val"+i).is(":checked")); 
				// 반복하면서 #check_val의 값을 배열 od에 저장. (들어가는 값은 'false' or 'true')

				if(od[i] == true){// od의 인덱스를 이용하여 true인 값만 지정하여 ono의 값을 배열ono에 저장.
					ono.push($("#check_val"+[i]).val());

				}
			}

		} 

		else { // 'false'면 작동
			$("input:checkbox[class='check_all']").prop("checked", false); 
			// class = "check_all"의 체크박스를 모두 체크해제 = 모두 false값으로 만듬

			ono.length = 0; // ono 배열 안의 값을 모두 삭제
		}
	})

	$("#check_button").on("click", function() {// 일괄체크버튼을

		let od = Array(); // od. 지역변수 선언

		let chk = $("#check_all").is(":checked"); // check_all의 체크여부를 chk에 저장
		if (chk) { // 메인 체크박스의 값을 확인. ('false' or 'true')

			$("input:checkbox[class='check_all']").prop("checked", false);
			// 하위 체크박스 모두를 체크해제
			$("#check_all").prop("checked", false);  // 메인 체크박스 체크해제

			let c = $("input:checkbox[class='check_all']").is(":checked");

			ono.length = 0; // ono 배열 안의 값을 모두 삭제

		} // chk이 ture라면 모든 체크박스의 체크를 해제

		else { $("input:checkbox[class='check_all']").prop("checked", true); // 하위 체크박스 모두를 체크

		$("#check_all").prop("checked", true); // 메인 체크박스 체크

		for(i = 0; i < 10; i++){ // 화면에 출력할 페이지 갯수만큼 반복 (10개)

			od.push($("#check_val"+i).is(":checked")); 
			// 반복하면서 #check_val의 값을
			// 배열 od에 저장. (들어가는 값은 'false' or 'true')															 

			if(od[i] == true){ // od의 인덱스를 이용하여 true인 값만 지정하여 ono의 값을 배열 ono에 저장.

				ono.push($("#check_val"+[i]).val());
			}
		}
		}

	})




	// 개별 수주 등록

	$(".check_all").on("click",function(){ // 개별 체크 박스가 클릭 되면

		if(ono.includes($(this).val())){	
			// 개별 체크 박스 클릭 시 ono배열에 개별체크박스의 값이 있는지 확인. 
			// 있으면 'true' 없으면 'false'

			ono = ono.filter((element) => element !== $(this).val());
			// 필터	함수를 통해 중복된 값을	제거하고 다시 ono 배열에 저장

		}else{ // 체크박스의 값이 ono에 없다면
			ono.push($(this).val()); // 개별체크박스의 값을 ono배열에 저장

		}
	});   

})

function update(){


	$.ajax({
		url: 'all_issuance',
		data: {'ono':ono},
		dataType: 'json',
		contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
		type: 'get',
		success: function(data) {

			if(data == 1 ){  // 업데이트가 성공하여 1의 결과값을 반환했다면
				// 새로고침
				location.reload();

			}else{// 업데이트가 실패하여 0의 결과값을 반환했다면

				alert("오류, 새로고침"); // 오류라고 알리고
				location.reload(); // 새로고침.
			} 
		}
	})   
};


let inn = [];
let v = [];
function product_details(ono){
	
	
	$("#m *").remove(); // 누른거 제외 삭제

	
	let name =[]; 
	
	name.length =0;

	if(v.includes(ono)){ // v의 배열안에 ono값의 중복이 있는지 확인
		v = v.filter((element) => element !== ono);  // 중복이 있으면 ono 값을 삭제하고
		$("#m *").remove() // table의 자식들을 삭제.
		return false;
	}else{  
		v.length = 0; // v의 배열안에 ono값의 중복이 없다면 배열 v의 값을 삭제하고
		v.push(ono); // 개별체크박스의 값을 ono배열에 저장
	}
	

	$.ajax({
		url: 'product_details',
		data: {'ono':ono},
		dataType: 'json',
		type: 'get',
		success: function(data) {
			console.log(data)

			let html = "";
			let n = 0;
			let ii = 0;
			for(let i = 0; i < data.length+1; i++){
					
				if(i == 0){

					html += "<tr style='border:1px solid gray'class='table-success ' id='m' >"
					html += "<th colspan='3' style='text-align:center'>"+data[0].cname +' 수주내역 상세'+"</th>" 
					html += "<th colspan='2' style='text-align:center'>품목명</th>"
					html += "<th colspan='2' style='text-align:center'>수주수량</th>"
					html += "<th colspan='2' style='text-align:center'>단가</th>"
					html += "<th colspan='2' style='text-align:center'>합계</th>"
					html += "</tr>"

				}else{
					ii = ono +"_"+ n
					
					sum = data[i-1].pprice * data[i-1].ocount;
					price = parseInt(data[i-1].pprice).toLocaleString("ko-KR")
					ocount = parseInt(data[i-1].ocount).toLocaleString("ko-KR")


					html += "<tr style='border:1px solid gray' id='m'>"
					html += "<td colspan='2'></td>" 
					html += "<td ><input type='checkbox' value="+data[i-1].pproduct+" class='chk'></td>" 
					html += "<td colspan='2'>"+data[i-1].pproduct+"</td>"
					html += "<td colspan='2'><input type='number' value="+ocount+" style='width: 100%;text-align: right;' id='ip"+ii+"' class='inn'></td>"
					html += "<td style='text-align:right' colspan='2'>"+price+"</td>"
					html += "<td style='text-align:right; text-align: right;' colspan='2'>"+sum.toLocaleString("ko-KR")+"</td>"
					html += "</tr>"
						
						n++
				}
			}
			$("#d_r" + ono).after(html)


			$(".chk").on("click",function(){ // 개별 체크 박스가 클릭 되면
					
				if(name.includes($(this).val())){//체크된 박스의 value값을 확인
					// name 배열안에 체크된 박스의 value값이 있으면 'true' 없으면 'false'

					name = name.filter((element) => element !== $(this).val()); // name 배열 안에 값이 있으면 삭제.
					// 필터	함수를 통해 중복된 값을	제거하고 다시 ono 배열에 저장
					
					button(ono, name); //값을 확인하면 button 함수를 호출
					
				}else{ // name 배열 안에 값이 없으면 저장.
					name.push($(this).val()); // 개별체크박스의 값을 ono배열에 저장
						
					
					button(ono, name); //값을 확인하면 button 함수를 호출
					
					}
				})
			}
		})   
	}

function button(ono, name){
	console.log(name);
	$("#d_Btn *").remove();

	let insert_val = "<input type='button' id='m_Btn' value='수정' onclick='md("+ono+" , \"" + name + "\")'>";
	let elimination_val = "<input type='button' id='d_Btn' value='삭제' onclick='dv("+ono+" , \"" + name + "\")'>";

	$("#d_Btn").append(insert_val);
	$("#d_Btn").append(elimination_val);

}

function md(ono, name){
	console.log(name);
	
	let n = 0;
	let mod_num=[];
	
	for(i = 0; i < name.length; i++){ // name의 렝스만큼 반복
		
		let inco = ono +"_"+ n;  
		
		n++
										// 1_0 > 1_1 > 1_2 까지 반복
		
		mod_num.push($("#ip" +inco).val()); // 해당하는 id의 인풋의 값을 num에 저장
		
	
	}
	
	$.ajax({
		url: 'cart_product',
		data: {'ono':ono,'name':name, 'mod_num':mod_num},
		dataType: 'json',
		type: 'get',
		success: function(data) {
			
			if(data > 0){
				location.reload();
				
			}
		}
	})
	
}



function dv(ono, name){
	console.log(name, ono);
	
	$.ajax({
		url: 'cart_elimination',
		data: {'ono':ono,'name':name},
		dataType: 'json',
		type: 'get',
		success: function(data) {
			
			if(data > 0){
				location.reload();
				
			}
		}
	})
	
}

