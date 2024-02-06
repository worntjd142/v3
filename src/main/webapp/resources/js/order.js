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
   
   
   	
   $(function(){
	   // btn_Chklist 버튼 클릭시 체크된 Row의 값을 가져온다.
		$("#btn_Chklist").click(function(){ 
			
			// 체크한 테이블의 전체 데이터를 담을 배열 선언;
			var rowData = new Array();
			// 체크한 테이블의 행 데이터를 담을 배열 선언;
			var tdArr = new Array();
			// 체크된 박스;
			var checkbox = $("input[class='choice_Check']:checked");
			
			// 체크된 체크박스 값을 가져온다
			checkbox.each(function(i) {

				// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
				// tr.children() : <tr>의 자식은 <td>이다.
				// td.children() : <td>의 자식은 <input>이다.
				var tr = checkbox.parent().parent().eq(i);
				var td = tr.children();
				var input = td.children();
				
				// 체크된 row의 모든 값을 배열에 담는다.
				// rowData.push(tr.text());
				// console.log(tr.text());
				
				// td.eq(0)=checkbox, td.eq(1)=pname, td.eq(2)=pprice, td.eq(3)=ocount
				// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
				var pname = td.eq(1).text()+", "
				var pprice = td.eq(2).text()+"원, ";
				var ocount = input.eq(3).val()+"EA ";
				
				// 가져온 값을 배열에 담는다.
				tdArr.push(pname);
				tdArr.push(pprice);
				tdArr.push(ocount);
				
				console.log("pname : " + pname);
				console.log("pprice : " + pprice);
				console.log("ocount : " + ocount);

			});
			
			//$("#check_List").html(" * 체크된 Row의 모든 데이터 = "+rowData);	
			$("#check_List").html(tdArr);	
		});
	   });	


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


/*$(function(){

// pcode 배열선언
var pcode = Array();

$('.check_Box').on('click', function(){0
	
	if(pcode.includes($(this).val())) {
		
		pcode = pcode.filter((element) => element !== $(this).val());
		//console.log(pcode);		
		
	} else {
		
		pcode.push($(this).val());		
		
	} 
	
});
});
*/






		
	
	
	

 



	
