$(document).ready(function() {
		(function() {
			$(".card-image").each(
				function(i, titleImg) {
					var pno = $(this).data("pno");
					var index = $(this).data("index");
					$.getJSON("/product/getAttachList",
							{
								pno : pno
							},
							function(arr) {
								if (arr.length > 0) {
									console.log(arr);
									var imagePath = encodeURIComponent(arr[0].uploadPath
											+ "/"
											+ arr[0].uuid
											+ "_"
											+ arr[0].fileName);
									$(".card-image[data-pno='" + pno + "']").attr("src", "/display?fileName=" + imagePath);
							}
					});
			});
	})();
});

