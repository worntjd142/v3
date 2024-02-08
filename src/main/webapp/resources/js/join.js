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
        if ($text.val().length === 8) { //전화번호뒷자리
            $text.val($text.val() + '-');
        }
    }
				
    return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
});

});



/* 회원가입 정규식 */
function chkForm(f) {	
	
	// #useid값을 idVal변수에 저장한다.
	let idVal = $('#useid').val();	
	let psVal = $('#usePassword').val();	
	let nameVal = $('#usename').val();	
	let numVal = $('#usenum').val();	
	let telVal = $('#usetel').val	
	
	
	// /^[a-z0-9]+$/은 a-z소문자 아무거나, 0-9숫자 아무거나 사용 가능하다.
	// + 는 영소문자, 숫자가 한번씩 나와야한다는 뜻이다.
	let idValCheck = /^[a-z0-9]+$/;
	let psValCheck = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d~!@#$%^&*()+|=]{8,20}$/; // 영소문자, 숫자 혼합해서 6자 입력해야 사용 가능하다.
	let nameValCheck = /^[가-힣]{1~20}$/;
	let numValCheck = /^[0-9]*$/;
	let telValCheck = /^[0-9]*$/;
	
	// 만약에 idVal값에 정규식이 되어있는지 그리고 idVal.길이값이 6보다 작은지 체크하고
	// test() == 찾는 문자열이 들어있는지 아닌지를 알려준다.
	if(!idValCheck.test(idVal) || idVal.length < 6) {
		
		// 정규식에 맞지 않으면 알림창 띄우고
		alert("아이디는 영소문자, 숫자로 구성된 6글자 이상으로 생성해주세요.")		
		// 글씨색 빨간색으로 변경
		$('#useid').css({'color':'red'});
		// 다 실행후 커서가 #useid로 이동된다.
		$('#useid').focus();
		return false;
	} if(!psValCheck.test(psVal) || psVal.length < 8) {
		
		// 정규식에 맞지 않으면 알림창 띄우고
		alert("비밀번호는 영소문자, 숫자로 구성된 6글자로 생성해주세요.")		
		// 글씨색 빨간색으로 변경
		$('#usePassword').css({'color':'red'});
		// 다 실행후 커서가 #useid로 이동된다.
		$('#usePassword').focus();
		return false;
	} if(nameValCheck.test(nameVal) != nameVal) {
		
		// 정규식에 맞지 않으면 알림창 띄우고
		alert("회사 상호를 입력해주세요.")		
		// 글씨색 빨간색으로 변경
		$('#usename').css({'color':'red'});
		// 다 실행후 커서가 #useid로 이동된다.
		$('#usename').focus();
		return false;
	} if(!numValCheck.test(numVal) || numVal.length == 10) {
		
		// 정규식에 맞지 않으면 알림창 띄우고
		alert("사업자번호는 숫자 10자 입니다.")		
		// 글씨색 빨간색으로 변경
		$('#usenum').css({'color':'red'});
		// 다 실행후 커서가 #useid로 이동된다.
		$('#usenum').focus();
		return false;
	} if(!telValCheck.test(telVal) || telVal.length == 10) {
		
		// 정규식에 맞지 않으면 알림창 띄우고
		alert("전화번호는 숫자로만 입력해주세요.")		
		// 글씨색 빨간색으로 변경
		$('#usenum').css({'color':'red'});
		// 다 실행후 커서가 #useid로 이동된다.
		$('#usenum').focus();
		return false;
	} 
	
	return true;

};

