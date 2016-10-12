<%@ page language="java" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8" />
<title></title>
<link href="/gongmo/resources/styles/css/mainbottomfirst.css" rel="stylesheet">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function() {

		var categoryBigNo;
		var locationSido;

		$("#categoryBigSelect")
				.on(
						"change",
						function() {

							categoryBigNo = $(
									"#categoryBigSelect option:selected").attr(
									"id");

							if (categoryBigNo != null) {

								$
										.ajax({
											type : "get",
											url : "/gongmo/stores/getCategoryMiddleByCategoryBigNo.action",
											data : {
												categoryBigNo : categoryBigNo
											},
											success : function(data, status,
													xhr) {
												var obj = eval(data);
												var objCount = obj.length;

												$("#categoryMiddleSelect")
														.empty();

												for (var i = 0; i < objCount; i++) {
													var $option = $("<option id='categoryMiddleName'value="+obj[i].middleName+">"
															+ obj[i].middleName
															+ "</option>");
													$("#categoryMiddleSelect")
															.append($option);
												}
											}
										});

							}
						});

		$("#locationSido")
				.on(
						"change",
						function() {

							locationSido = $("#locationSido option:selected")
									.attr("id");

							if (locationSido != null) {

								$
										.ajax({
											type : "get",
											url : "/gongmo/stores/getGuGunBySido.action",
											data : {
												locationSido : locationSido
											},
											success : function(data, status,
													xhr) {

												var obj = eval(data);

												var objCount = obj.length;

												$("#locationGugun").empty();

												for (var i = 0; i < objCount; i++) {
													var $option = $("<option id='storeAddress'value="+obj[i]+">"
															+ obj[i]
															+ "</option>");
													$("#locationGugun").append(
															$option);
												}

											}
										});

							}
						});

	});//jquery END
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	$(
			function() {
				$('#search')
						.on(
								'click',
								function(event) {
									$
											.ajax({
												url : "/gongmo/stores/searchlist.action",
												type : "post",
												data : {
													leaseOrDealing : $(
															'#leaseOrDealing')
															.val(),
													name : $(
															'#categoryMiddleSelect > option:selected')
															.val(),
													storeAddress : $(
															'#locationGugun > option:selected')
															.val()
												},

												success : function(data,
														status, xhr) {
													var obj = eval(data);
													var objCount = obj.length;
													var $logmemberNo = $(
															'#logmemberNo')
															.val();
													if (objCount == 0) {
														alert('검색 결과가 없습니다.');
													}
													alert(obj[0].storeNo);
													alert(obj[0].storeImage[0].savedFileName);
													$('#store').empty();
													for (var i = 0; i < objCount; i++) {
														var objCount2 = obj[i].storeImage.length;

														for (var j = 0; j < objCount2; j++) {
															if (obj[i].storeNo == obj[j].storeImage[j].storeNo) {

																var $img = $('<a href="/gongmo/stores/storeBuyDetail.action?storeNo='
																		+ obj[i].storeNo
																		+ '&lonmemberNo='
																		+ $logmemberNo
																		+ '&memberNo='
																		+ obj[i].memberNo
																		+ '"><img src="/gongmo/resources/upload/'
																		+ obj[j].storeImage[0].savedFileName
																		+ '"style="width: auto%; height: 200px"/></a>');
															}
														}
														var $storename = $('<div data-id="storename" style="height: 30px; font-size: 15pt">'
																+ obj[i].storeName
																+ '</div><div id ="store1" class="store"><div data-id="type" style="height: 30px; font-size: 15pt">'
																+ obj[i].type
																+ '</div>');
														if (obj[i].leaseOrDealing == '매매') {
															var $leaseOrDealing = $('<div data-id="leaseordealing" style="">매매 형태 :'
																	+ obj[i].leaseOrDealing
																	+ '</div><div data-id="dealingPrice" style="">매매 대금 :'
																	+ obj[i].dealingPrice
																	+ '</div>');
														}
														if (obj[i].leaseOrDealing == '임대') {
															var $leaseOrDealing = $('<div data-id="leaseordealing" style="">매매 형태 :'
																	+ obj[i].leaseOrDealing
																	+ '</div><div data-id="dealingPrice" style="">매매 대금 :'
																	+ obj[i].dealingPrice
																	+ '</div>');
														}
														var $storeAddress = $('<div data-id="storeAddress" style="">주소 :'
																+ obj[i].storeAddress
																+ '</div></div><div data-id="storeNo" style="display: none">'
																+ obj[i].storeNo
																+ '</div>');
														var $option = $('<div id="stores"class="stores"style="padding: 10px; margin: auto; width: 25%; height: 400px; float: left"></div></div>');
														$("#store")
																.append($img);
														$("#store").append(
																$storename);
														$("#store1")
																.append(
																		$leaseOrDealing);
														$("#store1").append(
																$storeAddress);
														$("#store").append(
																$option);

													}
												},
											});

								})
			})
			
	$(document).ready(function() {
  
	  var $scene = $(".scene"),
	      $content = $(".content"),
	      $back = $(".back"),
	      $backBgs = $(".back__bg"),
	      $front = $(".front"),
	      $frontBgs = $(".front__bg"),
	      $menuBlock = $(".menu__block"),
	      $svgPath = $(".menu__block-svgPath"),
	      animating = false,
	      menuActive = false,
	      menuAnimTime = 600,
	      blockAnimTime = 1500,
	      $sliderCont = $(".menu-slider__content"),
	      curSlide = 1,
	      sliderXDiff = 0,
	      curPage = 1,
	      nextPage = 0,
	      numOfPages = $(".front__bg").length,
	      scaleTime = 500,
	      transTime = 500,
	      totalTime = scaleTime + transTime,
	      changeTimeout,
	      timeoutTime = 8000,
	      winW = $(window).width(),
	      winH = $(window).height();
	  
	  // init nav element timeout animation
	  $(".nav__el-1").addClass("active");
	  
	  //default debounce function from David Walsh blog
	  function debounce(func, wait, immediate) {
	    var timeout;
	    return function() {
	      var context = this, args = arguments;
	      var later = function() {
	        timeout = null;
	        if (!immediate) func.apply(context, args);
	      };
	      var callNow = immediate && !timeout;
	      clearTimeout(timeout);
	      timeout = setTimeout(later, wait);
	      if (callNow) func.apply(context, args);
	    };
	  };
	  
	  function changePages() {
	    $(".back__bg, .front__bg, .nav__el").removeClass("active");
	    $(".nav__el-"+curPage).addClass("active");
	    $back.css("transform", "translate3d(0,"+(curPage-1)*-100+"%,0)");
	    $front.css("transform", "translate3d(0,"+(curPage-1)*100+"%,0)");
	    createTimeout();
	
	    setTimeout(function() {
	      $(".back__bg-"+curPage+", .front__bg-"+curPage).addClass("active");
	    }, totalTime);
	  };
	  
	  $(document).on("click", ".nav__el:not(.active)", function() {
	    curPage = $(this).attr("data-page");
	    changePages();
	  });
	  
	  // ugly hack for animation reset when you coming back from menu section
	  function resetTimeoutAnimation() {
	    var $activeNavEl = $(".nav__el.active"),
	        $activeParts = $activeNavEl.find(".nav__el-clone, .nav__el")
	    $activeParts.addClass("instant");
	    $activeNavEl.removeClass("active");
	    $activeParts.css("top");
	    $activeParts.removeClass("instant");
	    $activeParts.css("top");
	    $activeNavEl.addClass("active");
	  }
	  
	  /* creates timeOut for change of slides.
	  Call's itself from inside of changePages() function
	  */
	  function createTimeout() {
	    window.clearTimeout(changeTimeout);
	    resetTimeoutAnimation();
	    changeTimeout = setTimeout(function() {
	      if (curPage >= numOfPages) {
	        curPage = 1;
	      } else {
	        curPage++;
	      }
	      changePages();
	    }, timeoutTime);
	  };
	  
	  createTimeout();
	  
	  /* creates path D attribute strings for animation
	  initial d = fullScreen
	  mid d = Q curves with 5% padding
	  final d = centered 90% width/height block
	  */
	  function createD(type) {
	    var types = {"init": ["M0,0",
	                          "Q"+winW/2+",0",
	                          winW+",0",
	                          "Q"+winW+","+winH/2,
	                          winW+","+winH,
	                          "Q"+winW/2+","+winH,
	                          "0,"+winH,
	                          "Q0,"+winH/2,
	                          "0,0"],
	                 "mid": ["M0,0",
	                         "Q"+winW/2+","+winH*0.05,
	                         winW+",0",
	                         "Q"+winW*0.95+","+winH/2,
	                         winW+","+winH,
	                         "Q"+winW/2+","+winH*0.95,
	                         "0,"+winH,
	                         "Q"+winW*0.05+","+winH/2,
	                         "0,0"],
	                 "final": ["M"+winW*0.05+","+winH*0.05,
	                           "Q"+winW/2+","+winH*0.05,
	                           winW*0.95+","+winH*0.05,
	                           "Q"+winW*0.95+","+winH/2,
	                           winW*0.95+","+winH*0.95,
	                           "Q"+winW/2+","+winH*0.95,
	                           winW*0.05+","+winH*0.95,
	                           "Q"+winW*0.05+","+winH/2,
	                           winW*0.05+","+winH*0.05]};
	    return types[type].join(" ");
	  }
	  
	  // animates path d with SnapSVG
	  function animateBlock(reverse) {
	    winW = $(window).width();
	    winH = $(window).height();
	    var initD = createD("init"),
	        midD = createD("mid"),
	        finalD = createD("final");
	    
	    if (!reverse) {
	      $svgPath.attr("d", initD);
	      Snap($svgPath[0]).animate({"path": midD}, blockAnimTime/2, mina.elastic, function() {
	        Snap($svgPath[0]).animate({"path": finalD}, blockAnimTime/2, mina.elastic);
	      });
	    } else {
	      Snap($svgPath[0]).animate({"path": midD}, blockAnimTime/2, mina.elastic, function() {
	        Snap($svgPath[0]).animate({"path": initD}, blockAnimTime/2, mina.elastic);
	      });
	    }
	    
	  };
	  
	  // resizes opened menu path d block, because i can't change viewBox with js
	  var resizeSvg = debounce(function() {
	    winW = $(window).width();
	    winH = $(window).height();
	    $svgPath.attr("d", createD("final"));
	  }, 50);
	  
	  // default madness
	  $(document).on("click", ".menu__btn", function() {
	    if (animating) return;
	    animating = true;
	    setTimeout(function() {
	      animating = false;
	    }, blockAnimTime + menuAnimTime);
	    
	    if (!menuActive) {
	      menuActive = true;
	      window.clearTimeout(changeTimeout);
	      $content.addClass("inactive");
	      $scene.addClass("menu-visible");
	      $(".back__bg:not(.active)").addClass("hidden");
	      $(window).on("resize", resizeSvg);
	      setTimeout(function() {
	        $menuBlock.addClass("visible");
	        animateBlock();
	      }, menuAnimTime);
	    } else {
	      menuActive = false;
	      animateBlock(true);
	      setTimeout(function() {
	        $menuBlock.removeClass("visible");
	        createTimeout();
	        $(".back__bg").removeClass("hidden");
	        $content.removeClass("inactive");
	        $scene.removeClass("menu-visible");
	      }, blockAnimTime);
	      $(window).off("resize");
	    }
	  });
	  
	});
</script>

<style type="text/css">
/* 메인 하단부 두번째 영역 */
	.bottom_second {
	 padding: 3em 3em;
	  font: normal 40px/50px Arial, sans-serif;
	  color: #999;
	}
	.p1 {
	  font-size: 100px;
	  color: #FFFFFF;
	  text-shadow: #A9A7A7 4px 4px 2px ;
	  height: 50px;
	  float: left;
	  text-align: center
	  /* margin-right: 0.3em; */
	}
	b {
	  float: left;
	  overflow: hidden;
	  position: relative;
	  height: 50px;
	}
	.span1 {
	font-size: 50px;
	text-shadow: #A9A7A7 3px 3px 1px ;
	display: inline-block;
	color: #FFFFFF;
	position: relative;
	white-space: nowrap;
	top: 0;
	left: 0;
	-webkit-animation: move 5s;
	-webkit-animation-iteration-count: infinite;
	-webkit-animation-delay: 1s;
	}
	
	@keyframes move {
	0%  { top: 0px; }
	20% { top: -50px; }
	40% { top: -100px; }
	/* 60% { top: -150px; }
	80% { top: -200px; } */
	}
	
</style>

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
						<c:choose>
							<c:when test="${ not empty sessionScope.loginuser }">
								<button class="btn btn-hero btn-lg" role="button"
											onclick="location.href='/gongmo/stores/register.action'">Register</button>
							</c:when>
							<c:otherwise>
								<button class="btn btn-hero btn-lg" data-toggle="modal" data-target=".bs-example-modal-sm">Register</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				
				<div class="item slides">
					<div class="slide-2"></div>
					<div class="hero">
						<hgroup>
							<h1>BUY YOUR OWN STORE,<br /> FACE HAPPINESS</h1>
							<h3>Search and write for buying</h3>
						</hgroup>
						<c:choose>
							<c:when test="${ not empty sessionScope.loginuser }">
								<button class="btn btn-hero btn-lg" role="button"
											onclick="location.href='/gongmo/stores/buylist.action'">Go board</button>
							</c:when>
							<c:otherwise>
								<button class="btn btn-hero btn-lg" 
											data-toggle="modal" data-target=".bs-example-modal-sm">Go board</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				
				<div class="item slides">
					<div class="slide-3"></div>
					<div class="hero">
						<hgroup>
							<h1>CHECK NOTICE, <br />SEE INFORMATION</h1>
							<h3>New notice and attached file list</h3>
						</hgroup>
						<c:choose>
							<c:when test="${ not empty sessionScope.loginuser }">
								<button class="btn btn-hero btn-lg" role="button"
											onclick="location.href='/gongmo/notice/noticelist.action'">Notice</button>
							</c:when>
							<c:otherwise>
								<button class="btn btn-hero btn-lg" 
											data-toggle="modal" data-target=".bs-example-modal-sm">Notice</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
						
		</div>		
		
		<div style="width: 100%">
			<!-- 메인 하단부 첫번째 -->
			<div class="bottom_first" style="float: left; width: 70%; height: 500px">					
				<div class="scene">
				  <div class="content">
				    <div class="back">
				      <div class="back__bg back__bg-1 active"></div>
				      <div class="back__bg back__bg-2"></div>
				      <div class="back__bg back__bg-3"></div>
				    </div>
				    <div class="front">
				      <div class="front__bg front__bg-1 active"></div>
				      <div class="front__bg front__bg-2"></div>
				      <div class="front__bg front__bg-3"></div>
				    </div>
				    <div class="nav__bottom">
				      <div data-page="1" class="nav__el nav__el-1">
				        Restaurant
				        <div class="nav__el-clone">
				          <div class="nav__el nav__el-1">Restaurant</div>
				        </div>
				      </div>
				      &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; 
				      <div data-page="2" class="nav__el nav__el-2">
				        Cloth
				        <div class="nav__el-clone">
				          <div class="nav__el nav__el-2">Cloth</div>
				        </div>
				      </div>
				        &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; 
				      <div data-page="3" class="nav__el nav__el-3">
				        Cafe
				        <div class="nav__el-clone">
				          <div class="nav__el nav__el-3">Cafe</div>
				        </div>
				      </div>				     
				    </div>
				  </div>
				  <div class="menu">
				    <div class="menu__btn">
				      <div class="menu__btn-inner">
				        <span class="menu__btn-line"></span>
				        <span class="menu__btn-line"></span>
				        <span class="menu__btn-line"></span>
				      </div>
				    </div>
				    <div class="menu__block">
				      <div class="menu__block-bg"></div>
				      <svg class="menu__block-svg">
				        <path class="menu__block-svgPath" />
				      </svg>
				    </div>
				    <h1 class="menu__heading">등록된 모든 가게를 검색, <br /> 상세정보를 확인!</h1>
				  </div>
				</div>
				<script src="https://cdnjs.cloudflare.com/ajax/libs/snap.svg/0.3.0/snap.svg-min.js"></script>
					
					
			</div>		
			<div style="float: left; width: 30%; height: 500px; background-color: black; opacity: 0.85">
				<div class="bottom_second">
						<p class="p1">Store</p>	<br /><br />
						<b>
						  <span class="span1">
						    Search<br /> 
						    All List<br />
						    View Detail
						    </span>
						</b>
				</div>
				
				<div>			
					<a style="width: 180px; display: block; margin: auto; font-size: 20px; 
							background-color: black;  border-color: #f5f5f5" class="btn icon-btn btn-success" href="/gongmo/stores/allStroreList.action">
						<span class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;리스트 보기</a>
					<h4 style="	color: #f5f5f5; text-align: center; margin-top: 17px">가게 검색 및 상세정보를 확인하세요</h4>
				</div>				
			</div>
			
		</div>
	</div>

</body>	
</html>