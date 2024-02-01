/* 거래처명 검색 자동완성 */

$(function() { //화면 다 뜨면 시작

	//$("#autosearch").serialize()
	
	var sum = '';
	var num1 = 0;
	

	$("#auto").autocomplete({

		// source 는 자동 완성 대상
		source : function(request, response) {

			//var auto = $("#autosearch").serialize();

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
						console.log(item);//json[i] 번째 에 있는게 item 임.
						return {
							label : item.cname
						//UI 에서 보여지는 글자, 실제 검색어랑 비교 대상
						//그냥 사용자 설정값?
						}
					}));
				}
			});
		}, 		
		
		focus : function(event, ui) { // 포커스 			
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

		close : function(event) { //자동완성창 닫아질때 호출
			console.log(event);
		}
	}).click(function() {$(this).autocomplete("search", ""); }); //input입력창을 클릭하면 전체데이터를 호출
});


/* 제품리스트 자동완성 */

$(function() { //화면 다 뜨면 시작

	//$("#autosearch").serialize()
	
	

	$("#auto_product").autocomplete({

		// source 는 자동 완성 대상
		source : function(request, response) {

			//var auto = $("#autosearch").serialize();

			$.ajax({
				url : "/autoproduct",
				type : "get",
				dataType : "json",
				data : {
					"pname" : $("#auto_product").val()
					//배열로만든 제품관리리스트라서 배열에 담겨있기때문에 하나만 가져와도
					//배열로 가ㅈㅕ옴
				}, 
				success : function(data) {
					console.log(data);

					// response: 서버에서 응답이 오면 화면에 리스트를 보여주기 전에 실행된다.
					response($.map(data, function(item) {
						console.log(item);//json[i] 번째 에 있는게 item 임.
						return {
							label : item.pname,
							value: item.pprice
						//UI 에서 보여지는 글자, 실제 검색어랑 비교 대상
						//그냥 사용자 설정값?
						}
					}));
				}
			});
		}, 		
		
		focus : function(event, ui) { // 포커스 			
			return false;
		},	
		
		select: function(event, ui) {
			//항목을 선택하면 HTML페이지에 전달/표시
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

		close : function(event) { //자동완성창 닫아질때 호출
			console.log(event);
		}
	}).click(function() {$(this).autocomplete("search", ""); }); //input입력창을 클릭하면 전체데이터를 호출	
	
});

function prod_sum() {
	
	var num1 = $("#pprice").val();
	var num2 = $("#num1").val();
	var sum = num1 + num2;
	
	$("#total").val(sum); // total의 빈공간에 sum 출력
	
};






/* balju.jsp 제품리스트 */
function pselect() {

	// 전역변수
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
				stock_money.push(data[i].pprice); // stock_money 배열에 data[i].pprice 값이 뒷 배열에 쌓임
				stock_pcode.push(data[i].pcode); // stock_money 배열에 data[i].pcode 값이 뒷 배열에 쌓임
			}
			;

			// 해당 제품명의 제품단가
			$("#selectbox").change(function() { // 셀렉트 박스가 바뀌어서 선택이 되면
				select_name = $(this).val(); // 선택한 값을 select_name 변수에 저장
				for (var j = 0; j < data.length; j++) { // data의 배열 길이 만큼 반복
					if (select_name == stock[j]) { // select_name 의 값과 stock[j] 값이 같으면
						$("#stock_money").val(stock_money[j]); // stock_money의 빈 공간에
						// stock_money[j]을 삽입.
						$("#pcode").val(stock_pcode[j]); // stock_money의 빈 공간에
						// stock_money[j]을 삽입.

						// stock_money[j] num1에 저장
						var num1 = stock_money[j];

						$("#num1").on("keyup", function() { // input keyup 이벤트
							var num2 = $("#num1").val(); // 수량 값을 num2에 저장

							sum = num1 * num2; // 단가 * 수량
							$("#total").val(sum); // total의 빈공간에 sum 출력

						});

					}
					;
				}
				;
			});
		}
	});

};

// 온클릭으로 매개변수 2개의 값을 인수에 저장
function insert_company(name, number) {

	$("#bname").val(name); // 인수 값을 id=bame의 value에 저장
	$("#bnumber").val(number); // 인수 값을 id="bnumber의 value에 저장
}
