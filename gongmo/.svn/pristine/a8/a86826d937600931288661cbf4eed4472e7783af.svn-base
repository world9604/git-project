<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="form" 
	uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8" />
	<title></title>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<style type="text/css">
	.error { color : red; font-weight: bold }
	</style>
	
<script type="text/javascript">
	function oneCheckbox(no){
		var obj = document.getElementsByName("middleNo");
	    for(var i=0; i<obj.length; i++){
	    	if(obj[i] != no){
	        	obj[i].checked = false;
	        }
	    }
	}
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 $(function(){
    	var locationSido;
    	 $("#locationSido").on("change", function(){
    		 locationSido = $("#locationSido option:selected").attr("id");
    	
   		 if(locationSido != null){
    		 
	    	    $.ajax({
	    			type:"get",
	    			url:"/gongmo/stores/getGuGunBySido.action",
	    			data: {locationSido : locationSido},
	    			success:function(data, status, xhr){
	    				
	    				var obj = eval(data);
	    				 				
	    				var objCount = obj.length;
	    				
	    				$("#locationGugun").empty();
	    				
	    				for(var i=0; i<objCount; i++){    					
	    					var $option = $("<option id='storeAddress'value="+obj[i]+">"+obj[i]+"</option>");
	    					$("#locationGugun").append($option);
	    				} 
	    				
	    			}
	    		});
	    	    
    		 }
    	}); 
    	
    });// END
   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   
   /* 유효성 검사 */
	$(function() {
		$('#button1id').click(function(event) {
			var title = $('#title').val();
			var middleNo = $('input[name=middleNo]:checked').attr('value');	
			var sido = $('select[name=sido] > option:selected').attr('value');
	 		var content = $('#content').val();
	 		
	 		if(!title){
	 			alert('제목을 입력해주세요');
	 			$('#title').focus();
	 			return false;
	 		}else if(!middleNo){
	 			alert('업종 분류를 선택해주세요');
	 			return false;
	 		}else if(!sido){
	 			alert('희망 지역을 선택해주세요');
	 			return false;
	 		}else if(!content){
	 			alert('내용을 입력해주세요');
	 			$('#content').focus();
	 			return false;
	 		}else {
	 	 		alert("모두 정상 입력되었습니다.");	
	 	 	} 		
 		});
 	
	});
</script>
	
	
	<style type="text/css">
	/* 체크박스 css 부분 */
	.form-group input[type="checkbox"] {
	    display: none;
	}
	
	.form-group input[type="checkbox"] + .btn-group > label span {
	    width: 20px;
	}
	
	.form-group input[type="checkbox"] + .btn-group > label span:first-child {
	    display: none;
	}
	.form-group input[type="checkbox"] + .btn-group > label span:last-child {
	    display: inline-block;   
	}
	
	.form-group input[type="checkbox"]:checked + .btn-group > label span:first-child {
	    display: inline-block;
	}
	.form-group input[type="checkbox"]:checked + .btn-group > label span:last-child {
	    display: none;   
	}
	</style>
	
	
</head>
<body>

	<div id="pageContainer">
	
		<c:import url="/WEB-INF/views/include/header.jsp" />
		
			
		<form:form class="form-horizontal" action="buyregister.action" method="post" modelAttribute="BuyStore">
		<fieldset>
		
		<!-- Form Name -->
		<legend style="text-align: center; font-weight: bold; padding: 5px 0px">가게 구합니다 등록</legend>
		
		<!-- Text input-->
		
		<div class="form-group">
		  <label class="col-md-4 control-label" for="textinput">제목</label>  
		  <div class="col-md-4">
		  <input id="title" name="title" type="text" class="form-control input-md">	
		  </div>
		</div>
		
		<!-- 작성자 -->
		<div class="form-group">
			<label class="col-md-4 control-label" for="textinput">작성자</label>  
		  	
				<input type="hidden" name="memberNo"
						value="${ loginuser.memberNo }" />
				<input type="hidden" name="name"
						value="${ loginuser.name }" />
				<h5>${ loginuser.name }</h5>
		  	
		</div>

		<!-- 분류 -->
		<div class="form-group">
			<label class="col-md-4 control-label" for="textinput">업종 분류</label>  
		  	<div class="col-md-4">
				<c:forEach var="categorybig" items="${ categoryBigs }">
		    		<div style="float: left; text-align: center">
			   			<button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample${ categorybig.bigNo }" 
		    					aria-expanded="false" aria-controls="collapseExample"
		        				style="width: 150px; height: 35px; text-align: center; background-color: #d75050; border-color: #d75050">
							${ categorybig.bigName }
						</button>
						<div class="collapse" id="collapseExample${ categorybig.bigNo }">
 							<div class="well">	
								<c:forEach var="categorymiddle" items="${ categoryMiddles }">
				        			<c:choose>
										<c:when test="${ categorybig.bigNo == categorymiddle.bigNo }">
						    				<div style="text-align: left">
						    					<div class="[ form-group ]">
						    						<input type="checkbox" name="middleNo" id="middleNo${ categorymiddle.middleNo }" autocomplete="off"
						        						   value="${ categorymiddle.middleNo }" onclick="oneCheckbox(this)">													            
										            <div class="[ btn-group ]">
										                <label for="middleNo${ categorymiddle.middleNo }" class="[ btn btn-default ]">
										                    <span class="[ glyphicon glyphicon-ok ]"></span>
														    <span> </span>
										                </label>
										                <label for="middleNo${ categorymiddle.middleNo }" class="[ btn btn-default active ]">
										                    ${ categorymiddle.middleName }
										                </label>
										            </div>
									        	</div>													        						        							
											</div>
				    					</c:when>
				    				</c:choose>			        			
								</c:forEach>
			        		</div>
			        	</div> <!-- collapse 기능 종료 -->	        				
			        				
			   		</div>
				</c:forEach>
		  	</div>
		</div>
		
		<div class="form-group">
			<label class="col-md-4 control-label" for="textinput">희망 지역</label>  
		  	<div class="col-md-4">
		  		
				
					<select id="locationSido" name="sido" style="width: 250px; height: 40px;">
						<option>전체 시/도</option>
						<c:forEach var="sido" items="${sidos}">
							<option id="${sido}" value="${sido}">${sido}</option>
						</c:forEach>
					</select> 
					<select id="locationGugun" name="gugun"style="width: 250px; height: 40px;">
						<option>구/군</option>
					</select>
		  	</div>
		</div>
		
   <!-- Textarea -->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="textarea">내용</label>
		  <div class="col-md-4">                     
		    <textarea class="form-control" id="content" name="content"
		    	rows="10"></textarea>
		  </div>
		</div>
		
		<!-- Button (Double) -->
		<div class="form-group">
		  <label class="col-md-4 control-label" for="button1id"></label>
		  <div class="col-md-8">
		    <button type="submit" id="button1id" name="button1id" class="btn btn-success">등록</button>
		    <a class="btn btn-success"
		        	   href="/gongmo/stores/buylist.action">취소</a>
		  </div>
		</div>
	
		</fieldset>
		</form:form>
		
		
		
	
	</div>

</body>
</html>