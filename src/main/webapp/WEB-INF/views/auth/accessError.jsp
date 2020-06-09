<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ page import="java.util.*"%>
<%@ include file="../includes/header.jsp"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid bg-secondary mt-4 p-3">
			<div class="d-flex justify-content-center ">
				<img src="/resources/assets/img/denied.png" width="100px">
			</div>
			<div class="img-fluid col-xl-12 mt-4 mb-4">
				<div class="row align-items-center">
					<div class="col h1 text-white text-center">
						<h1>Access Denied</h1>
						<h2>
							<c:out value="${memberAuth }" />
						</h2>
						<c:if test="${memberAuth eq '[ROLE_MEMBER]' }">
							<h3>접근 권한이 존재하지 않습니다.</h3>
						</c:if>
						<div id="time"></div>
					</div>
				</div>
			</div>
			<h2>
				<c:out value="${SPRING_SECURITY_403_EXCEPTION.getMessage() }" />
			</h2>

		</div>
	</main>
	<%@ include file="../includes/footer.jsp"%>