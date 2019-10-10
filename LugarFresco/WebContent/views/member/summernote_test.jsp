<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="/resources/summernote/dist/summernote.css" rel="stylesheet" type="text/css" /> 
<script src="/resources/summernote/dist/summernote.min.js" type="text/javascript"></script>
</head>
<body>

<textarea class="form-control" id="summernote" name="cafeInfo" rows="4" 
	                  		placeholder="카페의 상세정보를 입력해주세요"></textarea>


<%-- 썸머노트 --%>
	<script>
		$(document).ready(function() {
		  $('#summernote').summernote();
		});
	</script>
</body>
</html>