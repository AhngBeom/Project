<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>


<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid">
			<h1 class="mt-4">Products Info</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="/admin/pdtTable">Table</a></li>
				<li class="breadcrumb-item"><a href="/admin/pdtAdd">Add
						Page</a></li>
				<li class="breadcrumb-item active">Info Page</li>
			</ol>
			<div class="pdt-info">
				<form action="/admin/pdtAdd" method="post">
					<div class="form-group row">
						<div class="col-xl-3">
							<label class="col-sm-2 col-form-label" for="fname">Name</label>
						</div>
						<div class="col-xl-9">
							<input type="text" class="form-control" id="fname" name="name"
								value="${pdt.name }">

						</div>
					</div>
					<div class="form-group row">
						<div class="col-xl-3">
							<label class="col-sm-2 col-form-label" for="lname">Subtitle</label>
						</div>
						<div class="col-xl-9">
							<input type="text" class="form-control" id="lname" name="title"
								value="${pdt.title }">
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
								value="${pdt.price }">
						</div>
					</div>
					<div class="form-group row">
						<div class="col-xl-3">
							<label class="col-sm-2 col-form-label" for="descript">Description</label>
						</div>
						<div class="col-xl-9">
							<textarea class="form-control" id="descript" name="descript"
								placeholder="Write description.." style="height: 200px">${pdt.descript } </textarea>
						</div>
					</div>
					<div class="form-group">
						<input class="m-3" type="file" name='uploadFile'
							multiple="multiple">
						<div class="row attach-list"></div>
						<div class="row" id="attach-expand"></div>
					</div>

					<div class="row d-flex justify-content-center m-3">
						<input type="submit" class="btn btn-success"
							value="Submit / Modify">
					</div>
				</form>
			</div>
		</div>
	</main>
	<script>
		// 		function myFunction(imgs) {
		// 			var expandImg = document.getElementById("expandedImg");
		// 			var imgText = document.getElementById("imgtext");
		// 			expandImg.src = imgs.src;
		// 			imgText.innerHTML = imgs.alt;
		// 			expandImg.parentElement.style.display = "block";
		// 		}
		$(document).ready(
				function() {
					$(document).on("click", ".img-expand-btn", function(e) {
						e.preventDefault();
						var imgItemDiv = $(this).parents(".card-image");
						console.log(imgItemDiv.data('filename'));
						$("#attach-expand")
					});

					$("#category option").each(
							function(i, e) {
								if ($(this).val() === $("#category").data(
										"category")) {
									$(
											"#category option[value='"
													+ $("#category").data(
															"category") + "']")
											.attr("selected", "selected");
								}
							});
				});

		$(document)
				.ready(
						function() {
							(function() {
								var pno = '<c:out value="${pdt.pno}"/>';
								var overlay = "<div class='opacity-div d-flex justify-content-center w-100'><button class='btn btn-warning img-expand-btn'><i class=''></i> 장바구니</button></div>";

								$
										.getJSON(
												"/admin/getAttachList",
												{
													pno : pno
												},
												function(arr) {
													console.log(arr);
													var str = "";

													$(arr)
															.each(
																	function(i,
																			attach) {
																		if (attach.fileType) {
																			var imageThumbPath = encodeURIComponent(attach.uploadPath
																					+ "/s_"
																					+ attach.uuid
																					+ "_"
																					+ attach.fileName);
																			var imageOriginPath = encodeURIComponent(attach.uploadPath
																					+ "/"
																					+ attach.uuid
																					+ "_"
																					+ attach.fileName);
																			str += "<div class='card-image attach-image col-xl-3 mb-3' data-path='"
																				+ attach.uploadPath
																				+ "' data-uuid='"
																				+ attach.uuid
																				+ "' data-filename='"
																				+ attach.fileName
																				+ "' data-type='"
																				+ attach.fileType
																				+ "'><img class='img-item' src='/display?fileName="
																					+ imageThumbPath
																					+ "'>"
																					+ overlay
																					+ "</div>";
																		}

																	});
													$(".attach-list").html(str);
												});
							})();
						});
	</script>
	<%@ include file="../includes/footer.jsp"%>