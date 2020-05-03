<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>

<form action="" method="get" id="operForm"></form>
<style>
body {
	font-family: Arial;
	font-size: 17px;
	padding: 8px;
}

* {
	box-sizing: border-box;
}

.row {
	display: -ms-flexbox; /* IE10 */
	display: flex;
	-ms-flex-wrap: wrap; /* IE10 */
	flex-wrap: wrap;
}

.col-25 {
	-ms-flex: 25%; /* IE10 */
	flex: 25%;
}

.col-50 {
	-ms-flex: 50%; /* IE10 */
	flex: 50%;
}

.col-75 {
	-ms-flex: 75%; /* IE10 */
	flex: 75%;
}

.col-25, .col-50, .col-75 {
	padding: 0 16px;
}

.container-order {
	background-color: #f2f2f2;
	padding: 5px 20px 15px 20px;
	border: 1px solid lightgrey;
	border-radius: 3px;
	margin-bottom: 20px;
}

input[type=text] {
	width: 100%;
	margin-bottom: 20px;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

label {
	margin-bottom: 10px;
	display: block;
}

.icon-container-order {
	margin-bottom: 20px;
	padding: 7px 0;
	font-size: 24px;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
@media ( max-width : 800px) {
	.row {
		flex-direction: column-reverse;
	}
	.col-25 {
		margin-bottom: 20px;
	}
}
</style>
<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid">
			<h1 class="mt-4">Order Page</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active">Order Page</li>
			</ol>
			<!-- 			<div class="row mb-4"> -->
			<%-- 				<c:forEach items="${item }" var="item"> --%>
			<!-- 					<div class="col-xl-12"> -->
			<!-- 						<div class="card"> -->
			<!-- 							<div class="card-header d-flex"> -->
			<!-- 								<input type="checkbox"> -->
			<!-- 							</div> -->
			<!-- 							<div class="card-body d-flex"> -->
			<!-- 								<div class="h4 col-xl-8"> -->
			<!-- 																		<img class="w-25 m-3" src="/resources/assets/img/readyToImg.jpg" alt="Card image"> -->
			<!-- 									<a href="#" class="mr-3" data-oper="get" -->
			<%-- 										data-pno="${item.pno }">${item.name }</a> --%>
			<!-- 								</div> -->
			<!-- 								<div class="h5 d-flex flex-column col-xl-4"> -->
			<!-- 									<div class="input-group mb-3 input-group-lg"> -->
			<!-- 										<div class="input-group-prepend"> -->
			<!-- 											<span class="input-group-text">가격</span> -->
			<!-- 										</div> -->
			<!-- 										<input type="text" class="form-control text-right" -->
			<%-- 											name="price" value="${item.price }" readonly="readonly"> --%>
			<!-- 										<div class="input-group-append"> -->
			<!-- 											<span class="input-group-text">￦</span> -->
			<!-- 										</div> -->
			<!-- 									</div> -->
			<!-- 								</div> -->
			<!-- 							</div> -->
			<!-- 							<div class="card-footer"> -->
			<!-- 								<a href="#" -->
			<!-- 									class="btn btn-danger float-right mr-3 cartItemDelBtn" -->
			<%-- 									data-pno="${item.pno }">상품 삭제</a> <a href="#" --%>
			<!-- 									class="btn btn-success get-btn float-right mr-3" -->
			<%-- 									data-oper="get" data-pno="${item.pno }">상품 화면</a> --%>
			<!-- 							</div> -->
			<!-- 						</div> -->
			<!-- 					</div> -->
			<%-- 				</c:forEach> --%>
			<!-- 			</div> -->

			<div class="row">
				<div class="col-xl-12">
					<div class="container-order">
						<div class="h4 d-flex justify-content-between mb-3">Cart</div>
						<hr>
						<c:forEach items="${item }" var="item" varStatus="status">
							<p class="d-flex justify-content-between mb-3">
								<a href="#">${item.name }</a> <span class="price">${item.price }</span>
							</p>
							<c:set var="total" value="${total + item.price }"></c:set>
							<c:set var="count" value="${status.count}"></c:set>
						</c:forEach>
						<hr>
						<div class="d-flex justify-content-between">
							<div>
								<i class="fa fa-shopping-cart"></i> <b><c:out
										value="${count }" /></b>
							</div>
							<div class="d-flex mb-3">
								<div class="input-group-prepend">
									<span class="input-group-text">Total</span>
								</div>
								<input type="text" class="form-control text-right" name="total"
									value="${total }" readonly="readonly">
								<div class="input-group-append">
									<span class="input-group-text">￦</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-75">
					<div class="container-order">
						<form action="/action_page.php">

							<div class="row">
								<div class="col-50">
									<h3>Billing Address</h3>
									<label for="fname"><i class="fa fa-user"></i> Full Name</label>
									<input type="text" id="fname" name="firstname"
										placeholder="John M. Doe"> <label for="email"><i
										class="fa fa-envelope"></i> Email</label> <input type="text"
										id="email" name="email" placeholder="john@example.com">
									<label for="adr"><i class="fas fa-address-card"></i>
										Address</label> <input type="text" id="adr" name="address"
										placeholder="542 W. 15th Street"> <label for="city"><i
										class="fas fa-university"></i> City</label> <input type="text"
										id="city" name="city" placeholder="New York">

									<div class="row">
										<div class="col-50">
											<label for="state">State</label> <input type="text"
												id="state" name="state" placeholder="NY">
										</div>
										<div class="col-50">
											<label for="zip">Zip</label> <input type="text" id="zip"
												name="zip" placeholder="10001">
										</div>
									</div>
								</div>

								<div class="col-50">
									<h3>Payment</h3>
									<label for="fname">Accepted Cards</label>
									<div class="icon-container-order">
										<i class="fab fa-cc-visa" style="color: navy;"></i> <i
											class="fab fa-cc-amex" style="color: blue;"></i> <i
											class="fab fa-cc-mastercard" style="color: red;"></i> <i
											class="fab fa-cc-discover" style="color: orange;"></i>
									</div>
									<label for="cname">Name on Card</label> <input type="text"
										id="cname" name="cardname" placeholder="John More Doe">
									<label for="ccnum">Credit card number</label> <input
										type="text" id="ccnum" name="cardnumber"
										placeholder="1111-2222-3333-4444"> <label
										for="expmonth">Exp Month</label> <input type="text"
										id="expmonth" name="expmonth" placeholder="September">
									<div class="row">
										<div class="col-50">
											<label for="expyear">Exp Year</label> <input type="text"
												id="expyear" name="expyear" placeholder="2018">
										</div>
										<div class="col-50">
											<label for="cvv">CVV</label> <input type="text" id="cvv"
												name="cvv" placeholder="352">
										</div>
									</div>
								</div>

							</div>
							<label> <input type="checkbox" checked="checked"
								name="sameadr"> Shipping address same as billing
							</label> <input type="submit" value="Continue to checkout" class="btn">
						</form>
					</div>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="../includes/footer.jsp"%>