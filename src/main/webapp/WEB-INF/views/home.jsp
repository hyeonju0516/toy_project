<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<style>
	#wrap {
	  margin:0 auto;
	  padding:20px;
	  width:500px;
	}
	
	#wrap img{
		display:block;
		width:100%;
		height:auto;
	}
	
	#wrap > div > *{
		text-align:center;
	}
	
	#wrap > div >p{
		margin-bottom:30px;
	}
	
	#wrap > div a {
	  padding: 5px 10px;
	  background-color: #0056b3;
	  color: #fff;
	  text-decoration: none;
	  border-radius: 5px;
	  transition: background-color 0.3s;
	}
	
	#wrap > div a:hover {
	  background-color: #003b7a;
	}
</style>
</head>
<body>
	<div id="wrap">
		<img alt="메인이미지" src="/resources/img/mainImg.png">
		<div>
			<c:if test="${empty sessionScope.loginId}">
				<p>로그인 후 이용해 주세요.</p>
				<div>
					<a href="/api/user/login">로그인</a>
					<a href="/api/user/join">회원가입</a>
				</div>
			</c:if>
			<c:if test="${not empty sessionScope.loginId}">
				<p>로그인 아이디 : ${sessionScope.loginId}</p>
				<div>
					<a href="/api/user/logout">로그아웃</a>
					<a href="/api/user/list">회원목록</a>
				</div>
			</c:if>
		</div>
	</div>
</body>
</html>