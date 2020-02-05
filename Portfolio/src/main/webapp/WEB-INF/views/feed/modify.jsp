<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../includes/header.jsp"%>

<h1>Modify</h1>

<div class="card">

	<form role="form" action="/feed/modify" method="post">
		<input type="hidden" name="fno" value="<c:out value='${feed.fno }'/>">

		<div class="card-header">
			<div class="form-group">
				<label>UserID</label> <input class="form-control" type="text"
					name="userID" value="<c:out value='${feed.userID }'/>">
			</div>
		</div>

		<div class="card-body">
			<div class="form-group">
				<label>Message</label>
				<textarea class="form-control" rows="3" name="message"><c:out
						value='${feed.message }' /></textarea>
			</div>


			<label>Attach</label><br>
			<!-- 
			<a data-toggle="collapse"
				href="#youtubeDiv"><i class="fab fa-youtube fa-3x"></i></a> <a
				data-toggle="collapse" href="#imageDiv"><i
				class="far fa-image fa-3x"></i></a>
            -->
			<c:choose>
				<c:when test="${not empty feed.link }">
					<div class="collapse input-group mt-1 mb-1 show" id="youtubeDiv">
						<input type="text" class="form-control" placeholder="Link"
							name="link" value="<c:out value='${feed.link }'/>">
						<div class="input-group-append">
							<button class="btn btn-warning" type="reset" id="resetBtn">Reset</button>
							<button class="btn btn-success" type="button" id="prevBtn">Preview</button>
						</div>
					</div>

					<div class="preview mb-3">
						<div class='mediaDiv embed-responsive embed-responsive-16by9'>
							<iframe class='embed-responsive-item'
								src='<c:out value='${feed.link }'/>' allowfullscreen></iframe>
						</div>
					</div>
				</c:when>
				<c:when test="${feed.image eq true }">
					<div class="collapse show" id="imageDiv">
						<input type="file" multiple="multiple" name="uploadFile"
							id="image">
						<div class="uploadResult" style="background-color: gray;">
							<ul class="imageUL">
							</ul>
						</div>
					</div>
				</c:when>
				<c:otherwise></c:otherwise>
			</c:choose>

		</div>

		<div class="card-footer d-flex justify-content-end">
			<button type="reset" class="btn btn-warning ml-1">Reset</button>
			<button type="submit" class="btn btn-success ml-1">Submit</button>
		</div>
	</form>

</div>

<script type="text/javascript" src="/resources/myJS/attach.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var yBtn = $("a[href='#youtubeDiv']");
		var iBtn = $("a[href='#imageDiv']");
		var fBtn = $("a[href='#fileDiv']");

		var yDiv = $("#youtubeDiv");
		var yInput = $("#youtubeDiv input");
		var iDiv = $("#imageDiv");
		var iInput = $("#imageDiv input");
		var fDiv = $("#fileDiv");
		var fInput = $("#fileDiv input");

		yBtn.on("click", function(e) {
			iDiv.removeClass("show");
			$(".uploadResult ul li").remove();
			iInput.val(null);
			fDiv.removeClass("show");
			fInput.val(null);
		});
		iBtn.on("click", function(e) {
			yDiv.removeClass("show");
			yInput.val(null);
			fDiv.removeClass("show");
			fInput.val(null);
		});
		fBtn.on("click", function(e) {
			yDiv.removeClass("show");
			yInput.val(null);
			iDiv.removeClass("show");
			iInput.val(null);
		});
	});

	$("button[id='resetBtn']").on("click", function(e) {
		//e.preventDefault();
		//$("input[name='link']").val('');
		console.log($(".preview .mediaDiv iframe").attr('src'));
	});

	var preview = $(".preview");
	$("button[id='prevBtn']")
			.on(
					"click",
					function(e) {
						var link = $("input[name='link']").val();
						var str = "";

						if (link === $(".preview .mediaDiv iframe").attr('src')) {
							alert("링크가 수정되지 않았습니다.");
						} else {
							link = regService.linkConvert(link);
							str += "<div class='mediaDiv embed-responsive embed-responsive-16by9'>"
									+ "<iframe class='embed-responsive-item' src='"
								+ link +"' allowfullscreen></iframe></div>";
							preview.html(str);
							$("input[name='link']").val(link);
							console.log($("input[name='link']").val());
						}
					});
</script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						(function() {
							var fno = '<c:out value="${feed.fno}"/>';
							$
									.getJSON(
											"/feed/getAttachList",
											{
												fno : fno
											},
											function(arr) {
												console.log(arr);
												var str = "";
												$(arr)
														.each(
																function(i,
																		attach) {
																	var fileCallPath = encodeURIComponent(attach.uploadPath
																			+ "/s_"
																			+ attach.uuid
																			+ "_"
																			+ attach.fileName);
																	str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.fileType + "'><div>";
																	str += "<span>"
																			+ attach.fileName
																			+ "</span>";
																	str += "<button type='button' data-file=\'" 
						+ fileCallPath + "\' data-type='image' class='btn btn-warning btn-circle'>";
																	str += "<i class='fas fa-times'></i></button><br>";
																	str += "<img src='/display?fileName="
																			+ fileCallPath
																			+ "'>";
																	str += "</div></li>";
																});
												$(".uploadResult ul").html(str);
											});
						})();
						$(".uploadResult").on("click", "button", function(e) {
							if (confirm("Remove this Image")) {
								var targetLi = $(this).closest("li");
								targetLi.remove();
							}
						});

						var formObj = $("form[role='form']");
						$("button[type='submit']")
								.on(
										"click",
										function(e) {
											e.preventDefault();
											console.log("Submit Clicked");
											var str = "";
											$(".uploadResult ul li")
													.each(
															function(i, obj) {
																var jobj = $(obj);
																console
																		.dir(jobj);
																str += "<input type='hidden' name='attachList["
																		+ i
																		+ "].uuid' value='"
																		+ jobj
																				.data("uuid")
																		+ "'>";
																str += "<input type='hidden' name='attachList["
																		+ i
																		+ "].fileName' value='"
																		+ jobj
																				.data("filename")
																		+ "'>";
																str += "<input type='hidden' name='attachList["
																		+ i
																		+ "].uploadPath' value='"
																		+ jobj
																				.data("path")
																		+ "'>";
																str += "<input type='hidden' name='attachList["
																		+ i
																		+ "].fileType' value='"
																		+ jobj
																				.data("type")
																		+ "'>";
															});
											formObj.append(str).submit();
										});

						var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)");
						var maxSize = 5242880;

						function checkExtension(fileName, fileSize) {
							if (fileSize >= maxSize) {
								alert("파일 사이즈 초과");
								return false;
							}
							if (regex.test(fileName)) {
								alert("해당 종류의 파일은 업로드할 수 없습니다.");
								return false;
							}
							return true;
						}
						$("input[type='file']")
								.change(
										function(e) {
											console.log("Change");

											var formData = new FormData();
											var inputFile = $("input[name='uploadFile']");
											var files = inputFile[0].files;
											console.log(files);

											for (var i = 0; i < files.length; i++) {
												if (!checkExtension(
														files[i].name,
														files[i].size)) {
													return false;
												}
												formData.append("uploadFile",
														files[i]);
											}

											$.ajax({
												url : '/uploadAjaxAction',
												processData : false,
												contentType : false,
												data : formData,
												type : 'POST',
												dataType : 'json',
												success : function(result) {
													console.log(result);
													showUploadResult(result);
													//$(".uploadDiv").html(cloneObj.html());
												}
											});
										});
						function showUploadResult(uploadResultArr) {
							if (!uploadResultArr || uploadResultArr.length == 0) {
								return;
							}
							var uploadImageUL = $(".uploadResult .imageUL");

							var str = "";
							$(uploadResultArr)
									.each(
											function(i, attach) {
												var fileCallPath = encodeURIComponent(attach.uploadPath
														+ "/s_"
														+ attach.uuid
														+ "_" + attach.fileName);
												str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.fileType + "'><div>";
												str += "<span>"
														+ attach.fileName
														+ "</span>";
												str += "<button type='button' data-file=\'" 
										+ fileCallPath + "\' data-type='image' class='btn btn-warning btn-circle'>";
												str += "<i class='fas fa-times'></i></button><br>";
												str += "<img src='/display?fileName="
														+ fileCallPath + "'>";
												str += "</div></li>";

											});
							uploadImageUL.append(str);
						}

					});
</script>


<%@ include file="../includes/footer.jsp"%>