function chkForm() {
	var f = document.frm; 	
	
	if (f.name.value == '') {
		alert("고객 이름을 입력해 주십시오.");
		return false;  
	}
	
	if (f.address.value == '') {
		alert("주소를 입력해 주십시오.");
		return false; 
	}
	
	if (f.phone.value == '') {
		alert("연락처를 입력해 주십시오.");
		return false; 
	}
	
	if (f.grade.value == '') {
		alert("고객 등급을 선택해 주십시오.");
		return false; 
	}
	
	f.submit(); 
}

function chkDelete(id) {
	const result = confirm("해당 고객을 삭제하시겠습니다?");
	
	if (result) {
		const url = location.origin;
		
		// 페이지 이동(request)
		location.href = url + "/jsp_customer/delete?id=" + id;
	} else {
		return false;
	}
}