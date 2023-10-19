<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- AJAX를 사용하려면 반드시 jquery 원본 필요 -->
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js" integrity="sha256-xLD7nhI62fcsEZK2/v8LsBcb4lG7dgULkuXoXB/j91c=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

<link rel="stylesheet" type="text/css" href="/css/booking/styleBooking.css">
<title>통나무 펜션</title>
</head>
<body>
	<div id="wrap" class="container">
		<header class="d-flex justify-content-center align-items-center">
			<h1><a href="#" id="logo">통나무 팬션</a></h1>
		</header>
		<nav>
			<ul class="nav nav-fill w-100">
            	<li class="nav-item"><a class="nav-link text-white font-weight-bold" href="#">팬션소개</a></li>
          		<li class="nav-item"><a class="nav-link text-white font-weight-bold" href="#">객실보기</a></li>
                <li class="nav-item"><a class="nav-link text-white font-weight-bold" href="#">예약안내</a></li>
                <li class="nav-item"><a class="nav-link text-white font-weight-bold" href="#">커뮤니티</a></li>
            </ul>
		</nav>
		<section class="contents d-flex justify-content-center">
			<div id="addBooking" class="w-50">
				<h2 class="font-weight-bold text-center my-3">예약 하기</h2>
				<div>
					<div class="font-weight-bold my-2">이름</div>
					<input type="text" id="name" name="name" class="form-control">
				</div>
				<div>
					<div class="font-weight-bold  my-2">예약날짜</div>
					<input type="text" id="date" name="date" class="form-control">
				</div>
				<div>
					<div class="font-weight-bold  my-2">숙박일수</div>
					<input type="text" id="day" name="day" class="form-control">
				</div>
				<div>
					<div class="font-weight-bold  my-2">숙박인원</div>
					<input type="text" id="headcount" name="headcount" class="form-control">
				</div>
				<div>
					<div class="font-weight-bold  my-2">전화번호</div>
					<input type="text" id="phoneNumber" name="phoneNumber" class="form-control">
				</div>
				<button type="button" id="addBookingBtn" class="btn btn-warning form-control mt-3">예약하기</button>
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
		
		$('#date').datepicker({
			dateFormat: 'yy-mm-dd'
            , changeMonth:true
            , changeYear:true
            , minDate: '0'
            , monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
            , monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월']
            , dayNamesMin:['일', '월', '화', '수', '목', '금', '토']
            , showMonthAfterYear: true
            , yearSuffix: '년'
		});
		
		$("#addBookingBtn").on("click", function() {
			let name = $("#name").val().trim();
			let date = $("#date").val().trim();
			let day = $("#day").val().trim();
			let headcount = $("#headcount").val().trim();
			let phoneNumber = $("#phoneNumber").val().trim();
			if(!name) {
				alert("이름을 입력하세요");
				return;
			}
			if(!date) {
				alert("예약날짜를 입력하세요");
				return;
			}
			if(!day) {
				alert("숙박일수를 입력하세요");
				return;
			}
			if(!headcount) {
				alert("숙박인원을 입력하세요");
				return;
			}
			if(!phoneNumber) {
				alert("전화번호를 입력하세요");
				return;
			};
			
			$.ajax({
				type:"POST"
				, url:"/booking/add"
				, data:{
					"name":name
					, "date":date
					, "day":day
					, "headcount":headcount
					, "phoneNumber":phoneNumber}
				
				, success:function(data) {
					if (data.result == "success") {
						alert("성공");
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