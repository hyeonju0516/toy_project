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
	<c:if test="${empty sessionScope.loginUser}">
		<a href="">로그인</a>
		<a href="">회원가입</a>
		<a href="/api/user/list">회원목록</a>
	</c:if>
</body>
</html>