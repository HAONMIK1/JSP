/**
 * 
 */
 function writeSave(){
	alert("1");

	if($(input[name=writer]).val()==""){
		alert("이름 써");
		return false;
	}
		if($(input[name=subject]).val()==""){
		alert("제목 써")
		return false;
	}
		if($(input[name=email]).val()==""){
		alert("이이메일 써")
		return false;
	}
		if($(textarea[name=content]).val()==""){
		alert("내용 써")
		return false;
	}
		if($(input[name=passwd]).val()==""){
		alert("비번 써")
		return false
		;
	}
}