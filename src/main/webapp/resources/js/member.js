$(document).ready(function() {
			$("#idCheck").on("click",function(e) {
				e.preventDefault();
				if($("input[name='userid']").val().length > 3){
					$.ajax({
						url : "/auth/idCheck",
						dataType : "JSON",
						data : {userid : $("input[name='userid']").val()},
						type : "POST",
						success : function(data) {
							if (data === 1) {
								$("#idCheck").attr("value", "Fail");
								alert("중복된 아이디입니다.");
							} else if (data === 0) {
								$("#idCheck").attr("value", "Success");
								$("#idCheck").attr("class", "col-md-2 btn btn-success");
								$("#idCheck").attr("disabled", "disabled");
								$("#idCheck").html("<i class='fas fa-check-circle'></i> 사용가능");
								alert("사용가능한 아이디입니다.");
							}
						}
					});
				}
				else{
					alert("아이디가 너무 짧습니다. 4자리 이상 입력해주세요.");
				}
				$("input[name='userid']").change(function() {
						$("#idCheck").attr("value", "Fail");
						$("#idCheck").attr("class", "col-md-2 btn btn-primary");
						$("#idCheck").html("중복체크");
						$("#idCheck").removeAttr("disabled");
					});
				});

				$("#createAccount").on("click", function(e){
					var form = $("form[role='form']");
					e.preventDefault();
					
					if($("input[name='userName']").val() === ""){
						alert("이름을 입력해주세요.");
						$("input[name='userName']").parent(".form-group").find("#nameCheckMsg").html("이름을 입력해주세요.");
						return;
					}
					if($("input[name='userid']").val() === ""){
						alert("아이디를 입력해주세요.");
						$("input[name='userid']").parents(".form-group").find("#idCheckMsg").html("아이디를 입력해주세요.");
						return;
					}
					if($("#idCheck").val() === "Fail"){
						if($("input[name='userid']").val().length < 4){
							alert("아이디가 너무 짧습니다. 4자리 이상 입력해주세요.");
						}else{
							alert("아이디 중복체크 해주세요.");
						}
						return;
					}
					if($("input[name='userpw']").val() === ""){
						alert("비밀번호를 입력해주세요.");
						$("input[name='userpw']").parent(".form-group").find("#pwCheckMsg").html("비밀번호를 한번 더 입력해주세요.");
						return;
					}
					if($("#confirmPw").val() === "" && $("input[name='userpw']").val() != ""){
						alert("비밀번호를 한번 더 입력해주세요.");
						$("#confirmPwMsg").html("비밀번호를 한번 더 입력해주세요.");
						return;
					}
					if($("#idCheck").val() === "Success"){
						form.submit();
						console.log("submit");
					}
				});
				$("#updateAccount").on("click", function(e){
					var form = $("form[role='form']");
					e.preventDefault();
					
					if($("input[name='userName']").val() === ""){
						alert("이름을 입력해주세요.");
						$("input[name='userName']").parent(".form-group").find("#nameCheckMsg").html("이름을 입력해주세요.");
						return;
					}
					if($("input[name='userpw']").val() === ""){
						alert("비밀번호를 입력해주세요.");
						$("input[name='userpw']").parent(".form-group").find("#pwCheckMsg").html("비밀번호를 한번 더 입력해주세요.");
						return;
					}
					if($("#confirmPw").val() === "" && $("input[name='userpw']").val() != ""){
						alert("비밀번호를 한번 더 입력해주세요.");
						$("#confirmPwMsg").html("비밀번호를 한번 더 입력해주세요.");
						return;
					}
					else{
						form.submit();
						console.log("submit");
					}
				});
				function perceiveTag(tag){
					if(tag.attr("name") === "userName"){
							if(tag.val() === ""){
								tag.parents(".form-group").find("svg").css("display", "none");
								tag.parents(".form-group")
								.append("<small class='text-danger' id='nameCheckMsg'>이름을 입력해주세요.</small>");
							}
							else{
								$("#nameCheckMsg").remove();
								tag.parents(".form-group").find("svg").css("display", "inline-block");
							}
					}
					if(tag.attr("name") === "userid"){
							if(!tag.val()){
								tag.parents(".form-group").find("svg").css("display", "none");
								tag.parents(".form-group")
								.find("#idCheckMsg").html("아이디를 입력해주세요");
							}
							else if(tag.val().length < 4){
								tag.parents(".form-group").find("svg").css("display", "none");
								tag.parents(".form-group")
								.find("#idCheckMsg").html("아이디가 너무 짧습니다. 4자리 이상 입력해주세요.");
							}
							else{
								tag.parents(".form-group").find("#idCheckMsg").html("");
								tag.parents(".form-group").find("svg").css("display", "inline-block");
							}
					}
					if(tag.attr("name") === "userpw"){
							if(!tag.val()){
								tag.parents(".form-group").find("svg").css("display", "none");
								tag.parents(".form-group")
								.find("#pwCheckMsg").html("비밀번호를 입력해주세요");
							}
							else if(tag.val().length < 4){
								tag.parents(".form-group").find("svg").css("display", "none");
								tag.parents(".form-group")
								.find("#pwCheckMsg").html("비밀번호가 너무 짧습니다. 6자리 이상 입력해주세요.");
							}
							else{
								$("#confirmPw").removeAttr("readonly");
								tag.parents(".form-group").find("small").html("");
								tag.parents(".form-group").find("svg").css("display", "inline-block");
								if($("#confirmPw").val() != tag.val() && $("#confirmPw").val().length > 0){
									$("#confirmPw").val("");
									$("#confirmPwMsg").attr("class", "text-danger");
									$("#confirmPwMsg").html("비밀번호가 일치하지 않습니다.");
									$("#confirmPwMsg").parents(".form-group").find("svg").css("display", "none");
								}
							}
					}
					if(tag.attr("id") === "confirmPw"){
							if ($("input[name='userpw']").val() === tag.val()) {
								console.log($("input[name='userpw']").val()
												+ " vs "+ tag.val());
								$("#confirmPwMsg").attr("class", "text-success");
								$("#confirmPwMsg").html("비밀번호가 일치합니다.");
								tag.parents(".form-group").find("svg").css("display", "inline-block");
							} 
							else if($("input[name='userpw']").val() === ""){
								$("input[name='userpw']").parents(".form-group").find("svg").css("display", "none");
								$("input[name='userpw']").parents(".form-group").find("#pwCheckMsg").html("비밀번호를 입력해주세요.");
							} 
							else {
								console.log($("input[name='userpw']").val()
												+ " vs " + tag.val());
								tag.val("");
								$("#confirmPwMsg").attr("class", "text-danger");
								tag.parents(".form-group").find("#confirmPwMsg").html("비밀번호가 일치하지 않습니다.");
								tag.parents(".form-group").find("svg").css("display", "none");
							}
					}
				}

				$("input").change(function(e){
					perceiveTag($(this));
				});
				
			});