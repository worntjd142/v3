const characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
let result = "";
const charactersLength = characters.length;
for (let i = 0; i < 6; i++){
	result += characters.charAt(Math.floor(Math.random() * charactersLength));
	}
console.log(result);

//제이쿼리 시작구문
$(document).ready(function(){
	$("#randomcode").val(result);
	
	pcode = '';
	
	$(".ss0").on("click",function(){
		$.ajax({
		type : "POST", // controller post/get따라서 바뀜
		url : "p_detail", // controller 도메인 주소 똑같이
		data : [], // 
		dataType : 'json',
		async : false,
		success : function(data) {
			console.log(data.length)
				
				}

	})
})
	
	
	
	
	
	
	
	
	
	
	
	
})