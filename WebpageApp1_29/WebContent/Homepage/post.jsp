<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글쓰기</title>
    <link rel="stylesheet" href="css/style_idx.css">
    <link rel="stylesheet" href="css/style_post.css">
    <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" ></script>
    <script src="javascript/main.js" defer></script>
    <script src="javascript/post.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
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
                <li><i class="fas fa-registered"></i><a href="member.jsp" target="_sub">&nbsp;register</a></li>
                
            </ul>

            <a href="#" class="navbar_togle">
                <i class="fas fa-sliders-h"></i>
            </a>
    </nav>
    <!-- 글쓰기 내용 입니다. -->
    <div class="container" >
		<h2 class="post">글쓰기</h2>
		<form name="postform" method="post" action="BoardPost" enctype="multipart/form-data">
		<!-- multipart/form-data 모든 문자를 인코딩하지 않음  -->
			<table class= "content_table" cellpadding="3">
				<tr>
					<td>제목</td>
					<td><input name="title" size="50" maxlength="30"></td>
				</tr>
				<tr >
					<td >작성자</td>
					<td class="textleft"><input name="name" size="10" maxlength="8"></td>
				</tr>
				<tr>
				<td>
					분류
				</td>
				<td class="textleft">
    				<select name="sort" style="height:30px;">
							<option value="공지사항">공지사항</option>
							<option value="잡담">잡담</option>
							<option value="나눔">나눔</option>
							<option value="이벤트">이벤트</option>
    			   </select>
    			</td>
    			</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="content" rows="10" cols="52"></textarea></td>
				</tr>
				<tr>
					<td>파일 찾기</td>
					<td class="textleft"><input type="file" name="filename" size="50" maxlength="50"></td>
				</tr>
				<tr>
					<td colspan="2" >
						<input type="submit" value="등록"onclick="javascript:writeCheck();">&nbsp;&nbsp;
						<input  type="button" value="목록" onclick="javascript:location.href='list.jsp'">
					</td>
				</tr>
					
			</table>
			<input type="hidden" name="ip" value="<%=request.getRemoteAddr() %>">
		</form>
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