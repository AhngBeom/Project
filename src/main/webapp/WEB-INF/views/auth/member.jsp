<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="../includes/header.jsp"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid">

			<div>
				<a class="mr-5" href="/auth/all">all</a> <a class="mr-5"
					href="/auth/member">member</a> <a class="mr-5" href="/auth/admin">admin</a>
			</div>
			<h1>/auth/member page</h1>

			<div>
				<p>
					Principal :
					<sec:authentication property="principal" />
				</p>
				<p>
					MemberVO :
					<sec:authentication property="principal.member" />
				</p>
				<p>
					Name :
					<sec:authentication property="principal.member.userName" />
				</p>
				<p>
					ID :
					<sec:authentication property="principal.username" />
				</p>
				<p>
					Authority List :
					<sec:authentication property="principal.member.authList" />
				</p>
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