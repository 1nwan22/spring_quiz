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
		<div class="form-group">
			<label for="name">제목</label>
			<input type="text" id="name" name="name" class="form-control">
		</div>
		<div class="form-group">
			<label for="url">주소</label>
			<div class="input-group d-flex">
				<input type="text" id="url" name="url" class="form-control">
				<input type="button" id="urlCheckBtn" class="form-control btn btn-info col-1" value="중복확인">
			</div>
			<small id="urlStatusArea"></small>
		</div>
		<input type="button" id="addBtn" class="btn btn-success form-control" value="추가">
	</div>
</body>
<script>
	$(document).ready(function() {
		$("#urlCheckBtn").on("click", function() {
			$("#urlStatusArea").empty();
			let name = $("#name").val().trim();
			let url = $("#url").val().trim();
			
			$.ajax({
				type:"GET"
				, url:"/lesson06/quiz02/is-duplication"
				, data:{"name":name, "url":url}
				
				, success:function(data) {
					if (data.is_duplication) {
						$("#urlStatusArea").append('<span class="text-danger">중복된 url입니다</span>');
					} else {
						$("#urlStatusArea").append('<span class="text-danger">저장 가능한 url 입니다</span>');
					}
					
				}
				
				, error:function(request, status, error) {
					alert("실패");
					alert(request);
					alert(status);
					alert(error);
				}
			
			})
			
			
		});
		
		
		$("#addBtn").on("click", function() {
			let name = $("#name").val().trim();
			let url = $("#url").val().trim();
			
			console.log(name);
			console.log(url);
			
			if (!name) {
				alert("제목을 입력하세요")
				return;
			}
			if (!url) {
				alert("주소를 입력하세요")
				return;
			}
			if (!url.startsWith("http://") && !url.startsWith("https://")) {
				alert("주소 형식이 잘못 되었습니다.")
				return;
			}
			
			$.ajax({
				type:"POST"
				, url:"/lesson06/quiz01/add-bookmark"
				, data:{"name":name, "url":url}
			
				, success:function(data) { // data: response 응답값(JSON String) => Dictionary Object jquery의 AJAX 함수가 json형태이면 parsing해서 객체로 변환해줌
					// data는 JSON String => Object 변환된 형태로 사용할 수 있다
					// jquery의 ajax 함수 기능
					if (data.result == "success") {
						location.href="/lesson06/quiz01/bookmark-list-view";
					} 
				}
				, error:function(request, status, error) {
					alert("추가에 실패했습니다. 관리자에게 문의해주세요.");
					alert(request);
					alert(status);
					alert(error);
				}
			})
		})
		
	});
</script>
</html>