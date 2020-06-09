<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>Test</title>

</head>
<body>
	
		<c:out value="${pdt }"/>
	
	<%
		request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	//request.getSession().setAttribute("userName", name);

	session.setAttribute("pdt","sda");
	session.getAttribute("pdt");
	%>

	<script type="text/javascript">
		$(document).ready(function(){
// 			var pdt = "<c:out value='${pdt }'/>";
			sessionStorage.setItem("pdt", {userid : "user"});
		});
	</script>
</body>
</html>