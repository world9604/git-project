<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" session="true"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<!DOCTYPE html>

<html>
<head>

	<meta charset="utf-8" />
	<title></title>
	
	 <link rel="stylesheet" href="http://fontawesome.io/assets/font-awesome/css/font-awesome.css">
	<link href="/gongmo/resources/styles/css/comment.css" rel="stylesheet">
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.js"></script>

	<script type="text/javascript">
	
		function deleteQna(buyStoreQnaNo, buyStoreNo) {
			var yes = confirm(buyStoreQnaNo + '번 Q&A를 삭제할까요?');
			if (yes) {
				location.href = 'deletebuyqna.action?buyStoreQnaNo='+ buyStoreQnaNo + 
							'&buyStoreNo=' + buyStoreNo;
			}
		}

	</script>

</head>
<body>

	<div id="pageContainer">
	
		<c:import url="/WEB-INF/views/include/header.jsp" />
		
		<div style="width: 84%; height: 700px; display: block; margin: auto">
			<div style="width: 70%; height: 50px; display: block; margin: auto; border: solid 3px #d75050; border-radius: 30px">
				<div style="width: 70%; height: 100%; float: left;">
					<h5 style="text-align: center; font-size: 25px">${ buyStore.title }</h5>
				</div>				
				<div style="width: 30%; height: 100%; float: left;">
					<h5 style="text-align: center">등록일 <br/> ${ buyStore.regDate }</h5>
				</div>				
			</div><!-- 제목, 등록일자 부분 -->
			
			<div>
				<h6 style="text-align: center">매수자의 희망 내용에 적합한지 잘 판단하여 연락하시기 바랍니다.</h6>
			</div>
			
			<div style="width: 70%; height: 80px; display: block; margin: auto; border: solid 3px #d75050; border-radius: 10px">
				<div style="width: 60%; height: 100%; float: left">
					<div style="width: 300px; height: 50px;display: block; margin: 14px auto; font-size: 17px">
						희망 지역 : ${ buyStore.sido } &nbsp; ${ buyStore.gugun }<br />
						희망 업종 : ${ categoryName }
					</div>
				</div>
				<div style="width:  40%; height: 100%; float: left">
					<div style="width: 250px; height: 60px;display: block; margin: 8px auto">
						등록인 : ${ storeMember.name }<br />
						이메일 : ${ storeMember.email }<br />
						전화번호 : ${ storeMember.phone }
					</div>
				</div>
			</div><!-- 등록자 정보 -->
			
			<br />
			
			<div style="width: 70%; height: 150px; display: block; margin: auto; border: solid 3px #d75050; border-radius: 10px">
				<p style="padding: 20px 90px"> ${ buyStore.content }	</p>
			</div><!-- 내용 -->
			
			<br />
			
			<div class="buttons" style="text-align: center"> 
			 	<a href='buylist.action'>목록보기</a>	&nbsp;&nbsp;&nbsp;
			 	<a data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
				  댓글보기
				</a>
			 </div>

			 <br />
			
			<div style="width: 70%; height: 150px; display: block; margin: auto; border: solid 3px #d75050; border-radius: 10px">
			
				<div class="widget-area no-padding blank">
					<div class="status-upload">
						<form id="qnaform" action="registerbuyqna.action" method="post">
							<input type="hidden" name="buyStoreNo"
											value="${ buyStore.buyStoreNo }" /> 
							<input type="hidden" name="memberNo" 
											value="${ loginuser.memberNo }" />
							<input type="hidden" name="name" 
											value="${ loginuser.name }" />
							<textarea style="margin: 5px 20px" name="content"
											placeholder="내용을 입력 하세요" ></textarea>
							<input type="radio" name="emoticon" value="1"/><img style="width: 30px; height: 30px" src="/gongmo/resources/emoticon/1.png">&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="emoticon" value="2"/><img style="width: 30px; height: 30px" src="/gongmo/resources/emoticon/2.png">&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="emoticon" value="3"/><img style="width: 30px; height: 30px" src="/gongmo/resources/emoticon/3.png">&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="emoticon" value="4"/><img style="width: 30px; height: 30px" src="/gongmo/resources/emoticon/4.png">&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="emoticon" value="5"/><img style="width: 30px; height: 30px" src="/gongmo/resources/emoticon/5.png">
							<button type="submit" class="btn btn-success green"><i class="fa fa-share"></i> 등록</button>
						</form>
					</div><!-- Status Upload  -->
				</div><!-- Widget Area -->

				<br /><br /><br /><br /><br /><br /><br /><br />
				<!-- 댓글 목록 -->
				<div class="collapse" id="collapseExample" style="width: 100%; height: 100%; border: solid 3px #d75050; border-radius: 10px">		
					<div>											
						<c:choose>
						<c:when test="${fn:length(buyStore.buyStoreQnas) == 0 }">
							<h4 id="nodata" style="text-align:center">
							작성된 댓글이 없습니다.
							</h4>
						</c:when>		   							 
						<c:otherwise>
						<!-- comment 표시 영역 -->
						<table class="table table-bordered" style="width: 95%; margin: auto">
							<c:forEach var="buyStoreQna" items="${ buyStoreQnas }">
								<tr>
									<td style="text-align: left; margin: 5px">
										<div id='commentview${ buyStoreQna.buyStoreQnaNo }'>
											<c:forEach var="i" begin="1" end="${ buyStoreQna.qnaDepth }">
												&nbsp;&nbsp;
											</c:forEach>
											<c:if test="${ buyStoreQna.qnaDepth > 0}">
												<i class="glyphicon glyphicon-arrow-right"></i>
											</c:if>											
											[${ buyStoreQna.writer }] &nbsp;&nbsp;
											[${ buyStoreQna.regDate}] &nbsp;&nbsp;
											<c:choose>
												<c:when test="${ buyStoreQna.emoticon == 0}">
													<img style="width: 35px; height: 35px" src="/gongmo/resources/emoticon/2.png">
												</c:when>
												<c:otherwise>
													<img style="width: 35px; height: 35px" src="/gongmo/resources/emoticon/${ buyStoreQna.emoticon }.png">
												</c:otherwise>
											</c:choose>												
											&nbsp;&nbsp; / &nbsp;&nbsp;<span style="font-size: 20px"> ${ buyStoreQna.content }</span> &nbsp;&nbsp;
											<c:set var="display" value=""/>
											<c:choose>
												<c:when test="${ loginuser.memberNo == buyStore.memberNo }">
													<c:set var="display" value="block"/>
												</c:when>
												<c:otherwise>
													<c:set var="display" value="none"/>
												</c:otherwise>
											</c:choose>
											<c:set var="display2" value=""/>
											<c:choose>
												<c:when test="${ loginuser.memberNo == buyStoreQna.memberNo }">
													<c:set var="display2" value="block"/>
												</c:when>
												<c:otherwise>
													<c:set var="display2" value="none"/>
												</c:otherwise>
											</c:choose>																						
											<div style="display: ${ display2 }; float: right">
												<a href="javascript:deleteQna(
														${ buyStoreQna.buyStoreQnaNo }, ${ buyStore.buyStoreNo })">삭제</a>
											</div>
											<div style="display: ${ display }; float: right">
												<a data-toggle="collapse" href="#collapseExample${ buyStoreQna.buyStoreQnaNo }" 
														aria-expanded="false" aria-controls="collapseExample">답글</a> &nbsp;&nbsp;
											</div>
											
											<!-- 답글 -->
											<div class="collapse" id="collapseExample${ buyStoreQna.buyStoreQnaNo }" style="width: 100%; height: 100%">
												<div class="widget-area no-padding blank">
													<div class="status-upload">
														<form id="qnareplyform" action="registerbuyqnareply.action" method="post">
															<input type="hidden" name="buyStoreNo"
																			value="${ buyStore.buyStoreNo }" /> 
															<input type="hidden" name="memberNo" 
																			value="${ loginuser.memberNo }" />
															<input type="hidden" name="name" 
																			value="${ loginuser.name }" />
															<input type="hidden" name="buyStoreQnaNo" 
																			value="${ buyStoreQna.buyStoreQnaNo }" />		
															<textarea style="margin: 5px 20px" name="content"
																			placeholder="내용을 입력 하세요" ></textarea>
															<input type="radio" name="emoticon" value="1"/><img style="width: 30px; height: 30px" src="/gongmo/resources/emoticon/1.png">&nbsp;&nbsp;&nbsp;&nbsp;
															<input type="radio" name="emoticon" value="2"/><img style="width: 30px; height: 30px" src="/gongmo/resources/emoticon/2.png">&nbsp;&nbsp;&nbsp;&nbsp;
															<input type="radio" name="emoticon" value="3"/><img style="width: 30px; height: 30px" src="/gongmo/resources/emoticon/3.png">&nbsp;&nbsp;&nbsp;&nbsp;
															<input type="radio" name="emoticon" value="4"/><img style="width: 30px; height: 30px" src="/gongmo/resources/emoticon/4.png">&nbsp;&nbsp;&nbsp;&nbsp;
															<input type="radio" name="emoticon" value="5"/><img style="width: 30px; height: 30px" src="/gongmo/resources/emoticon/5.png">
															<button type="submit" class="btn btn-success green"><i class="fa fa-share"></i> 등록</button>
														</form>
													</div><!-- Status Upload  -->
												</div><!-- Widget Area -->												
											</div><!-- collapse -->
											
										</div>
									</td>
								</tr>
							</c:forEach>
						</table>
						</c:otherwise>
						</c:choose>
						
					</div>
				</div>

			</div><!-- 댓글 -->
		
		</div><!-- 전체 -->

			        

</div>

</body>
</html>