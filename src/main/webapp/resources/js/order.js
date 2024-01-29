let ono = Array(); // ono 전역변수 선언

$(function() {
   
   $("#check_all").on("click", function() {  // 메인 체크박스를 클릭 시.
      
      let od = Array(); // od. 지역변수 선언
      
      let chk = $(this).is(":checked"); // 메인 체크박스의 값을 확인. ('false' or 'true')
      
      if (chk) { // 'true'면 작동
         $("input:checkbox[class='check_all']").prop("checked", true); //class = "check_all"의 체크박스를 모두 체크 = 모두 true값으로 만듬.
         
         for(i = 0; i < 10; i++){ // 화면에 출력할 페이지 갯수만큼 반복 (10개)
        	 
         od.push($("#check_val"+i).is(":checked")); // 반복하면서 #check_val의 값을 배열 od에 저장. (들어가는 값은 'false' or 'true')
         
         if(od[i] == true){// od의 인덱스를 이용하여 true인 값만 지정하여 ono의 값을 배열ono에 저장.
            ono.push($("#check_val"+[i]).val());
            
            }
      }
         
} 
      
      else { // 'false'면 작동 
         $("input:checkbox[class='check_all']").prop("checked", false); //class = "check_all"의 체크박스를 모두 체크해제 = 모두 false값으로 만듬
      
         for(i = 0; i < 10; i++){   // 그리고 10번 반복
        	 ono.pop(); // ono의 배열안에 저장된 배열을 제거
         }
      }
   })

//   $("#check_button").on("click", function() {
//      let chk = $("#check_all").is(":checked"); // 버튼을 클릭 시 check_all의 체크여부를
//      // chk에 저장
//      if (chk) {
//         $("input:checkbox[class='check_all']").prop("checked", false);
//         
//         //전체 체크 확인
//         let c = $("input:checkbox[class='check_all']").is(":checked");
//         console.log(c);
//      } // chk이 ture라면 모든 체크박스의 체크를 해제
//      else {
//         $("input:checkbox[class='check_all']").prop("checked", true);
//         
//         //전체 체크 확인
//         let c = $("input:checkbox[class='check_all']").is(":checked");
//         console.log(c);
//      }// chk이 false라면 모든 체크박스 체크
//   })
   

$("#ocount").on("blur", function(){
	
	$("#total").val($("#pprice").val() * $("#ocount").val());
})
   
   
})

function update(){

   
   $.ajax({
          url: 'all_issuance',
          data: {'ono':ono},
          dataType: 'json',
          contentType :   "application/x-www-form-urlencoded; charset=UTF-8",
          type: 'get',
          success: function(data) {

        	  	if(data == 1 ){  //업데이트가 성공하여 1의 결과값을 반환했다면
        	  		// 새로고침
        	  		location.reload();
        	  		
        	  	}else{// 업데이트가 실패하여 0의 결과값을 반환했다면
        	  		
        	  		alert("오류, 새로고침"); // 오류라고 알리고 
        	  		location.reload(); // 새로고침.
        	  	}
        	  	
   
          }
        })
   
}



