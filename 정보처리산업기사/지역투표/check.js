function join(){
	if(document.frm.jumin.value.length == 0){
		alert("주민번호가 입력되지 않았습니다.");
		frm.jumin.focus();
		return false;
	}
	if(document.frm.name.value.length == 0){
		alert("성명 입력되지 않았습니다.");
		frm.name.focus();
		return false;
	}
	if(document.frm.m_no.value.length == 0){
		alert("후보번호가 입력되지 않았습니다.");
		return false;
	}
	if(document.frm.v_time.value.length == 0){
		alert("투표시간 입력되지 않았습니다.");
		frm.v_time.focus();
		return false;
	}
	if(document.frm.v_area.value.length == 0){
		alert("투표장소 입력되지 않았습니다.");
		frm.v_area.focus();
		return false;
	}
	if(document.frm.v_confirm.value.length == 0){
		alert("유권자확인 선택되지 않았습니다.");
		return false;
	}
	alert("투표하기 정보가 정상적으로 등록되었습니다.");
	frm.submit();
	return true;
}

function rreset(){
	alert("정보를 지우고 다시 입력합니다.");
	frm.reset();
	return false;
}