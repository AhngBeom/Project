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

					function showUploadedFile(uploadResultArr) {
						if (!uploadResultArr || uploadResultArr.length == 0) {
							return;
						}
						var attachDiv = $(".attach-list");
						var str = "";
						$(uploadResultArr)
								.each(
										function(i, obj) {
											// str += "<li>" + obj.fileName +
											// "</li>";
											if (obj.fileType) {
												var imageThumbPath = encodeURIComponent(obj.uploadPath
														+ "/s_"
														+ obj.uuid
														+ "_" + obj.fileName);
												var imageOriginPath = encodeURIComponent(obj.uploadPath
														+ "/"
														+ obj.uuid
														+ "_"
														+ obj.fileName);
												str += "<div class='column'> <img class='img-item' src='/display?fileName="
														+ imageThumbPath
														+ "' data-path='"
														+ obj.uploadPath
														+ "' data-uuid='"
														+ obj.uuid
														+ "' data-filename='"
														+ obj.fileName
														+ "' data-type='"
														+ obj.fileType
														+ "'></div>";
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
										$(".attach-list .column .img-item")
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
														});
										formObj.append(str).submit();
									});

				});
