<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
</head>
<body>
	<div class="userList">
		<table>
			<tr>
				<th>회원ID</th>
				<th>닉네임</th>
				<th>이름</th>
				<th>이메일주소</th>
				<th>가입일</th>
				<th></th>
			</tr>
			
			<c:if test="${not empty requestScope.userList}">
				<c:forEach var="u" items="${requestScope.userList}">
					<tr>
						<td><a href="detail?id=${u.id}">${u.id}</a></td>
						<td>${u.nickname}</td>
						<td>${u.name}</td>
						<td>${u.email}</td>
						<td>${u.createDate}</td>
						<td><a href="detail?id=${u.id}">상세보기</a></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</div>
</body>
</html>