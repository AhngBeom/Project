<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>
<div id="layoutSidenav_content">
	<main>
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-5">
					<div class="card shadow-lg border-0 rounded-lg mt-5">
						<div class="card-header">
							<h3 class="text-center font-weight-light my-4">Login</h3>
							<h5>
								<c:out value="${error }" />
							</h5>
							<h5>
								<c:out value="${logout }" />
							</h5>
							<h5 class="text-secondary">
								<c:if test="${result eq 0 }">
									회원가입이 정상적으로 완료되었습니다.
								</c:if>
								<c:if test="${result eq 'Member-Info-Update-Complete'}">
									회원정보가 정상적으로 수정되었습니다. <c:out value="${result }"></c:out>
									<%
										response.getStatus();
									%>
								</c:if>
							</h5>
						</div>

						<div class="card-body">
							<form method="post" action="/login">
								<div class="form-group">
									<label class="small mb-1" for="inputId">ID</label><input
										class="form-control py-4" id="inputId" name="username"
										type="text" placeholder="Enter Identification" />
								</div>
								<div class="form-group">
									<label class="small mb-1" for="inputPw">Password</label><input
										class="form-control py-4" id="inputPw" type="password"
										name="password" placeholder="Enter password" />
								</div>
<!-- 								<div class="form-group"> -->
<!-- 									<div class="custom-control custom-checkbox"> -->
<!-- 										<input class="custom-control-input" id="rememberPasswordCheck" -->
<!-- 											type="checkbox" name="remember-me" /><label -->
<!-- 											class="custom-control-label" for="rememberPasswordCheck">Remember -->
<!-- 											password</label> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 								<div class="custom-control custom-checkbox mr-sm-2"> -->
<!-- 									<input type="checkbox" class="custom-control-input" -->
<!-- 										id="" name="remember-me" required> <label -->
<!-- 										class="custom-control-label" for="">Remember -->
<!-- 											password</label> -->
<!-- 								</div> -->
								<div
									class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
									<a class="small" href="/password">Forgot Password?</a>
									<button type="submit" class="btn btn-primary">Login</button>
								</div>
								<input type="hidden" name="${_csrf.parameterName }"
									value="${_csrf.token }">
							</form>
						</div>
						<div class="card-footer text-center">
							<div class="small">
								<a href="/pages/register">Need an account? Sign up!</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<script type="text/javascript">
		
	</script>
	<%@ include file="../includes/footer.jsp"%>