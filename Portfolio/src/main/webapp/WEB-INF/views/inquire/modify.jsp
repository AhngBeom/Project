<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp"%>

<div class="card">

	<form role="form" action="/inquire/modify" method="post">
		<div class="card-header">
			<div class="d-flex justify-content-between mb-3">
				<h1>Modify</h1>
				<p class="mt-lg-3">
					<fmt:formatDate value="${iq.updateDate }"
						pattern="[yyyy-MM-dd] HH:mm:ss" />
				</p>
			</div>
		</div>

		<div class="card-body">
			<input type="hidden" name="ino" value='<c:out value="${iq.ino }"/>'>
			<input type="hidden" name="pageNum"
				value="<c:out value='${cri.pageNum }'/>"> <input
				type="hidden" name="amount" value="<c:out value='${cri.amount }'/>">
			<input type="hidden" name="type" value="${cri.type }"> <input
				type="hidden" name="keyword" value="${cri.keyword }">
			<div class="form-group">
				<label>Title</label> <input class="form-control" type="text"
					name="title" value='<c:out value="${iq.title }"/>'>
			</div>
			<div class="form-group">
				<label>Content</label>
				<textarea class="form-control" rows="3" name="content"><c:out
						value="${iq.content }" /></textarea>
			</div>
			<div class="form-group">
				<label>Writer</label> <input class="form-control" type="text"
					name="writer" value='<c:out value="${iq.writer }"/>'>
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

		<div class="card-footer d-flex justify-content-end">
			<button type="button" data-oper="list" class="btn btn-warning ml-1">List</button>
			<button type="submit" class="btn btn-success ml-1">Submit</button>
		</div>

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

				var formObj = $("form");

				$("button[data-oper='list']")
						.on(
								"click",
								function(e) {
									e.preventDefault();
									formObj.attr("action", "/inquire/list")
											.attr("method", "get");
									var pageNumTag = $("input[name='pageNum']")
											.clone();
									var amountTag = $("input[name='amount']")
											.clone();
									var typeTag = $("input[name='type']")
											.clone();
									var keywordTag = $("input[name='keyword']")
											.clone();
									formObj.empty();
									formObj.append(pageNumTag);
									formObj.append(amountTag);
									formObj.append(typeTag);
									formObj.append(keywordTag);
									formObj.submit();
								});
			});
</script>

<%@ include file="../includes/footer.jsp"%>