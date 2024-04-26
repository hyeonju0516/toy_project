<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<link rel="stylesheet" href="/resources/css/user.css" />
<script src="/resources/js/user.js"></script>
</head>
<body>
	<div class="list">
		<h2>회원 목록</h2>
		<form id="top_select" action="/api/user/list?page=${resultDTO.page}" method="get">
			<select id="pageSize" name="pageSize" onchange="updateSelect()">
				<option value="10" ${requestScope.pageSize == 10 ? "selected" : "" }>10</option>
				<option value="30" ${requestScope.pageSize == 30 ? "selected" : "" }>30</option>
				<option value="50" ${requestScope.pageSize == 50 ? "selected" : "" }>50</option>
			</select>
			<select id="sort" name="sort" onchange="updateSelect()">
				<option value="createDate" ${requestScope.sort == 'createDate' ? "selected" : "" }>가입일순</option>
				<option value="userName" ${requestScope.sort == 'userName' ? "selected" : "" }>이름순</option>
			</select>
		</form>
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
						<td>${u.userId}</td>
						<td>${u.userNick}</td>
						<td>${u.userName}</td>
						<td>${u.userEmail}</td>
						<td>${u.createDate}</td>
						<td><c:if test="${sessionScope.loginId == u.userId}"><a href="/api/user/${u.userId}">상세보기</a></c:if></td>
					</tr>
				</c:forEach>
			</c:if>
			
			<c:if test="${empty requestScope.userList}">
				<tr>
					<td colspan="6">가입 내역이 없습니다.</td>
				</tr>
			</c:if>
		</table>
		<div class="pageNation">
			 <c:choose>
				<c:when test="${1 != resultDTO.page}">
				  	<a class ="firstB" href="list?page=1&sort=${sort}&pageSize=${pageSize}">처음</a>
  					<a class ="ltB" href="list?page=${resultDTO.page-1}&sort=${sort}&pageSize=${pageSize}">&LT;</a>
				</c:when>
				<c:otherwise>
				  	<span class ="firstB">처음</span>
				  	<span class ="ltB">&LT;</span>
				</c:otherwise>
			</c:choose> 	 
			 
			<c:forEach var="i" items="${resultDTO.pageList}">
				<c:if test="${i==resultDTO.page}">
					<span><strong>${i}</strong></span>
				</c:if>
				<c:if test="${i!=resultDTO.page}">
					<a href="list?page=${i}&sort=${sort}&pageSize=${pageSize}">${i}</a>
				</c:if>
			</c:forEach>
			 
			<c:choose>
				<c:when test="${resultDTO.totalPage != resultDTO.page}">
					<a class="gtB" href="list?page=${resultDTO.page+1}&sort=${sort}&pageSize=${pageSize}">&GT;</a>
					<a class="lastB" href="list?page=${resultDTO.totalPage}&sort=${sort}&pageSize=${pageSize}">마지막</a>
				</c:when>
				<c:otherwise>
					<span class="gtB">&GT;</span>
					<span class="lastB">마지막</span>
				</c:otherwise>
			</c:choose>
		 </div>
	</div>
</body>
</html>