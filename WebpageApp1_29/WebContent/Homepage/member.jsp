<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="css/style_member1.css">
        <link rel="stylesheet" href="css/style_idx.css">
    <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" ></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="javascript/main.js" defer></script>
    <script src="javascript/AddressApi.js" ></script>
    <script type="text/javascript" src="javascript/register.js"></script>
    <script>
	  function idCheck(id) {
			form = document.register_form;
			if (id == "") {
				alert("아이디를 입력해 주세요.");
				form.id.focus();
				return;
			}
			url = "idCheck.jsp?id=" + id;
			window.open(url, "IDCheck", "width=300,height=150");
		}
	  </script>
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
    
    <!-- 아이디 중복확인 함수-->
    
</head>
<body>
    <nav class="navbar">
            <div class="navbar_title">
                <i class="fas fa-chalkboard-teacher"></i>
                <a href="Index.jsp">Hello IT World!</a>
            </div>

            <ul class="navbar_menu">
                <li><a href="Introduce.jsp">Introduce</a></li>
                <li><a href="list.jsp">Board</a></li>
                <li><a href="">Statistics</a></li>     
            </ul>
            <ul class="navbar_reg">
                <li><i class="fas fa-sign-in-alt"></i><a href="login.jsp">&nbsp;login</a></li> 
                <li><i class="fas fa-registered"></i><a href="member.jsp">&nbsp;register</a></li>
                
            </ul>

            <a href="#" class="navbar_togle">
                <i class="fas fa-sliders-h"></i>
            </a>
    </nav>
    <div class="wrap_contents">
    	<div class=content_header>
    		<h1 class=h1_title>정보 입력</h1>
    		<p class="p_info">회원가입</p>
    		<center>
    			<table class="tbl">
    				<FORM name=register_form action="memberProc.jsp">
    						<tr>
    							<td >아이디</td>
    							<td>
    							<input name="id" type="text" size="15">
    							<input type="button" value="중복확인" onClick="idCheck(this.form.id.value)">
    							</td>
    						</tr>
    						<tr>
    							<td >비밀번호</td>
    							<td>
    							<input name="pwd" type="password"size="15">
    							</td>
    						</tr>
    						<tr>
    							<td >비밀번호 확인</td>
    							<td>
    							<input name='repwd' type="password" size="15">
    							</td>
    						</tr>
    						 <tr>
    							<td >이름</td>
    							<td>
    							<input name='name' type="text" size="20">
    							</td>
    					    </tr>
    					    <tr>
							 	<td>성별</td>
									<td>
										남<input type="radio" name="gender" value="1" checked> 
										여<input type="radio" name="gender" value="2">
									</td>
							</tr>
							<tr>
								<td>생년월일</td>
								<td><input name="birthday" size="6">
									ex)830815</td>
								
							</tr>
								<tr>
									<td>Email</td>
									<td><input name="email" size="30">
								</td>
							</tr>
							
    						<tr>
    							<td>우편번호</td>
    							<td>
    								<input name="zipcode" size="5" id="postcode" readonly>
    						    	<input type="button" value="우편번호 찾기" onclick="execDaumPostcode()">
    							</td>
    						</tr>
    						<tr>
    							<td>주소</td>
    							<td><input name="address" size="30" id="address" readonly></td>
    						</tr>
    						<tr>
    							<td>상세주소</td>
    							<td><input name="detailaddress"  size="20" id="detailAddress" ></td>
    						</tr>
    						
							<tr>
							<td>가입유형</td>
								<td><select name="usertype">
										<option value="0" selected>선택하세요.
										<option value="관리자">관리자
										<option value="유저">유저
								</select></td>
							</tr>
							<tr>
							<td colspan="3" align="center">
								   <input type="button" value="회원가입" onclick="inputCheck()">
							</td>
							</tr>
    				</FORM>
    			</table>
    		</center>
    	</div>
	
			
			
    </div>
    
	<footer class="footer_style">
		<div class="footer_alarm">
			<div class="div_left"><i class="fas fa-exclamation-triangle"></i></div>
			<div class="div_right">
				<div class="footer_ment1">해당 게시판은 컴퓨터,모바일,하드웨어,소프트웨어 등의 뉴스와 정보를 공유하는 곳입니다
				<br>게시판에서 생기는 개인 및 단체의 권리 침해 문의는 aptx15hibr@naver.com로 해주세요.
				</div>
	 			
	 		</div>			
		</div>
	</footer>
</body>
</html>