function join(){
	if(document.frm.id.value.length == 0){
		frm.id.focus();
		alert("과목코드를 입력해 주세요");
		return false;
	}
	if(document.frm.name.value.length == 0){
		frm.name.focus();
		alert("과목명을 입력해 주세요");
		return false;
	}
	if(document.frm.credit.value.length == 0){
		frm.credit.focus();
		alert("학점을 입력해 주세요");
		return false;
	}
	if(document.frm.lecturer.value.length == 0){
		alert("담당강사를 선택해 주세요");
		return false;
	}
	if(document.frm.week.value.length == 0){
		alert("요일을 선택해 주세요");
		return false;
	}
	if(document.frm.start_hour.value.length == 0){
		frm.start_hour.focus();
		alert("시작시간을 입력해 주세요");
		return false;
	}
	if(document.frm.end_hour.value.length == 0){
		frm.end_hour.focus();
		alert("종료시간을 선택해 주세요");
		return false;
	}
	alert("교과목 등록이 완료되었습니다!");
	frm.submit();
	return true;
}

function search(){
	window.location = 'list.jsp';
	alert("목록페이지로 이동합니다.");
	return true;
}

function rreset(){
	frm.reset();
	alert("정보를 다시 입력합니다.");
}

function edit(){
	if(document.frm.id.value.length == 0){
		frm.id.focus();
		alert("과목코드를 입력해 주세요");
		return false;
	}
	if(document.frm.name.value.length == 0){
		frm.name.focus();
		alert("과목명을 입력해 주세요");
		return false;
	}
	if(document.frm.credit.value.length == 0){
		frm.credit.focus();
		alert("학점을 입력해 주세요");
		return false;
	}
	if(document.frm.lecturer.value.length == 0){
		alert("담당강사를 선택해 주세요");
		return false;
	}
	if(document.frm.week.value.length == 0){
		alert("요일을 선택해 주세요");
		return false;
	}
	if(document.frm.start_hour.value.length == 0){
		frm.start_hour.focus();
		alert("시작시간을 입력해 주세요");
		return false;
	}
	if(document.frm.end_hour.value.length == 0){
		frm.end_hour.focus();
		alert("종료시간을 선택해 주세요");
		return false;
	}
	alert("교과목 수정이 완료되었습니다!");
	frm.submit();
	return true;
}