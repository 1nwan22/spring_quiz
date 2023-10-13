<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" type="text/css" href="/css/weather_history/weather_history.css">
<title>날씨 정보</title>
</head>
<body>
	<div id="wrap" class="container">
		<div class="contents d-flex">
			<nav class="col-2 flex-column">
				<div class="logo d-flex justify-content-center mt-3">
					<img src="/img/koreanGov.png"	width="25">
					<span class="text-white font-weight-bold ml-2">기상청</span>
				</div>
				<ul class="nav">
					<li class="nav-item">
						<a class="nav-link menu-font" href="/lesson05/quiz05/weather-history-view">날씨</a>
					</li>
					<li class="nav-item">
						<a class="nav-link menu-font" href="/lesson05/quiz05/add-weather-history-view">날씨 입력</a>
					</li>
					<li class="nav-item">
						<a class="nav-link menu-font" href="#">테마 날씨</a>
					</li>
					<li class="nav-item">
						<a class="nav-link menu-font" href="#">관측 기후</a>
					</li>
				</ul>
			</nav>
			<section class="col-10  mt-3 ml-5">
				<h3 class="font-weight-bold">날씨 입력</h3>
				<form method="post" action="/lesson05/quiz05/add-weather-history">
					<div class="form-group pl-5 pt-4">
						<div class="d-flex justify-content-between align-items-center">
							<div class="col-6 d-flex align-items-center m-2">
								<label for="date" class="font-weight-bold">날짜</label>
								<input type="text" id="date" name="date" class="form-control w-75 ml-2">
							</div>
							<div class="col-3 d-flex align-items-center m-2">
								<label for="weather" class="font-weight-bold">날씨</label>
								<select id="weather" name="weather" class="form-control w-75 ml-2">
									<option>맑음</option>
									<option>구름조금</option>
									<option>흐림</option>
									<option>비</option>
								</select>
							</div>
							<div class="col-3 d-flex align-items-center m-2 pr-4">
								<label for="microDust" class="font-weight-bold">미세먼지</label>
								<select id="microDust" name="microDust" class="form-control w-50 ml-2">
									<option>좋음</option>
									<option>보통</option>
									<option>나쁨</option>
									<option>최악</option>
								</select>
							</div>
						</div>
						<div class="d-flex justify-content-between align-items-center mt-3 mb-2">
							<div class="col-4 d-flex align-items-center m-2">
								<label for="temperatures" class="font-weight-bold">기온</label>
								<div class="input-group w-75 ml-2">
								  <input type="text" id="temperatures" name="temperatures" class="form-control">
								  <span class="input-group-text">°C</span>
								</div>
							</div>
							<div class="col-4 d-flex align-items-center m-2">
								<label for="precipitation" class="font-weight-bold">강수량</label>
								<div class="input-group w-75 ml-2">
								  <input type="text" id="precipitation" name="precipitation" class="form-control">
								  <span class="input-group-text">mm</span>
								</div>
							</div>
							<div class="col-4 d-flex align-items-center m-2">
								<label for="windSpeed" class="font-weight-bold">풍속</label>
								<div class="input-group w-75 ml-2">
								  <input type="text" id="windSpeed" name="windSpeed" class="form-control">
								  <span class="input-group-text">km/h</span>
								</div>
							</div>
						</div>
						<div class="d-flex justify-content-end">
							<input type="submit" value="저장" class="btn btn-success">
						</div>
					</div>
				</form>
			</section>
		</div>
		<footer class="d-flex align-items-center">
				<div class="footer-logo ml-4">
				<img class="foot-logo-image"
					src="https://www.weather.go.kr/w/resources/image/foot_logo.png"
					width="120">
			</div>
			<div class="copyright ml-4">
				<small class="text-secondary"> 
					(07062) 서울시 동작구 여의대방로16길 61 <br>
					Copyright@2023 KMA. All Rights RESERVED.
				</small>
			</div>
		</footer>
	</div>
	<script>
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
	</script>
</body>
</html>