<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인페이지</title>
<style>
	#wrap {
	    max-width: 500px;
	    min-width: 300px;
	    margin: 50px auto;
	    padding: 25px;
	    box-sizing:border-box;
	    background-color: #fff;
	    border-radius: 5px;
	    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	}
	
	h2 {
	    text-align: center;
	}
	
	form {
	    margin-top: 20px;
	}
	
	div > div {
	    margin-bottom: 15px;
	}
	
	label {
	    display: inline-block;
	    width: 60px;
	    font-weight: bold;
	}
	
	input[type="text"],
	input[type="password"] {
	    width: calc(100% - 80px);
	    padding: 8px;
	    border: 1px solid #ccc;
	    border-radius: 3px; 
	    box-sizing: border-box;
	}
	
	button {
	    width: 100%;
	    padding: 10px;
	    background-color: #0056b3;
	    color: #fff;
	    border: none;
	    border-radius: 3px;
	    cursor: pointer;
	}
	
	button:hover {
	    background-color: #003b7a;
	}
	
	#wrap > a{
		display:inline-block;
		margin-top:15px;
		text-decoration: none;
		color:#000;
	}
	
	#wrap > a:hover{
		text-decoration: underline;
	}
</style>
</head>
<body>
	<div id="wrap">
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
	    <a href="/">메인페이지</a>
	</div>
</body>
</html>