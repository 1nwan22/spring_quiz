<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js" integrity="sha256-xLD7nhI62fcsEZK2/v8LsBcb4lG7dgULkuXoXB/j91c=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

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
						<a class="nav-link menu-font" href="/weather/history-view">날씨</a>
					</li>
					<li class="nav-item">
						<a class="nav-link menu-font" href="/weather/add-history-view">날씨 입력</a>
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
				<h3 class="font-weight-bold">과거날씨</h3>
				<table class="table text-center">
					<thead>
						<tr>
							<th>날짜</th>
							<th>날씨</th>
							<th>기온</th>
							<th>강수량</th>
							<th>미세먼지</th>
							<th>풍속</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${weatherHistoryList}" var="weatherHistory">
						<tr>
							<td>
								<fmt:formatDate value="${weatherHistory.date}" pattern="yyyy년 M월 d일" />
							</td>
							<td>
								<c:choose>
									<c:when test="${weatherHistory.weather == '맑음'}">
										<img src="/img/sunny.jpg" value="sunnyImg">
									</c:when>
									<c:when test="${weatherHistory.weather == '구름조금'}">
										<img src="/img/partlyCloudy.jpg" value="partlyCloudyImg">
									</c:when>
									<c:when test="${weatherHistory.weather == '흐림'}">
										<img src="/img/cloudy.jpg" value="cloudyImg">
									</c:when>
									<c:when test="${weatherHistory.weather == '비'}">
										<img src="/img/rainy.jpg" value="rainyImg">
									</c:when>
								</c:choose>
							</td>
							<td>
								${weatherHistory.temperatures}°C
							</td>
							<td>
								${weatherHistory.precipitation}mm
							</td>
							<td>
								${weatherHistory.microDust}
							</td>
							<td>
								${weatherHistory.windSpeed}km/h
							</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
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
</body>
</html>