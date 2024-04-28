<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세 내역</title>
<link rel="stylesheet" href="/resources/css/user.css" />
</head>
<body>
	<div class="detail">
		<h2>회원 상세 내역</h2>
		<table>
			<tr>
				<th>아이디</th>
				<td>${requestScope.userDetail.userId}</td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td>${requestScope.userDetail.userNick}</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${requestScope.userDetail.userName}</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>${requestScope.userDetail.userPhone}</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${requestScope.userDetail.userEmail}</td>
			</tr>
			<tr>
				<th>가입일</th>
				<td>${requestScope.userDetail.createDate}</td>
			</tr>
		</table>

		<div>
			<div class="btnBox">
				<c:if test="${sessionScope.loginId == requestScope.userDetail.userId}">
					<a href="/api/user/${requestScope.userDetail.userId}?jCode=U">수정하기</a>
				</c:if>
			</div>
			<a href="javascript:history.back()">이전페이지</a>
			<a href="/api/user/list">회원목록</a>
		</div>
	</div>
</body>
</html>