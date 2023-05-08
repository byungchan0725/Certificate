function join(){
	if(document.frm.pname.value.length == 0){
		alert("선수이름을 입력해 주세요.");
		frm.pname.focus();
		return false;
	}
	if(document.frm.pposition.value.length == 0){
		alert("포지션을 선택해 주세요.");
		frm.pposition.focus();
		return false;
	}
	if(document.frm.pdate.value.length == 0){
		alert("선수등록일을 입력해 주세요.");
		frm.pdate.focus();
		return false;
	}
	if(document.frm.pgrade.value.length == 0){
		alert("선수등급을 선택해 주세요.");
		return false;
	}
	alert("선수등록이 완료되었습니다.");
	frm.submit();
	return true;
}

function rreset(){
	alert("정보를 지우고 처음부터 다시 입력합니다.");
	frm.reset();
}

function edit(){
	if(document.frm.pname.value.length == 0){
		alert("선수이름을 입력해 주세요.");
		frm.pname.focus();
		return false;
	}
	if(document.frm.pposition.value.length == 0){
		alert("포지션을 선택해 주세요.");
		frm.pposition.focus();
		return false;
	}
	if(document.frm.pdate.value.length == 0){
		alert("선수등록일을 입력해 주세요.");
		frm.pdate.focus();
		return false;
	}
	if(document.frm.pgrade.value.length == 0){
		alert("선수등급을 선택해 주세요.");
		return false;
	}
	alert("선수 수정이 완료되었습니다.");
	frm.submit();
	return true;
}