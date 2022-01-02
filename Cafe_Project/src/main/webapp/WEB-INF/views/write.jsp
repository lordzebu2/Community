<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	body{
		margin: 0;
		padding: 0;
	}	
	.wrap{
		width: 1080px;		
		margin: 0 auto;		
	}
	.main{
		display: flex;
		flex-wrap: wrap;
	}
	.header{
		width: 100%;
		height: 30px;
		display: flex;
		justify-content: space-between;		
	}
	.maintitle{
		width: 100%;
		height: 250px;		
	}
	.hidden{
		width: 100px;
	}
	.choose{
		width: 100%;
		height: 30px;
		background-color: green;
		font-size: 14px;
		margin-top: 17px;
		margin-bottom: 10px;
		padding-top: 10px;
	}
	a:visited {color: white; text-decoration: none;}
	a:link {color: white; text-decoration: none;}
	a:hover {color: white; text-decoration: none;}
	.title{
		font-size: 32px;
		font-weight: bold;
		width: 100%;
		border-bottom: 1px solid black;
		padding-bottom: 10px;
	}
	.title_select{
		width: 100%;
		margin-top: 10px;
		margin-bottom: 10px;
		display: flex;		
	}
	.titletx{
		width: 500px;
		font-size: 17px;
		margin-right: 10px;		
	}
	.board_select{
		width: 200px;
		font-size: 17px;
	}
	.contents{
		width: 100%;
		height: 400px;
		margin-top: 10px;
		font-size: 17px;
	}
	.button{
		margin-top: 10px;
		width: 100px;		
	}
</style>
</head>
<body>
	<div class="wrap">
		<div class="main">
			<div class="header">
				<div>logo</div>
				<div class="hidden"></div>
				<c:if test="${userinfo eq null }">
					<div>안녕하세요!!</div>
					<a href="login.do" style="color: blue;">로그인</a>
				</c:if>
				<c:if test="${userinfo ne null }">
					<div>안녕하세요!! ${userinfo.name}님!</div>
					<a href="logout.do" style="color: blue;">로그아웃</a>
				</c:if>			
			</div>
			<div class="maintitle">
				<img src="resources/이미지1.jpg" style="width: 100%; height: auto;">
			</div>
			<div class="choose">
				<a href="main.do">　ㆍ메인으로</a>
			</div>
			<div class="title">카페 글쓰기</div>
			<form action="write_input.do" method="post" enctype="multipart/form-data">
				<div class="title_select">
					<div>제목 :　</div>
					<input type="text" class="titletx" name="title">
					<select class="board_select" name="board">
						<option>게시판 선택</option>
						<option value="자유게시판">자유게시판</option>
						<option value="질문&답변">질문&답변</option>
					</select>
				</div>
				<input type="file" name="file">
				<textarea class="contents" name="contents"></textarea>
				<input type="hidden" name="nickname" value="${userinfo.nickname }">
				<input type="hidden" name="idx" value="<%=request.getParameter("idx") %>">
				<input type="submit" value="등록" class="button">
			</form>
		</div>
	</div>
</body>
</html>