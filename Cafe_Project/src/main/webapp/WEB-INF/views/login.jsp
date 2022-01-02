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
	}
	.main{
		margin: 0 auto;
		margin-top: 120px;	
		display: flex;
		flex-wrap: wrap;
		width: 400px;
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
		margin-bottom: 20px;
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
		font-size: 17px;
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
		<form action="member_ssesion.do" method="post">
			<div class="main">							
				<h1 style="text-align: center; width: 100%;">로그인</h1>				
				<div class="main_id">
					<div style="width: 10%; padding: 7px; font-weight: bold;">ID</div>
					<input type="text" style="font-size: 15px;" name="id">
				</div>
				<div class="main_pw">
					<div style="width: 10%; padding: 7px; font-weight: bold;">PW</div>
					<input type="password" style="font-size: 15px;" name="pw">
				</div>
				<div class="main_info">
					<a href="findid.do" style="color: black;">아이디 찾기</a>
					<div>|</div>
					<a href="findpw.do" style="color: black;">비밀번호 찾기</a>
				</div>
				<input type="submit" value="로그인" class="main_login">
				<a href="newid.do" class="main_newid">회원가입</a>
				<!-- href(다른곳 연결), name(자신의홈피안에서 연결) -->			
			</div>
		</form>		
	</div>
</body>
</html>