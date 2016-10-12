<%@page import="com.mvcdemoweb.model.dto.Store"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>게시물 목록</title>


<script src="http://code.jquery.com/jquery-latest.min.js"></script>	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- <link rel="Stylesheet" href="/gongmo/resources/styles/css/default.css" />  -->
	<style> 
.overlaybox {position:relative;width:360px;height:350px;background:url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/box_movie.png') no-repeat;padding:15px 10px;}
		.overlaybox div,.overlaybox ul {overflow:hidden;margin:0;padding:0;} 
		.overlaybox li {list-style: none;}
		.overlaybox .boxtitle {color:#fff;font-size:16px;font-weight:bold;background: url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png') no-repeat right 120px center;margin-bottom:8px;}  
		.overlaybox .first {position:relative;width:247px;height:136px;margin-bottom:8px;}  background: url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/thumb.png') no-repeat; 
		.first .text {color:#fff;font-weight:bold;} 
		.first .movietitle {position:absolute;width:100%;bottom:0;background:rgba(0,0,0,0.4);padding:7px 15px;font-size:14px;}
		.overlaybox ul {width:247px;}
		.overlaybox li {position:relative;margin-bottom:2px;background:#2b2d36;padding:5px 10px;color:#aaabaf;line-height: 1;}
		.overlaybox li span {display:inline-block;}
		.overlaybox li .number {font-size:16px;font-weight:bold;}
		.overlaybox li .title {font-size:13px;}
		.overlaybox ul .arrow {position:absolute;margin-top:8px;right:25px;width:5px;height:3px;background:url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/updown.png') no-repeat;} 
		.overlaybox li .up {background-position:0 -40px;}
		.overlaybox li .down {background-position:0 -60px;}
		.overlaybox li .count {position:absolute;margin-top:5px;right:15px;font-size:10px;}
		.overlaybox li:hover {color:#fff;background:#d24545;}
		.overlaybox li:hover .up {background-position:0 0px;}
		.overlaybox li:hover .down {background-position:0 -20px;}   
		
/* /////////////////////////////////밑에는 카테고리 스타일//////////////////////////////////// */
		#mapwrap{position:relative;overflow:hidden;}
		.category, .category *{margin:0;padding:0;color:#000;}   
	    .category {position:absolute;overflow:hidden;top:10px;left:10px;width:150px;height:50px;z-index:10;border:1px solid black;font-family:'Malgun Gothic','맑은 고딕',sans-serif;font-size:12px;text-align:center;background-color:#fff;}
		.category .menu_selected {background:#FF5F4A;color:#fff;border-left:1px solid #915B2F;border-right:1px solid #915B2F;margin:0 -1px;} 
		.category li{list-style:none;float:left;width:49px;height:47px;padding-top:5px;cursor:pointer;} 
		.category .ico_comm {display:block;margin:0 auto 2px;width:22px;height:26px;background:url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png') no-repeat;} 
		.category .ico_coffee {background-position:-10px 0;}  
		.category .ico_store {background-position:-10px -36px;}   
		.category .ico_carpark {background-position:-10px -72px;}
/* ///////////////////////////////////밑에는 로딩 스타일 ////////////////////////////////////////////////*/
#loader {
    bottom: 0;
    height: 175px;
    left: 0;
    margin: auto;
    position: absolute;
    right: 0;
    top: 0;
    width: 175px;
}
#loader .dot {
    bottom: 0;
    height: 100%;
    left: 0;
    margin: auto;
    position: absolute;
    right: 0;
    top: 0;
    width: 87.5px;
}
#loader .dot::before {
    border-radius: 100%;
    content: "";
    height: 87.5px;
    left: 0;
    position: absolute;
    right: 0;
    top: 0;
    transform: scale(0);
    width: 87.5px;
}
#loader .dot:nth-child(7n+1) {
    transform: rotate(45deg);
}
#loader .dot:nth-child(7n+1)::before {
    animation: 0.8s linear 0.1s normal none infinite running load;
    background: #00ff80 none repeat scroll 0 0;
}
#loader .dot:nth-child(7n+2) {
    transform: rotate(90deg);
}
#loader .dot:nth-child(7n+2)::before {
    animation: 0.8s linear 0.2s normal none infinite running load;
    background: #00ffea none repeat scroll 0 0;
}
#loader .dot:nth-child(7n+3) {
    transform: rotate(135deg);
}
#loader .dot:nth-child(7n+3)::before {
    animation: 0.8s linear 0.3s normal none infinite running load;
    background: #00aaff none repeat scroll 0 0;
}
#loader .dot:nth-child(7n+4) {
    transform: rotate(180deg);
}
#loader .dot:nth-child(7n+4)::before {
    animation: 0.8s linear 0.4s normal none infinite running load;
    background: #0040ff none repeat scroll 0 0;
}
#loader .dot:nth-child(7n+5) {
    transform: rotate(225deg);
}
#loader .dot:nth-child(7n+5)::before {
    animation: 0.8s linear 0.5s normal none infinite running load;
    background: #2a00ff none repeat scroll 0 0;
}
#loader .dot:nth-child(7n+6) {
    transform: rotate(270deg);
}
#loader .dot:nth-child(7n+6)::before {
    animation: 0.8s linear 0.6s normal none infinite running load;
    background: #9500ff none repeat scroll 0 0;
}
#loader .dot:nth-child(7n+7) {
    transform: rotate(315deg);
}
#loader .dot:nth-child(7n+7)::before {
    animation: 0.8s linear 0.7s normal none infinite running load;
    background: magenta none repeat scroll 0 0;
}
#loader .dot:nth-child(7n+8) {
    transform: rotate(360deg);
}
#loader .dot:nth-child(7n+8)::before {
    animation: 0.8s linear 0.8s normal none infinite running load;
    background: #ff0095 none repeat scroll 0 0;
}
#loader .lading {
    background-position: 50% 50%;
    background-repeat: no-repeat;
    bottom: -40px;
    height: 20px;
    left: 0;
    position: absolute;
    right: 0;
    width: 180px;
}
@keyframes load {
100% {
    opacity: 0;
    transform: scale(1);
}
}
@keyframes load {
100% {
    opacity: 0;
    transform: scale(1);
}

</style>

<script>

	$(function() {
		$('[data-toggle="tooltip"]').tooltip('show');	
		$('.tooltip').css({'top': '1850px'});
		$('.tooltip').css({'left': '230px'});
		$(".item").not("#0").removeClass("active");
		$(".imageList").eq(0).css({
			width : '300px',
			height : '200px'
		});
		$(".imageList").eq(1).css({
			width : '300px',
			height : '200px'
		});

		$(".imageList").on("click", function() {
			var src = $(this).attr("src");
			$("#targetImage").attr("src", src);
		});
	})

	////////////////////////////////////////////////////////////////////////////////
	$(function() {
		$("#storesellStatue").click(function(event) {

			$.ajax({
				url : "/gongmo/member/storesellStatue.action",
				type : "post",
				data : {
					storeNo : $(this).attr('data-storeNo')
				},
				success : function(data, status, xhr) {
					if (data == "success") {
						alert('정상적으로 판매 완료처리가 되었습니다.');
						//화면 리프레쉬
						location.reload();
					} else {
						alert('정상적이지 않은 처리입니다.');
					}
				}
			});
		});
	});
</script>

</head>
<body>

	<c:import url="/WEB-INF/views/include/header.jsp" />

	<!-- ///////////////////////////carousel(부트스트랩)////////////////////// -->
	<div style="z-index:-9999; width: 75%; margin: auto" id="carousel-example-generic" 
		class="carousel slide" data-ride="carousel" data-interval="3000">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0"
				class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
			<li data-target="#carousel-example-generic" data-slide-to="2"></li>
		</ol>
		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<c:forEach var="storeImages" items="${storeImages}"
				varStatus="status">
				<div class="item active" id="${status.index}">
					<img class="abc"
						style="width: 100%; height: 400px; margin-left: auto; margin-right: auto; display: block;"
						src="/gongmo/resources/upload/${storeImages.uploadFileName}">
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- Controls -->


	<!-- ///////////////////////////carousel(부트스트랩) 끝!!!!!!////////////////////// -->
	<div class="container" id="store">
		<div class="row">
			<div class="col-md-3 col-md-offset-1">
				<h3>매물 이름</h3>
			</div>
			<div data-id="storeName" class="col-md-2" id="storeName" style="width: 330px">
				<h3>${store.storeName}</h3>
			</div>
			<c:choose>
				<c:when test="${not empty sessionScope.loginuser && store.sellStatue != 'true' }">
					<a class="btn" style="color: black; margin-top :17px; background-color: aliceblue"
							data-toggle="modal" data-dismiss="modal" data-target="#myModal12">판매정보 변경(판매 완료)</a>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
		</div>
		<hr>

		<div class="row">
			<div class="col-md-3 col-md-offset-1">
				<h3>타입</h3>
			</div>
			<div class="col-md-2" style="width: 330px">
				<h3>${store.type}&nbsp;&nbsp;</h3>
			</div>
			<c:choose>
				<c:when test="${store.sellStatue == 'true'}">
					<div class="col-md-3">
						<h3>판매 완료</h3>
					</div>
				</c:when>
				<c:otherwise>
					<div class="col-md-3">
						<h3>판매 중</h3>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
		
		<hr>
		<div class="row">
			<c:choose>
				<c:when test="${store.leaseOrDealing == '매매'}">
					<div class="col-md-3 col-md-offset-1">
						<h3>매매</h3>
					</div>
					<div data-id="dealingPrice" class="col-md-2">
						매매 대금 :
						<h4>${store.dealingPrice} 만원</h4>
					</div>
					<div data-id="leasePremium" class="col-md-2">
						권리금 :
						<h4>${store.leasePremium} 만원</h4>
					</div>
					<div data-id="salesMonthly" class="col-md-2">
						월매출 :
						<h4>${store.salesMonthly} 만원</h4>
					</div>
				</c:when>
				<c:when test="${store.leaseOrDealing == '임대'}">
					<div class="col-md-3 col-md-offset-1">
						<h3>임대</h3>
					</div>
					<div data-id="leaseDeposit" class="col-md-2">
						임대 보증금 :
						<h5>${store.leaseDeposit} 만원</h5>
					</div>
					<div data-id="leaseMonthlyRent" class="col-md-2">
						월세 :
						<h5>${store.leaseMonthlyRent} 만원</h5>
					</div>
					<div data-id="leasePremium" class="col-md-2">
						권리금 :
						<h5>${store.leasePremium} 만원</h5>
					</div>
					<div data-id="salesMonthly" class="col-md-2">
						월매출 :
						<h5>${store.salesMonthly} 만원</h5>
					</div>
				</c:when>
			</c:choose>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-3 col-md-offset-1">
				<h3>수익 정보</h3>
			</div>
			<div data-id="salesMonthlyProfit" class="col-md-2">
				월 수익 :
				<h4>${salesMonthlyProfit} 만원</h4>
			</div>
			<div data-id="salesEarningsRate" class="col-md-2">
				수익률 :
				<h4>${salesEarningsRate}%</h4>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-3 col-md-offset-1">
				<h3>매물 정보</h3>
			</div>
			<div data-id="storeFloor" class="col-md-2">층수 :
				${store.storeFloor}</div>
			<div data-id="pyeong" class="col-md-2">면적(평) : ${store.pyeong}</div>
			<div data-id="enterDay" class="col-md-2">입점 가능일 :
				${store.enterDay}</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-3 col-md-offset-1">
				<h3>매물 위치</h3>
			</div>
			<div data-id="storeAddress" value="${store.storeAddress}" style="width: 500px"
				class="col-md-2" id="storeAddress">주소 : ${store.storeAddress}</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-3 col-md-offset-1">
				<h3>교통 정보</h3>
			</div>
			<div data-id="aroundSubway" class="col-md-2"  style="width: 500px">주변 지하철 정보 :
				${store.aroundSubway}</div>
				<br /><br />
			<div data-id="etcTraffic" class="col-md-2"  style="width: 500px">기타 교통정보 :
				${store.etcTraffic}</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-3 col-md-offset-1">
				<h3>기 타</h3>
			</div>
			<div data-id="admittedNum" class="col-md-2">수용가능인원 :
				${store.admittedNum}</div>
			<div data-id="salesExplanation" class="col-md-2">설명 :
				${store.salesExplanation}</div>
			<div data-id="storeFeature" class="col-md-2">특징 :
				${store.storeFeature}</div>
			<div data-id="availableParkingNum" class="col-md-2">주차 가능 수 :
				${store.availableParkingNum}대</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-3 col-md-offset-1">
				<h3>판매자 정보</h3>
			</div>
			<div data-id="storeName" class="col-md-2">이름 :
				${storemember.name}</div>
			<div data-id="phone" class="col-md-2">연락처 :
				${storemember.phone}</div>
			<div data-id="canCallTime" class="col-md-2">통화 가능 시간 :
				${store.canCallTime}</div>
		</div>
		<hr>
		
		
		<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
		<div class="row" style="padding-top: 5px;">
			<div class="col-md-offset-1">
				<c:forEach var="storeImage" items="${storeImages}" varStatus="status">

					<div style="display: inline;" data-toggle="modal" data-target="#myModal11">
						<img class="imageList" style="width: 200px; height: 200px;" src="/gongmo/resources/upload/${storeImage.uploadFileName}" />
					</div>
					<c:if test="${status.index==1}">
						<div class="row" style="padding-top: 5px;">
							<div class="col-md-offset-1">
					</c:if>
					<c:if test="${status.last == true }">
					</div>
					</div>					
					</c:if>
				</c:forEach>		
				
				
		<br />

	</div><!-- container end -->
	
		<hr>	
		<div class="buttons" style="text-align: center"> 
			<a href='storeList.action?memberNo=${loginuser.memberNo}' style="font-size: 30px">목록보기</a>
		</div>
		<br /><br />
			
		 <div id=firstmap>
		 	<a data-toggle="tooltip" data-placement="top" title="지도를 클릭 해보세요"></a>
		 	<div id="map" style="width:100%;height:500px;"></div>
		 	<br><br><br>
		</div> 
				
				
			
		
		
			
	
		
<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<!--숙소 이미지 Modal -->

	<div class="modal fade" id="myModal11" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">가게 이미지</h4>
				</div>
				<div class="modal-body">
					<img id="targetImage"
						style="width: 570px; height: 400px; margin-left: auto; margin-right: auto;"
						src="">
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

		<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
		<div class="modal fade" id="myModal12" aria-labelledby="myModalLabel"
			aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<!-- <button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">판매 정보를 판매완료로 변경하시겠습니까? 판매 완료면 완료버튼을 눌러주세요.</span>
					</button> -->
						<h3>판매 정보를 판매완료로 변경하시겠습니까? 판매 완료면 완료버튼을 눌러주세요.</h3>
						<button type="button" class="btn btn-primary" data-dismiss="modal">Close</button>

						<input type="button" value="판매 완료" class="btn btn-warning"
							data-storeNo="${store.storeNo}" id="storesellStatue" />

					</div>
				</div>
			</div>
		</div>

<style>
/* 밑에는 구글차트 레이아웃 스타일 */
 .box {
	background: #fff;
	transition: all 0.2s ease;
	border: 2px dashed #dadada;
	margin-top: 10px;
	box-sizing: border-box;
	border-radius: 5px;
	background-clip: padding-box;
	padding: 0 20px 20px 20px;
	min-height: 340px;
}

.box:hover {
	border: 2px solid #525C7A;
}

.box span.box-title {
	color: #fff;
	font-size: 24px;
	font-weight: 300;
	text-transform: uppercase;
}

.box .box-content {
	padding: 16px;
	border-radius: 0 0 2px 2px;
	background-clip: padding-box;
	box-sizing: border-box;
}

.box .box-content p {
	color: #515c66;
	text-transform: none;
} 
</style>

	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<!--구글 차트 -->
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=c6292734fec2c656a1ae18a9086544ba"></script>
	<script type='text/javascript' src='http://www.google.com/jsapi'></script>
	<script src="//d3js.org/d3.v3.min.js"></script>
	<!-- d3.js로 json데이터 파일 읽기 -->
	<script>
		var storePointJson = ${storePointJson};//해당 가게 좌표
		var storeNo = ${storeNo};//가게번호
		var subwayItems = [];
		var customOverlay;
		var storeAddrLat;
		var storeAddrLng;
		var chart6;
		var map0;
		var upjongChart;
		var current;

		//전국매출정보
		var wholeCountrySales;
		//d3.json으로 wholeCountrySales.json파일 읽어들임
		d3.json("/gongmo/resources/wholeCountrySales.json", function(data) {

			wholeCountrySales = data;
			console.log(wholeCountrySales);
		});

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(storePointJson.lat,
					storePointJson.lng), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption);

		//마커가 표시될 위치입니다 
		var markerPosition = new daum.maps.LatLng(storePointJson.lat,
				storePointJson.lng);

		// 마커를 생성합니다
		var marker = new daum.maps.Marker({
			position : markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map); //해당 가게 마커

		var arroundPark = [];
		var arroundSubway = [];
		var arroundSchool = [];

		var carparkPositions = [];
		var subwayPositions = [];
		var schoolPositions = [];

		var markerImageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/category.png'; // 마커이미지의 주소입니다. 스프라이트 이미지 입니다

		coffeeMarkers = [], // 커피숍 마커 객체를 가지고 있을 배열입니다
		storeMarkers = [], // 편의점 마커 객체를 가지고 있을 배열입니다
		carparkMarkers = []; // 주차장 마커 객체를 가지고 있을 배열입니다 

		daum.maps.event
				.addListener(
						map,
						'click',
						function(mouseEvent) {

							// 클릭한 위도, 경도 정보를 가져옵니다 
							var latlng = mouseEvent.latLng;

							if (customOverlay == null) {
								// 커스텀 오버레이에 표시할 내용입니다     
								// HTML 문자열 또는 Dom Element 입니다 
								var content = '<div class="overlaybox">'
										+ '    <div class="boxtitle">반경상권 자동 그리기</div>'
										+ '    <ul>'
										+ '        <li class="up">'
										+ '            <span class="number"></span>'
										+ '            <span class="title">반경선택</span>'
										+ '        </li>' + '    </ul>'
										+ '	  <select id=radius>'
										+ '	  		<option>100m</option>'
										+ '			<option>200m</option>'
										+ '			<option>300m</option>'
										+ '			<option>400m</option>'
										+ '			<option>500m</option>'
										+ '			<option>600m</option>'
										+ '			<option>700m</option>'
										+ '		</select>'
										+ '		<button id=radiusBtn>확인</button>'
										+ '</div>';

								// 커스텀 오버레이를 생성하고 지도에 표시한다
								customOverlay = new daum.maps.CustomOverlay({
									map : map,
									clickable : true, // 커스텀 오버레이 클릭 시 지도에 이벤트를 전파하지 않도록 설정한다
									content : content,
									position : new daum.maps.LatLng(latlng
											.getLat(), latlng.getLng()), // 커스텀 오버레이를 표시할 좌표
									xAnchor : 0.5, // 컨텐츠의 x 위치
									yAnchor : 0.4
								// 컨텐츠의 y 위치
								});

								$('.overlaybox #radiusBtn')
										.on(
												'click',
												function() {

													//화면을 가리고 로딩 이미지를 띄어줌(7초간)
													wrapWindowByMask();
													setTimeout(function() {
														closeWindowByMask();
													}, 7000);

													var radius = $(
															'.overlaybox #radius option:selected')
															.val();//100m 등등
													var subRadius = radius
															.substring(0, 3);
													customOverlay.setMap(null); // 커스텀 오버레이를 지도에서 제거한다.

													$('#firstmap').empty();
													//$('#firstmap').append("<div style='width:100px;height:100px;border:solid 1px black' onclick='alert(10);'>1111</div>");
													$('#firstmap')
															.append(
																	"<div class='container'>"
																			+ "<div class='row'>"
																			+ "<div class='col-xs-18 col-sm-6 col-md-6'>"
																			+ "<div class='thumbnail'>"
																			+ "<div id='mapwrap'> "
																			+ "<div id='map0' style='width:545px;height:300px;'></div>"
																			+ "<div class='category'>"
																			+ "<ul>"
																			+ "<li id='coffeeMenu' onclick='changeMarker(10)'>"
																			+ "<span class='ico_comm ico_coffee'></span>"
																			+ "주차장"
																			+ "</li>"
																			+ "<li id='storeMenu' onclick='changeMarker(20)'>"
																			+ "<span class='ico_comm ico_store'></span>"
																			+ "중개업소"
																			+ "</li>"
																			+ "<li id='carparkMenu' onclick='changeMarker(30)'>"
																			+ "<span class='ico_comm ico_carpark'></span>"
																			+ "학교"
																			+ "</li>"
																			+ "</ul>"
																			+ "</div>"
																			+ "</div><!-- maprap END -->"
																			+ "<div class='caption'>"
																			+ "<h4>해당 반경 내의 주요 집객 시설</h4>"
																			+ "<p>주요/집객 시설정보는 유사한 성격의 유동인구를 지속적으로 발생시키므로 유동인구의 규모와 성격을 파악하는데 유익한 자료입니다."
																			+ "또한 주요/집객시설의 위치와 교통정보를 통해 유동인구 동선파악이 가능하며, 업종구성과 고객흡인을 위한 전략수립에 참고할 수 있습니다.</p>"
																			+ "<a href='#' class='btn btn-default btn-xs pull-right' role='button'><i class='glyphicon glyphicon-edit'></i></a> <a href='#' class='btn btn-info btn-xs' role='button'>Button</a> <a href='#' class='btn btn-default btn-xs' role='button'>Button</a>"
																			+ "</div>"
																			+ "</div>"
																			+ "</div>"
																			+ "<div class='col-xs-18 col-sm-6 col-md-6'>"
																			+ "<div class='thumbnail'>"
																			+ "<!-- <div id=map2 style='width:640px;height:300px;'></div> -->"
																			+ "<div id=map2 style='width:545px;height:300px;'></div>"
																			+ "<div class='caption'>"
																			+ "<h4>해당 반경 내의 유사 업종 상가</h4>"
																			+ "<p>유사업종의 현황을 통해 경쟁관계가 심한지 보완관계를 통해 사업에 도움이 될 수 있을지를 가늠할 수 있습니다."
																			+ "유사업종은 업소의 지역집중정도에 따라 보완관계와 경쟁관계가 다르게 나타날 수 있습니다."
																			+ "(예: 한식과 양식업종은 먹자골목 내에서는 보완관계, 근린상가에서는 경쟁관계)</p>"
																			+ "<a href='#' class='btn btn-default btn-xs pull-right' role='button'><i class='glyphicon glyphicon-edit'></i></a> <a href='#' class='btn btn-info btn-xs' role='button'>Button</a> <a href='#' class='btn btn-default btn-xs' role='button'>Button</a>"
																			+ "</div>"
																			+ "</div>"
																			+ "</div>"
																			+ "</div><!-- row END -->"
																			+ "<div class='row'>"
																			+ "<div class='col-md-4 text-center'>"
																			+ "<div class='box'>"
																			+ "<div class='box-content'>"
																			+ "<div id='columnchart_material3' style='width: 300px; height: 300px;'></div>"
																			+ "<hr />"
																			+ "<p>지하철역과 버스정류장은 유동인구를 유발하는 중요한 입지 요소이며 지하철역 승하차 인원과 "
																			+ "버스정류장수를 통해 유동인구를 예측 할 수 있습니다. 동일 도로의 지하철역과 지하철역 사이는 "
																			+ "유동인구가 적을 수 있으며 버스정류장과 횡단보도가 인접하는 교차로는 유동인구를 머무르게 하는 효과가 있습니다.</p>"
																			+ "<br />"
																			+ "<a href='#' class='btn btn-block btn-primary'>Learn more</a>"
																			+ "</div>"
																			+ "</div>"
																			+ "</div>"
																			+ "<div class='col-md-4 text-center'>"
																			+ "<div class='box'>"
																			+ "<div class='box-content'>"
																			+ "<div id='columnchart_material' style='width: 300px; height: 300px;'></div> "
																			+ "<hr />"
																			+ "<p>지하철역과 버스정류장은 유동인구를 유발하는 중요한 입지 요소이며 지하철역 승하차 인원과 "
																			+ "버스정류장수를 통해 유동인구를 예측 할 수 있습니다. 동일 도로의 지하철역과 지하철역 사이는 "
																			+ "유동인구가 적을 수 있으며 버스정류장과 횡단보도가 인접하는 교차로는 유동인구를 머무르게 하는 효과가 있습니다.</p>"
																			+ "<br />"
																			+ "<a href='#' class='btn btn-block btn-primary'>Learn more</a>"
																			+ "</div>"
																			+ "</div>"
																			+ "</div>"
																			+ "<div class='col-md-4 text-center'>"
																			+ "<div class='box'>"
																			+ "<div class='box-content'>"
																			+ "<div id='columnchart_material2' style='width: 300px; height: 300px;'></div> "
																			+ "<hr />"
																			+ "<p>지하철역과 버스정류장은 유동인구를 유발하는 중요한 입지 요소이며 지하철역 승하차 인원과 "
																			+ "버스정류장수를 통해 유동인구를 예측 할 수 있습니다. 동일 도로의 지하철역과 지하철역 사이는 "
																			+ "유동인구가 적을 수 있으며 버스정류장과 횡단보도가 인접하는 교차로는 유동인구를 머무르게 하는 효과가 있습니다.</p>"
																			+ "<br />"
																			+ "<a href='#' class='btn btn-block btn-primary'>Learn more</a>"
																			+ "</div>"
																			+ "</div>"
																			+ "</div>"
																			+ "</div>"
																			+ "<div class='row'>"
																			+ "<div class='col-md-7 text-center'>"
																			+ "<div class='box'>"
																			+ "<div class='box-content'>"
																			+ "<div id='visualization'></div>"
																			+ "<hr />"
																			+ "<p>매출액 통계는 카드사 가맹점 매출통계를 기반으로 추정된 정보로서, "
																			+ "세부적인 조건(점포면적, 점포 위치의 입지조건, 서비스 품질 등)에 따라 달라질 수 있으니 참고정보로만 활용하시기 바랍니다.</p>"
																			+ "<br />"
																			+ "<a href='#' class='btn btn-block btn-primary'>Learn more</a>"
																			+ "</div>"
																			+ "</div>"
																			+ "</div>"
																			+

																			"<div class='col-xs-18 col-sm-6 col-md-5' style='padding-top:10px'>"
																			+ "<div class='panel panel-success filterable'>"
																			+ "<div class='panel-heading'>"
																			+ "<h3 class='panel-title'>Users</h3>"
																			+ "<div class='pull-right'>"
																			+ "</div>"
																			+ "</div>"
																			+ "<div style='overflow:scroll;height:250px'>"
																			+ "<table class='table '>"
																			+ "<tbody>"
																			+ "<tr>"
																			+ "<td>상호명</td>"
																			+ "<td>소분류명</td>"
																			+ "<td>지번주소</td>"
																			+ "<td>층</td>"
																			+ "<td>전화</td>"
																			+ "</tr>"
																			+ "</tbody>"
																			+ "</table>"
																			+ "</div>"
																			+ "</div>"
																			+

																			"<div class='panel panel-warning filterable'>"
																			+ "<div class='panel-heading'>"
																			+ "<h3 class='panel-title'>Users</h3>"
																			+ "<div class='pull-right'>"
																			+ "</div>"
																			+ "</div>"
																			+ "<div id='dual_x_div' style='width: 300px; height: 300px;'></div>"
																			+ "</div>"
																			+

																			"</div><!--<div class='col-xs-18 col-sm-6 col-md-5' style='padding-top:10px'> END-->"
																			+

																			"</div><!-- row END -->"
																			+ "</div><!-- container END -->"
																			+ "<br><br>");

													var mapContainer0 = document
															.getElementById('map0'), // 지도를 표시할 div 
													mapOption0 = {
														center : new daum.maps.LatLng(
																storePointJson.lat,
																storePointJson.lng), // 지도의 중심좌표
														level : 3
													// 지도의 확대 레벨
													};
													// 지도를 생성합니다    
													map0 = new daum.maps.Map(
															mapContainer0,
															mapOption0);
													//마커가 표시될 위치입니다 
													var markerPosition = new daum.maps.LatLng(
															storePointJson.lat,
															storePointJson.lng);
													// 마커를 생성합니다
													var marker = new daum.maps.Marker(
															{
																position : markerPosition
															});
													// 마커가 지도 위에 표시되도록 설정합니다
													marker.setMap(map0); //해당 가게 마커

													// 지도에 표시할 원을 생성합니다
													var circle = new daum.maps.Circle(
															{
																center : new daum.maps.LatLng(
																		storePointJson.lat,
																		storePointJson.lng), // 원의 중심좌표 입니다 
																radius : subRadius, // 미터 단위의 원의 반지름입니다 
																strokeWeight : 3, // 선의 두께입니다 
																strokeColor : '#FCDB1E', // 선의 색깔입니다
																strokeOpacity : 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
																strokeStyle : 'solid', // 선의 스타일 입니다
																fillColor : '#FCDB1E', // 채우기 색깔입니다
																fillOpacity : 0.3
															// 채우기 불투명도 입니다   
															});

													// 지도에 원을 표시합니다 
													circle.setMap(map0);

													$
															.ajax({
																type : "get",
																url : "/gongmo/member/getRadius.action",
																data : {
																	storeLat : storePointJson.lat,
																	storeLng : storePointJson.lng,
																	radius : subRadius,
																	storeNo : storeNo
																},
																success : function(
																		data,
																		status,
																		xhr) {

																	var arroundStore = data
																			.split('|');
																	arroundPark = arroundStore[0];
																	arroundSubway = arroundStore[1];
																	arroundSchool = arroundStore[2];
																	subwayItems = arroundStore[3];//인근 지하철역들 승하차인원 아이템 초기화(구글차트)
																	dateSubwayItems = arroundStore[4];//요일별 지하철 승하차인원 아이템 초기화(구글차트2)
																	busStationItems = arroundStore[5];//인근 버스정류장 승하차인원 아이템 초기화(구글차트3)
																	aroundStoreItems = arroundStore[6];//반경내의 현 매물의 같은 업종 상가아이템 초기화(지도2)

																	arroundPark = eval(arroundPark);
																	arroundSubway = eval(arroundSubway);
																	arroundSchool = eval(arroundSchool);
																	subwayItems = eval(subwayItems);//인근 지하철역들 승하차인원 아이템 초기화(구글차트)
																	dateSubwayItems = eval(dateSubwayItems);//요일별 지하철 승하차인원 아이템 초기화(구글차트2)
																	busStationItems = eval(busStationItems);//인근 버스정류장 승하차인원 아이템 초기화(구글차트3)
																	aroundStoreItems = eval(aroundStoreItems);//반경내의 현 매물의 같은 업종 상가아이템 초기화(지도2)
																	console
																			.log(arroundPark)
																	console
																			.log(arroundSubway)
																	console
																			.log(arroundSchool)
																	console
																			.log(subwayItems)
																	console
																			.log(dateSubwayItems)
																	console
																			.log(busStationItems)
																	console
																			.log(aroundStoreItems);
																	// 주차장 마커가 표시될 좌표 배열입니다
																	for (var i = 0; i < arroundPark.length; i++) {
																		carparkPositions
																				.push(new daum.maps.LatLng(
																						arroundPark[i].latitude,
																						arroundPark[i].longitude));
																	}

																	// 지하철 마커가 표시될 좌표 배열입니다
																	for (var i = 0; i < arroundSubway.length; i++) {
																		subwayPositions
																				.push(new daum.maps.LatLng(
																						arroundSubway[i].latitude,
																						arroundSubway[i].longitude));
																	}

																	//학교 마커가 표시될 좌표 배열입니다
																	for (var i = 0; i < arroundSchool.length; i++) {
																		schoolPositions
																				.push(new daum.maps.LatLng(
																						arroundSchool[i].latitude,
																						arroundSchool[i].longitude));
																	}

																	createCoffeeMarkers(); // 커피숍 마커를 생성하고 커피숍 마커 배열에 추가합니다
																	createStoreMarkers(); // 편의점 마커를 생성하고 편의점 마커 배열에 추가합니다
																	createCarparkMarkers(); // 주차장 마커를 생성하고 주차장 마커 배열에 추가합니다

																	changeMarker(10);

																	//id=map2에 유사업종을 뿌려줌
																	getMap2ByUpjong();

																	///////////////////////////////////////밑에 구글 차트///////////////////////////////////////////
																	console
																			.log(subwayItems);
																	google.charts
																			.load(
																					'current',
																					{
																						'packages' : [
																								'bar',
																								'line',
																								'geochart',
																								'corechart' ]
																					});
																	google.charts
																			.setOnLoadCallback(drawChart);

																	function drawChart() {

																		getSubwayItem();

																		getSubwayItemByDate();

																		getButStaionInfo();

																		getGeoChart();

																		getUpjongChart();
																	} //drawChart() END

																	////////////////////////////////////유사업종List/////////////////////////////////////////////////////

																	$
																			.each(
																					aroundStoreItems,
																					function(
																							index,
																							aroundStoreItem) {
																						$(
																								'.filterable tbody')
																								.append(
																										"<tr>"
																												+ "<td>"
																												+ aroundStoreItem.bizesNm
																												+ "</td>"
																												+ "<td>"
																												+ aroundStoreItem.indsSclsNm
																												+ "</td>"
																												+ "<td>"
																												+ aroundStoreItem.lnoAdr
																												+ "</td>"
																												+ "<td>"
																												+ aroundStoreItem.flrNo
																												+ "</td>"
																												+ "<td>"
																												+ aroundStoreItem.telno
																												+ "</td>"
																												+ "</tr>");
																					});

																}//ajax(success 메소드 END)
															});//ajax End

												});//$('.overlaybox #radiusBtn').on('click') End  

							}//if(customOverlay == null) End

						}); //map Click End */

		////////////////////////////////////////////////////////////////////////////////////////

		// 마커이미지의 주소와, 크기, 옵션으로 마커 이미지를 생성하여 리턴하는 함수입니다
		function createMarkerImage(src, size, options) {
			var markerImage = new daum.maps.MarkerImage(src, size, options);
			return markerImage;
		}

		// 좌표와 마커이미지를 받아 마커를 생성하여 리턴하는 함수입니다
		function createMarker(position, image) {
			var marker = new daum.maps.Marker({
				position : position,
				image : image
			});

			return marker;
		}

		// 커피숍 마커를 생성하고 커피숍 마커 배열에 추가하는 함수입니다
		function createCoffeeMarkers() {

			for (var i = 0; i < carparkPositions.length; i++) {

				var imageSize = new daum.maps.Size(22, 26), imageOptions = {
					spriteOrigin : new daum.maps.Point(10, 0),
					spriteSize : new daum.maps.Size(36, 98)
				};

				// 마커이미지와 마커를 생성합니다
				var markerImage = createMarkerImage(markerImageSrc, imageSize,
						imageOptions), marker = createMarker(
						carparkPositions[i], markerImage);

				// 생성된 마커를 커피숍 마커 배열에 추가합니다
				coffeeMarkers.push(marker);

			}
		}

		// 커피숍 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setCoffeeMarkers(map) {
			for (var i = 0; i < coffeeMarkers.length; i++) {
				coffeeMarkers[i].setMap(map);
			}
		}

		// 편의점 마커를 생성하고 편의점 마커 배열에 추가하는 함수입니다
		function createStoreMarkers() {
			for (var i = 0; i < subwayPositions.length; i++) {

				var imageSize = new daum.maps.Size(22, 26), imageOptions = {
					spriteOrigin : new daum.maps.Point(10, 36),
					spriteSize : new daum.maps.Size(36, 98)
				};

				// 마커이미지와 마커를 생성합니다
				var markerImage = createMarkerImage(markerImageSrc, imageSize,
						imageOptions), marker = createMarker(
						subwayPositions[i], markerImage);

				// 생성된 마커를 편의점 마커 배열에 추가합니다
				storeMarkers.push(marker);
			}
		}

		// 편의점 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setStoreMarkers(map) {
			for (var i = 0; i < storeMarkers.length; i++) {
				storeMarkers[i].setMap(map);
			}
		}

		// 주차장 마커를 생성하고 주차장 마커 배열에 추가하는 함수입니다
		function createCarparkMarkers() {
			for (var i = 0; i < schoolPositions.length; i++) {

				var imageSize = new daum.maps.Size(22, 26), imageOptions = {
					spriteOrigin : new daum.maps.Point(10, 72),
					spriteSize : new daum.maps.Size(36, 98)
				};

				// 마커이미지와 마커를 생성합니다
				var markerImage = createMarkerImage(markerImageSrc, imageSize,
						imageOptions), marker = createMarker(
						schoolPositions[i], markerImage);

				// 생성된 마커를 주차장 마커 배열에 추가합니다
				carparkMarkers.push(marker);
			}
		}

		// 주차장 마커들의 지도 표시 여부를 설정하는 함수입니다
		function setCarparkMarkers(map) {
			for (var i = 0; i < carparkMarkers.length; i++) {
				carparkMarkers[i].setMap(map);
			}
		}

		// 카테고리를 클릭했을 때 type에 따라 카테고리의 스타일과 지도에 표시되는 마커를 변경합니다
		function changeMarker(type) {

			var coffeeMenu = document.getElementById('coffeeMenu');
			var storeMenu = document.getElementById('storeMenu');
			var carparkMenu = document.getElementById('carparkMenu');

			// 커피숍 카테고리가 클릭됐을 때
			if (type === 10) {

				// 커피숍 카테고리를 선택된 스타일로 변경하고
				coffeeMenu.className = 'menu_selected';

				// 편의점과 주차장 카테고리는 선택되지 않은 스타일로 바꿉니다
				storeMenu.className = '';
				carparkMenu.className = '';

				// 커피숍 마커들만 지도에 표시하도록 설정합니다
				setCoffeeMarkers(map0);
				setStoreMarkers(null);
				setCarparkMarkers(null);

			} else if (type === 20) { // 편의점 카테고리가 클릭됐을 때

				// 편의점 카테고리를 선택된 스타일로 변경하고
				coffeeMenu.className = '';
				storeMenu.className = 'menu_selected';
				carparkMenu.className = '';

				// 편의점 마커들만 지도에 표시하도록 설정합니다
				setCoffeeMarkers(null);
				setStoreMarkers(map0);
				setCarparkMarkers(null);

			} else if (type === 30) { // 주차장 카테고리가 클릭됐을 때

				// 주차장 카테고리를 선택된 스타일로 변경하고
				coffeeMenu.className = '';
				storeMenu.className = '';
				carparkMenu.className = 'menu_selected';

				// 주차장 마커들만 지도에 표시하도록 설정합니다
				setCoffeeMarkers(null);
				setStoreMarkers(null);
				setCarparkMarkers(map0);
			}
		}

		function getSubwayItem() {
			var dataSubwayItems = [];//2차원배열	
			dataSubwayItems.push([ '정류장 ', '승차인원', '하차인원' ]);

			for (var i = 0; i < subwayItems.length; i++) {
				var dataSubwayItem = [];
				dataSubwayItem.push(subwayItems[i].SUB_STA_NM);
				dataSubwayItem.push(subwayItems[i].RIDE_PASGR_NUM);
				dataSubwayItem.push(subwayItems[i].ALIGHT_PASGR_NUM);
				dataSubwayItems.push(dataSubwayItem);//2차원배열
			}

			var data = google.visualization.arrayToDataTable(dataSubwayItems);

			var options = {
				chart : {
					title : '반경 2km 내의 지하철역 승하차 인원',
					subtitle : '2016-02-26',
				},
				width : 300,
				height : 300
			};

			var chart = new google.charts.Bar(document
					.getElementById('columnchart_material'));

			chart.draw(data, options);
		}

		//두번째 차트(지하철 요일별 승하차 인원)
		function getSubwayItemByDate() {
			var dataSubwayItems2 = [];//2차원배열	

			var days = [ '일', '월', '화', '수', '목', '금', '토' ];

			for (var i = 0; i < dateSubwayItems.length; i++) {
				var dataSubwayItem2 = [];
				dataSubwayItem2.push(days[i]);//지하철 역명 대신 요일이 들어가야 한다
				dataSubwayItem2
						.push(parseInt(dateSubwayItems[i].RIDE_PASGR_NUM));
				dataSubwayItem2
						.push(parseInt(dateSubwayItems[i].ALIGHT_PASGR_NUM));
				dataSubwayItems2.push(dataSubwayItem2);//2차원배열
			}

			var data2 = new google.visualization.DataTable();

			data2.addColumn('string', dateSubwayItems[0].SUB_STA_NM + "역");
			data2.addColumn('number', '승차인원');
			data2.addColumn('number', '하차인원');

			data2.addRows(dataSubwayItems2);

			var options2 = {
				chart : {
					title : '가장 가까운 지하철역 요일별 승하차 인원',
					subtitle : '2016/06/12-2016/06/18',
				},
				format : 'decimal'
			};

			var chart2 = new google.charts.Line(document
					.getElementById('columnchart_material2'));

			chart2.draw(data2, options2);

		}

		//인근 버스 정류장 승하차인원
		function getButStaionInfo() {

			var dataBusStationItems = [];//2차원배열	
			dataBusStationItems.push([ '정류장', '승차인원', '하차인원' ]);

			for (var i = 0; i < busStationItems.length; i++) {

				var dataBusStationItem = [];
				dataBusStationItem.push(busStationItems[i].BUS_STA_NM);//지하철 역명 대신 요일이 들어가야 한다
				dataBusStationItem.push(busStationItems[i].RIDE_PASGR_NUM);
				dataBusStationItem.push(busStationItems[i].ALIGHT_PASGR_NUM);

				dataBusStationItems.push(dataBusStationItem);//2차원배열
			}

			var data3 = google.visualization
					.arrayToDataTable(dataBusStationItems);

			var options3 = {
				chart : {
					title : '매물 인근 버스 정류장 승하차인원',
					subtitle : '2016-02-26',
				},
			};

			var chart3 = new google.charts.Bar(document
					.getElementById('columnchart_material3'));

			chart3.draw(data3, options3);
		}

		//GeoChart(도,시 별 - 업종 별 매출 액)
		function getGeoChart() {

			var data5 = new google.visualization.DataTable();

			data5.addColumn('string', 'Country');
			data5.addColumn('number', 'Value');
			data5.addColumn({
				type : 'string',
				role : 'tooltip'
			});

			var ivalue = new Array();
			console.log(wholeCountrySales);

			for (var i = 0; i < wholeCountrySales.length; i++) {
				data5.addRows([ [
						{
							v : wholeCountrySales[i].v,
							f : wholeCountrySales[i].region + '   월평균매출액(만원)'
						},
						i,
						'관광/여가/오락:' + wholeCountrySales[i].hobbyMonth
								+ '  생활서비스:'
								+ wholeCountrySales[i].serviceMonth + ' 소매:'
								+ wholeCountrySales[i].retailMonth + '  숙박:'
								+ wholeCountrySales[i].accomodationMonth
								+ '  스포츠:' + wholeCountrySales[i].sportsMonth
								+ '  음식:' + wholeCountrySales[i].foodMonth
								+ '  의료:' + wholeCountrySales[i].medicalMonth
								+ '  학문/교육:'
								+ wholeCountrySales[i].educationMonth ] ]);
				ivalue[wholeCountrySales[i].v] = '#3182BD';
			}

			var options5 = {
				backgroundColor : {
					fill : '#FFFFFF',
					stroke : '#FFFFFF',
					strokeWidth : 0
				},
				colorAxis : {
					minValue : 0,
					maxValue : 21,
					colors : [ '#3182BD', '#3182BD', '#3182BD', '#3182BD',
							'#3182BD', '#3182BD', '#3182BD', '#3182BD',
							'#3182BD', '#9ECAE1', '#9ECAE1', '#9ECAE1',
							'#9ECAE1', '#9ECAE1', '#9ECAE1', '#9ECAE1',
							'#9ECAE1', '#DEEBF7', '#DEEBF7', '#DEEBF7',
							'#DEEBF7', '#DEEBF7', ]
				},
				legend : 'none',
				backgroundColor : {
					fill : '#FFFFFF',
					stroke : '#FFFFFF',
					strokeWidth : 0
				},
				datalessRegionColor : '#f5f5f5',
				displayMode : 'regions',
				enableRegionInteractivity : 'true',
				resolution : 'provinces',
				sizeAxis : {
					minValue : 1,
					maxValue : 1,
					minSize : 10,
					maxSize : 10
				},
				region : 'KR', //country code
				keepAspectRatio : true,
				width : 600,
				height : 400,
				tooltip : {
					textStyle : {
						color : '#444444'
					},
					trigger : 'focus'
				}
			};

			var chart5 = new google.visualization.GeoChart(document
					.getElementById('visualization'));
			google.visualization.events
					.addListener(
							chart5,
							'select',
							function() {
								var selection = chart5.getSelection();
								if (selection.length == 1) {
									var selectedRow = selection[0].row;
									var selectedRegion = data5.getValue(
											selectedRow, 0);
									if (ivalue[selectedRegion] != '') {
										//document.getElementsByTagName('body')[0].style.background=ivalue[selectedRegion]; 

										$
												.each(
														wholeCountrySales,
														function(index,
																wholeCountrySale) {
															if (wholeCountrySale.v == selectedRegion) {

																var data = [
																		[
																				'업종',
																				'월매출',
																				'건단가' ],
																		[
																				'관광/여가/오락',
																				parseInt(wholeCountrySale.hobbyMonth
																						.replace(
																								/,/g,
																								"")),
																				parseInt(wholeCountrySale.hobbyUnitPrice
																						.replace(
																								/,/g,
																								"")) ],
																		[
																				'생활서비스',
																				parseInt(wholeCountrySale.serviceMonth
																						.replace(
																								/,/g,
																								"")),
																				parseInt(wholeCountrySale.serviceUnitPrice
																						.replace(
																								/,/g,
																								"")) ],
																		[
																				'소매',
																				parseInt(wholeCountrySale.retailMonth
																						.replace(
																								/,/g,
																								"")),
																				parseInt(wholeCountrySale.retailUnitPrice
																						.replace(
																								/,/g,
																								"")) ],
																		[
																				'숙박',
																				parseInt(wholeCountrySale.accomodationMonth
																						.replace(
																								/,/g,
																								"")),
																				parseInt(wholeCountrySale.accomodationUnitPrice
																						.replace(
																								/,/g,
																								"")) ],
																		[
																				'스포츠',
																				parseInt(wholeCountrySale.sportsMonth
																						.replace(
																								/,/g,
																								"")),
																				parseInt(wholeCountrySale.sportsUnitPrice
																						.replace(
																								/,/g,
																								"")) ],
																		[
																				'음식',
																				parseInt(wholeCountrySale.foodMonth
																						.replace(
																								/,/g,
																								"")),
																				parseInt(wholeCountrySale.foodUnitPrice
																						.replace(
																								/,/g,
																								"")) ],
																		[
																				'의료',
																				parseInt(wholeCountrySale.medicalMonth
																						.replace(
																								/,/g,
																								"")),
																				parseInt(wholeCountrySale.medicalUnitPrice
																						.replace(
																								/,/g,
																								"")) ],
																		[
																				'학문/교육',
																				parseInt(wholeCountrySale.educationMonth
																						.replace(
																								/,/g,
																								"")),
																				parseInt(wholeCountrySale.educationUnitPrice
																						.replace(
																								/,/g,
																								"")) ] ];

																upjongChart(data);
															}

														})

									}
								}
							});
			chart5.draw(data5, options5);
		}

		function getMap2ByUpjong() {

			//////////////////////////////지도2/////////////////////////////////////////////////////////
			var mapContainer2 = document.getElementById('map2'), // 지도를 표시할 div 
			mapOption2 = {
				center : new daum.maps.LatLng(storePointJson.lat,
						storePointJson.lng), // 지도의 중심좌표
				level : 3
			// 지도의 확대 레벨
			};

			// 지도를 생성합니다    
			var map2 = new daum.maps.Map(mapContainer2, mapOption2);

			for (var i = 0; i < aroundStoreItems.length; i++) {

				var colorCode = "#"
						+ Math.round(Math.random() * 0xFFFFFF).toString(16);//색상 코드 랜덤

				// 지도에 표시할 원을 생성합니다
				var circle2 = new daum.maps.Circle({
					center : new daum.maps.LatLng(aroundStoreItems[i].lat,
							aroundStoreItems[i].lon), // 원의 중심좌표 입니다 
					radius : 30, // 미터 단위의 원의 반지름입니다 
					strokeWeight : 1, // 선의 두께입니다 
					strokeColor : colorCode, // 선의 색깔입니다
					strokeOpacity : 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
					strokeStyle : 'solid', // 선의 스타일 입니다
					fillColor : colorCode, // 채우기 색깔입니다
					fillOpacity : 0.5
				// 채우기 불투명도 입니다   
				});

				// 지도에 원을 표시합니다 
				circle2.setMap(map2);

				//인포윈도우 내용(유사 가게 이름(정보) 표시)
				var iwContent = '<div style="padding:5px;">'
						+ aroundStoreItems[i].bizesNm + '</div>', iwPosition = new daum.maps.LatLng(
						aroundStoreItems[i].lat, aroundStoreItems[i].lon), //인포윈도우 표시 위치입니다
				iwRemoveable = false; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

				// 인포윈도우를 생성하고 지도에 표시합니다
				var infowindow = new daum.maps.InfoWindow({
					map : map2, // 인포윈도우가 표시될 지도
					position : iwPosition,
					content : iwContent,
					removable : iwRemoveable
				});
			}

		}
		function wrapWindowByMask() {
			//화면의 높이와 너비를 구한다.
			var maskHeight = $(document).height();
			//  var maskWidth = $(document).width();
			var maskWidth = window.document.body.clientWidth;

			var mask = "<div id='mask' style='position:absolute; z-index:9000; background-color:#000000; display:none; left:0; top:0;'></div>";
			var loadingImg = '';

			loadingImg += "<div id='loadingImg' style='position:absolute; left:45%; top:2150px; display:none; z-index:10000;'>";
			loadingImg += "<div id='loader'>" + "<div class='dot'></div>"
					+ "<div class='dot'></div>" + "<div class='dot'></div>"
					+ "<div class='dot'></div>" + "<div class='dot'></div>"
					+ "<div class='dot'></div>" + "<div class='dot'></div>"
					+ "<div class='dot'></div>" + "<div class='lading'></div>"
					+ "</div>";
			loadingImg += "</div>";

			//화면에 레이어 추가 
			$('body').append(mask).append(loadingImg)

			//마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
			$('#mask').css({
				'width' : maskWidth,
				'height' : maskHeight,
				'opacity' : '0.3'
			});

			//마스크 표시
			$('#mask').show();

			//로딩중 이미지 표시
			$('#loadingImg').show();
		}

		function closeWindowByMask() {
			$('#mask, #loadingImg').hide();
			$('#mask, #loadingImg').remove();
		}

		function getUpjongChart() {

			var options6 = {
				width : 400,
				height : 240,
				vAxis : {
					title : "Cups"
				},
				hAxis : {
					title : "Month"
				},
				seriesType : "bars",
				series : {
					5 : {
						type : "line"
					}
				},
				animation : {
					startup : true,
					duration : 1000,
					easing : 'out'
				},
			};

			chart6 = new google.visualization.ComboChart(document
					.getElementById('dual_x_div'));
			current = 0;

			////GeoChart에서 호출
			upjongChart = function drawGetUpjongChart(wholeCountrySale) {

				var data6 = new google.visualization.arrayToDataTable(
						wholeCountrySale);
				/* console.log(wholeCountrySale.hobbyUnitPrice);
				console.log(wholeCountrySale.hobbyUnitPrice.replace(/,/g,"")); */

				// Disabling the button while the chart is drawing.
				google.visualization.events.addListener(chart6, 'ready',
						function() {

						});

				chart6.draw(data6, options6);
			}

			var rowData1 = [ [ '업종', '월매출[만원]', '건단가[원]' ],
					[ '관광/여가/오락', 60000, 60000 ], [ '생활서비스', 60000, 60000 ],
					[ '소매', 60000, 60000 ], [ '숙박', 60000, 60000 ],
					[ '스포츠', 60000, 60000 ], [ '음식', 60000, 60000 ],
					[ '의료', 60000, 60000 ], [ '학문/교육', 60000, 60000 ] ];
			upjongChart(rowData1);
		}//function END
	</script>


</body>
</html>




