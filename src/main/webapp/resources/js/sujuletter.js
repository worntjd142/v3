
//pdf 함수
function issuance(){

	let ono = $("#pdf_ono").val();
	$.ajax({
		type : "GET", // method 타입 get
		url : "issuance_pdf", // url value
		data : {'ono':ono}, //  
		dataType: 'json',
		async : false,
		success : function(data) {
			console.log(data)
					//pdf파일 함수 호출
					dopdf(data.cname, data.uuid, data.cemail)
			//부모 페이지 화면을 새로고침 (order 화면)		
			opener.parent.location.reload();
				
			
				
		}
			
	})
	
}

//입퇴원 확인서 다운로드
function dopdf(cname, uuid, cemail) {
	
	const pdf = document.getElementById('print_page');
	
	file = cname +'.'+uuid;
	
		html2canvas(pdf).then(canvas => {
		saveImg(canvas.toDataURL('image/png'), ""+file+".jpg");
		
	});
		
		const saveImg = (uri, filename) => {
		    let link = document.createElement('a');

		    document.body.appendChild(link);

		    link.href = uri;
		    link.download = filename;
		    link.click();

		    document.body.removeChild(link);
			//pdf파일 만들고 난 후 3초 경과 후 widnow.closes를 호출
		    mail(cname, uuid,cemail) 
		}
		//pdf파일 만들고 난 후 3초 경과 후 widnow.closes를 호출
			
}


function mail(cname,uuid,cemail){
	console.log(cname,uuid,cemail)
	send = {"cname":cname,"uuid":uuid, 'cemail':cemail};
	

	$.ajax({
		type : "GET", // method 타입 get
		url : "mailsend", // url value
		data : send, //  jsno 타입의 send를 컨트롤러로 값을 전달
		dataType: 'json',
		async : false,
		success : function(data) {
			console.log(data)
			// 업데이트가 성공해서 1의 값이 반환되면 
			if(data == 1){
				closes();
			}
		}
	})
}


//팝업창 닫기
let closes = function (){
	//호출 되면 팝업창 닫기.
	window.close();
}