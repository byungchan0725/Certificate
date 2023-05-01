function join(){
	if(document.frm.resvno.value.length == 0){
		frm.resvno.focus();
		alert("예약번호가 입력되지 않았습니다!");
		return false;
	}
	if(document.frm.empno.value.length == 0){
		frm.empno.focus();
		alert("사원번호가 입력되지 않았습니다!");
		return false;
	}
	if(document.frm.resvdate.value.length == 0){
		frm.resvdate.focus();
		alert("근무일자가 입력되지 않았습니다!");
		return false;
	}
	if(document.frm.seatno.value.length == 0){
		frm.seatno.focus();
		alert("좌석번호가 입력되지 않았습니다!");
		return false;
	}
	
	alert("참가신청이 정상적으로 등록되었습니다!");
	frm.submit();
	return true;
}

function rreset(){
	frm.reset();
	alert("정보를 지우고 처음부터 다시 입력합니다!");
}

function search(){
	if(document.frm2.empno.value.length == 0){
		frm2.empno.focus();
		alert("사원번호가 입력되지 않았습니다!");
		return false;
	}
	else{
		frm2.submit();
		return true;
	}
}

function home(){
	window.location ="index.jsp";
}