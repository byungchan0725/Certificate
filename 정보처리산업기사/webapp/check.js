function join(){
	if(document.frm.name.value.length == 0){
		frm.name.focus();
		alert("선수이름을 입력해 주세요.");
		return false;
	}
	if(document.frm.position.value.length == 0){
		alert("포지션을 선택해 주세요.");
		return false;
	}
	if(document.frm.date.value.length == 0){
		frm.date.focus();
		alert("선수등록일을 입력해 주세요.");
		return false;
	}
	if(document.frm.team.value.length == 0){
		frm.team.focus();
		alert("소속팀을 선택해 주세요.");
		return false;
	}
	alert("선수등록이 완료되었습니다!");
	frm.submit();
	return true;
}

function rreset(){
	alert("정보를 지우고 다시 입력합니다.");
	frm.reset();
}

function edit(){
	if(document.frm.name.value.length == 0){
		frm.name.focus();
		alert("선수이름을 입력해 주세요.");
		return false;
	}
	if(document.frm.position.value.length == 0){
		alert("포지션을 선택해 주세요.");
		return false;
	}
	if(document.frm.date.value.length == 0){
		frm.date.focus();
		alert("선수등록일을 입력해 주세요.");
		return false;
	}
	if(document.frm.team.value.length == 0){
		frm.team.focus();
		alert("소속팀을 선택해 주세요.");
		return false;
	}
	alert("정보수정이 완료되었습니다!");
	frm.submit();
	return true;
}