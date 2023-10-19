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
		<section class="contents">
			<div class="reserve d-flex">
					<div class="reserve-real-time col-4 d-flex flex-column align-items-center justify-content-center">
	                    <div>
	                        <a id="reserveHref" href="https://booking.naver.com/" target="_blank">
	                            <h1 class="dsiplay-1">실시간</h1>
	                            <h1 class="dsiplay-1">예약 하기</h1>
	                        </a>
	                    </div>
	                </div>
	                <div class="reserve-check col-4">
	                    <div class="w-100 d-flex flex-column">
	                        <div class="d-flex align-items-center pt-3 pl-3">
	                            <h4 class="font-weight-bold">예약 확인</h4>
	                        </div>
	                        <div class="pb-1">
	                            <div class="d-flex align-items-center m-2">
	                                <span class="idPw col-3 p-0 mr-2">이름:</span>
	                                <input type="text" id="name" class="form-control p-0 col-8">
	                            </div>
	                            <div class="d-flex align-items-center m-2">
	                                <span class="idPw col-3 p-0 mr-2">전화번호:</span>
	                                <input type="text" id="phoneNumber" class="form-control p-0 col-8">
	                            </div>
	                        </div>
	                        <div class="d-flex justify-content-end align-items-center pr-3">
	                            <button type="button" id="checkInfo" class="btn btn-success">조회 하기</button>
	                        </div>
	                    </div>
	                </div>
	                <div class="reserve-inqury col-4 d-flex flex-column align-items-center justify-content-center">
	                    <div class="mr-2">
	                        <h4>예약문의:</h4>
	                        <h2>010-</h2>
	                        <h2>000-1111</h2>
	                    </div>
	                </div>
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

</body>
</html>