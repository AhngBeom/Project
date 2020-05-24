<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ include file="../includes/header.jsp"%>


<form action="" method="get" id="operForm"></form>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid">
			<h1 class="mt-4">Cart List</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active">Cart List</li>
			</ol>
			<div class="row mb-4">
				<sec:authorize access="isAnonymous()">
						상품 없음
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<c:forEach items="${item }" var="item" varStatus="status">
						<div class="col-xl-12 mb-3">
							<div class="card" data-pno="${item.pno }"
								data-index="${status.index }">
								<div class="card-header">
									<input type="checkbox">
								</div>
								<div class="card-body d-flex">
									<div class="col-xl-8 d-flex justice-content-start">
										<div class="col-xl-3">
											<img class="img-thumbnail"
												src="/resources/assets/img/readyToImg.jpg" alt="Card image">
										</div>
										<div class="row align-items-center p-3 m-3">
											<a href="#" class="h5" data-oper="get"
												data-pno="${item.pno }"> <small class="text-muted">${item.title }</small><br>
												${item.name}
											</a>
										</div>
									</div>
									<div class="h5 d-flex flex-column col-xl-3 float-right">
										<!-- 									<div class="input-group mb-3 input-group-lg"> -->
										<!-- 										<select class="custom-select" id="inputGroupSelect"> -->
										<!-- 											<option selected>옵션 선택</option> -->
										<!-- 											<option value="opt01">옵션 01</option> -->
										<!-- 											<option value="opt02">옵션 02</option> -->
										<!-- 											<option value="opt03">옵션 03</option> -->
										<!-- 										</select> -->
										<!-- 									</div> -->
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text">수량</span>
											</div>
											<select class="custom-select" name="amount"
												data-index="${status.index }" data-amount="">
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
												<option value="6">6</option>
												<option value="7">7</option>
												<option value="8">8</option>
												<option value="9">9</option>
												<option value="10">10</option>
											</select>
											<div class="input-group-append">
												<button class="btn btn-outline-primary amountBtn"
													type="button">변경</button>
											</div>
										</div>
										<div class="input-group mb-3">
											<div class="input-group-prepend">
												<span class="input-group-text">가격</span>
											</div>
											<input type="text" class="form-control text-right bg-white"
												name="price" value="${item.price }" readonly="readonly">
											<div class="input-group-append">
												<span class="input-group-text">￦</span>
											</div>
										</div>
									</div>
								</div>
								<div class="card-footer">
									<form action="/cartItemDel" method="post">
										<input type="hidden" name="userID" value="null"> <input
											type="hidden" name="pno" value="${item.pno }">
										<button class="btn btn-danger float-right mr-3 cartItemDelBtn"
											data-pno="${item.pno }">상품 삭제</button>
										<a href="" class="btn btn-success get-btn float-right mr-3"
											data-oper="get" data-pno="${item.pno }">상품 화면</a>
									</form>
								</div>
							</div>
						</div>
					</c:forEach>
				</sec:authorize>
			</div>
			<c:if test="${item ne null}">
				<div class="d-flex justify-content-center mb-3">
					<a href="" class="btn btn-warning float-right mr-3" data-pno="">선택
						상품 주문</a>
					<button class="btn btn-success float-right mr-3" data-oper="get"
						data-pno="" id="allOrder">전체 상품 주문</button>
					<a href="" class="btn btn-danger float-right mr-3" data-pno=""
						id="cartAllDelBtn">전체 상품 삭제</a>
				</div>

				<div class="collapse" id="orderCollapse">
					<div class="border p-3">
						<form role="form" action="/orderRegister" method="post"
							id="orderRegister">
							<div class="form-group">
								<input type="hidden" name="userId"
									value='<sec:authentication property="principal.username"/>'>
								<label for="exampleFormControlInput1">주문자명</label> <input
									type="text" class="form-control" name="orderer"
									value='<sec:authentication property="principal.member.userName"/>'>
							</div>
							<div class="form-group">
								<label for="exampleFormControlInput1">주문자 연락처</label> <input
									type="text" class="form-control" name="ordererContact">
							</div>
							<div class="form-group">
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="gridCheck">
									<label class="form-check-label" for="gridCheck">주문자와 동일</label>
								</div>
								<label for="exampleFormControlInput1">수신자명</label> <input
									type="text" class="form-control" name="receiver">
							</div>
							<div class="form-group">
								<label for="exampleFormControlInput1">수신 주소</label> <input
									type="text" class="form-control" name="receiverAddress">
							</div>
							<div class="form-group d-flex justify-content-center">
								<input type="submit" class="btn btn-primary" value="주문하기">
							</div>

						</form>
					</div>
				</div>
			</c:if>
		</div>
	</main>

	<script type="text/javascript" src="/resources/js/cart.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#allOrder").on("click", function(e) {
				$(".collapse").collapse();
			});
		});
	</script>
	<%@ include file="../includes/footer.jsp"%>