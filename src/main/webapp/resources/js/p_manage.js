
// 제품 코드 랜덤값 중복뜨면 오류 중복뜰확률 로또 당첨확률의 1/266
const characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
let result = "";
const charactersLength = characters.length;
for (let i = 0; i < 6; i++){
	result += characters.charAt(Math.floor(Math.random() * charactersLength));
	}
console.log(result);


// 제품 상세정보
function insert_info(pimage, pmc, pmi, pname, exd, houseld, housed){
	$("#pimagei *").remove();
	
	let img;
	
	img = "<img src='../resources/image/product/"+pimage+"' width ='500px' height = '500px'>"
	
	$("#pimagei").append(img);
	$("#pmci").text(pmc);
	$("#pmii").text(pmi);
	$("#pnamei").text(pname);
	$("#exdi").text(exd);
	$("#houseldi").text(houseld);
	$("#housedi").text(housed);
}

//창고온도 ajax
$(document).ready(function(){
	
	$("#randomcode").val(result);
	
	var getData = function() {
		  $.ajax({
		    url: 'w_temple',
		    dataType: 'json',
		    type: 'get',
		    async : false, 
		    success: function(data) {
		    	console.log(data);
		    	$("#wtemple").html(data);
	
		    }
		  })
	

	}
	setInterval(getData, 5000);


	
})

// 입고 창 숨기기
$(function(){
	$(".pluss").css("opacity","0");
	$(".pluss").css("display","inline-block");
})



// 입고 창 보이게
function togb(number){
	
	
	$("#pluss"+number).css("opacity","1");
}

// 입고버튼  재고+
 function stockplus(pcode, pstock, index, houseld) {
	 
	 let plus5 = document.querySelector('#plus5'+index).value;
	 
	 console.log(plus5);
	 
	  $.ajax({
	    url: 'housing',
	    dataType: 'json',
	    data : {'pcode': pcode, 'pstock' : pstock, 'plus5' : plus5, 'houseld' : houseld},
	    type: 'post',
	    async : false, 
	    success: function(data) {
	    	console.log(data)
	    	location.reload()
	    }
	  })


}


