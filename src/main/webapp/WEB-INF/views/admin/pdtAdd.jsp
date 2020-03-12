<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid">
			<h1 class="mt-4">Products Addition</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="/admin/pdtTable">Table</a></li>
				<li class="breadcrumb-item active">Add Page</li>
			</ol>
			<div class="pdt-info">
				<form action="/admin/pdtAdd" method="post">
					<div class="form-group row">
						<div class="col-xl-3">
							<label class="col-sm-2 col-form-label" for="fname">Name</label>
						</div>
						<div class="col-xl-9">
							<input type="text" class="form-control" id="fname" name="name"
								placeholder="Product name..">

						</div>
					</div>
					<div class="form-group row">
						<div class="col-xl-3">
							<label class="col-sm-2 col-form-label" for="lname">Subtitle</label>
						</div>
						<div class="col-xl-9">
							<input type="text" class="form-control" id="lname" name="title"
								placeholder="Product title...">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-xl-3">
							<label class="col-sm-2 col-form-label" for="category">Category</label>
						</div>
						<div class="col-xl-9">
							<select class="form-control" id="category" name="category"
								data-category="${pdt.category }">
								<option value="c1">Category 1</option>
								<option value="c2">Category 2</option>
								<option value="c3">Category 3</option>
							</select>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-xl-3">
							<label class="col-sm-2 col-form-label" for="lname">Price</label>
						</div>
						<div class="col-xl-9">
							<input type="text" class="form-control" id="price" name="price"
								placeholder="How much price..">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-xl-3">
							<label class="col-sm-2 col-form-label" for="descript">Description</label>
						</div>
						<div class="col-xl-9">
							<textarea class="form-control" id="descript" name="descript"
								placeholder="Write description.." style="height: 200px"></textarea>
						</div>
					</div>
					<div class="form-group">
						<input class="m-3" type="file" name='uploadFile'
							multiple="multiple">
						<div class="row attach-list"></div>
						<div class="row attach-expand"></div>
					</div>

					<div class="row d-flex justify-content-center m-3">
						<input type="submit" class="btn btn-success"
							value="Submit / Modify">
					</div>
				</form>
			</div>
		</div>
	</main>
	<%@ include file="../includes/footer.jsp"%>