<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp"%>

<div class="card">
	
	<form role="form" action="/inquire/register" method="post">
		<div class="card-header">
			<h1>Register</h1>
		</div>

		<div class="card-body">
			<div class="form-group">
				<label>Title</label> <input class="form-control" type="text"
					name="title">
			</div>
			<div class="form-group">
				<label>Content</label>
				<textarea class="form-control" rows="3" name="content"></textarea>
			</div>
			<div class="form-group">
				<label>Writer</label> <input class="form-control" type="text"
					name="writer">
			</div>

			<label>Attach File</label>
			<div class="custom-file">
				<input type="file" class="custom-file-input" id="customFile">
				<label class="custom-file-label" for="customFile">Choose
					file</label>
			</div>
		</div>

		<div class="card-footer d-flex justify-content-end">
			<button type="reset" class="btn btn-warning ml-1">Reset</button>
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
			});
</script>

<%@ include file="../includes/footer.jsp"%>