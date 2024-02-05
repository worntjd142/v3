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