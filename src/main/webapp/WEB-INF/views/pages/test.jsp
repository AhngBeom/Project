<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<div id="cartList"></div>
	<form role="form" action="/pages/postTest" method="post">
		<div class="border p-3">
			<div class="form-group">
				<input type="text" name="userId" value='member1'>
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">주문자명</label> <input
					type="text" class="form-control" name="orderer" value='회원1'>
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">주문자 연락처</label> <input
					type="text" class="form-control" name="ordererContact"
					value="01048428167">
			</div>
			<div class="form-group">
				<div class="form-check">
					<input class="form-check-input" type="checkbox" id="gridCheck">
					<label class="form-check-label" for="gridCheck">주문자와 동일</label>
				</div>
				<label for="exampleFormControlInput1">수신자명</label> <input
					type="text" class="form-control" name="receiver" value="회원2">
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">수신 주소</label> <input
					type="text" class="form-control" name="receiverAddress"
					value="경기도 고양시 일산서구">
			</div>
		</div>
<!-- 		<div> -->
<!-- 			<input type="text" name="pdtOnOrder[0].pno" value="29"> <input -->
<!-- 				type="text" name="pdtOnOrder[0].amount" value="3"> -->
<!-- 		</div> -->

<!-- 		<div> -->
<!-- 			<input type="text" name="pdtOnOrder[1].pno" value="29"> <input -->
<!-- 				type="text" name="pdtOnOrder[1].amount" value="3"> -->
<!-- 		</div> -->

<!-- 		<div> -->
<!-- 			<input type="text" name="pdtOnOrder[2].pno" value="29"> <input -->
<!-- 				type="text" name="pdtOnOrder[2].amount" value="3"> -->
<!-- 		</div> -->
		<input type="submit" value="Submit">
	</form>
	<script type="text/javascript">
				$(document).ready(function() {
					var form = $("form[role='form']");
					var cartList = $("#cartList");
					var str = "";
					(function() {
						$.getJSON("/cartListId.json",{userID:"member1"}, function(data) {
							console.log(data);
							$(data).each(function(i, arr){
								console.log(arr);
								str += "<div><input type 'hidden' name='pdtOnOrder[" + i + "].pno' value='"
								+ arr.pno + "'></div>";
								str += "<div><input type 'hidden' name='pdtOnOrder[" + i + "].amount' value='"
										+ 3 + "'></div>";
								console.log(str);
								});
							cartList.append(str);
							form.append(str);
						});
					})();
				});
	</script>
</body>
</html>