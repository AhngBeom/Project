<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ page import="java.util.*"%>
<%@ include file="../includes/header.jsp"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid">
			<div>
				<a class="mr-5" href="/auth/all">all</a> <a class="mr-5"
					href="/auth/member">member</a> <a class="mr-5" href="/auth/admin">admin</a>
			</div>
			<h1>Access Denied Page</h1>
			<h2>
				<c:out value="${SPRING_SECURITY_403_EXCEPTION.getMessage() }" />
			</h2>
			<h2>
				<c:out value="${msg }" />
			</h2>
		</div>
	</main>
	<%@ include file="../includes/footer.jsp"%>