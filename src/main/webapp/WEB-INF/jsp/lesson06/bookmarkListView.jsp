<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <!-- AJAX를 사용하려면 반드시 jquery 원본 필요 -->
  <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<title>즐겨찾기 목록</title>
</head>
<body>
	<div class="container"> 
		<h1>즐겨찾기 목록</h1>
		<table class="table text-center">
			<thead>
				<tr>
					<th>NO.</th>
					<th>이름</th>
					<th>주소</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${bookmarkList}" var="bookmark">
				<tr>
					<td class="bookmark-id">${bookmark.id}</td>
					<td>${bookmark.name}</td>
					<td><a href="${bookmark.url}" target="_blank">${bookmark.url}</a></td>
					<td><input type="button" class="del-btn btn btn-danger btn-sm" value="삭제"></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
<script>
	$(document).ready(function() {
		$(".del-btn").on("click", function() {
			let targetId = $(this).parent().siblings(".bookmark-id").text();
			
			$.ajax({
				type:"POST"
				, url:"/lesson06/quiz02/del-bookmark"
				, data: {"id":targetId}
			
				, success:function(data) {
					if (data.result == "success") {
						location.href="/lesson06/quiz01/bookmark-list-view";
					}
				}
				
				, error:function(request, status, error) {
					alert("실패");
				}
			})
		});
		
	});
</script>
</body>
</html>