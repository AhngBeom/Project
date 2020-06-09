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
					<div class="card">
						<div class="card-header"></div>
						<div class="card-body text-center h5">상품 없음</div>
						<div class="card-footer"></div>
					</div>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<div class="col-xl-12 mb-3">
						<c:if test="${empty item }">
							<div class="card">
								<div class="card-header"></div>
								<div class="card-body text-center h5">장바구니에 담긴 상품이 존재하지 않습니다.</div>
								<div class="card-footer"></div>
							</div>
						</c:if>
					</div>
					<c:forEach items="${item }" var="item" varStatus="status">
					
						<div class="col-xl-12 mb-3">
							<div class="card" data-pno="${item.pno }"
								data-index="${status.index }">
								<div class="card-header">
									<div class="form-check form-check-inline">
										<input class="form-check-input pdtCheckbox" type="checkbox"
											value="">
									</div>
								</div>
								<div class="card-body d-flex">
									<div class="col-xl-8 d-flex justice-content-start">
										<div class="col-xl-3">
											<img class="img-thumbnail"
												src="/resources/assets/img/readyToImg.jpg" alt="Card image">
										</div>
										<div class="row align-items-center p-3 m-3">
											<div>
												<small class="text-muted">${item.title }</small> <a href="#"
													class="h5 " data-oper="get" data-pno="${item.pno }"> <br>
													${item.name}
												</a>
											</div>
										</div>
									</div>
									<div class="h5 d-flex flex-column col-xl-3 float-right">
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
			<c:if test="${!empty item}">
				<div class="d-flex justify-content-center mb-3">
					<button class="btn btn-warning float-right mr-3" data-pno=""
						id="selectOrder">선택 상품 주문</button>
					<button class="btn btn-success float-right mr-3" data-oper="get"
						data-pno="" id="allOrder">전체 상품 주문</button>
					<button class="btn btn-danger float-right mr-3" data-pno=""
						id="cartAllDelBtn">전체 상품 삭제</button>
				</div>

				<div class="collapse" id="orderCollapse">
					<div class="border p-3">
						<div class="d-flex justify-content-end">
							<div class="input-group mb-3 col-xl-6">
								<div class="input-group-prepend">
									<span class="input-group-text">결제 금액</span>
								</div>
								<input type="text" class="form-control text-right bg-white"
									 id="extPrice" value="" readonly="readonly">
								<div class="input-group-append">
									<span class="input-group-text">￦</span>
								</div>
							</div>
						</div>
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
								<input type="submit" class="btn btn-primary" id="orderRegBtn" value="주문하기">
							</div>

						</form>
					</div>
				</div>
			</c:if>
		</div>
	</main>

	<script type="text/javascript">
		$(document).ready(
				function() {
					function pdtCheck(){
						var form = $("#orderRegister");
						var extPrice = 0;
						$(".pdtCheckbox:checked").each(function(i, data) {
							console.log($(this).parents(".card").data("pno") + " Checked : " + $(this).is(":checked"));
							extPrice += Number($(this).parents(".card").find("input[name='price']").val() * $(this).parents(".card").find("select[name='amount']").val());
							$.getJSON("/product/get/" + $(this).parents(".card").data("pno") + ".json", function(obj){
								var jobj = $(obj); 
									var str = "";
									str += "<input type='hidden' name='pdtOnOrder[" + i + "].pno' value='"
										+ obj.pno + "'>";
									str += "<input type='hidden' name='pdtOnOrder[" + i + "].amount' value='"
										+ $(".card[data-pno='" + obj.pno + "']").find("select[name='amount']").val() + "'>";
									console.log(str);
									form.append(str);
							});
						});
						return extPrice;
					}
					var form = $("#operForm");
					$("#selectOrder").on("click", function(e) {
						var extPrice = pdtCheck();
						if(extPrice === 0){
							alert("선택된 상품이 없습니다.");
						}
						if(extPrice != 0){
							$("#orderCollapse").collapse();
						}
						$("#extPrice").val(extPrice);
					});
					$("#allOrder").on("click", function(e){
						$(".pdtCheckbox:checkbox").each(function(i, data){
								$(this).attr("checked", true);
						});
						var extPrice = pdtCheck();
						$("#extPrice").val(extPrice);
						$("#orderCollapse").collapse();
					});
					$(".custom-select").change(function(){
						console.log($(this).val());
					});
					$(".amountBtn").on(
							"click",
							function(e) {
								var selected = $(this).parents(".card").find(
										".custom-select option:selected");
								console.log($(this).parents(".card").data("pno"));
								console.log(selected.val());
								form.append("<input type='hidden' name='pno' value='" + $(this).parents(".card").data("pno") + "'>");
								form.append("<input type='hidden' name='amount' value='" + selected.val() + "'>");
								form.attr("action", "/cartModify");
								form.attr("method", "POST");
								form.submit();
							});
					$("#testBtn").on("click", function(e){
						var selectTag = $(this).parents(".input-group").find(".custom-select option:selected");
						console.log(selectTag.val());
					});
				});
	</script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							(function() {
								console.log($.trim($(".user-info").html()));
								var form = $("#orderRegister");
								$(".card").each(function(i, data) {
									var pno = $(this).data("pno");
									var userid = $.trim($(".user-info").html());
									var index = $(this).data("index");
									var selectTag = $("select[data-index='" + i + "']");
									var priceTag = ($(this).find("input[name='price']"));
									$.getJSON("/cartRead",{userID : userid},
										function(arr) {
											if (arr.length > 0) {
												console.log(arr[i]);
												var amount = arr[i].amount;
												$(selectTag.children("option")).each(function(i,e) {
													if (Number($(this).val()) === amount) {
														$(selectTag.children(
																"option[value='" + amount + "']"))
																.attr("selected", "selected");
													}
												});
// 												var str = "";
// 												str += "<input type='hidden' name='pdtOnOrder[" + i + "].pno' value='"
// 													+ arr[i].pno + "'>";
// 												str += "<input type='hidden' name='pdtOnOrder[" + i + "].amount' value='"
// 													+ arr[i].amount + "'>";
// 												form.append(str);
// 												var price = arr[i].amount * priceTag.val();
// 												priceTag.val(price);
											}
										});									
									$.getJSON("/product/getAttachList",{pno : pno},
										function(arr) {
											if (arr.length > 0) {
												var imageThumbPath = encodeURIComponent(arr[0].uploadPath
														+ "/s_"
														+ arr[0].uuid
														+ "_"
														+ arr[0].fileName);
												$(".card[data-index='" + i + "'] .card-body div img")
														.attr("src", "/display?fileName=" + imageThumbPath);
											}
										});
								});
							})();
						});
	</script>
	<%@ include file="../includes/footer.jsp"%>