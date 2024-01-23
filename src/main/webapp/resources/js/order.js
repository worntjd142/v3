$(function() {

	$("#check_all").on("click", function() { // check_all을 클릭 시 반응
		let chk = $(this).is(":checked");// check_all 의 체크여부 확인 (체크가 되어있으면
		// ture, 체크가 안돼어있으면 false값을 반환);
		if (chk) {
			$("input:checkbox[id='check_all']").prop("checked", true);
		} // chk1이 ture라면 모든 체크박스를 체크
		else {
			$("input:checkbox[id='check_all']").prop("checked", false);
		}// chk1이 false라면 체크박스의 체크를 해제
	})

	$("#check_button").on("click", function() {
		let chk = $("#check_all").is(":checked"); // 버튼을 클릭 시 check_all의 체크여부를
		// chk에 저장
		if (chk) {
			$("input:checkbox[id='check_all']").prop("checked", false);
		} // chk이 ture라면 모든 체크박스의 체크를 해제
		else {
			$("input:checkbox[id='check_all']").prop("checked", true);
		}// chk이 false라면 모든 체크박스 체크
	})

})

function sujuletter(bno, day, uuid, name, count, total, product, price, number,pcode, sujubox) {

	let url = "sujuletter?day=" + day + "&sujubox=" + sujubox + "&bno=" + bno + "&uuid=" + uuid + "&name=" + name + "&count=" + count + "&total=" + total + "&product=" + product + "&price=" + price + "&number=" + number + "&pcode=" + pcode + "";

	let option = 'width=800, height=1000, left=1000, scrollbars=no, resizeable=no, menubar=no, ';

	window.open(url, name, option);

}

// 날짜 검색 후 검색 날짜 유지
//$(function(){
//
//const form = document.querySelector('#search_day');
//
//
//		
//	}
//	
//});