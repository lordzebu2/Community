<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	.mainboard{
		width: 80%;
		height: 430px;
		margin-left: 20px;	
	}
	.hidden{
		width: 100px;
	}
	.mainboard_title{
		width: 100%;
		font-size: 25px;
		font-weight: bold;
		text-align: center;
		margin-bottom: 15px;
		margin-top: 25px;		
	}
	.mainboard_bar{		
		width: 100%;		
		display: flex;
		justify-content: space-between;
		font-size: 14px;
		font-weight: bold;
		border-bottom: 1px solid black;
		margin-top: 10px;
		margin-bottom: 10px;
		padding-top: 10px;
		padding-bottom: 10px;
	}
	.mainboard_bar_member{
		width: 100%;		
		display: flex;
		justify-content: space-between;
		font-size: 14px;
		font-weight: bold;	
		padding-top: 10px;
		padding-bottom: 5px;
	}
	.mainboard_content{
		width: 100%;		
		display: flex;
		justify-content: space-between;
		font-size: 13px;		
		margin-top: 7px;		
		padding-bottom: 7px;
		border-bottom: 1px solid lightgray;		
	}
	.mainboard_content_member{
		width: 100%;		
		display: flex;		
		font-size: 13px;		
		border-bottom: 1px solid black;
		margin-top: 3px;		
		padding-bottom: 3px;		
	}
	.mainboard_content_member_black{
		width: 100%;		
		display: flex;		
		font-size: 13px;		
		border-bottom: 1px solid black;
		margin-top: 3px;		
		padding-bottom: 3px;
		background-color: orange;
	}
	.paging{
		width: 100%;
		text-align: center;
		margin-top: 10px;
	}
	a:visited {color: black; text-decoration: none;}
	a:link {color: black; text-decoration: none;}
	a:hover {color: blue; text-decoration: underline;}
	.member_admin{
		width: 100%;
		height: 150px;
		border-top: 2px solid red;
		margin-top: 20px;
	}
	.member_admin_bt{		
		height: 25px;				
		display: flex;
		flex-wrap: wrap;
		margin-top: 20px;			
	}	
	.member_black{
		width: 100%;		
		border-top: 2px solid red;	
		margin-top: 62px;
		padding-top: 7px;
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
						<div class="hello">???????????????!!</div>
						<a href="login.do" style="color: blue;">?????????</a>
					</c:if>
					<c:if test="${userinfo ne null }">
						<div class="hello">???????????????!! ${userinfo.name}???!</div>
							<c:if test="${userinfo.nickname eq 'GM?????????' }">
								<a href="main.do?board_lv=10">??????????????????</a>
							</c:if>
						<a href="logout.do" style="color: blue;">????????????</a>
					</c:if>					
				</div>
			</c:if>
			<c:if test="${boardlv eq 10 || boardlv eq 11 }">
				<div class="header_admin">
					<div class="logo">logo</div>
					<div class="admin_text" style="color: white;">???????????? ????????? ?????????.</div>				
					<div class="hello" style="color: white;">???????????????!! ????????????!</div>					
					<a href="logout.do" style="color: blue;">????????????</a>								
				</div>
			</c:if>
			<div class="maintitle">
				<img src="resources/?????????1.jpg" style="width: 100%; height: auto;">
			</div>
			<div class="side">
				<div class="info_choose">
					<div style="margin-top: 5px;">????????????</div>
					<div style="margin-top: 5px;">|</div>
					<div style="margin-top: 5px;">????????????</div>
				</div>
				<div class="info">
					<div class="info_cafe">
						<div class="info_cafe_logo">logo</div>
						<div style="padding: 5px;">
							<div>cafe ????????????</div>
							<div>Since 2021.12.15</div>
						</div>
					</div>
					<div class="info_count">
						<div>????????? : ${all_cnt }???</div>
						<div>????????? ??? : ${all_cnt_member}???</div>
					</div>
					<div class="info_writing">
						<c:if test="${userinfo eq null }">
							<div class="info_writing_bt"><a href="newid.do">????????????</a></div>
						</c:if>
						<c:if test="${userinfo ne null }">
							<div class="info_writing_bt"><a href="write.do">?????? ?????????</a></div>
						</c:if>
					</div>
				</div>
				<div class="index">
					<c:if test="${boardlv eq 0 || boardlv eq 1 || boardlv eq 2 }">			
						<div class="index_community">????????????</div>
						<div class="index_free" style="font-weight: bold;"><a href="main.do?board_lv=0">???????????????</a></div>
						<div class="index_free"><a href="main.do?board_lv=1">?????? ?????????</a></div>
						<div class="index_Q"><a href="main.do?board_lv=2">?????? & ??????</a></div>
					</c:if>
					<c:if test="${boardlv eq 10 || boardlv eq 11}">
						<div class="index_community">????????????</div>
						<div class="index_free" style="font-weight: bold;"><a href="main.do?board_lv=10">???????????????</a></div>
						<div class="index_free"><a href="main.do?board_lv=11">????????????</a></div>
						<div class="member_black">
							<div style="text-align: center; font-weight: bold; padding-bottom: 7px; border-bottom: 2px solid lightgray;">
							?????? ????????? ??????
							</div>
							<c:forEach var="dtob" items="${black }">
								<div style="margin-top: 5px;">??? ????????? : ${dtob.nickname}</div>													
							</c:forEach>
						</div>				
					</c:if>
				</div>				
			</div>
			<c:if test="${boardlv eq 0 || boardlv eq 10}">		
				<div class="mainboard">
					<div class="mainboard_title">???????????????</div>
					<div>${all_cnt }?????? ???</div>
					<div class="mainboard_bar">
						<div>??????</div>
						<div style="width: 500px; text-align: center;">??????</div>
						<div style="width: 100px; text-align: right;">?????????</div>
						<div style="width: 100px; text-align: center;">?????????</div>
						<div>?????????</div>			
					</div>
					<c:forEach var="dto" items="${all_list }">
						<div class="mainboard_content">
							<div>${dto.board_title }</div>
							<div style="width: 500px; text-align: center;"><a href="free_contents.do?allidx=${dto.allidx }">${dto.title }</a></div>
							<div style="width: 80px; text-align: right;">${dto.nickname }</div>
							<div style="width: 100px; text-align: center;">${dto.rdate }</div>
							<div style="width: 30px; text-align: center;">${dto.hit }</div>
						</div>
					</c:forEach>
					<div class="paging">
					<c:forEach var="i" begin="1" end="${all_pageCount}" step="1">
						<a href="main.do?pageNum=${i}&&board_lv=0">[${i}]</a>
					</c:forEach>
					</div>
				</div>
			</c:if>
			
					
			<c:if test="${boardlv eq 1 }">
				<div class="mainboard">
					<div class="mainboard_title">?????? ?????????</div>
					<div>${free_cnt }?????? ???</div>
					<div class="mainboard_bar">
						<div>No</div>
						<div style="width: 500px; text-align: center;">??????</div>
						<div style="width: 100px; text-align: right;">?????????</div>
						<div style="width: 100px; text-align: center;">?????????</div>
						<div>?????????</div>			
					</div>
					<c:forEach var="dtof" items="${free_list }">
						<div class="mainboard_content">
							<div>${dtof.idx }</div>
							<div style="width: 500px; text-align: center;"><a href="free_contents.do?allidx=${dtof.allidx }">${dtof.title }</a></div>
							<div style="width: 80px; text-align: right;">${dtof.nickname }</div>
							<div style="width: 100px; text-align: center;">${dtof.rdate }</div>
							<div style="width: 30px; text-align: center;">${dtof.hit }</div>
						</div>
					</c:forEach>
					<div class="paging">
					<c:forEach var="f" begin="1" end="${free_pageCount}" step="1">
						<a href="main.do?pageNum=${f}&&board_lv=1">[${f}]</a>
					</c:forEach>
					</div>
				</div>	
			</c:if>
			
			
			<c:if test="${boardlv eq 2 }">
				<div class="mainboard">
					<div class="mainboard_title">?????? & ??????</div>
					<div>${qa_cnt }?????? ???</div>
					<div class="mainboard_bar">
						<div>No</div>
						<div style="width: 500px; text-align: center;">??????</div>
						<div style="width: 100px; text-align: right;">?????????</div>
						<div style="width: 100px; text-align: center;">?????????</div>
						<div>?????????</div>			
					</div>
					<c:forEach var="dtoq" items="${qa_list }">
						<div class="mainboard_content">
							<div>${dtoq.idx }</div>
							<div style="width: 500px; text-align: center;"><a href="free_contents.do?allidx=${dtoq.allidx }">${dtoq.title }</a></div>
							<div style="width: 80px; text-align: right;">${dtoq.nickname }</div>
							<div style="width: 100px; text-align: center;">${dtoq.rdate }</div>
							<div style="width: 30px; text-align: center;">${dtoq.hit }</div>
						</div>
					</c:forEach>
					<div class="paging">
					<c:forEach var="q" begin="1" end="${qa_pageCount}" step="1">
						<a href="main.do?pageNum=${q}&&board_lv=2">[${q}]</a>
					</c:forEach>
					</div>
				</div>	
			</c:if>
					

			<c:if test="${boardlv eq 11 }">
				<div class="mainboard">
					<div class="mainboard_title">????????????</div>
					<div>?????????: ${all_cnt_member}???</div>
					<div class="mainboard_bar">
						<div style="width: 30px; text-align: left;">No</div>
						<div style="width: 110px; text-align: center;">??????</div>
						<div style="width: 130px; text-align: center;">?????????</div>
						<div style="width: 130px; text-align: center;">?????????</div>
						<div style="width: 160px; text-align: center;">????????????</div>
						<div style="width: 160px; text-align: center;">???????????????</div>
						<div style="width: 150px; text-align: center;">?????????</div>																										
					</div>
					<c:forEach var="dto" items="${member_list }">																		
						<c:forEach var="dtob" items="${black }">															
							<c:if test="${dto.nickname eq dtob.nickname }">
								<c:set var="black_List">black, list, white</c:set>																				
							</c:if>							
						</c:forEach>							
						<c:if test="${not empty black_List }">						
							<div class="mainboard_content_member_black" style="cursor: pointer;">
								<div class="member_info" style="width: 30px; text-align: left;">${dto.idx }</div>
								<div class="member_info" style="width: 110px; text-align: center;">${dto.name }</div>
								<div class="member_info" style="width: 130px; text-align: center;">${dto.id }</div>
								<div class="member_info" style="width: 130px; text-align: center;">${dto.nickname }</div>
								<div class="member_info" style="width: 160px; text-align: center;">${dto.idnum }</div>
								<div class="member_info" style="width: 160px; text-align: center;">${dto.pnum }</div>
								<div class="member_info" style="width: 150px; text-align: right;">${dto.email }</div>							
							</div>
						</c:if>									
						<c:if test="${empty black_List }">
							<div class="mainboard_content_member" style="cursor: pointer;">
								<div class="member_info" style="width: 30px; text-align: left;">${dto.idx }</div>
								<div class="member_info" style="width: 110px; text-align: center;">${dto.name }</div>
								<div class="member_info" style="width: 130px; text-align: center;">${dto.id }</div>
								<div class="member_info" style="width: 130px; text-align: center;">${dto.nickname }</div>
								<div class="member_info" style="width: 160px; text-align: center;">${dto.idnum }</div>
								<div class="member_info" style="width: 160px; text-align: center;">${dto.pnum }</div>
								<div class="member_info" style="width: 150px; text-align: right;">${dto.email }</div>																				
							</div>
						</c:if>
						<c:if test="${not empty black_List }">
							<c:remove var="black_List"/>
						</c:if>																
					</c:forEach>
					<div class="paging">
					<c:forEach var="q" begin="1" end="${m_pageCount}" step="1">
						<a href="main.do?pageNum=${q}&&board_lv=11">[${q}]</a>
					</c:forEach>
					</div>
					<div class="member_admin">
						<div class="mainboard_bar_member">						
							<div style="width: 80px; text-align: center;">??????</div>
							<div style="width: 100px; text-align: center;">?????????</div>
							<div style="width: 120px; text-align: center;">?????????</div>
							<div style="width: 150px; text-align: center;">????????????</div>
							<div style="width: 150px; text-align: center;">???????????????</div>
							<div style="width: 150px; text-align: center;">?????????</div>
							<div style="width: 120px; text-align: center;">????????????</div>																				
						</div>
						<form action="member_update.do" method="post">
							<input id="idxvalue" type="text" name="idx" style="display: none;">
							<input id="namevalue" style="width: 80px;" type="text" name="name">
							<input id="idvalue" style="width: 100px; background-color: lightgray;" type="text" name="id" readonly>
							<input id="nicknamevalue" style="width: 100px; background-color: lightgray;" type="text" name="nickname" readonly>
							<input id="idnumvalue" style="width: 150px;" type="text" name="idnum">
							<input id="pnumvalue" style="width: 140px;" type="text" name="pnum">
							<input id="emailvalue" style="width: 140px; margin-right: 10px;" type="text" name="email">
							<select class="black_select" name="black">
								<option value="????????????">??????????????????</option>
								<option value="????????????">????????????</option>
								<option value="????????????">????????????</option>
							</select>
							<div style="float: right;">
								<div class="member_admin_bt">									
									<input type="submit" value="????????????" style="cursor: pointer; background-color: white;">
									<input style="margin-left: 15px; cursor: pointer; background-color: white;" type="submit" value="????????????" formaction="member_delete.do">						
								</div>
							</div>
						</form>						
					</div>					
				</div>
				<script src="http://code.jquery.com/jquery-latest.min.js"></script>
				<script>
                	$(document).ready(function () {
                		$(".mainboard_content_member, .mainboard_content_member_black").click(function () {
							$("#idxvalue").val($(this).children(".member_info").eq(0).text());							
						});
                		$(".mainboard_content_member, .mainboard_content_member_black").click(function () {
							$("#namevalue").val($(this).children(".member_info").eq(1).text());
							//val - input, input??? ?????????????????? value??? ???????????? text, ?????? html??? ??????
						});
                		$(".mainboard_content_member, .mainboard_content_member_black").click(function () {
							$("#idvalue").val($(this).children(".member_info").eq(2).text());							
						});
                		$(".mainboard_content_member, .mainboard_content_member_black").click(function () {
							$("#nicknamevalue").val($(this).children(".member_info").eq(3).text());							
						});
                		$(".mainboard_content_member, .mainboard_content_member_black").click(function () {
							$("#idnumvalue").val($(this).children(".member_info").eq(4).text());							
						});
                		$(".mainboard_content_member, .mainboard_content_member_black").click(function () {
							$("#pnumvalue").val($(this).children(".member_info").eq(5).text());							
						});
                		$(".mainboard_content_member, .mainboard_content_member_black").click(function () {
							$("#emailvalue").val($(this).children(".member_info").eq(6).text());							
						});               		
					});					
                </script>   				
			</c:if>
		</div>
	</div>
</body>
</html>
