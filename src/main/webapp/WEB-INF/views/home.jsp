<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
</head>
<body>
	<c:if test="${empty sessionScope.loginId}">
		<a href="/api/user/login">로그인</a>
		<a href="/api/user/join">회원가입</a>
	</c:if>
	<c:if test="${not empty sessionScope.loginId}">
		<a href="/api/user/logout">로그아웃</a>
		<a href="/api/user/list">회원목록</a>
	</c:if>
	
</body>
</html>