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
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> 
	
	<script type="text/javascript">
	//체크박스 단일선택 기능
	function oneCheckbox(no){
    	var obj = document.getElementsByName("middleNo");
        for(var i=0; i<obj.length; i++){
        	if(obj[i] != no){
            	obj[i].checked = false;
            }
        }
    }
	
	//radio button 토글 기능
	$(function() {
		$('#radioBtn a').on('click', function(){
	    	var sel = $(this).data('title');
	        var tog = $(this).data('toggle');
	        $('#'+tog).prop('value', sel);
	           
	        $('a[data-toggle="'+tog+'"]').not('[data-title="'+sel+'"]').removeClass('active').addClass('notActive');
	        $('a[data-toggle="'+tog+'"][data-title="'+sel+'"]').removeClass('notActive').addClass('active');
	    })
	})
	
	
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();      
	    

    }
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
$(function() {
 	$('#button1id').click(function(event) {
		var storeName = $('#storeName').val();
		var middleNo = $('input[name=middleNo]:checked').attr('value');		
		var leaseOrDealing = $('input[name=leaseOrDealing]:checked').attr('value');
 		var leaseDeposit = $('#leaseDeposit').val();
 		var leaseDeposit_rules = /^[0-9]*$/;
 		
 		var leaseMonthlyRent = $('#leaseMonthlyRent').val();
 		var leaseMonthlyRent_rules = /^[0-9]*$/;
 		
 		var dealingPrice = $('#dealingPrice').val();
 		var dealingPrice_rules = /^[0-9]*$/;
 		
 		var leasePremium = $('#leasePremium').val();
 		var leasePremium_rules = /^[0-9]*$/;
 		
 		var sellType = $('input[name=sellType]:checked').attr('value');
 		var storeAddress = $('#sample4_jibunAddress').val(); 		
 		var enterDay = $('input[name=enterDay]:checked').attr('value');		
 		var pyeong = $('#pyeong').val();
 		var pyeong_rules = /^[0-9]*$/;
 		
 		var storeFloor = $('#storeFloor').val();
 		var admittedNum = $('#admittedNum').val();
 		var admittedNum_rules = /^[0-9]*$/;
 		
 		var salesMonthly = $('#salesMonthly').val();
 		var salesCost = $('#salesCost').val();
 		var storeFeature = $('#storeFeature').val();
 		var aroundSubway = $('#aroundSubway').val();
 		var etcTraffic = $('#etcTraffic').val();
 		var availableParkingNum = $('#availableParkingNum').val();
 		var availableParkingNum_rules = /^[0-9]*$/;
 		
 		var canCallTime = $('#canCallTime').val();
 		var salesExplanation = $('#salesExplanation').val();
 		var interiorAndSellReason = $('#interiorAndSellReason').val();
 		
 		if(!storeName){
 			alert('가게 이름을 입력해주세요.');
 			$('#storeName').focus();
 			return false;
 		}else if(!middleNo){
 			alert('업종 분류를 선택해주세요.');
 			return false;
 		}else if(!leaseOrDealing){
 			alert('판매 방식을 선택해주세요.');
 			return false;
 		}else if(leaseOrDealing=='임대'){
 			if(!leaseDeposit || leaseDeposit.length > 6 ){
 				alert('보증금을 입력하세요. (최대 6자리 이하로 입력하세요)');
 				$('#leaseDeposit').focus();
 				return false;
 			}else if(!leaseDeposit_rules.test(leaseDeposit)){
 	 			alert('보증금은 숫자만 입력 가능합니다.');
 	 			$('#leaseDeposit').focus();
 	 			return false;
 			}else if(!leaseMonthlyRent || leaseMonthlyRent.length > 6){
 				alert('월세 금액을 입력하세요. (최대 6자리 이하로 입력하세요)');
 				$('#leaseMonthlyRent').focus();
 				return false;
 			}else if(!leaseMonthlyRent_rules.test(leaseMonthlyRent)){
 	 			alert('월세는 숫자만 입력 가능합니다.');
 	 			$('#leaseMonthlyRent').focus();
 	 			return false;
 			}else if(!leasePremium || leasePremium.length > 6){
 				alert('권리금을 입력하세요. (최대 6자리 이하로 입력하세요)');
 				$('#leasePremium').focus();
 				return false;
 			}else if(!leasePremium_rules.test(leasePremium)){
 	 			alert('권리금은 숫자만 입력 가능합니다.');
 	 			$('#leasePremium').focus();
 	 			return false;
 			}else if(!sellType){
 	 			alert('직거래 및 중개 업소를 입력해주세요.');
 	 			return false;
 	 		}else if(!storeAddress){
 	 			alert('주소를 입력해주세요');
 	 			return false;
 	 		}else if(!enterDay){
 	 			alert('입절 가능일을 입력해주세요.');
 	 			return false;
 	 		}else if(!pyeong){
 	 			alert('평수를 입력해주세요.');
 	 			$('#pyeong').focus();
 	 			return false;
 	 		}else if(!pyeong_rules.test(pyeong)){
 	 			alert('평수는 숫자만 입력 가능합니다.');
 	 			$('#pyeong').focus();
 	 			return false;
 	 		}else if(!storeFloor){
 	 			alert('가게가 위치한 층수를 입력해주세요.');
 	 			$('#storeFloor').focus();
 	 			return false;
 	 		}else if(!admittedNum){
 	 			alert('수용 가능 인원을 입력해주세요.');
 	 			$('#admittedNum').focus();
 	 			return false;
 	 		}else if(!admittedNum_rules.test(admittedNum)){
 	 			alert('수용 가능 인원은 숫자만 입력 가능합니다.');
 	 			$('#admittedNum').focus();
 	 			return false;
 	 		}else if(!salesMonthly){
 	 			alert('월 매출을 입력해주세요.');
 	 			$('#salesMonthly').focus();
 	 			return false;
 	 		}else if(!salesCost){
 	 			alert('경비를 입력해주세요.');
 	 			$('#salesCost').focus();
 	 			return false;
 	 		}else if(!storeFeature){
 	 			alert('가게의 특징을 입력해주세요.');
 	 			$('#storeFeature').focus();
 	 			return false;
 	 		}else if(!aroundSubway){
 	 			alert('주변 지하철 정보를 입력해주세요.');
 	 			$('#aroundSubway').focus();
 	 			return false;
 	 		}else if(!etcTraffic){
 	 			alert('기타 교통정보를 입력해주세요.');
 	 			$('#etcTraffic').focus();
 	 			return false;
 	 		}else if(!availableParkingNum){
 	 			alert('주차 가능 수를 입력해주세요.');
 	 			$('#availableParkingNum').focus();
 	 			return false;
 	 		}else if(!availableParkingNum_rules.test(availableParkingNum)){
 	 			alert('주차 가능 수는 숫자만 입력 가능합니다.');
 	 			$('#availableParkingNum').focus();
 	 			return false;
 	 		}else if(!canCallTime){
 	 			alert('통화 가능 시간을 입력해주세요.');
 	 			$('#canCallTime').focus();
 	 			return false;
 	 		}else if(!salesExplanation){
 	 			alert('매매물의 설명를 입력해주세요.');
 	 			$('#salesExplanation').focus();
 	 			return false;
 	 		}else if(!interiorAndSellReason){
 	 			alert('인테리어 및 판매 이유를 입력해주세요.');
 	 			$('#interiorAndSellReason').focus();
 	 			return false;
 	 		}else{
 	 			
 	 			alert("모두 정상 입력되었습니다.");
 			
 	 		}
 		}else if(leaseOrDealing=='매매'){
 			if(!dealingPrice || dealingPrice.length > 6){
 				alert('매매 대금을 입력하세요. (최대 6자리 이하로 입력하세요)');
 				$('#dealingPrice').focus();
 				return false;
 			}else if(!dealingPrice_rules.test(dealingPrice)){
 	 			alert('매매 대금은 숫자만 입력 가능합니다.');
 	 			$('#dealingPrice').focus();
 	 			return false;
 			}else if(!leasePremium || leasePremium.length > 6){
 				alert('권리금을 입력하세요. (최대 6자리 이하로 입력하세요)');
 				$('#leasePremium').focus();
 				return false;
 			}else if(!leasePremium_rules.test(leasePremium)){
 	 			alert('권리금은 숫자만 입력 가능합니다.');
 	 			$('#leasePremium').focus();
 	 			return false;
 			}else if(!sellType){
 	 			alert('직거래 및 중개 업소를 입력해주세요.');
 	 			return false;
 	 		}else if(!storeAddress){
 	 			alert('주소를 입력해주세요');
 	 			return false;
 	 		}else if(!enterDay){
 	 			alert('입절 가능일을 입력해주세요.');
 	 			return false;
 	 		}else if(!pyeong){
 	 			alert('평수를 입력해주세요.');
 	 			$('#pyeong').focus();
 	 			return false;
 	 		}else if(!storeFloor){
 	 			alert('가게가 위치한 층수를 입력해주세요.');
 	 			$('#storeFloor').focus();
 	 			return false;
 	 		}else if(!admittedNum){
 	 			alert('수용 가능 인원을 입력해주세요.');
 	 			$('#admittedNum').focus();
 	 			return false;
 	 		}else if(!salesMonthly){
 	 			alert('월 매출을 입력해주세요.');
 	 			$('#salesMonthly').focus();
 	 			return false;
 	 		}else if(!salesCost){
 	 			alert('경비를 입력해주세요.');
 	 			$('#salesCost').focus();
 	 			return false;
 	 		}else if(!storeFeature){
 	 			alert('가게의 특징을 입력해주세요.');
 	 			$('#storeFeature').focus();
 	 			return false;
 	 		}else if(!aroundSubway){
 	 			alert('주변 지하철 정보를 입력해주세요.');
 	 			$('#aroundSubway').focus();
 	 			return false;
 	 		}else if(!etcTraffic){
 	 			alert('기타 교통정보를 입력해주세요.');
 	 			$('#etcTraffic').focus();
 	 			return false;
 	 		}else if(!availableParkingNum){
 	 			alert('주차 가능 수를 입력해주세요.');
 	 			$('#availableParkingNum').focus();
 	 			return false;
 	 		}else if(!availableParkingNum_rules.test(availableParkingNum)){
 	 			alert('주차 가능 수는 숫자만 입력 가능합니다.');
 	 			$('#availableParkingNum').focus();
 	 			return false;
 	 		}else if(!canCallTime){
 	 			alert('통화 가능 시간을 입력해주세요.');
 	 			$('#canCallTime').focus();
 	 			return false;
 	 		}else if(!salesExplanation){
 	 			alert('매매물의 설명를 입력해주세요.');
 	 			$('#salesExplanation').focus();
 	 			return false;
 	 		}else if(!interiorAndSellReason){
 	 			alert('인테리어 및 판매 이유를 입력해주세요.');
 	 			$('#interiorAndSellReason').focus();
 	 			return false;
 	 		}else{
 	 			
 	 			alert("모두 정상 입력되었습니다.");
 			
 	 		}
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
	
	/* radio button */
	#radioBtn .notActive{
	    color: #3276b1;
	    background-color: #fff;
	}
	
	</style>
	
	


</head>
<body>

	<div id="pageContainer">
	
		<c:import url="/WEB-INF/views/include/header.jsp" />
		
		<form class="form-horizontal" id="storeform" action="register.action" method="post">
		
			<input type="hidden" name="memberNo" value="${ loginuser.memberNo }" />
		
		<fieldset>
				
		<!-- Form Name -->
		<legend style="text-align: center; font-weight: bold; padding: 5px 0px">가게 팝니다 등록</legend>
		
		<!-- Text input-->
		<div class="form-group">
		  	<label class="col-md-4 control-label" for="textinput">가게 이름</label>  
		  	<div class="col-md-4">
		  		<input id="storeName" name="storeName" type="text" class="form-control input-md">	
		  	</div>
		</div>
		
		<!-- 분류 -->
		<hr  style="width: 600px; height: 5px; display: block; margin: auto"/>
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
			        		</div> <!-- collapse 적용부분 종료 -->
			        	</div>
			        </c:forEach>			        
		  	</div>
		</div>

		<!-- Multiple Radios (inline) -->
		<hr  style="width: 600px; height: 5px; display: block; margin: auto"/>
		<div class="form-group">
		  <label class="col-md-4 control-label" for="radios">판매 방식</label>
		  <div class="col-md-4"> 
		    <label class="radio-inline" for="radios-0" id="leaseOrDealing">
		      <input type="radio" id="radios-0"  name="leaseOrDealing" value="임대" onclick="document.getElementById('memulgubun01').style.display='';document.getElementById('memulgubun02').style.display='none';">임대 (보증금, 월세를 지불하고 계실때)&nbsp;&nbsp;&nbsp;
		    </label> 
		    <label class="radio-inline" for="radios-1">
		      <input type="radio" id="radios-1" name="leaseOrDealing"  value="매매" onclick="document.getElementById('memulgubun01').style.display='none';document.getElementById('memulgubun02').style.display='';">매매 (회원님 명의의 소유일때)
		    </label> 		    
		  </div>
		</div>
		<div class="form-group">
		 	<label class="col-md-4 control-label" for="textinput"></label>  
		  	<div class="col-md-4" >
		  		<div id="memulgubun01">
		  		<input type="text"  id="leaseDeposit" name="leaseDeposit" class="form-control input-md"
		  						size="10" maxlength="10" class="input2" style="ime-mode:disabled;" placeholder="보증금 (단위 : 만원)  -  순서대로 숫자만 정확히 입력해주세요"
		  						onkeypress="this.form.dealingPrice.value='1';">				
				<input type="text" id="leaseMonthlyRent"  name="leaseMonthlyRent" class="form-control input-md"
								size="10" maxlength="10" class="input2" style="ime-mode:disabled;" placeholder="월세 (만원)"
								onkeypress="this.form.dealingPrice.value='1';">
				</div>
		  		<div id="memulgubun02" style="display:none;">
		  		<input type="text"  id="dealingPrice" name="dealingPrice" class="form-control input-md"
		  						size="10" maxlength="10" class="input2" style="ime-mode:disabled;" placeholder="매매대금 (단위 : 만원)  -  순서대로 숫자만 정확히 입력해주세요."
		  						onkeypress="this.form.leaseDeposit.value='1';this.form.leaseMonthlyRent.value='1';">	
		  		</div>
		  		<input type="text"  id="leasePremium" name="leasePremium" class="form-control input-md"
		  						size="10" maxlength="10" class="input2" style="ime-mode:disabled;" placeholder="권리금 (만원)">			  						
		  		</div>
		</div>

		<!--  -->
		<hr  style="width: 600px; height: 5px; display: block; margin: auto"/>
		<div class="form-group">
		  	<label class="col-md-4 control-label" for="radios">판매 유형</label>
		  	<div class="col-md-4"> 
		    	<label class="radio-inline" for="radios-0">
		      		<input type="radio" id="sellType"  name="sellType" value="직거래" >직거래&nbsp;&nbsp;&nbsp;
		    	</label> 
		    	<label class="radio-inline" for="radios-1">
		      		<input type="radio" id="sellType" name="sellType"   value="중개업소" >중개업소를 통한 거래
		    	</label> 		    
		  	</div>
		</div>
		
		<!-- 주소 -->
		<hr  style="width: 600px; height: 5px; display: block; margin: auto"/>
		<div class="form-group">
		  	<label class="col-md-4 control-label" for="textinput">주소</label>  
		  	<div class="col-md-4" style="float: left;">
		 		<input type="text" class="form-control input-md" id="sample4_postcode" placeholder="우편번호" style="width: 300px; float: left;">
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="height: 23px"><br>
				<input type="text" class="form-control input-md" id="sample4_roadAddress" placeholder="도로명주소" style="width: 300px">
				<input type="text" class="form-control input-md" id="sample4_jibunAddress" name="storeAddress" placeholder="지번주소" style="width: 300px">
				<span id="guide" style="color:#999"></span>
		  	</div>
		</div>
		
		<!--  -->
		<hr  style="width: 600px; height: 5px; display: block; margin: auto"/>
		<div class="form-group">
		  	<label class="col-md-4 control-label" for="radios">입점 가능일</label>
		  	<div class="col-md-4"> 
		    	<label class="radio-inline" for="radios-0">
		      		<input type="radio" id="enterDay"  name="enterDay" value="즉시" >즉시&nbsp;&nbsp;&nbsp;
		    	</label> 
		    	<label class="radio-inline" for="radios-1">
		      		<input type="radio" id="enterDay" name="enterDay"   value="협의" >협의
		    	</label> 		    
		  	</div>
		</div>
		
		<!-- -->
		<hr  style="width: 600px; height: 5px; display: block; margin: auto"/>
		<div class="form-group">
		  	<label class="col-md-4 control-label" for="textinput">면적</label>  
		  	<div class="col-md-4">
		  		<input id="pyeong" name="pyeong" type="text" class="form-control input-md" placeholder="숫자만 입력하세요 (평)">	
		  	</div>
		</div>
		<div class="form-group">
		  	<label class="col-md-4 control-label" for="textinput">층수</label>  
		  	<div class="col-md-4">
		  		<input id="storeFloor" name="storeFloor" type="text" class="form-control input-md" placeholder="ex) 전체층/가게층 = 5/2 (층)">	
		  	</div>
		</div>
		<div class="form-group">
		  	<label class="col-md-4 control-label" for="textinput">수용가능 인원</label>  
		  	<div class="col-md-4">
		  		<input id="admittedNum" name="admittedNum" type="text" class="form-control input-md" placeholder="(명)">	
		  	</div>
		</div>
		
		<!--  -->
		<hr  style="width: 600px; height: 5px; display: block; margin: auto"/>
		<div class="form-group">
		  	<label class="col-md-4 control-label" for="textinput">월 매출액</label>  
		  	<div class="col-md-4">
		  		<input id="salesMonthly" name="salesMonthly" type="text" class="form-control input-md" placeholder="(만원)">	
		  	</div>
		</div>
		<div class="form-group">
		  	<label class="col-md-4 control-label" for="textinput">월 사용 경비</label>  
		  	<div class="col-md-4">
		  		<input id="salesCost" name="salesCost" type="text" class="form-control input-md" placeholder="(만원)">	
		  	</div>
		</div>
		
		<!--  -->
		<hr  style="width: 600px; height: 5px; display: block; margin: auto"/>
		<div class="form-group">
			<label class="col-md-4 control-label" for="textarea">매물 주변 특징</label>
		  	<div class="col-md-4">                     
		    	<textarea class="form-control" id="storeFeature" name="storeFeature"
		    						rows="3"></textarea>
		  	</div>
		</div>
		<div class="form-group">
		  	<label class="col-md-4 control-label" for="textinput">인접 지하철 정보</label>  
		  	<div class="col-md-4">
		  		<input id="aroundSubway" name="aroundSubway" type="text" class="form-control input-md" placeholder="ex) 강남역 12번 출구 도보 5분">	
		  	</div>
		</div>
		<div class="form-group">
		  	<label class="col-md-4 control-label" for="textinput">기타 교통/지리 정보</label>  
		  	<div class="col-md-4">
		  		<input id="etcTraffic" name="etcTraffic" type="text" class="form-control input-md">	
		  	</div>
		</div>
		<div class="form-group">
		  	<label class="col-md-4 control-label" for="textinput">주차 가능 대수</label>  
		  	<div class="col-md-4">
		  		<input id="availableParkingNum" name="availableParkingNum" type="text" class="form-control input-md" placeholder="숫자만 입력 하세요">	
		  	</div>
		</div>  
		<div class="form-group">
		  	<label class="col-md-4 control-label" for="textinput">통화가능 시간</label>  
		  	<div class="col-md-4">
		  		<input id="canCallTime" name="canCallTime" type="text" class="form-control input-md">	
		  	</div>
		</div>
		
		<!--  -->
		<hr  style="width: 600px; height: 5px; display: block; margin: auto"/>
		<div class="form-group">
			<label class="col-md-4 control-label" for="textarea">매물 설명</label>
		  	<div class="col-md-4">                     
		    	<textarea class="form-control" id="salesExplanation" name="salesExplanation"
		    						rows="3"></textarea>
		  	</div>
		</div>
		<div class="form-group">
			<label class="col-md-4 control-label" for="textarea">시설 및 인테리어(매매 사유)</label>
		  	<div class="col-md-4">                     
		    	<textarea class="form-control" id="interiorAndSellReason" name="interiorAndSellReason"
		    						rows="3"></textarea>
		  	</div>
		</div>
		
		<!-- Button (Double) -->
		<div style="width: 400px; height: 50px; display: block; margin-left: 43%">
		    	<button type="submit" id="button1id" name="button1id" class="btn btn-success" >등록</button>&nbsp;&nbsp;
		    	<a class="btn btn-success"
		        	   href="/gongmo/home.action">취소</a>
		</div>
		
		</fieldset>
		</form>
		
		<!-- //////////////////////////////////////////////////////////////////////////////////////////////// -->
	
	</div>

</body>
</html>