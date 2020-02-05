<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp"%>

<div class="card">

	<form role="form" action="/feed/register" method="post">
		<div class="card-header">
			<div class="form-group">
				<label>UserID</label> <input class="form-control" type="text"
					name="userID">
			</div>
		</div>

		<div class="card-body">
			<div class="form-group">
				<label>Message</label>
				<textarea class="form-control" rows="5" name="message"></textarea>
			</div>

			<label>Attach</label><br> <a data-toggle="collapse"
				href="#youtubeDiv"><i class="fab fa-youtube fa-3x"></i></a> <a
				data-toggle="collapse" href="#imageDiv"><i
				class="far fa-image fa-3x"></i></a> <a data-toggle="collapse"
				href="#fileDiv"> <i class="fas fa-paperclip fa-3x"></i>
			</a>

			<div class="collapse input-group mt-1" id="youtubeDiv">
				<input type="text" class="form-control" placeholder="Link"
					name="link">
				<div class="input-group-append">
					<button class="btn btn-success" type="button" id="linkBtn">Preview</button>
				</div>
			</div>

			<div class="collapse" id="imageDiv">
				<input type="file" multiple="multiple" name="uploadFile" id="image">
				<div class="uploadResult" style="background-color: gray;">
					<ul class="imageUL">
					</ul>
				</div>
			</div>

			<div class="collapse" id="fileDiv">
				<input type="file" multiple="multiple" name="uploadFile" id="file">
			</div>

<div class="preview mb-3"></div>

		</div>

		<div class="card-footer d-flex justify-content-end">
			<button type="reset" class="btn btn-warning ml-1">Reset</button>
			<button type="submit" class="btn btn-success ml-1">Submit</button>
		</div>
	</form>
</div>

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
</script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var formObj = $("form[role='form']");
						var preview = $(".preview");

						$("button[id='linkBtn']")
								.on(
										"click",
										function(e) {
											var link = $("input[name='link']")
													.val();
											var str = "";
											if (link.search("www.youtube.com") > 0) {
												link = link
														.replace(
																"www.youtube.com/",
																"www.youtube.com/embed/");
											} else if (link.search("youtu.be") > 0) {
												link = link
														.replace("youtu.be/",
																"www.youtube.com/embed/");
											}
											str += "<div class='mediaDiv embed-responsive embed-responsive-16by9'>"
													+ "<iframe class='embed-responsive-item' src='"
													+ link +"' allowfullscreen></iframe></div>";
											preview.html(str);
											$("input[name='link']").val(link);
											console.log($("input[name='link']")
													.val());
										});
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

						function showUploadResult(uploadResultArr) {
							if (!uploadResultArr || uploadResultArr.length == 0) {
								return;
							}
							var attachUL = $(".uploadResult .imageUL");

							var str = "";
							$(uploadResultArr)
									.each(
											function(i, obj) {
												if (obj.fileType) {
													var fileCallPath = encodeURIComponent(obj.uploadPath
															+ "/s_"
															+ obj.uuid
															+ "_"
															+ obj.fileName);
													str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.fileType + "'><div>";
													str += "<span>"
															+ obj.fileName
															+ "</span>";
													str += "<button type='button' data-file=\'" 
															+ fileCallPath + "\' data-type='image' class='btn btn-warning btn-circle'>";
													str += "<i class='fas fa-times'></i></button><br>";
													str += "<img src='/display?fileName="
															+ fileCallPath
															+ "'>";
													str += "</div></li>";

													//uploadImageUL.append(str);

												} else {
													var fileCallPath = encodeURIComponent(obj.uploadPath
															+ "/"
															+ obj.uuid
															+ "_"
															+ obj.fileName);
													var fileLink = fileCallPath
															.replace(
																	new RegExp(
																			/\\/g),
																	"/");
													str += "<li data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "' data-type='" + obj.fileType + "'><div>";
													str += "<a><img src='/resources/img/attach.png'></a>";
													str += "<span>"
															+ obj.fileName
															+ "</span>";
													str += "<button type='button' data-file=\'" + fileCallPath + "\' data-type='file' class='btn btn-warning btn-circle'><i class='fas fa-times'></i></button><br>";
													str += "</div></li>";

													//uploadFileUL.append(str);
												}

											});
							attachUL.append(str);
						}
						$(".uploadResult").on("click", "button", function(e) {
							console.log("Delete File");

							var targetFile = $(this).data("file");
							var type = $(this).data("type");
							var targetLi = $(this).closest("li");
							var targetInput = $(".show input");

							$.ajax({
								url : '/deleteFile',
								data : {
									fileName : targetFile,
									type : type
								},
								dataType : 'text',
								type : 'POST',
								success : function(result) {
									alert(result);
									targetInput.val(null);
									targetLi.remove();
								}
							});

						});

						function checkExtension(fileName, fileSize, type) {
							var imgExt = new RegExp("(.*?)\.(jpg|png|gif)");
							var fileExt = new RegExp("(.*?)\.(exe|sh|zip|alz)");
							var maxSize = 5242880;

							if (fileSize >= maxSize) {
								alert("파일 사이즈 초과");
								$(".show input").val(null);
								return false;
							}

							if (type === 'image' && imgExt.test(fileName)) {
								console.log("pass");
								return true;
							}

							if (type === 'file') {
								if (fileExt.test(fileName)) {
									alert("해당 종류의 파일은 업로드할 수 없습니다.");
									$(".show input").val(null);
									return false;
								}
								return true;
							} else {
								alert("해당 종류의 파일은 업로드할 수 없습니다.");
								$(".show input").val(null);
								return false;
							}
						}

						$("input[type='file']")
								.change(
										function(e) {

											var formData = new FormData();
											var inputFile = $("input[name='uploadFile']");
											var files = inputFile[0].files;
											console.log(files);
											var inputType = $(this).attr("id");

											for (var i = 0; i < files.length; i++) {
												if (inputType === 'image') {
													console.log(inputType);
													if (!checkExtension(
															files[i].name,
															files[i].size,
															inputType)) {
														return false;
													}
												}
												if (inputType === 'file') {
													if (!checkExtension(
															files[i].name,
															files[i].size,
															inputType)) {
														return false;
													}
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
					});
</script>

<%@ include file="../includes/footer.jsp"%>