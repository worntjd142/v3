$(function(){

	// 운송자 위치 팝업
	$("#mapmarker").on("click", function(){
		
		var url = "mapPopup";
		var name = "운송자 위치 확인";
		var opction = "width=500, height=500, top=100, left=200, location=no";
		
		window.open(url, name, opction);
		
	});
	
});
