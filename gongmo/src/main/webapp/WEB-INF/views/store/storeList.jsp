<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

   
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<title>게시물 목록</title>
	<link rel="Stylesheet" href="/gongmo/resources/styles/css/default.css" />
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>    
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=0cd4fb5636db7cae6ec049f0902ce9ab" ></script>	
	
	<script type="text/javascript">
	
	/* 	 $(function() {
			
			var windowHeight = $(window).height();   // returns height of browser viewport
			var windowWidth = $(window).width();   // returns width of browser viewport		
			 */
			//$('span[data-id]').prop('offsetLeft', 0);
			//$('span[data-id]').prop('offsetTop', 0);
			/*************************************************************************************************************/
			
			/* var lat = document.getElementById('lat').value; // 위도
			var lng = document.getElementById('lon').value; // 경도 */
			//alert(lat, lng);
		/* 	var lat = $('#lat').attr('value');
			var lng = $('#lon').attr('value');
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new daum.maps.LatLng(lat, lng), // 지도의 중심좌표
				level : 8 // 지도의 확대 레벨
				//center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        //level: 3 // 지도의 확대 레벨
			};
			// 지도를 생성합니다    
			var map = new daum.maps.Map(mapContainer, mapOption);
			

			// 마커 이미지의 이미지 주소입니다
			var imageSrc = "http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
			
			var stores = $('#stores .store');
			    
			$.each(stores, function(index, store) {
			    // 마커 이미지의 이미지 크기 입니다
			    var imageSize = new daum.maps.Size(24, 35); 
			    
			    // 마커 이미지를 생성합니다    
			    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
			    
			    var lat = $(this).find('div[data-id = lat]').text();
			    var lon = $(this).find('div[data-id = lon]').text();
			    var title = $(this).find('div[data-id = title]').text();
				
			    // 마커를 생성합니다
			    var marker = new daum.maps.Marker({
			        map: map, // 마커를 표시할 지도
			        position: new daum.maps.LatLng(lat, lon), // 마커를 표시할 위치
			        title : title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			        image : markerImage // 마커 이미지 
			    });				
			});
			     */
			
			//////////////////////////////////roomNo를 가지고 roomView이동/////////////
		/* 	$(".store").on("click", function(){
				var roomNo = $(this).attr("data");
				
				location.href="/teamfive/rooms/roomView.action?roomNo="+roomNo;
			}); */
			
		//})
		 
	</script>
</head>
<body>
	<%-- <input id="lat" hidden="hidden" value="${location.lat}"/>
	<input id="lon" hidden="hidden" value="${location.lon}"/>	 --%>
	<div id="pageContainer" style="clear:both;overflow:hidden">
	
		
					
		<div id="body" style="min-height:568px;height:680px;clear:both;overflow:hidden" >
			<div id="stores" style="width:58%;height:680px;float:left;overflow-x:hidden">
				<c:forEach var="store" items="${stores}">
				
				<div class="store" data="${store.storeNo}" style="padding:2px;margin:5px;width:48%;height:310px;float:left">
				 	
				 	<div class="storepicture" style="height:200px">					
						 <img data-id="picture" src="/gongmofive/resources/image/게하1"
								style="width:100%;height:200px"/> <!-- 사진 가져오기 -->
					</div>
					
					<div data-id="price" style="height:30px;font-size:15pt">${store.salesCost} 원</div>
					
					<div class="storeinfo">
						<div data-id="title" style="height:30px;font-size:15pt">${store.storeName}</div>
						<div data-id="storetype" style="float:left">${store.type} </div> 
						<div data-id="rate" style="float:left">
						이모티콘
						</div> 
						<div data-id="review"></div> <!-- 후기 테이블에서 갯수 읽어오기-->
					</div>
					<%-- <div data-id="lat" style="display:none">${room.lat}</div>
					<div data-id="lon" style="display:none">${room.lon}</div>	 --%>
					
					
				</div>				
				</c:forEach>
				<%-- </c:forEach> --%>
				<div id="pager" style="clear:both">					
				</div>
			</div>
			<div id="map" style="width:40%;height:100%;float:right;overflow:hidden">								
			</div>
		
		</div>
		</div>
	
</body>
</html>




