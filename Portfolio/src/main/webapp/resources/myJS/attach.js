console.log("Register Module.....");

var regService = (function() {
	function linkConvert(link) {
		if (link.search("embed") > 0) {
			return;
		} else {
			if (link.search("www.youtube.com") > 0) {
				link = link.replace("www.youtube.com/",
						"www.youtube.com/embed/");
			} else if (link.search("youtu.be") > 0) {
				link = link.replace("youtu.be/", "www.youtube.com/embed/");
			}
		}
		return link;
	}
	;

	function checkExtension(fileName, fileSize) {
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)");
		var maxSize = 5242880;

		if (fileSize >= maxSize) {
			alert("파일 사이즈 초과");
			$(".show input").val(null);
			return false;
		}
		if (regex.test(fileName)) {
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			$(".show input").val(null);
			return false;
		}
		return true;
	}
	;

	return {
		linkConvert : linkConvert,
		checkExtension : checkExtension
	}
})();