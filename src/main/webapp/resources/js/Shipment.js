opener.parent.location.reload();


 프린트
//프린트 함수 선언
function prints(){
	// 함수 호출 될 경우 프린트 객체 실행하게 되면  1. window.onbeforeprint = beforePrint;를 실행
	window.print();
}

function beforePrint() { // 2.  프린트 화면에서 필요없는 버튼들을 삭제
	$("#prtin_after").css("display", "none");
	$("#print_page").css("display", "block");
}

function afterPrint() { //3.window.onafterprint = afterPrint; 언급으로 실행 
	//프린트 취소 or 출력 누른 이후 페이지 새로고침
	location.reload()
}

window.onbeforeprint = beforePrint;  //프린트 하기 전 실행 객체
window.onafterprint = afterPrint; // 프린트 후 실행 객체
*/