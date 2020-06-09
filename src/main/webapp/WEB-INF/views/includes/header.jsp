<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>On-Line Shopping Mall</title>

<link href="/resources/css/styles.css?ver=1" rel="stylesheet" />
<link href="/resources/css/myCss.css?ver=1" rel="stylesheet" />
<link href="/resources/css/adminPage.css?ver=1" rel="stylesheet" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" />

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

</head>

<form action="" method="get" id="headerForm"></form>

<body class="sb-nav-fixed">

	<div class="modal fade" id="headerModal" tabindex="-1" role="dialog"
		aria-labelledby="headerModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="card shadow-lg border-0 rounded-lg">
						<div class="card-header">
							<h3 class="text-center font-weight-light my-4">Login</h3>
							<h5>
								<c:out value="${error }" />
							</h5>
							<h5>
								<c:out value="${logout }" />
							</h5>
						</div>

						<div class="card-body">
							<form method="post" action="/login">
								<div class="form-group">
									<label class="small mb-1" for="inputId">ID</label><input
										class="form-control py-4" id="inputId" name="username"
										type="text" placeholder="Enter Identification" />
								</div>
								<div class="form-group">
									<label class="small mb-1" for="inputPw">Password</label><input
										class="form-control py-4" id="inputPw" type="password"
										name="password" placeholder="Enter password" />
								</div>
								<div class="form-group">
									<div class="custom-control custom-checkbox">
										<input class="custom-control-input" id="rememberPasswordCheck"
											type="checkbox" name="remember-me" /><label
											class="custom-control-label" for="rememberPasswordCheck">Remember
											password</label>
									</div>
								</div>
								<div
									class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
									<a class="small" href="/pages/password">Forgot Password?</a>
									<button type="submit" class="btn btn-primary">Login</button>
								</div>
								<input type="hidden" name="${_csrf.parameterName }"
									value="${_csrf.token }">
							</form>
						</div>
						<div class="card-footer text-center">
							<div class="small">
								<a href="/pages/register">Need an account? Sign up!</a>
							</div>
						</div>
					</div>
			</div>
		</div>
	</div>

	<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark ">
		<a class="navbar-brand" href="/product">Shop</a>
		<button class="btn btn-link btn-sm order-1 order-lg-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>
		<div class="progress ml-3 ml-auto mr-auto"
			style="height: 30px; width: 500px;" data-toggle="tooltip"
			data-placement="bottom" title="Development Progress">
			<div class="progress-bar" role="progressbar" style="width: 80%;"
				aria-valuenow="80" aria-valuemin="0" aria-valuemax="100">80%</div>
		</div>
		<!-- Navbar Search-->

		<!-- Navbar-->
		<ul class="navbar-nav ml-auto ml-md-0 pull-right">
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" id="userDropdown" href="#"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="userDropdown">
					<div class="user-info text-center" data-userid=''>
						<sec:authorize access="isAnonymous()">null</sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<sec:authentication property="principal.username" />
							<%-- 							<sec:authentication property="principal.member.userName" /> --%>
						</sec:authorize>
					</div>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Activity Log</a> <a
						class="dropdown-item" href="/member/info">My Page</a>
					<sec:authorize access="isAnonymous()">
						<a class="dropdown-item" href="/auth/login" data-toggle="modal"
							data-target="#headerModal">Login</a>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
						<a class="dropdown-item" href="/logout">Logout</a>
					</sec:authorize>
				</div></li>
			<li class="nav-item dropdown nav-cart"><a
				class="nav-link dropdown-toggle cart-toggle" id="userDropdown"
				href="#" role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"><i class="fas fa-shopping-cart"></i></a>
				<div class="dropdown-menu dropdown-menu-right"
					aria-labelledby="userDropdown">
					<div class="cart-list">
					</div>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="/member/cart">Cart Page</a> <a
						class="dropdown-item" href="/product/orderCart">Buy Now</a>
				</div></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-dark"
				id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading">Adminstrator</div>

						<a class="nav-link collapsed" href="#" data-toggle="collapse"
							data-target="#collapseAdminPdt" aria-expanded="false"
							aria-controls="collapseAdminPdt"><div
								class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> Product
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div></a>
						<div class="collapse" id="collapseAdminPdt"
							aria-labelledby="headingOne" data-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="/admin/pdtTable">Table</a> <a
									class="nav-link" href="/admin/pdtAdd">Addition</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-toggle="collapse"
							data-target="#collapseAdminFmt" aria-expanded="false"
							aria-controls="collapseAdminPdt"><div
								class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> Format
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div></a>
						<div class="collapse" id="collapseAdminFmt"
							aria-labelledby="headingOne" data-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="/pages/test"><div
										class="sb-nav-link-icon">
										<i class="fas fa-random"></i>
									</div> Test</a>
							</nav>
						</div>
						<div class="sb-sidenav-menu-heading">Core</div>
						<a class="nav-link collapsed" href="#" data-toggle="collapse"
							data-target="#collapseProducts" aria-expanded="false"
							aria-controls="collapseProducts"><div
								class="sb-nav-link-icon">
								<i class="fas fa-barcode"></i>
							</div> Product
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div></a>
						<div class="collapse" id="collapseProducts"
							aria-labelledby="headingOne" data-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link nav-product" href="/product" data-ctg="%">All</a>
								<a class="nav-link nav-product" href="#" data-ctg="Category 1">Category
									1</a> <a class="nav-link nav-product" href="#"
									data-ctg="Category 2">Category 2</a> <a
									class="nav-link nav-product" href="#" data-ctg="Category 3">Category
									3</a>
							</nav>
						</div>

						<div class="sb-sidenav-menu-heading">Basic Format</div>
						<a class="nav-link" href="/pages/index"><div
								class="sb-nav-link-icon">
								<i class="fas fa-tachometer-alt"></i>
							</div> Dashboard</a> <a class="nav-link collapsed" href="#"
							data-toggle="collapse" data-target="#collapseLayouts"
							aria-expanded="false" aria-controls="collapseLayouts"><div
								class="sb-nav-link-icon">
								<i class="fas fa-columns"></i>
							</div> Layouts
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div></a>
						<div class="collapse" id="collapseLayouts"
							aria-labelledby="headingOne" data-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav">
								<a class="nav-link" href="/pages/layout-static">Static
									Navigation</a><a class="nav-link" href="layout-sidenav-light">Light
									Sidenav</a>
							</nav>
						</div>
						<a class="nav-link collapsed" href="#" data-toggle="collapse"
							data-target="#collapsePages" aria-expanded="false"
							aria-controls="collapsePages"><div class="sb-nav-link-icon">
								<i class="fas fa-book-open"></i>
							</div> Pages
							<div class="sb-sidenav-collapse-arrow">
								<i class="fas fa-angle-down"></i>
							</div></a>
						<div class="collapse" id="collapsePages"
							aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
							<nav class="sb-sidenav-menu-nested nav accordion"
								id="sidenavAccordionPages">
								<a class="nav-link collapsed" href="#" data-toggle="collapse"
									data-target="#pagesCollapseAuth" aria-expanded="false"
									aria-controls="pagesCollapseAuth">Authentication
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseAuth"
									aria-labelledby="headingOne"
									data-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="/pages/login">Login</a><a
											class="nav-link" href="/pages/register">Register</a><a
											class="nav-link" href="/pages/password">Forgot Password</a>
									</nav>
								</div>
								<a class="nav-link collapsed" href="#" data-toggle="collapse"
									data-target="#pagesCollapseError" aria-expanded="false"
									aria-controls="pagesCollapseError">Error
									<div class="sb-sidenav-collapse-arrow">
										<i class="fas fa-angle-down"></i>
									</div>
								</a>
								<div class="collapse" id="pagesCollapseError"
									aria-labelledby="headingOne"
									data-parent="#sidenavAccordionPages">
									<nav class="sb-sidenav-menu-nested nav">
										<a class="nav-link" href="/pages/401">401 Page</a><a
											class="nav-link" href="/pages/404">404 Page</a><a
											class="nav-link" href="/pages/500">500 Page</a>
									</nav>
								</div>
							</nav>
						</div>
						<a class="nav-link" href="/pages/charts"><div
								class="sb-nav-link-icon">
								<i class="fas fa-chart-area"></i>
							</div> Charts</a><a class="nav-link" href="/pages/tables"><div
								class="sb-nav-link-icon">
								<i class="fas fa-table"></i>
							</div> Tables</a>
					</div>
				</div>
				<div class="sb-sidenav-footer">
					<div class="small">Reference:</div>
					Bootstrap v4.4, w3schools.com, fontawesome.com
				</div>
			</nav>
		</div>