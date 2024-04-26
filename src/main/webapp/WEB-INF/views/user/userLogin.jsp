<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인페이지</title>
</head>
<body>
	<div>
		<h2>로그인</h2>
	    <form action="/api/user/login" method="post">
	        <div>
		        <div>
			        <label for="username">ID : </label>
			        <input type="text" id="userId" name="userId" >
		        </div>
		        <div>
			        <label for="password">PW : </label>
			        <input type="password" id="userPw" name="userPw" >
		        </div>
	        </div>
	        <button>로그인</button>
	    </form>
	</div>
</body>
</html>