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
		margin-top: 50px;	
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
	}
	.main_pw{
		width: 100%;
		display: flex;
		justify-content: space-around;
		margin-bottom: 20px;
	}
	.main_idnum{
		display: flex;
		justify-content: space-between;
	}
	.main_info{
		width: 100%;
		display: flex;
		justify-content: space-around;
		margin-bottom: 20px;
	}
	.main_newid{
		margin: 0 auto;
		width: 80%;
		text-align: center;
		background-color: lightblue;
		padding: 10px;
		margin-bottom: 20px;
		border: 1px solid black;
		border-radius: 20px 20px 20px 20px;
		font-weight: bold;
		font-size: 16px;
	}
	.ajax_id{
		position: absolute;		
		width: 150px;
		font-size: 12px;
		height: 10px;
		right: 1150px;
		top: 228px;		
	}
	.ajax_nn{
		position: absolute;		
		width: 150px;
		font-size: 12px;
		height: 10px;
		right: 1150px;
		top: 283px;		
	}
	
</style>
<body>
	<div class="wrap">
		<form action="newid_proc.do" method="post">		
			<div class="main">		
				<h1 style="text-align: center; width: 100%;">회원가입</h1>
				<div class="main_id">
					<div style="width: 25%; padding: 7px; font-weight: bold;">이름</div>
					<input type="text" style="font-size: 15px;" name="name">
				</div>
				<div class="main_id">
					<div style="width: 25%; padding: 7px; font-weight: bold;">아이디</div>
					<input type="text" style="font-size: 15px;" name="id" id="id">
					<div class="ajax_id" id="result_id"></div>
				</div>
				<div class="main_id">
					<div style="width: 25%; padding: 7px; font-weight: bold;">닉네임</div>
					<input type="text" style="font-size: 15px;" name="nickname" id="nickname">
					<div class="ajax_nn" id="result_nn"></div>
				</div>
				<div class="main_id">
					<div style="width: 25%; padding: 7px; font-weight: bold;">비밀번호</div>
					<input type="text" style="font-size: 15px;" name="pw">
				</div>
				<div class="main_pw">
					<div style="width: 25%; padding: 7px; font-weight: bold;">주민등록번호</div>
					<div class="main_idnum">
						<input type="text" style="width: 88px;" name="idnum">
						<div style="font-size: 20px;">-</div>
						<input type="text" style="width: 88px;" name="idnum">
					</div>
				</div>
				<div class="main_pw">
					<div style="width: 25%; padding: 7px; font-weight: bold;">휴대폰번호</div>
					<input type="text" style="font-size: 15px;" name="pnum">
				</div>
				<div class="main_pw">
					<div style="width: 25%; padding: 7px; font-weight: bold;">이메일</div>
					<input type="text" style="font-size: 15px;" name="email">
				</div>				
				<input type="submit" value="가입하기" class="main_newid">
				<!-- href(다른곳 연결), name(자신의홈피안에서 연결) -->		
			</div>			
		</form>	
	</div>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
	
		$(document).ready(function(){
			$("#nickname").keyup(function(){				
				var nicknamedata ={
							nickname: $("#nickname").val()
						  }	// json 형태의 넘길값 형태 만들기
				//alert(JSON.stringify(nicknamedata));
				// 테스트 코드 : json data를 String 타입으로변경하는 스크립트 메서드
				
				$.ajax({
					type:"post",
					url:"nicknameExsit.do",
					data:JSON.stringify(nicknamedata),
					contentType:"application/json; charset=utf8",
					dataType:"json",
					success: function(args){
						if((args.res_nn) == '사용 가능한 닉네임'){
							$("#result_nn").text(args.res_nn).css("color","blue");
						}else if((args.res_nn) == '이미 존재하는 닉네임'){
							$("#result_nn").text(args.res_nn).css("color","red");
						}
					},
					error:function(args){
						$("#result_nn").html(args.responseText+" 에러!!");
					}
				});
				
			});
		});
		
		$(document).ready(function(){
			$("#id").keyup(function(){				
				var iddata ={
							id: $("#id").val()
						  }	// json 형태의 넘길값 형태 만들기
				//alert(JSON.stringify(data));
				// 테스트 코드 : json data를 String 타입으로변경하는 스크립트 메서드
				
				$.ajax({
					type:"post",
					url:"isIdExsit.do",
					data:JSON.stringify(iddata),
					contentType:"application/json; charset=utf8",
					dataType:"json",
					success: function(args){
						if((args.res) == '사용 가능한 아이디'){
							$("#result_id").text(args.res).css("color","blue");
						}else if((args.res) == '이미 존재하는 아이디'){
							$("#result_id").text(args.res).css("color","red");
						}
					},
					error:function(args){
						$("#result_id").html(args.responseText+" 에러!!");
					}
				});
				
			});
		});
	</script>
</body>
</html>

