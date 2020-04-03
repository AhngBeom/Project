<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../includes/header.jsp"%>
<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
	font-family: Arial;
}

.header {
	text-align: center;
	padding: 32px;
}

.column img {
	margin: 8px;
	vertical-align: middle;
	width: 100%;
}
</style>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid">
			<h1 class="mt-4">Dashboard</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item active">Example</li>
			</ol>
			
			<div class="d-flex border">
				<div class="col-xl-3 col-md-6">
					<img src="/resources/assets/img/42-black-1_GEO_KR.jpg"
						style="width: 100%"> <img
						src="/resources/assets/img/iPhone_11bk.jpg" style="width: 100%">
					<img src="/resources/assets/img/cake.png" style="width: 100%">
					<img src="/resources/assets/img/circus.png" style="width: 100%">
					<img src="/resources/assets/img/cabin.png" style="width: 100%">
					<img src="/resources/assets/img/game.png" style="width: 100%">
					<img src="/resources/assets/img/safe.png" style="width: 100%">
				</div>
				<div class="col-xl-3 col-md-6">
					<img src="/resources/assets/img/submarine.png" style="width: 100%">
					<img src="/resources/assets/img/42-black-2_GEO_KR.jpg"
						style="width: 100%"> <img
						src="/resources/assets/img/42-black-1_GEO_KR.jpg"
						style="width: 100%"> <img
						src="/resources/assets/img/circus.png" style="width: 100%">
					<img src="/resources/assets/img/iPhone_11wh.jpg"
						style="width: 100%"> <img
						src="/resources/assets/img/circus.png" style="width: 100%">
				</div>
				<div class="col-xl-3 col-md-6">
					<img src="/resources/assets/img/iPhone_11bk.jpg"
						style="width: 100%"> <img
						src="/resources/assets/img/iPhone_11yw.jpg" style="width: 100%">
					<img src="/resources/assets/img/safe.png" style="width: 100%">
					<img src="/resources/assets/img/game.png" style="width: 100%">
					<img src="/resources/assets/img/game.png" style="width: 100%">
					<img src="/resources/assets/img/42-black-2_GEO_KR.jpg"
						style="width: 100%"> <img
						src="/resources/assets/img/iPhone_11wh.jpg" style="width: 100%">
				</div>
				<div class="col-xl-3 col-md-6">
					<img src="/resources/assets/img/42-black-1_GEO_KR.jpg"
						style="width: 100%"> <img
						src="/resources/assets/img/iPhone_11bk.jpg" style="width: 100%">
					<img src="/resources/assets/img/cake.png" style="width: 100%">
					<img src="/resources/assets/img/circus.png" style="width: 100%">
					<img src="/resources/assets/img/cabin.png" style="width: 100%">
					<img src="/resources/assets/img/game.png" style="width: 100%">
					<img src="/resources/assets/img/safe.png" style="width: 100%">
				</div>
			</div>


			<div class="row">
				<div class="col-xl-3 col-md-6">
					<div class="card bg-primary text-white mb-4">
						<div class="card-body">Primary Card</div>
						<div
							class="card-footer d-flex align-items-center justify-content-between">
							<a class="small text-white stretched-link" href="#">View
								Details</a>
							<div class="small text-white">
								<i class="fas fa-angle-right"></i>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6">
					<div class="card bg-warning text-white mb-4">
						<div class="card-body">Warning Card</div>
						<div
							class="card-footer d-flex align-items-center justify-content-between">
							<a class="small text-white stretched-link" href="#">View
								Details</a>
							<div class="small text-white">
								<i class="fas fa-angle-right"></i>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6">
					<div class="card bg-success text-white mb-4">
						<div class="card-body">Success Card</div>
						<div
							class="card-footer d-flex align-items-center justify-content-between">
							<a class="small text-white stretched-link" href="#">View
								Details</a>
							<div class="small text-white">
								<i class="fas fa-angle-right"></i>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-md-6">
					<div class="card bg-danger text-white mb-4">
						<div class="card-body">Danger Card</div>
						<div
							class="card-footer d-flex align-items-center justify-content-between">
							<a class="small text-white stretched-link" href="#">View
								Details</a>
							<div class="small text-white">
								<i class="fas fa-angle-right"></i>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="d-flex justify-content-start bg-secondary mb-3">
				<div class="p-2 bg-info">Flex item 1</div>
				<div class="p-2 bg-warning">Flex item 2</div>
				<div class="p-2 bg-primary">Flex item 3</div>
			</div>
			<div class="d-flex justify-content-end bg-secondary mb-3">
				<div class="p-2 bg-info">Flex item 1</div>
				<div class="p-2 bg-warning">Flex item 2</div>
				<div class="p-2 bg-primary">Flex item 3</div>
			</div>
			<div class="d-flex justify-content-center bg-secondary mb-3">
				<div class="p-2 bg-info">Flex item 1</div>
				<div class="p-2 bg-warning">Flex item 2</div>
				<div class="p-2 bg-primary">Flex item 3</div>
			</div>
			<div class="d-flex justify-content-between bg-secondary mb-3">
				<div class="p-2 bg-info">Flex item 1</div>
				<div class="p-2 bg-primary">Flex item 3</div>
			</div>
			<div class="d-flex justify-content-around bg-secondary mb-3">
				<div class="p-2 bg-info">Flex item 1</div>
				<div class="p-2 bg-warning">Flex item 2</div>
				<div class="p-2 bg-primary">Flex item 3</div>
			</div>

			<div class="mb-3 p-2 border">
				<h3 class="text-center">Development Progress</h3>
				<div class="progress mb-3" style="height: 50px;">
					<div class="progress-bar" role="progressbar" style="width: 70%;"
						aria-valuenow="70" aria-valuemin="0" aria-valuemax="100">70%</div>
				</div>

				<div class="progress mb-3" style="height: 50px;">
					<div class="progress-bar progress-bar-striped bg-info"
						role="progressbar" style="width: 70%" aria-valuenow="70"
						aria-valuemin="0" aria-valuemax="100">70%</div>
				</div>
			</div>
		</div>
	</main>

	<%@ include file="../includes/footer.jsp"%>