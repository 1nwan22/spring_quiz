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
<link rel="stylesheet" type="text/css" href="/css/booking/styleBooking.css">
<title>예약 목록</title>
</head>
<body>
	<div id="wrap" class="container">
		<header class="d-flex justify-content-center align-items-center">
			<h1><a href="/booking/check-view" id="logo">통나무 팬션</a></h1>
		</header>
		<nav>
			<ul class="nav nav-fill w-100">
            	<li class="nav-item"><a class="nav-link text-white font-weight-bold" href="#">팬션소개</a></li>
          		<li class="nav-item"><a class="nav-link text-white font-weight-bold" href="#">객실보기</a></li>
                <li class="nav-item"><a class="nav-link text-white font-weight-bold" href="/booking/add-view">예약하기</a></li>
                <li class="nav-item"><a class="nav-link text-white font-weight-bold" href="/booking/list-view">예약목록</a></li>
            </ul>
		</nav>
		<section class="contents">
			<div id="bookingList" class="pt-3">
				<h2 class="text-center mb-3">예약 목록 보기</h2>
				<table class="table text-center">
					<thead>
						<tr>
							<th>이름</th>
							<th>예약날짜</th>
							<th>숙박일수</th>
							<th>숙박인원</th>
							<th>전화번호</th>
							<th>예약상태</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${bookingList}" var="booking">
						<tr>
							<td>${booking.name}</td>
							<td>
								<fmt:formatDate value="${booking.date}" pattern="yyyy년 M월 d일" />
							</td>
							<td>${booking.day}</td>
							<td>${booking.headcount}</td>
							<td>${booking.phoneNumber}</td>
							<td>
								<c:choose>
									<c:when test="${booking.state == '대기중'}">
										<span class="text-info">${booking.state}</span>
									</c:when>
									<c:when test="${booking.state == '확정'}">
										<span class="text-success">${booking.state}</span>
									</c:when>
								</c:choose>
								
							</td>
							<td><button type="button" class="del-btn btn btn-danger btn-sm" data-booking-id="${booking.id}">삭제</button></td>
						</tr>
					</tbody>
					</c:forEach>
				</table>
			</div>
		</section>
		<footer class="d-flex align-items-center">
			 <div class="ml-3">
                    <div class="copyright">제주특별자치도 제주시 예월읍</div>
                    <div class="copyright">사업자등록번호: 111-22-255222 / 농어촌민박사업자지정 / 대표: 김동욱</div>
                    <div class="copyright">Copyright 2025 tongnamu All right reserved</div>
                </div>
		</footer>
	</div>
<script>
	$(document).ready(function() {
		
		$(".del-btn").on("click", function() {
			let id = $(this).data("booking-id");
			
			$.ajax({
				type:"DELETE"
				, url:"/booking/delete-booking"
				, data:{"id":id}
			
				, success:function(data) {
					if (data.result == "success") {
						location.reload();
					} else {
						alert("실패");
					}
				}
				, error:function(request, status, error) {
					alert("에러");
				}
			})
		});
		
		
	
	});
</script>
</body>
</html>