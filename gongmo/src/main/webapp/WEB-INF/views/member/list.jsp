	<%@page import="com.mvcdemoweb.model.dto.Store"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

   
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>게시물 목록</title>

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>    
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<link href="/gongmo/resources/styles/css/storeList.css" rel="stylesheet">
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=c6292734fec2c656a1ae18a9086544ba&libraries=services"></script>
	<!-- <style type="text/css">
		#id {}
	</style> -->
	<script type="text/javascript">

		
	</script>
</head>
<body>
<c:import url="/WEB-INF/views/include/header.jsp" />
	<c:set var="found" value="0" />
	<div id="pageContainer" style="clear:both;overflow:hidden">	
		<h1 class="text-center text-primary title">판매 리스트</h1>
			<hr class="divider-title">
			
		<div id="body" style="min-height:568px;height:680px;clear:both;overflow:hidden" >
			<div id="stores"style="width: 58%; height: 680px; float: left; overflow-x: hidden">
				<c:forEach var="store" items="${stores}">
				
				<div class="col-ms-10 col-md-4">
					<div class="project">
						<figure class="img-responsive">
			
					<c:set var="found" value="0" />
					<div class="stores" data="${store.memberNo}"
						style="padding: 2px; margin: 5px; width: 100%; height: 100%; float: left">
						<c:forEach var="storeImage" items="${storeImages}"
							varStatus="status">
							<c:choose>
								<c:when test="${store.storeNo eq storeImage.storeNo}">
									<div class="item active" id="${status.index}">
										<c:if test="${found eq 0}">
											<c:set var="found" value="1" />
											<a
												href="/gongmo/member/storeDetail.action?storeNo=${store.storeNo}"><img
												src="/gongmo/resources/upload/${storeImage.uploadFileName}"
												style="width: 100%; height: 200px" /></a>
										</c:if>
									</div>

								</c:when>
							</c:choose>
						</c:forEach>
						<figcaption>
						<a href="/gongmo/member/storeDetail.action?storeNo=${store.storeNo}">
						<div data-id="storename" style="height: 30px; font-size: 15pt">${store.storeName}</div></a>
						
							<div data-id="type" style="height: 30px; font-size: 15pt">${store.type}</div>
							<c:choose>
								<c:when test="${store.leaseOrDealing == '매매'}">
									<div data-id="leaseordealing" style="">매매 형태 :
										${store.leaseOrDealing}</div>
								</c:when>
								<c:when test="${store.leaseOrDealing == '임대'}">
									<div data-id="leaseordealing" style="">매매 형태 :
										${store.leaseOrDealing}</div>
								</c:when>
							</c:choose>
							<div data-id="storeAddress"value="${store.storeAddress}">${store.storeAddress}</div>
								
									<c:choose>
										<c:when test="${store.sellStatue == 'true'}">
											<div><h3>판매 완료</h3></div>
										</c:when>
										<c:otherwise>
											<div><h3>판매 중</h3></div>
										</c:otherwise>
									</c:choose>
						<div data-id="storeNo" style="display: none">${store.storeNo}</div>
					</figcaption>
					</div>
								<span class="actions">
									<button class="btn btn-warning bnt-action" style="background-color: #d75050; border-color: #d75050" type="submit"
									onclick="location.href='/gongmo/member/storeDetail.action?storeNo=${store.storeNo}'">View
									</button>
								</span>
							</figure>
						</div>
					</div>
				</c:forEach>
				</div>
				<!-- /////////////// 지도 -->
			
			<div id="map" style="width:40%;height:100%;float:right;">								
			</div>

 			<script>
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new daum.maps.LatLng(36.4901094,127.8745459), // 지도의 중심좌표
			        level: 12 // 지도의 확대 레벨
			    };  

				// 지도를 생성합니다    
				var map = new daum.maps.Map(mapContainer, mapOption); 
	
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new daum.maps.services.Geocoder();
				var stores = $('#stores .stores');
				$.each(stores, function(index, stores) {
					
					var addr =$(this).find('div[data-id = storeAddress]').text();
					var storename =$(this).find('div[data-id = storename]').text();
					var storeNo =$(this).find('div[data-id=storeNo]').text();
				// 주소로 좌표를 검색합니다
				geocoder.addr2coord(addr, function(status, result) {
	
				    // 정상적으로 검색이 완료됐으면 
				     if (status === daum.maps.services.Status.OK) {
	
				        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);
	
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new daum.maps.Marker({
				            map: map,
				            position: coords
				        });
	
				        // 인포윈도우로 장소에 대한 설명을 표시합니다
				        var infowindow = new daum.maps.InfoWindow({
				            content: '<div style="width:150px;text-align:center;padding:6px 0;"><a href="/gongmo/member/storeDetail.action?storeNo='+storeNo+'">'+ storename +'</a></div>'
				        });
				        infowindow.open(map, marker);
	
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        /* map.setCenter(coords); */
				   	} 
				});   }); 
			</script>
			</div>
			</div>
			

	
</body>
</html>




