<%@ page language="java" pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8" />
<title></title>

<link href="/gongmo/resources/styles/css/intereststore.css"
	rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">
	$(function() {
		$(".btn-danger").click(function(event) {
			if (confirm("정말 삭제하시겠습니까?") == true) {
				$.ajax({
					url : "/gongmo/member/intereststoreDeleted.action",
					type : "post",
					data : {
						intereststoreNo : $(this).attr('data-storeno')
					},
					success : function(data, status, xhr) {
						if (data == "success") {
							alert('정상적으로 삭제가 완료 되었습니다.');
							//화면 리프레쉬
							location.reload();
						} else {
							alert('정상적이지 않은 처리입니다.');
						}
					}
				});
			} else {
				location.reload();
				return;
			}

		});
	});
</script>

</head>
<body>
<c:set var="found" value="0" />
	<div id="pageContainer">
		<c:import url="/WEB-INF/views/include/header.jsp" />

		<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->


		<div class="container">

			<h1 class="text-center text-primary title">관심 매물 리스트</h1>
			<hr class="divider-title">
			
			<c:forEach var="store" items="${stores}">
				<div class="col-ms-10 col-md-4">
					<div class="project">
					<c:set var="found" value="0" />
						<figure class="img-responsive">
							<c:forEach var="storeImage" items="${storeImages}">
								<c:choose>
									<c:when test="${store.storeNo == storeImage.storeNo}">
									<c:if test="${found eq 0}">
											<c:set var="found" value="1" />
										<img src="/gongmo/resources/upload/${storeImage.uploadFileName}"
											style="height: 250px">
											</c:if>
									</c:when>
								</c:choose>
							</c:forEach>
							<figcaption>
								<span class="project-details">${store.storeName}&nbsp;[${store.leaseOrDealing}]</span>
								<span class="project-price"><strong>${store.type}</strong></span>
								<span class="project-creator">${store.storeAddress}</span>
							</figcaption>
							<span class="actions">
								<button class="btn btn-warning bnt-action" type="submit"
									onclick="location.href='/gongmo/stores/storeBuyDetail.action?storeNo=${store.storeNo}&lonmemberNo=${loginuser.memberNo}&memberNo=${store.memberNo}'">View
								</button>
								<c:forEach var="intereststore" items="${intereststores}"
								varStatus="status">
								<c:choose>
									<c:when
										test="${intereststore.memberNo == loginuser.memberNo && intereststore.storeNo == store.storeNo}">

										<input class="btn btn-danger" type="submit"
											id="interestStoreDeleted" value="관심 매물에서 삭제"
											style="width: 100%"
											data-storeno="${intereststore.interestStoreNo}">

									</c:when>
								</c:choose>
								
							</c:forEach>
							</span>
						</figure>
					</div>
				</div>
			</c:forEach>

		</div>

	</div>

</body>
</html>