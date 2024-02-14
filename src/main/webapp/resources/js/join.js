/* 사업자번호, 전화번호에 자동으로 하이픈 */
$(function(){

$('input[name=usenumber]').keydown(function(event) {
    var key = event.charCode || event.keyCode || 0;
    $text = $(this); 
				
    if (key !== 8 && key !== 9) {
        if ($text.val().length === 3) {
            $text.val($text.val() + '-');
        }
        if ($text.val().length === 6) {
            $text.val($text.val() + '-');
        }
    }
				
    return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
    // Key 8번 백스페이스, Key 9번 탭, Key 46번 Delete 부터 0 ~ 9까지, Key 96 ~ 105까지 넘버패트
	// 한마디로 JQuery 0 ~~~ 9 숫자 백스페이스, 탭, Delete 키 넘버패드외에는 입력못함
});

$('input[name=usetel]').keydown(function(event) {
    var key = event.charCode || event.keyCode || 0;
    $text = $(this); 
				
    if (key !== 8 && key !== 9) {
        if ($text.val().length === 3) { //지역번호
            $text.val($text.val() + '-');
        }
        if ($text.val().length === 7) { //전화번호뒷자리
            $text.val($text.val() + '-');
        }
    }
				
    return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
});

});



/* 회원가입 정규식 */

// 010-1111-2222 라는 전호번호는 "숫자3개", "-", "숫자4개", "-", "숫자4개" 로 이루어져 있는데,
// const regex = /\d{3}-\d{4}-\d{4}/; 
// (\d는 숫자를 의미하고, {} 안의 숫자는 갯수를 의미한다.) 

$(function(){
	
	// 회원가입을 위한 정규식 선언;
	
				// 영어 대소문자 또는 숫자로 시작하고 끝나며 4~10자리인지 검사한다.
	let checkID = /^[A-Za-z0-9]{4,10}$/;
				// 영어 대소문자 또는 숫자로 시작하고 끝나며 4자리인지 검사한다.
	let checkPW = /^[a-zA-Z0-9]{4}$/;
				// 한글 또는 영어로 시작하고 끝나며 3~50자리인지 검사한다.
	let checkName = /^[가-힣a-zA-Z]{3,50}$/;
				// 숫자3개 - 숫자2개 - 숫자5개인지 검사한다.
	let checkNum =  /^[0-9]{3}-[0-9]{2}-[0-9]{5}$/;
				// 숫자2~3개 - 숫자3~4개 - 숫자4개인지 검사한다.
	let checkTEL = /^[0-9]{3}-[0-9]{3}-[0-9]{4}$/;
	
	
	function checkForm() {
		
		// <input id=useid>태그에서 Focusot이 됫을때 이벤트 발생한다.
		$("#useid").blur(function(){
			// 만약에, #useid의 값이 정규식 checkID와 일치하지 않는지 확인하고
			if(!checkID.test($("#useid").val())) {
				// 일치하지 않는다면 마우스포커스가 #userID로 이동한다.
				$(".id").text("ID는 영어와 숫자를 조합하여 4~10자리로 생성해주세요.").css("color","#CD5C5C")
				$("#userID").focus();  
				// 폼 제출을 중지하고, 사용자가 값을 수정할 수 있도록 return한다.
                return false;
			} 	// 정규식과 일치한다면,
				else {
					$(".id").text("사용가능한 아이디입니다.").css("color", "#3f8ef7");
					// #userPW로 포커스이동한다.
					$("#userPW").focus();
                    return true;
			}			
		});
		
		// 비밀번호
		$("#usePassword").blur(function(){
			
			if(!checkPW.test($("#usePassword").val())) {				
				$(".pw").text("비밀번호는 4자리로 생성해주세요.").css("color","#CD5C5C");
				$("#userPW").focus();  				
                return false;
			} 	
				else {
					$(".pw").text("사용가능한 비밀번호입니다.").css("color", "#3f8ef7");					
					$("#usename").focus();
                    return true;
			}
		});
		
		// 이름
		$("#usename").blur(function(){
			
			if(!checkName.test($("#usename").val())) {				
				$(".name").text("상호명을 입력해주세요.").css("color","#CD5C5C");
				$("#usename").focus();  				
                return false;
			} 	
				else {
					$(".name").text("사용가능한 상호명입니다.").css("color", "#3f8ef7");					
					$("#usenum").focus();
                    return true;
			}
		});
		
		// 사업자번호
		$("#usenum").blur(function(){
			
			if(!checkNum.test($("#usenum").val())) {				
				$(".number").text("가입하실 회사 사업자번호 10자리를 입력해주세요.").css("color","#CD5C5C");
				$("#usenum").focus();  				
                return false;
			} 	
				else {
					$(".number").text("사용가능한 사업자번호입니다.").css("color", "#3f8ef7");					
					$("#usetel").focus();
                    return true;
			}
		});
		
		// 연락처
		$("#usetel").blur(function(){
			
			if(!checkTEL.test($("#usetel").val())) {				
				$(".tel").text("하이픈을 제외한 숫자로 000-000-0000 형식으로 입력해주세요.").css("color","#CD5C5C");
				$("#usetel").focus();  				
                return false;
			} 	
				else {
					$(".tel").text("사용가능한 연락처입니다.").css("color", "#3f8ef7");					
					
                    return true;
			}
		});
		
	}
	checkForm();
	
		// 만약에 가입하기 버튼을 눌렀을때
		$(".btn-lg").click(function(){
			// ID값이 빈공백이거나 PW값이 빈공백이거나 ... input값이 빈공백 이라면,
			if( $("#useid").val() == "" || $("#usePassword").val() == "" || $("#usename").val() == "" ||
					$("#usenum").val() == "" || $("#usetel").val() == "" ) {
				// 알림창을 띄운다.
				alert("빈칸을 입력해주세요.");
				return false;
				// 그리고 또 만약에 정규식 양식에 맞지 않는다면,
			} else if ( !checkID.test($("#useid").val()) || !checkPW.test($("#usePassword").val()) ||
					!checkName.test($("#usename").val()) || !checkNum.test($("#usenum").val()) ||
					!checkTEL.test($("#usetel").val()) ) {
				alert("양식에 맞춰 입력해주세요.");
				return false;
			} 	// 만약에 위 양식이 다 맞다면,
				else {
				// 알림창을 띄운다!
				alert("회원가입이 완료 되었습니다! :)")
				return true;
			}
			
			
		});
	
});

















