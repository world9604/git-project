<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="form" 
	uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8" />
	<title></title>
	
	<style type="text/css">
	.error { color : red; font-weight: bold }
	</style>
	
	<script type="text/javascript">

	</script>
	
	
	<style type="text/css">
	
	</style>
	
	
</head>
<body>

	<div id="pageContainer">
	
		<c:import url="/WEB-INF/views/include/header.jsp" />
				
		<form:form class="form-horizontal" action="noticeregister.action" method="post" enctype="multipart/form-data">
		<fieldset>
		
		<!-- Form Name -->
		<legend style="text-align: center; font-weight: bold; padding: 5px 0px">공지사항 등록</legend>
		
		<!-- Text input-->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="textinput">제목</label>  
		  <div class="col-md-4">
		  <input id="textinput" name="title" type="text" class="form-control input-md">	
		  </div>
		</div>
		
		<!-- 작성자 -->
		<div class="form-group">
			<label class="col-md-4 control-label" for="textinput">작성자</label>  
		  	<div class="col-md-4">
		  		<input type="hidden" name="memberNo"
						value="${ loginuser.memberNo }" />
				<input type="hidden" name="name"
						value="${ loginuser.name }" />
				<h5>${ loginuser.name }</h5>
		  	</div>
		</div>
		<!-- 파일 업로드 -->
		<div class="form-group">
			<label class="col-md-4 control-label" for="textinput">업로드</label>  
		  	<div class="col-md-4"> 
			  <input class="button" type="file" name="file-fr" multiple="multiple" id="file-fr" maxlength="1" />
			 </div>
		</div>
		
		<!-- Textarea -->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="textarea">내용</label>
		  <div class="col-md-4">                     
		    <textarea class="form-control" id="textarea" name="content"
		    	rows="10"></textarea>
		  </div>
		</div>
		
		<!-- Button (Double) -->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="button1id"></label>
		  <div class="col-md-8">
		    <button type="submit" id="button1id" name="button1id" class="btn btn-success">등록</button>
		    <a class="btn btn-success"
		        	   href="/gongmo/notice/noticelist.action">취소</a>
		  </div>
		</div>
		
		</fieldset>
		</form:form>
		
		
		
	
	</div>

</body>
</html>