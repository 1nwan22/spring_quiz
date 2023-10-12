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
	<div id="wrap" class="container bg-secondary">
		<div class="content1 d-flex bg-success">
			<nav class="col-3 bg-warning">
				<div class="logo"></div>
				<ul class="nav">
					<li class="nav-item"><a class="nav-link" href="/lesson05/quiz05/weather-history-view">날씨</a></li>
					<li class="nav-item"><a class="nav-link" href="/lesson05/quiz05/add-weather-history-view">날씨 입력</a></li>
					<li class="nav-item"><a class="nav-link" href="#">테마 날씨</a></li>
					<li class="nav-item"><a class="nav-link" href="#">관측 기후</a></li>
				</ul>
			</nav>
			<section class="contents col-9 bg-primary">
				<h1>날씨 입력</h1>
				<form method="post" action="/lesson05/quiz05/add-weather-history">
					<div class="form-group">
						<div class="d-flex justify-content-center align-items-center">
							<label for="date">날짜</label>
							<input type="text" id="date" name="date" class="form-control col-3">
							<label for="weather">날씨</label>
							<select id="weather" name="weather" class="form-control col-2">
								<option>맑음</option>
								<option>구름조금</option>
								<option>흐림</option>
								<option>비</option>
							</select>
							<label for="">미세먼지</label>
							<select id="microDust" name="microDust" class="form-control col-2">
								<option>좋음</option>
								<option>보통</option>
								<option>나쁨</option>
								<option>최악</option>
							</select>
						</div>
						<div class="d-flex justify-content-center align-items-center">
							<label for="temperatures">기온</label>
							<div class="input-group mb-3 col-3">
							  <input type="text" id="temperatures" name="temperatures" class="form-control">
							  <span class="input-group-text">°C</span>
							</div>
								<label for="precipitation">강수량</label>
							<div class="input-group mb-3 col-3">
							  <input type="text" id="precipitation" name="precipitation" class="form-control">
							  <span class="input-group-text">mm</span>
							</div>
								<label for="windSpeed">풍속</label>
							<div class="input-group mb-3 col-3">
							  <input type="text" id="windSpeed" name="windSpeed" class="form-control">
							  <span class="input-group-text">km/h</span>
							</div>
						</div>
						<div class="d-flex justify-content-end">
							<input type="submit" value="저장" class="btn btn-success">
						</div>
					</div>
				</form>
			</section>
		</div>
		<footer class="bg-danger">
			
		</footer>
	</div>
	<script>
		$('#date').datepicker();
	</script>
</body>
</html>