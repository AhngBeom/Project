<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp"%>

<h1 class="mb-3">Introduction</h1>

<div class="card border-warning shadow-lg mb-3">
	<img src="/resources/img/profile.jpg" class="rounded mx-auto d-block"
		width="400px" alt="...">
	<div class="card-body p-5 bg-dark">
		<div class="row">
			<div class="col-4">
				<div class="list-group" id="list-tab" role="tablist">
					<a class="list-group-item list-group-item-action list-group-item-warning h5 active"
						id="list-profile-list" data-toggle="list" href="#list-profile"
						role="tab" aria-controls="profile">Profile</a> <a
						class="list-group-item list-group-item-action list-group-item-warning h5"
						id="list-contact-list" data-toggle="list" href="#list-contact"
						role="tab" aria-controls="contact">Contact</a> <a
						class="list-group-item list-group-item-action list-group-item-warning h5"
						id="list-email-list" data-toggle="list" href="#list-email"
						role="tab" aria-controls="email">E-mail</a>
				</div>
			</div>
			<div class="col-8">
				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active" id="list-profile"
						role="tabpanel" aria-labelledby="list-profile-list">
						<h5 class="card-title text-white">Name : BeomJun Ahn</h5>
						<h5 class="card-title text-white">National : South Korea</h5>
						<h5 class="card-title text-white">Birth : 1997 / 07 / 04</h5>

						<p class="card-text text-white">Web Developer / Java Program
							Developer / Android App Developer</p>
					</div>
					<div class="tab-pane fade card-title text-white h5"
						id="list-contact" role="tabpanel"
						aria-labelledby="list-contact-list">010 - 4842 - 8167</div>
					<div class="tab-pane fade card-title text-white h5" id="list-email"
						role="tabpanel" aria-labelledby="list-email-list">bbu0704@gmail.com</div>
				</div>
			</div>
		</div>
		<p class="card-text mt-5">
			<small class="text-muted">Last updated 3 mins ago</small>
		</p>
	</div>
</div>

<script>
	
</script>

<%@ include file="includes/footer.jsp"%>