/**
 * 
 */
 function writeSave(){
	alert("1");

	if($(input[name=id]).val()==""){
		alert("아이디");
		$(input[name=id]).focus();
		return false;
	}else if(use =="impossible"){
		
	}else if(ischeck==false){
		
	}
}
function duplicated(){
	if($('input[name="id"]').val()==""){
			alert("아이디를 입력하세요");
			isBlank = true;
			return;	
		}
		isBlank = false;
		
		
		$.ajax({
				url : "id_check_proc.jsp",
				data : ({
						userid : $('input[name="id"]').val()
				}), // userid = kim
				success : function(data){
					//alert("data:"+data);
					if($.trim(data)=='YES'){
						$('#idmessage').html("<font color=blue>사용 가능합니다.</font>");
						$('#idmessage').show();
						use = "possible";
					}else{
						$('#idmessage').html("<font color=red>이미 사용중인 아이디입니다.</font>");
						$('#idmessage').show();
						use = "impossible";
					}
				}	
		}); // ajax 
}
