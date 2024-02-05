$(function(){
	$(".pluss").css("opacity","0");
	$(".pluss").css("display","inline-block");
})


const characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
let result = "";
const charactersLength = characters.length;
for (let i = 0; i < 6; i++){
	result += characters.charAt(Math.floor(Math.random() * charactersLength));
	}
console.log(result);


function insert_info(code, name, price, pmc, pstock, pmi){
	
	$("#pcodei").text(code);
	$("#pnamei").text(name);
	$("#ppricei").text(price);
	$("#pmci").text(pmc);
	$("#pstocki").text(pstock);
	$("#pmii").text(pmi);
}

//제이쿼리 시작구문
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



function ss(pcode){
	
	var url = "house?pcode=" +pcode+"";
	
	var option = 'width=300, height=150, top=50, left=550, scrollbars=no, resizeable=no'; 
	
	var name = '입고'
	
	window.open(url, option, name);
	
	
}


function togb(number){
	
	
	$("#pluss"+number).css("opacity","1");
}

 function stockplus(pcode, pstock, index) {
	 
	 let plus5 = document.querySelector('#plus5'+index).value;
	 
	 console.log(plus5);
	 
	  $.ajax({
	    url: 'stockplus',
	    dataType: 'json',
	    data : {'dlstn': dlstn}
	    type: 'get',
	    async : false, 
	    success: function(data) {
	    	console.log(data)

	    }
	  })


}


