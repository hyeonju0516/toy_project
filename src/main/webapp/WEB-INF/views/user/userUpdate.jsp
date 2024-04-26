<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 수정</title>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/resources/js/joinCheck.js"></script>
<link rel="stylesheet" href="/resources/css/user.css" />
</head>
<body>
	<div class="update">
		<h2>회원 수정</h2>
		<form id="userUpdate" action="/api/user/${requestScope.userDetail.userId}" method="post" onsubmit="return false">
			<table>
				<tr>
					<th>아이디<span class="point"> *</span></th>
					<td>${requestScope.userDetail.userId}
						<input type="hidden" id="userId" name="userId" value="${requestScope.userDetail.userId}" />
						<input type="hidden" id="userPw" name="userPw" value="${requestScope.userDetail.userPw}" />
						<input type="hidden" id="createDate" name="createDate" value="${requestScope.userDetail.createDate}" />
					</td>
				</tr>
				<tr>
					<th>이름<span class="point"> *</span></th>
					<td>
						<input type="text" id="userName" name="userName" minLength="2" maxLength="20" value="${requestScope.userDetail.userName}" required/>
						<span id ="nameMessage"></span>
					</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>
						<input type="text" id="userNick" name="userNick" minLength="3" maxLength="10" value="${requestScope.userDetail.userNick}" />
						<span id ="nickMessage"></span>
					</td>
				</tr>
				<tr>
					<th>휴대폰번호<span class="point"> *</span></th>
					<td>
						<input type="text" id="userPhone" name="userPhone" minLength="12" maxLength=13" value="${requestScope.userDetail.userPhone}" required/>
						<span id ="phoneMessage"></span>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" id="userEmail" name="userEmail" ${requestScope.userDetail.userEmail} />
						<span id ="emailMessage"></span>
					</td>
				</tr>
			</table>
			<div class="btnBox">
				<button type="reset">초기화</button>
				<button type="submit">수정</button>
			</div>
		</form>
		
		<div>
			<a href="javascript:history.back()">이전페이지</a>
			<a href="/api/user/list">회원목록</a>
		</div>
	</div>
</body>
</html>