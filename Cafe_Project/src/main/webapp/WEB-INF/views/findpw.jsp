<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>
</head>
<style>
	body{
		margin: 0;
		padding: 0;
	}	
	.wrap{
		width: 1080px;				
		margin: 0 auto;		
		display: flex;
		justify-content: center;		
	}
	.main{		
		display: flex;
		flex-wrap: wrap;		
		width: 400px;
		margin-top: 120px;
		border: 2px solid lightgray;
		border-radius: 10px 10px 10px 10px;
	}
	.main_id{
		width: 100%;
		display: flex;
		justify-content: space-around;
		margin-bottom: 20px;
		margin-top: 20px;
	}
	.main_pw{
		width: 100%;
		display: flex;
		justify-content: space-around;
		margin-bottom: 20px;
	}
	.main_info{
		width: 100%;
		display: flex;
		justify-content: space-around;
		margin-bottom: 15px;
		margin-top: 15px;
	}
	.main_newid{
		margin: 0 auto;
		width: 300px;
		text-align: center;
		background-color: maroon;		
		font-weight: bold;		
		padding: 10px;
		margin-bottom: 20px;
		border: 1px solid black;
		border-radius: 20px 20px 20px 20px;
	}
	.main_login{
		margin: 0 auto;
		width: 320px;
		height: 43px;
		font-size: 16px;
		text-align: center;
		background-color: black;
		color: white;
		font-weight: bold;
		padding: 10px;
		margin-bottom: 20px;
		margin-top: 20px;
		border: 1px solid black;
		border-radius: 20px 20px 20px 20px;
		cursor: pointer;
	}
	a:visited {color: white; text-decoration: none;}
	a:link {color: white; text-decoration: none;}
	a:hover {color: white; text-decoration: none;}
</style>
<body>
	<div class="wrap">
		<form action="findpw_proc.do" method="post">
			<div class="main">			
				<h1 style="text-align: center; width: 100%;">비밀번호 찾기</h1>
				<div class="main_id">
					<div style="width: 20%; padding: 7px; font-weight: bold;">아이디</div>
					<input type="text" style="font-size: 15px;" name="id">
				</div>
				<div class="main_pw">
					<div style="width: 20%; padding: 7px; font-weight: bold;">핸드폰번호</div>
					<input type="text" style="font-size: 15px;" name="pnum">
				</div>
				<div class="main_info">
					<a href="main.do" style="color: gray;">　홈으로</a>
					<div>　|</div>
					<a href="findid.do" style="color: gray;">아이디 찾기</a>
				</div>
				<input type="submit" value="찾기" class="main_login">
				<a href="login.do" class="main_newid">로그인으로</a>
				
				<!-- href(다른곳 연결), name(자신의홈피안에서 연결) -->			
			</div>
		</form>			
	</div>
</body>
</html>