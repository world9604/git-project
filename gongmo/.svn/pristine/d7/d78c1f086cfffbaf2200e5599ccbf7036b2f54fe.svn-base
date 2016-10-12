<%@ page import="com.mvcdemoweb.model.dto.Member"%>
<%@ page language="java" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<link href="/gongmo/resources/styles/css/bootstrap.min.css" rel="stylesheet">
<link href="/gongmo/resources/styles/css/header.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="/gongmo/resources/styles/js/bootstrap.min.js"></script>
<script type="text/javascript">

$(function() {
 	$('#btnRegister').click(function(event) {
 		var member = $("#memberForm").serialize();
 		var regEmail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
 		var passwordRules = /^.*(?=.{8,10})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
 		var regbirth = /^\d{2,4}\-\d{1,2}\-\d{1,2}$/;
 		
 		var email = $('#email').val();
 		var chkResult = $('#chkResult').text();
 		var password1 = $('#password1').val();
 		var password2 = $('#password2').val();
 		var chkpasswd = $('#chkpasswd').text();
 		var name = $('#name').val();
 		var birth = $('#birth').val();
 		var phone = $('#phone').val();
 		if(email == ''){
 			alert('Email 을 입력해주세요.');
 			
 		}else if(!regEmail.test(email)){
 			alert('유효하지 않은 이메일 입력입니다. 다시 입력해주세요.');
 			$('#email').focus();
 			return false;
 		}else if(chkResult == ''){
 			alert('아이디 중복검사를 실행해주세요.');
 			return false;
 		}else if(chkResult == '존재하는 아이디입니다.'){
 			alert('아이디는 중복으로 사용 할 수 없습니다.');
 			$('#email').focus();
 			return false;
 		}else if(password1 == ''){
 			alert('첫번째 비밀번호를 입력해주세요.');
 			$('#password1').focus();
 			return false;
 		}else if(password2 == ''){
 			alert('두번째 비밀번호를 입력해주세요.');
 			$('#password2').focus();
 			return false;
 		}else if(!passwordRules.test(password1)){
 			alert('8~10자리이며 영문과 숫자가 혼합되어있으야합니다. 다시을 입력해주세요.');
 			$('#password1').focus();
 			return false;
 		}else if(password1.length >10){
 			alert('8~10자리이며 영문과 숫자가 혼합되어있으야합니다. 다시을 입력해주세요.');
 			$('#password1').focus();
 			return false;
 		}else if(chkpasswd == '비밀번호가 일치하지 않습니다.'){
 			alert('첫번째 비밀번호와 두번쨰 비밀번호가 일치하지 않습니다.다시 확인하여주세요.');
 			$('#password2').focus();
 			return false;
 		}else if(name == ''){
 			alert('이름을 입력해주세요.');
 			$('#name').focus();
 			return false;
 		}else if(birth == ''){
 			alert('생일을 입력해주세요.');
 			$('#birth').focus();
 			return false;
 		}else if(!regbirth.test(birth)){
 			alert('생일을 형식에 맞게 작정해주세요. (yyyy-mm-dd)');
 			$('#birth').focus();
 			return false;
 		}else if(phone == ''){
 			alert('연락처을 입력해주세요.');
 			$('#phone').focus();
 			return false;
 		}else{
 			$.ajax({
 					url: "/gongmo/member/register.action",
 					type:"POST",
 					data: member,
 						success : function(data, status, xhr) {
 					alert("회원 가입이 완료 되었습니다.");
 						}});
 		}
	});
});

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
$(function() {
 	$('#btnRegister2').click(function(event) {
 		
 		var passwordRules = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,10}$/;
 		var regbirth = /^\d{2,4}\-\d{1,2}\-\d{1,2}$/;
 		var password3 = $('#password3').val();
 		var password4 = $('#password4').val();
 		var chkpasswd = $('#chkpasswd2').text();
 		var birth = $('#birth1').val();
 		var phone = $('#phone1').val();
 		if(password3 == ''){
 			alert('첫번째 비밀번호를 입력해주세요.');
 			$('#password3').focus();
 			return false;
 		}else if(password4 == ''){
 			alert('두번째 비밀번호를 입력해주세요.');
 			$('#password4').focus();
 			return false;
 		}else if(!passwordRules.test(password3)){
 			alert('최소 1개의 숫자 혹은 특수 문자를 포함해야합니다. 다시을 입력해주세요.');
 			$('#password3').focus();
 			return false;
 		}else if(chkpasswd == '비밀번호가 일치하지 않습니다.'){
 			alert('첫번째 비밀번호와 두번쨰 비밀번호가 일치하지 않습니다.다시 확인하여주세요.');
 			$('#password3').focus();
 			return false;
 		}else if(birth == ''){
 			alert('생일을 입력해주세요.');
 			$('#birth').focus();
 			return false;
 		}else if(!regbirth.test(birth)){
 			alert('생일을 형식에 맞게 작정해주세요. (yyyy-mm-dd)');
 			$('#birth').focus();
 			return false;
 		}else if(phone == ''){
 			alert('연락처을 입력해주세요.');
 			$('#phone').focus();
 			return false;
 		}else{
 			var member = $("#memberEdit").serialize();
 	 		
 			$.ajax({
 					url: "/gongmo/member/memberEdit.action",
 					type:"POST",
 					data: member,
 						success : function(data, status, xhr) {
 							location.reload();
 						}});
 		}
	});
});
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/* $(function() { 

	$('#memberin').on('keyup', function(event) {

		$('#myModal2').css("z-index",9999);

	}) */
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	$(function() {

	$('#chkEamil').on('click', function(event) {

		$('#chkResult').text("");

		$.ajax({
			url : "/gongmo/member/validByEamil.action",
			type : "post",
			data : {
				email : $('#email').val()
			},
			success : function(data, status, xhr) {
				console.log(data);
				if (data == "success") {
					$('#chkResult').text('사용가능한 아이디입니다.');
					$('#chkResult').css('color', 'blue');
					idIsValid = true;
				} else {
					$('#chkResult').text('존재하는 아이디입니다.');
					$('#chkResult').css('color', 'red');
					idIsValid = false;
				}
			},
		});

	});
	});
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

$(function() {
	$('#password2').on('keyup', function(event) {
		var ps1 = $("#password1").val();
		var ps2 = $("#password2").val();

		if (ps1 == ps2) {
			$('#chkpasswd').text('비밀번호가 일치합니다.');
			$('#chkpasswd').css('color', 'blue');
		} else {
			$('#chkpasswd').text('비밀번호가 일치하지 않습니다.');
			$('#chkpasswd').css('color', 'red');
		}

	});
 });
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

$(function() {
	$('#password4').on('keyup', function(event) {
		var ps1 = $("#password3").val();
		var ps2 = $("#password4").val();

		if (ps1 == ps2) {
			$('#chkpasswd2').text('비밀번호가 일치합니다.');
			$('#chkpasswd2').css('color', 'blue');
		} else {
			$('#chkpasswd2').text('비밀번호가 일치하지 않습니다.');
			$('#chkpasswd2').css('color', 'red');
		}

	});
 });
 ///////////////////////////////////////////////////////////////////////////////
 
 //드롭다운 기능
 $(function() {
	 $(document).ready(function(){
	    $(".dropdown").hover(            
	        function() {
	            $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true,true).slideDown("400");
	            $(this).toggleClass('open');        
	        },
	        function() {
	            $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true,true).slideUp("400");
	            $(this).toggleClass('open');       
	        }
	    );
	}); 
 })
////////////////////////////////////////////////////////////////////////////////
$(function() {
    	 $("#login").click(function(event){
    		 

    		 
    		 var member = $("#loginform").serialize();
	    	    $.ajax({
	    			type:"POST",
	    			url:"/gongmo/account/login.action",
	    			data:member,
	    			success:function(data, status, xhr){
	    			
	    				if(data=="success"){
	    					alert("로그인 성공");
	    					$("#myModal").modal('toggle');
	    					location.reload();
	    					}else if(data=="false"){
	    						alert("로그인 실패 이메일과 비밀번호를 확인해주세요.");	
	    						
	    					}
	    				}
	    			});
	    	    
	    		 event.stopPropagation();
	    		 event.preventDefault();
	    
    	 });
    		 }); 
</script>


<!-- ////////////////////////////////////////////////////////////////////// -->

<nav class="navbar navbar-default navbar-spclops" role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#navbar-brand-centered">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<div class="navbar-brand navbar-brand-centered">
				<a href="/gongmo/home.action">Home</a>
			</div>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="navbar-brand-centered">
			<ul class="nav navbar-nav">
				<c:choose>
					<c:when test="${not empty sessionScope.loginuser}">	
						<li><a href="/gongmo/stores/register.action">가게 판매 등록</a></li>
						<li class="dropdown">						
				          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">가게 구합니다 / 검색<span class="caret"></span></a>
				          <ul class="dropdown-menu" role="menu">				           		
								<li><a href="/gongmo/stores/buylist.action">가게 구매 게시판</a></li>
								<li><a href="/gongmo/stores/allStroreList.action">가게 검색 / 리스트</a></li>
				          </ul>
				        </li>
						
					</c:when>
					<c:otherwise>
						<li><a href="#" data-toggle="modal" data-target=".bs-example-modal-sm">가게 판매 등록</a></li>
						<li class="dropdown">
				          	<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">가게 구합니다 / 검색<span class="caret"></span></a>
				          	<ul class="dropdown-menu" role="menu">								
								<li><a href="#" data-toggle="modal" data-target=".bs-example-modal-sm">가게 구매 게시판</a></li>
								<li><a href="#" data-toggle="modal" data-target=".bs-example-modal-sm">가게 검색/리스트</a></li>
							</ul>
				        </li>
					</c:otherwise>
				</c:choose>
				<li><a href="/gongmo/notice/noticelist.action">공지사항</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<c:choose>
					<c:when test="${ empty sessionScope.loginuser }">
						<li><a href="#" data-toggle="modal" 
							data-target=".bs-example-modal-sm">로그인</a></li>
						<li><a href="#" data-toggle="modal"
							data-dismiss="modal" data-target="#myModal2">회원가입</a></li>
					</c:when>					
				</c:choose>
				
				<c:choose>
					<c:when test="${ empty sessionScope.loginuser }"></c:when>
					<c:otherwise>
			            <li><a>${ loginuser.name }님 환영합니다.</a></li>
			            <li class="dropdown" style="z-index: 900;">
				          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">마이페이지 <span class="caret"></span></a>
				          <ul class="dropdown-menu" role="menu">
				            <li><a href="/gongmo/member/storeList.action?memberNo=${loginuser.memberNo}">
								    내 매물관리</a></li>
							<li><a href="/gongmo/member/mybuylist.action?memberNo=${loginuser.memberNo}">
								    내 매수관리</a></li>
							<li><a href="/gongmo/member/interststorelist.action?memberNo=${loginuser.memberNo}">
								    관심매물</a></li>
							<li><a href="/gongmo/member/questionList.action?memberNo=${loginuser.memberNo}">문의함</a></li>
				          </ul>
				        </li>
			           	<li><a href="#" data-toggle="modal" 
			            	data-dismiss="modal" data-target="#myModal3">회원정보</a></li>
						<li><a href="/gongmo/account/logout.action">로그아웃</a></li>
					</c:otherwise>
				</c:choose>
				
				<c:choose>
					<c:when test="${ empty sessionScope.loginuser }"></c:when>
					<c:otherwise>
												
					</c:otherwise>
				</c:choose>
				
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>


<!--       /////////////////////////////////////////////////////////////////             -->
<div class="modal fade" id="myModal2" aria-labelledby="mySmallModalLabel" style="z-index: 9999;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">회원 가입</h4>
			</div>
			<div class="modal-body">
				<form id="memberForm" class="form form-signup">
					<div class="form-group">
						<br />
						<div class="input-group" style="float: left">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-envelope"></span></span>
							<input path="email" id="email" name="email"
								class="form-control" placeholder="Email"
								style="width: 75%; height: 35px;" />
							&nbsp;&nbsp;&nbsp; 
							<input type="button" id="chkEamil"value="중복 체크" class="btn btn-success"style="width: 20%; height: 30px;">
						</div>
						<span id="chkResult"></span>
						
					</div>

					<div class="form-group">
						<div class="input-group">
							<br /> <span class="input-group-addon"><span
								class="glyphicon glyphicon-lock"></span></span>
							<p class="help-block">영문자, 숫자 포함 8자리 이상으로 만들어주세요</p>
							<input type="password" id="password1" name="password"
								class="form-control" placeholder="Password" />
								
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-lock"></span></span>
							<p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
							<input type="password" id="password2" class="form-control"
								placeholder="Password" /> <span id="chkpasswd"></span>
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-user"></span> </span>
							<input path="name" id="name" name="name"class="form-control"
								placeholder="Name" />
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-calendar"></span></span>
							<input path="birth" class="form-control" id="birth" name="birth"
								placeholder="yyyy-mm-dd 형태로 입력해주세요." />
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-phone-alt"></span></span>
							<input path="phone" class="form-control" id="phone" name="phone"
								placeholder="-는 빼고 입력해주세요." />
						</div>
					</div>
					<div class="modal-footer">
						<a href="#" data-dismiss="modal" class="btn">Close</a>
						<input type="submit" value="회원가입" class="btn btn-warning"
							id="btnRegister" />
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!--       /////////////////////////////////////////////////////////////////            회원정보                      -->
<div class="modal fade" id="myModal3" aria-labelledby="myModalLabel"aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">회원 정보</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon"><span
							class="glyphicon glyphicon-envelope"></span></span>
						<h5>${loginuser.email}</h5>
						<input type="hidden" name="email" value="${loginuser.email}" />
					</div>
				</div>
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon"><span
							class="glyphicon glyphicon-user"></span> </span>
						<h5>${loginuser.name}</h5>
					</div>
				</div>
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon"><span
							class="glyphicon glyphicon-calendar"></span></span>
						<h5>${loginuser.birth}</h5>
					</div>
				</div>
				<div class="form-group">
					<div class="input-group">
						<span class="input-group-addon"><span
							class="glyphicon glyphicon-phone-alt"></span></span>

						<h5>${loginuser.phone}</h5>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal"
						data-backdrop="false">Close</button>
					<input type="submit" value="회원정보수정" class="btn btn-warning"
						data-toggle="modal" data-dismiss="modal" data-target="#myModal4" />
				</div>
			</div>
		</div>
	</div>
</div>
<!--       /////////////////////////////////////////////////////////////////                  회원 정보 수정                  -->
<div class="modal fade" id="myModal4" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">회원 정보 변경</h4>
			</div>
			<div class="modal-body">
				<form id="memberEdit" class="form form-signup">
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-envelope"></span></span>
							<h5>${loginuser.email}</h5>
							<input type="hidden" name="email" value="${loginuser.email}" />
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-lock"></span></span>
							<p class="help-block">영문자, 숫자 포함 8자리 이상으로 만들어주세요</p>
							<input type="password" id="password3" name="password"
								class="form-control" placeholder="Password" />
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-lock"></span></span>
							<p class="help-block">비밀번호 확인을 위해 다시한번 입력 해 주세요</p>
							<input type="password" id="password4" class="form-control"
								placeholder="Password" /> <span id="chkpasswd2"></span>
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-user"></span> </span>
							<h5>${loginuser.name}</h5>
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-calendar"></span></span>
							<input path="birth" class="form-control" name="birth" id="birth1"
								placeholder="${loginuser.birth}" />
						</div>
					</div>
					<div class="form-group">
						<div class="input-group">
							<span class="input-group-addon"><span
								class="glyphicon glyphicon-phone-alt"></span></span>
							<input path="phone" class="form-control" name="phone" id="phone1"
								placeholder="${loginuser.phone}" />
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal"data-backdrop="false">Close</button>
						<input type="submit" value="회원정보수정" class="btn btn-warning" id = "btnRegister2"/>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
<form id="loginform" >
	<div class="modal fade bs-example-modal-sm" id="myModal"
		aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">
						<!-- 모달 제목 -->
						로그인
					</h4>
				</div>
				<div class="modal-body" align="center">
					<!-- 여기는 내용이 들어 가는 곳 -->
					<div class="form-horizontal">
						<div class="form-group">
							<div class="col-md-10 col-md-offset-1">
								<input class="form-control" id="loginEmail"name="email" type="text"
									style="height: 50px; weight: 230;" placeholder="이메일을 입력하세요">
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-10 col-md-offset-1">
								<input class="form-control" id="loginPassword"name="password" type="password"
									style="height: 50px; weight: 230;" placeholder="비밀번호를 입력하세요">
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" id="login">로그인</button>
					<!-- <a data-toggle="modal" data-target="#myModal2"
						class="btn btn-warning">회원가입</a> -->
						<a href="#" data-toggle="modal"
							data-dismiss="modal" data-target="#myModal2" class="btn btn-warning">회원가입</a>
				</div>
			</div>
			<!-- 모달 콘텐츠 -->
		</div>
		<!-- 모달 다이얼로그 -->
	</div>
</form>
<!-- ///////////////////////////////////////////////////////////////////////////////////////////////////////////// -->




