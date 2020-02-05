<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp"%>

<div class="card">

	<form role="form" action="/inquire/get" method="get">
		<div class="card-header">
			<div class="d-flex justify-content-between mb-3">
				<h1>Inquire</h1>
				<p class="mt-lg-3">
					<fmt:formatDate value="${iq.updateDate }"
						pattern="[yyyy-MM-dd] HH:mm:ss" />
				</p>
			</div>
		</div>

		<div class="card-body">
			<div class="form-group">
				<label>Title</label> <input class="form-control" type="text"
					name="title" readonly="readonly"
					value='<c:out value="${iq.title }"/>'>
			</div>
			<div class="form-group">
				<label>Content</label>
				<textarea class="form-control" rows="3" name="content"
					readonly="readonly"><c:out value="${iq.content }" /></textarea>
			</div>
			<div class="form-group">
				<label>Writer</label> <input class="form-control" type="text"
					name="writer" readonly="readonly"
					value='<c:out value="${iq.writer }"/>'>
			</div>

			<label>Attach File</label>
			<!-- 
			<div class="custom-file">
				<input type="file" class="custom-file-input" id="customFile">
				<label class="custom-file-label" for="customFile">Choose
					file</label>
			</div>
			-->
		</div>
	</form>

	<div class="card-footer d-flex justify-content-end">
		<button type="button" data-oper="list" class="btn btn-warning ml-1">List</button>
		<button type="button" data-oper="modify" class="btn btn-success ml-1">Modify</button>
		<button type="button" data-oper="remove" class="btn btn-danger ml-1">Remove</button>
	</div>

	<form id="operForm" action="/inquire/get" method="get">
		<input type="hidden" id="ino" value="${iq.ino }" name="ino"> <input
			type="hidden" name="pageNum" value="<c:out value='${cri.pageNum }'/>">
		<input type="hidden" name="amount"
			value="<c:out value='${cri.amount }'/>"> <input type="hidden"
			name="type" value="${cri.type }"> <input type="hidden"
			name="keyword" value="${cri.keyword }">
	</form>

</div>

<script type="text/javascript">
	$(document).ready(
			function() {
				$(".custom-file-input").on(
						"change",
						function() {
							var fileName = $(this).val().split("\\").pop();
							$(this).siblings(".custom-file-label").addClass(
									"selected").html(fileName);
						});

				var operForm = $("#operForm");
				$("button[data-oper='modify']").on("click", function(e) {
					operForm.attr("action", "/inquire/modify").submit();
				});
				$("button[data-oper='remove']").on("click", function(e) {
					operForm.attr("action", "/inquire/remove");
					operForm.attr("method", "post").submit();
				});
				$("button[data-oper='list']").on("click", function(e) {
					operForm.find("#bno").remove();
					operForm.attr("action", "/inquire/list").submit();
				});
			});
</script>

<%@ include file="../includes/footer.jsp"%>