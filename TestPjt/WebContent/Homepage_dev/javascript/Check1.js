function checkall(){
	if(!checkUserId(register_form.id.value)){
		return false;
	}
	else if(!checkPassword(register_form.pwd.value,register_form.repwd.value,register_form.id.value)){
		return false;
	}
	else if(!checkRepwd(register_form.repwd.value)){
		return false;
	}
	else if(!checkName(register_form.name.value)){
		return false;
	}
	else if(!checkBirthday(register_form.birthday.value)){
		return false;
	}
	else if(!checkEmail(register_form.email.value)){
		return false;
	}
	else if(!checkAddress(register_form.address.value)){
		return false;
	}
	else if(!checkUsertype(register_form.usertype.value)){
		return false;
	}
	return true;
}
//공백 확인 함수
function checkExistData(value,dataName){
	if(value == ""){
		alert(dataName + " 입력 해주세요!");
		return false;
	}
	return true;
}
//id 유효성 검사 함수
function checkUserId(id){
	//Id가 제대로 입력되었는 지 확인하기
	if(!checkExistData(id,"아이디를"))
		return false;
	var idRegExp = /^[a-zA-z0-9]{4,12}&/; //id 유효성 검사
	if (!idRegExp.text(id)){
		alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해주세요.")
		register_form.id = "";
		register_form.focus;
		return false;
	}
	return true; //검사 완료
}
//비밀번호 유효성 검사 함수
function checkPassword(id,pwd,repwd){
	//비밀번호가 입력되었는 지 확인 하기
	if(!checkExistData(pwd,"비밀번호를"))
		return false;
	//비밀번호 확인이 입력되었는 지 확인
	if(!checkExistData(repwd,"비밀번호 확인을"))
		return false;
		
	var pwdRegExp = /^[a-zA-z0-9]{4,12}$/;
	
	if (!pwdRegExp.test(pwd)){
		alert("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
		register_form.value="";
		register_form.focus();
		return false;
	}
	//두 비밀번호가 틀릴 때
	if(pwd!=repwd){
		alert("두 비밀번호가 맞지 않습니다.");
		register_form.pwd.value="";
		register_form.repwd.value="";
		register_form.repwd.focus();
		return false;
	}
	//아이디와 비밀번호가 같을 때
	if (id == password){
		alert("아이디와 비밀번호는 같을 수 없습니다!");
		register_form.pwd.value="";
		register_form.repwd.value="";
		register_form.repwd.focus();
		return false;
	}
	return true; //확인이 완료되었을 때
	
}