<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" %>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
       
<!DOCTYPE html>

<html>
<head>
	<meta charset="utf-8" />
	<title>게시물 목록</title>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	
	<script type="text/javascript">
	$(function() {
			
	 	$(".btn-danger").click(function(event) {
	 		var loginuserNo = $('#loginuser').val();
	 		var memberNo = $('#memberNo').val();
	 		
	 		if(loginuserNo != memberNo){
	 			alert('작성자가 아니라 삭제 권한이 없습니다.');
	 			
	 	}else{ 
	 			
	 				if(confirm("정말 삭제하시겠습니까?") == true){
	 				 $.ajax({
	 						url: "/gongmo/stores/buystoreDeleted.action",
	 						type:"post",
	 						data:{ buystoreNo : $(this).attr('data-buystoreNo') },
	 							success : function(data, status, xhr) {
	 						if(data == "success") {
	 							alert('정상적으로 삭제가 완료 되었습니다.');
	 							//화면 리프레쉬
	 							 location.reload();
	 						}
	 						else{
	 							alert('정상적이지 않은 처리입니다.');
	 						}
	 							}});
	 		 				}else{
	 							location.reload();
	 								return;
	 							}
	 				
	 			}
			
		}
	 	);
	});
	</script>
	<style type="text/css">
	/* 게시판 ui */
	.panel-table .panel-body{
	  padding:0;
	}
	
	.panel-table .panel-body .table-bordered{
	  border-style: none;
	  margin:0;
	}
	
	.panel-table .panel-body .table-bordered > thead > tr > th:first-of-type {
	    text-align:center;
	    width: 100px;
	}
	
	.panel-table .panel-body .table-bordered > thead > tr > th:last-of-type,
	.panel-table .panel-body .table-bordered > tbody > tr > td:last-of-type {
	  border-right: 0px;
	}
	
	.panel-table .panel-body .table-bordered > thead > tr > th:first-of-type,
	.panel-table .panel-body .table-bordered > tbody > tr > td:first-of-type {
	  border-left: 0px;
	}
	
	.panel-table .panel-body .table-bordered > tbody > tr:first-of-type > td{
	  border-bottom: 0px;
	}
	
	.panel-table .panel-body .table-bordered > thead > tr:first-of-type > th{
	  border-top: 0px;
	}
	
	.panel-table .panel-footer .pagination{
	  margin:0; 
	}
	
	/*
	used to vertically center elements, may need modification if you're not using default sizes.
	*/
	.panel-table .panel-footer .col{
	 line-height: 34px;
	 height: 34px;
	}
	
	.panel-table .panel-heading .col h3{
	 line-height: 30px;
	 height: 30px;
	}
	
	.panel-table .panel-body .table-bordered > tbody > tr > td{
	  line-height: 34px;
	}

	</style>
	
</head>
<body>

	<c:import url="/WEB-INF/views/include/header.jsp" />
	
	<br />
	
	<div class="container">
	    <div class="row">
	    
	        <div class="col-md-10 col-md-offset-1">
	
	            <div class="panel panel-default panel-table">
	              <div class="panel-heading">
	                <div class="row">
	                  <div class="col col-xs-6">
	                    <h3 class="panel-title">구합니다 게시판</h3>
	                  </div>
	                  <div class="col col-xs-6 text-right">
	                    <button type="button" class="btn btn-sm btn-primary btn-create" 
	                    		style="background-color: #d75050; border-color: #d75050"
	                    		onclick="location.href='buyregister.action'">글쓰기</button>
	                  </div>
	                </div>
	              </div>
	              <div class="panel-body">
	                <table class="table table-striped table-bordered table-list">
	                  <thead>
	                    <tr>
	                        <th><em class="fa fa-cog"></em></th>

	                        <th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
	                    </tr> 
	                  </thead>
	                  <tbody>
	              	  	<c:forEach var="buystore" items="${ buyStores }">
	              	  	<c:choose>
							<c:when test="${buystore.statue eq 'true' }">
							</c:when>
							<c:otherwise>
							<tr>
								<td align="center">
		                            <a id="btn"class="btn btn-danger" data-buystoreNo="${buystore.buyStoreNo}"><em class="fa fa-trash"></em></a>
		                        	<input type="hidden" value="${buystore.memberNo}" id="memberNo"/>
		                        	<input type="hidden" id="loginuser" value="${loginuser.memberNo}"/>
		                        </td>
		                        <td class="hidden-xs">${ buystore.buyStoreNo }</td>
								<td>						
									<a href='buydetail.action?buyStoreNo=${ buystore.buyStoreNo }&pageno=${ pageno }'>
									${ buystore.title }
									</a>
								</td>
								<td>${ buystore.writer }</td>
								<td>${ buystore.regDate }</td>
							</tr>
						</c:otherwise>
							</c:choose>
							</c:forEach>
	                   </tbody>
	                </table>
	            
	              </div>
	              
	              <!-- ////////// 페이징 부분 ///////////// -->
	              
	              <div class="panel-footer">
	                <div class="row">
	                  <div class="col col-xs-4">Page ${ pager.currentPage } of ${ pager.pageCount }
	                  </div>
	                  <div class="col col-xs-8">
	                    <ul class="pagination hidden-xs pull-right">
	                    	<c:choose>
	                    		<c:when test="${ pager.currentPage > 1 }">
				                   	<li><a href="${ pager.linkUrl }?pageno=1">처음</a></li>
				                    <li><a href="${ pager.linkUrl }?pageno=${ pager.currentPage -1}">이전</a></li>
				                 </c:when>
	                     	</c:choose>
							<c:set var="pagerBlock" value="${ (pager.currentPage - 1) / pager.pagerSize }"/> 
							<c:set var="intPagerBlock" value="${ fn:substringBefore(pagerBlock, '.') }" />
							<c:set var="start" value="${ (intPagerBlock * pager.pagerSize)  + 1}"/> 
							<c:set var="end" value="${ start + pager.pagerSize }"/> 
							<c:if test="${ end > pager.pageCount }">
								<c:set var="end" value="${ pager.pageCount +1 }"/> 
							</c:if>	
							<c:set var="doneLoop" value="false"/> <!-- break 기능 -->
		                     		                      
		                     <c:forEach begin="${ start }" end="${ end -1}" var="i">		                     	
		                    	 <c:if test="${not doneLoop}"> 
			                     	<c:choose>
			                     		<c:when test="${ i > pager.pageCount }">
			                     			<c:set var="doneLoop" value="true"/> 
			                     		</c:when>
			                     	</c:choose>
			                     	<c:choose>
			                     		<c:when test="${ i == pager.currentPage }">
			                     			<li><a href="#">${ i }</a></li>
			                     		</c:when>
			                     		<c:otherwise>
			                     			<li><a href="${ pager.linkUrl }?pageno=${ i }">${ i }</a></li>
			                     		</c:otherwise>
			                     	</c:choose>
		                     	</c:if>
		                     </c:forEach>
	                      
		                    <c:choose>
		                    	<c:when test="${ pager.currentPage < pager.pageCount }">
					            	<li><a href="${ pager.linkUrl }?pageno=${ pager.currentPage +1}">다음</a></li>
					                <li><a href="${ pager.linkUrl }?pageno=${ pager.pageCount}">마지막</a></li>
					        	</c:when>
					        </c:choose>       
	                    </ul>
	                    
	                  </div>
	                </div>
	              </div>
	              
	            </div>
	
	</div></div></div>

</body>
</html>













