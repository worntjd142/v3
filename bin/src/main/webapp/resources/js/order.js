$(function(){
	//수주서로 이동

	$("#sujuletter").on("click",function(){

		//팝업 띄울 페이지.
		let url="sujuletter"

	    let option = 'width=1000, height=1100, left=1000, scrollbars=no, resizeable=no'; 
			 
	    let name = '수 주 서'; 

			window.open(url, name, option);
	    
	    
	})
})