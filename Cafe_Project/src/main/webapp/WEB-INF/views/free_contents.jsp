<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
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
		display: flex;
		flex-wrap: wrap;
	}
	.header{
		width: 100%;
		height: 30px;
		display: flex;
		justify-content: space-between;		
	}
	.header_admin{
		width: 100%;
		height: 30px;
		display: flex;
		justify-content: space-between;
		background-color: red;
	}
	.maintitle{
		width: 100%;
		height: 250px;		
	}
	.side{
		width: 18%;
		height: 550px;
		margin-top: 25px;		
	}
	.info_choose{
		display: flex;
		justify-content: space-around;
		height: 30px;
		border-bottom: 1px solid lightgray;
		border-top: 2px solid blue;
	}
	.info_cafe{		
		padding: 13px;
		border-bottom: 1px solid lightgray;
		display: flex;
		flex-wrap: wrap;
		font-size: 14px;
	}
	.info_cafe_logo{
		width: 50px;
		height: 50px;
		border: 1px solid black;
		border-radius: 10px 10px 10px 10px;
		text-align: center;		
	}
	.info_count{
		padding: 15px;
		border-bottom: 1px solid lightgray;
	}
	.info_writing{		
		height: 50px;
		border-bottom: 2px solid blue;
	}
	.info_writing_bt{
		height: 23px;
		width: 85%;		
		text-align:center;
		background-color: lightgreen;
		padding: 8px;
		border-radius: 10px 10px 10px 10px;
		margin-top: 10px;
		margin-left: 7px;
	}
	.info{
		width: 100%;			
	}
	.index{
		width: 100%;			
	}
	.index_community{
		text-align: center;
		padding: 7px;
		border-bottom: 2px solid lightgray;
		font-weight: bold;
	}
	.index_free{
		text-align: center;
		padding: 7px;
	}
	.index_Q{
		text-align: center;
		padding: 7px;
	}
	.index_all{
		text-align: center;
		padding: 7px;		
	}	
	.board_wrap{
		width: 79%;
		margin-left: 20px;
		margin-top: 25px;
	}	
	.mainboard{
		width: 100%;		
		border: 1px solid lightgray;
		border-radius: 7px 7px 7px 7px;
	}
	.hidden{
		width: 100px;
	}
	.free_contents{
		width: 92%;		
		margin: 0 auto;
		margin-top: 30px;		
	}
	
	a:visited {color: black; text-decoration: none;}
	a:link {color: black; text-decoration: none;}
	a:hover {color: black; text-decoration: none;}
	
	.free_bt{				
		display: flex;
		flex-wrap: wrap;		
		padding-bottom: 10px;
		width: 100%;			
	}
	.free_bt a{
		width: 50px;
		font-size: 12px;
		height: 15px;
		background-color: lightblue;
		text-align: center;
		margin: 10px;
		padding: 10px;
		border-radius: 5px 5px 5px 5px;
		font-weight: bold;
		box-shadow: 1px 1px 1px 1px rgb(80, 80, 80);
	}
	.hart{
		width: 100%;
		display: flex;
		margin-top: 30px;
		padding-bottom: 10px;
		border-bottom: 1px solid lightgray;
	}
	.coment_title{
		font-size: 20px;
		font-weight: bold;
		margin-top: 15px;
		margin-bottom: 25px;
	}
	.comment_input_wrap{
		width: 100%;
		height: 110px;
		margin-top: 20px;
		border: 2px solid lightgray;
		border-radius: 7px 7px 7px 7px;
	}
	.comment_input_main{
		width: 96%;
		height: 80px;		
		margin: 15px;		
	}
	.comment{
		width: 100%;
		height: 25px;
		font-size: 14px;
	}
	.comment_bt{
		font-size: 13px; 
		margin-top: 7px;
		background-color: white;
		color: black;
		cursor: pointer;
	}
</style>
<body>
	<div class="wrap">
		<div class="main">
			<c:if test="${boardlv eq 0 || boardlv eq 1 || boardlv eq 2 }">
				<div class="header">
					<div class="logo">logo</div>
					<div class="hidden"></div>
					<c:if test="${userinfo eq null }">
						<div class="hello">안녕하세요!!</div>
						<a href="login.do" style="color: blue;">로그인</a>
					</c:if>
					<c:if test="${userinfo ne null }">
						<div class="hello">안녕하세요!! ${userinfo.name}님!</div>
							<c:if test="${userinfo.nickname eq 'GM데프런' }">
								<a href="main.do?board_lv=10">관리자페이지</a>
							</c:if>
						<a href="logout.do" style="color: blue;">로그아웃</a>
					</c:if>					
				</div>
			</c:if>
			<c:if test="${boardlv eq 10 }">
				<div class="header_admin">
					<div class="logo">logo</div>
					<div class="admin_text" style="color: white;">관리자용 페이지 입니다.</div>				
					<div class="hello" style="color: white;">안녕하세요!! 관리자님!</div>					
					<a href="logout.do" style="color: blue;">로그아웃</a>								
				</div>
			</c:if>
			<div class="maintitle">
				<img src="resources/이미지1.jpg" style="width: 100%; height: auto;">
			</div>
			<div class="side">
				<div class="info_choose">
					<div style="margin-top: 5px;">카페정보</div>
					<div style="margin-top: 5px;">|</div>
					<div style="margin-top: 5px;">나의정보</div>
				</div>
				<div class="info">
					<div class="info_cafe">
						<div class="info_cafe_logo">logo</div>
						<div style="padding: 5px;">
							<div>cafe 커뮤니티</div>
							<div>Since 2021.12.15</div>
						</div>
					</div>
					<div class="info_count">						
						<div>전체글 : ${all_cnt }개</div>					
						<div>가입자 수 : ${all_cnt_member}명</div>
					</div>
					<div class="info_writing">
						<c:if test="${userinfo eq null }">
							<div class="info_writing_bt"><a href="newid.do">회원가입</a></div>
						</c:if>
						<c:if test="${userinfo ne null }">
							<div class="info_writing_bt"><a href="write.do">카페 글쓰기</a></div>
						</c:if>
					</div>
				</div>
				<div class="index">
					<c:if test="${boardlv eq 0 || boardlv eq 1 || boardlv eq 2 }">			
						<div class="index_community">커뮤니티</div>
						<div class="index_free" style="font-weight: bold;"><a href="main.do?board_lv=0">전체글보기</a></div>
						<div class="index_free"><a href="main.do?board_lv=1">자유 게시판</a></div>
						<div class="index_Q"><a href="main.do?board_lv=2">질문 & 답변</a></div>
					</c:if>
					<c:if test="${boardlv eq 10 }">		
						<div class="index_community"><a href="main.do?board_lv=10">전체글보기</a></div>					
					</c:if>
				</div>
			</div>			
				<div class="board_wrap">
					<div class="mainboard">				
						<div class="free_contents">
							<c:forEach var="dto" items="${list }">
								<div style="width: 100%; font-size: 14px; color: green; margin-bottom: 10px;">
									<c:if test="${dto.board_title == '자유게시판' }">						
										<a href="main.do?board_lv=1" style="text-decoration: none; color: green;">자유 게시판 ></a>
									</c:if>
									<c:if test="${dto.board_title != '자유게시판' }">							
										<a href="main.do?board_lv=2" style="text-decoration: none; color: green;">질문 & 답변 ></a>
									</c:if>									
								</div>
								<div style="width: 100%; font-size: 32px; margin-bottom: 15px;">${dto.title }</div>
								<div style="width: 100%; border-bottom: 1px solid lightgray; padding-bottom:10px;">
									<div style="font-size: 14px; font-weight: bold; margin-bottom: 7px;">${dto.nickname }</div>
									<div style="font-size: 13px; color: gray;">${dto.rdate}. ${dto.tt}　　조회수: ${dto.hit}</div>
									<c:set var="nickname" value="${dto.nickname }"/>
								</div>
								<div style="margin-top: 25px; margin-bottom: 50px; padding-bottom: 25px;">${dto.contents}</div>							
								<div class="hart">									
									<div>댓글${c_cnt }개</div>
								</div>
							</c:forEach>								
								<div class="coment_title">댓글</div>
							<c:forEach var="dto_c" items="${list_cm }">
								<div style="border-bottom: 1px solid lightgray; padding-bottom: 10px; margin-bottom: 10px;">
									<div style="font-size: 14px; font-weight: bold;">${dto_c.nickname}</div>
									<div style="font-size: 14px; margin-bottom: 9px; margin-top: 9px;">${dto_c.contents_c}</div>
									<div style="display: flex; color:gray; font-size: 13px;">
										<div>${dto_c.rdate_c}. ${dto_c.stime_cc}</div>										
									</div>
								</div>
							</c:forEach>
							<form action="comment_input.do">
								<div class="comment_input_wrap">
									<div class="comment_input_main">
										<c:if test="${userinfo eq null }">
											<div>로그인 하시고 댓글을 남겨보세요!</div>
										</c:if>
										<c:if test="${userinfo ne null }">
											<div style="display: flex;">
												<div style="font-size: 15px; margin-bottom: 7px; font-weight: bold;">${userinfo.nickname}</div>
												<div style="font-size: 14px;">님 댓글을 남겨보세요!</div>
											</div>										
											<textarea class="comment" name="contents_c"></textarea>
											<div style="float: right;">
												<input class="comment_bt" type="submit" value="등록">											
											</div>											
											<input type="hidden" value="${userinfo.nickname}" name="nickname">
											<input type="hidden" value="<%=request.getParameter("allidx")%>" name="idx_c">			
										</c:if>
									</div>
								</div>
							</form>						
						</div>										
					</div>
				<div style="float: right;">
					<c:if test="${userinfo.nickname eq nickname || userinfo.nickname eq 'GM데프런' }">		
						<div class="free_bt">
							<a href="write.do">글쓰기</a>
							<a href="update.do?allidx=<%=request.getParameter("allidx")%>">글수정</a>
							<a href="board_delete.do?allidx=<%=request.getParameter("allidx")%>">글삭제</a>
						</div>
					</c:if>				
				</div>
			</div>						
		</div>
	</div>
</body>
</html>
