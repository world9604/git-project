<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8" />
	<title>게시물 목록</title>
	<link rel="Stylesheet" href="/teamfive/resources/styles/css/default.css" />
	
</head>
<body>

	<% pageContext.include("/WEB-INF/views/include/header.jsp"); %>
	
	<div id="pageContainer">
		
		<div style="padding-top:25px;text-align:center">

			<a href='writeform.action'>글쓰기</a>
			<br /><br />
			
			<table border="1" align="center">
				<tr style="background-color:beige;height:25px">
					<th style="width:50px">방번호</th>
					<th style="width:300px">방제목</th>
					<th style="width:150px">작성자</th>
					<th style="width:120px">수용가능인원</t>
				</tr>
				<c:forEach var="rooms" items="${rooms}">
				<c:forEach var="roomnos" items="${roomnos}">
				<c:choose>
				<c:when test="${rooms.roomNo == roomnos.roomNo}">
				<tr style="background-color:hotpink;height:25px">
					<th>${ rooms.roomNo }</td>
        			<th>${ rooms.roomName }</td>
        			<th>${ rooms.memberNo }</td>
        			<th>${ rooms.numOfPeople }</td>
				</tr>
				</c:when>
				</c:choose>
				</c:forEach>
				</c:forEach>
				
				
			</table>
			<br /><br />
		</div>
	</div>

</body>
</html>













