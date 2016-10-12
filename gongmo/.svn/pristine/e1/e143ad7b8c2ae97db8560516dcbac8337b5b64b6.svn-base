<%@ page language="java" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8" />
<title></title>
<link rel="Stylesheet" href="/gongmo/resources/styles/css/default.css" />
<link href="/gongmo/resources/styles/css/header.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
   
    $(function(){
    	
    	var categoryBigNo;
    	var locationSido;
    	
    	 $("#categoryBigSelect").on("change", function(){
    		
    		 categoryBigNo = $("#categoryBigSelect option:selected").attr("id");
    	
   		 if(categoryBigNo != null){
    		 
	    	    $.ajax({
	    			type:"get",
	    			url:"/gongmo/stores/getCategoryMiddleByCategoryBigNo.action",
	    			data: {categoryBigNo : categoryBigNo},
	    			success:function(data, status, xhr){
	    				var obj = eval(data);
	    				var objCount = obj.length;
	    				
	    				$("#categoryMiddleSelect").empty();
	    				
	    				for(var i=0; i<objCount; i++){    					
	    					var $option = $("<option value="+obj[i].middleName+">"+obj[i].middleName+"</option>");
	    					$("#categoryMiddleSelect").append($option);
	    				}
	    			}
	    		});
	    	    
    		 }
    	}); 
    	
    	
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
	    					var $option = $("<option value="+obj[i]+">"+obj[i]+"</option>");
	    					$("#locationGugun").append($option);
	    				} 
	    				
	    			}
	    		});
	    	    
    		 }
    	}); 
    	
    	
    	
    });//jquery END
    
    </script>

</head>
<body>

	<div id="pageContainer">

		<c:import url="/WEB-INF/views/include/header.jsp" />

		<div class="carousel fade-carousel slide" data-ride="carousel"
			data-interval="6000" id="bs-carousel"
			style="z-index: 2">			
			<!-- Overlay -->
			<!-- <div class="overlay"></div> -->

			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#bs-carousel" data-slide-to="0" class="active"></li>
				<li data-target="#bs-carousel" data-slide-to="1"></li>
				<li data-target="#bs-carousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">					
				<div class="item slides active">
					<div class="slide-1"></div>
					<div class="hero">
						<hgroup>
							<h1>SELL YOUR STORE, SEEK LEISURELY LIFE</h1>
							<h3>Register your store for selling</h3>
						</hgroup>
						<button class="btn btn-hero btn-lg" role="button">Register</button>
					</div>
				</div>
				<div class="item slides">
					<div class="slide-2"></div>
					<div class="hero">
						<hgroup>
							<h1>BUY YOUR OWN STORE,<br /> FACE HAPPINESS</h1>
							<h3>Search and write for buying</h3>
						</hgroup>
						<button class="btn btn-hero btn-lg" role="button">Go board</button>
					</div>
				</div>
				<div class="item slides">
					<div class="slide-3"></div>
					<div class="hero">
						<hgroup>
							<h1>We are amazing</h1>
							<h3>Get start your next awesome project</h3>
						</hgroup>
						<button class="btn btn-hero btn-lg" role="button">See all
							features</button>
					</div>
				</div>
			</div>
						
		</div>
		
		
		<div id="content">
		
			<div style="">
				<form action="/gongmo/member/">
					<select style="width: 100px; height: 40px;">
						<option>임대</option>
						<option>매매</option>
					</select> <select id="categoryBigSelect" name="categoryBigs"
						style="width: 250px; height: 40px;">
						<option>업종대분류 선택</option>
						<c:forEach var="categoryBig" items="${categoryBigs}">
							<option id="${categoryBig.bigNo}" value="${categoryBig.bigName}">${categoryBig.bigName}</option>
						</c:forEach>
					</select> <select id="categoryMiddleSelect"
						style="width: 250px; height: 40px;">
						<option>업종세분류 선택</option>
					</select> <select id="locationSido" style="width: 250px; height: 40px;">
						<option>전체 시/도</option>
						<c:forEach var="sido" items="${sidos}">
							<option id="${sido}" value="${sido}">${sido}</option>
						</c:forEach>
					</select> <select id="locationGugun" style="width: 250px; height: 40px;">
						<option>구/군</option>
					</select>
	
					<button style="width: 90px; height: 40px; 
								   color: #f5f5f5; background-color: #d75050; border-color: #d75050;">검색</button>
	
				</form>
			</div>

			<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
			<c:set var="found" value="0" />
			<div id="stores" style="width: 1200px; margin: auto">
				<c:forEach var="store" items="${stores}">
					<c:set var="found" value="0" />
					<div class="stores"
						style="padding: 10px; margin: auto; width: 25%; height: 400px; float: left">
						<c:forEach var="storeImage" items="${storeImages}"
							varStatus="status">
							<c:choose>
								<c:when test="${store.storeNo == storeImage.storeNo}">
									<div class="item active" id="${status.index}">
										<c:if test="${found eq 0}">
											<c:set var="found" value="1" />
											<a
												href="/gongmo/stores/storeBuyDetail.action?storeNo=${store.storeNo}&lonmemberNo=${loginuser.memberNo}&memberNo=${store.memberNo}">
												<img
												src="/gongmo/resources/upload/${storeImage.savedFileName}"
												style="width: 80%; height: 200px" />
											</a>
										</c:if>
									</div>
								</c:when>
							</c:choose>
						</c:forEach>
						<div data-id="storename" style="height: 30px; font-size: 15pt">${store.storeName}</div>
						<div class="store" style="">
							<div data-id="type" style="height: 30px; font-size: 15pt">${store.type}</div>
							<c:choose>
								<c:when test="${store.leaseOrDealing == '매매'}">
									<div data-id="leaseordealing" style="">매매 형태 :
										${store.leaseOrDealing}</div>
									<div data-id="dealingPrice" style="">매매 대금 :
										${store.dealingPrice}</div>
								</c:when>
								<c:when test="${store.leaseOrDealing == '임대'}">
									<div data-id="leaseordealing" style="">매매 형태 :
										${store.leaseOrDealing}</div>
									<div data-id="leaseordealing" style="">임대 대금 :
										${store.dealingPrice}</div>
									<div data-id="leaseordealing" style="">임대 보증금 :
										${store.leaseDeposit}</div>
								</c:when>
							</c:choose>
							<div data-id="storeAddress" style="">주소 :
								${store.storeAddress}</div>
						</div>
						<div data-id="storeNo" style="display: none">${store.storeNo}</div>
					</div>
				</c:forEach>
			</div>

			<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
		</div>
	</div>

</body>
</html>