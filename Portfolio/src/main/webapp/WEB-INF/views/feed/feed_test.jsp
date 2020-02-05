<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">

		<form role="form" id="operForm" action="/feed/main" method="get"></form>

		<div class="d-flex justify-content-end mb-3">
			<button type="button" id="create" class="btn btn-primary"
				data-toggle="collapse" data-target="#register" aria-expanded="false"
				aria-controls="register">Create</button>
			<a class="btn btn-primary" href="/feed/register">Register</a>
		</div>

		<div class="collapse mb-5" id="register">
			<div class="card card-body">

				<form role="form" id="regForm" action="/feed/register" method="post">
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
							href="#youtube"><i class="fab fa-youtube fa-3x"></i></a> <a
							data-toggle="collapse" href="#image"><i
							class="far fa-image fa-3x"></i></a> <a data-toggle="collapse"
							href="#file"> <i class="fas fa-paperclip fa-3x"></i>
						</a>

						<div class="collapse input-group mt-1" id="youtube">
							<input type="text" class="form-control" placeholder="Link"
								name="link">
							<div class="input-group-append">
								<button class="btn btn-success" type="button" id="linkBtn">Preview</button>
							</div>
						</div>

						<div class="collapse" id="image">
							<input type="file" multiple="multiple">
						</div>

						<div class="collapse" id="file">
							<input type="file" multiple="multiple">
						</div>

						<div class="preview mb-3"></div>
						<div class="uploadResult" style="background-color: gray;">
							<ul class="imageUL">
							</ul>
						</div>
						<!-- 
						<div class="mb-3">
							<i class="fab fa-youtube fa-3x" style="width: 7%;"></i>
							<div class="input-group mt-1 float-right" style="width: 93%;">
								<input type="text" class="form-control" placeholder="Link"
									name="link">
								<div class="input-group-append">
									<button class="btn btn-success" type="button" id="linkBtn">Preview</button>
								</div>
							</div>
						</div>

						<div class="preview mb-3"></div>
						-->

						<!--
						<div class="uploadDiv">
							<input type="file" class="" name="uploadFile" multiple>
						</div>
						<div class="uploadResult" style="background-color: gray;">
							<ul class="imageUL">
							</ul>
						</div>
						-->
					</div>

					<div class="card-footer d-flex justify-content-end">
						<button type="reset" class="btn btn-warning ml-1">Reset</button>
						<button type="submit" class="btn btn-success ml-1">Submit</button>
					</div>
				</form>

			</div>
		</div>

		<c:forEach items="${feed }" var="feed">
			<div class="card mb-5 feed" data-fno="${feed.fno }">
				<div class="card-header d-flex justify-content-between">
					<div class="font-weight-bold">
						<img src="https://www.w3schools.com/bootstrap4/newyork.jpg"
							class="rounded-circle" alt="Cinque Terre" width="30">
						<c:out value="${feed.userID }" />
					</div>
					<div class="dropdown dropleft">
						<button type="button" class="btn btn-secondary dropdown-toggle"
							data-toggle="dropdown"></button>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#" data-oper="modify"
								data-fno="${feed.fno }">Modify</a> <a class="dropdown-item"
								href="#" data-oper="remove" data-fno="${feed.fno }">Remove</a> <a
								class="dropdown-item" href="#" data-oper="get"
								data-fno="${feed.fno }">In detail</a>
						</div>
					</div>
				</div>
				<div class="card-body">
					<div class="d-flex justify-content-between mb-3">
						<div class="text-dark">
							<c:out value="${feed.message }" />
						</div>
						<div class="text-muted">
							<fmt:formatDate value="${feed.updateDate }"
								pattern="yyyy-MM-dd HH:mm:ss" />
						</div>
					</div>
					<c:if test="${feed.link ne null }">
						<div class='mediaDiv embed-responsive embed-responsive-16by9'>
							<iframe class='embed-responsive-item' src='${feed.link }'
								allowfullscreen></iframe>
						</div>
					</c:if>
					<div class="imageDiv bg-dark"></div>
				</div>
				<div class="card-footer">
					<div>
						댓글 수 :
						<c:out value="${feed.replyCnt }" />
					</div>
					<ul class="chat">

					</ul>
				</div>
			</div>
		</c:forEach>

		<div class="d-flex justify-content-center">
			<nav>
				<ul class="pagination">
					<c:if test="${pageMaker.prev }">
						<li class="page-item disabled"><a class="page-link"
							href="${pageMaker.startPage -1}" tabindex="-1">Previous</a></li>
					</c:if>

					<c:forEach var="num" begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }">
						<li
							class="page-item ${pageMaker.cri.pageNum == num ? 'active' : '' }"><a
							class="page-link" href="${num}">${num }</a></li>
					</c:forEach>

					<c:if test="${pageMaker.next }">
						<li class="page-item"><a class="page-link"
							href="${pageMaker.endPage +1}">Next</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="alarmModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalCenterTitle">Alarm</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">처리가 완료되었습니다.</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" id="allow">Allow</button>
				<button type="button" class="btn btn-secondary" id="deny"
					data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<form id="actionForm" action="/feed/main" method="get">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	<input type="hidden" name="type" value="${pageMaker.cri.type }">
	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
</form>

<script type="text/javascript" src="/resources/myJS/reply.js"></script>
<script type="text/javascript" src="/resources/myJS/attach.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var form = $("#operForm");

						$("#create").on("click", function(e) {
							//self.location = "/feed/register";
						});
						$("a[data-oper='get']")
								.on(
										"click",
										function(e) {
											var fno = $(this).data("fno");
											form
													.append("<input type='hidden' name='fno' value='" + fno + "'>");
											form.attr("action", "/feed/get")
													.submit();
										});
						$("a[data-oper='modify']")
								.on(
										"click",
										function(e) {
											var fno = $(this).data("fno");
											form
													.append("<input type='hidden' name='fno' value='" + fno + "'>");
											form.attr("action", "/feed/modify")
													.submit();
										});
						$("a[data-oper='remove']")
								.on(
										"click",
										function(e) {
											var fno = $(this).data("fno");
											$(".modal-title").html("확인");
											$(".modal-body").html(
													"피드를 삭제하시겠습니까?");
											$("#allow").show();
											$("#alarmModal").modal("show");

											$("#allow")
													.on(
															"click",
															function(e) {
																form
																		.append("<input type='hidden' name='fno' value='" + fno + "'>");
																form
																		.attr(
																				"action",
																				"/feed/remove");
																form
																		.attr(
																				"method",
																				"post")
																		.submit();
															});
										});
						var imgOffset = 0;
						$(".imageDiv").on(
								"click",
								"img",
								function(e) {
									console.log($(this).offset().top);
									var imgObj = $(this);
									var path = encodeURIComponent(imgObj
											.data("path")
											+ "/"
											+ imgObj.data("uuid")
											+ "_"
											+ imgObj.data("filename"));
									showImage(path.replace(new RegExp(/\\/g),
											"/"), $(this).offset().top);
								});
						function showImage(fileCallPath, imgOffset) {
							$(".bigPictureWrapper").css("display", "flex")
									.show();
							$(".bigPictureWrapper").css("top", imgOffset);
							$(".bigPicture").html(
									"<img src='/display?fileName="
											+ fileCallPath + "'>").animate({
								width : '100%',
								height : '100%'
							}, 1000);
							$(".bigPictureWrapper").on("click", function(e) {
								$(".bigPicture").animate({
									width : '0%',
									height : '0%'
								}, 1000);
								setTimeout(function() {
									$(".bigPictureWrapper").hide();
								}, 1000);
							});

						}

					});
</script>
<script type="text/javascript">
	var result = '<c:out value="${result}"/>';

	checkModal(result);

	history.replaceState({}, null, null);

	function checkModal(result) {
		if (result === '' || history.state) {
			return;
		}
		if (result === 'success_modify') {
			$(".modal-body").html("피드가 정상적으로 수정되었습니다.");
			$("#allow").hide();
		}
		if (result === 'success_remove') {
			$(".modal-body").html("피드가 정상적으로 삭제되었습니다.");
			$("#allow").hide();
		}
		if (parseInt(result) > 0) {
			$(".modal-body").html("피드가 정상적으로 등록되었습니다.");
			$("#allow").hide();
		}

		$("#alarmModal").modal("show");
	}
</script>
<script type="text/javascript">
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
	var yBtn = $("a[href='#youtube']");
	var iBtn = $("a[href='#image']");
	var fBtn = $("a[href='#file']");

	var yDiv = $("#youtube");
	var yInput = $("#youtube input");
	var iDiv = $("#image");
	var iInput = $("#image input");
	var fDiv = $("#file");
	var fInput = $("#file input");

	yBtn.on("click", function(e) {
		iDiv.removeClass("show");
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

	var actionForm = $("#actionForm");

	$(".page-item a").on("click", function(e) {
		e.preventDefault();
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	});
</script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var formObj = $("form[role='form']");
						var div = $(".preview");

						$("button[id='linkBtn']")
								.on(
										"click",
										function(e) {
											var link = regService
													.linkConvert($(
															"input[name='link']")
															.val());
											var str = "";

											str += "<div class='mediaDiv embed-responsive embed-responsive-16by9'>"
													+ "<iframe class='embed-responsive-item' src='"
													+ link +"' allowfullscreen></iframe></div>";
											div.html(str);
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
													str += "<a></a>";
													str += "<span>"
															+ obj.fileName
															+ "</span>";
													str += "<button type='button' class='close' aria-label='Close' data-file=\'" + fileCallPath + "\' data-type='file'><span aria-hidden='true'>&times;</span></button><br>";
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
											/*
											var fileName = $(this).val().split("\\").pop();
											$(this).siblings(".custom-file-label").addClass(
													"selected").html(fileName);
											 */
											var formData = new FormData();
											var inputFile = $("input[id='customFile']");
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
<script type="text/javascript">
$(document).ready(function() {
	$('.feed').each(function(index, item) {
			$(this).addClass('feed_' + index);
			var fno = $(this).data("fno");
			var replyUL = $(".chat");
			showReply(1);

			$.getJSON("/feed/getAttachList", {fno : fno}, function(arr) {
				var str = "<div id='carouselFadeImage_" 
						+ index 
						+ "' class='carousel slide carousel-fade' data-ride='carousel'><div class='carousel-inner'>";

				$(arr).each(function(i, attach) {
					var fileCallPath = encodeURIComponent(attach.uploadPath
							+ "/"
							+ attach.uuid
							+ "_"
							+ attach.fileName);

					if (i == 0) {
						str += "<div class='carousel-item active'>"
								+ "<img class='rounded mx-auto d-block' alt='...'"
								+ " src='/display?fileName="
								+ fileCallPath
								+ "' data-path='"
								+ attach.uploadPath
								+ "' data-uuid='"
								+ attach.uuid
								+ "' data-filename='"
								+ attach.fileName
								+ "' data-type='"
								+ attach.fileType
								+ "'></div>";
					} else {
						str += "<div class='carousel-item'>"
								+ "<img class='rounded mx-auto d-block' alt='...'"
								+ " src='/display?fileName="
								+ fileCallPath
								+ "' data-path='"
								+ attach.uploadPath
								+ "' data-uuid='"
								+ attach.uuid
								+ "' data-filename='"
								+ attach.fileName
								+ "' data-type='"
								+ attach.fileType
								+ "'></div>";
					}
				});
				str += "</div> <a class='carousel-control-prev' href='#carouselFadeImage_" + index
				+ "' role='button' data-slide='prev'>"
						+ " <span class='carousel-control-prev-icon' aria-hidden='true'></span>"
						+ "<span class='sr-only'>Previous</span></a>"
						+ "<a class='carousel-control-next' href='#carouselFadeImage_" + index  
				+ "' role='button' data-slide='next'>"
						+ "<span class='carousel-control-next-icon' aria-hidden='true'></span>"
						+ "<span class='sr-only'>Next</span></a>"
						+ "</div>";

				$(".feed_" + index + " .card-body .imageDiv").html(str);

			});

			function showReply(page) {
				replyService.getList(
								{
									fno : fno,
									page : page || 1
								},
								function(replyCnt, list) {

									var str = "";

									if (page == -1) {
										pageNum = Math.ceil(replyCnt / 10.0);
										showList(pageNum);
										return;
									}

									if (list == null || list.length == 0) {
										return;
									}

									str += "<li class='left clearfix' data-rno='" + list[0].rno + "'>";
									str += "<div><div class='header'><strong class='primary-font'>"
											+ list[0].replyer
											+ "</strong>";
									str += "<small class='float-right text-muted'>"
											+ replyService
													.displayTime(list[0].replyDate)
											+ "</small></div>";
									str += "<p class='ml-3'>"
											+ list[0].reply
											+ "</p></div></li>";

									$(".feed_" + index + " .card-footer .chat").html(str);
									//replyUL.html(str);
								});
			}
		});

});
</script>

<%@ include file="../includes/footer.jsp"%>