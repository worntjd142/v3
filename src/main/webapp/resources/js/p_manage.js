const characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
let result = "";
const charactersLength = characters.length;
for (let i = 0; i < 6; i++){
	result += characters.charAt(Math.floor(Math.random() * charactersLength));
	}
console.log(result);

function insert_code(pcode , pname, pprice, pmc, pstock, pmi){
	
	$("#p_codei").text(pcode);
	$("#p_namei").text(pname);
	$("#p_pricei").text(pprice);
	$("#p_pmci").text(pmc);
	$("#p_stocki").text(pstock);
	$("#p_pmii").text(pmi);
}

//제이쿼리 시작구문
$(document).ready(function(){
	$("#randomcode").val(result);

	
	
//	$("#aaa").on("click",function(){
//		$.ajax({
//		type : "POST", // controller post/get따라서 바뀜
//		url : "p_detail", // controller 도메인 주소 똑같이
//		data : [], // 
//		dataType : 'json',
//		async : false,
//		success : function(data) {
//			for (var i = 0 ; i < data.length ; i++){
//				$("#p_code").val(data[i].pcode)
//			}
//				
//				}
//
//	})
//})
	

})

