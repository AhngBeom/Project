<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<div id="layoutSidenav_content">
	<main class="sb-sidenav-dark h-100">
		<div class="container-fluid">
			<h1 class="mt-4 text-white">Products Addition Page</h1>
			<ol class="breadcrumb mb-2 bg-transparent">
				<li class="breadcrumb-item"><a href="/admin/pdtTable">Table</a></li>
				<li class="breadcrumb-item active">Add Page</li>
			</ol>
			<form role="form" action="/admin/pdtAdd" method="post">
				<div
					class="pdt-info d-flex flex-column justify-content-center col-xl-9 m-auto">
					<div class="input-group mb-3 input-group-lg">
						<div class="input-group-prepend">
							<span class="input-group-text">Name</span>
						</div>
						<input type="text" class="form-control" id="fname" name="name">
					</div>
					<div class="input-group mb-3 input-group-lg">
						<div class="input-group-prepend">
							<span class="input-group-text">Title</span>
						</div>
						<input type="text" class="form-control" id="lname" name="title">
					</div>
					<div class="input-group mb-3 input-group-lg">
						<div class="input-group-prepend">
							<span class="input-group-text">Category</span>
						</div>
						<select class="form-control" id="category" name="category"
							data-category="${pdt.category }">
							<option value="Category 1">Category 1</option>
							<option value="Category 2">Category 2</option>
							<option value="Category 3">Category 3</option>
						</select>
					</div>
					<div class="input-group mb-3 input-group-lg">
						<div class="input-group-prepend">
							<span class="input-group-text">Price</span>
						</div>
						<input type="text" class="form-control" id="price" name="price">
					</div>
					<div class="input-group mb-3 input-group-lg">
						<div class="input-group-prepend">
							<span class="input-group-text">Description</span>
						</div>
						<textarea class="form-control" id="descript" name="descript"
							placeholder="" style="height: 300px;"></textarea>
					</div>
				</div>
				<div class="form-group d-flex justify-content-center">
					<input class="m-3" type="file" name='uploadFile'
						multiple="multiple">
					<div class="row attach-list border col-xl-9 m-1"></div>
					<div class="row attach-expand"></div>
				</div>

				<div class="d-flex justify-content-center m-3">
					<input class="btn btn-success" id="pdtSubmit" value="Submit">
				</div>
			</form>
		</div>
	</main>
	<%@ include file="../includes/footer_nonFooterTag.jsp"%>