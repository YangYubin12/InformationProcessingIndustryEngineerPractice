function add(){
	if(frm.id.value.length==0){
		alert("교과목코드가 입력되지 않았습니다.");
		frm.id.focus();
		return false;
	}
	else if(frm.name.value.legnth==0){
		alert("과목명이 입력되지 않았습니다.");
		frm.name.focus();
		return false;
	}
	else if(frm.credit.value.legnth==0){
		alert("학점이 입력되지 않았습니다.");
		frm.credit.focus();
		return false;
	}
	else if(frm.lecturer.value.legnth==0){
		alert("담당강사가 입력되지 않았습니다.");
		frm.lecturer.focus();
		return false;
	}
	else if(frm.week.value.legnth==0){
		alert("요일이 입력되지 않았습니다.");
		frm.week.focus();
		return false;
	}
	else if(frm.start_week.value.legnth==0){
		alert("시작시간이 입력되지 않았습니다.");
		frm.start_week.focus();
		return false;
	}
	else if(frm.end_hour.value.legnth==0){
		alert("종료시간이 입력되지 않았습니다.");
		frm.end_hour.focus();
		return false;
	}
	else{
		alert("교과목 등록이 완료 되었습니다!");
		return true;
	}
}
function modify(){
	alert("교과목 수정이 완료되었습니다!");
	document.frm.submit();
	return true;
}
function res(){
	alert("교과목 수정이 취소되었습니다.");
	document.frm.reset();
}