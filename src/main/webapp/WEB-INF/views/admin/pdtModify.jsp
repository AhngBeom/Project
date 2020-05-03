<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>

<div id="layoutSidenav_content">
	<main class="sb-sidenav-dark h-100">
		<div class="container-fluid">
			<h1 class="mt-4 text-white">Products Modify</h1>
			<ol class="breadcrumb mb-2 bg-transparent">
				<li class="breadcrumb-item"><a href="/admin/pdtTable">Table</a></li>
				<li class="breadcrumb-item"><a href="/admin/pdtAdd">Add
						Page</a></li>
				<li class="breadcrumb-item active">Info Page</li>
			</ol>
			<form role="form" action="/admin/pdtModify" method="post">
				<div
					class="pdt-info d-flex flex-column justify-content-center col-xl-9 m-auto">
					<input type="hidden" name="pno" value="${pdt.pno }">
					<div class="input-group mb-3 input-group-lg">
						<div class="input-group-prepend">
							<span class="input-group-text">Name</span>
						</div>
						<input type="text" class="form-control" id="fname" name="name"
							value="${pdt.name }">
					</div>
					<div class="input-group mb-3 input-group-lg">
						<div class="input-group-prepend">
							<span class="input-group-text">Title</span>
						</div>
						<input type="text" class="form-control" id="lname" name="title"
							value="${pdt.title }">
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
						<input type="text" class="form-control" id="price" name="price"
							value="${pdt.price }">
					</div>
					<div class="input-group mb-3 input-group-lg">
						<div class="input-group-prepend">
							<span class="input-group-text">Description</span>
						</div>
						<textarea class="form-control" id="descript"
							name="descript" placeholder="" style="height: 300px;"><c:out
								value="${pdt.descript }"></c:out></textarea>
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

	<script>
		$(document).ready(
				function() {
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
								var overlay = "<div class='opacity-div d-flex flex-column justify-content-center w-100'>"
										+ "<button class='btn btn-warning m-auto img-expand-btn'><i class=''></i>크게 보기</button>"
										+ "<button class='btn btn-danger m-auto img-remove-btn'><i class=''></i>삭제</button>"
										+ "</div>";

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
																			str += "<div class='card-image attach-image col-xl-3 col-md-12 mb-3 d-flex justice-content-center' data-path='"
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
	<%@ include file="../includes/footer_nonFooterTag.jsp"%>