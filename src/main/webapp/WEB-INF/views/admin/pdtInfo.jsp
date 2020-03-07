<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>

<style>
* {
	box-sizing: border-box;
}

input[type=text], select, textarea {
	width: 100%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	resize: vertical;
}

label {
	padding: 12px 12px 12px 0;
	display: inline-block;
}

input[type=submit] {
	background-color: #4CAF50;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	float: right;
}

input[type=submit]:hover {
	background-color: #45a049;
}

.pdt-info {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
}

.col-25 {
	float: left;
	width: 25%;
	margin-top: 6px;
}

.col-75 {
	float: left;
	width: 75%;
	margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
	.col-25, .col-75, input[type=submit] {
		width: 100%;
		margin-top: 0;
	}
}

body {
	margin: 0;
	font-family: Arial;
}

/* The grid: Four equal columns that floats next to each other */
.column {
	float: left;
	width: 25%;
	padding: 10px;
}

/* Style the images inside the grid */
.column img {
	opacity: 0.8;
	cursor: pointer;
}

.column img:hover {
	opacity: 1;
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

/* The expanding image container */
.container {
	position: relative;
	display: none;
}

/* Expanding image text */
#imgtext {
	position: absolute;
	bottom: 15px;
	left: 15px;
	color: white;
	font-size: 20px;
}

/* Closable button inside the expanded image */
.closebtn {
	position: absolute;
	top: 10px;
	right: 15px;
	color: white;
	font-size: 35px;
	cursor: pointer;
}
</style>

<div id="layoutSidenav_content">
	<main>
		<div class="container-fluid">
			<h1 class="mt-4">Products Info</h1>
			<ol class="breadcrumb mb-4">
				<li class="breadcrumb-item"><a href="/product/all">Dashboard</a></li>
				<li class="breadcrumb-item active">Tables</li>
			</ol>
			<div class="pdt-info">
				<form action="/action_page.php">
					<div class="row">
						<div class="col-25">
							<label for="fname">Name</label>
						</div>
						<div class="col-75">
							<input type="text" id="fname" name="name"
								value="${pdt.name }">
								
						</div>
					</div>
					<div class="row">
						<div class="col-25">
							<label for="lname">Subtitle</label>
						</div>
						<div class="col-75">
							<input type="text" id="lname" name="Subtitle"
								placeholder="Product subtitle...">
						</div>
					</div>
					<div class="row">
						<div class="col-25">
							<label for="category">Category</label>
						</div>
						<div class="col-75">
							<select id="category" name="category">
								<option value="1">Category 1</option>
								<option value="2">Category 2</option>
								<option value="3">Category 3</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-25">
							<label for="lname">Price</label>
						</div>
						<div class="col-75">
							<input type="text" id="price" name="price"
								 value="${pdt.price }">
						</div>
					</div>
					<div class="row">
						<div class="col-25">
							<label for="descript">Description</label>
						</div>
						<div class="col-75">
							<textarea id="descript" name="descript"
								placeholder="Write description.." style="height: 200px"></textarea>
						</div>
					</div>
					<div class="row">
						<div class="column">
							<img src="https://www.w3schools.com/howto/img_nature.jpg"
								alt="Nature" style="width: 100%" onclick="myFunction(this);">
						</div>
						<div class="column">
							<img src="https://www.w3schools.com/howto/img_snow.jpg"
								alt="Snow" style="width: 100%" onclick="myFunction(this);">
						</div>
						<div class="column">
							<img src="https://www.w3schools.com/howto/img_mountains.jpg"
								alt="Mountains" style="width: 100%" onclick="myFunction(this);">
						</div>
						<div class="column">
							<img src="https://www.w3schools.com/howto/img_lights.jpg"
								alt="Lights" style="width: 100%" onclick="myFunction(this);">
						</div>
					</div>

					<div class="container">
						<span onclick="this.parentElement.style.display='none'"
							class="closebtn">&times;</span> <img id="expandedImg"
							style="width: 100%">
						<div id="imgtext"></div>
					</div>
					<div class="row d-flex justify-content-center m-3">
						<input type="submit" value="Submit / Modify">
					</div>
				</form>
			</div>
		</div>
	</main>
	<script>
		function myFunction(imgs) {
			var expandImg = document.getElementById("expandedImg");
			var imgText = document.getElementById("imgtext");
			expandImg.src = imgs.src;
			imgText.innerHTML = imgs.alt;
			expandImg.parentElement.style.display = "block";
		}
	</script>
	<%@ include file="../includes/footer.jsp"%>