<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8" />
<title></title>
<link rel="Stylesheet" href="/gongmo/resources/styles/css/default.css" />
<link rel="Stylesheet" href="/gongmo/resources/styles/css/input.css" />

<script type="text/javascript">
$(document).ready(function() {
    $('a[data-toggle="tab"]').on('hidden.bs.tab', function(e){
	alert("이벤트 실행됨");
    });
});

  ///////////////////////////////////////////////////////////////////////////////////////

</script>

<style type="text/css">
	img:hover {
	cursor: pointer;
	-webkit-transform: scale(2, 2);
    -ms-transform: scale(2, 2);
    transform: scale(2, 2);
    transition-duration: 0.3s;
    -webkit-transition-duration: 0.3s; /* Safari */
    box-shadow: 10px 10px 5px #888888;
    z-index: 1;
    }
</style>


<script>
	window.onload = function() {
		//Check File API support
		if (window.File && window.FileList && window.FileReader) {
			var filesInput = document.getElementById("file-fr");
			filesInput
					.addEventListener(
							"change",
							function(event) {
								$('result').empty();
								var files = event.target.files; //FileList object
								var output = document.getElementById("result");
								for (var i = 0; i < files.length; i++) {
									var file = files[i];
									//Only pics
									if (!file.type.match('image'))
										continue;
									var picReader = new FileReader();
									picReader
											.addEventListener(
													"load",
													function(event) {
														var picFile = event.target;
														var div = document
																.createElement("div");
														div.innerHTML = "<img class='thumbnail' src='" + picFile.result + "'" + "title='" + picFile.name + "'/>";
														output.insertBefore(
																div, null);
													});
									//Read the image
									picReader.readAsDataURL(file);
								}
							});
		} else {
			console.log("Your browser does not support File API");
		}
	}
</script>

<style type="text/css">
.thumbnail {
	width: 20%; 
	height: 200px; 
	float: left;
	margin: 5px 6%;
}
</style>

</head>

<body>

	<c:import url="/WEB-INF/views/include/header.jsp" />

	<form action="insertphoto.action" method="post" enctype="multipart/form-data">
		<br /><br />
		<div style="width: 90%; margin: auto; border: solid 5px black;   border-radius: 20px;">
			<h2 style="text-align: center;  text-shadow: 2px 2px 0px rgba(0, 0, 0, 0.4) !important"><strong>가게 사진 등록</strong></h2>
			
			<br />
			
			<div class="nav nav-pills nav-stacked" id="result" ></div>
			<input type="hidden" name="storeNo" value="${ storeNo }">
			<input class="button" type="file" name="file-fr"  id="file-fr"  style="margin: 0px 44%"
							multiple="multiple" maxlength="5" />
							
			<br />				
							
		</div>
		
		<br />
		
		<div style="width: 80%; margin: auto">
			<input class="btn btn-danger" type="submit" value="사진등록" style="width: 170px; height:35px; margin: 0px 44%" />
		</div>
	</form>
	

</body>
</html>