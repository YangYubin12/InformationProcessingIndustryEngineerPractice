function vot(){
	if(frm.no.value.length == 0){
		alert("주민번호가 입력되지 않았습니다!");
		frm.no.focus();
		return fasle;
	}
	else if(frm.name.value.length == 0){
		alert("성명이 입력되지 않았습니다!");
		frm.name.focus();
		return fasle;
	}
	else if(frm.vno.value.length == 0){
		alert("후보번호가 선택되지 않았습니다!");
		frm.vno.focus();
		return fasle;
	}
	else if(frm.vtime.value.length == 0){
		alert("투표시간이 입력되지 않았습니다!");
		frm.vtime.focus();
		return fasle;
	}
	else if(frm.vplace.value.length == 0){
		alert("투표장소가 입력되지 않았습니다!");
		frm.vplace.focus();
		return fasle;
	}
	
	else if(frm.r_check.value.length == 0){
		alert("유권자확인이 선택되지 않았습니다!");
		frm.r_check.focus();
		return fasle;
	}

	else {
		alert("투표하기 정보가 정상적으로 등록되었습니다!");
		document.frm.submit();
		return true;
	}	
}
function res(){
	alert("정보를 지우고 처음부터 다시 입력합니다!");
	document.frm.reset();
}