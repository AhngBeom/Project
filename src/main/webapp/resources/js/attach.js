$(document)
		.ready(
				function() {
					var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
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

					$(document).on("click", ".img-expand-btn", function(e) {
						e.preventDefault();
						var imgItemDiv = $(this).parents(".card-image");
						console.log("Expand : " + imgItemDiv.data('filename'));
						$("#attach-expand")
					});
					$(document).on("click", ".img-remove-btn", function(e) {
						e.preventDefault();
						var imgItemDiv = $(this).parents(".card-image");
						console.log("Remove : " + imgItemDiv.data('filename'));
						if(confirm("해당 첨부파일을 삭제하시겠습니까?")){
							$(this).parents(".card-image").remove();
						}
					});
					
					function showUploadedFile(uploadResultArr) {
						if (!uploadResultArr || uploadResultArr.length == 0) {
							return;
						}
						var attachDiv = $(".attach-list");
						var overlay = "<div class='opacity-div d-flex flex-column justify-content-center w-100'>"
								+ "<button class='btn btn-warning m-auto img-expand-btn'><i class=''></i>크게 보기</button>"
								+ "<button class='btn btn-danger m-auto img-remove-btn'><i class=''></i>삭제</button>"
								+ "</div>";
						var str = "";
						$(uploadResultArr)
								.each(
										function(i, attach) {
											if (attach.fileType) {
												var imageThumbPath = encodeURIComponent(attach.uploadPath
														+ "/s_"
														+ attach.uuid
														+ "_" + attach.fileName);
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
														+ overlay + "</div>";
											} else {

											}
										});
						attachDiv.append(str);
					}
					$("input[type='file']").change(function(e) {
						var formData = new FormData();
						var inputFile = $("input[name='uploadFile']");
						var files = inputFile[0].files;

						for (var i = 0; i < files.length; i++) {
							if (!checkExtension(files[i].name, files[i].size)) {
								return false;
							}
							formData.append("uploadFile", files[i]);
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
								showUploadedFile(result);
							}
						});
					});

					var formObj = $("form[role='form']");
					$("#pdtSubmit")
							.on(
									"click",
									function(e) {
										e.preventDefault();
										var str = "";
										$(".attach-image")
												.each(
														function(i, obj) {
															var jobj = $(obj);
															console.dir(jobj);
															str += "<input type 'hidden' name='attachList["
																	+ i
																	+ "].fileName' value='"
																	+ jobj
																			.data('filename')
																	+ "'>";
															str += "<input type 'hidden' name='attachList["
																	+ i
																	+ "].uuid' value='"
																	+ jobj
																			.data('uuid')
																	+ "'>";
															str += "<input type 'hidden' name='attachList["
																	+ i
																	+ "].uploadPath' value='"
																	+ jobj
																			.data('path')
																	+ "'>";
															str += "<input type 'hidden' name='attachList["
																	+ i
																	+ "].fileType' value='"
																	+ jobj
																			.data('type')
																	+ "'>";
															str += "<input type 'hidden' name='attachList["
																+ i
																+ "].sequence' value='"
																+ i
																+ "'>";
															console.log(str);
														});
										formObj.append(str).submit();
									});

				});
