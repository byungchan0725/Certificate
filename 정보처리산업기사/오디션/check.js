function check(){
	if(document.frm.artist_id.value.length == 0){
		frm.artist_id.focus();
		alert("참가번호가 입력되지 않았습니다!");
		return false;
	}
	if(document.frm.artist_name.value.length == 0){
		frm.artist_name.focus();
		alert("참가자명이 입력되지 않았습니다!");
		return false;
	}
	if(document.frm.bir1.value.length == 0){
		frm.bir1.focus();
		alert("생년월일이 입력되지 않았습니다!");
		return false;
	}
	if(document.frm.bir2.value.length == 0){
		frm.bir2.focus();
		alert("생년월일이 입력되지 않았습니다!");
		return false;
	}
	if(document.frm.bir3.value.length == 0){
		frm.bir3.focus();
		alert("생년월일이 입력되지 않았습니다!");
		return false;
	}
	if(document.frm.gender.value.length == 0){
		console.log('11');
		alert("성별이 선택되지 않았습니다!");
		return false;
	}
	if(document.frm.talent.value.length == 0){
		frm.talent.focus();
		alert("특기가 선택되지 않았습니다!");
		return false;
	}
	if(document.frm.agency.value.length == 0){
		frm.agency.focus();
		alert("소속사가 입력되지 않았습니다!");
		return false;
	}
	
	alert("참가신청이 정상적으로 완료되었습니다.");
	frm.submit();
	return true;
}

function rreset(){
	alert("정보를 지우고 다시 입력합니다!");
	frm.reset();
}