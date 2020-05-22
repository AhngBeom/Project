<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="../includes/header.jsp"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid">

			<h1>Order List</h1>

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

			<c:forEach items="${order }" var="order">
				<div class="card">
					<div class="card-header"><fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
					<div class="card-body">
						<h5 class="card-title">주문번호 : <c:out value="${order.orderNumber }" /></h5>
						<p class="card-text">주문번호 : <c:out value="${order.pdtOnOrder }" /></p>
						<a href="#" class="btn btn-primary">Go somewhere</a>
					</div>
				</div>
			</c:forEach>

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