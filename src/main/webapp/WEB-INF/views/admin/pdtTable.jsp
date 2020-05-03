<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>

<div id="layoutSidenav_content">
	<main class="sb-sidenav-dark">
		<div class="container-fluid">
			<h1 class="mt-4 text-white">
				<i class="fas fa-table mr-1"></i>Products Tables
			</h1>
			<ol class="breadcrumb mb-4 bg-dark">
				<li class="breadcrumb-item active">Admin</li>
				<li class="breadcrumb-item">Tables</li>
			</ol>
			<div class="mb-4">
				<div
					class="d-flex col-xl-12 justify-content-start bg-dark p-3 rounded">
					<a href="/admin/pdtAdd" class="btn btn-light ml-3"> <i
						class="fas fa-plus-circle"></i> Addition
					</a> <a href="#" class="btn btn-light ml-3"><i
						class="fas fa-hand-holding-usd"></i> Finance</a> <a href="#"
						class="btn btn-light ml-3"> <i class="fas fa-calculator"></i>
						Stats
					</a><a href="#" class="btn btn-light ml-3"><i
						class="fas fa-chart-line"></i> Charts</a>
				</div>
				<table class="table table-striped table-dark rounded-lg">
					<thead class="">
						<tr>
							<th scope="col" class="" style="width: 10%"><a
								class="btn asort" data-col="category" data-sort="DESC">카테고리</a></th>
							<th scope="col" class="" style="width: 35%"><a
								class="btn asort" data-col="name" data-sort="ASC">이름</a></th>
							<th scope="col" class="" style="width: 10%"><a
								class="btn asort" data-col="price" data-sort="ASC">가격</a></th>
							<th scope="col" class="" style="width: 15%"><a
								class="btn asort" data-col="regdate" data-sort="ASC">등록날짜</a></th>
							<th scope="col" class="" style="width: 15%"><a
								class="btn asort" data-col="uptodate" data-sort="ASC">수정날짜</a></th>
							<th scope="col" class="" style="width: 5%">제어</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pdt }" var="pdt" varStatus="status">
							<tr>
								<td><span class="badge badge-pill badge-warning">${pdt.category }</span></td>
								<td><a class="btn btn-light get-btn text-dark"
									data-oper="get" data-pno="${pdt.pno }">${pdt.name }</a></td>
								<td class="h5 text-success">${pdt.price }</td>
								<td><fmt:formatDate value="${pdt.regDate }"
										pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td><fmt:formatDate value="${pdt.upToDate }"
										pattern="yyyy-MM-dd HH:mm:ss" /></td>
								<td>
									<div class="d-flex">
										<button class="btn btn-warning pdt-mod-btn"
											data-pno="${pdt.pno }">
											<i class="fas fa-pencil-alt"></i>
										</button>
										<button class="btn btn-danger pdt-del-btn"
											data-pno="${pdt.pno }">
											<i class="fas fa-trash-alt"></i>
										</button>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<form action="/admin/pdtTable" id="pageForm" method="get">
					<input type='hidden' name="category" value="${page.cri.category }">
					<input type='hidden' name="pageNum" value="${page.cri.pageNum }">
					<input type='hidden' name="amount" value="${page.cri.amount }"><input
						type='hidden' name='column' value='${page.cri.column }'><input
						type='hidden' name='sort' value='${page.cri.sort }'>
				</form>
				<div class="d-flex justify-content-center col-xl-12">
					<!-- 			<a href="#"><i class="fas fa-angle-down fa-5x"></i></a> -->
					<ul class="pagination pagination-lg">
						<c:if test="${page.prev }">
							<li class="page-item previous"><a class="page-link"
								href="${page.startPage -1 }">Previous</a></li>
						</c:if>
						<c:forEach var="num" begin="${page.startPage }"
							end="${page.endPage }">
							<li
								class="page-item page-num ${page.cri.pageNum == (num -1) *10 ? 'active' : '' }"><a
								class="page-link" href="${(num -1) *10}">${num }</a></li>
						</c:forEach>
						<c:if test="${page.next }">
							<li class="page-item next"><a class="page-link"
								href="${page.endPage }">Next</a></li>
						</c:if>
					</ul>
				</div>
				<form action="/admin/pdtTable" method="get" id="operForm"></form>
				<div class="modal fade text-white" id="alertModal" tabindex="-1"
					role="dialog" aria-labelledby="alertModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content bg-dark">
							<div class="modal-header">
								<h5 class="modal-title" id="alertModalLabel">Alert</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<i class="fas fa-times" style="color: white"></i>
								</button>
							</div>
							<div class="modal-body">해당 상품을 삭제하시겠습니까?</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary" id="acceptBtn">Accept</button>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="../includes/footer_nonFooterTag.jsp"%>