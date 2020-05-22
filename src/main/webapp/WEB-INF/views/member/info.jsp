<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="../includes/header.jsp"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid">

			<h1>Member page</h1>

			<!-- 			<div> -->
			<!-- 				<p> -->
			<!-- 					Principal : -->
			<%-- 					<sec:authentication property="principal" /> --%>
			<!-- 				</p> -->
			<!-- 				<p> -->
			<!-- 					MemberVO : -->
			<%-- 					<sec:authentication property="principal.member" /> --%>
			<!-- 				</p> -->
			<!-- 				<p> -->
			<!-- 					Name : -->
			<%-- 					<sec:authentication property="principal.member.userName" /> --%>
			<!-- 				</p> -->
			<!-- 				<p> -->
			<!-- 					ID : -->
			<%-- 					<sec:authentication property="principal.username" /> --%>
			<!-- 				</p> -->
			<!-- 				<p> -->
			<!-- 					Authority List : -->
			<%-- 					<sec:authentication property="principal.member.authList" /> --%>
			<!-- 				</p> -->
			<!-- 			</div> -->
			<div
				class="d-flex justify-content-center col-xl-12 border rounded p-3">
				<img src="/resources/assets/img/img_avatar_male.png" alt="Avatar"
					style="width: 20%">
				<div class="container text-center">
					<div class="alert alert-warning h4" role="alert">
						<span class="badge badge-secondary">이름</span>
						<sec:authentication property="principal.member.userName" />
					</div>
					<div class="alert alert-warning h5" role="alert">
						<span class="badge badge-secondary">ID</span>
						<sec:authentication property="principal.username" />
					</div>
					<div class="alert alert-warning h5" role="alert">
						<span class="badge badge-secondary">권한</span> <em> <sec:authentication
								property="principal.authorities" />
						</em>
					</div>
				</div>
				<div class="container d-flex flex-column">
					<a class="btn btn-light m-1">최근 본 상품</a> <a
						class="btn btn-light m-1" href="/product/cart">장바구니</a> <a
						class="btn btn-light m-1" href="/member/orderList">주문목록</a> <a
						class="btn btn-light m-1">위시리스트</a><a class="btn btn-light m-1">회원정보
						수정</a>
				</div>
			</div>

			<div>

				<c:forEach items="${order }" var="order">
					<p>
						주문번호 :
						<c:out value="${order.orderNumber }" />
					</p>
				</c:forEach>
			</div>

			<div>
				<sec:authorize access="isAnonymous()">
					<a class="mr-5" href="/auth/login">Login</a>
				</sec:authorize>

				<sec:authorize access="isAuthenticated()">
					<a class="mr-5" href="/auth/logout">Logout</a>
				</sec:authorize>
			</div>
		</div>
	</main>
	<%@ include file="../includes/footer.jsp"%>