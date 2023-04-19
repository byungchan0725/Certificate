/**
 * 
 */
function join(){
	if(document.frm.id.value.length == 0){
		alert("참가번호를 입력해 주세요.");
		frm.id.focus();
		return false;
	}
	if(document.frm.name.value.length == 0){
		alert("참가자명을 입력해 주세요.");
		frm.name.focus();
		return false;
	}
	if(document.frm.y.value.length == 0){
		alert("생년월일을 입력해 주세요.");
		frm.y.focus();
		return false;
	}
	if(document.frm.m.value.length == 0){
		alert("생년월일을 입력해 주세요.");
		frm.m.focus();
		return false;
	}
	if(document.frm.d.value.length == 0){
		alert("생년월일을 입력해 주세요.");
		frm.d.focus();
		return false;
	}
	if(document.frm.gender.value.length == 0){
		alert("성별을 선택해 주세요.");
		frm.gender.focus();
		return false;
	}
	if(document.frm.talent.value.length == 0){
		alert("특기를 입력해 주세요.");
		frm.talent.focus();
		return false;
	}
	if(document.frm.agency.value.length == 0){
		alert("소속사를 입력해 주세요.");
		frm.agency.focus();
		return false;
	}
	alert("성공적으로 등록 되었습니다.");
	document.frm.submit();
	return true;
}

function rreset(){
	alert("정보를 초기화 시킵니다.");
	document.frm.reset();
}