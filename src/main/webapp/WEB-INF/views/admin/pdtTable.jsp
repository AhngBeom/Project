<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid">
			<h1 class="mt-4">Products Tables</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="/product/all">Dashboard</a></li>
				<li class="breadcrumb-item active">Tables</li>
			</ol>
			<div class="card mb-4">
				<div class="card-body">
					DataTables is a third party plugin that is used to generate the
					demo table below. For more information about DataTables, please
					visit the <a target="_blank" href="https://datatables.net/">official
						DataTables documentation</a>.
				</div>
			</div>
			<div class="card mb-4">
				<div class="card-header d-flex justify-content-between">
					<div class="h5">
						<i class="fas fa-table mr-1"></i>Products
					</div>
					<div>
						<a href="/admin/pdtAdd" class="btn btn-primary"> <i
							class="fas fa-plus-circle"></i>Addition
						</a>
					</div>
				</div>
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col" class="" style="width: 33.33%">Category</th>
							<th scope="col" class="" style="width: 33.33%">Name</th>
							<th scope="col" class="" style="width: 33.33%">Price</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pdt }" var="pdt" varStatus="status">
							<tr>
								<td>${pdt.category }</td>
								<td><a class="btn btn-primary get-btn text-white"
									data-oper="get" data-pno="${pdt.pno }">${pdt.name }</a></td>
								<td>${pdt.price }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
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
				<div class="card-body">
					<div class="table-responsive">
<!-- 						<table class="table table-bordered" id="dataTable" width="100%" -->
<!-- 							cellspacing="0"> -->
<!-- 							<thead> -->
<!-- 								<tr> -->
<!-- 									<th>Num</th> -->
<!-- 									<th>Name</th> -->
<!-- 									<th>Price</th> -->
<!-- 									<th>Category</th> -->
<!-- 									<th>Regit Date</th> -->
<!-- 									<th>Up to Date</th> -->
<!-- 									<th>Vol</th> -->
<!-- 									<th>Select</th> -->
<!-- 									<th>Delete</th> -->
<!-- 								</tr> -->
<!-- 							</thead> -->
<!-- 							<tfoot> -->
<!-- 								<tr> -->
<!-- 									<th>Num</th> -->
<!-- 									<th>Name</th> -->
<!-- 									<th>Price</th> -->
<!-- 									<th>Category</th> -->
<!-- 									<th>Regit Date</th> -->
<!-- 									<th>Up to Date</th> -->
<!-- 									<th>Vol</th> -->
<!-- 									<th>Select</th> -->
<!-- 									<th>Delete</th> -->
<!-- 								</tr> -->
<!-- 							</tfoot> -->
<!-- 							<tbody> -->
<%-- 								<c:forEach items="${pdt }" var="pdt"> --%>
<!-- 									<tr> -->
<%-- 										<td><c:out value="${pdt.pno }" /></td> --%>
<%-- 										<td><a href="/admin/pdtInfo?pno=${pdt.pno }" --%>
<%-- 											data-pno="${pdt.pno }"><c:out value="${pdt.name }" /></a></td> --%>
<%-- 										<td>￦<c:out value="${pdt.price}" /></td> --%>
<%-- 										<td><c:out value="${pdt.category }" /></td> --%>
<%-- 										<td><fmt:formatDate value="${pdt.regDate }" --%>
<%-- 												pattern="yyyy-MM-dd hh:mm:ss" /></td> --%>
<%-- 										<td><fmt:formatDate value="${pdt.upToDate }" --%>
<%-- 												pattern="yyyy-MM-dd hh:mm:ss" /></td> --%>
<!-- 										<td>x</td> -->
<!-- 										<td>x</td> -->
<!-- 										<td> -->
<!-- 											<div class="d-flex"> -->
<%-- 																								<button class="btn btn-warning" data-pno="${pdt.pno }"> --%>
<!-- 																									<i class="fas fa-pencil-alt"></i> -->
<!-- 																								</button> -->
<!-- 												<button class="btn btn-danger pdt-del-btn" -->
<%-- 													data-pno="${pdt.pno }"> --%>
<!-- 													<i class="fas fa-trash-alt"></i> -->
<!-- 												</button> -->
<!-- 											</div> -->
<!-- 										</td> -->
<!-- 									</tr> -->
<%-- 								</c:forEach> --%>
<!-- 							</tbody> -->
<!-- 						</table> -->
						<form action="/admin/pdtTable" method="get" id="operForm"></form>
						<div class="modal fade" id="alertModal" tabindex="-1"
							role="dialog" aria-labelledby="alertModalLabel"
							aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="alertModalLabel">Alert</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
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
			</div>
		</div>
	</main>
	<%@ include file="../includes/footer.jsp"%>