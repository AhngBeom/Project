<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid">
			<h1 class="mt-4">Product Addition</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active"></li>
			</ol>

			<div class="row mb-4">
				<div class="col-xl-12 col-md-12">
					<div class="card">
						<form action="/admin/pdtAdd" method="post">
							<div class="card-header d-flex">
								<div class="card-image col-xl-6 col-md-12">
									<input type="file">
								</div>
								<div class="p-4 col-xl-6 col-md-12">
									<div class="input-group mb-lg-5 input-group-lg">
										<div class="input-group-prepend">
											<span class="input-group-text">이름</span>
										</div>
										<input type="text" class="form-control" name="name">
									</div>
									<div class="input-group mb-lg-5 input-group-lg">
										<div class="input-group-prepend">
											<span class="input-group-text">가격</span>
										</div>
										<input type="text" class="form-control" name="price">
										<div class="input-group-append">
											<span class="input-group-text">￦</span>
										</div>
									</div>
									<div class="input-group mb-lg-5 input-group-lg">
										<div class="input-group-prepend">
											<label class="input-group-text" for="inputGroupSelect">옵션
												선택</label>
										</div>
										<select class="custom-select" id="inputGroupSelect">
											<option selected>옵션 선택</option>
											<option value="opt01">옵션 01</option>
											<option value="opt02">옵션 02</option>
											<option value="opt03">옵션 03</option>
										</select>
									</div>
								</div>
							</div>
							<div class="card-body text-center">
								<input type="text" class="card-title form-control"
									placeholder="Product Title">

								<textarea class="card-text form-control"
									placeholder="Product Explanation"></textarea>
								<div class="card-image bg-light border p-5 m-3">
									<input type="file" class="m-xl-4 form-control-file">
									<button class="btn btn-light">
										<i class="fas fa-plus-square fa-9x"></i>
									</button>
								</div>
								<textarea class="card-text form-control"
									placeholder="Product Explanation"></textarea>
							</div>
							<div class="card-footer">
								<button class="btn btn-primary" type="submit">등록</button>
							</div>
						</form>
					</div>
				</div>
			</div>

		</div>
	</main>
	<%@ include file="../includes/footer.jsp"%>