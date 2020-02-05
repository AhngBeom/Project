<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp"%>

<div class="card">
	<div class="card-header">
		<div class="d-flex justify-content-between mb-3">
			<h1>Inquire</h1>
			<button type="button" id="create" class="btn btn-info">Create</button>
		</div>
		<form id="searchForm" action="/inquire/list" method="get">
			<div class="input-group search-bar">
				<select class="form-control" name="type">
					<option value="T"
						<c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : ''}"/>>제목</option>
					<option value="C"
						<c:out value="${pageMaker.cri.type eq 'C' ? 'selected' : ''}"/>>내용</option>
					<option value="W"
						<c:out value="${pageMaker.cri.type eq 'W' ? 'selected' : ''}"/>>작성자</option>
					<option value="TC"
						<c:out value="${pageMaker.cri.type eq 'TC' ? 'selected' : ''}"/>>제목
						or 내용</option>
					<option value="TW"
						<c:out value="${pageMaker.cri.type eq 'TW' ? 'selected' : ''}"/>>제목
						or 작성자</option>
					<option value="TCW"
						<c:out value="${pageMaker.cri.type eq 'TCW' ? 'selected' : ''}"/>>제목
						or 내용 or 작성자</option>
				</select> <input type="text" name="keyword" class="form-control"
					placeholder="" value="<c:out value='${pageMaker.cri.keyword }'/>">
				<input type="hidden" name="pageNum"
					value="<c:out value='${pageMaker.cri.pageNum }'/>"> <input
					type="hidden" name="amount"
					value="<c:out value='${pageMaker.cri.amount }'/>">
				<div class="input-group-append">
					<button class="btn btn-secondary" type="submit">Search</button>
				</div>
			</div>
		</form>
	</div>
	<div class="card-body inquire-table">
		<table class="table">
			<thead class="thead-light">
				<tr>
					<th>#</th>
					<th>Title</th>
					<th>Writer</th>
					<th>Date</th>
					<th>Hits</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="inquire">
					<tr>
						<td><c:out value="${inquire.ino }" /></td>
						<td><a class="move" href="<c:out value="${inquire.ino }" />"><c:out
									value="${inquire.title }" /></a></td>
						<td><c:out value="${inquire.writer }" /></td>
						<td><fmt:formatDate value="${inquire.updateDate }"
								pattern="yyyy-MM-dd hh:mm:ss" /></td>
						<td>0</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot></tfoot>
		</table>
	</div>
	<div class="card-footer d-flex justify-content-center">
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
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<form id="actionForm" action="/inquire/list" method="get">
	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
	<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
	<input type="hidden" name="type" value="${pageMaker.cri.type }">
	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
</form>

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#create").on("click", function(e) {
							self.location = "/inquire/register";
						});

						var result = '<c:out value="${result}"/>';

						checkModal(result);

						history.replaceState({}, null, null);

						function checkModal(result) {
							if (result === '' || history.state) {
								return;
							}
							if (result === 'success_modify') {
								$(".modal-body").html("문의가 정상적으로 수정되었습니다.");
							}
							if (result === 'success_remove') {
								$(".modal-body").html("문의가 정상적으로 삭제되었습니다.");
							}
							if (parseInt(result) > 0) {
								$(".modal-body").html("문의가 정상적으로 등록되었습니다.");
							}

							$("#alarmModal").modal("show");
						}

						var searchForm = $("#searchForm");
						$("#searchForm button").on(
								"click",
								function(e) {
									if (!searchForm.find(
											"input[name='keyword']").val()) {
										alert("키워드를 입력하세요");
										return false;
									}
									searchForm.find("input[name='pageNum']")
											.val("1");
									e.preventDefault();
									searchForm.submit();
								});

						var actionForm = $("#actionForm");

						$(".move")
								.on(
										"click",
										function(e) {
											e.preventDefault();
											actionForm
													.append("<input type='hidden' name='ino' value='"
															+ $(this).attr(
																	"href")
															+ "'>");
											actionForm.attr("action",
													"/inquire/get").submit();
										});

						$(".page-item a").on(
								"click",
								function(e) {
									e.preventDefault();
									actionForm.find("input[name='pageNum']")
											.val($(this).attr("href"));
									actionForm.submit();
								});

					});
</script>

<%@ include file="../includes/footer.jsp"%>