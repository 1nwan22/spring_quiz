<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <!-- AJAX를 사용하려면 반드시 jquery 원본 필요 -->
  <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<title>즐겨찾기 추가하기</title>
</head>
<body>
	<div class="container">
		<h1>즐겨찾기 추가하기</h1>
		<label for="name">제목</label>
		<input type="text" id="name" name="name" class="form-control">
		<label for="url">주소</label>
		<input type="text" id="url" name="url" class="form-control">
		<input type="button" id="addBtn" class="btn btn-success form-control" value="추가">
	</div>
</body>
<script>
	$(document).ready(function() {
		$("#addBtn").on("click", function() {
			let name = $("#name").val().trim();
			let url = $("#url").val().trim();
			
			if (!name) {
				alert("제목을 입력하세요")
				return;
			}
			if (!url) {
				alert("주소를 입력하세요")
				return;
			}
			if (!url.startsWith("http")) {
				alert("http 또는 https를 포함한 url을 다시 입력하세요")
				return;
			}
			
			$.ajax({
				type:"POST"
				, url:"/lesson06/quiz01/add-bookmark"
				, data:{"name":name, "url":url}
			
				, success:function(data) {
					//alert("data");
					if (data == "성공") {
						location.href="/lesson06/quiz01/bookmark-list-view";
					}
				}
				, error:function(request, status, error) {
					alert(request);
					alert(status);
					alert(error);
				}
			})
		})
		
	});
</script>
</html>