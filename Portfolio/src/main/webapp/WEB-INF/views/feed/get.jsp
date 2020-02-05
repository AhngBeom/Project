<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp"%>

<style>
</style>

<div class="card mb-5">
	<div class="card-header d-flex justify-content-between">
		<div class="font-weight-bold">
			<c:out value="${feed.userID }" />
		</div>
		<div>
			<button type="button" data-oper="modify" class="btn btn-success ml-1"
				data-fno="${feed.fno }">Modify</button>
			<button type="button" data-oper="remove" class="btn btn-danger ml-1"
				data-fno="${feed.fno }">Remove</button>
		</div>
	</div>
	<div class="card-body">
		<div class="d-flex justify-content-between mb-3">
			<div>
				<c:out value="${feed.message }" />
			</div>
			<div>
				<small><fmt:formatDate value="${feed.updateDate }"
						pattern="yyyy-MM-dd HH:mm:ss" /> </small>
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
		<div class="regReply input-group mb-3">
			<i class="fas fa-comments fa-fw mt-2 mr-2"></i> <input type="text"
				class="form-control col-2" name="replyer" placeholder="Who">
			<input type="text" class="form-control col-10" name="reply"
				placeholder="Some text">
			<div class="input-group-suffix">
				<button class="btn btn-outline-primary" type="button"
					id="replyRegBtn">Register</button>
			</div>
		</div>
		<div>
			<ul class="chat">
			</ul>
			<c:if test="${feed.replyCnt eq 0}">
				<div class="d-flex justify-content-center">댓글 없음</div>
			</c:if>
		</div>
		<div class="panel-footer"></div>
	</div>
</div>

<div class="modal fade" id="replyModal" tabindex="-1" role="dialog"
	aria-labelledby="replyModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="replyModalLabel">Modal title</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label for="recipient-name" class="col-form-label">Replyer</label>
					<input type="text" class="form-control" id="recipient-name"
						name="replyer">
				</div>
				<div class="form-group">
					<label for="message-text" class="col-form-label">Reply</label>
					<textarea class="form-control" id="message-text" name="reply"></textarea>
				</div>
				<div class="form-group">
					<label for="message-text" class="col-form-label">Date</label> <input
						type="text" class="form-control" name="updateDate"
						readonly="readonly">
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success ml-1" id="modalMdfBtn">Modify</button>
				<button type="button" class="btn btn-danger ml-1" id="modalRmvBtn">Remove</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<form id="operForm" action="/feed/get" method="get">
	<input type="hidden" name="fno" value='<c:out value="${feed.fno}"/>'>
</form>

<script type="text/javascript" src="/resources/myJS/reply.js"></script>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var fnoValue = "<c:out value='${feed.fno}'/>";
						var replyUL = $(".chat");

						showList(1);

						function showList(page) {
							replyService
									.getList(
											{
												fno : fnoValue,
												page : page || 1
											},
											function(replyCnt, list) {
												console.log("Reply Count : "
														+ replyCnt);

												var str = "";

												if (page == -1) {
													pageNum = Math
															.ceil(replyCnt / 10.0);
													showList(pageNum);

													return;
												}

												if (list == null
														|| list.length == 0) {
													return;
												}

												for (var i = 0, len = list.length || 0; i < len; i++) {
													str += "<li class='left clearfix' data-rno='" + list[i].rno + "'>";
													str += "<div><div class='header'><strong class='primary-font'>"
															+ list[i].replyer
															+ "</strong>";
													str += "<small class='pull-right text-muted'>"
															+ replyService
																	.displayTime(list[i].replyDate)
															+ "</small></div>";
													str += "<p>"
															+ list[i].reply
															+ "</p></div></li>";
												}
												replyUL.html(str);
												showReplyPage(replyCnt);
											});
						}
						var pageNum = 1;
						var replyPageFooter = $(".panel-footer");

						function showReplyPage(replyCnt) {
							var endNum = Math.ceil(pageNum / 10.0) * 10;
							var startNum = endNum - 9;
							var prev = startNum != 1;
							var next = false;

							if (endNum * 10 >= replyCnt) {
								endNum = Math.ceil(replyCnt / 10.0);
							}
							if (endNum * 10 < replyCnt) {
								next = true;
							}

							var str = "<ul class='pagination pull-right'>";

							if (prev) {
								str += "<li class='page-item'><a class='page-link' href='"
										+ (startNum - 1)
										+ "'>Previous</a></li>";
							}

							for (var i = startNum; i <= endNum; i++) {
								var active = pageNum == i ? "active" : "";
								str += "<li class='page-item'><a class='page-link' href='" + i + "'>"
										+ i + "</a></li>";
							}

							if (next) {
								str += "<li class='page-item'><a class='page-link' href='"
										+ (endNum + 1) + "'>Next</a></li>";
							}

							str += "</ul></div>";
							replyPageFooter.html(str);
						}

						replyPageFooter.on("click", "li a", function(e) {
							e.preventDefault();

							var targetPageNum = $(this).attr("href");
							console.log("targetPageNum : " + targetPageNum);
							pageNum = targetPageNum;
							showList(pageNum);
						});

						var inputReply = $(".regReply").find(
								"input[name='reply']");
						var inputReplyer = $(".regReply").find(
								"input[name='replyer']");

						$("#replyRegBtn").on("click", function(e) {
							var reply = {
								reply : inputReply.val(),
								replyer : inputReplyer.val(),
								fno : fnoValue
							};
							replyService.add(reply, function(result) {
								alert(result);
								location.reload();
								showList(-1);
							});
						});
						var modal = $(".modal");
						var modalInputReply = $(".modal").find(
								"textarea[name='reply']");
						var modalInputReplyer = $(".modal").find(
								"input[name='replyer']");
						var modalInputReplDate = $(".modal").find(
								"input[name='updateDate']");
						$(".chat")
								.on(
										"click",
										"li",
										function(e) {
											var rno = $(this).data("rno");
											replyService
													.get(
															rno,
															function(reply) {
																modalInputReply
																		.val(reply.reply);
																modalInputReplyer
																		.val(reply.replyer).attr("readonly", "readonly");
																modalInputReplDate
																		.val(replyService
																				.displayTime(reply.updateDate));
																modal
																		.data(
																				"rno",
																				reply.rno);

																$(".modal")
																		.modal(
																				"show");
															});
										});

						$("#modalMdfBtn").on("click", function(e) {
							var reply = {
								rno : modal.data("rno"),
								reply : modalInputReply.val()
							};
							replyService.update(reply, function(result) {
								alert(result);
								modal.modal("hide");
								showList(pageNum);
							});
						});
						$("#modalRmvBtn").on("click", function(e) {
							var rno = modal.data("rno");
							replyService.remove(rno, function(result) {
								alert(result);
								modal.modal("hide");
								showList(pageNum);
							});
							location.reload();
						});
					});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		var operForm = $("#operForm");
		$("button[data-oper='modify']").on("click", function(e) {
			operForm.attr("action", "/feed/modify").submit();
		});
		$("button[data-oper='remove']").on("click", function(e) {
			operForm.attr("action", "/feed/remove");
			operForm.attr("method", "post").submit();
		});
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
												var str = "<div id='carouselFadeImage" 
												+ "' class='carousel slide carousel-fade' data-ride='carousel'><div class='carousel-inner'>";

												$(arr)
														.each(
																function(i,
																		attach) {
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
												str += "</div> <a class='carousel-control-prev' href='#carouselFadeImage"
											+ "' role='button' data-slide='prev'>"
														+ " <span class='carousel-control-prev-icon' aria-hidden='true'></span>"
														+ "<span class='sr-only'>Previous</span></a>"
														+ "<a class='carousel-control-next' href='#carouselFadeImage"
											+ "' role='button' data-slide='next'>"
														+ "<span class='carousel-control-next-icon' aria-hidden='true'></span>"
														+ "<span class='sr-only'>Next</span></a>"
														+ "</div>";

												if (arr.length === 0) {
													str = "";
												}

												$(".imageDiv").html(str);

											});

						})();
					});
</script>

<%@ include file="../includes/footer.jsp"%>