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
					<!-- 1) value 속성을 이용해서 값 세팅 -->
					<%-- <td><button type="button" class="del-btn btn btn-danger btn-sm" value="${bookmark.id}">삭제</button></td> --%>
					<!-- 2) data 이용해서 태그에 값 세팅: 대문자 X -->
					<td><button type="button" class="del-btn btn btn-danger btn-sm" data-bookmark-id="${bookmark.id}" data-url="">삭제</button></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
<script>
	$(document).ready(function() {
		$(".del-btn").on("click", function(e) {
			// let targetId = $(this).parent().siblings(".bookmark-id").text();
			
			//---- value
			// 1)
			//let id = $(this).val();
		
			// 2)
			//let id = e.target.value;
			
			//---- data
			// data-bookmark-id  => data("bookmark-id") 함수 사용
			let id = $(this).data("bookmark-id");
			
			
			$.ajax({
				type:"DELETE"
				, url:"/lesson06/quiz02/delete-bookmark"
				, data: {"id":id}
			
				, success:function(data) {
					if (data.result == "success") {
						location.reload(true); // 새로고침 기본값 true인데 안되면 true 넣어 볼 것
					} else {
						alert("다시 시도해주세요");
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