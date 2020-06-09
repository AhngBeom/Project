<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<div id="layoutSidenav_content">
	<main class="">
		<div class="container-fluid bg-secondary">
			<div class="row justify-content-center align-items-stretch">
				<div class="col-xl-8">
					<div class="card shadow-lg border-0 rounded-lg mt-5 mb-5">
						<div class="card-header">
							<h3 class="text-center font-weight-light my-4">Create
								Account</h3>
						</div>
						<div class="card-body">
							<form role="form" action="/auth/register" method="post" id="registerForm">
								<div class="form-row">
									<div class="col-md-12">
										<div class="form-group">
											<i class='fas fa-check-circle text-success'
												style="display: none"></i> <label class="small mb-1"
												for="inputName">Name</label><input class="form-control py-4"
												name="userName" type="text" placeholder="Enter Name" /> <small
												class='text-danger' id='nameCheckMsg'></small>
										</div>
									</div>
								</div>


								<div class="form-group">
									<i class='fas fa-check-circle text-success'
										style="display: none"></i> <label class="small mb-1"
										for="inputID">ID</label>
									<div class="form-row">
										<div class="col-md-10">
											<input class="form-control py-4" name="userid" type="text"
												placeholder="Enter Identification" />
										</div>
										<button class="col-md-2 btn btn-primary" id="idCheck"
											value="Fail">중복체크</button>
									</div>
									<small class='text-danger' id='idCheckMsg'></small>
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
												placeholder="Confirm password" readonly="readonly" /> <small
												class="text-danger" id="confirmPwMsg"></small>
										</div>
									</div>
								</div>
								<div class="form-group mt-4 mb-0">
									<button class="btn btn-primary btn-block" id="createAccount"
										value="">CreateAccount</button>
								</div>
							</form>
						</div>
						<div class="card-footer text-center">
							<div class="small">
								<a href="/auth/login">Have an account? Go to login</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<script type="text/javascript" src="/resources/js/member.js"></script>

	<%@ include file="../includes/footer.jsp"%>