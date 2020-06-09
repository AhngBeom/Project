<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="../includes/header.jsp"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid">

			<h1>Member page</h1>
			<div class="float-right mb-3">
				<a class="btn btn-secondary" href="/logout">Logout</a>
			</div>
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
				class="d-flex justify-content-center col-xl-12 border rounded mb-3 p-3 ">
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
						class="btn btn-light m-1">위시리스트</a><a class="btn btn-light m-1"
						data-toggle="collapse" data-target="#collapseExample">회원정보 수정</a>
				</div>
			</div>
			<div class="collapse" id="collapseExample">
				<div class="card card-body">
					<form role="form" action="/auth/modify" method="post" >
						<div class="form-row d-flex justify-content-center">
							<div class="col-md-6">
								<div class="form-group">
									<div class="input-group mb-3">
										<div class="input-group-prepend">
											<span class="input-group-text" id="basic-addon1">ID</span>
										</div>
										<input class="form-control py-4 bg-light" name="userid"
											type="text"
											value="<sec:authentication property='principal.username' />"
											readonly="readonly" />
									</div>
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-12">
								<div class="form-group">
									<i class='fas fa-check-circle text-success'
										style="display: none"></i> <label class="small mb-1"
										for="inputName">Name</label><input class="form-control py-4"
										name="userName" type="text" placeholder="Enter Name" />
										<small class="text-danger"
										id="nameCheckMsg"></small>
								</div>
							</div>
						</div>
						<div class="form-row">
							<div class="col-md-6">
								<div class="form-group">
									<i class='fas fa-check-circle text-success'
										style="display: none"></i> <label class="small mb-1"
										for="inputPassword">Password</label><input
										class="form-control py-4" name="userpw" type="password"
										placeholder="Enter password" /> <small class="text-danger"
										id="pwCheckMsg"></small>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<i class='fas fa-check-circle text-success'
										style="display: none"></i> <label class="small mb-1"
										for="inputConfirmPassword">Confirm Password</label><input
										class="form-control py-4" id="confirmPw" type="password"
										placeholder="Confirm password" readonly="readonly"/> <small class="text-danger"
										id="confirmPwMsg"></small>
								</div>
							</div>
						</div>
						<div class="form-group d-flex justify-content-center mt-4 mb-0">
							<input type="submit" class="btn btn-warning btn-block col-xl-4"
								id="updateAccount" value="수정">
						</div>
					</form>
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
		</div>
	</main>
	<script type="text/javascript" src="/resources/js/member.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var result = '<c:out value="${result}"/>';
			if (result === 'Member-Info-Update-Complete') {
				console.log(result);
			}
		});
	</script>
	<%@ include file="../includes/footer.jsp"%>