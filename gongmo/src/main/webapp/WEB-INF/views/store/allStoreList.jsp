<%@ page language="java" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8" />
<title></title>

<link href="/gongmo/resources/styles/css/allstorelist.css" rel="stylesheet">
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
	    					var $option = $("<option id='categoryMiddleName'value="+obj[i].middleName+">"+obj[i].middleName+"</option>");
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
	    					var $option = $("<option id='storeAddress'value="+obj[i]+">"+obj[i]+"</option>");
	    					$("#locationGugun").append($option);
	    				} 
	    				
	    			}
	    		});
	    	    
    		 }
    	}); 
    	
    	
    	
    });//jquery END
   ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    </script>
    
    <style type="text/css">
    .lib-img:hover{  
	    border:3px solid #d75050;  
	     border-radius: 50px;
	}  
    </style>

</head>
<body>

	<div id="pageContainer">

		<c:import url="/WEB-INF/views/include/header.jsp" />

		<div id="content">
			<div style="display: block; margin-left: 10%">
					<select style="width: 100px; height: 40px;"  id="leaseOrDealing">
						<option value="임대">임대</option>
						<option value="매매">매매</option>
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
	
					<button id="search" style="width: 90px; height: 40px; 
								   color: #f5f5f5; background-color: #d75050; border-color: #d75050;">검색</button>
	
				
			</div>

			<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
			<input id="logmemberNo" type="hidden" value="${loginuser.memberNo}">



			<div class="container">
			
				<h5 style="text-align: center">&lt;&lt; 가게 이미지 클릭시 상세페이지로 이동 &gt;&gt;</h5>

				<div class="row row-margin-bottom">
					<div id ="all">
					<c:forEach var="store" items="${stores}">
					<c:choose>
						<c:when test="${store.sellStatue eq 'false'}">
						<div class="col-md-5 no-padding lib-item" >
							<div class="lib-panel">
								<div class="row box-shadow">
									<div class="col-md-6" onclick="location.href='/gongmo/stores/storeBuyDetail.action?storeNo=${store.storeNo}&memberNo=${store.memberNo}'">
										<c:set var="found" value="0" />
										<c:forEach var="storeImage" items="${storeImages}">
											<c:choose>
												<c:when test="${store.storeNo == storeImage.storeNo }">
													<c:if test="${found eq 0}">
														<c:set var="found" value="1" />
														<img class="lib-img" style="height: 200px"
															src="/gongmo/resources/upload/${storeImage.uploadFileName}">
													</c:if>
												</c:when>
											</c:choose>
										</c:forEach>
									</div>
									<div class="col-md-6">
										<div class="lib-row lib-header" style="text-align: center">
												${store.type}&nbsp;
											<c:choose>
												<c:when test="${store.leaseOrDealing == '임대'}">
													<span style="color: blue">[${store.leaseOrDealing}]</span>
												</c:when>
												<c:when test="${store.leaseOrDealing == '매매'}">
													<span style="color: red">[${store.leaseOrDealing}]</span>
												</c:when>
											</c:choose>
											<hr />
										</div>
										<div class="lib-row lib-desc">
											<ul>
												<c:choose>
													<c:when test="${store.leaseOrDealing == '임대'}">
															<li>임대 보증금 : ${store.leaseDeposit}</li>
															<li>임대 월세 : ${store.leaseMonthlyRent}</li>
															<li>권리금 : ${store.leasePremium}</li>											
													</c:when>
													<c:when test="${store.leaseOrDealing == '매매'}">
															<li>매매대금 : ${store.dealingPrice}</li>		
															<li>권리금 : ${store.leasePremium}</li>																				
													</c:when>
												</c:choose>
												<li>${store.storeAddress}</li>																			
											</ul>										
										</div>
									</div>
								</div>
							</div>
							
							<br />
						</div>
						<div class="col-md-1"></div> <!--  공백용-->
						</c:when>
						</c:choose>
					</c:forEach>
				</div>
				</div>
			</div>


			<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
		</div>
	</div>

	<script>
		$(function() {
			$('#search')
					.on(
							'click',
							function(event) {

								$('#all').empty();
								var logmemberNo = $('#logmemberNo').val();
								var leaseOrDealing = $('#leaseOrDealing').val();
								var name = $(
										'#categoryMiddleSelect > option:selected')
										.val();
								var storeAddress = $(
										'#locationGugun > option:selected')
										.val();

								$.ajax({
											url : "/gongmo/stores/searchlist.action",
											type : "post",
											data : {
												leaseOrDealing : leaseOrDealing,
												name : name,
												storeAddress : storeAddress
											},

											success : function(data, status, xhr) {
												var obj = eval(data);
												var objCount = obj.length;
												var logmemberNo = $(
														'#logmemberNo').val();
												if (objCount == 0) {
													alert('검색 결과가 없습니다.');
												}

												var string = "";
												var string2 = "'";
												for (var i = 0; i < objCount; i++) {

													/*  var img =obj[i].storeImage[0].uploadFileName; */
													if (obj[i].sellStatue == false) {

														if (obj[i].leaseOrDealing == "매매") {
															var leaseOrDealing = '<div class="col-md-6"><div class="lib-row lib-header" style="text-align: center">'
																	+ obj[i].type
																	+ '<span style="color: red">'
																	+ [ obj[i].leaseOrDealing ]
																	+ '</span><hr /></div><div class="lib-row lib-desc"><ul><li>매매대금 : '
																	+ obj[i].dealingPrice
																	+ '</li><li>권리금 : '
																	+ obj[i].leasePremium
																	+ '</li><li>'
																	+ obj[i].storeAddress
																	+ '</li></ul></div></div>';

														} else if (obj[i].leaseOrDealing == "임대") {
															var leaseOrDealing = '<div class="col-md-6"><div class="lib-row lib-header" style="text-align: center">'
																	+ obj[i].type
																	+ '<span style="color: blue">'
																	+ [ obj[i].leaseOrDealing ]
																	+ '</span><hr /></div><div class="lib-row lib-desc"><ul><li>임대 보증금 : '
																	+ obj[i].leaseDeposit
																	+ '</li><li>임대 월세 :'
																	+ obj[i].leaseMonthlyRent
																	+ '</li><li>권리금 : '
																	+ obj[i].leasePremium
																	+ '</li><li>'
																	+ obj[i].storeAddress
																	+ '</li></ul></div></div>';
														}

														var $div = '<div class="col-md-5 no-padding lib-item" ><div class="lib-panel"><div class="row box-shadow"><div class="col-md-6" onclick="location.href='
																+ string2
																+ '/gongmo/stores/storeBuyDetail.action?storeNo='
																+ obj[i].storeNo
																+ '&memberNo='
																+ obj[i].memberNo
																+ string2
																+ '"><img src="/gongmo/resources/upload/'+obj[i].storeImage[0].uploadFileName+'"class="lib-img" style="height: 200px"></div>'
																+ leaseOrDealing
																+ '</div></div><br /></div><div class="col-md-1"></div></div>';

														string += $div;

													} /* if문 종료 */
													
													

												} /* for문 종료 */

												
												$('#all').append(string);
											}

										})
							})
		})
	</script>
	
	
</body>
</html>