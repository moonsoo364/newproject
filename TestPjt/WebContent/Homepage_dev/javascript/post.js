function writeCheck()
{
	var form =document.postform;
	if(!form.title.value)
	{
		alert("제목을 적어주세요");
		form.title.focus();
		return;
	}
	
	if(!form.name.value)//form안에 name 값이 없을 때
	{
		alert("이름을 적어주세요"); //경고창 띄움
		form.name.focus();
		return;
	}
	if(!form.content.value)
	{
		alert("내용을 적어주세요"); 
		form.content.focus();
		return;
	}
	
	
}