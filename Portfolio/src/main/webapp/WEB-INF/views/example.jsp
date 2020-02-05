<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp"%>

<div class="d-flex justify-content-start bg-secondary mb-3">
	<div class="p-2 bg-info">Flex item 1</div>
	<div class="p-2 bg-warning">Flex item 2</div>
	<div class="p-2 bg-primary">Flex item 3</div>
</div>
<div class="d-flex justify-content-end bg-secondary mb-3">
	<div class="p-2 bg-info">Flex item 1</div>
	<div class="p-2 bg-warning">Flex item 2</div>
	<div class="p-2 bg-primary">Flex item 3</div>
</div>
<div class="d-flex justify-content-center bg-secondary mb-3">
	<div class="p-2 bg-info">Flex item 1</div>
	<div class="p-2 bg-warning">Flex item 2</div>
	<div class="p-2 bg-primary">Flex item 3</div>
</div>
<div class="d-flex justify-content-between bg-secondary mb-3">
	<div class="p-2 bg-info">Flex item 1</div>
	<div class="p-2 bg-primary">Flex item 3</div>
</div>
<div class="d-flex justify-content-around bg-secondary mb-3">
	<div class="p-2 bg-info">Flex item 1</div>
	<div class="p-2 bg-warning">Flex item 2</div>
	<div class="p-2 bg-primary">Flex item 3</div>
</div>

<form>
	<div class="custom-file">
		<input type="file" class="custom-file-input" id="customFile"
			multiple="multiple"> <label class="custom-file-label"
			for="customFile">Choose file</label>
	</div>
</form>

<div class="uploadResult" style="background-color: gray;">
	<ul class="imageUL">
	</ul>
</div>

<label>Attach</label>
<br>
<a data-toggle="collapse" href="#youtube"><i
	class="fab fa-youtube fa-3x"></i></a>
<a data-toggle="collapse" href="#image"><i class="far fa-image fa-3x"></i></a>
<a data-toggle="collapse" href="#file"> <i
	class="fas fa-paperclip fa-3x"></i>
</a>

<div class="collapse input-group mt-1" id="youtube">
	<input type="text" class="form-control" placeholder="Link" name="link" value="https://www.youtube.com/WGB0UpLNK8I">
	<div class="input-group-append">
		<button class="btn btn-success" type="button" id="linkBtn">Preview</button>
	</div>
</div>

<div class="collapse custom-file" id="image">
	<!-- 
	<input type="file" class="custom-file-input" id="customFile"
		multiple="multiple"> <label class="custom-file-label"
		for="customFile">Choose image</label>
		-->
		<input type="file" multiple="multiple">
</div>

<div class="collapse" id="file">
	<input type="file" multiple="multiple">
</div>

<div class="preview mb-3"></div>

<script type="text/javascript" src="/resources/myJS/attach.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var yBtn = $("a[href='#youtube']");
	var iBtn = $("a[href='#image']");
	var fBtn = $("a[href='#file']");
	
	var yDiv = $("#youtube");
	var yInput = $("#youtube input");
	var iDiv = $("#image");
	var iInput = $("#image input");
	var fDiv = $("#file");
	var fInput = $("#file input");
	
	yBtn.on("click", function(e){
		iDiv.removeClass("show");
		iInput.val(null);
		fDiv.removeClass("show");
		fInput.val(null);
	});
	iBtn.on("click", function(e){
		yDiv.removeClass("show");
		yInput.val(null);
		fDiv.removeClass("show");
		fInput.val(null);
	});
	fBtn.on("click", function(e){
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
						var fileExt = new RegExp("(.*?)\.(exe|sh|zip|alz)");
						var imageExt = new RegExp("(.*?)\.(jpg|png|gif)");
						var maxSize = 5242880;

						function checkExtension(fileName, fileSize) {
							if (fileSize >= maxSize) {
								alert("파일 사이즈 초과");
								$(".show input").val(null);
								return false;
							}
							if (!imageExt.test(fileName)) {
								alert("해당 종류의 파일은 업로드할 수 없습니다.");
								$(".show input").val(null);
								return false;
							}
							return true;
						}
						function showUploadResult(uploadResultArr) {
							if (!uploadResultArr || uploadResultArr.length == 0) {
								return;
							}
							var uploadImageUL = $(".uploadResult .imageUL");
							//var uploadFileUL = $(".uploadResult .fileUL");

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
							uploadImageUL.append(str);
						}
						$(".uploadResult").on("click", "button", function(e) {
							console.log("Delete File");

							var targetFile = $(this).data("file");
							var type = $(this).data("type");
							var targetLi = $(this).closest("li");

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
									targetLi.remove();
								}
							});

						});
						$("input[type='file']")
								.change(
										function(e) {
											console.log("Change");

											var formData = new FormData();
											var inputFile = $(this);
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
					});
</script>
<script type="text/javascript" src="/resources/myJS/attach.js"></script>
<script>
	$(".custom-file-input").on(
			"change",
			function() {
				var files = document.getElementById("customFile").files;
				var fileList = "";

				for (var i = 0; i < files.length; i++) {
					if (i == (files.length - 1)) {
						fileList += files[i].name;
					} else {
						fileList += files[i].name + " / ";
					}
				}

				$(this).siblings(".custom-file-label").addClass("selected")
						.html(fileList);
			});
	
	var div = $(".preview");

	$("button[id='linkBtn']")
			.on(
					"click",
					function(e) {
						var link = regService.linkConvert($("input[name='link']").val());
						
						var str = "<div class='mediaDiv embed-responsive embed-responsive-16by9'>"
								+ "<iframe class='embed-responsive-item' src='"
								+ link +"' allowfullscreen></iframe></div>";
						div.html(str);
						$("input[name='link']").val(link);
						console.log($("input[name='link']")
								.val());
					});
</script>

<%@ include file="includes/footer.jsp"%>