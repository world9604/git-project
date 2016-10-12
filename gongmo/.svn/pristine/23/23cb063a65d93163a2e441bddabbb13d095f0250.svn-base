<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8" session="true"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>

	<meta charset="utf-8" />
	<title></title>

	<link rel="Stylesheet" href="/gongmo/resources/styles/css/input2.css" />
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.js"></script>
	
		<script type="text/javascript">

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
	    text-align: center;
	    margin:auto;
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
	</style>

</head>
<body>
		<c:import url="/WEB-INF/views/include/header.jsp" />
<!--            //////////////////////////////////////////////////////////////////////////////////////////////// -->
<div id="content">
<div class="col-md-10 col-md-offset-1">

	<br />
	
	            <div class="panel panel-default panel-table">
	              <div class="panel-heading">
	                <div class="row">
	                  <div class="col col-xs-6">
	                    <h3 class="panel-title">공지사항 내용</h3>
	                  </div>
	                </div>
	              </div>
	              <div class="panel-body">
	                <table class="table table-striped table-bordered">
	                  <thead>
	                    <tr>
	                        <th>제목</th>
	                        <td>${ notice.title }</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td>${ notice.writer }</td>
						</tr>
						<tr>
							<th>작성일</th>
							<td>${ notice.regDate }</td>
						</tr>
						<tr>
							<th style="width: 150px">업로드 된 파일</th>
							<td><a href='/gongmo/notice/fileDownload.action?uploadFileName=${notice.uploadFileName}&savedFileName=${notice.savedFileName}'>${notice.uploadFileName}</a></td>
						</tr>
						<tr>
							<th style="vertical-align:inherit;">내용</th>
							<td style="height:200px;vertical-align:top">${ notice.content }	</td>
	                    </tr> 
	                  </thead>
	                </table>
	          		  <div class="buttons"> 
			        	<a href='noticelist.action' style="vertical-align:inherit;">목록보기</a>
			        </div>
	              </div>
	            </div>
	</div>
	</div><!-- pageContainer -->
	

</body>
</html>