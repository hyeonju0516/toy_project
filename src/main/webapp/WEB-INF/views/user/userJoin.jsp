<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="/resources/js/joinCheck.js"></script>
<link rel="stylesheet" href="/resources/css/user.css" />
</head>
<body>
	<div class="join">
		<h2>회원 가입</h2>
		<form id="userJoin" action="/api/user/join" method="post" onsubmit="return false">
			<table>
				<tr>
					<th>아이디<span class="point"> *</span></th>
					<td>
						<div class="idDupBox">
							<input type="text" id="userId" name="userId" minLength="3" maxLength="13" required />
							<button type="button" id="idCheck" disabled>ID중복검사</button>
						</div>
						<span id="idMessage"></span>
					</td>
				</tr>
				<tr>
					<th>비밀번호<span class="point"> *</span></th>
					<td>
						<input type="password" id="userPw" name="userPw" minLength="8" maxLength="15" required/>
						<span id="pwMessage"></span>
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인<span class="point"> *</span></th>
					<td>
						<input type="password" id="userPw2" minLength="4" maxLength="15" required/>
						<span id="pw2Message"></span>
					</td>
				</tr>
				<tr>
					<th>이름<span class="point"> *</span></th>
					<td>
						<input type="text" id="userName" name="userName" minLength="2" maxLength="20" required/>
						<span id ="nameMessage"></span>
					</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>
						<input type="text" id="userNick" name="userNick" minLength="3" maxLength="10" />
						<span id ="nickMessage"></span>
					</td>
				</tr>
				<tr>
					<th>휴대폰번호<span class="point"> *</span></th>
					<td>
						<input type="text" id="userPhone" name="userPhone" minLength="12" maxLength=13" required/>
						<span id ="phoneMessage"></span>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" id="userEmail" name="userEmail" />
						<span id ="emailMessage"></span>
					</td>
				</tr>
			</table>
			<div class="btnBox">
				<button type="reset">초기화</button>
				<button type="submit">가입</button>
			</div>
		</form>
		
		<div>
			<a href="javascript:history.back()">이전페이지</a>
		</div>
	</div>
</body>
</html>